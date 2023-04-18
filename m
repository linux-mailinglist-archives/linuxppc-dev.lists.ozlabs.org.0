Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C40196E697D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 18:27:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q18V25XZjz3fR4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 02:27:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.181; helo=mail-oi1-f181.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q18TT4J6kz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 02:27:24 +1000 (AEST)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-38bef0af6e9so582595b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 09:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681835242; x=1684427242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA3Wj6o+Guvdyn6RVWvc15n99JJqv1Kt6CugaXzG/F8=;
        b=MQPHASU6Pe4PFzSmElsNJfNQaCtoZffjgHAWHQSd1HkeLzD+7W+Fe8p+ca6iGWgSG1
         0qrdEkvG1EiYkKahLPhKDW2ag5jd46TC8MAtpQrhvU86YuetuG7A/U5GPwdKu8AmsuLJ
         4t2CPmpJJY6DC/z+BnlpX+sYao+IsKjZu8kNNWO0qDDDdMU398UC7Nd3kiJnTfPdnGzh
         BzdiAtArUbRL8E/ur1DGFWQNY/j6ZYZDIpK3u/8YPfxdTTiPj/bNlII8yR1JdLAqH2OR
         p93zb14bj9snukANJ+HDjA4ZINmyRRmSWtZCoYGQg/R7zE6pRt0SPE9TQMDco3LvL6am
         F8Rg==
X-Gm-Message-State: AAQBX9cWX2H4699r8OsZfrEqZX5c6jVnx1eLKMrHe62oZxtlBu8jbX/k
	fjDfvwL7JRw/plYyHd0vQw==
X-Google-Smtp-Source: AKy350bBHLRqNa07Du4N0WmT6K0vuSFaG9g8fJGUXZXaLSnM3rdYMjG2JcU3ECFR82i0sqHbDMgiyw==
X-Received: by 2002:a05:6808:2203:b0:38e:390b:777b with SMTP id bd3-20020a056808220300b0038e390b777bmr1228732oib.59.1681835241818;
        Tue, 18 Apr 2023 09:27:21 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i11-20020aca3b0b000000b0038c235e24fesm2204031oia.48.2023.04.18.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 09:27:20 -0700 (PDT)
Received: (nullmailer pid 1810183 invoked by uid 1000);
	Tue, 18 Apr 2023 16:27:19 -0000
Date: Tue, 18 Apr 2023 11:27:19 -0500
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] PCI: Use of_property_present() for testing DT property
 presence
Message-ID: <20230418162719.GF1764573-robh@kernel.org>
References: <20230310144719.1544443-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144719.1544443-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 10, 2023 at 08:47:19AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/pci/controller/pci-tegra.c     | 4 ++--
>  drivers/pci/controller/pcie-mediatek.c | 2 +-
>  drivers/pci/hotplug/rpaphp_core.c      | 4 ++--
>  drivers/pci/of.c                       | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Ping!

> 
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 74c109f14ff0..79630885b9c8 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -1375,7 +1375,7 @@ static int tegra_pcie_phys_get(struct tegra_pcie *pcie)
>  	struct tegra_pcie_port *port;
>  	int err;
>  
> -	if (!soc->has_gen2 || of_find_property(np, "phys", NULL) != NULL)
> +	if (!soc->has_gen2 || of_property_present(np, "phys"))
>  		return tegra_pcie_phys_get_legacy(pcie);
>  
>  	list_for_each_entry(port, &pcie->ports, list) {
> @@ -1944,7 +1944,7 @@ static bool of_regulator_bulk_available(struct device_node *np,
>  	for (i = 0; i < num_supplies; i++) {
>  		snprintf(property, 32, "%s-supply", supplies[i].supply);
>  
> -		if (of_find_property(np, property, NULL) == NULL)
> +		if (!of_property_present(np, property))
>  			return false;
>  	}
>  
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index ae5ad05ddc1d..31de7a29192c 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -643,7 +643,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>  		return err;
>  	}
>  
> -	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> +	if (of_property_present(dev->of_node, "interrupt-names"))
>  		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
>  	else
>  		port->irq = platform_get_irq(pdev, port->slot);
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index 491986197c47..2316de0fd198 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -278,7 +278,7 @@ int rpaphp_check_drc_props(struct device_node *dn, char *drc_name,
>  		return -EINVAL;
>  	}
>  
> -	if (of_find_property(dn->parent, "ibm,drc-info", NULL))
> +	if (of_property_present(dn->parent, "ibm,drc-info"))
>  		return rpaphp_check_drc_props_v2(dn, drc_name, drc_type,
>  						be32_to_cpu(*my_index));
>  	else
> @@ -440,7 +440,7 @@ int rpaphp_add_slot(struct device_node *dn)
>  	if (!of_node_name_eq(dn, "pci"))
>  		return 0;
>  
> -	if (of_find_property(dn, "ibm,drc-info", NULL))
> +	if (of_property_present(dn, "ibm,drc-info"))
>  		return rpaphp_drc_info_add_slot(dn);
>  	else
>  		return rpaphp_drc_add_slot(dn);
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 196834ed44fe..e085f2eca372 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -447,7 +447,7 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
>  		return -ENODEV;
>  
>  	/* Local interrupt-map in the device node? Use it! */
> -	if (of_get_property(dn, "interrupt-map", NULL)) {
> +	if (of_property_present(dn, "interrupt-map")) {
>  		pin = pci_swizzle_interrupt_pin(pdev, pin);
>  		ppnode = dn;
>  	}
> -- 
> 2.39.2
> 
