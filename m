Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BB22AB00B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 04:43:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTxfG5KmPzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 14:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synaptics.com (client-ip=40.107.94.89;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=jisheng.zhang@synaptics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=synaptics.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Synaptics.onmicrosoft.com
 header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Synaptics-onmicrosoft-com header.b=lt8gfcwN; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTwYP52XyzDqhb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 13:53:42 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP1PwRnac0dQ+N7G3GRyaoRVi1QUYOg+GxLfNjEcE2B26J+iWzxGC56gvhWP8QpspOhNVaKwajjjJvoUkGR0hlkqtJybPB7DGPURmjK8tJp0DBV6kzQwyW6SdmVPMYLjIBqfypbxbfmCeUb6Ov+Q0OlM6xz+zeOUQ9ZVOKYObMqUdRwTlceFJS2V1Loh8sqA8AmiOZ0cj2dXWzyR+h1Cux+c9IAbFTW7dmN2ucSguP0ej/10iB1rpY/nfbG95OqMyt+y/yUd3vnSuHRkd6oS8NCdEORX+AWERgaJLXYq/Igkxk1hp8qopNWqJXikDVOeK/c3NGeVvyoiy+bjk69ihA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efj8v9wZlJuoNzLSxa2/ToeNbeRBOJaawGMhjYYQwAE=;
 b=n/yY7H+tQRGVSOrOxQG4dHvQvCHagfexT07PL+uh35hwqk4Wgnm0jMaRBYIsx+KhMR/ke1SZ5oSMIhiH8yJzjNPAC82nzwFlVXWcx6JHoTFXPl4jwtAlZUtE7T+KaoXBLy6JRezr40b2vrHDSvqSNwOboMmituO9DxX+34NK/Vwm2Z2urNmInJEBnOEIh0dE9GW+9EEtr4Iu2YcZvFI/lGftZkvtqN65KxAW2h74mMlpxKhn81bUVsRwjE3qu6QQseNxHpCXMHXiGWKTGxuzZTQ4JW9sIIYIebuXuAS0045o7VOIiLkv6TFWRShjiMLOs6gy425HSYWWqrdgoHTYUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Efj8v9wZlJuoNzLSxa2/ToeNbeRBOJaawGMhjYYQwAE=;
 b=lt8gfcwN0U+s1PPrTPFOM+RfCKX9a/Qwq18KnyjPVmpxTwhCJ80rwMls+ZjT+ndYkr/mBNRt/8s2GsgCzDDie7FVRWixOVW/qymptg2DLwVs064KBAgbhudXXaX4JYkS7mVqU2wA/bVIqtcfDMSVu8mrJowsyzb7cwdh2RyIxMk=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=synaptics.com;
Received: from SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
 by SN6PR03MB4272.namprd03.prod.outlook.com (2603:10b6:805:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 02:53:35 +0000
Received: from SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22]) by SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22%6]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 02:53:35 +0000
Date: Mon, 9 Nov 2020 10:53:25 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/16] PCI: dwc: Rework MSI initialization
Message-ID: <20201109105325.68a22696@xhacker.debian>
In-Reply-To: <20201105211159.1814485-10-robh@kernel.org>
References: <20201105211159.1814485-1-robh@kernel.org>
 <20201105211159.1814485-10-robh@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BY5PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::15) To SN2PR03MB2383.namprd03.prod.outlook.com
 (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 BY5PR03CA0005.namprd03.prod.outlook.com (2603:10b6:a03:1e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Mon, 9 Nov 2020 02:53:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2b0e96d-9520-428a-c2e0-08d8845aa690
X-MS-TrafficTypeDiagnostic: SN6PR03MB4272:
X-Microsoft-Antispam-PRVS: <SN6PR03MB4272F0D9392629436E6D1471EDEA0@SN6PR03MB4272.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b9FE9xGupzH4mfRpNwh2iUD9RblgvGbhEgWqKExFl0KizsZH55xRq5H0NB9au51f3kWWLrgJ0zvQ9bWddVrDc9xWWr02RTW2HWM0pSOiHMPfqn8Gv6CC7SaPUOK6czk+H4TPmo5CpSKIFRtmSD1KGJaK0XZEUgHVzvPdR9QmSOQzOxBIXvGaGXrxGCrl/MCsKKgB1HWYvssotYOMJNu4R3qECs5XAi0W/P4fnKdg8yrhGys1l4hhdYgI//aE+9khYsedU7D6aENji02/cvUHBGdfCjId7Cs8+e91Wfy59+e0WnbHEH2P+Z6WE5Ek6qIrPtnT3YC9hw5S3hCMLYwUkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN2PR03MB2383.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(346002)(366004)(136003)(956004)(7416002)(1076003)(6506007)(26005)(186003)(16526019)(7696005)(52116002)(6666004)(66946007)(5660300002)(66556008)(66476007)(8936002)(9686003)(2906002)(55016002)(4326008)(8676002)(83380400001)(6916009)(54906003)(316002)(86362001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: uOXD8V7bapcLolQOTRbK5Yp7O3GKI/HLlJckVQa1Y3rRkot6OQ9/BlAkItHL5EwbKzyuODQw+CAwoY0+dEJ4oWTWwwkjzMRF3xSPPwKDq+HFxKYfolpXDl7PVzqkXBebRXd7z9DB8+RESlhzwcQgSvNeQkmN1UQbApoLaN60zqM5fg4Tt0krV14Kmim5BPLcY56NxQAJTxn0kkyO22eQzl5IdfhUBYl+Pg6VQoidsiwRBjqX2FLC30qt/UaX+VaDuIxXs/yU7qV70l9sa5FPwPK6r/XIFdtcC9x9xdXNZxUVeBEzKnNNkrtWji6JwDsVhG1cmcdH91fqXGoVO9XlI9ft7yBRBQoyOYse9IKpSg2EGlx5ciV/oWHZyG0ba43yE14BOxrZHNFjaMn2bMlCUGBkhs+RT6RAO1EIKYn0o2Gn77RgkwIHsyC3iGb8iVA1GedMU3Vp6I/6BninkvQf+FVCmlAJhYGJ4QQygGLlP49ZzOKzpvsRTERRw4OZ2w0c9SlU/Igs3jplovMkjRzJNFfATxcAUDSPlTP3CsBDHhYbUDGgSJzjEnbNgVPw0pPPBJogFD6z//3cX2ZmnoA4G5p1mJmp0r3+9TAi9FUK8MFYIraiFa5fpmd/udLi/PJqIxVG+gHNCs06HXcYIRsdcQ==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b0e96d-9520-428a-c2e0-08d8845aa690
X-MS-Exchange-CrossTenant-AuthSource: SN2PR03MB2383.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 02:53:35.1972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8eeCUY1+Gp2n514KMi5DDj7t46l1mY+9rEe/nRhjxK8YNdyrAQpNXtxaPuaaOlmJ28xMSrZ6lWZI8I5FcncdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4272
X-Mailman-Approved-At: Mon, 09 Nov 2020 14:41:26 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-pci@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Murali Karicheri <m-karicheri2@ti.com>, linux-arm-kernel@lists.infradead.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu,  5 Nov 2020 15:11:52 -0600
Rob Herring <robh@kernel.org> wrote:

> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> There are 3 possible MSI implementations for the DWC host. The first is
> using the built-in DWC MSI controller. The 2nd is a custom MSI
> controller as part of the PCI host (keystone only). The 3rd is an
> external MSI controller (typically GICv3 ITS). Currently, the last 2
> are distinguished with a .msi_host_init() hook with the 3rd option using
> an empty function. However we can detect the 3rd case with the presence
> of 'msi-parent' or 'msi-map' properties, so let's do that instead and
> remove the empty functions.
> 
> Cc: Murali Karicheri <m-karicheri2@ti.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Minghuan Lian <minghuan.Lian@nxp.com>
> Cc: Mingkai Hu <mingkai.hu@nxp.com>
> Cc: Roy Zang <roy.zang@nxp.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Jingoo Han <jingoohan1@gmail.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c     |  9 -------
>  drivers/pci/controller/dwc/pci-layerscape.c   | 25 -------------------
>  .../pci/controller/dwc/pcie-designware-host.c | 20 +++++++++------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 +
>  drivers/pci/controller/dwc/pcie-intel-gw.c    |  9 -------
>  5 files changed, 13 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 9cf14f13798b..784385ae6074 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -272,14 +272,6 @@ static void ks_pcie_handle_legacy_irq(struct keystone_pcie *ks_pcie,
>         ks_pcie_app_writel(ks_pcie, IRQ_EOI, offset);
>  }
> 
> -/*
> - * Dummy function so that DW core doesn't configure MSI
> - */
> -static int ks_pcie_am654_msi_host_init(struct pcie_port *pp)
> -{
> -       return 0;
> -}
> -
>  static void ks_pcie_enable_error_irq(struct keystone_pcie *ks_pcie)
>  {
>         ks_pcie_app_writel(ks_pcie, ERR_IRQ_ENABLE_SET, ERR_IRQ_ALL);
> @@ -854,7 +846,6 @@ static const struct dw_pcie_host_ops ks_pcie_host_ops = {
> 
>  static const struct dw_pcie_host_ops ks_pcie_am654_host_ops = {
>         .host_init = ks_pcie_host_init,
> -       .msi_host_init = ks_pcie_am654_msi_host_init,
>  };
> 
>  static irqreturn_t ks_pcie_err_irq_handler(int irq, void *priv)
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 53e56d54c482..0d84986c4c16 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -168,37 +168,12 @@ static int ls1021_pcie_host_init(struct pcie_port *pp)
>         return ls_pcie_host_init(pp);
>  }
> 
> -static int ls_pcie_msi_host_init(struct pcie_port *pp)
> -{
> -       struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> -       struct device *dev = pci->dev;
> -       struct device_node *np = dev->of_node;
> -       struct device_node *msi_node;
> -
> -       /*
> -        * The MSI domain is set by the generic of_msi_configure().  This
> -        * .msi_host_init() function keeps us from doing the default MSI
> -        * domain setup in dw_pcie_host_init() and also enforces the
> -        * requirement that "msi-parent" exists.
> -        */
> -       msi_node = of_parse_phandle(np, "msi-parent", 0);
> -       if (!msi_node) {
> -               dev_err(dev, "failed to find msi-parent\n");
> -               return -EINVAL;
> -       }
> -
> -       of_node_put(msi_node);
> -       return 0;
> -}
> -
>  static const struct dw_pcie_host_ops ls1021_pcie_host_ops = {
>         .host_init = ls1021_pcie_host_init,
> -       .msi_host_init = ls_pcie_msi_host_init,
>  };
> 
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>         .host_init = ls_pcie_host_init,
> -       .msi_host_init = ls_pcie_msi_host_init,
>  };
> 
>  static const struct dw_pcie_ops dw_ls1021_pcie_ops = {
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 95deef0eaadf..9b952639d020 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -365,6 +365,10 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                 pci->link_gen = of_pci_get_max_link_speed(np);
> 
>         if (pci_msi_enabled()) {
> +               pp->has_msi_ctrl = !(pp->ops->msi_host_init ||
> +                                    of_property_read_bool(np, "msi-parent") ||
> +                                    of_property_read_bool(np, "msi-map"));
> +
>                 if (!pp->num_vectors) {
>                         pp->num_vectors = MSI_DEF_NUM_VECTORS;
>                 } else if (pp->num_vectors > MAX_MSI_IRQS) {
> @@ -372,7 +376,11 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                         return -EINVAL;
>                 }
> 
> -               if (!pp->ops->msi_host_init) {
> +               if (pp->ops->msi_host_init) {
> +                       ret = pp->ops->msi_host_init(pp);
> +                       if (ret < 0)
> +                               return ret;
> +               } else if (pp->has_msi_ctrl) {
>                         if (!pp->msi_irq) {
>                                 pp->msi_irq = platform_get_irq_byname_optional(pdev, "msi");
>                                 if (pp->msi_irq < 0) {
> @@ -402,10 +410,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                                 pp->msi_data = 0;
>                                 goto err_free_msi;
>                         }
> -               } else {
> -                       ret = pp->ops->msi_host_init(pp);
> -                       if (ret < 0)
> -                               return ret;
>                 }
>         }
> 
> @@ -426,7 +430,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>                 return 0;
> 
>  err_free_msi:
> -       if (pci_msi_enabled() && !pp->ops->msi_host_init)
> +       if (pp->has_msi_ctrl)
>                 dw_pcie_free_msi(pp);
>         return ret;
>  }
> @@ -436,7 +440,7 @@ void dw_pcie_host_deinit(struct pcie_port *pp)
>  {
>         pci_stop_root_bus(pp->bridge->bus);
>         pci_remove_root_bus(pp->bridge->bus);
> -       if (pci_msi_enabled() && !pp->ops->msi_host_init)
> +       if (pp->has_msi_ctrl)
>                 dw_pcie_free_msi(pp);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_host_deinit);
> @@ -544,7 +548,7 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> 
>         dw_pcie_setup(pci);
> 
> -       if (pci_msi_enabled() && !pp->ops->msi_host_init) {
> +       if (pp->has_msi_ctrl) {
>                 num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
> 
>                 /* Initialize IRQ Status array */
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 96382dcb2859..5d374bab10d1 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -175,6 +175,7 @@ struct dw_pcie_host_ops {
>  };
> 
>  struct pcie_port {
> +       bool                    has_msi_ctrl:1;

Can we relocate has_msi_ctrl? e.g put it at the end of the pcie_port structure.

Thanks

>         u64                     cfg0_base;
>         void __iomem            *va_cfg0_base;
>         u32                     cfg0_size;
> diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
> index c562eb7454b1..292b9de86532 100644
> --- a/drivers/pci/controller/dwc/pcie-intel-gw.c
> +++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
> @@ -385,14 +385,6 @@ static int intel_pcie_rc_init(struct pcie_port *pp)
>         return intel_pcie_host_setup(lpp);
>  }
> 
> -/*
> - * Dummy function so that DW core doesn't configure MSI
> - */
> -static int intel_pcie_msi_init(struct pcie_port *pp)
> -{
> -       return 0;
> -}
> -
>  static u64 intel_pcie_cpu_addr(struct dw_pcie *pcie, u64 cpu_addr)
>  {
>         return cpu_addr + BUS_IATU_OFFSET;
> @@ -404,7 +396,6 @@ static const struct dw_pcie_ops intel_pcie_ops = {
> 
>  static const struct dw_pcie_host_ops intel_pcie_dw_ops = {
>         .host_init =            intel_pcie_rc_init,
> -       .msi_host_init =        intel_pcie_msi_init,
>  };
> 
>  static const struct intel_pcie_soc pcie_data = {
> --
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
>
