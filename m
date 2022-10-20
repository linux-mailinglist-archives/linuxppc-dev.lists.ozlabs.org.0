Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD4605858
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 09:22:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtJwD2byCz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 18:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=BehvsCWD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=conor.dooley@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=BehvsCWD;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Thu, 20 Oct 2022 18:21:59 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtJvC1TZfz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 18:21:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1666250519; x=1697786519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HwBhg6T/FCET8zOCXPGCdtkeM5GhViORaVBZyt0//OM=;
  b=BehvsCWDvz7TqeHtx/anGlbCzcl5EH2yTfaQyEZ05le9iossY17a7QJt
   yMu6N4sT1/zVsKlCits1hnLARCRMQmIIPfhkl/eq4N5OPh+MvDMX3BQZe
   LCmkkLO29rZ4Dg3sI7yo9VKJIn73o2Gau/LOq7Wrqq9T3SIY93vLbme8T
   SJrO49GVOSJoXTPOpAoGGly5DLhhz1vma4DDKprzJ5ayF8e8bzIk4eY9r
   WXaH775jDYdC//xKNqJE76Qs93A1N4+X1hVLtcEA6kvX940bVrLYroRL4
   F/o9qxxpItxf+imjqBsGepyUG2ARdFH4+c8W54Xbzcxu4kvx2Nr6ryTuz
   g==;
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="183093556"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Oct 2022 00:20:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 20 Oct 2022 00:20:46 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 20 Oct 2022 00:20:41 -0700
Date: Thu, 20 Oct 2022 08:20:25 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] PCI: Remove unnecessary of_irq.h includes
Message-ID: <Y1D2ubkwXqwx9LWD@wendy>
References: <20221019195452.37606-1-helgaas@kernel.org>
 <202210201434.PPlZ6yC1-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202210201434.PPlZ6yC1-lkp@intel.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, llvm@lists.linux.dev, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org, Scott Branden
  <sbranden@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 20, 2022 at 03:08:50PM +0800, kernel test robot wrote:
> Hi Bjorn,
> 
> I love your patch! Yet something to improve:
> 
> >> drivers/pci/controller/pcie-microchip-host.c:473:31: error: incomplete definition of type 'struct irq_domain'
>            struct mc_pcie *port = domain->host_data;

That's what I get for only visually inspecting the patch before Acking
it.. Un-ack I suppose.
Sorry,
Conor.

>                                   ~~~~~~^
>    include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
>    struct irq_domain;
>           ^
> >> drivers/pci/controller/pcie-microchip-host.c:489:2: error: call to undeclared function 'irq_domain_set_info'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            irq_domain_set_info(domain, virq, bit, &mc_msi_bottom_irq_chip,
>            ^
>    drivers/pci/controller/pcie-microchip-host.c:490:14: error: incomplete definition of type 'struct irq_domain'
>                                domain->host_data, handle_edge_irq, NULL, NULL);
>                                ~~~~~~^
>    include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
>    struct irq_domain;
>           ^
> >> drivers/pci/controller/pcie-microchip-host.c:505:23: error: call to undeclared function 'irq_domain_get_irq_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>                                 ^
>    drivers/pci/controller/pcie-microchip-host.c:505:23: note: did you mean 'irq_desc_get_irq_data'?
>    include/linux/irqdesc.h:132:32: note: 'irq_desc_get_irq_data' declared here
>    static inline struct irq_data *irq_desc_get_irq_data(struct irq_desc *desc)
>                                   ^
> >> drivers/pci/controller/pcie-microchip-host.c:505:19: error: incompatible integer to pointer conversion initializing 'struct irq_data *' with an expression of type 'int' [-Wint-conversion]
>            struct irq_data *d = irq_domain_get_irq_data(domain, virq);
>                             ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/pci/controller/pcie-microchip-host.c:519:36: error: variable has incomplete type 'const struct irq_domain_ops'
>    static const struct irq_domain_ops msi_domain_ops = {
>                                       ^
>    include/linux/msi.h:301:8: note: forward declaration of 'struct irq_domain_ops'
>    struct irq_domain_ops;
>           ^
> >> drivers/pci/controller/pcie-microchip-host.c:540:33: error: call to undeclared function 'of_node_to_fwnode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
>                                           ^
>    drivers/pci/controller/pcie-microchip-host.c:540:33: note: did you mean 'of_node_to_nid'?
>    include/linux/of.h:866:19: note: 'of_node_to_nid' declared here
>    static inline int of_node_to_nid(struct device_node *device)
>                      ^
> >> drivers/pci/controller/pcie-microchip-host.c:540:24: error: incompatible integer to pointer conversion initializing 'struct fwnode_handle *' with an expression of type 'int' [-Wint-conversion]
>            struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
>                                  ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> drivers/pci/controller/pcie-microchip-host.c:545:20: error: call to undeclared function 'irq_domain_add_linear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            msi->dev_domain = irq_domain_add_linear(NULL, msi->num_vectors,
>                              ^
> >> drivers/pci/controller/pcie-microchip-host.c:556:3: error: call to undeclared function 'irq_domain_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    irq_domain_remove(msi->dev_domain);
>                    ^
>    drivers/pci/controller/pcie-microchip-host.c:644:31: error: incomplete definition of type 'struct irq_domain'
>            irq_set_chip_data(irq, domain->host_data);
>                                   ~~~~~~^
>    include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
>    struct irq_domain;
>           ^
>    drivers/pci/controller/pcie-microchip-host.c:649:36: error: variable has incomplete type 'const struct irq_domain_ops'
>    static const struct irq_domain_ops intx_domain_ops = {
>                                       ^
>    include/linux/msi.h:301:8: note: forward declaration of 'struct irq_domain_ops'
>    struct irq_domain_ops;
>           ^
>    drivers/pci/controller/pcie-microchip-host.c:727:9: error: call to undeclared function 'irq_domain_get_irq_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            data = irq_domain_get_irq_data(port->event_domain, irq);
>                   ^
> >> drivers/pci/controller/pcie-microchip-host.c:727:7: error: incompatible integer to pointer conversion assigning to 'struct irq_data *' from 'int' [-Wint-conversion]
>            data = irq_domain_get_irq_data(port->event_domain, irq);
>                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/pci/controller/pcie-microchip-host.c:841:31: error: incomplete definition of type 'struct irq_domain'
>            irq_set_chip_data(irq, domain->host_data);
>                                   ~~~~~~^
>    include/linux/irq.h:130:8: note: forward declaration of 'struct irq_domain'
>    struct irq_domain;
>           ^
>    drivers/pci/controller/pcie-microchip-host.c:846:36: error: variable has incomplete type 'const struct irq_domain_ops'
>    static const struct irq_domain_ops event_domain_ops = {
>                                       ^
>    include/linux/msi.h:301:8: note: forward declaration of 'struct irq_domain_ops'
>    struct irq_domain_ops;
>           ^
>    drivers/pci/controller/pcie-microchip-host.c:902:23: error: call to undeclared function 'irq_domain_add_linear'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            port->event_domain = irq_domain_add_linear(pcie_intc_node, NUM_EVENTS,
>                                 ^
> >> drivers/pci/controller/pcie-microchip-host.c:910:2: error: call to undeclared function 'irq_domain_update_bus_token'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            irq_domain_update_bus_token(port->event_domain, DOMAIN_BUS_NEXUS);
>            ^
> >> drivers/pci/controller/pcie-microchip-host.c:910:50: error: use of undeclared identifier 'DOMAIN_BUS_NEXUS'
>            irq_domain_update_bus_token(port->event_domain, DOMAIN_BUS_NEXUS);
>                                                            ^
>    fatal error: too many errors emitted, stopping now [-ferror-limit=]
>    20 errors generated.
> 
> 
> vim +473 drivers/pci/controller/pcie-microchip-host.c
> 
> 6f15a9c9f94133 Daire McNamara 2021-01-25  469  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  470  static int mc_irq_msi_domain_alloc(struct irq_domain *domain, unsigned int virq,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  471  				   unsigned int nr_irqs, void *args)
> 6f15a9c9f94133 Daire McNamara 2021-01-25  472  {
> 5fe714fd922360 Bjorn Helgaas  2021-12-22 @473  	struct mc_pcie *port = domain->host_data;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  474  	struct mc_msi *msi = &port->msi;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  475  	void __iomem *bridge_base_addr =
> 6f15a9c9f94133 Daire McNamara 2021-01-25  476  		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  477  	unsigned long bit;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  478  	u32 val;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  479  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  480  	mutex_lock(&msi->lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  481  	bit = find_first_zero_bit(msi->used, msi->num_vectors);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  482  	if (bit >= msi->num_vectors) {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  483  		mutex_unlock(&msi->lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  484  		return -ENOSPC;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  485  	}
> 6f15a9c9f94133 Daire McNamara 2021-01-25  486  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  487  	set_bit(bit, msi->used);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  488  
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @489  	irq_domain_set_info(domain, virq, bit, &mc_msi_bottom_irq_chip,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  490  			    domain->host_data, handle_edge_irq, NULL, NULL);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  491  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  492  	/* Enable MSI interrupts */
> 6f15a9c9f94133 Daire McNamara 2021-01-25  493  	val = readl_relaxed(bridge_base_addr + IMASK_LOCAL);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  494  	val |= PM_MSI_INT_MSI_MASK;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  495  	writel_relaxed(val, bridge_base_addr + IMASK_LOCAL);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  496  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  497  	mutex_unlock(&msi->lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  498  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  499  	return 0;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  500  }
> 6f15a9c9f94133 Daire McNamara 2021-01-25  501  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  502  static void mc_irq_msi_domain_free(struct irq_domain *domain, unsigned int virq,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  503  				   unsigned int nr_irqs)
> 6f15a9c9f94133 Daire McNamara 2021-01-25  504  {
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @505  	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
> 5fe714fd922360 Bjorn Helgaas  2021-12-22  506  	struct mc_pcie *port = irq_data_get_irq_chip_data(d);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  507  	struct mc_msi *msi = &port->msi;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  508  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  509  	mutex_lock(&msi->lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  510  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  511  	if (test_bit(d->hwirq, msi->used))
> 6f15a9c9f94133 Daire McNamara 2021-01-25  512  		__clear_bit(d->hwirq, msi->used);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  513  	else
> 6f15a9c9f94133 Daire McNamara 2021-01-25  514  		dev_err(port->dev, "trying to free unused MSI%lu\n", d->hwirq);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  515  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  516  	mutex_unlock(&msi->lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  517  }
> 6f15a9c9f94133 Daire McNamara 2021-01-25  518  
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @519  static const struct irq_domain_ops msi_domain_ops = {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  520  	.alloc	= mc_irq_msi_domain_alloc,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  521  	.free	= mc_irq_msi_domain_free,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  522  };
> 6f15a9c9f94133 Daire McNamara 2021-01-25  523  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  524  static struct irq_chip mc_msi_irq_chip = {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  525  	.name = "Microchip PCIe MSI",
> 6f15a9c9f94133 Daire McNamara 2021-01-25  526  	.irq_ack = irq_chip_ack_parent,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  527  	.irq_mask = pci_msi_mask_irq,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  528  	.irq_unmask = pci_msi_unmask_irq,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  529  };
> 6f15a9c9f94133 Daire McNamara 2021-01-25  530  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  531  static struct msi_domain_info mc_msi_domain_info = {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  532  	.flags = (MSI_FLAG_USE_DEF_DOM_OPS | MSI_FLAG_USE_DEF_CHIP_OPS |
> 6f15a9c9f94133 Daire McNamara 2021-01-25  533  		  MSI_FLAG_PCI_MSIX),
> 6f15a9c9f94133 Daire McNamara 2021-01-25  534  	.chip = &mc_msi_irq_chip,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  535  };
> 6f15a9c9f94133 Daire McNamara 2021-01-25  536  
> 5fe714fd922360 Bjorn Helgaas  2021-12-22  537  static int mc_allocate_msi_domains(struct mc_pcie *port)
> 6f15a9c9f94133 Daire McNamara 2021-01-25  538  {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  539  	struct device *dev = port->dev;
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @540  	struct fwnode_handle *fwnode = of_node_to_fwnode(dev->of_node);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  541  	struct mc_msi *msi = &port->msi;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  542  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  543  	mutex_init(&port->msi.lock);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  544  
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @545  	msi->dev_domain = irq_domain_add_linear(NULL, msi->num_vectors,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  546  						&msi_domain_ops, port);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  547  	if (!msi->dev_domain) {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  548  		dev_err(dev, "failed to create IRQ domain\n");
> 6f15a9c9f94133 Daire McNamara 2021-01-25  549  		return -ENOMEM;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  550  	}
> 6f15a9c9f94133 Daire McNamara 2021-01-25  551  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  552  	msi->msi_domain = pci_msi_create_irq_domain(fwnode, &mc_msi_domain_info,
> 6f15a9c9f94133 Daire McNamara 2021-01-25  553  						    msi->dev_domain);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  554  	if (!msi->msi_domain) {
> 6f15a9c9f94133 Daire McNamara 2021-01-25  555  		dev_err(dev, "failed to create MSI domain\n");
> 6f15a9c9f94133 Daire McNamara 2021-01-25 @556  		irq_domain_remove(msi->dev_domain);
> 6f15a9c9f94133 Daire McNamara 2021-01-25  557  		return -ENOMEM;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  558  	}
> 6f15a9c9f94133 Daire McNamara 2021-01-25  559  
> 6f15a9c9f94133 Daire McNamara 2021-01-25  560  	return 0;
> 6f15a9c9f94133 Daire McNamara 2021-01-25  561  }
> 6f15a9c9f94133 Daire McNamara 2021-01-25  562  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/riscv 6.1.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 791a7ae1ba3efd6bca96338e10ffde557ba83920)"
> CONFIG_GCC_VERSION=0
> CONFIG_CC_IS_CLANG=y
> CONFIG_CLANG_VERSION=160000
> CONFIG_AS_IS_LLVM=y
> CONFIG_AS_VERSION=160000
> CONFIG_LD_VERSION=0
> CONFIG_LD_IS_LLD=y
> CONFIG_LLD_VERSION=160000
> CONFIG_RUST_IS_AVAILABLE=y
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> CONFIG_TOOLS_SUPPORT_RELR=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> CONFIG_PAHOLE_VERSION=123
> CONFIG_CONSTRUCTORS=y
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
> CONFIG_THREAD_INFO_IN_TASK=y
> 
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> CONFIG_COMPILE_TEST=y
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=""
> CONFIG_BUILD_SALT=""
> CONFIG_DEFAULT_INIT=""
> CONFIG_DEFAULT_HOSTNAME="(none)"
> # CONFIG_SYSVIPC is not set
> CONFIG_WATCH_QUEUE=y
> CONFIG_CROSS_MEMORY_ATTACH=y
> CONFIG_USELIB=y
> CONFIG_HAVE_ARCH_AUDITSYSCALL=y
> 
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_SHOW_LEVEL=y
> CONFIG_GENERIC_IRQ_INJECTION=y
> CONFIG_HARDIRQS_SW_RESEND=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_GENERIC_MSI_IRQ=y
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
> CONFIG_IRQ_FORCED_THREADING=y
> CONFIG_SPARSE_IRQ=y
> CONFIG_GENERIC_IRQ_DEBUGFS=y
> # end of IRQ subsystem
> 
> CONFIG_GENERIC_IRQ_MULTI_HANDLER=y
> CONFIG_ARCH_CLOCKSOURCE_INIT=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
> CONFIG_TIME_KUNIT_TEST=y
> 
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_HZ_PERIODIC=y
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=y
> # end of Timers subsystem
> 
> CONFIG_HAVE_EBPF_JIT=y
> 
> #
> # BPF subsystem
> #
> # CONFIG_BPF_SYSCALL is not set
> # end of BPF subsystem
> 
> CONFIG_PREEMPT_VOLUNTARY_BUILD=y
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=y
> # CONFIG_PREEMPT is not set
> 
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> CONFIG_IRQ_TIME_ACCOUNTING=y
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> 
> CONFIG_CPU_ISOLATION=y
> 
> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=y
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=y
> CONFIG_TINY_SRCU=y
> # end of RCU Subsystem
> 
> CONFIG_IKCONFIG=y
> # CONFIG_IKHEADERS is not set
> CONFIG_GENERIC_SCHED_CLOCK=y
> 
> #
> # Scheduler features
> #
> # end of Scheduler features
> 
> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
> CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> CONFIG_CGROUPS=y
> # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> # CONFIG_MEMCG is not set
> CONFIG_BLK_CGROUP=y
> CONFIG_CGROUP_SCHED=y
> CONFIG_FAIR_GROUP_SCHED=y
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=y
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=y
> CONFIG_CGROUP_FREEZER=y
> CONFIG_CGROUP_DEVICE=y
> CONFIG_CGROUP_CPUACCT=y
> CONFIG_CGROUP_MISC=y
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_NAMESPACES is not set
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=y
> CONFIG_INITRAMFS_SOURCE=""
> CONFIG_RD_GZIP=y
> CONFIG_RD_BZIP2=y
> CONFIG_RD_LZMA=y
> # CONFIG_RD_XZ is not set
> CONFIG_RD_LZO=y
> CONFIG_RD_LZ4=y
> CONFIG_RD_ZSTD=y
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_INITRAMFS_PRESERVE_MTIME=y
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> CONFIG_EXPERT=y
> CONFIG_MULTIUSER=y
> CONFIG_SGETMASK_SYSCALL=y
> CONFIG_SYSFS_SYSCALL=y
> # CONFIG_FHANDLE is not set
> # CONFIG_POSIX_TIMERS is not set
> # CONFIG_PRINTK is not set
> # CONFIG_BUG is not set
> # CONFIG_ELF_CORE is not set
> CONFIG_BASE_FULL=y
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> # CONFIG_TIMERFD is not set
> # CONFIG_EVENTFD is not set
> # CONFIG_SHMEM is not set
> CONFIG_AIO=y
> CONFIG_IO_URING=y
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_KCMP=y
> CONFIG_RSEQ=y
> CONFIG_DEBUG_RSEQ=y
> CONFIG_EMBEDDED=y
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PC104=y
> 
> #
> # Kernel Performance Events And Counters
> #
> # CONFIG_PERF_EVENTS is not set
> # end of Kernel Performance Events And Counters
> 
> CONFIG_PROFILING=y
> # end of General setup
> 
> CONFIG_32BIT=y
> CONFIG_RISCV=y
> CONFIG_ARCH_MMAP_RND_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=17
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=17
> CONFIG_RISCV_SBI=y
> CONFIG_MMU=y
> CONFIG_PAGE_OFFSET=0xC0000000
> CONFIG_ARCH_FLATMEM_ENABLE=y
> CONFIG_ARCH_SPARSEMEM_ENABLE=y
> CONFIG_ARCH_SELECT_MEMORY_MODEL=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_GENERIC_CSUM=y
> CONFIG_GENERIC_HWEIGHT=y
> CONFIG_FIX_EARLYCON_MEM=y
> CONFIG_PGTABLE_LEVELS=2
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_RISCV_DMA_NONCOHERENT=y
> CONFIG_AS_HAS_INSN=y
> 
> #
> # SoC selection
> #
> CONFIG_SOC_MICROCHIP_POLARFIRE=y
> CONFIG_SOC_SIFIVE=y
> CONFIG_SOC_STARFIVE=y
> CONFIG_SOC_VIRT=y
> # end of SoC selection
> 
> #
> # CPU errata selection
> #
> CONFIG_ERRATA_SIFIVE=y
> # CONFIG_ERRATA_THEAD is not set
> # end of CPU errata selection
> 
> #
> # Platform type
> #
> CONFIG_NONPORTABLE=y
> CONFIG_ARCH_RV32I=y
> # CONFIG_ARCH_RV64I is not set
> CONFIG_CMODEL_MEDLOW=y
> # CONFIG_CMODEL_MEDANY is not set
> # CONFIG_SMP is not set
> CONFIG_TUNE_GENERIC=y
> CONFIG_RISCV_ALTERNATIVE=y
> CONFIG_RISCV_ISA_C=y
> CONFIG_CC_HAS_ZICBOM=y
> CONFIG_RISCV_ISA_ZICBOM=y
> CONFIG_FPU=y
> # end of Platform type
> 
> #
> # Kernel features
> #
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=y
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=300
> CONFIG_SCHED_HRTICK=y
> CONFIG_RISCV_SBI_V01=y
> # CONFIG_KEXEC is not set
> # CONFIG_CRASH_DUMP is not set
> # end of Kernel features
> 
> #
> # Boot options
> #
> CONFIG_CMDLINE=""
> CONFIG_EFI_STUB=y
> CONFIG_EFI=y
> CONFIG_PHYS_RAM_BASE_FIXED=y
> CONFIG_PHYS_RAM_BASE=0x80000000
> # end of Boot options
> 
> #
> # Power management options
> #
> CONFIG_PM=y
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=y
> CONFIG_PM_GENERIC_DOMAINS=y
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> CONFIG_PM_GENERIC_DOMAINS_OF=y
> # end of Power management options
> 
> #
> # CPU Power Management
> #
> 
> #
> # CPU Idle
> #
> # CONFIG_CPU_IDLE is not set
> # end of CPU Idle
> # end of CPU Power Management
> 
> # CONFIG_VIRTUALIZATION is not set
> 
> #
> # General architecture-dependent options
> #
> # CONFIG_JUMP_LABEL is not set
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_KPROBES_ON_FTRACE=y
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_HAVE_DMA_CONTIGUOUS=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_GENERIC_IDLE_POLL_SETUP=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_SET_MEMORY=y
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
> CONFIG_HAVE_ARCH_SECCOMP=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR=y
> # CONFIG_STACKPROTECTOR_STRONG is not set
> CONFIG_LTO_NONE=y
> CONFIG_HAVE_CONTEXT_TRACKING_USER=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOVE_PUD=y
> CONFIG_HAVE_MOVE_PMD=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_ARCH_MMAP_RND_BITS=8
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
> CONFIG_CLONE_BACKWARDS=y
> # CONFIG_COMPAT_32BIT_TIME is not set
> CONFIG_ARCH_OPTIONAL_KERNEL_RWX=y
> CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT=y
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
> CONFIG_STRICT_KERNEL_RWX=y
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
> CONFIG_ARCH_USE_MEMREMAP_PROT=y
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
> CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
> 
> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=y
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> # end of GCOV-based kernel profiling
> 
> CONFIG_HAVE_GCC_PLUGINS=y
> # end of General architecture-dependent options
> 
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> # CONFIG_MODULES is not set
> CONFIG_BLOCK=y
> # CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
> CONFIG_BLK_CGROUP_RWSTAT=y
> CONFIG_BLK_DEV_BSG_COMMON=y
> CONFIG_BLK_ICQ=y
> CONFIG_BLK_DEV_BSGLIB=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BLK_DEV_INTEGRITY_T10=y
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=y
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> CONFIG_BLK_WBT=y
> # CONFIG_BLK_WBT_MQ is not set
> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> CONFIG_BLK_CGROUP_FC_APPID=y
> # CONFIG_BLK_CGROUP_IOCOST is not set
> CONFIG_BLK_CGROUP_IOPRIO=y
> # CONFIG_BLK_DEBUG_FS is not set
> # CONFIG_BLK_SED_OPAL is not set
> CONFIG_BLK_INLINE_ENCRYPTION=y
> CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y
> 
> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=y
> CONFIG_EFI_PARTITION=y
> # end of Partition Types
> 
> CONFIG_BLK_MQ_PCI=y
> CONFIG_BLK_MQ_VIRTIO=y
> CONFIG_BLK_PM=y
> CONFIG_BLOCK_HOLDER_DEPRECATED=y
> 
> #
> # IO Schedulers
> #
> # CONFIG_MQ_IOSCHED_DEADLINE is not set
> CONFIG_MQ_IOSCHED_KYBER=y
> CONFIG_IOSCHED_BFQ=y
> # CONFIG_BFQ_GROUP_IOSCHED is not set
> # end of IO Schedulers
> 
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_MMIOWB=y
> CONFIG_FREEZER=y
> 
> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=y
> CONFIG_BINFMT_ELF_KUNIT_TEST=y
> CONFIG_ELFCORE=y
> # CONFIG_BINFMT_SCRIPT is not set
> CONFIG_ARCH_HAS_BINFMT_FLAT=y
> # CONFIG_BINFMT_FLAT is not set
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=y
> # end of Executable file formats
> 
> #
> # Memory Management options
> #
> # CONFIG_SWAP is not set
> 
> #
> # SLAB allocator options
> #
> CONFIG_SLAB=y
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> CONFIG_SLAB_MERGE_DEFAULT=y
> CONFIG_SLAB_FREELIST_RANDOM=y
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> # end of SLAB allocator options
> 
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SELECT_MEMORY_MODEL=y
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=y
> CONFIG_SPARSEMEM=y
> CONFIG_SPARSEMEM_STATIC=y
> CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> CONFIG_MEMORY_BALLOON=y
> CONFIG_BALLOON_COMPACTION=y
> CONFIG_COMPACTION=y
> CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
> CONFIG_PAGE_REPORTING=y
> CONFIG_MIGRATION=y
> CONFIG_KSM=y
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
> CONFIG_NEED_PER_CPU_KM=y
> # CONFIG_CMA is not set
> CONFIG_GENERIC_EARLY_IOREMAP=y
> CONFIG_PAGE_IDLE_FLAG=y
> CONFIG_IDLE_PAGE_TRACKING=y
> CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_PERCPU_STATS=y
> CONFIG_GUP_TEST=y
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> CONFIG_USERFAULTFD=y
> 
> #
> # Data Access Monitoring
> #
> CONFIG_DAMON=y
> CONFIG_DAMON_KUNIT_TEST=y
> CONFIG_DAMON_VADDR=y
> CONFIG_DAMON_PADDR=y
> CONFIG_DAMON_VADDR_KUNIT_TEST=y
> # CONFIG_DAMON_SYSFS is not set
> # CONFIG_DAMON_DBGFS is not set
> # CONFIG_DAMON_RECLAIM is not set
> # CONFIG_DAMON_LRU_SORT is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> 
> # CONFIG_NET is not set
> 
> #
> # Device Drivers
> #
> CONFIG_HAVE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> CONFIG_PCI_DOMAINS_GENERIC=y
> CONFIG_PCIEPORTBUS=y
> # CONFIG_PCIEAER is not set
> # CONFIG_PCIEASPM is not set
> CONFIG_PCIE_PME=y
> CONFIG_PCIE_PTM=y
> CONFIG_PCI_MSI=y
> CONFIG_PCI_MSI_IRQ_DOMAIN=y
> CONFIG_PCI_QUIRKS=y
> CONFIG_PCI_DEBUG=y
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=y
> # CONFIG_PCI_PF_STUB is not set
> CONFIG_PCI_ATS=y
> CONFIG_PCI_ECAM=y
> CONFIG_PCI_IOV=y
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=y
> CONFIG_PCIE_BUS_TUNE_OFF=y
> # CONFIG_PCIE_BUS_DEFAULT is not set
> # CONFIG_PCIE_BUS_SAFE is not set
> # CONFIG_PCIE_BUS_PERFORMANCE is not set
> # CONFIG_PCIE_BUS_PEER2PEER is not set
> # CONFIG_VGA_ARB is not set
> # CONFIG_HOTPLUG_PCI is not set
> 
> #
> # PCI controller drivers
> #
> # CONFIG_PCI_AARDVARK is not set
> # CONFIG_PCIE_XILINX_NWL is not set
> # CONFIG_PCI_FTPCI100 is not set
> # CONFIG_PCI_TEGRA is not set
> # CONFIG_PCIE_RCAR_HOST is not set
> CONFIG_PCI_HOST_COMMON=y
> CONFIG_PCI_HOST_GENERIC=y
> CONFIG_PCIE_XILINX=y
> # CONFIG_PCIE_XILINX_CPM is not set
> # CONFIG_PCI_XGENE is not set
> # CONFIG_PCI_V3_SEMI is not set
> # CONFIG_PCI_VERSATILE is not set
> # CONFIG_PCIE_ALTERA is not set
> # CONFIG_PCI_HOST_THUNDER_PEM is not set
> # CONFIG_PCI_HOST_THUNDER_ECAM is not set
> # CONFIG_PCIE_ROCKCHIP_HOST is not set
> # CONFIG_PCIE_MEDIATEK is not set
> # CONFIG_PCIE_MEDIATEK_GEN3 is not set
> # CONFIG_PCIE_BRCMSTB is not set
> # CONFIG_PCI_LOONGSON is not set
> CONFIG_PCIE_MICROCHIP_HOST=y
> # CONFIG_PCIE_APPLE is not set
> # CONFIG_PCIE_MT7621 is not set
> 
> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=y
> CONFIG_PCIE_DW_HOST=y
> CONFIG_PCIE_DW_PLAT=y
> CONFIG_PCIE_DW_PLAT_HOST=y
> # CONFIG_PCI_EXYNOS is not set
> # CONFIG_PCI_IMX6 is not set
> # CONFIG_PCIE_SPEAR13XX is not set
> # CONFIG_PCI_KEYSTONE_HOST is not set
> # CONFIG_PCI_LAYERSCAPE is not set
> # CONFIG_PCI_HISI is not set
> # CONFIG_PCIE_QCOM is not set
> # CONFIG_PCIE_ARMADA_8K is not set
> # CONFIG_PCIE_ARTPEC6_HOST is not set
> # CONFIG_PCIE_ROCKCHIP_DW_HOST is not set
> # CONFIG_PCIE_INTEL_GW is not set
> # CONFIG_PCIE_KEEMBAY_HOST is not set
> # CONFIG_PCIE_KIRIN is not set
> # CONFIG_PCIE_HISI_STB is not set
> CONFIG_PCI_MESON=y
> # CONFIG_PCIE_TEGRA194_HOST is not set
> # CONFIG_PCIE_VISCONTI_HOST is not set
> # CONFIG_PCIE_UNIPHIER is not set
> # CONFIG_PCIE_AL is not set
> CONFIG_PCIE_FU740=y
> # end of DesignWare PCI Core Support
> 
> #
> # Mobiveil PCIe Core Support
> #
> # CONFIG_PCIE_MOBIVEIL_PLAT is not set
> # CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
> # end of Mobiveil PCIe Core Support
> 
> #
> # Cadence PCIe controllers support
> #
> CONFIG_PCIE_CADENCE=y
> CONFIG_PCIE_CADENCE_HOST=y
> CONFIG_PCIE_CADENCE_PLAT=y
> CONFIG_PCIE_CADENCE_PLAT_HOST=y
> # CONFIG_PCI_J721E_HOST is not set
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> 
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> 
> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> 
> # CONFIG_CXL_BUS is not set
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=y
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> 
> #
> # PC-card bridges
> #
> CONFIG_YENTA=y
> CONFIG_YENTA_O2=y
> CONFIG_YENTA_RICOH=y
> CONFIG_YENTA_TI=y
> # CONFIG_YENTA_TOSHIBA is not set
> CONFIG_PD6729=y
> CONFIG_I82092=y
> CONFIG_PCCARD_NONSTATIC=y
> # CONFIG_RAPIDIO is not set
> 
> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=y
> # CONFIG_UEVENT_HELPER is not set
> # CONFIG_DEVTMPFS is not set
> CONFIG_STANDALONE=y
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> 
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_FW_LOADER_SYSFS=y
> CONFIG_EXTRA_FIRMWARE=""
> CONFIG_FW_LOADER_USER_HELPER=y
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> # CONFIG_FW_UPLOAD is not set
> # end of Firmware loader
> 
> CONFIG_WANT_DEV_COREDUMP=y
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> CONFIG_DEBUG_DRIVER=y
> # CONFIG_DEBUG_DEVRES is not set
> CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
> CONFIG_PM_QOS_KUNIT_TEST=y
> CONFIG_DRIVER_PE_KUNIT_TEST=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=y
> CONFIG_REGMAP_SPI=y
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_SCCB=y
> CONFIG_REGMAP_SPI_AVMM=y
> CONFIG_DMA_SHARED_BUFFER=y
> CONFIG_DMA_FENCE_TRACE=y
> CONFIG_GENERIC_ARCH_TOPOLOGY=y
> # end of Generic Driver Options
> 
> #
> # Bus devices
> #
> # CONFIG_ARM_INTEGRATOR_LM is not set
> # CONFIG_BT1_APB is not set
> # CONFIG_BT1_AXI is not set
> CONFIG_MOXTET=y
> # CONFIG_HISILICON_LPC is not set
> # CONFIG_INTEL_IXP4XX_EB is not set
> # CONFIG_QCOM_EBI2 is not set
> CONFIG_MHI_BUS=y
> CONFIG_MHI_BUS_DEBUG=y
> CONFIG_MHI_BUS_PCI_GENERIC=y
> CONFIG_MHI_BUS_EP=y
> # end of Bus devices
> 
> #
> # Firmware Drivers
> #
> 
> #
> # ARM System Control and Management Interface Protocol
> #
> # CONFIG_ARM_SCMI_PROTOCOL is not set
> CONFIG_ARM_SCMI_POWER_DOMAIN=y
> # CONFIG_ARM_SCMI_POWER_CONTROL is not set
> # end of ARM System Control and Management Interface Protocol
> 
> CONFIG_ARM_SCPI_POWER_DOMAIN=y
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_SYSFB_SIMPLEFB is not set
> # CONFIG_BCM47XX_NVRAM is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> 
> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_ESRT=y
> CONFIG_EFI_PARAMS_FROM_FDT=y
> CONFIG_EFI_RUNTIME_WRAPPERS=y
> CONFIG_EFI_GENERIC_STUB=y
> # CONFIG_EFI_ZBOOT is not set
> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> # CONFIG_RESET_ATTACK_MITIGATION is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> CONFIG_EFI_EARLYCON=y
> # CONFIG_EFI_DISABLE_RUNTIME is not set
> # CONFIG_EFI_COCO_SECRET is not set
> # end of EFI (Extensible Firmware Interface) Support
> 
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> 
> CONFIG_GNSS=y
> CONFIG_MTD=y
> 
> #
> # Partition parsers
> #
> # CONFIG_MTD_AR7_PARTS is not set
> # CONFIG_MTD_BCM63XX_PARTS is not set
> # CONFIG_MTD_BRCM_U_BOOT is not set
> CONFIG_MTD_CMDLINE_PARTS=y
> # CONFIG_MTD_OF_PARTS is not set
> # CONFIG_MTD_PARSER_IMAGETAG is not set
> # CONFIG_MTD_PARSER_TRX is not set
> # CONFIG_MTD_SHARPSL_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=y
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # end of Partition parsers
> 
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=y
> CONFIG_MTD_BLOCK=y
> 
> #
> # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> #
> CONFIG_FTL=y
> CONFIG_NFTL=y
> # CONFIG_NFTL_RW is not set
> CONFIG_INFTL=y
> # CONFIG_RFD_FTL is not set
> CONFIG_SSFDC=y
> CONFIG_SM_FTL=y
> # CONFIG_MTD_OOPS is not set
> CONFIG_MTD_PARTITIONED_MASTER=y
> 
> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=y
> CONFIG_MTD_JEDECPROBE=y
> CONFIG_MTD_GEN_PROBE=y
> CONFIG_MTD_CFI_ADV_OPTIONS=y
> # CONFIG_MTD_CFI_NOSWAP is not set
> CONFIG_MTD_CFI_BE_BYTE_SWAP=y
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_GEOMETRY=y
> CONFIG_MTD_MAP_BANK_WIDTH_1=y
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> CONFIG_MTD_MAP_BANK_WIDTH_8=y
> CONFIG_MTD_MAP_BANK_WIDTH_16=y
> CONFIG_MTD_MAP_BANK_WIDTH_32=y
> CONFIG_MTD_CFI_I1=y
> CONFIG_MTD_CFI_I2=y
> # CONFIG_MTD_CFI_I4 is not set
> CONFIG_MTD_CFI_I8=y
> CONFIG_MTD_OTP=y
> CONFIG_MTD_CFI_INTELEXT=y
> CONFIG_MTD_CFI_AMDSTD=y
> CONFIG_MTD_CFI_STAA=y
> CONFIG_MTD_CFI_UTIL=y
> CONFIG_MTD_RAM=y
> CONFIG_MTD_ROM=y
> # CONFIG_MTD_ABSENT is not set
> # end of RAM/ROM/Flash chip drivers
> 
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_COMPAT=y
> CONFIG_MTD_PHYSMAP_START=0x8000000
> CONFIG_MTD_PHYSMAP_LEN=0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=2
> # CONFIG_MTD_PHYSMAP_OF is not set
> # CONFIG_MTD_PHYSMAP_GPIO_ADDR is not set
> # CONFIG_MTD_SC520CDP is not set
> # CONFIG_MTD_NETSC520 is not set
> # CONFIG_MTD_TS5500 is not set
> CONFIG_MTD_PCI=y
> CONFIG_MTD_PCMCIA=y
> CONFIG_MTD_PCMCIA_ANONYMOUS=y
> CONFIG_MTD_INTEL_VR_NOR=y
> CONFIG_MTD_PLATRAM=y
> # end of Mapping drivers for chip access
> 
> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=y
> CONFIG_MTD_PMC551_BUGFIX=y
> # CONFIG_MTD_PMC551_DEBUG is not set
> # CONFIG_MTD_DATAFLASH is not set
> # CONFIG_MTD_MCHP23K256 is not set
> CONFIG_MTD_MCHP48L640=y
> CONFIG_MTD_SPEAR_SMI=y
> # CONFIG_MTD_SST25L is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=y
> CONFIG_MTDRAM_TOTAL_SIZE=4096
> CONFIG_MTDRAM_ERASE_SIZE=128
> CONFIG_MTD_BLOCK2MTD=y
> 
> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=y
> CONFIG_BCH_CONST_M=14
> CONFIG_BCH_CONST_T=4
> # end of Self-contained MTD device drivers
> 
> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=y
> CONFIG_MTD_ONENAND=y
> CONFIG_MTD_ONENAND_VERIFY_WRITE=y
> CONFIG_MTD_ONENAND_GENERIC=y
> # CONFIG_MTD_ONENAND_SAMSUNG is not set
> CONFIG_MTD_ONENAND_OTP=y
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> # CONFIG_MTD_RAW_NAND is not set
> # CONFIG_MTD_SPI_NAND is not set
> 
> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=y
> CONFIG_MTD_NAND_ECC_SW_HAMMING=y
> # CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
> CONFIG_MTD_NAND_ECC_SW_BCH=y
> # CONFIG_MTD_NAND_ECC_MXIC is not set
> # CONFIG_MTD_NAND_ECC_MEDIATEK is not set
> # end of ECC engine support
> # end of NAND
> 
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=y
> CONFIG_MTD_QINFO_PROBE=y
> # end of LPDDR & LPDDR2 PCM memory drivers
> 
> CONFIG_MTD_SPI_NOR=y
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE is not set
> # CONFIG_MTD_SPI_NOR_SWP_DISABLE_ON_VOLATILE is not set
> CONFIG_MTD_SPI_NOR_SWP_KEEP=y
> # CONFIG_SPI_HISI_SFC is not set
> # CONFIG_SPI_NXP_SPIFI is not set
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> CONFIG_MTD_UBI_FASTMAP=y
> # CONFIG_MTD_UBI_GLUEBI is not set
> CONFIG_MTD_UBI_BLOCK=y
> CONFIG_MTD_HYPERBUS=y
> # CONFIG_HBMC_AM654 is not set
> CONFIG_DTC=y
> CONFIG_OF=y
> # CONFIG_OF_UNITTEST is not set
> # CONFIG_OF_ALL_DTBS is not set
> CONFIG_OF_FLATTREE=y
> CONFIG_OF_EARLY_FLATTREE=y
> CONFIG_OF_KOBJ=y
> CONFIG_OF_DYNAMIC=y
> CONFIG_OF_ADDRESS=y
> CONFIG_OF_IRQ=y
> CONFIG_OF_RESERVED_MEM=y
> CONFIG_OF_RESOLVE=y
> CONFIG_OF_OVERLAY=y
> CONFIG_OF_DMA_DEFAULT_COHERENT=y
> # CONFIG_PARPORT is not set
> # CONFIG_BLK_DEV is not set
> 
> #
> # NVME Support
> #
> CONFIG_NVME_COMMON=y
> CONFIG_NVME_CORE=y
> # CONFIG_BLK_DEV_NVME is not set
> CONFIG_NVME_MULTIPATH=y
> # CONFIG_NVME_VERBOSE_ERRORS is not set
> CONFIG_NVME_HWMON=y
> CONFIG_NVME_FABRICS=y
> CONFIG_NVME_FC=y
> CONFIG_NVME_AUTH=y
> CONFIG_NVME_TARGET=y
> CONFIG_NVME_TARGET_PASSTHRU=y
> CONFIG_NVME_TARGET_LOOP=y
> CONFIG_NVME_TARGET_FC=y
> CONFIG_NVME_TARGET_FCLOOP=y
> # CONFIG_NVME_TARGET_AUTH is not set
> # end of NVME Support
> 
> #
> # Misc devices
> #
> CONFIG_AD525X_DPOT=y
> CONFIG_AD525X_DPOT_I2C=y
> CONFIG_AD525X_DPOT_SPI=y
> CONFIG_DUMMY_IRQ=y
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=y
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=y
> # CONFIG_ATMEL_SSC is not set
> CONFIG_ENCLOSURE_SERVICES=y
> # CONFIG_GEHC_ACHC is not set
> # CONFIG_HP_ILO is not set
> # CONFIG_QCOM_COINCELL is not set
> # CONFIG_QCOM_FASTRPC is not set
> CONFIG_APDS9802ALS=y
> CONFIG_ISL29003=y
> CONFIG_ISL29020=y
> # CONFIG_SENSORS_TSL2550 is not set
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=y
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=y
> # CONFIG_PCH_PHUB is not set
> CONFIG_LATTICE_ECP3_CONFIG=y
> CONFIG_SRAM=y
> # CONFIG_DW_XDATA_PCIE is not set
> CONFIG_PCI_ENDPOINT_TEST=y
> CONFIG_XILINX_SDFEC=y
> CONFIG_MISC_RTSX=y
> # CONFIG_OPEN_DICE is not set
> CONFIG_VCPU_STALL_DETECTOR=y
> CONFIG_C2PORT=y
> 
> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=y
> CONFIG_EEPROM_AT25=y
> CONFIG_EEPROM_LEGACY=y
> CONFIG_EEPROM_MAX6875=y
> CONFIG_EEPROM_93CX6=y
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> CONFIG_EEPROM_EE1004=y
> # end of EEPROM support
> 
> CONFIG_CB710_CORE=y
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=y
> 
> #
> # Texas Instruments shared transport line discipline
> #
> # end of Texas Instruments shared transport line discipline
> 
> CONFIG_ALTERA_STAPL=y
> CONFIG_ECHO=y
> CONFIG_BCM_VK=y
> CONFIG_BCM_VK_TTY=y
> CONFIG_MISC_ALCOR_PCI=y
> CONFIG_MISC_RTSX_PCI=y
> CONFIG_HABANA_AI=y
> CONFIG_PVPANIC=y
> CONFIG_PVPANIC_MMIO=y
> CONFIG_PVPANIC_PCI=y
> CONFIG_GP_PCI1XXXX=y
> # end of Misc devices
> 
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> CONFIG_RAID_ATTRS=y
> CONFIG_SCSI_COMMON=y
> CONFIG_SCSI=y
> CONFIG_SCSI_DMA=y
> 
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> CONFIG_CHR_DEV_ST=y
> # CONFIG_CHR_DEV_SG is not set
> # CONFIG_BLK_DEV_BSG is not set
> CONFIG_CHR_DEV_SCH=y
> CONFIG_SCSI_ENCLOSURE=y
> # CONFIG_SCSI_CONSTANTS is not set
> # CONFIG_SCSI_LOGGING is not set
> # CONFIG_SCSI_SCAN_ASYNC is not set
> 
> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=y
> CONFIG_SCSI_SAS_ATTRS=y
> CONFIG_SCSI_SAS_LIBSAS=y
> CONFIG_SCSI_SAS_ATA=y
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=y
> # end of SCSI Transports
> 
> # CONFIG_SCSI_LOWLEVEL is not set
> CONFIG_SCSI_DH=y
> # CONFIG_SCSI_DH_RDAC is not set
> CONFIG_SCSI_DH_HP_SW=y
> CONFIG_SCSI_DH_EMC=y
> CONFIG_SCSI_DH_ALUA=y
> # end of SCSI device support
> 
> CONFIG_ATA=y
> CONFIG_SATA_HOST=y
> CONFIG_PATA_TIMINGS=y
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_FORCE=y
> # CONFIG_SATA_PMP is not set
> 
> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=y
> CONFIG_SATA_MOBILE_LPM_POLICY=0
> CONFIG_SATA_AHCI_PLATFORM=y
> # CONFIG_AHCI_BRCM is not set
> # CONFIG_AHCI_DA850 is not set
> # CONFIG_AHCI_DM816 is not set
> CONFIG_AHCI_DWC=y
> # CONFIG_AHCI_ST is not set
> # CONFIG_AHCI_IMX is not set
> CONFIG_AHCI_CEVA=y
> # CONFIG_AHCI_MTK is not set
> # CONFIG_AHCI_MVEBU is not set
> # CONFIG_AHCI_SUNXI is not set
> # CONFIG_AHCI_TEGRA is not set
> # CONFIG_AHCI_XGENE is not set
> # CONFIG_AHCI_QORIQ is not set
> # CONFIG_SATA_FSL is not set
> # CONFIG_SATA_GEMINI is not set
> # CONFIG_SATA_AHCI_SEATTLE is not set
> # CONFIG_SATA_INIC162X is not set
> CONFIG_SATA_ACARD_AHCI=y
> CONFIG_SATA_SIL24=y
> CONFIG_ATA_SFF=y
> 
> #
> # SFF controllers with custom DMA interface
> #
> CONFIG_PDC_ADMA=y
> CONFIG_SATA_QSTOR=y
> CONFIG_SATA_SX4=y
> # CONFIG_ATA_BMDMA is not set
> 
> #
> # PIO-only SFF controllers
> #
> CONFIG_PATA_CMD640_PCI=y
> # CONFIG_PATA_IXP4XX_CF is not set
> CONFIG_PATA_MPIIX=y
> CONFIG_PATA_NS87410=y
> CONFIG_PATA_OPTI=y
> CONFIG_PATA_PCMCIA=y
> # CONFIG_PATA_OF_PLATFORM is not set
> CONFIG_PATA_RZ1000=y
> # CONFIG_PATA_SAMSUNG_CF is not set
> 
> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=y
> CONFIG_BLK_DEV_MD=y
> # CONFIG_MD_AUTODETECT is not set
> # CONFIG_MD_LINEAR is not set
> # CONFIG_MD_RAID0 is not set
> CONFIG_MD_RAID1=y
> CONFIG_MD_RAID10=y
> # CONFIG_MD_RAID456 is not set
> CONFIG_MD_MULTIPATH=y
> CONFIG_MD_FAULTY=y
> # CONFIG_BCACHE is not set
> # CONFIG_BLK_DEV_DM is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> 
> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=y
> # end of IEEE 1394 (FireWire) support
> 
> #
> # Input device support
> #
> # CONFIG_INPUT is not set
> 
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_SERIO_SERPORT=y
> CONFIG_SERIO_PCIPS2=y
> CONFIG_SERIO_LIBPS2=y
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=y
> CONFIG_SERIO_PS2MULT=y
> CONFIG_SERIO_ARC_PS2=y
> CONFIG_SERIO_APBPS2=y
> # CONFIG_SERIO_OLPC_APSP is not set
> # CONFIG_SERIO_SUN4I_PS2 is not set
> CONFIG_SERIO_GPIO_PS2=y
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=y
> CONFIG_GAMEPORT_NS558=y
> CONFIG_GAMEPORT_L4=y
> # CONFIG_GAMEPORT_EMU10K1 is not set
> CONFIG_GAMEPORT_FM801=y
> # end of Hardware I/O ports
> # end of Input device support
> 
> #
> # Character devices
> #
> CONFIG_TTY=y
> # CONFIG_VT is not set
> # CONFIG_UNIX98_PTYS is not set
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=y
> 
> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=y
> CONFIG_SERIAL_8250=y
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=y
> CONFIG_SERIAL_8250_DMA=y
> CONFIG_SERIAL_8250_PCI=y
> # CONFIG_SERIAL_8250_EXAR is not set
> CONFIG_SERIAL_8250_CS=y
> CONFIG_SERIAL_8250_MEN_MCB=y
> CONFIG_SERIAL_8250_NR_UARTS=4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=4
> CONFIG_SERIAL_8250_EXTENDED=y
> CONFIG_SERIAL_8250_MANY_PORTS=y
> # CONFIG_SERIAL_8250_ASPEED_VUART is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> CONFIG_SERIAL_8250_DETECT_IRQ=y
> CONFIG_SERIAL_8250_RSA=y
> CONFIG_SERIAL_8250_DWLIB=y
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=y
> # CONFIG_SERIAL_8250_EM is not set
> # CONFIG_SERIAL_8250_IOC3 is not set
> CONFIG_SERIAL_8250_RT288X=y
> # CONFIG_SERIAL_8250_OMAP is not set
> # CONFIG_SERIAL_8250_LPC18XX is not set
> # CONFIG_SERIAL_8250_MT6577 is not set
> # CONFIG_SERIAL_8250_UNIPHIER is not set
> # CONFIG_SERIAL_8250_INGENIC is not set
> CONFIG_SERIAL_8250_LPSS=y
> CONFIG_SERIAL_8250_MID=y
> # CONFIG_SERIAL_8250_PERICOM is not set
> # CONFIG_SERIAL_8250_PXA is not set
> CONFIG_SERIAL_8250_TEGRA=y
> # CONFIG_SERIAL_8250_BCM7271 is not set
> CONFIG_SERIAL_OF_PLATFORM=y
> 
> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_AMBA_PL010 is not set
> # CONFIG_SERIAL_EARLYCON_RISCV_SBI is not set
> # CONFIG_SERIAL_ATMEL is not set
> # CONFIG_SERIAL_MESON is not set
> # CONFIG_SERIAL_CLPS711X is not set
> # CONFIG_SERIAL_SAMSUNG is not set
> # CONFIG_SERIAL_TEGRA is not set
> # CONFIG_SERIAL_MAX3100 is not set
> CONFIG_SERIAL_MAX310X=y
> # CONFIG_SERIAL_IMX is not set
> # CONFIG_SERIAL_IMX_EARLYCON is not set
> CONFIG_SERIAL_UARTLITE=y
> CONFIG_SERIAL_UARTLITE_CONSOLE=y
> CONFIG_SERIAL_UARTLITE_NR_UARTS=1
> # CONFIG_SERIAL_SH_SCI is not set
> # CONFIG_SERIAL_HS_LPC32XX is not set
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> # CONFIG_SERIAL_ICOM is not set
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_MSM is not set
> # CONFIG_SERIAL_VT8500 is not set
> # CONFIG_SERIAL_OMAP is not set
> CONFIG_SERIAL_SIFIVE=y
> CONFIG_SERIAL_SIFIVE_CONSOLE=y
> # CONFIG_SERIAL_LANTIQ is not set
> CONFIG_SERIAL_SCCNXP=y
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> CONFIG_SERIAL_SC16IS7XX=y
> # CONFIG_SERIAL_SC16IS7XX_I2C is not set
> # CONFIG_SERIAL_SC16IS7XX_SPI is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> # CONFIG_SERIAL_BCM63XX is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=y
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_PCH_UART is not set
> # CONFIG_SERIAL_MXS_AUART is not set
> CONFIG_SERIAL_XILINX_PS_UART=y
> # CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
> # CONFIG_SERIAL_MPS2_UART is not set
> CONFIG_SERIAL_ARC=y
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=y
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR is not set
> # CONFIG_SERIAL_ST_ASC is not set
> CONFIG_SERIAL_MEN_Z135=y
> # CONFIG_SERIAL_SPRD is not set
> # CONFIG_SERIAL_STM32 is not set
> # CONFIG_SERIAL_MVEBU_UART is not set
> # CONFIG_SERIAL_OWL is not set
> # CONFIG_SERIAL_RDA is not set
> # CONFIG_SERIAL_MILBEAUT_USIO is not set
> CONFIG_SERIAL_LITEUART=y
> CONFIG_SERIAL_LITEUART_MAX_PORTS=1
> # CONFIG_SERIAL_LITEUART_CONSOLE is not set
> # CONFIG_SERIAL_SUNPLUS is not set
> # end of Serial drivers
> 
> CONFIG_SERIAL_MCTRL_GPIO=y
> CONFIG_SERIAL_NONSTANDARD=y
> CONFIG_MOXA_INTELLIO=y
> CONFIG_MOXA_SMARTIO=y
> CONFIG_SYNCLINK_GT=y
> CONFIG_N_HDLC=y
> # CONFIG_GOLDFISH_TTY is not set
> CONFIG_NOZOMI=y
> # CONFIG_NULL_TTY is not set
> CONFIG_HVC_DRIVER=y
> CONFIG_HVC_RISCV_SBI=y
> # CONFIG_RPMSG_TTY is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_TTY_PRINTK=y
> CONFIG_TTY_PRINTK_LEVEL=6
> # CONFIG_VIRTIO_CONSOLE is not set
> # CONFIG_IPMI_HANDLER is not set
> # CONFIG_ASPEED_KCS_IPMI_BMC is not set
> # CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
> # CONFIG_ASPEED_BT_IPMI_BMC is not set
> CONFIG_IPMB_DEVICE_INTERFACE=y
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=y
> CONFIG_HW_RANDOM_ATMEL=y
> CONFIG_HW_RANDOM_BA431=y
> CONFIG_HW_RANDOM_BCM2835=y
> CONFIG_HW_RANDOM_IPROC_RNG200=y
> CONFIG_HW_RANDOM_IXP4XX=y
> CONFIG_HW_RANDOM_OMAP=y
> CONFIG_HW_RANDOM_OMAP3_ROM=y
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_HW_RANDOM_IMX_RNGC=y
> CONFIG_HW_RANDOM_NOMADIK=y
> CONFIG_HW_RANDOM_STM32=y
> CONFIG_HW_RANDOM_MESON=y
> CONFIG_HW_RANDOM_MTK=y
> CONFIG_HW_RANDOM_EXYNOS=y
> CONFIG_HW_RANDOM_NPCM=y
> CONFIG_HW_RANDOM_KEYSTONE=y
> CONFIG_HW_RANDOM_CCTRNG=y
> # CONFIG_HW_RANDOM_XIPHERA is not set
> CONFIG_APPLICOM=y
> 
> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=y
> CONFIG_CARDMAN_4000=y
> CONFIG_CARDMAN_4040=y
> CONFIG_SCR24X=y
> # end of PCMCIA character devices
> 
> CONFIG_DEVMEM=y
> # CONFIG_DEVPORT is not set
> CONFIG_TCG_TPM=y
> CONFIG_HW_RANDOM_TPM=y
> CONFIG_TCG_TIS_CORE=y
> CONFIG_TCG_TIS=y
> CONFIG_TCG_TIS_SPI=y
> # CONFIG_TCG_TIS_SPI_CR50 is not set
> CONFIG_TCG_TIS_I2C=y
> # CONFIG_TCG_TIS_SYNQUACER is not set
> CONFIG_TCG_TIS_I2C_CR50=y
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=y
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_ATMEL=y
> CONFIG_TCG_VTPM_PROXY=y
> CONFIG_TCG_TIS_ST33ZP24=y
> CONFIG_TCG_TIS_ST33ZP24_I2C=y
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> # CONFIG_XILLYBUS is not set
> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> 
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_I2C_BOARDINFO=y
> CONFIG_I2C_COMPAT=y
> CONFIG_I2C_CHARDEV=y
> CONFIG_I2C_MUX=y
> 
> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=y
> CONFIG_I2C_MUX_GPIO=y
> CONFIG_I2C_MUX_GPMUX=y
> CONFIG_I2C_MUX_LTC4306=y
> CONFIG_I2C_MUX_PCA9541=y
> CONFIG_I2C_MUX_PCA954x=y
> CONFIG_I2C_MUX_PINCTRL=y
> CONFIG_I2C_MUX_REG=y
> # CONFIG_I2C_DEMUX_PINCTRL is not set
> CONFIG_I2C_MUX_MLXCPLD=y
> # end of Multiplexer I2C Chip support
> 
> # CONFIG_I2C_HELPER_AUTO is not set
> # CONFIG_I2C_SMBUS is not set
> 
> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=y
> CONFIG_I2C_ALGOPCF=y
> CONFIG_I2C_ALGOPCA=y
> # end of I2C Algorithms
> 
> #
> # I2C Hardware Bus support
> #
> 
> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=y
> CONFIG_I2C_ALI1563=y
> CONFIG_I2C_ALI15X3=y
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=y
> # CONFIG_I2C_HIX5HD2 is not set
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=y
> CONFIG_I2C_PIIX4=y
> CONFIG_I2C_NFORCE2=y
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> CONFIG_I2C_SIS630=y
> CONFIG_I2C_SIS96X=y
> CONFIG_I2C_VIA=y
> CONFIG_I2C_VIAPRO=y
> 
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_ALTERA is not set
> # CONFIG_I2C_ASPEED is not set
> # CONFIG_I2C_AT91 is not set
> # CONFIG_I2C_AXXIA is not set
> # CONFIG_I2C_BCM2835 is not set
> # CONFIG_I2C_BCM_IPROC is not set
> # CONFIG_I2C_BCM_KONA is not set
> CONFIG_I2C_BRCMSTB=y
> # CONFIG_I2C_CADENCE is not set
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DAVINCI is not set
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_DIGICOLOR is not set
> # CONFIG_I2C_EG20T is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_EXYNOS5 is not set
> CONFIG_I2C_GPIO=y
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> # CONFIG_I2C_HIGHLANDER is not set
> # CONFIG_I2C_HISI is not set
> # CONFIG_I2C_IMG is not set
> # CONFIG_I2C_IMX is not set
> # CONFIG_I2C_IMX_LPI2C is not set
> # CONFIG_I2C_IOP3XX is not set
> # CONFIG_I2C_JZ4780 is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_LPC2K is not set
> # CONFIG_I2C_MESON is not set
> # CONFIG_I2C_MICROCHIP_CORE is not set
> # CONFIG_I2C_MT65XX is not set
> # CONFIG_I2C_MT7621 is not set
> # CONFIG_I2C_MV64XXX is not set
> # CONFIG_I2C_MXS is not set
> # CONFIG_I2C_NPCM is not set
> CONFIG_I2C_OCORES=y
> # CONFIG_I2C_OMAP is not set
> # CONFIG_I2C_OWL is not set
> # CONFIG_I2C_APPLE is not set
> CONFIG_I2C_PCA_PLATFORM=y
> # CONFIG_I2C_PNX is not set
> # CONFIG_I2C_PXA is not set
> # CONFIG_I2C_QCOM_CCI is not set
> # CONFIG_I2C_QUP is not set
> # CONFIG_I2C_RIIC is not set
> CONFIG_I2C_RK3X=y
> # CONFIG_I2C_RZV2M is not set
> # CONFIG_I2C_S3C2410 is not set
> # CONFIG_I2C_SH_MOBILE is not set
> CONFIG_I2C_SIMTEC=y
> # CONFIG_I2C_SPRD is not set
> # CONFIG_I2C_ST is not set
> # CONFIG_I2C_STM32F4 is not set
> # CONFIG_I2C_STM32F7 is not set
> # CONFIG_I2C_SUN6I_P2WI is not set
> # CONFIG_I2C_SYNQUACER is not set
> # CONFIG_I2C_TEGRA is not set
> # CONFIG_I2C_TEGRA_BPMP is not set
> # CONFIG_I2C_UNIPHIER is not set
> # CONFIG_I2C_UNIPHIER_F is not set
> # CONFIG_I2C_VERSATILE is not set
> # CONFIG_I2C_WMT is not set
> # CONFIG_I2C_XILINX is not set
> # CONFIG_I2C_XLP9XX is not set
> # CONFIG_I2C_RCAR is not set
> 
> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PCI1XXXX=y
> # CONFIG_I2C_TAOS_EVM is not set
> 
> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> 
> CONFIG_I2C_SLAVE=y
> CONFIG_I2C_SLAVE_EEPROM=y
> CONFIG_I2C_SLAVE_TESTUNIT=y
> CONFIG_I2C_DEBUG_CORE=y
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> 
> CONFIG_I3C=y
> CONFIG_CDNS_I3C_MASTER=y
> CONFIG_DW_I3C_MASTER=y
> CONFIG_SVC_I3C_MASTER=y
> CONFIG_MIPI_I3C_HCI=y
> CONFIG_SPI=y
> CONFIG_SPI_DEBUG=y
> CONFIG_SPI_MASTER=y
> CONFIG_SPI_MEM=y
> 
> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_ALTERA=y
> CONFIG_SPI_ALTERA_CORE=y
> # CONFIG_SPI_ALTERA_DFL is not set
> # CONFIG_SPI_AR934X is not set
> # CONFIG_SPI_ATH79 is not set
> # CONFIG_SPI_ARMADA_3700 is not set
> # CONFIG_SPI_ASPEED_SMC is not set
> # CONFIG_SPI_ATMEL is not set
> # CONFIG_SPI_ATMEL_QUADSPI is not set
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> # CONFIG_SPI_BCM2835 is not set
> # CONFIG_SPI_BCM2835AUX is not set
> # CONFIG_SPI_BCM63XX is not set
> # CONFIG_SPI_BCM63XX_HSSPI is not set
> # CONFIG_SPI_BCM_QSPI is not set
> CONFIG_SPI_BITBANG=y
> CONFIG_SPI_CADENCE=y
> # CONFIG_SPI_CADENCE_QUADSPI is not set
> # CONFIG_SPI_CADENCE_XSPI is not set
> # CONFIG_SPI_CLPS711X is not set
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_EP93XX is not set
> # CONFIG_SPI_FSL_LPSPI is not set
> # CONFIG_SPI_FSL_QUADSPI is not set
> # CONFIG_SPI_GXP is not set
> # CONFIG_SPI_HISI_KUNPENG is not set
> # CONFIG_SPI_HISI_SFC_V3XX is not set
> CONFIG_SPI_NXP_FLEXSPI=y
> CONFIG_SPI_GPIO=y
> # CONFIG_SPI_IMG_SPFI is not set
> # CONFIG_SPI_IMX is not set
> # CONFIG_SPI_INGENIC is not set
> # CONFIG_SPI_INTEL_PCI is not set
> # CONFIG_SPI_INTEL_PLATFORM is not set
> # CONFIG_SPI_JCORE is not set
> # CONFIG_SPI_LP8841_RTC is not set
> CONFIG_SPI_FSL_LIB=y
> CONFIG_SPI_FSL_SPI=y
> # CONFIG_SPI_FSL_DSPI is not set
> # CONFIG_SPI_MESON_SPICC is not set
> # CONFIG_SPI_MESON_SPIFC is not set
> CONFIG_SPI_MICROCHIP_CORE=y
> CONFIG_SPI_MICROCHIP_CORE_QSPI=y
> # CONFIG_SPI_MT65XX is not set
> # CONFIG_SPI_MT7621 is not set
> # CONFIG_SPI_MTK_NOR is not set
> # CONFIG_SPI_NPCM_FIU is not set
> # CONFIG_SPI_NPCM_PSPI is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> CONFIG_SPI_OC_TINY=y
> # CONFIG_SPI_OMAP24XX is not set
> # CONFIG_SPI_TI_QSPI is not set
> # CONFIG_SPI_OMAP_100K is not set
> # CONFIG_SPI_ORION is not set
> # CONFIG_SPI_PIC32 is not set
> # CONFIG_SPI_PIC32_SQI is not set
> CONFIG_SPI_PXA2XX=y
> CONFIG_SPI_PXA2XX_PCI=y
> CONFIG_SPI_ROCKCHIP=y
> # CONFIG_SPI_ROCKCHIP_SFC is not set
> # CONFIG_SPI_RSPI is not set
> # CONFIG_SPI_QUP is not set
> # CONFIG_SPI_S3C64XX is not set
> CONFIG_SPI_SC18IS602=y
> # CONFIG_SPI_SH_MSIOF is not set
> # CONFIG_SPI_SH is not set
> # CONFIG_SPI_SH_HSPI is not set
> CONFIG_SPI_SIFIVE=y
> # CONFIG_SPI_SPRD is not set
> # CONFIG_SPI_SPRD_ADI is not set
> # CONFIG_SPI_STM32 is not set
> # CONFIG_SPI_STM32_QSPI is not set
> # CONFIG_SPI_ST_SSC4 is not set
> # CONFIG_SPI_SUN4I is not set
> # CONFIG_SPI_SUN6I is not set
> # CONFIG_SPI_SUNPLUS_SP7021 is not set
> # CONFIG_SPI_SYNQUACER is not set
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_TEGRA210_QUAD is not set
> # CONFIG_SPI_TEGRA114 is not set
> # CONFIG_SPI_TEGRA20_SFLASH is not set
> # CONFIG_SPI_TEGRA20_SLINK is not set
> # CONFIG_SPI_TOPCLIFF_PCH is not set
> # CONFIG_SPI_UNIPHIER is not set
> CONFIG_SPI_XCOMM=y
> CONFIG_SPI_XILINX=y
> # CONFIG_SPI_XLP is not set
> # CONFIG_SPI_XTENSA_XTFPGA is not set
> # CONFIG_SPI_ZYNQ_QSPI is not set
> CONFIG_SPI_ZYNQMP_GQSPI=y
> CONFIG_SPI_AMD=y
> 
> #
> # SPI Multiplexer support
> #
> CONFIG_SPI_MUX=y
> 
> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=y
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=y
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=y
> CONFIG_PPS_DEBUG=y
> CONFIG_NTP_PPS=y
> 
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=y
> CONFIG_PPS_CLIENT_LDISC=y
> CONFIG_PPS_CLIENT_GPIO=y
> 
> #
> # PPS generators support
> #
> 
> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
> 
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
> 
> CONFIG_PINCTRL=y
> CONFIG_GENERIC_PINCTRL_GROUPS=y
> CONFIG_PINMUX=y
> CONFIG_GENERIC_PINMUX_FUNCTIONS=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> # CONFIG_DEBUG_PINCTRL is not set
> # CONFIG_PINCTRL_AMD is not set
> # CONFIG_PINCTRL_AS3722 is not set
> # CONFIG_PINCTRL_AT91PIO4 is not set
> CONFIG_PINCTRL_AXP209=y
> # CONFIG_PINCTRL_BM1880 is not set
> CONFIG_PINCTRL_CY8C95X0=y
> # CONFIG_PINCTRL_DA850_PUPD is not set
> # CONFIG_PINCTRL_EQUILIBRIUM is not set
> # CONFIG_PINCTRL_INGENIC is not set
> # CONFIG_PINCTRL_LPC18XX is not set
> # CONFIG_PINCTRL_MAX77620 is not set
> CONFIG_PINCTRL_MCP23S08_I2C=y
> CONFIG_PINCTRL_MCP23S08_SPI=y
> CONFIG_PINCTRL_MCP23S08=y
> CONFIG_PINCTRL_MICROCHIP_SGPIO=y
> # CONFIG_PINCTRL_OCELOT is not set
> # CONFIG_PINCTRL_PISTACHIO is not set
> # CONFIG_PINCTRL_ROCKCHIP is not set
> # CONFIG_PINCTRL_SINGLE is not set
> CONFIG_PINCTRL_STMFX=y
> # CONFIG_PINCTRL_SX150X is not set
> # CONFIG_PINCTRL_OWL is not set
> # CONFIG_PINCTRL_ASPEED_G4 is not set
> # CONFIG_PINCTRL_ASPEED_G5 is not set
> # CONFIG_PINCTRL_ASPEED_G6 is not set
> # CONFIG_PINCTRL_BCM281XX is not set
> # CONFIG_PINCTRL_BCM2835 is not set
> # CONFIG_PINCTRL_BCM4908 is not set
> # CONFIG_PINCTRL_BCM6318 is not set
> # CONFIG_PINCTRL_BCM6328 is not set
> # CONFIG_PINCTRL_BCM6358 is not set
> # CONFIG_PINCTRL_BCM6362 is not set
> # CONFIG_PINCTRL_BCM6368 is not set
> # CONFIG_PINCTRL_BCM63268 is not set
> # CONFIG_PINCTRL_IPROC_GPIO is not set
> # CONFIG_PINCTRL_CYGNUS_MUX is not set
> # CONFIG_PINCTRL_NS is not set
> # CONFIG_PINCTRL_NSP_GPIO is not set
> # CONFIG_PINCTRL_NS2_MUX is not set
> # CONFIG_PINCTRL_NSP_MUX is not set
> # CONFIG_PINCTRL_AS370 is not set
> # CONFIG_PINCTRL_BERLIN_BG4CT is not set
> # CONFIG_PINCTRL_LOCHNAGAR is not set
> 
> #
> # Intel pinctrl drivers
> #
> # end of Intel pinctrl drivers
> 
> #
> # MediaTek pinctrl drivers
> #
> # CONFIG_EINT_MTK is not set
> # CONFIG_PINCTRL_MT2701 is not set
> # CONFIG_PINCTRL_MT7623 is not set
> # CONFIG_PINCTRL_MT7629 is not set
> # CONFIG_PINCTRL_MT8135 is not set
> # CONFIG_PINCTRL_MT8127 is not set
> # CONFIG_PINCTRL_MT2712 is not set
> # CONFIG_PINCTRL_MT6765 is not set
> # CONFIG_PINCTRL_MT6779 is not set
> # CONFIG_PINCTRL_MT6795 is not set
> # CONFIG_PINCTRL_MT6797 is not set
> # CONFIG_PINCTRL_MT7622 is not set
> # CONFIG_PINCTRL_MT7986 is not set
> # CONFIG_PINCTRL_MT8167 is not set
> # CONFIG_PINCTRL_MT8173 is not set
> # CONFIG_PINCTRL_MT8183 is not set
> # CONFIG_PINCTRL_MT8186 is not set
> # CONFIG_PINCTRL_MT8188 is not set
> # CONFIG_PINCTRL_MT8192 is not set
> # CONFIG_PINCTRL_MT8195 is not set
> # CONFIG_PINCTRL_MT8365 is not set
> # CONFIG_PINCTRL_MT8516 is not set
> # CONFIG_PINCTRL_MT6397 is not set
> # end of MediaTek pinctrl drivers
> 
> CONFIG_PINCTRL_MESON=y
> # CONFIG_PINCTRL_WPCM450 is not set
> # CONFIG_PINCTRL_NPCM7XX is not set
> # CONFIG_PINCTRL_PXA25X is not set
> # CONFIG_PINCTRL_PXA27X is not set
> # CONFIG_PINCTRL_MSM is not set
> # CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
> # CONFIG_PINCTRL_LPASS_LPI is not set
> 
> #
> # Renesas pinctrl drivers
> #
> # CONFIG_PINCTRL_RENESAS is not set
> # CONFIG_PINCTRL_PFC_EMEV2 is not set
> # CONFIG_PINCTRL_PFC_R8A77995 is not set
> # CONFIG_PINCTRL_PFC_R8A7794 is not set
> # CONFIG_PINCTRL_PFC_R8A77990 is not set
> # CONFIG_PINCTRL_PFC_R8A7779 is not set
> # CONFIG_PINCTRL_PFC_R8A7790 is not set
> # CONFIG_PINCTRL_PFC_R8A77950 is not set
> # CONFIG_PINCTRL_PFC_R8A77951 is not set
> # CONFIG_PINCTRL_PFC_R8A7778 is not set
> # CONFIG_PINCTRL_PFC_R8A7793 is not set
> # CONFIG_PINCTRL_PFC_R8A7791 is not set
> # CONFIG_PINCTRL_PFC_R8A77965 is not set
> # CONFIG_PINCTRL_PFC_R8A77960 is not set
> # CONFIG_PINCTRL_PFC_R8A77961 is not set
> # CONFIG_PINCTRL_PFC_R8A779F0 is not set
> # CONFIG_PINCTRL_PFC_R8A7792 is not set
> # CONFIG_PINCTRL_PFC_R8A77980 is not set
> # CONFIG_PINCTRL_PFC_R8A77970 is not set
> # CONFIG_PINCTRL_PFC_R8A779A0 is not set
> # CONFIG_PINCTRL_PFC_R8A779G0 is not set
> # CONFIG_PINCTRL_PFC_R8A7740 is not set
> # CONFIG_PINCTRL_PFC_R8A73A4 is not set
> # CONFIG_PINCTRL_RZA1 is not set
> # CONFIG_PINCTRL_RZA2 is not set
> # CONFIG_PINCTRL_RZG2L is not set
> # CONFIG_PINCTRL_PFC_R8A77470 is not set
> # CONFIG_PINCTRL_PFC_R8A7745 is not set
> # CONFIG_PINCTRL_PFC_R8A7742 is not set
> # CONFIG_PINCTRL_PFC_R8A7743 is not set
> # CONFIG_PINCTRL_PFC_R8A7744 is not set
> # CONFIG_PINCTRL_PFC_R8A774C0 is not set
> # CONFIG_PINCTRL_PFC_R8A774E1 is not set
> # CONFIG_PINCTRL_PFC_R8A774A1 is not set
> # CONFIG_PINCTRL_PFC_R8A774B1 is not set
> # CONFIG_PINCTRL_RZN1 is not set
> # CONFIG_PINCTRL_RZV2M is not set
> # CONFIG_PINCTRL_PFC_SH7203 is not set
> # CONFIG_PINCTRL_PFC_SH7264 is not set
> # CONFIG_PINCTRL_PFC_SH7269 is not set
> # CONFIG_PINCTRL_PFC_SH7720 is not set
> # CONFIG_PINCTRL_PFC_SH7722 is not set
> # CONFIG_PINCTRL_PFC_SH7734 is not set
> # CONFIG_PINCTRL_PFC_SH7757 is not set
> # CONFIG_PINCTRL_PFC_SH7785 is not set
> # CONFIG_PINCTRL_PFC_SH7786 is not set
> # CONFIG_PINCTRL_PFC_SH73A0 is not set
> # CONFIG_PINCTRL_PFC_SH7723 is not set
> # CONFIG_PINCTRL_PFC_SH7724 is not set
> # CONFIG_PINCTRL_PFC_SHX3 is not set
> # end of Renesas pinctrl drivers
> 
> # CONFIG_PINCTRL_EXYNOS is not set
> # CONFIG_PINCTRL_S3C24XX is not set
> # CONFIG_PINCTRL_S3C64XX is not set
> # CONFIG_PINCTRL_SPRD_SC9860 is not set
> CONFIG_PINCTRL_STARFIVE_JH7100=y
> # CONFIG_PINCTRL_STM32F429 is not set
> # CONFIG_PINCTRL_STM32F469 is not set
> # CONFIG_PINCTRL_STM32F746 is not set
> # CONFIG_PINCTRL_STM32F769 is not set
> # CONFIG_PINCTRL_STM32H743 is not set
> # CONFIG_PINCTRL_STM32MP135 is not set
> # CONFIG_PINCTRL_STM32MP157 is not set
> # CONFIG_PINCTRL_TI_IODELAY is not set
> CONFIG_PINCTRL_UNIPHIER=y
> # CONFIG_PINCTRL_UNIPHIER_LD4 is not set
> # CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
> # CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
> # CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
> # CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
> # CONFIG_PINCTRL_UNIPHIER_LD6B is not set
> # CONFIG_PINCTRL_UNIPHIER_LD11 is not set
> # CONFIG_PINCTRL_UNIPHIER_LD20 is not set
> # CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
> # CONFIG_PINCTRL_UNIPHIER_NX1 is not set
> # CONFIG_PINCTRL_TMPV7700 is not set
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_OF_GPIO=y
> CONFIG_GPIOLIB_IRQCHIP=y
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=y
> CONFIG_GPIO_CDEV=y
> # CONFIG_GPIO_CDEV_V1 is not set
> CONFIG_GPIO_GENERIC=y
> CONFIG_GPIO_MAX730X=y
> 
> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=y
> CONFIG_GPIO_ALTERA=y
> # CONFIG_GPIO_ASPEED is not set
> # CONFIG_GPIO_ASPEED_SGPIO is not set
> # CONFIG_GPIO_ATH79 is not set
> # CONFIG_GPIO_RASPBERRYPI_EXP is not set
> # CONFIG_GPIO_BCM_KONA is not set
> # CONFIG_GPIO_BCM_XGS_IPROC is not set
> # CONFIG_GPIO_BRCMSTB is not set
> CONFIG_GPIO_CADENCE=y
> # CONFIG_GPIO_CLPS711X is not set
> CONFIG_GPIO_DWAPB=y
> # CONFIG_GPIO_EIC_SPRD is not set
> # CONFIG_GPIO_EM is not set
> CONFIG_GPIO_FTGPIO010=y
> CONFIG_GPIO_GENERIC_PLATFORM=y
> # CONFIG_GPIO_GRGPIO is not set
> # CONFIG_GPIO_HISI is not set
> # CONFIG_GPIO_HLWD is not set
> # CONFIG_GPIO_IOP is not set
> # CONFIG_GPIO_LOGICVC is not set
> # CONFIG_GPIO_LPC18XX is not set
> # CONFIG_GPIO_LPC32XX is not set
> CONFIG_GPIO_MB86S7X=y
> # CONFIG_GPIO_MENZ127 is not set
> # CONFIG_GPIO_MPC8XXX is not set
> # CONFIG_GPIO_MT7621 is not set
> # CONFIG_GPIO_MXC is not set
> # CONFIG_GPIO_MXS is not set
> # CONFIG_GPIO_PMIC_EIC_SPRD is not set
> # CONFIG_GPIO_PXA is not set
> # CONFIG_GPIO_RCAR is not set
> # CONFIG_GPIO_RDA is not set
> # CONFIG_GPIO_ROCKCHIP is not set
> # CONFIG_GPIO_SAMA5D2_PIOBU is not set
> # CONFIG_GPIO_SIFIVE is not set
> CONFIG_GPIO_SIOX=y
> # CONFIG_GPIO_SNPS_CREG is not set
> # CONFIG_GPIO_SPRD is not set
> # CONFIG_GPIO_STP_XWAY is not set
> CONFIG_GPIO_SYSCON=y
> # CONFIG_GPIO_TEGRA is not set
> # CONFIG_GPIO_TEGRA186 is not set
> # CONFIG_GPIO_TS4800 is not set
> # CONFIG_GPIO_UNIPHIER is not set
> # CONFIG_GPIO_VISCONTI is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_XGENE_SB is not set
> # CONFIG_GPIO_XILINX is not set
> # CONFIG_GPIO_XLP is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # CONFIG_GPIO_IDT3243X is not set
> # end of Memory mapped GPIO drivers
> 
> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADNP=y
> CONFIG_GPIO_GW_PLD=y
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=y
> CONFIG_GPIO_PCA953X_IRQ=y
> # CONFIG_GPIO_PCA9570 is not set
> CONFIG_GPIO_PCF857X=y
> CONFIG_GPIO_TPIC2810=y
> # CONFIG_GPIO_TS4900 is not set
> # end of I2C GPIO expanders
> 
> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ARIZONA is not set
> # CONFIG_GPIO_DA9052 is not set
> CONFIG_GPIO_KEMPLD=y
> # CONFIG_GPIO_LP3943 is not set
> CONFIG_GPIO_LP873X=y
> CONFIG_GPIO_LP87565=y
> CONFIG_GPIO_MAX77620=y
> CONFIG_GPIO_MAX77650=y
> # CONFIG_GPIO_SL28CPLD is not set
> CONFIG_GPIO_STMPE=y
> CONFIG_GPIO_TPS65086=y
> # CONFIG_GPIO_TPS65218 is not set
> CONFIG_GPIO_TPS65912=y
> # CONFIG_GPIO_TQMX86 is not set
> CONFIG_GPIO_TWL4030=y
> # CONFIG_GPIO_TWL6040 is not set
> CONFIG_GPIO_WM8350=y
> CONFIG_GPIO_WM8994=y
> # end of MFD GPIO expanders
> 
> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCH is not set
> CONFIG_GPIO_PCI_IDIO_16=y
> CONFIG_GPIO_PCIE_IDIO_24=y
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> 
> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_74X164=y
> CONFIG_GPIO_MAX3191X=y
> CONFIG_GPIO_MAX7301=y
> CONFIG_GPIO_MC33880=y
> CONFIG_GPIO_PISOSR=y
> CONFIG_GPIO_XRA1403=y
> # CONFIG_GPIO_MOXTET is not set
> # end of SPI GPIO expanders
> 
> #
> # Virtual GPIO drivers
> #
> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> CONFIG_GPIO_VIRTIO=y
> # CONFIG_GPIO_SIM is not set
> # end of Virtual GPIO drivers
> 
> CONFIG_W1=y
> 
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=y
> CONFIG_W1_MASTER_DS2482=y
> # CONFIG_W1_MASTER_MXC is not set
> CONFIG_W1_MASTER_DS1WM=y
> CONFIG_W1_MASTER_GPIO=y
> CONFIG_W1_MASTER_SGI=y
> # end of 1-wire Bus Masters
> 
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=y
> CONFIG_W1_SLAVE_SMEM=y
> CONFIG_W1_SLAVE_DS2405=y
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=y
> CONFIG_W1_SLAVE_DS2406=y
> CONFIG_W1_SLAVE_DS2423=y
> CONFIG_W1_SLAVE_DS2805=y
> CONFIG_W1_SLAVE_DS2430=y
> CONFIG_W1_SLAVE_DS2431=y
> CONFIG_W1_SLAVE_DS2433=y
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> # CONFIG_W1_SLAVE_DS2438 is not set
> CONFIG_W1_SLAVE_DS250X=y
> CONFIG_W1_SLAVE_DS2780=y
> CONFIG_W1_SLAVE_DS2781=y
> CONFIG_W1_SLAVE_DS28E04=y
> CONFIG_W1_SLAVE_DS28E17=y
> # end of 1-wire Slaves
> 
> CONFIG_POWER_RESET=y
> # CONFIG_POWER_RESET_AS3722 is not set
> CONFIG_POWER_RESET_ATC260X=y
> # CONFIG_POWER_RESET_BRCMKONA is not set
> # CONFIG_POWER_RESET_BRCMSTB is not set
> # CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
> CONFIG_POWER_RESET_GPIO=y
> CONFIG_POWER_RESET_GPIO_RESTART=y
> # CONFIG_POWER_RESET_OCELOT_RESET is not set
> # CONFIG_POWER_RESET_PIIX4_POWEROFF is not set
> # CONFIG_POWER_RESET_LTC2952 is not set
> CONFIG_POWER_RESET_REGULATOR=y
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_RESET_TPS65086=y
> # CONFIG_POWER_RESET_KEYSTONE is not set
> CONFIG_POWER_RESET_SYSCON=y
> CONFIG_POWER_RESET_SYSCON_POWEROFF=y
> # CONFIG_POWER_RESET_RMOBILE is not set
> # CONFIG_SYSCON_REBOOT_MODE is not set
> # CONFIG_POWER_RESET_SC27XX is not set
> # CONFIG_NVMEM_REBOOT_MODE is not set
> # CONFIG_POWER_SUPPLY is not set
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=y
> CONFIG_HWMON_DEBUG_CHIP=y
> 
> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=y
> CONFIG_SENSORS_AD7414=y
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1025 is not set
> CONFIG_SENSORS_ADM1026=y
> # CONFIG_SENSORS_ADM1029 is not set
> # CONFIG_SENSORS_ADM1031 is not set
> # CONFIG_SENSORS_ADM1177 is not set
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=y
> CONFIG_SENSORS_ADT7310=y
> CONFIG_SENSORS_ADT7410=y
> CONFIG_SENSORS_ADT7411=y
> CONFIG_SENSORS_ADT7462=y
> CONFIG_SENSORS_ADT7470=y
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_AHT10=y
> CONFIG_SENSORS_AS370=y
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ASPEED is not set
> # CONFIG_SENSORS_ATXP1 is not set
> # CONFIG_SENSORS_BT1_PVT is not set
> CONFIG_SENSORS_DRIVETEMP=y
> CONFIG_SENSORS_DS620=y
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DA9052_ADC=y
> CONFIG_SENSORS_I5K_AMB=y
> # CONFIG_SENSORS_SPARX5 is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=y
> # CONFIG_SENSORS_F75375S is not set
> CONFIG_SENSORS_GSC=y
> CONFIG_SENSORS_MC13783_ADC=y
> # CONFIG_SENSORS_FSCHMD is not set
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=y
> CONFIG_SENSORS_GL520SM=y
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_G762=y
> CONFIG_SENSORS_GPIO_FAN=y
> CONFIG_SENSORS_HIH6130=y
> # CONFIG_SENSORS_IIO_HWMON is not set
> CONFIG_SENSORS_IT87=y
> CONFIG_SENSORS_JC42=y
> CONFIG_SENSORS_POWR1220=y
> # CONFIG_SENSORS_LAN966X is not set
> CONFIG_SENSORS_LINEAGE=y
> CONFIG_SENSORS_LOCHNAGAR=y
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> # CONFIG_SENSORS_LTC2947_SPI is not set
> # CONFIG_SENSORS_LTC2990 is not set
> CONFIG_SENSORS_LTC2992=y
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=y
> CONFIG_SENSORS_LTC4245=y
> CONFIG_SENSORS_LTC4260=y
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX1111=y
> CONFIG_SENSORS_MAX127=y
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=y
> CONFIG_SENSORS_MAX1668=y
> CONFIG_SENSORS_MAX197=y
> CONFIG_SENSORS_MAX31722=y
> # CONFIG_SENSORS_MAX31730 is not set
> CONFIG_SENSORS_MAX31760=y
> # CONFIG_SENSORS_MAX6620 is not set
> CONFIG_SENSORS_MAX6621=y
> CONFIG_SENSORS_MAX6639=y
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=y
> CONFIG_SENSORS_MAX31790=y
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_TC654 is not set
> CONFIG_SENSORS_TPS23861=y
> CONFIG_SENSORS_MENF21BMC_HWMON=y
> # CONFIG_SENSORS_MR75203 is not set
> CONFIG_SENSORS_ADCXX=y
> CONFIG_SENSORS_LM63=y
> CONFIG_SENSORS_LM70=y
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=y
> CONFIG_SENSORS_LM77=y
> CONFIG_SENSORS_LM78=y
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=y
> CONFIG_SENSORS_LM85=y
> CONFIG_SENSORS_LM87=y
> CONFIG_SENSORS_LM90=y
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=y
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=y
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=y
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=y
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775_CORE=y
> CONFIG_SENSORS_NCT6775=y
> CONFIG_SENSORS_NCT6775_I2C=y
> CONFIG_SENSORS_NCT7802=y
> # CONFIG_SENSORS_NCT7904 is not set
> CONFIG_SENSORS_NPCM7XX=y
> # CONFIG_SENSORS_NSA320 is not set
> # CONFIG_SENSORS_OCC_P8_I2C is not set
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_SENSORS_PECI_CPUTEMP=y
> CONFIG_SENSORS_PECI_DIMMTEMP=y
> CONFIG_SENSORS_PECI=y
> CONFIG_PMBUS=y
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1266=y
> CONFIG_SENSORS_ADM1275=y
> CONFIG_SENSORS_BEL_PFE=y
> # CONFIG_SENSORS_BPA_RS600 is not set
> CONFIG_SENSORS_DELTA_AHE50DC_FAN=y
> # CONFIG_SENSORS_FSP_3Y is not set
> CONFIG_SENSORS_IBM_CFFPS=y
> CONFIG_SENSORS_DPS920AB=y
> CONFIG_SENSORS_INSPUR_IPSPS=y
> # CONFIG_SENSORS_IR35221 is not set
> CONFIG_SENSORS_IR36021=y
> CONFIG_SENSORS_IR38064=y
> # CONFIG_SENSORS_IR38064_REGULATOR is not set
> CONFIG_SENSORS_IRPS5401=y
> CONFIG_SENSORS_ISL68137=y
> CONFIG_SENSORS_LM25066=y
> CONFIG_SENSORS_LM25066_REGULATOR=y
> CONFIG_SENSORS_LT7182S=y
> # CONFIG_SENSORS_LTC2978 is not set
> CONFIG_SENSORS_LTC3815=y
> CONFIG_SENSORS_MAX15301=y
> CONFIG_SENSORS_MAX16064=y
> # CONFIG_SENSORS_MAX16601 is not set
> CONFIG_SENSORS_MAX20730=y
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_MP2888=y
> CONFIG_SENSORS_MP2975=y
> # CONFIG_SENSORS_MP5023 is not set
> CONFIG_SENSORS_PIM4328=y
> CONFIG_SENSORS_PLI1209BC=y
> CONFIG_SENSORS_PLI1209BC_REGULATOR=y
> # CONFIG_SENSORS_PM6764TR is not set
> CONFIG_SENSORS_PXE1610=y
> CONFIG_SENSORS_Q54SJ108A2=y
> CONFIG_SENSORS_STPDDC60=y
> CONFIG_SENSORS_TPS40422=y
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_TPS546D24=y
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=y
> CONFIG_SENSORS_XDPE152=y
> CONFIG_SENSORS_XDPE122=y
> CONFIG_SENSORS_XDPE122_REGULATOR=y
> CONFIG_SENSORS_ZL6100=y
> CONFIG_SENSORS_PWM_FAN=y
> # CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
> # CONFIG_SENSORS_SL28CPLD is not set
> CONFIG_SENSORS_SBTSI=y
> CONFIG_SENSORS_SBRMI=y
> CONFIG_SENSORS_SHT15=y
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=y
> CONFIG_SENSORS_SHT4x=y
> CONFIG_SENSORS_SHTC1=y
> CONFIG_SENSORS_SIS5595=y
> CONFIG_SENSORS_DME1737=y
> CONFIG_SENSORS_EMC1403=y
> CONFIG_SENSORS_EMC2103=y
> CONFIG_SENSORS_EMC2305=y
> CONFIG_SENSORS_EMC6W201=y
> CONFIG_SENSORS_SMSC47M1=y
> CONFIG_SENSORS_SMSC47M192=y
> CONFIG_SENSORS_SMSC47B397=y
> CONFIG_SENSORS_SCH56XX_COMMON=y
> CONFIG_SENSORS_SCH5627=y
> CONFIG_SENSORS_SCH5636=y
> CONFIG_SENSORS_STTS751=y
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=y
> CONFIG_SENSORS_INA209=y
> CONFIG_SENSORS_INA2XX=y
> CONFIG_SENSORS_INA238=y
> CONFIG_SENSORS_INA3221=y
> CONFIG_SENSORS_TC74=y
> CONFIG_SENSORS_THMC50=y
> CONFIG_SENSORS_TMP102=y
> CONFIG_SENSORS_TMP103=y
> CONFIG_SENSORS_TMP108=y
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=y
> # CONFIG_SENSORS_TMP464 is not set
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA686A=y
> CONFIG_SENSORS_VT1211=y
> # CONFIG_SENSORS_VT8231 is not set
> # CONFIG_SENSORS_W83773G is not set
> # CONFIG_SENSORS_W83781D is not set
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=y
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=y
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=y
> # CONFIG_SENSORS_WM8350 is not set
> # CONFIG_SENSORS_INTEL_M10_BMC_HWMON is not set
> CONFIG_THERMAL=y
> CONFIG_THERMAL_STATISTICS=y
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> CONFIG_THERMAL_HWMON=y
> # CONFIG_THERMAL_OF is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=y
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=y
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=y
> CONFIG_DEVFREQ_THERMAL=y
> CONFIG_THERMAL_EMULATION=y
> # CONFIG_THERMAL_MMIO is not set
> CONFIG_HISI_THERMAL=y
> # CONFIG_IMX_THERMAL is not set
> # CONFIG_IMX8MM_THERMAL is not set
> # CONFIG_K3_THERMAL is not set
> # CONFIG_MAX77620_THERMAL is not set
> # CONFIG_SPEAR_THERMAL is not set
> # CONFIG_SUN8I_THERMAL is not set
> # CONFIG_ROCKCHIP_THERMAL is not set
> # CONFIG_RCAR_THERMAL is not set
> # CONFIG_RCAR_GEN3_THERMAL is not set
> # CONFIG_RZG2L_THERMAL is not set
> # CONFIG_KIRKWOOD_THERMAL is not set
> # CONFIG_DOVE_THERMAL is not set
> # CONFIG_ARMADA_THERMAL is not set
> # CONFIG_DA9062_THERMAL is not set
> CONFIG_MTK_THERMAL=y
> 
> #
> # Intel thermal drivers
> #
> 
> #
> # ACPI INT340X thermal drivers
> #
> # end of ACPI INT340X thermal drivers
> # end of Intel thermal drivers
> 
> #
> # Broadcom thermal drivers
> #
> # CONFIG_BRCMSTB_THERMAL is not set
> # CONFIG_BCM_NS_THERMAL is not set
> # CONFIG_BCM_SR_THERMAL is not set
> # end of Broadcom thermal drivers
> 
> #
> # Texas Instruments thermal drivers
> #
> # CONFIG_TI_SOC_THERMAL is not set
> # end of Texas Instruments thermal drivers
> 
> #
> # Samsung thermal drivers
> #
> # end of Samsung thermal drivers
> 
> #
> # NVIDIA Tegra thermal drivers
> #
> # CONFIG_TEGRA_SOCTHERM is not set
> # CONFIG_TEGRA_BPMP_THERMAL is not set
> # CONFIG_TEGRA30_TSENSOR is not set
> # end of NVIDIA Tegra thermal drivers
> 
> CONFIG_GENERIC_ADC_THERMAL=y
> 
> #
> # Qualcomm thermal drivers
> #
> # end of Qualcomm thermal drivers
> 
> # CONFIG_SPRD_THERMAL is not set
> CONFIG_WATCHDOG=y
> CONFIG_WATCHDOG_CORE=y
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_OPEN_TIMEOUT=0
> CONFIG_WATCHDOG_SYSFS=y
> CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y
> 
> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> 
> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_DA9052_WATCHDOG=y
> # CONFIG_DA9055_WATCHDOG is not set
> # CONFIG_DA9063_WATCHDOG is not set
> # CONFIG_DA9062_WATCHDOG is not set
> CONFIG_GPIO_WATCHDOG=y
> # CONFIG_GPIO_WATCHDOG_ARCH_INITCALL is not set
> CONFIG_MENF21BMC_WATCHDOG=y
> CONFIG_MENZ069_WATCHDOG=y
> CONFIG_WM8350_WATCHDOG=y
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_SL28CPLD_WATCHDOG is not set
> # CONFIG_ARMADA_37XX_WATCHDOG is not set
> # CONFIG_ASM9260_WATCHDOG is not set
> # CONFIG_AT91RM9200_WATCHDOG is not set
> # CONFIG_AT91SAM9X_WATCHDOG is not set
> # CONFIG_SAMA5D4_WATCHDOG is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_FTWDT010_WATCHDOG is not set
> # CONFIG_S3C2410_WATCHDOG is not set
> CONFIG_DW_WATCHDOG=y
> # CONFIG_EP93XX_WATCHDOG is not set
> # CONFIG_OMAP_WATCHDOG is not set
> # CONFIG_PNX4008_WATCHDOG is not set
> # CONFIG_DAVINCI_WATCHDOG is not set
> # CONFIG_K3_RTI_WATCHDOG is not set
> # CONFIG_RN5T618_WATCHDOG is not set
> # CONFIG_SUNXI_WATCHDOG is not set
> # CONFIG_NPCM7XX_WATCHDOG is not set
> CONFIG_TWL4030_WATCHDOG=y
> # CONFIG_STMP3XXX_RTC_WATCHDOG is not set
> # CONFIG_TS4800_WATCHDOG is not set
> # CONFIG_TS72XX_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> # CONFIG_MAX77620_WATCHDOG is not set
> # CONFIG_IMX2_WDT is not set
> # CONFIG_IMX7ULP_WDT is not set
> # CONFIG_RETU_WATCHDOG is not set
> # CONFIG_MOXART_WDT is not set
> # CONFIG_ST_LPC_WATCHDOG is not set
> # CONFIG_TEGRA_WATCHDOG is not set
> # CONFIG_QCOM_WDT is not set
> # CONFIG_MESON_GXBB_WATCHDOG is not set
> # CONFIG_MESON_WATCHDOG is not set
> # CONFIG_MEDIATEK_WATCHDOG is not set
> # CONFIG_DIGICOLOR_WATCHDOG is not set
> # CONFIG_LPC18XX_WATCHDOG is not set
> # CONFIG_RENESAS_WDT is not set
> # CONFIG_RENESAS_RZAWDT is not set
> # CONFIG_RENESAS_RZN1WDT is not set
> # CONFIG_RENESAS_RZG2LWDT is not set
> # CONFIG_ASPEED_WATCHDOG is not set
> CONFIG_STPMIC1_WATCHDOG=y
> # CONFIG_UNIPHIER_WATCHDOG is not set
> # CONFIG_RTD119X_WATCHDOG is not set
> # CONFIG_REALTEK_OTTO_WDT is not set
> # CONFIG_SPRD_WATCHDOG is not set
> # CONFIG_VISCONTI_WATCHDOG is not set
> # CONFIG_MSC313E_WATCHDOG is not set
> # CONFIG_APPLE_WATCHDOG is not set
> # CONFIG_SUNPLUS_WATCHDOG is not set
> # CONFIG_ALIM7101_WDT is not set
> # CONFIG_SC520_WDT is not set
> # CONFIG_I6300ESB_WDT is not set
> CONFIG_KEMPLD_WDT=y
> # CONFIG_RDC321X_WDT is not set
> # CONFIG_BCM47XX_WDT is not set
> # CONFIG_BCM2835_WDT is not set
> # CONFIG_BCM_KONA_WDT is not set
> # CONFIG_BCM7038_WDT is not set
> # CONFIG_IMGPDC_WDT is not set
> # CONFIG_MPC5200_WDT is not set
> CONFIG_MEN_A21_WDT=y
> # CONFIG_UML_WATCHDOG is not set
> 
> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=y
> # CONFIG_WDTPCI is not set
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=y
> CONFIG_SSB_SPROM=y
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
> CONFIG_SSB_PCMCIAHOST=y
> CONFIG_SSB_SDIOHOST_POSSIBLE=y
> CONFIG_SSB_SDIOHOST=y
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=y
> CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> # CONFIG_BCMA_HOST_PCI is not set
> # CONFIG_BCMA_HOST_SOC is not set
> # CONFIG_BCMA_DRIVER_PCI is not set
> # CONFIG_BCMA_DRIVER_MIPS is not set
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=y
> # CONFIG_BCMA_DEBUG is not set
> 
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_ACT8945A=y
> # CONFIG_MFD_SUN4I_GPADC is not set
> CONFIG_MFD_AS3711=y
> CONFIG_MFD_AS3722=y
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=y
> # CONFIG_MFD_AT91_USART is not set
> CONFIG_MFD_ATMEL_FLEXCOM=y
> CONFIG_MFD_ATMEL_HLCDC=y
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> CONFIG_MFD_AXP20X=y
> CONFIG_MFD_AXP20X_I2C=y
> # CONFIG_MFD_MADERA is not set
> # CONFIG_MFD_ASIC3 is not set
> CONFIG_PMIC_DA903X=y
> CONFIG_PMIC_DA9052=y
> CONFIG_MFD_DA9052_SPI=y
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=y
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_ENE_KB3930 is not set
> # CONFIG_MFD_EXYNOS_LPASS is not set
> CONFIG_MFD_GATEWORKS_GSC=y
> CONFIG_MFD_MC13XXX=y
> CONFIG_MFD_MC13XXX_SPI=y
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_MFD_MP2629=y
> # CONFIG_MFD_MXS_LRADC is not set
> # CONFIG_MFD_MX25_TSADC is not set
> # CONFIG_MFD_HI6421_PMIC is not set
> # CONFIG_MFD_HI655X_PMIC is not set
> CONFIG_HTC_PASIC3=y
> CONFIG_HTC_I2CPLD=y
> # CONFIG_LPC_ICH is not set
> CONFIG_LPC_SCH=y
> CONFIG_MFD_IQS62X=y
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=y
> CONFIG_MFD_88PM800=y
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=y
> CONFIG_MFD_MAX77620=y
> CONFIG_MFD_MAX77650=y
> CONFIG_MFD_MAX77686=y
> CONFIG_MFD_MAX77693=y
> CONFIG_MFD_MAX77714=y
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=y
> # CONFIG_MFD_MT6370 is not set
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=y
> CONFIG_MFD_OCELOT=y
> CONFIG_EZX_PCAP=y
> # CONFIG_MFD_CPCAP is not set
> CONFIG_MFD_NTXEC=y
> CONFIG_MFD_RETU=y
> CONFIG_MFD_PCF50633=y
> CONFIG_PCF50633_ADC=y
> CONFIG_PCF50633_GPIO=y
> # CONFIG_MFD_PM8XXX is not set
> # CONFIG_MFD_SY7636A is not set
> CONFIG_MFD_RDC321X=y
> CONFIG_MFD_RT4831=y
> CONFIG_MFD_RT5033=y
> # CONFIG_MFD_RT5120 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_RK808 is not set
> CONFIG_MFD_RN5T618=y
> CONFIG_MFD_SEC_CORE=y
> # CONFIG_MFD_SI476X_CORE is not set
> # CONFIG_MFD_SL28CPLD is not set
> CONFIG_MFD_SM501=y
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_MFD_SKY81452=y
> # CONFIG_MFD_SC27XX_PMIC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_STMPE=y
> 
> #
> # STMicroelectronics STMPE Interface Drivers
> #
> CONFIG_STMPE_I2C=y
> CONFIG_STMPE_SPI=y
> # end of STMicroelectronics STMPE Interface Drivers
> 
> # CONFIG_MFD_SUN6I_PRCM is not set
> CONFIG_MFD_SYSCON=y
> CONFIG_MFD_TI_AM335X_TSCADC=y
> CONFIG_MFD_LP3943=y
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_TI_LMU=y
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=y
> CONFIG_TPS65010=y
> CONFIG_TPS6507X=y
> CONFIG_MFD_TPS65086=y
> CONFIG_MFD_TPS65090=y
> # CONFIG_MFD_TPS65217 is not set
> CONFIG_MFD_TI_LP873X=y
> CONFIG_MFD_TI_LP87565=y
> CONFIG_MFD_TPS65218=y
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=y
> CONFIG_MFD_TPS65912_I2C=y
> # CONFIG_MFD_TPS65912_SPI is not set
> CONFIG_TWL4030_CORE=y
> CONFIG_MFD_TWL4030_AUDIO=y
> CONFIG_TWL6040_CORE=y
> CONFIG_MFD_WL1273_CORE=y
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TQMX86 is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_LOCHNAGAR=y
> CONFIG_MFD_ARIZONA=y
> CONFIG_MFD_ARIZONA_I2C=y
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=y
> CONFIG_MFD_WM5110=y
> CONFIG_MFD_WM8997=y
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> CONFIG_MFD_WM8350=y
> CONFIG_MFD_WM8350_I2C=y
> CONFIG_MFD_WM8994=y
> # CONFIG_MFD_STW481X is not set
> # CONFIG_MFD_ROHM_BD718XX is not set
> # CONFIG_MFD_ROHM_BD71828 is not set
> # CONFIG_MFD_ROHM_BD957XMUF is not set
> # CONFIG_MFD_STM32_LPTIMER is not set
> # CONFIG_MFD_STM32_TIMERS is not set
> CONFIG_MFD_STPMIC1=y
> CONFIG_MFD_STMFX=y
> CONFIG_MFD_ATC260X=y
> CONFIG_MFD_ATC260X_I2C=y
> # CONFIG_MFD_KHADAS_MCU is not set
> # CONFIG_MFD_ACER_A500_EC is not set
> CONFIG_MFD_QCOM_PM8008=y
> CONFIG_MFD_INTEL_M10_BMC=y
> # CONFIG_MFD_RSMU_I2C is not set
> CONFIG_MFD_RSMU_SPI=y
> # end of Multifunction device drivers
> 
> CONFIG_REGULATOR=y
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=y
> CONFIG_REGULATOR_88PM800=y
> # CONFIG_REGULATOR_ACT8945A is not set
> # CONFIG_REGULATOR_AD5398 is not set
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AAT2870=y
> CONFIG_REGULATOR_AS3711=y
> CONFIG_REGULATOR_AS3722=y
> CONFIG_REGULATOR_ATC260X=y
> # CONFIG_REGULATOR_AXP20X is not set
> # CONFIG_REGULATOR_DA9052 is not set
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9121=y
> CONFIG_REGULATOR_DA9210=y
> CONFIG_REGULATOR_DA9211=y
> CONFIG_REGULATOR_FAN53555=y
> # CONFIG_REGULATOR_FAN53880 is not set
> # CONFIG_REGULATOR_GPIO is not set
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LM363X is not set
> CONFIG_REGULATOR_LOCHNAGAR=y
> CONFIG_REGULATOR_LP3971=y
> CONFIG_REGULATOR_LP3972=y
> CONFIG_REGULATOR_LP872X=y
> # CONFIG_REGULATOR_LP873X is not set
> CONFIG_REGULATOR_LP8755=y
> # CONFIG_REGULATOR_LP87565 is not set
> CONFIG_REGULATOR_LTC3589=y
> CONFIG_REGULATOR_LTC3676=y
> CONFIG_REGULATOR_MAX14577=y
> CONFIG_REGULATOR_MAX1586=y
> CONFIG_REGULATOR_MAX77620=y
> CONFIG_REGULATOR_MAX77650=y
> # CONFIG_REGULATOR_MAX8649 is not set
> CONFIG_REGULATOR_MAX8660=y
> CONFIG_REGULATOR_MAX8893=y
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8952=y
> CONFIG_REGULATOR_MAX20086=y
> CONFIG_REGULATOR_MAX77686=y
> # CONFIG_REGULATOR_MAX77693 is not set
> # CONFIG_REGULATOR_MAX77802 is not set
> CONFIG_REGULATOR_MAX77826=y
> CONFIG_REGULATOR_MC13XXX_CORE=y
> CONFIG_REGULATOR_MC13783=y
> CONFIG_REGULATOR_MC13892=y
> CONFIG_REGULATOR_MCP16502=y
> # CONFIG_REGULATOR_MP5416 is not set
> # CONFIG_REGULATOR_MP8859 is not set
> # CONFIG_REGULATOR_MP886X is not set
> CONFIG_REGULATOR_MPQ7920=y
> CONFIG_REGULATOR_MT6311=y
> # CONFIG_REGULATOR_MT6360 is not set
> # CONFIG_REGULATOR_PBIAS is not set
> # CONFIG_REGULATOR_PCA9450 is not set
> CONFIG_REGULATOR_PCAP=y
> # CONFIG_REGULATOR_PCF50633 is not set
> CONFIG_REGULATOR_PF8X00=y
> CONFIG_REGULATOR_PFUZE100=y
> CONFIG_REGULATOR_PV88060=y
> # CONFIG_REGULATOR_PV88080 is not set
> # CONFIG_REGULATOR_PV88090 is not set
> # CONFIG_REGULATOR_PWM is not set
> # CONFIG_REGULATOR_QCOM_RPMH is not set
> # CONFIG_REGULATOR_QCOM_SPMI is not set
> # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
> CONFIG_REGULATOR_RN5T618=y
> CONFIG_REGULATOR_RT4801=y
> CONFIG_REGULATOR_RT4831=y
> CONFIG_REGULATOR_RT5033=y
> # CONFIG_REGULATOR_RT5190A is not set
> CONFIG_REGULATOR_RT5759=y
> CONFIG_REGULATOR_RT6160=y
> CONFIG_REGULATOR_RT6245=y
> CONFIG_REGULATOR_RTQ2134=y
> # CONFIG_REGULATOR_RTMV20 is not set
> CONFIG_REGULATOR_RTQ6752=y
> CONFIG_REGULATOR_S2MPA01=y
> # CONFIG_REGULATOR_S2MPS11 is not set
> CONFIG_REGULATOR_S5M8767=y
> # CONFIG_REGULATOR_SC2731 is not set
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_SLG51000=y
> # CONFIG_REGULATOR_STM32_BOOSTER is not set
> # CONFIG_REGULATOR_STM32_VREFBUF is not set
> # CONFIG_REGULATOR_STM32_PWR is not set
> CONFIG_REGULATOR_STPMIC1=y
> # CONFIG_REGULATOR_TI_ABB is not set
> # CONFIG_REGULATOR_STW481X_VMMC is not set
> CONFIG_REGULATOR_SY8106A=y
> # CONFIG_REGULATOR_SY8824X is not set
> CONFIG_REGULATOR_SY8827N=y
> # CONFIG_REGULATOR_TPS51632 is not set
> CONFIG_REGULATOR_TPS6105X=y
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS6286X=y
> CONFIG_REGULATOR_TPS65023=y
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=y
> CONFIG_REGULATOR_TPS65090=y
> # CONFIG_REGULATOR_TPS65132 is not set
> CONFIG_REGULATOR_TPS65218=y
> CONFIG_REGULATOR_TPS6524X=y
> # CONFIG_REGULATOR_TPS65912 is not set
> # CONFIG_REGULATOR_TPS68470 is not set
> CONFIG_REGULATOR_TWL4030=y
> # CONFIG_REGULATOR_UNIPHIER is not set
> # CONFIG_REGULATOR_VCTRL is not set
> CONFIG_REGULATOR_WM8350=y
> CONFIG_REGULATOR_WM8994=y
> # CONFIG_REGULATOR_QCOM_LABIBB is not set
> CONFIG_CEC_CORE=y
> 
> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_SUPPORT=y
> CONFIG_CEC_CH7322=y
> # CONFIG_CEC_MESON_AO is not set
> # CONFIG_CEC_MESON_G12A_AO is not set
> # CONFIG_CEC_GPIO is not set
> # CONFIG_CEC_SAMSUNG_S5P is not set
> # CONFIG_CEC_STI is not set
> # CONFIG_CEC_STM32 is not set
> # CONFIG_CEC_TEGRA is not set
> # end of CEC support
> 
> CONFIG_MEDIA_SUPPORT=y
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
> 
> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=y
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
> CONFIG_MEDIA_RADIO_SUPPORT=y
> CONFIG_MEDIA_SDR_SUPPORT=y
> CONFIG_MEDIA_PLATFORM_SUPPORT=y
> CONFIG_MEDIA_TEST_SUPPORT=y
> # end of Media device types
> 
> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=y
> CONFIG_MEDIA_CONTROLLER=y
> CONFIG_DVB_CORE=y
> # end of Media core support
> 
> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2_I2C=y
> CONFIG_VIDEO_V4L2_SUBDEV_API=y
> CONFIG_VIDEO_ADV_DEBUG=y
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_VIDEO_TUNER=y
> CONFIG_V4L2_MEM2MEM_DEV=y
> CONFIG_V4L2_FLASH_LED_CLASS=y
> CONFIG_V4L2_FWNODE=y
> CONFIG_V4L2_ASYNC=y
> # end of Video4Linux options
> 
> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> CONFIG_MEDIA_CONTROLLER_REQUEST_API=y
> # end of Media controller options
> 
> #
> # Digital TV options
> #
> CONFIG_DVB_MMAP=y
> CONFIG_DVB_MAX_ADAPTERS=16
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> CONFIG_DVB_ULE_DEBUG=y
> # end of Digital TV options
> 
> #
> # Media drivers
> #
> 
> #
> # Media drivers
> #
> CONFIG_MEDIA_PCI_SUPPORT=y
> 
> #
> # Media capture support
> #
> # CONFIG_STA2X11_VIP is not set
> # CONFIG_VIDEO_TW5864 is not set
> # CONFIG_VIDEO_TW68 is not set
> CONFIG_VIDEO_ZORAN=y
> # CONFIG_VIDEO_ZORAN_DC30 is not set
> # CONFIG_VIDEO_ZORAN_ZR36060 is not set
> 
> #
> # Media capture/analog TV support
> #
> CONFIG_VIDEO_DT3155=y
> 
> #
> # Media capture/analog/hybrid TV support
> #
> # CONFIG_VIDEO_CX25821 is not set
> CONFIG_VIDEO_SAA7134=y
> # CONFIG_VIDEO_SAA7134_DVB is not set
> # CONFIG_VIDEO_SAA7164 is not set
> 
> #
> # Media digital TV PCI Adapters
> #
> # CONFIG_DVB_B2C2_FLEXCOP_PCI is not set
> # CONFIG_DVB_DDBRIDGE is not set
> # CONFIG_DVB_NETUP_UNIDVB is not set
> CONFIG_DVB_NGENE=y
> CONFIG_DVB_PLUTO2=y
> # CONFIG_DVB_PT1 is not set
> CONFIG_DVB_PT3=y
> # CONFIG_RADIO_ADAPTERS is not set
> CONFIG_MEDIA_PLATFORM_DRIVERS=y
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> 
> #
> # Allegro DVT media platform drivers
> #
> 
> #
> # Amlogic media platform drivers
> #
> 
> #
> # Amphion drivers
> #
> 
> #
> # Aspeed media platform drivers
> #
> 
> #
> # Atmel media platform drivers
> #
> 
> #
> # Cadence media platform drivers
> #
> CONFIG_VIDEO_CADENCE_CSI2RX=y
> # CONFIG_VIDEO_CADENCE_CSI2TX is not set
> 
> #
> # Chips&Media media platform drivers
> #
> 
> #
> # Intel media platform drivers
> #
> 
> #
> # Marvell media platform drivers
> #
> 
> #
> # Mediatek media platform drivers
> #
> # CONFIG_VIDEO_MEDIATEK_MDP3 is not set
> 
> #
> # NVidia media platform drivers
> #
> 
> #
> # NXP media platform drivers
> #
> # CONFIG_VIDEO_IMX_MIPI_CSIS is not set
> 
> #
> # Qualcomm media platform drivers
> #
> 
> #
> # Renesas media platform drivers
> #
> 
> #
> # Rockchip media platform drivers
> #
> 
> #
> # Samsung media platform drivers
> #
> 
> #
> # STMicroelectronics media platform drivers
> #
> 
> #
> # Sunxi media platform drivers
> #
> 
> #
> # Texas Instruments drivers
> #
> 
> #
> # Verisilicon media platform drivers
> #
> 
> #
> # VIA media platform drivers
> #
> 
> #
> # Xilinx media platform drivers
> #
> 
> #
> # MMC/SDIO DVB adapters
> #
> CONFIG_SMS_SDIO_DRV=y
> CONFIG_V4L_TEST_DRIVERS=y
> CONFIG_VIDEO_VIM2M=y
> CONFIG_VIDEO_VICODEC=y
> CONFIG_VIDEO_VIMC=y
> CONFIG_VIDEO_VIVID=y
> CONFIG_VIDEO_VIVID_CEC=y
> CONFIG_VIDEO_VIVID_MAX_DEVS=64
> # CONFIG_DVB_TEST_DRIVERS is not set
> CONFIG_MEDIA_COMMON_OPTIONS=y
> 
> #
> # common driver options
> #
> CONFIG_VIDEO_TVEEPROM=y
> CONFIG_SMS_SIANO_MDTV=y
> CONFIG_VIDEO_V4L2_TPG=y
> CONFIG_VIDEOBUF2_CORE=y
> CONFIG_VIDEOBUF2_V4L2=y
> CONFIG_VIDEOBUF2_MEMOPS=y
> CONFIG_VIDEOBUF2_DMA_CONTIG=y
> CONFIG_VIDEOBUF2_VMALLOC=y
> CONFIG_VIDEOBUF2_DMA_SG=y
> # end of Media drivers
> 
> #
> # Media ancillary drivers
> #
> 
> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_APTINA_PLL=y
> CONFIG_VIDEO_CCS_PLL=y
> CONFIG_VIDEO_AR0521=y
> CONFIG_VIDEO_HI556=y
> # CONFIG_VIDEO_HI846 is not set
> # CONFIG_VIDEO_HI847 is not set
> CONFIG_VIDEO_IMX208=y
> # CONFIG_VIDEO_IMX214 is not set
> CONFIG_VIDEO_IMX219=y
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> CONFIG_VIDEO_IMX290=y
> # CONFIG_VIDEO_IMX319 is not set
> CONFIG_VIDEO_IMX334=y
> # CONFIG_VIDEO_IMX335 is not set
> CONFIG_VIDEO_IMX355=y
> CONFIG_VIDEO_IMX412=y
> CONFIG_VIDEO_MAX9271_LIB=y
> CONFIG_VIDEO_MT9M001=y
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> CONFIG_VIDEO_MT9P031=y
> CONFIG_VIDEO_MT9T001=y
> CONFIG_VIDEO_MT9T112=y
> CONFIG_VIDEO_MT9V011=y
> # CONFIG_VIDEO_MT9V032 is not set
> # CONFIG_VIDEO_MT9V111 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> # CONFIG_VIDEO_OG01A1B is not set
> CONFIG_VIDEO_OV02A10=y
> # CONFIG_VIDEO_OV08D10 is not set
> CONFIG_VIDEO_OV13858=y
> CONFIG_VIDEO_OV13B10=y
> # CONFIG_VIDEO_OV2640 is not set
> CONFIG_VIDEO_OV2659=y
> CONFIG_VIDEO_OV2680=y
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> CONFIG_VIDEO_OV5640=y
> # CONFIG_VIDEO_OV5645 is not set
> CONFIG_VIDEO_OV5647=y
> CONFIG_VIDEO_OV5648=y
> # CONFIG_VIDEO_OV5670 is not set
> CONFIG_VIDEO_OV5675=y
> CONFIG_VIDEO_OV5693=y
> CONFIG_VIDEO_OV5695=y
> CONFIG_VIDEO_OV6650=y
> # CONFIG_VIDEO_OV7251 is not set
> CONFIG_VIDEO_OV7640=y
> CONFIG_VIDEO_OV7670=y
> CONFIG_VIDEO_OV772X=y
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> CONFIG_VIDEO_OV8865=y
> CONFIG_VIDEO_OV9282=y
> CONFIG_VIDEO_OV9640=y
> # CONFIG_VIDEO_OV9650 is not set
> # CONFIG_VIDEO_OV9734 is not set
> CONFIG_VIDEO_RDACM20=y
> # CONFIG_VIDEO_RDACM21 is not set
> CONFIG_VIDEO_RJ54N1=y
> CONFIG_VIDEO_S5C73M3=y
> CONFIG_VIDEO_S5K4ECGX=y
> # CONFIG_VIDEO_S5K5BAF is not set
> CONFIG_VIDEO_S5K6A3=y
> CONFIG_VIDEO_S5K6AA=y
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_VS6624 is not set
> CONFIG_VIDEO_CCS=y
> CONFIG_VIDEO_ET8EK8=y
> CONFIG_VIDEO_M5MOLS=y
> # end of Camera sensor devices
> 
> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> CONFIG_VIDEO_AK7375=y
> CONFIG_VIDEO_DW9714=y
> # CONFIG_VIDEO_DW9768 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> # end of Lens drivers
> 
> #
> # Flash devices
> #
> CONFIG_VIDEO_ADP1653=y
> CONFIG_VIDEO_LM3560=y
> CONFIG_VIDEO_LM3646=y
> # end of Flash devices
> 
> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_CS3308 is not set
> # CONFIG_VIDEO_CS5345 is not set
> CONFIG_VIDEO_CS53L32A=y
> CONFIG_VIDEO_MSP3400=y
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> CONFIG_VIDEO_TDA7432=y
> CONFIG_VIDEO_TDA9840=y
> CONFIG_VIDEO_TEA6415C=y
> CONFIG_VIDEO_TEA6420=y
> CONFIG_VIDEO_TLV320AIC23B=y
> # CONFIG_VIDEO_TVAUDIO is not set
> CONFIG_VIDEO_UDA1342=y
> CONFIG_VIDEO_VP27SMPX=y
> CONFIG_VIDEO_WM8739=y
> CONFIG_VIDEO_WM8775=y
> # end of Audio decoders, processors and mixers
> 
> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=y
> # end of RDS decoders
> 
> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=y
> CONFIG_VIDEO_ADV7183=y
> CONFIG_VIDEO_ADV748X=y
> CONFIG_VIDEO_ADV7604=y
> CONFIG_VIDEO_ADV7604_CEC=y
> CONFIG_VIDEO_ADV7842=y
> # CONFIG_VIDEO_ADV7842_CEC is not set
> CONFIG_VIDEO_BT819=y
> CONFIG_VIDEO_BT856=y
> CONFIG_VIDEO_BT866=y
> CONFIG_VIDEO_ISL7998X=y
> CONFIG_VIDEO_KS0127=y
> CONFIG_VIDEO_MAX9286=y
> # CONFIG_VIDEO_ML86V7667 is not set
> CONFIG_VIDEO_SAA7110=y
> CONFIG_VIDEO_SAA711X=y
> CONFIG_VIDEO_TC358743=y
> CONFIG_VIDEO_TC358743_CEC=y
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> CONFIG_VIDEO_TW2804=y
> CONFIG_VIDEO_TW9903=y
> CONFIG_VIDEO_TW9906=y
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> 
> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> CONFIG_VIDEO_CX25840=y
> # end of Video decoders
> 
> #
> # Video encoders
> #
> CONFIG_VIDEO_AD9389B=y
> CONFIG_VIDEO_ADV7170=y
> CONFIG_VIDEO_ADV7175=y
> CONFIG_VIDEO_ADV7343=y
> CONFIG_VIDEO_ADV7393=y
> # CONFIG_VIDEO_ADV7511 is not set
> CONFIG_VIDEO_AK881X=y
> CONFIG_VIDEO_SAA7127=y
> CONFIG_VIDEO_SAA7185=y
> CONFIG_VIDEO_THS8200=y
> # end of Video encoders
> 
> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=y
> CONFIG_VIDEO_UPD64083=y
> # end of Video improvement chips
> 
> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=y
> # end of Audio/Video compression chips
> 
> #
> # SDR tuner chips
> #
> CONFIG_SDR_MAX2175=y
> # end of SDR tuner chips
> 
> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_M52790 is not set
> CONFIG_VIDEO_ST_MIPID02=y
> CONFIG_VIDEO_THS7303=y
> # end of Miscellaneous helper chips
> 
> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=y
> # CONFIG_VIDEO_GS1662 is not set
> # end of Media SPI Adapters
> 
> CONFIG_MEDIA_TUNER=y
> 
> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_E4000=y
> CONFIG_MEDIA_TUNER_FC0011=y
> CONFIG_MEDIA_TUNER_FC0012=y
> CONFIG_MEDIA_TUNER_FC0013=y
> CONFIG_MEDIA_TUNER_FC2580=y
> CONFIG_MEDIA_TUNER_IT913X=y
> CONFIG_MEDIA_TUNER_M88RS6000T=y
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> CONFIG_MEDIA_TUNER_MC44S803=y
> CONFIG_MEDIA_TUNER_MSI001=y
> CONFIG_MEDIA_TUNER_MT2060=y
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> CONFIG_MEDIA_TUNER_MT20XX=y
> CONFIG_MEDIA_TUNER_MT2131=y
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> CONFIG_MEDIA_TUNER_MXL301RF=y
> CONFIG_MEDIA_TUNER_MXL5005S=y
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> CONFIG_MEDIA_TUNER_QM1D1B0004=y
> CONFIG_MEDIA_TUNER_QM1D1C0042=y
> # CONFIG_MEDIA_TUNER_QT1010 is not set
> # CONFIG_MEDIA_TUNER_R820T is not set
> # CONFIG_MEDIA_TUNER_SI2157 is not set
> CONFIG_MEDIA_TUNER_SIMPLE=y
> CONFIG_MEDIA_TUNER_TDA18212=y
> CONFIG_MEDIA_TUNER_TDA18218=y
> CONFIG_MEDIA_TUNER_TDA18250=y
> CONFIG_MEDIA_TUNER_TDA18271=y
> CONFIG_MEDIA_TUNER_TDA827X=y
> CONFIG_MEDIA_TUNER_TDA8290=y
> CONFIG_MEDIA_TUNER_TDA9887=y
> CONFIG_MEDIA_TUNER_TEA5761=y
> CONFIG_MEDIA_TUNER_TEA5767=y
> CONFIG_MEDIA_TUNER_TUA9001=y
> CONFIG_MEDIA_TUNER_XC2028=y
> CONFIG_MEDIA_TUNER_XC4000=y
> CONFIG_MEDIA_TUNER_XC5000=y
> # end of Customize TV tuners
> 
> #
> # Customise DVB Frontends
> #
> 
> #
> # Multistandard (satellite) frontends
> #
> # CONFIG_DVB_M88DS3103 is not set
> CONFIG_DVB_MXL5XX=y
> # CONFIG_DVB_STB0899 is not set
> CONFIG_DVB_STB6100=y
> CONFIG_DVB_STV090x=y
> CONFIG_DVB_STV0910=y
> CONFIG_DVB_STV6110x=y
> CONFIG_DVB_STV6111=y
> 
> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=y
> CONFIG_DVB_MN88472=y
> CONFIG_DVB_MN88473=y
> CONFIG_DVB_SI2165=y
> CONFIG_DVB_TDA18271C2DD=y
> 
> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=y
> # CONFIG_DVB_CX24116 is not set
> CONFIG_DVB_CX24117=y
> CONFIG_DVB_CX24120=y
> CONFIG_DVB_CX24123=y
> CONFIG_DVB_DS3000=y
> CONFIG_DVB_MB86A16=y
> CONFIG_DVB_MT312=y
> CONFIG_DVB_S5H1420=y
> CONFIG_DVB_SI21XX=y
> CONFIG_DVB_STB6000=y
> # CONFIG_DVB_STV0288 is not set
> CONFIG_DVB_STV0299=y
> CONFIG_DVB_STV0900=y
> CONFIG_DVB_STV6110=y
> CONFIG_DVB_TDA10071=y
> CONFIG_DVB_TDA10086=y
> # CONFIG_DVB_TDA8083 is not set
> # CONFIG_DVB_TDA8261 is not set
> CONFIG_DVB_TDA826X=y
> # CONFIG_DVB_TS2020 is not set
> CONFIG_DVB_TUA6100=y
> CONFIG_DVB_TUNER_CX24113=y
> CONFIG_DVB_TUNER_ITD1000=y
> CONFIG_DVB_VES1X93=y
> CONFIG_DVB_ZL10036=y
> CONFIG_DVB_ZL10039=y
> 
> #
> # DVB-T (terrestrial) frontends
> #
> # CONFIG_DVB_AF9013 is not set
> # CONFIG_DVB_CX22700 is not set
> # CONFIG_DVB_CX22702 is not set
> CONFIG_DVB_CXD2820R=y
> CONFIG_DVB_CXD2841ER=y
> CONFIG_DVB_DIB3000MB=y
> CONFIG_DVB_DIB3000MC=y
> # CONFIG_DVB_DIB7000M is not set
> CONFIG_DVB_DIB7000P=y
> # CONFIG_DVB_DIB9000 is not set
> CONFIG_DVB_DRXD=y
> CONFIG_DVB_EC100=y
> CONFIG_DVB_L64781=y
> CONFIG_DVB_MT352=y
> CONFIG_DVB_NXT6000=y
> # CONFIG_DVB_RTL2830 is not set
> CONFIG_DVB_RTL2832=y
> CONFIG_DVB_S5H1432=y
> CONFIG_DVB_SI2168=y
> # CONFIG_DVB_SP887X is not set
> CONFIG_DVB_STV0367=y
> # CONFIG_DVB_TDA10048 is not set
> CONFIG_DVB_TDA1004X=y
> CONFIG_DVB_ZD1301_DEMOD=y
> CONFIG_DVB_ZL10353=y
> # CONFIG_DVB_CXD2880 is not set
> 
> #
> # DVB-C (cable) frontends
> #
> # CONFIG_DVB_STV0297 is not set
> # CONFIG_DVB_TDA10021 is not set
> CONFIG_DVB_TDA10023=y
> # CONFIG_DVB_VES1820 is not set
> 
> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_AU8522=y
> # CONFIG_DVB_AU8522_DTV is not set
> CONFIG_DVB_AU8522_V4L=y
> # CONFIG_DVB_BCM3510 is not set
> CONFIG_DVB_LG2160=y
> CONFIG_DVB_LGDT3305=y
> CONFIG_DVB_LGDT3306A=y
> CONFIG_DVB_LGDT330X=y
> CONFIG_DVB_MXL692=y
> CONFIG_DVB_NXT200X=y
> CONFIG_DVB_OR51132=y
> # CONFIG_DVB_OR51211 is not set
> # CONFIG_DVB_S5H1409 is not set
> CONFIG_DVB_S5H1411=y
> 
> #
> # ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_DIB8000 is not set
> CONFIG_DVB_MB86A20S=y
> # CONFIG_DVB_S921 is not set
> 
> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_MN88443X=y
> CONFIG_DVB_TC90522=y
> 
> #
> # Digital terrestrial only tuners/PLL
> #
> # CONFIG_DVB_PLL is not set
> CONFIG_DVB_TUNER_DIB0070=y
> CONFIG_DVB_TUNER_DIB0090=y
> 
> #
> # SEC control devices for DVB-S
> #
> # CONFIG_DVB_A8293 is not set
> CONFIG_DVB_AF9033=y
> CONFIG_DVB_ASCOT2E=y
> CONFIG_DVB_ATBM8830=y
> CONFIG_DVB_HELENE=y
> CONFIG_DVB_HORUS3A=y
> # CONFIG_DVB_ISL6405 is not set
> CONFIG_DVB_ISL6421=y
> CONFIG_DVB_ISL6423=y
> # CONFIG_DVB_IX2505V is not set
> CONFIG_DVB_LGS8GL5=y
> CONFIG_DVB_LGS8GXX=y
> CONFIG_DVB_LNBH25=y
> # CONFIG_DVB_LNBH29 is not set
> CONFIG_DVB_LNBP21=y
> CONFIG_DVB_LNBP22=y
> CONFIG_DVB_M88RS2000=y
> # CONFIG_DVB_TDA665x is not set
> # CONFIG_DVB_DRX39XYJ is not set
> 
> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=y
> CONFIG_DVB_SP2=y
> # end of Customise DVB Frontends
> 
> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=y
> # end of Media ancillary drivers
> 
> #
> # Graphics support
> #
> # CONFIG_IMX_IPUV3_CORE is not set
> # CONFIG_DRM is not set
> # CONFIG_DRM_DEBUG_MODESET_LOCK is not set
> 
> #
> # ARM devices
> #
> # end of ARM devices
> 
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=y
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_DDC=y
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> CONFIG_FB_FOREIGN_ENDIAN=y
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=y
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_SVGALIB=y
> CONFIG_FB_BACKLIGHT=y
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
> 
> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=y
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CLPS711X is not set
> # CONFIG_FB_IMX is not set
> CONFIG_FB_CYBER2000=y
> # CONFIG_FB_CYBER2000_DDC is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_CONTROL is not set
> CONFIG_FB_ASILIANT=y
> CONFIG_FB_IMSTT=y
> # CONFIG_FB_EFI is not set
> # CONFIG_FB_GBE is not set
> # CONFIG_FB_PVR2 is not set
> CONFIG_FB_OPENCORES=y
> CONFIG_FB_S1D13XXX=y
> # CONFIG_FB_ATMEL is not set
> # CONFIG_FB_NVIDIA is not set
> CONFIG_FB_RIVA=y
> # CONFIG_FB_RIVA_I2C is not set
> CONFIG_FB_RIVA_DEBUG=y
> CONFIG_FB_RIVA_BACKLIGHT=y
> # CONFIG_FB_I740 is not set
> CONFIG_FB_MATROX=y
> CONFIG_FB_MATROX_MILLENIUM=y
> CONFIG_FB_MATROX_MYSTIQUE=y
> # CONFIG_FB_MATROX_G is not set
> CONFIG_FB_MATROX_I2C=y
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> CONFIG_FB_S3=y
> CONFIG_FB_S3_DDC=y
> # CONFIG_FB_SAVAGE is not set
> CONFIG_FB_SIS=y
> CONFIG_FB_SIS_300=y
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=y
> CONFIG_FB_3DFX=y
> # CONFIG_FB_3DFX_ACCEL is not set
> # CONFIG_FB_3DFX_I2C is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=y
> CONFIG_FB_ARK=y
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_WM8505 is not set
> # CONFIG_FB_PXA168 is not set
> # CONFIG_FB_W100 is not set
> # CONFIG_FB_SH_MOBILE_LCDC is not set
> # CONFIG_FB_TMIO is not set
> # CONFIG_FB_S3C is not set
> CONFIG_FB_SM501=y
> CONFIG_FB_IBM_GXT4500=y
> CONFIG_FB_GOLDFISH=y
> # CONFIG_FB_DA8XX is not set
> CONFIG_FB_VIRTUAL=y
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_BROADSHEET is not set
> # CONFIG_FB_SIMPLE is not set
> CONFIG_FB_SSD1307=y
> CONFIG_FB_SM712=y
> CONFIG_FB_OMAP_LCD_H3=y
> # CONFIG_FB_OMAP2 is not set
> # CONFIG_MMP_DISP is not set
> # end of Frame buffer Devices
> 
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=y
> CONFIG_LCD_L4F00242T03=y
> CONFIG_LCD_LMS283GF05=y
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> CONFIG_LCD_ILI9320=y
> # CONFIG_LCD_TDO24M is not set
> CONFIG_LCD_VGG2432A4=y
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_LCD_AMS369FG06=y
> # CONFIG_LCD_LMS501KF03 is not set
> CONFIG_LCD_HX8357=y
> CONFIG_LCD_OTM3225A=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_KTD253=y
> # CONFIG_BACKLIGHT_OMAP1 is not set
> CONFIG_BACKLIGHT_PWM=y
> CONFIG_BACKLIGHT_DA903X=y
> # CONFIG_BACKLIGHT_DA9052 is not set
> CONFIG_BACKLIGHT_QCOM_WLED=y
> CONFIG_BACKLIGHT_RT4831=y
> CONFIG_BACKLIGHT_ADP8860=y
> CONFIG_BACKLIGHT_ADP8870=y
> # CONFIG_BACKLIGHT_PCF50633 is not set
> # CONFIG_BACKLIGHT_AAT2870 is not set
> CONFIG_BACKLIGHT_LM3630A=y
> CONFIG_BACKLIGHT_LM3639=y
> CONFIG_BACKLIGHT_LP855X=y
> CONFIG_BACKLIGHT_PANDORA=y
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_AS3711=y
> CONFIG_BACKLIGHT_GPIO=y
> CONFIG_BACKLIGHT_LV5207LP=y
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> CONFIG_BACKLIGHT_LED=y
> # end of Backlight & LCD device support
> 
> CONFIG_VGASTATE=y
> CONFIG_HDMI=y
> # CONFIG_LOGO is not set
> # end of Graphics support
> 
> # CONFIG_SOUND is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> # CONFIG_USB_SUPPORT is not set
> CONFIG_MMC=y
> CONFIG_PWRSEQ_EMMC=y
> CONFIG_PWRSEQ_SIMPLE=y
> CONFIG_MMC_BLOCK=y
> CONFIG_MMC_BLOCK_MINORS=8
> CONFIG_SDIO_UART=y
> # CONFIG_MMC_TEST is not set
> CONFIG_MMC_CRYPTO=y
> 
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=y
> # CONFIG_MMC_SDHCI_PCI is not set
> CONFIG_MMC_SDHCI_PLTFM=y
> CONFIG_MMC_SDHCI_OF_ARASAN=y
> # CONFIG_MMC_SDHCI_OF_ASPEED is not set
> # CONFIG_MMC_SDHCI_OF_AT91 is not set
> # CONFIG_MMC_SDHCI_OF_ESDHC is not set
> CONFIG_MMC_SDHCI_OF_DWCMSHC=y
> # CONFIG_MMC_SDHCI_OF_SPARX5 is not set
> CONFIG_MMC_SDHCI_CADENCE=y
> # CONFIG_MMC_SDHCI_CNS3XXX is not set
> # CONFIG_MMC_SDHCI_ESDHC_IMX is not set
> # CONFIG_MMC_SDHCI_DOVE is not set
> # CONFIG_MMC_SDHCI_TEGRA is not set
> # CONFIG_MMC_SDHCI_S3C is not set
> # CONFIG_MMC_SDHCI_PXAV3 is not set
> # CONFIG_MMC_SDHCI_PXAV2 is not set
> # CONFIG_MMC_SDHCI_SPEAR is not set
> # CONFIG_MMC_SDHCI_BCM_KONA is not set
> CONFIG_MMC_SDHCI_F_SDH30=y
> # CONFIG_MMC_SDHCI_MILBEAUT is not set
> # CONFIG_MMC_SDHCI_IPROC is not set
> # CONFIG_MMC_MESON_GX is not set
> # CONFIG_MMC_MESON_MX_SDHC is not set
> # CONFIG_MMC_MESON_MX_SDIO is not set
> # CONFIG_MMC_MOXART is not set
> # CONFIG_MMC_SDHCI_ST is not set
> # CONFIG_MMC_OMAP_HS is not set
> CONFIG_MMC_ALCOR=y
> # CONFIG_MMC_SDHCI_MSM is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_DAVINCI is not set
> CONFIG_MMC_SPI=y
> # CONFIG_MMC_S3C is not set
> CONFIG_MMC_SDRICOH_CS=y
> # CONFIG_MMC_SDHCI_SPRD is not set
> # CONFIG_MMC_TMIO is not set
> # CONFIG_MMC_SDHI is not set
> # CONFIG_MMC_UNIPHIER is not set
> # CONFIG_MMC_CB710 is not set
> CONFIG_MMC_VIA_SDMMC=y
> # CONFIG_MMC_DW is not set
> # CONFIG_MMC_SH_MMCIF is not set
> CONFIG_MMC_USDHI6ROL0=y
> CONFIG_MMC_REALTEK_PCI=y
> CONFIG_MMC_CQHCI=y
> CONFIG_MMC_HSQ=y
> CONFIG_MMC_TOSHIBA_PCI=y
> # CONFIG_MMC_BCM2835 is not set
> CONFIG_MMC_MTK=y
> CONFIG_MMC_SDHCI_XENON=y
> # CONFIG_MMC_SDHCI_OMAP is not set
> # CONFIG_MMC_SDHCI_AM654 is not set
> # CONFIG_MMC_OWL is not set
> CONFIG_MMC_LITEX=y
> CONFIG_SCSI_UFSHCD=y
> CONFIG_SCSI_UFS_BSG=y
> CONFIG_SCSI_UFS_CRYPTO=y
> # CONFIG_SCSI_UFS_HPB is not set
> CONFIG_SCSI_UFS_FAULT_INJECTION=y
> CONFIG_SCSI_UFS_HWMON=y
> CONFIG_SCSI_UFSHCD_PCI=y
> CONFIG_SCSI_UFS_DWC_TC_PCI=y
> CONFIG_SCSI_UFSHCD_PLATFORM=y
> # CONFIG_SCSI_UFS_CDNS_PLATFORM is not set
> # CONFIG_SCSI_UFS_DWC_TC_PLATFORM is not set
> # CONFIG_SCSI_UFS_HISI is not set
> # CONFIG_SCSI_UFS_RENESAS is not set
> # CONFIG_SCSI_UFS_TI_J721E is not set
> # CONFIG_SCSI_UFS_EXYNOS is not set
> CONFIG_MEMSTICK=y
> # CONFIG_MEMSTICK_DEBUG is not set
> 
> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> # CONFIG_MSPRO_BLOCK is not set
> # CONFIG_MS_BLOCK is not set
> 
> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=y
> CONFIG_MEMSTICK_JMICRON_38X=y
> # CONFIG_MEMSTICK_R592 is not set
> # CONFIG_MEMSTICK_REALTEK_PCI is not set
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
> CONFIG_LEDS_CLASS_FLASH=y
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> 
> #
> # LED drivers
> #
> CONFIG_LEDS_AN30259A=y
> # CONFIG_LEDS_ARIEL is not set
> CONFIG_LEDS_AW2013=y
> CONFIG_LEDS_BCM6328=y
> CONFIG_LEDS_BCM6358=y
> CONFIG_LEDS_CR0014114=y
> CONFIG_LEDS_EL15203000=y
> # CONFIG_LEDS_LM3530 is not set
> CONFIG_LEDS_LM3532=y
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_LM3692X=y
> # CONFIG_LEDS_S3C24XX is not set
> # CONFIG_LEDS_COBALT_QUBE is not set
> # CONFIG_LEDS_COBALT_RAQ is not set
> CONFIG_LEDS_GPIO=y
> CONFIG_LEDS_LP3944=y
> CONFIG_LEDS_LP3952=y
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_LP55XX_COMMON=y
> CONFIG_LEDS_LP5521=y
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=y
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_PCA955X=y
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=y
> # CONFIG_LEDS_WM8350 is not set
> CONFIG_LEDS_DA903X=y
> CONFIG_LEDS_DA9052=y
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_PWM=y
> CONFIG_LEDS_REGULATOR=y
> CONFIG_LEDS_BD2802=y
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_MC13783=y
> CONFIG_LEDS_NS2=y
> CONFIG_LEDS_NETXBIG=y
> CONFIG_LEDS_TCA6507=y
> CONFIG_LEDS_TLC591XX=y
> CONFIG_LEDS_MAX77650=y
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_MENF21BMC=y
> # CONFIG_LEDS_IS31FL319X is not set
> CONFIG_LEDS_IS31FL32XX=y
> 
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> # CONFIG_LEDS_SYSCON is not set
> CONFIG_LEDS_MLXREG=y
> CONFIG_LEDS_USER=y
> # CONFIG_LEDS_SPI_BYTE is not set
> CONFIG_LEDS_TI_LMU_COMMON=y
> CONFIG_LEDS_LM3697=y
> CONFIG_LEDS_LM36274=y
> CONFIG_LEDS_TPS6105X=y
> # CONFIG_LEDS_IP30 is not set
> # CONFIG_LEDS_BCM63138 is not set
> # CONFIG_LEDS_LGM is not set
> 
> #
> # Flash and Torch LED drivers
> #
> # CONFIG_LEDS_AAT1290 is not set
> # CONFIG_LEDS_AS3645A is not set
> # CONFIG_LEDS_KTD2692 is not set
> # CONFIG_LEDS_LM3601X is not set
> CONFIG_LEDS_MAX77693=y
> # CONFIG_LEDS_MT6360 is not set
> # CONFIG_LEDS_RT4505 is not set
> CONFIG_LEDS_RT8515=y
> # CONFIG_LEDS_SGM3140 is not set
> 
> #
> # RGB LED drivers
> #
> 
> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> 
> #
> # Simple LED drivers
> #
> CONFIG_ACCESSIBILITY=y
> 
> #
> # Speakup console speech
> #
> # end of Speakup console speech
> 
> CONFIG_EDAC_SUPPORT=y
> # CONFIG_RTC_CLASS is not set
> CONFIG_DMADEVICES=y
> CONFIG_DMADEVICES_DEBUG=y
> CONFIG_DMADEVICES_VDEBUG=y
> 
> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=y
> CONFIG_DMA_VIRTUAL_CHANNELS=y
> CONFIG_DMA_OF=y
> CONFIG_ALTERA_MSGDMA=y
> # CONFIG_APPLE_ADMAC is not set
> # CONFIG_AXI_DMAC is not set
> # CONFIG_DMA_JZ4780 is not set
> # CONFIG_DMA_SA11X0 is not set
> # CONFIG_DMA_SUN6I is not set
> # CONFIG_DW_AXI_DMAC is not set
> # CONFIG_EP93XX_DMA is not set
> CONFIG_FSL_EDMA=y
> # CONFIG_HISI_DMA is not set
> # CONFIG_IMG_MDC_DMA is not set
> CONFIG_INTEL_IDMA64=y
> # CONFIG_INTEL_IOP_ADMA is not set
> # CONFIG_K3_DMA is not set
> # CONFIG_MCF_EDMA is not set
> # CONFIG_MILBEAUT_HDMAC is not set
> # CONFIG_MILBEAUT_XDMAC is not set
> # CONFIG_MMP_PDMA is not set
> # CONFIG_MMP_TDMA is not set
> # CONFIG_MV_XOR is not set
> # CONFIG_MXS_DMA is not set
> # CONFIG_NBPFAXI_DMA is not set
> # CONFIG_PCH_DMA is not set
> CONFIG_PLX_DMA=y
> # CONFIG_STM32_DMA is not set
> # CONFIG_STM32_DMAMUX is not set
> # CONFIG_STM32_MDMA is not set
> # CONFIG_SPRD_DMA is not set
> # CONFIG_S3C24XX_DMAC is not set
> # CONFIG_TEGRA20_APB_DMA is not set
> # CONFIG_TEGRA210_ADMA is not set
> # CONFIG_TIMB_DMA is not set
> # CONFIG_UNIPHIER_MDMAC is not set
> # CONFIG_UNIPHIER_XDMAC is not set
> # CONFIG_XGENE_DMA is not set
> # CONFIG_XILINX_ZYNQMP_DMA is not set
> CONFIG_XILINX_ZYNQMP_DPDMA=y
> # CONFIG_MTK_HSDMA is not set
> # CONFIG_MTK_CQDMA is not set
> # CONFIG_QCOM_ADM is not set
> CONFIG_QCOM_HIDMA_MGMT=y
> CONFIG_QCOM_HIDMA=y
> CONFIG_DW_DMAC_CORE=y
> # CONFIG_DW_DMAC is not set
> CONFIG_DW_DMAC_PCI=y
> CONFIG_DW_EDMA=y
> CONFIG_DW_EDMA_PCIE=y
> CONFIG_HSU_DMA=y
> CONFIG_SF_PDMA=y
> CONFIG_RENESAS_DMA=y
> CONFIG_SH_DMAE_BASE=y
> # CONFIG_SH_DMAE is not set
> # CONFIG_RCAR_DMAC is not set
> # CONFIG_RENESAS_USB_DMAC is not set
> # CONFIG_RZ_DMAC is not set
> CONFIG_TI_EDMA=y
> CONFIG_DMA_OMAP=y
> CONFIG_TI_DMA_CROSSBAR=y
> # CONFIG_INTEL_LDMA is not set
> 
> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> CONFIG_DMATEST=y
> CONFIG_DMA_ENGINE_RAID=y
> 
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> CONFIG_DMABUF_SYSFS_STATS=y
> # end of DMABUF options
> 
> CONFIG_AUXDISPLAY=y
> CONFIG_CHARLCD=y
> CONFIG_LINEDISP=y
> CONFIG_HD44780_COMMON=y
> CONFIG_HD44780=y
> CONFIG_IMG_ASCII_LCD=y
> # CONFIG_LCD2S is not set
> # CONFIG_PANEL_CHANGE_MESSAGE is not set
> # CONFIG_CHARLCD_BL_OFF is not set
> CONFIG_CHARLCD_BL_ON=y
> # CONFIG_CHARLCD_BL_FLASH is not set
> # CONFIG_UIO is not set
> # CONFIG_VFIO is not set
> CONFIG_VIRT_DRIVERS=y
> CONFIG_VIRTIO_ANCHOR=y
> CONFIG_VIRTIO=y
> CONFIG_VIRTIO_MENU=y
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=y
> CONFIG_VIRTIO_MMIO=y
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
> # CONFIG_VHOST_MENU is not set
> 
> #
> # Microsoft Hyper-V guest support
> #
> # end of Microsoft Hyper-V guest support
> 
> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> CONFIG_STAGING=y
> # CONFIG_RTS5208 is not set
> 
> #
> # IIO staging drivers
> #
> 
> #
> # Accelerometers
> #
> # CONFIG_ADIS16203 is not set
> CONFIG_ADIS16240=y
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> CONFIG_AD7816=y
> # end of Analog to digital converters
> 
> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=y
> CONFIG_ADT7316_SPI=y
> CONFIG_ADT7316_I2C=y
> # end of Analog digital bi-direction converters
> 
> #
> # Direct Digital Synthesis
> #
> CONFIG_AD9832=y
> CONFIG_AD9834=y
> # end of Direct Digital Synthesis
> 
> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> # end of Network Analyzer, Impedance Converters
> 
> #
> # Active energy metering IC
> #
> # CONFIG_ADE7854 is not set
> # end of Active energy metering IC
> 
> #
> # Resolver to digital converters
> #
> CONFIG_AD2S1210=y
> # end of Resolver to digital converters
> # end of IIO staging drivers
> 
> # CONFIG_FB_SM750 is not set
> # CONFIG_STAGING_MEDIA is not set
> # CONFIG_STAGING_BOARD is not set
> CONFIG_FB_TFT=y
> CONFIG_FB_TFT_AGM1264K_FL=y
> # CONFIG_FB_TFT_BD663474 is not set
> CONFIG_FB_TFT_HX8340BN=y
> CONFIG_FB_TFT_HX8347D=y
> CONFIG_FB_TFT_HX8353D=y
> # CONFIG_FB_TFT_HX8357D is not set
> # CONFIG_FB_TFT_ILI9163 is not set
> # CONFIG_FB_TFT_ILI9320 is not set
> # CONFIG_FB_TFT_ILI9325 is not set
> CONFIG_FB_TFT_ILI9340=y
> CONFIG_FB_TFT_ILI9341=y
> CONFIG_FB_TFT_ILI9481=y
> CONFIG_FB_TFT_ILI9486=y
> CONFIG_FB_TFT_PCD8544=y
> # CONFIG_FB_TFT_RA8875 is not set
> CONFIG_FB_TFT_S6D02A1=y
> CONFIG_FB_TFT_S6D1121=y
> CONFIG_FB_TFT_SEPS525=y
> CONFIG_FB_TFT_SH1106=y
> CONFIG_FB_TFT_SSD1289=y
> CONFIG_FB_TFT_SSD1305=y
> CONFIG_FB_TFT_SSD1306=y
> CONFIG_FB_TFT_SSD1331=y
> CONFIG_FB_TFT_SSD1351=y
> # CONFIG_FB_TFT_ST7735R is not set
> CONFIG_FB_TFT_ST7789V=y
> CONFIG_FB_TFT_TINYLCD=y
> CONFIG_FB_TFT_TLS8204=y
> # CONFIG_FB_TFT_UC1611 is not set
> CONFIG_FB_TFT_UC1701=y
> CONFIG_FB_TFT_UPD161704=y
> # CONFIG_MOST_COMPONENTS is not set
> CONFIG_BCM_VIDEOCORE=y
> # CONFIG_BCM2835_VCHIQ is not set
> # CONFIG_VIDEO_BCM2835 is not set
> # CONFIG_PI433 is not set
> CONFIG_XIL_AXIS_FIFO=y
> # CONFIG_FIELDBUS_DEV is not set
> CONFIG_VME_BUS=y
> 
> #
> # VME Bridge Drivers
> #
> CONFIG_VME_TSI148=y
> CONFIG_VME_FAKE=y
> 
> #
> # VME Device Drivers
> #
> CONFIG_VME_USER=y
> CONFIG_GOLDFISH=y
> CONFIG_GOLDFISH_PIPE=y
> # CONFIG_CHROME_PLATFORMS is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> # CONFIG_OLPC_XO175 is not set
> CONFIG_SURFACE_PLATFORMS=y
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> 
> #
> # Clock driver for ARM Reference designs
> #
> # CONFIG_CLK_ICST is not set
> # CONFIG_CLK_SP810 is not set
> # end of Clock driver for ARM Reference designs
> 
> # CONFIG_CLK_HSDK is not set
> CONFIG_LMK04832=y
> # CONFIG_COMMON_CLK_APPLE_NCO is not set
> CONFIG_COMMON_CLK_MAX77686=y
> CONFIG_COMMON_CLK_MAX9485=y
> # CONFIG_COMMON_CLK_HI655X is not set
> # CONFIG_COMMON_CLK_SCMI is not set
> # CONFIG_COMMON_CLK_SCPI is not set
> CONFIG_COMMON_CLK_SI5341=y
> CONFIG_COMMON_CLK_SI5351=y
> # CONFIG_COMMON_CLK_SI514 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> CONFIG_COMMON_CLK_SI570=y
> # CONFIG_COMMON_CLK_BM1880 is not set
> CONFIG_COMMON_CLK_CDCE706=y
> # CONFIG_COMMON_CLK_TPS68470 is not set
> # CONFIG_COMMON_CLK_CDCE925 is not set
> CONFIG_COMMON_CLK_CS2000_CP=y
> # CONFIG_COMMON_CLK_EN7523 is not set
> # CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
> # CONFIG_COMMON_CLK_FSL_SAI is not set
> # CONFIG_COMMON_CLK_GEMINI is not set
> # CONFIG_COMMON_CLK_LAN966X is not set
> # CONFIG_COMMON_CLK_ASPEED is not set
> # CONFIG_COMMON_CLK_S2MPS11 is not set
> CONFIG_CLK_TWL6040=y
> CONFIG_COMMON_CLK_AXI_CLKGEN=y
> # CONFIG_CLK_QORIQ is not set
> # CONFIG_CLK_LS1028A_PLLDIG is not set
> # CONFIG_COMMON_CLK_XGENE is not set
> CONFIG_COMMON_CLK_LOCHNAGAR=y
> CONFIG_COMMON_CLK_PWM=y
> # CONFIG_COMMON_CLK_OXNAS is not set
> CONFIG_COMMON_CLK_RS9_PCIE=y
> # CONFIG_COMMON_CLK_VC5 is not set
> # CONFIG_COMMON_CLK_VC7 is not set
> # CONFIG_COMMON_CLK_MMP2_AUDIO is not set
> CONFIG_COMMON_CLK_FIXED_MMIO=y
> # CONFIG_CLK_ACTIONS is not set
> CONFIG_CLK_ANALOGBITS_WRPLL_CLN28HPC=y
> # CONFIG_CLK_BAIKAL_T1 is not set
> # CONFIG_CLK_BCM2711_DVP is not set
> # CONFIG_CLK_BCM2835 is not set
> # CONFIG_CLK_BCM_63XX is not set
> # CONFIG_CLK_BCM_63XX_GATE is not set
> # CONFIG_CLK_BCM_KONA is not set
> # CONFIG_CLK_BCM_CYGNUS is not set
> # CONFIG_CLK_BCM_HR2 is not set
> # CONFIG_CLK_BCM_NSP is not set
> # CONFIG_CLK_BCM_NS2 is not set
> # CONFIG_CLK_BCM_SR is not set
> # CONFIG_CLK_RASPBERRYPI is not set
> # CONFIG_COMMON_CLK_HI3516CV300 is not set
> # CONFIG_COMMON_CLK_HI3519 is not set
> # CONFIG_COMMON_CLK_HI3559A is not set
> # CONFIG_COMMON_CLK_HI3660 is not set
> # CONFIG_COMMON_CLK_HI3670 is not set
> # CONFIG_COMMON_CLK_HI3798CV200 is not set
> # CONFIG_COMMON_CLK_HI6220 is not set
> # CONFIG_RESET_HISI is not set
> # CONFIG_COMMON_CLK_BOSTON is not set
> # CONFIG_MXC_CLK is not set
> # CONFIG_CLK_IMX8MM is not set
> # CONFIG_CLK_IMX8MN is not set
> # CONFIG_CLK_IMX8MP is not set
> # CONFIG_CLK_IMX8MQ is not set
> # CONFIG_CLK_IMX8ULP is not set
> # CONFIG_CLK_IMX93 is not set
> 
> #
> # Ingenic SoCs drivers
> #
> # CONFIG_INGENIC_CGU_JZ4740 is not set
> # CONFIG_INGENIC_CGU_JZ4725B is not set
> # CONFIG_INGENIC_CGU_JZ4760 is not set
> # CONFIG_INGENIC_CGU_JZ4770 is not set
> # CONFIG_INGENIC_CGU_JZ4780 is not set
> # CONFIG_INGENIC_CGU_X1000 is not set
> # CONFIG_INGENIC_CGU_X1830 is not set
> # CONFIG_INGENIC_TCU_CLK is not set
> # end of Ingenic SoCs drivers
> 
> # CONFIG_COMMON_CLK_KEYSTONE is not set
> # CONFIG_TI_SYSCON_CLK is not set
> 
> #
> # Clock driver for MediaTek SoC
> #
> # CONFIG_COMMON_CLK_MT2701 is not set
> # CONFIG_COMMON_CLK_MT2712 is not set
> # CONFIG_COMMON_CLK_MT6765 is not set
> # CONFIG_COMMON_CLK_MT6779 is not set
> # CONFIG_COMMON_CLK_MT6795 is not set
> # CONFIG_COMMON_CLK_MT6797 is not set
> # CONFIG_COMMON_CLK_MT7622 is not set
> # CONFIG_COMMON_CLK_MT7629 is not set
> # CONFIG_COMMON_CLK_MT7986 is not set
> # CONFIG_COMMON_CLK_MT8135 is not set
> # CONFIG_COMMON_CLK_MT8167 is not set
> # CONFIG_COMMON_CLK_MT8173 is not set
> # CONFIG_COMMON_CLK_MT8183 is not set
> # CONFIG_COMMON_CLK_MT8186 is not set
> # CONFIG_COMMON_CLK_MT8192 is not set
> # CONFIG_COMMON_CLK_MT8195 is not set
> # CONFIG_COMMON_CLK_MT8365 is not set
> # CONFIG_COMMON_CLK_MT8516 is not set
> # end of Clock driver for MediaTek SoC
> 
> #
> # Clock support for Amlogic platforms
> #
> # end of Clock support for Amlogic platforms
> 
> # CONFIG_MSTAR_MSC313_MPLL is not set
> CONFIG_MCHP_CLK_MPFS=y
> # CONFIG_COMMON_CLK_PISTACHIO is not set
> # CONFIG_COMMON_CLK_QCOM is not set
> # CONFIG_CLK_MT7621 is not set
> # CONFIG_CLK_RENESAS is not set
> # CONFIG_COMMON_CLK_SAMSUNG is not set
> # CONFIG_S3C2410_COMMON_CLK is not set
> # CONFIG_S3C2412_COMMON_CLK is not set
> # CONFIG_S3C2443_COMMON_CLK is not set
> CONFIG_CLK_SIFIVE=y
> CONFIG_CLK_SIFIVE_PRCI=y
> # CONFIG_CLK_INTEL_SOCFPGA is not set
> # CONFIG_SPRD_COMMON_CLK is not set
> # CONFIG_CLK_STARFIVE_JH7100 is not set
> CONFIG_CLK_SUNXI=y
> CONFIG_CLK_SUNXI_CLOCKS=y
> CONFIG_CLK_SUNXI_PRCM_SUN6I=y
> CONFIG_CLK_SUNXI_PRCM_SUN8I=y
> CONFIG_CLK_SUNXI_PRCM_SUN9I=y
> # CONFIG_SUNXI_CCU is not set
> # CONFIG_COMMON_CLK_TI_ADPLL is not set
> # CONFIG_CLK_UNIPHIER is not set
> # CONFIG_COMMON_CLK_VISCONTI is not set
> # CONFIG_CLK_LGM_CGU is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
> # CONFIG_COMMON_CLK_ZYNQMP is not set
> CONFIG_CLK_KUNIT_TEST=y
> CONFIG_CLK_GATE_KUNIT_TEST=y
> CONFIG_HWSPINLOCK=y
> # CONFIG_HWSPINLOCK_OMAP is not set
> # CONFIG_HWSPINLOCK_QCOM is not set
> # CONFIG_HWSPINLOCK_SPRD is not set
> # CONFIG_HWSPINLOCK_STM32 is not set
> # CONFIG_HWSPINLOCK_SUN6I is not set
> # CONFIG_HSEM_U8500 is not set
> 
> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=y
> CONFIG_TIMER_PROBE=y
> # CONFIG_BCM2835_TIMER is not set
> # CONFIG_BCM_KONA_TIMER is not set
> # CONFIG_DAVINCI_TIMER is not set
> # CONFIG_DIGICOLOR_TIMER is not set
> # CONFIG_OMAP_DM_TIMER is not set
> # CONFIG_DW_APB_TIMER is not set
> # CONFIG_FTTMR010_TIMER is not set
> # CONFIG_IXP4XX_TIMER is not set
> # CONFIG_MESON6_TIMER is not set
> # CONFIG_OWL_TIMER is not set
> # CONFIG_RDA_TIMER is not set
> # CONFIG_SUN4I_TIMER is not set
> # CONFIG_SUN5I_HSTIMER is not set
> # CONFIG_TEGRA_TIMER is not set
> # CONFIG_TEGRA186_TIMER is not set
> # CONFIG_VT8500_TIMER is not set
> # CONFIG_NPCM7XX_TIMER is not set
> # CONFIG_CADENCE_TTC_TIMER is not set
> # CONFIG_ASM9260_TIMER is not set
> # CONFIG_CLKSRC_DBX500_PRCMU is not set
> # CONFIG_CLPS711X_TIMER is not set
> # CONFIG_MXS_TIMER is not set
> # CONFIG_NSPIRE_TIMER is not set
> # CONFIG_INTEGRATOR_AP_TIMER is not set
> # CONFIG_CLKSRC_PISTACHIO is not set
> # CONFIG_CLKSRC_TI_32K is not set
> # CONFIG_CLKSRC_STM32_LP is not set
> # CONFIG_CLKSRC_MPS2 is not set
> # CONFIG_ARC_TIMERS is not set
> # CONFIG_ARM_TIMER_SP804 is not set
> # CONFIG_ARMV7M_SYSTICK is not set
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_ATMEL_ST is not set
> # CONFIG_CLKSRC_SAMSUNG_PWM is not set
> # CONFIG_FSL_FTM_TIMER is not set
> # CONFIG_OXNAS_RPS_TIMER is not set
> # CONFIG_MTK_TIMER is not set
> # CONFIG_SPRD_TIMER is not set
> # CONFIG_CLKSRC_JCORE_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_RENESAS_OSTM is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_CLKSRC_VERSATILE is not set
> # CONFIG_CLKSRC_PXA is not set
> # CONFIG_TIMER_IMX_SYS_CTR is not set
> # CONFIG_CLKSRC_ST_LPC is not set
> # CONFIG_GXP_TIMER is not set
> CONFIG_RISCV_TIMER=y
> # CONFIG_CLINT_TIMER is not set
> # CONFIG_MSC313E_TIMER is not set
> # CONFIG_INGENIC_TIMER is not set
> # CONFIG_INGENIC_SYSOST is not set
> # CONFIG_INGENIC_OST is not set
> CONFIG_MICROCHIP_PIT64B=y
> # end of Clock Source drivers
> 
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> 
> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=y
> # CONFIG_REMOTEPROC_CDEV is not set
> # CONFIG_INGENIC_VPU_RPROC is not set
> # CONFIG_MTK_SCP is not set
> # CONFIG_MESON_MX_AO_ARC_REMOTEPROC is not set
> # CONFIG_RCAR_REMOTEPROC is not set
> # end of Remoteproc drivers
> 
> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=y
> # CONFIG_RPMSG_CTRL is not set
> CONFIG_RPMSG_NS=y
> CONFIG_RPMSG_VIRTIO=y
> # end of Rpmsg drivers
> 
> # CONFIG_SOUNDWIRE is not set
> 
> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_OWL_PM_DOMAINS is not set
> 
> #
> # Amlogic SoC drivers
> #
> # CONFIG_MESON_CANVAS is not set
> # CONFIG_MESON_CLK_MEASURE is not set
> # CONFIG_MESON_GX_SOCINFO is not set
> # CONFIG_MESON_GX_PM_DOMAINS is not set
> # CONFIG_MESON_EE_PM_DOMAINS is not set
> # CONFIG_MESON_MX_SOCINFO is not set
> # end of Amlogic SoC drivers
> 
> #
> # Apple SoC drivers
> #
> # CONFIG_APPLE_PMGR_PWRSTATE is not set
> # CONFIG_APPLE_SART is not set
> # end of Apple SoC drivers
> 
> #
> # ASPEED SoC drivers
> #
> # CONFIG_ASPEED_LPC_CTRL is not set
> # CONFIG_ASPEED_LPC_SNOOP is not set
> # CONFIG_ASPEED_UART_ROUTING is not set
> # CONFIG_ASPEED_P2A_CTRL is not set
> # CONFIG_ASPEED_SOCINFO is not set
> # end of ASPEED SoC drivers
> 
> # CONFIG_AT91_SOC_ID is not set
> # CONFIG_AT91_SOC_SFR is not set
> 
> #
> # Broadcom SoC drivers
> #
> # CONFIG_BCM2835_POWER is not set
> # CONFIG_SOC_BCM63XX is not set
> # CONFIG_SOC_BRCMSTB is not set
> # CONFIG_BCM_PMB is not set
> # end of Broadcom SoC drivers
> 
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # CONFIG_QUICC_ENGINE is not set
> CONFIG_DPAA2_CONSOLE=y
> # end of NXP/Freescale QorIQ SoC drivers
> 
> #
> # fujitsu SoC drivers
> #
> # end of fujitsu SoC drivers
> 
> #
> # i.MX SoC drivers
> #
> # CONFIG_IMX_GPCV2_PM_DOMAINS is not set
> # CONFIG_SOC_IMX8M is not set
> # CONFIG_SOC_IMX9 is not set
> # end of i.MX SoC drivers
> 
> #
> # IXP4xx SoC drivers
> #
> # CONFIG_IXP4XX_QMGR is not set
> # CONFIG_IXP4XX_NPE is not set
> # end of IXP4xx SoC drivers
> 
> #
> # Enable LiteX SoC Builder specific drivers
> #
> CONFIG_LITEX=y
> CONFIG_LITEX_SOC_CONTROLLER=y
> # end of Enable LiteX SoC Builder specific drivers
> 
> #
> # MediaTek SoC drivers
> #
> # CONFIG_MTK_CMDQ is not set
> # CONFIG_MTK_DEVAPC is not set
> # CONFIG_MTK_INFRACFG is not set
> # CONFIG_MTK_PMIC_WRAP is not set
> # CONFIG_MTK_SCPSYS is not set
> # CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
> # CONFIG_MTK_MMSYS is not set
> # end of MediaTek SoC drivers
> 
> #
> # Qualcomm SoC drivers
> #
> # CONFIG_QCOM_COMMAND_DB is not set
> # CONFIG_QCOM_GENI_SE is not set
> # CONFIG_QCOM_GSBI is not set
> # CONFIG_QCOM_LLCC is not set
> # CONFIG_QCOM_RPMH is not set
> # CONFIG_QCOM_SMEM is not set
> # CONFIG_QCOM_SMD_RPM is not set
> # CONFIG_QCOM_SPM is not set
> # CONFIG_QCOM_WCNSS_CTRL is not set
> # CONFIG_QCOM_ICC_BWMON is not set
> # end of Qualcomm SoC drivers
> 
> # CONFIG_SOC_RENESAS is not set
> # CONFIG_ROCKCHIP_GRF is not set
> # CONFIG_ROCKCHIP_IODOMAIN is not set
> # CONFIG_ROCKCHIP_PM_DOMAINS is not set
> # CONFIG_SOC_SAMSUNG is not set
> CONFIG_SIFIVE_CCACHE=y
> # CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
> # CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
> # CONFIG_SOC_TI is not set
> # CONFIG_UX500_SOC_ID is not set
> 
> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> 
> CONFIG_PM_DEVFREQ=y
> 
> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> CONFIG_DEVFREQ_GOV_POWERSAVE=y
> CONFIG_DEVFREQ_GOV_USERSPACE=y
> CONFIG_DEVFREQ_GOV_PASSIVE=y
> 
> #
> # DEVFREQ Drivers
> #
> # CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
> # CONFIG_ARM_IMX_BUS_DEVFREQ is not set
> # CONFIG_ARM_TEGRA_DEVFREQ is not set
> # CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
> # CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
> # CONFIG_PM_DEVFREQ_EVENT is not set
> # CONFIG_EXTCON is not set
> CONFIG_MEMORY=y
> CONFIG_DDR=y
> # CONFIG_ATMEL_SDRAMC is not set
> # CONFIG_ATMEL_EBI is not set
> # CONFIG_BRCMSTB_DPFE is not set
> # CONFIG_BRCMSTB_MEMC is not set
> # CONFIG_BT1_L2_CTL is not set
> # CONFIG_TI_AEMIF is not set
> # CONFIG_TI_EMIF is not set
> # CONFIG_OMAP_GPMC is not set
> CONFIG_FPGA_DFL_EMIF=y
> # CONFIG_MVEBU_DEVBUS is not set
> # CONFIG_FSL_CORENET_CF is not set
> # CONFIG_FSL_IFC is not set
> # CONFIG_JZ4780_NEMC is not set
> # CONFIG_MTK_SMI is not set
> # CONFIG_DA8XX_DDRCTL is not set
> # CONFIG_RENESAS_RPCIF is not set
> # CONFIG_STM32_FMC2_EBI is not set
> # CONFIG_SAMSUNG_MC is not set
> CONFIG_TEGRA_MC=y
> CONFIG_TEGRA20_EMC=y
> CONFIG_TEGRA30_EMC=y
> CONFIG_TEGRA124_EMC=y
> # CONFIG_TEGRA210_EMC is not set
> CONFIG_IIO=y
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=y
> CONFIG_IIO_BUFFER_DMA=y
> CONFIG_IIO_BUFFER_DMAENGINE=y
> CONFIG_IIO_BUFFER_HW_CONSUMER=y
> CONFIG_IIO_KFIFO_BUF=y
> CONFIG_IIO_TRIGGERED_BUFFER=y
> CONFIG_IIO_CONFIGFS=y
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> CONFIG_IIO_SW_DEVICE=y
> CONFIG_IIO_SW_TRIGGER=y
> CONFIG_IIO_TRIGGERED_EVENT=y
> 
> #
> # Accelerometers
> #
> # CONFIG_ADIS16201 is not set
> CONFIG_ADIS16209=y
> CONFIG_ADXL313=y
> # CONFIG_ADXL313_I2C is not set
> CONFIG_ADXL313_SPI=y
> CONFIG_ADXL345=y
> CONFIG_ADXL345_I2C=y
> # CONFIG_ADXL345_SPI is not set
> CONFIG_ADXL355=y
> CONFIG_ADXL355_I2C=y
> CONFIG_ADXL355_SPI=y
> CONFIG_ADXL367=y
> CONFIG_ADXL367_SPI=y
> # CONFIG_ADXL367_I2C is not set
> CONFIG_ADXL372=y
> # CONFIG_ADXL372_SPI is not set
> CONFIG_ADXL372_I2C=y
> # CONFIG_BMA180 is not set
> CONFIG_BMA220=y
> CONFIG_BMA400=y
> CONFIG_BMA400_I2C=y
> CONFIG_BMA400_SPI=y
> CONFIG_BMC150_ACCEL=y
> CONFIG_BMC150_ACCEL_I2C=y
> CONFIG_BMC150_ACCEL_SPI=y
> CONFIG_BMI088_ACCEL=y
> CONFIG_BMI088_ACCEL_SPI=y
> # CONFIG_DA280 is not set
> CONFIG_DA311=y
> # CONFIG_DMARD06 is not set
> CONFIG_DMARD09=y
> # CONFIG_DMARD10 is not set
> CONFIG_FXLS8962AF=y
> CONFIG_FXLS8962AF_I2C=y
> # CONFIG_FXLS8962AF_SPI is not set
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=y
> CONFIG_KXSD9_SPI=y
> # CONFIG_KXSD9_I2C is not set
> CONFIG_KXCJK1013=y
> # CONFIG_MC3230 is not set
> CONFIG_MMA7455=y
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7455_SPI=y
> # CONFIG_MMA7660 is not set
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=y
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=y
> # CONFIG_MSA311 is not set
> # CONFIG_MXC4005 is not set
> # CONFIG_MXC6255 is not set
> CONFIG_SCA3000=y
> CONFIG_SCA3300=y
> CONFIG_STK8312=y
> # CONFIG_STK8BA50 is not set
> # end of Accelerometers
> 
> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=y
> CONFIG_AD7091R5=y
> # CONFIG_AD7124 is not set
> CONFIG_AD7192=y
> # CONFIG_AD7266 is not set
> # CONFIG_AD7280 is not set
> CONFIG_AD7291=y
> # CONFIG_AD7292 is not set
> CONFIG_AD7298=y
> # CONFIG_AD7476 is not set
> CONFIG_AD7606=y
> CONFIG_AD7606_IFACE_PARALLEL=y
> CONFIG_AD7606_IFACE_SPI=y
> CONFIG_AD7766=y
> CONFIG_AD7768_1=y
> # CONFIG_AD7780 is not set
> CONFIG_AD7791=y
> CONFIG_AD7793=y
> CONFIG_AD7887=y
> # CONFIG_AD7923 is not set
> CONFIG_AD7949=y
> CONFIG_AD799X=y
> CONFIG_AD9467=y
> CONFIG_ADI_AXI_ADC=y
> # CONFIG_ASPEED_ADC is not set
> # CONFIG_AT91_SAMA5D2_ADC is not set
> CONFIG_AXP20X_ADC=y
> CONFIG_AXP288_ADC=y
> # CONFIG_BCM_IPROC_ADC is not set
> # CONFIG_BERLIN2_ADC is not set
> # CONFIG_CC10001_ADC is not set
> # CONFIG_ENVELOPE_DETECTOR is not set
> # CONFIG_EXYNOS_ADC is not set
> # CONFIG_HI8435 is not set
> CONFIG_HX711=y
> # CONFIG_INGENIC_ADC is not set
> # CONFIG_IMX7D_ADC is not set
> # CONFIG_IMX8QXP_ADC is not set
> # CONFIG_LPC18XX_ADC is not set
> # CONFIG_LPC32XX_ADC is not set
> CONFIG_LTC2471=y
> CONFIG_LTC2485=y
> CONFIG_LTC2496=y
> CONFIG_LTC2497=y
> CONFIG_MAX1027=y
> # CONFIG_MAX11100 is not set
> CONFIG_MAX1118=y
> # CONFIG_MAX11205 is not set
> # CONFIG_MAX1241 is not set
> CONFIG_MAX1363=y
> CONFIG_MAX9611=y
> CONFIG_MCP320X=y
> # CONFIG_MCP3422 is not set
> CONFIG_MCP3911=y
> # CONFIG_MEDIATEK_MT6360_ADC is not set
> # CONFIG_MEDIATEK_MT6577_AUXADC is not set
> # CONFIG_MEN_Z188_ADC is not set
> # CONFIG_MESON_SARADC is not set
> # CONFIG_MP2629_ADC is not set
> CONFIG_NAU7802=y
> # CONFIG_NPCM_ADC is not set
> # CONFIG_RCAR_GYRO_ADC is not set
> CONFIG_RN5T618_ADC=y
> # CONFIG_ROCKCHIP_SARADC is not set
> # CONFIG_RICHTEK_RTQ6056 is not set
> # CONFIG_RZG2L_ADC is not set
> # CONFIG_SC27XX_ADC is not set
> # CONFIG_SPEAR_ADC is not set
> CONFIG_SD_ADC_MODULATOR=y
> # CONFIG_STM32_ADC_CORE is not set
> # CONFIG_STM32_DFSDM_CORE is not set
> # CONFIG_STM32_DFSDM_ADC is not set
> CONFIG_STMPE_ADC=y
> CONFIG_TI_ADC081C=y
> CONFIG_TI_ADC0832=y
> CONFIG_TI_ADC084S021=y
> CONFIG_TI_ADC12138=y
> # CONFIG_TI_ADC108S102 is not set
> CONFIG_TI_ADC128S052=y
> CONFIG_TI_ADC161S626=y
> CONFIG_TI_ADS1015=y
> CONFIG_TI_ADS7950=y
> # CONFIG_TI_ADS8344 is not set
> CONFIG_TI_ADS8688=y
> CONFIG_TI_ADS124S08=y
> CONFIG_TI_ADS131E08=y
> CONFIG_TI_AM335X_ADC=y
> CONFIG_TI_TLC4541=y
> CONFIG_TI_TSC2046=y
> CONFIG_TWL4030_MADC=y
> CONFIG_TWL6030_GPADC=y
> # CONFIG_VF610_ADC is not set
> CONFIG_XILINX_XADC=y
> # CONFIG_XILINX_AMS is not set
> # end of Analog to digital converters
> 
> #
> # Analog to digital and digital to analog converters
> #
> CONFIG_AD74413R=y
> # end of Analog to digital and digital to analog converters
> 
> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=y
> # end of Analog Front Ends
> 
> #
> # Amplifiers
> #
> # CONFIG_AD8366 is not set
> CONFIG_ADA4250=y
> CONFIG_HMC425=y
> # end of Amplifiers
> 
> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=y
> CONFIG_AD7746=y
> # end of Capacitance to digital converters
> 
> #
> # Chemical Sensors
> #
> # CONFIG_ATLAS_PH_SENSOR is not set
> CONFIG_ATLAS_EZO_SENSOR=y
> CONFIG_BME680=y
> CONFIG_BME680_I2C=y
> CONFIG_BME680_SPI=y
> CONFIG_CCS811=y
> CONFIG_IAQCORE=y
> CONFIG_SCD30_CORE=y
> CONFIG_SCD30_I2C=y
> CONFIG_SCD4X=y
> # CONFIG_SENSIRION_SGP30 is not set
> CONFIG_SENSIRION_SGP40=y
> # CONFIG_SPS30_I2C is not set
> CONFIG_SENSEAIR_SUNRISE_CO2=y
> CONFIG_VZ89X=y
> # end of Chemical Sensors
> 
> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
> 
> CONFIG_IIO_MS_SENSORS_I2C=y
> 
> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
> 
> #
> # SSP Sensor Common
> #
> CONFIG_IIO_SSP_SENSORS_COMMONS=y
> CONFIG_IIO_SSP_SENSORHUB=y
> # end of SSP Sensor Common
> 
> CONFIG_IIO_ST_SENSORS_I2C=y
> CONFIG_IIO_ST_SENSORS_SPI=y
> CONFIG_IIO_ST_SENSORS_CORE=y
> 
> #
> # Digital to analog converters
> #
> # CONFIG_AD3552R is not set
> CONFIG_AD5064=y
> CONFIG_AD5360=y
> CONFIG_AD5380=y
> # CONFIG_AD5421 is not set
> CONFIG_AD5446=y
> # CONFIG_AD5449 is not set
> CONFIG_AD5592R_BASE=y
> CONFIG_AD5592R=y
> CONFIG_AD5593R=y
> CONFIG_AD5504=y
> CONFIG_AD5624R_SPI=y
> # CONFIG_LTC2688 is not set
> CONFIG_AD5686=y
> # CONFIG_AD5686_SPI is not set
> CONFIG_AD5696_I2C=y
> CONFIG_AD5755=y
> CONFIG_AD5758=y
> # CONFIG_AD5761 is not set
> CONFIG_AD5764=y
> # CONFIG_AD5766 is not set
> CONFIG_AD5770R=y
> CONFIG_AD5791=y
> CONFIG_AD7293=y
> # CONFIG_AD7303 is not set
> CONFIG_AD8801=y
> # CONFIG_DPOT_DAC is not set
> CONFIG_DS4424=y
> # CONFIG_LPC18XX_DAC is not set
> CONFIG_LTC1660=y
> CONFIG_LTC2632=y
> CONFIG_M62332=y
> CONFIG_MAX517=y
> CONFIG_MAX5821=y
> # CONFIG_MCP4725 is not set
> CONFIG_MCP4922=y
> # CONFIG_STM32_DAC is not set
> CONFIG_TI_DAC082S085=y
> CONFIG_TI_DAC5571=y
> CONFIG_TI_DAC7311=y
> # CONFIG_TI_DAC7612 is not set
> CONFIG_VF610_DAC=y
> # end of Digital to analog converters
> 
> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> # end of IIO dummy driver
> 
> #
> # Filters
> #
> # end of Filters
> 
> #
> # Frequency Synthesizers DDS/PLL
> #
> 
> #
> # Clock Generator/Distribution
> #
> # CONFIG_AD9523 is not set
> # end of Clock Generator/Distribution
> 
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> CONFIG_ADF4350=y
> CONFIG_ADF4371=y
> CONFIG_ADMV1013=y
> # CONFIG_ADMV4420 is not set
> CONFIG_ADRF6780=y
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
> 
> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=y
> # CONFIG_ADIS16130 is not set
> CONFIG_ADIS16136=y
> # CONFIG_ADIS16260 is not set
> CONFIG_ADXRS290=y
> CONFIG_ADXRS450=y
> CONFIG_BMG160=y
> CONFIG_BMG160_I2C=y
> CONFIG_BMG160_SPI=y
> CONFIG_FXAS21002C=y
> CONFIG_FXAS21002C_I2C=y
> CONFIG_FXAS21002C_SPI=y
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=y
> # CONFIG_IIO_ST_GYRO_I2C_3AXIS is not set
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=y
> # CONFIG_ITG3200 is not set
> # end of Digital gyroscope sensors
> 
> #
> # Health Sensors
> #
> 
> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4403=y
> CONFIG_AFE4404=y
> CONFIG_MAX30100=y
> # CONFIG_MAX30102 is not set
> # end of Heart Rate Monitors
> # end of Health Sensors
> 
> #
> # Humidity sensors
> #
> CONFIG_AM2315=y
> # CONFIG_DHT11 is not set
> CONFIG_HDC100X=y
> CONFIG_HDC2010=y
> CONFIG_HTS221=y
> CONFIG_HTS221_I2C=y
> CONFIG_HTS221_SPI=y
> CONFIG_HTU21=y
> CONFIG_SI7005=y
> CONFIG_SI7020=y
> # end of Humidity sensors
> 
> #
> # Inertial measurement units
> #
> # CONFIG_ADIS16400 is not set
> # CONFIG_ADIS16460 is not set
> # CONFIG_ADIS16475 is not set
> CONFIG_ADIS16480=y
> CONFIG_BMI160=y
> # CONFIG_BMI160_I2C is not set
> CONFIG_BMI160_SPI=y
> CONFIG_BOSCH_BNO055=y
> CONFIG_BOSCH_BNO055_I2C=y
> CONFIG_FXOS8700=y
> CONFIG_FXOS8700_I2C=y
> # CONFIG_FXOS8700_SPI is not set
> CONFIG_KMX61=y
> CONFIG_INV_ICM42600=y
> CONFIG_INV_ICM42600_I2C=y
> # CONFIG_INV_ICM42600_SPI is not set
> CONFIG_INV_MPU6050_IIO=y
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_INV_MPU6050_SPI=y
> # CONFIG_IIO_ST_LSM6DSX is not set
> # CONFIG_IIO_ST_LSM9DS0 is not set
> # end of Inertial measurement units
> 
> CONFIG_IIO_ADIS_LIB=y
> CONFIG_IIO_ADIS_LIB_BUFFER=y
> 
> #
> # Light sensors
> #
> CONFIG_ADJD_S311=y
> CONFIG_ADUX1020=y
> CONFIG_AL3010=y
> CONFIG_AL3320A=y
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=y
> CONFIG_AS73211=y
> CONFIG_BH1750=y
> # CONFIG_BH1780 is not set
> # CONFIG_CM32181 is not set
> CONFIG_CM3232=y
> CONFIG_CM3323=y
> CONFIG_CM3605=y
> CONFIG_CM36651=y
> # CONFIG_GP2AP002 is not set
> CONFIG_GP2AP020A00F=y
> # CONFIG_IQS621_ALS is not set
> CONFIG_SENSORS_ISL29018=y
> CONFIG_SENSORS_ISL29028=y
> CONFIG_ISL29125=y
> CONFIG_JSA1212=y
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=y
> # CONFIG_LTRF216A is not set
> # CONFIG_LV0104CS is not set
> CONFIG_MAX44000=y
> # CONFIG_MAX44009 is not set
> CONFIG_NOA1305=y
> CONFIG_OPT3001=y
> CONFIG_PA12203001=y
> CONFIG_SI1133=y
> # CONFIG_SI1145 is not set
> CONFIG_STK3310=y
> # CONFIG_ST_UVIS25 is not set
> CONFIG_TCS3414=y
> CONFIG_TCS3472=y
> CONFIG_SENSORS_TSL2563=y
> CONFIG_TSL2583=y
> CONFIG_TSL2591=y
> CONFIG_TSL2772=y
> CONFIG_TSL4531=y
> CONFIG_US5182D=y
> CONFIG_VCNL4000=y
> CONFIG_VCNL4035=y
> CONFIG_VEML6030=y
> # CONFIG_VEML6070 is not set
> CONFIG_VL6180=y
> CONFIG_ZOPT2201=y
> # end of Light sensors
> 
> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> CONFIG_AK8975=y
> CONFIG_AK09911=y
> CONFIG_BMC150_MAGN=y
> CONFIG_BMC150_MAGN_I2C=y
> # CONFIG_BMC150_MAGN_SPI is not set
> CONFIG_MAG3110=y
> CONFIG_MMC35240=y
> CONFIG_IIO_ST_MAGN_3AXIS=y
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=y
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=y
> CONFIG_SENSORS_HMC5843=y
> CONFIG_SENSORS_HMC5843_I2C=y
> # CONFIG_SENSORS_HMC5843_SPI is not set
> CONFIG_SENSORS_RM3100=y
> CONFIG_SENSORS_RM3100_I2C=y
> # CONFIG_SENSORS_RM3100_SPI is not set
> CONFIG_YAMAHA_YAS530=y
> # end of Magnetometer sensors
> 
> #
> # Multiplexers
> #
> # CONFIG_IIO_MUX is not set
> # end of Multiplexers
> 
> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
> 
> CONFIG_IIO_RESCALE_KUNIT_TEST=y
> CONFIG_IIO_FORMAT_KUNIT_TEST=y
> 
> #
> # Triggers - standalone
> #
> CONFIG_IIO_HRTIMER_TRIGGER=y
> CONFIG_IIO_INTERRUPT_TRIGGER=y
> # CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
> # CONFIG_IIO_STM32_TIMER_TRIGGER is not set
> CONFIG_IIO_TIGHTLOOP_TRIGGER=y
> CONFIG_IIO_SYSFS_TRIGGER=y
> # end of Triggers - standalone
> 
> #
> # Linear and angular position sensors
> #
> # CONFIG_IQS624_POS is not set
> # end of Linear and angular position sensors
> 
> #
> # Digital potentiometers
> #
> # CONFIG_AD5110 is not set
> CONFIG_AD5272=y
> # CONFIG_DS1803 is not set
> # CONFIG_MAX5432 is not set
> CONFIG_MAX5481=y
> CONFIG_MAX5487=y
> CONFIG_MCP4018=y
> CONFIG_MCP4131=y
> # CONFIG_MCP4531 is not set
> CONFIG_MCP41010=y
> CONFIG_TPL0102=y
> # end of Digital potentiometers
> 
> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> # end of Digital potentiostats
> 
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=y
> CONFIG_BMP280=y
> CONFIG_BMP280_I2C=y
> CONFIG_BMP280_SPI=y
> CONFIG_DLHL60D=y
> CONFIG_DPS310=y
> # CONFIG_HP03 is not set
> CONFIG_ICP10100=y
> CONFIG_MPL115=y
> CONFIG_MPL115_I2C=y
> CONFIG_MPL115_SPI=y
> CONFIG_MPL3115=y
> CONFIG_MS5611=y
> CONFIG_MS5611_I2C=y
> CONFIG_MS5611_SPI=y
> CONFIG_MS5637=y
> CONFIG_IIO_ST_PRESS=y
> CONFIG_IIO_ST_PRESS_I2C=y
> CONFIG_IIO_ST_PRESS_SPI=y
> CONFIG_T5403=y
> CONFIG_HP206C=y
> CONFIG_ZPA2326=y
> CONFIG_ZPA2326_I2C=y
> CONFIG_ZPA2326_SPI=y
> # end of Pressure sensors
> 
> #
> # Lightning sensors
> #
> CONFIG_AS3935=y
> # end of Lightning sensors
> 
> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=y
> CONFIG_LIDAR_LITE_V2=y
> CONFIG_MB1232=y
> # CONFIG_PING is not set
> CONFIG_RFD77402=y
> # CONFIG_SRF04 is not set
> CONFIG_SX_COMMON=y
> CONFIG_SX9310=y
> CONFIG_SX9324=y
> CONFIG_SX9360=y
> CONFIG_SX9500=y
> # CONFIG_SRF08 is not set
> CONFIG_VCNL3020=y
> # CONFIG_VL53L0X_I2C is not set
> # end of Proximity and distance sensors
> 
> #
> # Resolver to digital converters
> #
> # CONFIG_AD2S90 is not set
> # CONFIG_AD2S1200 is not set
> # end of Resolver to digital converters
> 
> #
> # Temperature sensors
> #
> CONFIG_IQS620AT_TEMP=y
> # CONFIG_LTC2983 is not set
> # CONFIG_MAXIM_THERMOCOUPLE is not set
> # CONFIG_MLX90614 is not set
> CONFIG_MLX90632=y
> # CONFIG_TMP006 is not set
> CONFIG_TMP007=y
> CONFIG_TMP117=y
> CONFIG_TSYS01=y
> # CONFIG_TSYS02D is not set
> CONFIG_MAX31856=y
> CONFIG_MAX31865=y
> # end of Temperature sensors
> 
> # CONFIG_NTB is not set
> CONFIG_PWM=y
> CONFIG_PWM_SYSFS=y
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_ATMEL is not set
> CONFIG_PWM_ATMEL_HLCDC_PWM=y
> # CONFIG_PWM_ATMEL_TCB is not set
> # CONFIG_PWM_BCM_IPROC is not set
> # CONFIG_PWM_BCM_KONA is not set
> # CONFIG_PWM_BCM2835 is not set
> # CONFIG_PWM_BERLIN is not set
> # CONFIG_PWM_BRCMSTB is not set
> CONFIG_PWM_CLK=y
> # CONFIG_PWM_CLPS711X is not set
> CONFIG_PWM_DWC=y
> # CONFIG_PWM_EP93XX is not set
> CONFIG_PWM_FSL_FTM=y
> # CONFIG_PWM_HIBVT is not set
> # CONFIG_PWM_IMG is not set
> # CONFIG_PWM_IMX1 is not set
> # CONFIG_PWM_IMX27 is not set
> # CONFIG_PWM_IMX_TPM is not set
> # CONFIG_PWM_INTEL_LGM is not set
> # CONFIG_PWM_IQS620A is not set
> # CONFIG_PWM_JZ4740 is not set
> # CONFIG_PWM_KEEMBAY is not set
> # CONFIG_PWM_LP3943 is not set
> # CONFIG_PWM_LPC18XX_SCT is not set
> # CONFIG_PWM_LPC32XX is not set
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> # CONFIG_PWM_MESON is not set
> # CONFIG_PWM_MTK_DISP is not set
> # CONFIG_PWM_MEDIATEK is not set
> # CONFIG_PWM_MXS is not set
> # CONFIG_PWM_NTXEC is not set
> # CONFIG_PWM_OMAP_DMTIMER is not set
> CONFIG_PWM_PCA9685=y
> # CONFIG_PWM_PXA is not set
> # CONFIG_PWM_RASPBERRYPI_POE is not set
> # CONFIG_PWM_RCAR is not set
> # CONFIG_PWM_RENESAS_TPU is not set
> # CONFIG_PWM_ROCKCHIP is not set
> # CONFIG_PWM_SAMSUNG is not set
> CONFIG_PWM_SIFIVE=y
> # CONFIG_PWM_SL28CPLD is not set
> # CONFIG_PWM_SPEAR is not set
> # CONFIG_PWM_SPRD is not set
> # CONFIG_PWM_STI is not set
> # CONFIG_PWM_STM32 is not set
> # CONFIG_PWM_STM32_LP is not set
> CONFIG_PWM_STMPE=y
> # CONFIG_PWM_SUN4I is not set
> # CONFIG_PWM_SUNPLUS is not set
> # CONFIG_PWM_TEGRA is not set
> # CONFIG_PWM_TIECAP is not set
> # CONFIG_PWM_TIEHRPWM is not set
> CONFIG_PWM_TWL=y
> CONFIG_PWM_TWL_LED=y
> # CONFIG_PWM_VISCONTI is not set
> # CONFIG_PWM_VT8500 is not set
> # CONFIG_PWM_XILINX is not set
> 
> #
> # IRQ chip support
> #
> CONFIG_IRQCHIP=y
> # CONFIG_AL_FIC is not set
> # CONFIG_JCORE_AIC is not set
> # CONFIG_RENESAS_INTC_IRQPIN is not set
> # CONFIG_RENESAS_IRQC is not set
> # CONFIG_RENESAS_RZA1_IRQC is not set
> # CONFIG_RENESAS_RZG2L_IRQC is not set
> # CONFIG_SL28CPLD_INTC is not set
> # CONFIG_TS4800_IRQ is not set
> CONFIG_XILINX_INTC=y
> # CONFIG_INGENIC_TCU_IRQ is not set
> # CONFIG_IRQ_UNIPHIER_AIDET is not set
> # CONFIG_MESON_IRQ_GPIO is not set
> # CONFIG_IMX_IRQSTEER is not set
> # CONFIG_IMX_INTMUX is not set
> # CONFIG_IMX_MU_MSI is not set
> CONFIG_RISCV_INTC=y
> CONFIG_SIFIVE_PLIC=y
> # CONFIG_EXYNOS_IRQ_COMBINER is not set
> # CONFIG_MST_IRQ is not set
> # CONFIG_MCHP_EIC is not set
> # CONFIG_SUNPLUS_SP7021_INTC is not set
> # end of IRQ chip support
> 
> CONFIG_IPACK_BUS=y
> CONFIG_BOARD_TPCI200=y
> CONFIG_SERIAL_IPOCTAL=y
> CONFIG_RESET_CONTROLLER=y
> # CONFIG_RESET_A10SR is not set
> # CONFIG_RESET_ATH79 is not set
> # CONFIG_RESET_AXS10X is not set
> # CONFIG_RESET_BCM6345 is not set
> # CONFIG_RESET_BERLIN is not set
> # CONFIG_RESET_BRCMSTB is not set
> # CONFIG_RESET_BRCMSTB_RESCAL is not set
> # CONFIG_RESET_HSDK is not set
> # CONFIG_RESET_IMX7 is not set
> # CONFIG_RESET_INTEL_GW is not set
> # CONFIG_RESET_K210 is not set
> # CONFIG_RESET_LANTIQ is not set
> # CONFIG_RESET_LPC18XX is not set
> # CONFIG_RESET_MCHP_SPARX5 is not set
> # CONFIG_RESET_MESON is not set
> # CONFIG_RESET_MESON_AUDIO_ARB is not set
> # CONFIG_RESET_NPCM is not set
> # CONFIG_RESET_PISTACHIO is not set
> # CONFIG_RESET_POLARFIRE_SOC is not set
> # CONFIG_RESET_QCOM_AOSS is not set
> # CONFIG_RESET_QCOM_PDC is not set
> # CONFIG_RESET_RASPBERRYPI is not set
> # CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
> # CONFIG_RESET_SCMI is not set
> CONFIG_RESET_SIMPLE=y
> # CONFIG_RESET_SOCFPGA is not set
> CONFIG_RESET_STARFIVE_JH7100=y
> # CONFIG_RESET_SUNPLUS is not set
> # CONFIG_RESET_SUNXI is not set
> # CONFIG_RESET_TI_SCI is not set
> CONFIG_RESET_TI_SYSCON=y
> CONFIG_RESET_TI_TPS380X=y
> # CONFIG_RESET_TN48M_CPLD is not set
> # CONFIG_RESET_UNIPHIER is not set
> # CONFIG_RESET_UNIPHIER_GLUE is not set
> # CONFIG_RESET_ZYNQ is not set
> # CONFIG_COMMON_RESET_HI3660 is not set
> # CONFIG_COMMON_RESET_HI6220 is not set
> 
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_PHY_LPC18XX_USB_OTG is not set
> # CONFIG_PHY_PISTACHIO_USB is not set
> # CONFIG_PHY_XGENE is not set
> CONFIG_PHY_CAN_TRANSCEIVER=y
> # CONFIG_PHY_SUN6I_MIPI_DPHY is not set
> # CONFIG_PHY_SUN50I_USB3 is not set
> # CONFIG_PHY_MESON8_HDMI_TX is not set
> # CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
> # CONFIG_PHY_MESON_G12A_USB2 is not set
> # CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
> # CONFIG_PHY_MESON_AXG_PCIE is not set
> # CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
> # CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set
> 
> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_PHY_BCM63XX_USBH is not set
> # CONFIG_PHY_CYGNUS_PCIE is not set
> # CONFIG_PHY_BCM_SR_USB is not set
> CONFIG_BCM_KONA_USB2_PHY=y
> # CONFIG_PHY_BCM_NS_USB2 is not set
> # CONFIG_PHY_NS2_USB_DRD is not set
> # CONFIG_PHY_BRCM_SATA is not set
> # CONFIG_PHY_BRCM_USB is not set
> # CONFIG_PHY_BCM_SR_PCIE is not set
> # end of PHY drivers for Broadcom platforms
> 
> CONFIG_PHY_CADENCE_TORRENT=y
> CONFIG_PHY_CADENCE_DPHY=y
> # CONFIG_PHY_CADENCE_DPHY_RX is not set
> CONFIG_PHY_CADENCE_SIERRA=y
> # CONFIG_PHY_CADENCE_SALVO is not set
> # CONFIG_PHY_FSL_IMX8MQ_USB is not set
> # CONFIG_PHY_MIXEL_LVDS_PHY is not set
> # CONFIG_PHY_MIXEL_MIPI_DPHY is not set
> # CONFIG_PHY_FSL_IMX8M_PCIE is not set
> # CONFIG_PHY_FSL_LYNX_28G is not set
> # CONFIG_PHY_HI6220_USB is not set
> # CONFIG_PHY_HI3660_USB is not set
> # CONFIG_PHY_HI3670_USB is not set
> # CONFIG_PHY_HI3670_PCIE is not set
> # CONFIG_PHY_HISTB_COMBPHY is not set
> # CONFIG_PHY_HISI_INNO_USB2 is not set
> # CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
> # CONFIG_PHY_LANTIQ_RCU_USB2 is not set
> # CONFIG_ARMADA375_USBCLUSTER_PHY is not set
> # CONFIG_PHY_BERLIN_SATA is not set
> # CONFIG_PHY_BERLIN_USB is not set
> CONFIG_PHY_MVEBU_A3700_UTMI=y
> # CONFIG_PHY_MVEBU_A38X_COMPHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=y
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_PXA_USB is not set
> # CONFIG_PHY_MMP3_USB is not set
> # CONFIG_PHY_MMP3_HSIC is not set
> # CONFIG_PHY_MTK_PCIE is not set
> # CONFIG_PHY_MTK_TPHY is not set
> # CONFIG_PHY_MTK_UFS is not set
> # CONFIG_PHY_MTK_XSPHY is not set
> # CONFIG_PHY_MTK_HDMI is not set
> # CONFIG_PHY_MTK_MIPI_DSI is not set
> # CONFIG_PHY_MTK_DP is not set
> # CONFIG_PHY_SPARX5_SERDES is not set
> # CONFIG_PHY_LAN966X_SERDES is not set
> CONFIG_PHY_OCELOT_SERDES=y
> # CONFIG_PHY_ATH79_USB is not set
> # CONFIG_PHY_QCOM_EDP is not set
> # CONFIG_PHY_QCOM_IPQ4019_USB is not set
> # CONFIG_PHY_QCOM_PCIE2 is not set
> # CONFIG_PHY_QCOM_QMP is not set
> # CONFIG_PHY_QCOM_QUSB2 is not set
> # CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
> # CONFIG_PHY_QCOM_USB_HS_28NM is not set
> # CONFIG_PHY_QCOM_USB_SS is not set
> # CONFIG_PHY_QCOM_IPQ806X_USB is not set
> # CONFIG_PHY_MT7621_PCI is not set
> # CONFIG_PHY_RALINK_USB is not set
> # CONFIG_PHY_RCAR_GEN3_USB3 is not set
> # CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
> # CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
> # CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
> # CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
> # CONFIG_PHY_ROCKCHIP_PCIE is not set
> # CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
> # CONFIG_PHY_ROCKCHIP_TYPEC is not set
> # CONFIG_PHY_EXYNOS_DP_VIDEO is not set
> # CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
> # CONFIG_PHY_EXYNOS_PCIE is not set
> # CONFIG_PHY_SAMSUNG_UFS is not set
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> # CONFIG_PHY_UNIPHIER_USB2 is not set
> # CONFIG_PHY_UNIPHIER_USB3 is not set
> # CONFIG_PHY_UNIPHIER_PCIE is not set
> CONFIG_PHY_UNIPHIER_AHCI=y
> # CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
> # CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
> # CONFIG_PHY_STIH407_USB is not set
> # CONFIG_PHY_STM32_USBPHYC is not set
> # CONFIG_PHY_SUNPLUS_USB is not set
> # CONFIG_PHY_TEGRA194_P2U is not set
> # CONFIG_PHY_DA8XX_USB is not set
> # CONFIG_PHY_AM654_SERDES is not set
> # CONFIG_PHY_J721E_WIZ is not set
> # CONFIG_OMAP_CONTROL_PHY is not set
> # CONFIG_TI_PIPE3 is not set
> # CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
> # CONFIG_PHY_INTEL_KEEMBAY_USB is not set
> # CONFIG_PHY_INTEL_LGM_COMBO is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
> # CONFIG_PHY_XILINX_ZYNQMP is not set
> # end of PHY Subsystem
> 
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=y
> # CONFIG_MCB_PCI is not set
> CONFIG_MCB_LPC=y
> # CONFIG_RAS is not set
> CONFIG_USB4=y
> CONFIG_USB4_DEBUGFS_WRITE=y
> CONFIG_USB4_DEBUGFS_MARGINING=y
> CONFIG_USB4_KUNIT_TEST=y
> # CONFIG_USB4_DMA_TEST is not set
> 
> #
> # Android
> #
> CONFIG_ANDROID_BINDER_IPC=y
> CONFIG_ANDROID_BINDERFS=y
> CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
> CONFIG_ANDROID_BINDER_IPC_SELFTEST=y
> # end of Android
> 
> CONFIG_DAX=y
> CONFIG_NVMEM=y
> CONFIG_NVMEM_SYSFS=y
> # CONFIG_NVMEM_APPLE_EFUSES is not set
> # CONFIG_NVMEM_BCM_OCOTP is not set
> # CONFIG_NVMEM_BRCM_NVRAM is not set
> # CONFIG_NVMEM_IMX_IIM is not set
> # CONFIG_NVMEM_IMX_OCOTP is not set
> # CONFIG_NVMEM_JZ4780_EFUSE is not set
> # CONFIG_NVMEM_LAN9662_OTPC is not set
> # CONFIG_NVMEM_LAYERSCAPE_SFP is not set
> # CONFIG_NVMEM_LPC18XX_EEPROM is not set
> # CONFIG_NVMEM_LPC18XX_OTP is not set
> # CONFIG_NVMEM_MESON_MX_EFUSE is not set
> # CONFIG_NVMEM_MICROCHIP_OTPC is not set
> # CONFIG_NVMEM_MTK_EFUSE is not set
> # CONFIG_NVMEM_MXS_OCOTP is not set
> # CONFIG_NVMEM_NINTENDO_OTP is not set
> # CONFIG_NVMEM_QCOM_QFPROM is not set
> CONFIG_NVMEM_RMEM=y
> # CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
> # CONFIG_NVMEM_ROCKCHIP_OTP is not set
> # CONFIG_NVMEM_SC27XX_EFUSE is not set
> # CONFIG_NVMEM_SNVS_LPGPR is not set
> # CONFIG_NVMEM_SPRD_EFUSE is not set
> # CONFIG_NVMEM_STM32_ROMEM is not set
> # CONFIG_NVMEM_SUNPLUS_OCOTP is not set
> CONFIG_NVMEM_U_BOOT_ENV=y
> # CONFIG_NVMEM_UNIPHIER_EFUSE is not set
> # CONFIG_NVMEM_VF610_OCOTP is not set
> 
> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=y
> CONFIG_INTEL_TH_PCI=y
> CONFIG_INTEL_TH_GTH=y
> CONFIG_INTEL_TH_MSU=y
> CONFIG_INTEL_TH_PTI=y
> CONFIG_INTEL_TH_DEBUG=y
> # end of HW tracing support
> 
> CONFIG_FPGA=y
> # CONFIG_FPGA_MGR_SOCFPGA is not set
> # CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
> # CONFIG_ALTERA_PR_IP_CORE is not set
> # CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
> CONFIG_FPGA_MGR_ALTERA_CVP=y
> # CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
> # CONFIG_FPGA_MGR_XILINX_SPI is not set
> # CONFIG_FPGA_MGR_ICE40_SPI is not set
> CONFIG_FPGA_MGR_MACHXO2_SPI=y
> CONFIG_FPGA_BRIDGE=y
> CONFIG_ALTERA_FREEZE_BRIDGE=y
> CONFIG_XILINX_PR_DECOUPLER=y
> CONFIG_FPGA_REGION=y
> CONFIG_OF_FPGA_REGION=y
> CONFIG_FPGA_DFL=y
> CONFIG_FPGA_DFL_AFU=y
> CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=y
> # CONFIG_FPGA_DFL_PCI is not set
> # CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
> # CONFIG_FPGA_MGR_VERSAL_FPGA is not set
> CONFIG_FPGA_MGR_MICROCHIP_SPI=y
> # CONFIG_FSI is not set
> # CONFIG_TEE is not set
> CONFIG_MULTIPLEXER=y
> 
> #
> # Multiplexer drivers
> #
> # CONFIG_MUX_ADG792A is not set
> CONFIG_MUX_ADGS1408=y
> CONFIG_MUX_GPIO=y
> CONFIG_MUX_MMIO=y
> # end of Multiplexer drivers
> 
> CONFIG_PM_OPP=y
> CONFIG_SIOX=y
> # CONFIG_SIOX_BUS_GPIO is not set
> # CONFIG_SLIMBUS is not set
> CONFIG_INTERCONNECT=y
> # CONFIG_INTERCONNECT_IMX is not set
> # CONFIG_INTERCONNECT_QCOM_OSM_L3 is not set
> # CONFIG_INTERCONNECT_SAMSUNG is not set
> # CONFIG_COUNTER is not set
> CONFIG_MOST=y
> # CONFIG_MOST_CDEV is not set
> CONFIG_PECI=y
> CONFIG_PECI_CPU=y
> # CONFIG_PECI_ASPEED is not set
> CONFIG_HTE=y
> # end of Device Drivers
> 
> #
> # File systems
> #
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=y
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=y
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_USE_FOR_EXT2=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y
> CONFIG_EXT4_DEBUG=y
> CONFIG_EXT4_KUNIT_TESTS=y
> CONFIG_JBD2=y
> CONFIG_JBD2_DEBUG=y
> CONFIG_FS_MBCACHE=y
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=y
> # CONFIG_JFS_POSIX_ACL is not set
> CONFIG_JFS_SECURITY=y
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=y
> CONFIG_XFS_FS=y
> # CONFIG_XFS_SUPPORT_V4 is not set
> CONFIG_XFS_QUOTA=y
> CONFIG_XFS_POSIX_ACL=y
> # CONFIG_XFS_RT is not set
> CONFIG_XFS_ONLINE_SCRUB=y
> # CONFIG_XFS_ONLINE_REPAIR is not set
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> CONFIG_GFS2_FS=y
> CONFIG_BTRFS_FS=y
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=y
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> CONFIG_BTRFS_FS_REF_VERIFY=y
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> # CONFIG_FILE_LOCKING is not set
> # CONFIG_FS_ENCRYPTION is not set
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=y
> CONFIG_DNOTIFY=y
> # CONFIG_INOTIFY_USER is not set
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> CONFIG_QUOTACTL=y
> CONFIG_AUTOFS4_FS=y
> CONFIG_AUTOFS_FS=y
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=y
> CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> 
> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=y
> CONFIG_FSCACHE=y
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=y
> CONFIG_CACHEFILES_DEBUG=y
> CONFIG_CACHEFILES_ONDEMAND=y
> # end of Caches
> 
> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=y
> # CONFIG_JOLIET is not set
> CONFIG_ZISOFS=y
> CONFIG_UDF_FS=y
> # end of CD-ROM/DVD Filesystems
> 
> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=y
> CONFIG_MSDOS_FS=y
> CONFIG_VFAT_FS=y
> CONFIG_FAT_DEFAULT_CODEPAGE=437
> CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> CONFIG_FAT_KUNIT_TEST=y
> CONFIG_EXFAT_FS=y
> CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
> CONFIG_NTFS_FS=y
> # CONFIG_NTFS_DEBUG is not set
> # CONFIG_NTFS_RW is not set
> CONFIG_NTFS3_FS=y
> CONFIG_NTFS3_LZX_XPRESS=y
> CONFIG_NTFS3_FS_POSIX_ACL=y
> # end of DOS/FAT/EXFAT/NT Filesystems
> 
> #
> # Pseudo filesystems
> #
> # CONFIG_PROC_FS is not set
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
> # CONFIG_HUGETLBFS is not set
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
> CONFIG_CONFIGFS_FS=y
> CONFIG_EFIVAR_FS=y
> # end of Pseudo filesystems
> 
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=y
> CONFIG_NLS_CODEPAGE_852=y
> CONFIG_NLS_CODEPAGE_855=y
> CONFIG_NLS_CODEPAGE_857=y
> CONFIG_NLS_CODEPAGE_860=y
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=y
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=y
> CONFIG_NLS_CODEPAGE_866=y
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=y
> CONFIG_NLS_CODEPAGE_950=y
> CONFIG_NLS_CODEPAGE_932=y
> CONFIG_NLS_CODEPAGE_949=y
> CONFIG_NLS_CODEPAGE_874=y
> CONFIG_NLS_ISO8859_8=y
> CONFIG_NLS_CODEPAGE_1250=y
> CONFIG_NLS_CODEPAGE_1251=y
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=y
> CONFIG_NLS_ISO8859_2=y
> CONFIG_NLS_ISO8859_3=y
> CONFIG_NLS_ISO8859_4=y
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=y
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=y
> CONFIG_NLS_ISO8859_14=y
> # CONFIG_NLS_ISO8859_15 is not set
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=y
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=y
> # CONFIG_NLS_MAC_CYRILLIC is not set
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=y
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=y
> CONFIG_NLS_MAC_ROMANIAN=y
> CONFIG_NLS_MAC_TURKISH=y
> CONFIG_NLS_UTF8=y
> CONFIG_UNICODE=y
> # CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
> CONFIG_IO_WQ=y
> # end of File systems
> 
> #
> # Security options
> #
> # CONFIG_KEYS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_SECURITY_PATH=y
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> # CONFIG_HARDENED_USERCOPY is not set
> # CONFIG_FORTIFY_SOURCE is not set
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_LOADPIN=y
> CONFIG_SECURITY_LOADPIN_ENFORCE=y
> CONFIG_SECURITY_YAMA=y
> # CONFIG_SECURITY_SAFESETID is not set
> CONFIG_SECURITY_LOCKDOWN_LSM=y
> # CONFIG_SECURITY_LOCKDOWN_LSM_EARLY is not set
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE is not set
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
> CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=y
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_IMA is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
> 
> #
> # Kernel hardening options
> #
> 
> #
> # Memory initialization
> #
> CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_ENABLER=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> # CONFIG_INIT_STACK_NONE is not set
> # CONFIG_INIT_STACK_ALL_PATTERN is not set
> CONFIG_INIT_STACK_ALL_ZERO=y
> CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> 
> CONFIG_CC_HAS_RANDSTRUCT=y
> CONFIG_RANDSTRUCT_NONE=y
> # CONFIG_RANDSTRUCT_FULL is not set
> # end of Kernel hardening options
> # end of Security options
> 
> CONFIG_XOR_BLOCKS=y
> CONFIG_CRYPTO=y
> 
> #
> # Crypto core or helper
> #
> # CONFIG_CRYPTO_FIPS is not set
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> # CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
> CONFIG_CRYPTO_GF128MUL=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=y
> CONFIG_CRYPTO_TEST=y
> # end of Crypto core or helper
> 
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
> CONFIG_CRYPTO_ECC=y
> # CONFIG_CRYPTO_ECDH is not set
> CONFIG_CRYPTO_ECDSA=y
> CONFIG_CRYPTO_ECRDSA=y
> # CONFIG_CRYPTO_SM2 is not set
> CONFIG_CRYPTO_CURVE25519=y
> # end of Public-key cryptography
> 
> #
> # Block ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=y
> CONFIG_CRYPTO_ARIA=y
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> CONFIG_CRYPTO_CAST6=y
> CONFIG_CRYPTO_DES=y
> CONFIG_CRYPTO_FCRYPT=y
> CONFIG_CRYPTO_SERPENT=y
> CONFIG_CRYPTO_SM4=y
> CONFIG_CRYPTO_SM4_GENERIC=y
> CONFIG_CRYPTO_TWOFISH=y
> CONFIG_CRYPTO_TWOFISH_COMMON=y
> # end of Block ciphers
> 
> #
> # Length-preserving ciphers and modes
> #
> # CONFIG_CRYPTO_ADIANTUM is not set
> CONFIG_CRYPTO_CHACHA20=y
> # CONFIG_CRYPTO_CBC is not set
> CONFIG_CRYPTO_CFB=y
> CONFIG_CRYPTO_CTR=y
> CONFIG_CRYPTO_CTS=y
> CONFIG_CRYPTO_ECB=y
> CONFIG_CRYPTO_HCTR2=y
> CONFIG_CRYPTO_KEYWRAP=y
> CONFIG_CRYPTO_LRW=y
> CONFIG_CRYPTO_OFB=y
> # CONFIG_CRYPTO_PCBC is not set
> CONFIG_CRYPTO_XCTR=y
> CONFIG_CRYPTO_XTS=y
> # end of Length-preserving ciphers and modes
> 
> #
> # AEAD (authenticated encryption with associated data) ciphers
> #
> CONFIG_CRYPTO_AEGIS128=y
> CONFIG_CRYPTO_CHACHA20POLY1305=y
> CONFIG_CRYPTO_CCM=y
> CONFIG_CRYPTO_GCM=y
> CONFIG_CRYPTO_SEQIV=y
> CONFIG_CRYPTO_ECHAINIV=y
> # CONFIG_CRYPTO_ESSIV is not set
> # end of AEAD (authenticated encryption with associated data) ciphers
> 
> #
> # Hashes, digests, and MACs
> #
> CONFIG_CRYPTO_BLAKE2B=y
> CONFIG_CRYPTO_CMAC=y
> CONFIG_CRYPTO_GHASH=y
> CONFIG_CRYPTO_HMAC=y
> # CONFIG_CRYPTO_MD4 is not set
> CONFIG_CRYPTO_MD5=y
> CONFIG_CRYPTO_MICHAEL_MIC=y
> CONFIG_CRYPTO_POLYVAL=y
> CONFIG_CRYPTO_POLY1305=y
> # CONFIG_CRYPTO_RMD160 is not set
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> # CONFIG_CRYPTO_SHA3 is not set
> # CONFIG_CRYPTO_SM3_GENERIC is not set
> CONFIG_CRYPTO_STREEBOG=y
> # CONFIG_CRYPTO_VMAC is not set
> # CONFIG_CRYPTO_WP512 is not set
> CONFIG_CRYPTO_XCBC=y
> CONFIG_CRYPTO_XXHASH=y
> # end of Hashes, digests, and MACs
> 
> #
> # CRCs (cyclic redundancy checks)
> #
> CONFIG_CRYPTO_CRC32C=y
> CONFIG_CRYPTO_CRC32=y
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_CRC64_ROCKSOFT=y
> # end of CRCs (cyclic redundancy checks)
> 
> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_842=y
> CONFIG_CRYPTO_LZ4=y
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=y
> # end of Compression
> 
> #
> # Random number generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=y
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> # end of Random number generation
> 
> #
> # Userspace interface
> #
> # end of Userspace interface
> 
> CONFIG_CRYPTO_HASH_INFO=y
> # CONFIG_CRYPTO_HW is not set
> 
> #
> # Certificates for signature checking
> #
> # end of Certificates for signature checking
> 
> #
> # Library routines
> #
> CONFIG_RAID6_PQ=y
> # CONFIG_RAID6_PQ_BENCHMARK is not set
> CONFIG_LINEAR_RANGES=y
> CONFIG_PACKING=y
> CONFIG_BITREVERSE=y
> CONFIG_GENERIC_STRNCPY_FROM_USER=y
> CONFIG_GENERIC_STRNLEN_USER=y
> CONFIG_CORDIC=y
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=y
> CONFIG_GENERIC_PCI_IOMAP=y
> 
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_UTILS=y
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA1=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # end of Crypto library routines
> 
> CONFIG_CRC_CCITT=y
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> CONFIG_CRC64_ROCKSOFT=y
> CONFIG_CRC_ITU_T=y
> CONFIG_CRC32=y
> CONFIG_CRC32_SELFTEST=y
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=y
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=y
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=y
> CONFIG_LIBCRC32C=y
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> CONFIG_RANDOM32_SELFTEST=y
> CONFIG_842_COMPRESS=y
> CONFIG_842_DECOMPRESS=y
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=y
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=y
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMMON=y
> CONFIG_ZSTD_COMPRESS=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> CONFIG_XZ_DEC_X86=y
> CONFIG_XZ_DEC_POWERPC=y
> CONFIG_XZ_DEC_IA64=y
> # CONFIG_XZ_DEC_ARM is not set
> CONFIG_XZ_DEC_ARMTHUMB=y
> # CONFIG_XZ_DEC_SPARC is not set
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=y
> CONFIG_XZ_DEC_TEST=y
> CONFIG_DECOMPRESS_GZIP=y
> CONFIG_DECOMPRESS_BZIP2=y
> CONFIG_DECOMPRESS_LZMA=y
> CONFIG_DECOMPRESS_LZO=y
> CONFIG_DECOMPRESS_LZ4=y
> CONFIG_DECOMPRESS_ZSTD=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_REED_SOLOMON=y
> CONFIG_REED_SOLOMON_ENC16=y
> CONFIG_REED_SOLOMON_DEC16=y
> CONFIG_BCH=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_DMA_DECLARE_COHERENT=y
> CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
> CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
> CONFIG_DMA_NONCOHERENT_MMAP=y
> CONFIG_DMA_COHERENT_POOL=y
> CONFIG_DMA_DIRECT_REMAP=y
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=y
> CONFIG_GLOB=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_GENERIC_ATOMIC64=y
> CONFIG_CLZ_TAB=y
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=y
> CONFIG_LIBFDT=y
> CONFIG_OID_REGISTRY=y
> CONFIG_UCS2_STRING=y
> CONFIG_FONT_SUPPORT=y
> CONFIG_FONT_8x16=y
> CONFIG_FONT_AUTOSELECT=y
> CONFIG_SG_POOL=y
> CONFIG_ARCH_STACKWALK=y
> CONFIG_STACKDEPOT=y
> CONFIG_REF_TRACKER=y
> CONFIG_SBITMAP=y
> # CONFIG_PARMAN is not set
> # CONFIG_OBJAGG is not set
> # end of Library routines
> 
> CONFIG_GENERIC_IOREMAP=y
> CONFIG_GENERIC_LIB_ASHLDI3=y
> CONFIG_GENERIC_LIB_ASHRDI3=y
> CONFIG_GENERIC_LIB_LSHRDI3=y
> CONFIG_GENERIC_LIB_UCMPDI2=y
> CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED=y
> 
> #
> # Kernel hacking
> #
> 
> #
> # printk and dmesg options
> #
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> CONFIG_SYMBOLIC_ERRNAME=y
> # end of printk and dmesg options
> 
> CONFIG_DEBUG_KERNEL=y
> # CONFIG_DEBUG_MISC is not set
> 
> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=y
> CONFIG_AS_HAS_NON_CONST_LEB128=y
> # CONFIG_DEBUG_INFO_NONE is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> CONFIG_DEBUG_INFO_DWARF4=y
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_DEBUG_INFO_REDUCED=y
> CONFIG_PAHOLE_HAS_SPLIT_BTF=y
> CONFIG_PAHOLE_HAS_BTF_TAG=y
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=1024
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_HEADERS_INSTALL=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> CONFIG_ARCH_WANT_FRAME_POINTERS=y
> CONFIG_FRAME_POINTER=y
> # CONFIG_VMLINUX_MAP is not set
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
> # end of Compile-time checks and compiler options
> 
> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=y
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_FS=y
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=y
> CONFIG_HAVE_ARCH_KGDB_QXFER_PKT=y
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
> 
> #
> # Networking Debugging
> #
> # end of Networking Debugging
> 
> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=y
> CONFIG_DEBUG_PAGEALLOC=y
> # CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT is not set
> CONFIG_DEBUG_SLAB=y
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_TABLE_CHECK is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=y
> CONFIG_DEBUG_WX=y
> CONFIG_GENERIC_PTDUMP=y
> CONFIG_PTDUMP_CORE=y
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SHRINKER_DEBUG=y
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
> CONFIG_DEBUG_VM_IRQSOFF=y
> CONFIG_DEBUG_VM=y
> # CONFIG_DEBUG_VM_MAPLE_TREE is not set
> CONFIG_DEBUG_VM_RB=y
> # CONFIG_DEBUG_VM_PGFLAGS is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> # end of Memory Debugging
> 
> CONFIG_DEBUG_SHIRQ=y
> 
> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_PANIC_TIMEOUT=0
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # end of Debug Oops, Lockups and Hangs
> 
> #
> # Scheduler Debugging
> #
> # end of Scheduler Debugging
> 
> # CONFIG_DEBUG_TIMEKEEPING is not set
> 
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> CONFIG_DEBUG_LOCKDEP=y
> # CONFIG_DEBUG_ATOMIC_SLEEP is not set
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_WW_MUTEX_SELFTEST=y
> # CONFIG_SCF_TORTURE_TEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> 
> CONFIG_DEBUG_IRQFLAGS=y
> CONFIG_STACKTRACE=y
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
> # CONFIG_DEBUG_KOBJECT is not set
> 
> #
> # Debug kernel data structures
> #
> # CONFIG_DEBUG_LIST is not set
> CONFIG_DEBUG_PLIST=y
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=y
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_DEBUG_MAPLE_TREE is not set
> # end of Debug kernel data structures
> 
> # CONFIG_DEBUG_CREDENTIALS is not set
> 
> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=y
> # CONFIG_RCU_SCALE_TEST is not set
> CONFIG_RCU_TORTURE_TEST=y
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_TRACE=y
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> 
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_TRACING_SUPPORT=y
> # CONFIG_FTRACE is not set
> # CONFIG_SAMPLES is not set
> CONFIG_STRICT_DEVMEM=y
> CONFIG_IO_STRICT_DEVMEM=y
> 
> #
> # riscv Debugging
> #
> # end of riscv Debugging
> 
> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=y
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_KUNIT_TEST=y
> CONFIG_KUNIT_EXAMPLE_TEST=y
> CONFIG_KUNIT_ALL_TESTS=y
> CONFIG_KUNIT_DEFAULT_ENABLED=y
> CONFIG_NOTIFIER_ERROR_INJECTION=y
> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAILSLAB=y
> CONFIG_FAIL_PAGE_ALLOC=y
> # CONFIG_FAULT_INJECTION_USERCOPY is not set
> CONFIG_FAIL_MAKE_REQUEST=y
> CONFIG_FAIL_IO_TIMEOUT=y
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> CONFIG_FAIL_MMC_REQUEST=y
> # CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is not set
> CONFIG_ARCH_HAS_KCOV=y
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_KCOV=y
> # CONFIG_KCOV_ENABLE_COMPARISONS is not set
> CONFIG_KCOV_INSTRUMENT_ALL=y
> CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
> CONFIG_RUNTIME_TESTING_MENU=y
> # CONFIG_LKDTM is not set
> CONFIG_CPUMASK_KUNIT_TEST=y
> CONFIG_TEST_LIST_SORT=y
> # CONFIG_TEST_MIN_HEAP is not set
> CONFIG_TEST_SORT=y
> CONFIG_TEST_DIV64=y
> CONFIG_BACKTRACE_SELF_TEST=y
> CONFIG_TEST_REF_TRACKER=y
> # CONFIG_RBTREE_TEST is not set
> CONFIG_REED_SOLOMON_TEST=y
> CONFIG_INTERVAL_TREE_TEST=y
> CONFIG_ATOMIC64_SELFTEST=y
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> CONFIG_TEST_STRING_HELPERS=y
> # CONFIG_TEST_STRSCPY is not set
> CONFIG_TEST_KSTRTOX=y
> CONFIG_TEST_PRINTF=y
> # CONFIG_TEST_SCANF is not set
> CONFIG_TEST_BITMAP=y
> CONFIG_TEST_UUID=y
> CONFIG_TEST_XARRAY=y
> CONFIG_TEST_RHASHTABLE=y
> # CONFIG_TEST_SIPHASH is not set
> CONFIG_TEST_IDA=y
> CONFIG_FIND_BIT_BENCHMARK=y
> CONFIG_TEST_FIRMWARE=y
> CONFIG_BITFIELD_KUNIT=y
> CONFIG_HASH_KUNIT_TEST=y
> CONFIG_RESOURCE_KUNIT_TEST=y
> CONFIG_SYSCTL_KUNIT_TEST=y
> CONFIG_LIST_KUNIT_TEST=y
> CONFIG_LINEAR_RANGES_TEST=y
> CONFIG_CMDLINE_KUNIT_TEST=y
> CONFIG_BITS_TEST=y
> CONFIG_RATIONAL_KUNIT_TEST=y
> CONFIG_MEMCPY_KUNIT_TEST=y
> CONFIG_IS_SIGNED_TYPE_KUNIT_TEST=y
> CONFIG_OVERFLOW_KUNIT_TEST=y
> CONFIG_STACKINIT_KUNIT_TEST=y
> CONFIG_TEST_UDELAY=y
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_TEST_FREE_PAGES=y
> CONFIG_ARCH_USE_MEMTEST=y
> CONFIG_MEMTEST=y
> # end of Kernel Testing and Coverage
> 
> #
> # Rust hacking
> #
> # end of Rust hacking
> 
> # CONFIG_WARN_MISSING_DOCUMENTS is not set
> # CONFIG_WARN_ABI_ERRORS is not set
> # end of Kernel hacking

