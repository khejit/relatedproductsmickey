<?php

if (!defined('_PS_VERSION_'))
    exit;

class RelatedProductsMickey extends Module
{
    public function __construct()
    {
        $this->name = 'relatedproductsmickey';
        $this->tab = 'advertising_marketing';
        $this->version = '1.0.0';
        $this->author = 'khejit';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array(
            'min' => '1.6',
            'max' => _PS_VERSION_
        );
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Related Products Mickey');
        $this->description = $this->l('Adds extra field on products page with products from selected category');

        $this->confirmUninstall = $this->l('Are you sure? We have cookies :F');

    }

    public function install()
    {
        if (!parent::install() or
            // !$this->registerHook('productFooter') or
            !$this->registerHook('displayBackOfficeCategory') or
            !$this->registerHook('actionCategoryUpdate') or
            !$this->registerHook('productFooter') or
            !$this->registerHook('header'))
            return false;
        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall())
            return false;
        return true;
    }

    public function hookActionCategoryUpdate($params)
    {
        if (Tools::isSubmit('related_mickey'))
        {
            Configuration::updateValue('related_mickey'.'_'.Tools::getValue('id_category'), Tools::getValue('related_mickey'));
        }
    }

   public function hookDisplayBackOfficeCategory($params)
    {
        $this->context->smarty->assign('related_mickey', Configuration::get('related_mickey_'.Tools::getValue('id_category')));
        return $this->display(__FILE__, 'admin.tpl');
    }

    public function hookProductFooter($params)
    {
        $product = $params['product'];

        $id_category_default = $product->getDefaultCategory();

        $category = new Category(Configuration::get('related_mickey_'.$id_category_default));
        $blocks_products2 = $category->getProducts($this->context->cookie->id_lang, 0, 16);
        $this->context->smarty->assign(array(
            'blocks_products2' => $blocks_products2,
            'add_prod_display' => Configuration::get('PS_ATTRIBUTE_CATEGORY_DISPLAY'),
            'homeSize' => Image::getSize(ImageType::getFormatedName('home'))
        ));
        return $this->display(__file__, 'front.tpl');
    }

    public function hookHeader($params)
    {
        //$this->context->controller->addCSS(($this->_path) . 'css/owl.carousel.css');
        //$this->context->controller->addCSS(($this->_path) . 'css/owl.theme.css');
        $this->context->controller->addCSS(($this->_path) . 'css/mickeyrelated.css');
        $this->context->controller->addJS(($this->_path).'js/related_mickey.js');
    }

}