Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A61A6104A5F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 06:49:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JTD515w7zDqx4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 16:49:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="E51jPiML"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JTB91BtTzDqtN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 16:48:15 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id p26so1082458pfq.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 21:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wa73ulDcdMqid6cKJ/BTHq8+H2A3Gfva29dZggFHzA8=;
 b=E51jPiMLfbYPnG9FwESXLouuo710bazXs9aYauFDGqvyNdFyZSbnNIg0PEaUunanYm
 OZ4M+cF47EehXlIFKJ0cqf8ZlCa9BGdeIijNzy4VCpaFKCJ+AdJdya7u+JTvxtsL1wtX
 AKoQemTQu/o64o2LlylddXsoWvmysDkx32KtNiLmUZte0F20wAWWgzRuhlR3HgVRToEF
 JSOlf+4aU1z3i5YIXxsPDI2+e1U5ke8ZBts37+tM4HbMFl8GBk86djrTeGf1yxSd6rRU
 ZSDe3VihhL567cLUs/wiYaXWq7jW0daQvxRe6N79IZ+SF9n2/WaCSY8FOXq+KFpV0rj2
 NHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wa73ulDcdMqid6cKJ/BTHq8+H2A3Gfva29dZggFHzA8=;
 b=Q78z440d+Vg/DI5uV6u0AdtzQuuNzXiP7pJpHi75ejsUEfuJexeF6mE8+uyrBZpOac
 trFJdRSNo+yTZIKEIcos0yEZQjb6m6mi8TbgoK0lV0xbYoFMYsOwA2xKdxjl0eCcdTca
 vXBApiy5pklnWCWOqc/U7WVV3JRjQ7y9qx2z0pz5FBRD+G8GTQfQRyX1H9P3l41LwPYa
 ycdtvfyeHDZuUljiEslK/mLThhoNwRp8pFjILo5ksMBEAIsHVD/lc9/6J4oivoXSIEwC
 tdpklgGXVQnfW/GsbP3N0hd5TCkwQXz8NiDBYIOV2ZyyzvrAOk8G1JSY92S7ZaAxO5UN
 YyFQ==
X-Gm-Message-State: APjAAAVIt82omlC7fKb4govRHCsdHEtUQi21gklMna9J95yYQNOPk0NJ
 ssQJIrVDO+lY8KXF0nEIhczzqA==
X-Google-Smtp-Source: APXvYqyBMf3bsxuIy399bFzJ+s8N/7zAdYnW1eQOcByOjQKh2kPPqUZUGfuiJ/xUe1Rf2iUS2JZIzw==
X-Received: by 2002:a63:3c6:: with SMTP id 189mr7505380pgd.4.1574315293312;
 Wed, 20 Nov 2019 21:48:13 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id s1sm1260526pgk.9.2019.11.20.21.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 21:48:12 -0800 (PST)
Subject: Re: [Very RFC 07/46] powernv/pci: Rework IODA PE device accounting
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-8-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <16854f35-997c-bdc6-41e2-bee3b3c2043c@ozlabs.ru>
Date: Thu, 21 Nov 2019 16:48:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-8-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2019 12:28, Oliver O'Halloran wrote:
> The current process for configuring the IODA PEs for normal PCI devices is
> abit stupid.

This phrase should go.


> After assigning MMIO resources for the devices on a bus the
> actual PE asignment occurs when pcibios_setup_bridge() is called for the
> parent bridge. In pcibios_setup_bridge() we:
> 
> 1. Assign all 256 devfn's for the subordinate bus to the PE corresponding
>    to the bridge window.
> 2. Initialise the IOMMU tables for that PE.
> 3. Traverse each device on the bus below the bridge setting the IOMMU table
>    pointer to point at the PE's table.
> 4. Finally, set pci_dn->pe_number to indicate that we've done the
>    per-device setup and allow EEH and the platform code to look up
>    the PE number.
> 
> Although mostly functional, there's a couple of issues with this approach.
> The most glaring is that it mixes the per-bus (per-PE really) setup with
> the per-device setup in a way that's completely asymmetric to what happens
> when tearing down a device.
> 
> In step 4. the number of devices in the PE is counted and stored in the
> ioda_pe structure. When releasing a pci_dev the device count is dropped
> until it hits zero where the ioda_pe itself is torn down. However, the bus
> itself remains active and can be re-scanned to bring back the devices that
> were removed. On a rescan we do not re-run the bridge setup so the
> per-device setup is never re-done which results in the re-scanned being
> unusable.
> 
> There are a few other minor issues too. Associating all 256 devfns with
> the PE means that config accesses to non-existant PCI devices results
> in a spurious PE freezes. We currently prevent this by only allowing config
> accesses to a BDFN when there is a corresponding pci_dn structure. We
> would like to eliminate that restriction in the future though.
> 
> That all said the biggest issue is that the current behaviour is hard to
> follow at the best of times. On top of that the behaviour is slightly (or
> majorly) different across each PHB type (PCIe, OpenCAPI, NVLink) and the
> behaviour for physical devices (described above) and virtual functions is
> again different. To address this we want to merge the paths as much as
> possible so that the PowerNV specific PCI initialisation steps all occur
> at roughly the same point in the PCI device setup path.
> 
> We can address most of these problems by moving the PE setup out of
> pcibios_setup_bridge() and into pcibios_bus_add_device(). The latter is
> called on a per-device basis so we have some symmetry between the setup and
> teardown paths. Moving the PE assignments to here should also allow us to
> converge how PE assignment works on all PHB types so it's always done in
> one place.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 112 +++++++++++-----------
>  1 file changed, 58 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index c6ea7a504e04..c74521e5f3ab 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -51,6 +51,7 @@ static const char * const pnv_phb_names[] = { "IODA1", "IODA2", "NPU_NVLINK",
>  					      "NPU_OCAPI" };
>  
>  static void pnv_pci_ioda2_set_bypass(struct pnv_ioda_pe *pe, bool enable);
> +static void pnv_pci_configure_bus(struct pci_bus *bus);


Do not need this, at least, after 46/46.

>  
>  void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>  			    const char *fmt, ...)
> @@ -1104,34 +1105,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  	return pe;
>  }
>  
> -static void pnv_ioda_setup_same_PE(struct pci_bus *bus, struct pnv_ioda_pe *pe)
> -{
> -	struct pci_dev *dev;
> -
> -	list_for_each_entry(dev, &bus->devices, bus_list) {
> -		struct pci_dn *pdn = pci_get_pdn(dev);
> -
> -		if (pdn == NULL) {
> -			pr_warn("%s: No device node associated with device !\n",
> -				pci_name(dev));
> -			continue;
> -		}
> -
> -		/*
> -		 * In partial hotplug case, the PCI device might be still
> -		 * associated with the PE and needn't attach it to the PE
> -		 * again.
> -		 */
> -		if (pdn->pe_number != IODA_INVALID_PE)
> -			continue;
> -
> -		pe->device_count++;
> -		pdn->pe_number = pe->pe_number;
> -		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
> -			pnv_ioda_setup_same_PE(dev->subordinate, pe);
> -	}
> -}
> -
>  /*
>   * There're 2 types of PCI bus sensitive PEs: One that is compromised of
>   * single PCI bus. Another one that contains the primary PCI bus and its
> @@ -1152,7 +1125,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
>  	pe_num = phb->ioda.pe_rmap[bus->number << 8];
>  	if (pe_num != IODA_INVALID_PE) {
>  		pe = &phb->ioda.pe_array[pe_num];
> -		pnv_ioda_setup_same_PE(bus, pe);
>  		return NULL;
>  	}
>  
> @@ -1196,9 +1168,6 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
>  		return NULL;
>  	}
>  
> -	/* Associate it with all child devices */
> -	pnv_ioda_setup_same_PE(bus, pe);
> -
>  	/* Put PE to the list */
>  	list_add_tail(&pe->list, &phb->ioda.pe_list);
>  
> @@ -1758,23 +1727,20 @@ static void pnv_pci_ioda_dma_dev_setup(struct pnv_phb *phb, struct pci_dev *pdev
>  	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pnv_ioda_pe *pe;
>  
> -	/*
> -	 * The function can be called while the PE#
> -	 * hasn't been assigned. Do nothing for the
> -	 * case.
> -	 */
> -	if (!pdn || pdn->pe_number == IODA_INVALID_PE)
> -		return;
> -
>  	pe = &phb->ioda.pe_array[pdn->pe_number];
>  	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
>  	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
>  	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
> +
> +	pe->device_count++;
> +
>  	/*
>  	 * Note: iommu_add_device() will fail here as
>  	 * for physical PE: the device is already added by now;
>  	 * for virtual PE: sysfs entries are not ready yet and
>  	 * tce_iommu_bus_notifier will add the device to a group later.
> +	 *
> +	 * XXX: this is wrong since the re-ordering patch.


What is that re-ordering patch and why it did not remove this comment then?



>  	 */
>  }
>  
> @@ -2288,9 +2254,6 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
>  	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
>  	iommu_init_table(tbl, phb->hose->node, 0, 0);
>  
> -	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
> -		pnv_ioda_setup_bus_dma(pe, pe->pbus);
> -
>  	return;
>   fail:
>  	/* XXX Failure: Try to fallback to 64-bit only ? */
> @@ -2626,9 +2589,9 @@ static void pnv_pci_ioda_setup_iommu_api(void)
>  	/*
>  	 * There are 4 types of PEs:
>  	 * - PNV_IODA_PE_BUS: a downstream port with an adapter,
> -	 *   created from pnv_pci_setup_bridge();
> +	 *   created from pnv_pci_configure_bus();
>  	 * - PNV_IODA_PE_BUS_ALL: a PCI-PCIX bridge with devices behind it,
> -	 *   created from pnv_pci_setup_bridge();
> +	 *   created from pnv_pci_configure_bus();
>  	 * - PNV_IODA_PE_VF: a SRIOV virtual function,
>  	 *   created from pnv_pcibios_sriov_enable();
>  	 * - PNV_IODA_PE_DEV: an NPU or OCAPI device,
> @@ -2748,8 +2711,10 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
>  	if (rc)
>  		return;
>  
> -	if (pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL))
> -		pnv_ioda_setup_bus_dma(pe, pe->pbus);
> +	/*
> +	 * The IOMMU table for the PE is associated with the device in
> +	 * pnv_pcibios_bus_add_device()
> +	 */


Is it really? eeh_add_device_late or pnv_eeh_probe_pdev do not seem to
be doing this.


>  }
>  
>  int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
> @@ -3324,16 +3289,13 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
>  	}
>  }
>  
> -static void pnv_pci_setup_bridge(struct pci_bus *bus, unsigned long type)
> +static void pnv_pci_configure_bus(struct pci_bus *bus)
>  {
>  	struct pci_controller *hose = pci_bus_to_host(bus);
>  	struct pnv_phb *phb = hose->private_data;
>  	struct pci_dev *bridge = bus->self;
>  	struct pnv_ioda_pe *pe;
> -	bool all = (pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
> -
> -	/* Extend bridge's windows if necessary */
> -	pnv_pci_fixup_bridge_resources(bus, type);
> +	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
>  
>  	/* The PE for root bus should be realized before any one else */
>  	if (!phb->ioda.root_pe_populated) {
> @@ -3342,12 +3304,21 @@ static void pnv_pci_setup_bridge(struct pci_bus *bus, unsigned long type)
>  			phb->ioda.root_pe_idx = pe->pe_number;
>  			phb->ioda.root_pe_populated = true;
>  		}
> +
> +		/* no need to re-configure the root bus */
> +		if (bus == phb->hose->bus)
> +			return;
>  	}
>  
>  	/* Don't assign PE to PCI bus, which doesn't have subordinate devices */
>  	if (list_empty(&bus->devices))
>  		return;
>  
> +	/* PE should never be re-configured */
> +	pe = __pnv_ioda_get_pe(phb, bus->number << 8);
> +	if (WARN_ON(pe))
> +		return;
> +
>  	/* Reserve PEs according to used M64 resources */
>  	pnv_ioda_reserve_m64_pe(bus, NULL, all);
>  
> @@ -3654,6 +3625,39 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  {
>  	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
>  	struct pnv_phb *phb = hose->private_data;
> +	struct pci_dn *pdn = pci_get_pdn(pdev);
> +	struct pnv_ioda_pe *pe;
> +
> +	/* Check if the BDFN for this device is associated with a PE yet */
> +	pe = __pnv_ioda_get_pe(phb, pdev->devfn | (pdev->bus->number << 8));
> +	if (!pe) {
> +		/*
> +		 * We should only hit this path for "normal" PCI PHBs. The


We should only hit this path only for PCIe-PCIx bridges, right? If yes,
should not this be in pnv_pci_dma_bus_setup()? If no, I am lost :(


> +		 * special PHBs used for OpenCAPI and NVLink don't have to
> +		 * deal with eeh-on-mmio so they assign PEs at probe time
> +		 * rather than after resources are allocated.
> +		 */
> +		WARN_ON(phb->type != PNV_PHB_IODA2 && phb->type != PNV_PHB_IODA1);
> +		/* PEs for VFs should have been assigned in sriov_enable() */
> +		WARN_ON(pdev->is_virtfn);
> +
> +		pnv_pci_configure_bus(pdev->bus);
> +		pe = __pnv_ioda_get_pe(phb, pdev->devfn | (pdev->bus->number << 8));
> +		pci_err(pdev, "Configured new pe PE#%x\n", pe ? pe->pe_number : 0xfffff);
> +
> +


An extra empty line.

> +		/*
> +		 * If we can't setup the IODA PE something has gone horribly
> +		 * wrong and we can't enable DMA for the device.
> +		 */
> +		if (WARN_ON(!pe))
> +			return;
> +	} else {
> +		pci_err(pdev, "Added to existing PE#%x\n", pe->pe_number);
> +	}
> +
> +	if (pdn)
> +		pdn->pe_number = pe->pe_number;
>  
>  	pnv_pci_ioda_dma_dev_setup(phb, pdev);

Open code pnv_pci_ioda_dma_dev_setup()?

Or at least do pe->device_count++ here?


>  }
> @@ -3680,14 +3684,14 @@ void pnv_pci_dma_bus_setup(struct pci_bus *bus)
>  
>  static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
>  	.dma_dev_setup		= pnv_pci_dma_dev_setup,
> -	.dma_bus_setup		= pnv_pci_dma_bus_setup,
> +	.dma_bus_setup		= pnv_pci_dma_bus_setup, /* NB: DMA setup actually happens in dma_dev_setup */

The comment does not help much imho.


>  	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
>  	.setup_msi_irqs		= pnv_setup_msi_irqs,
>  	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
>  	.enable_device_hook	= pnv_pci_enable_device_hook,
>  	.release_device		= pnv_pci_release_device,
>  	.window_alignment	= pnv_pci_window_alignment,
> -	.setup_bridge		= pnv_pci_setup_bridge,
> +	.setup_bridge		= pnv_pci_fixup_bridge_resources,


Using "fixup" in the name of a "setup" hook is ... mmmm.... contemporary :)



>  	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>  	.shutdown		= pnv_pci_ioda_shutdown,
>  };
> 

-- 
Alexey
