Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4440C19F30D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:56:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wmCl3xc4zDqlY
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:56:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=pYIHgY6t; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wm6F3pWjzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:52:05 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c23so7304076pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eyjTVsDBVSTqAuVdH6X6u9xt4/8a+99MP+gSB7++huM=;
 b=pYIHgY6t0IGwkeDaH4wOPypy5GtP1AQ+lgEMjylDppgQ5I7bRCTVcwBQ4+r7Y17crS
 2tzLKAeDlltremxT/FfTN3RR3eJs0EWGgLeXJiFYS6i5nn7/x9SfPJYFwpIF/x/ebqsW
 F7JsRwGBrfQZrLDocdBhI/0nEtEaUnphSRTn/WACGCl4S54c8I42BpNMXHjPQ5DBZLCO
 OAL5JgkAF1dv9gfIYwD61SJNCoOLIDeVKxRwmP7yEyx00Htz/ecwUak5IVMBDEQcQoL4
 TRflL1ubPZN8jEePs22fqIvMawbH9ZcsN55mKa9KubJ2dbhfMmhpjtYMyVdHYtE5pFC3
 6yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eyjTVsDBVSTqAuVdH6X6u9xt4/8a+99MP+gSB7++huM=;
 b=V6uO3vkrflEVCqVKEY4Nm7HsBLS0/06/emlEF49M77ogVmGdB5IclwprJuoSPXUR5k
 DFJ2a9PcTWgUJPLYy6bG600zt9PEdyxvg0f/cbRIe8f9twxSadolYnBMRN2RHbtT0QLG
 66koqD4Hnmz1CSmnl1VWa4WkXDai9nVyN5LZdExgxM24C003N2SampkkCNzcUmRLMOh6
 RocPEPyGaixJ/vQj4DCDu2QKpd0X4teYDSh8+o/dfMdkUoq7w869c7KA+b9rxwR348ar
 v4gwU+wAdSZFRwbnTjdFrEoVeqRlPEOoOSJ2//bgImAZ029wBQCDDSXvjha8rax3hTBZ
 D7iw==
X-Gm-Message-State: AGi0PuZPtZnRFUa2FTw7ZWhTlLxJCbXnDFybhdLGnhPF1fdCCoxF4DpP
 LHKELMRhQzCN7jms/K9bOa2+I5n2lHM=
X-Google-Smtp-Source: APiQypLKiAFHvR4SVrU812rusFnWRBPf1uz/HyJfhGkvETMPJa/95EgYujg+mV4v3HVEVkweRHUCdg==
X-Received: by 2002:a63:6f84:: with SMTP id
 k126mr17798256pgc.391.1586166723013; 
 Mon, 06 Apr 2020 02:52:03 -0700 (PDT)
Received: from [192.168.10.94] (124-171-87-207.dyn.iinet.net.au.
 [124.171.87.207])
 by smtp.gmail.com with ESMTPSA id q123sm11433654pfb.54.2020.04.06.02.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:52:02 -0700 (PDT)
Subject: Re: [PATCH 4/7] powerpc/powernv/pci: Add device to iommu group during
 dma_dev_setup()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406030745.24595-1-oohall@gmail.com>
 <20200406030745.24595-5-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <dde2b7f8-654b-32f3-db01-fd45816d8a10@ozlabs.ru>
Date: Mon, 6 Apr 2020 19:51:59 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406030745.24595-5-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/04/2020 13:07, Oliver O'Halloran wrote:
> Historically adding devices to their respective iommu group has been
> handled by the post-init phb fixup for most devices. This was done
> because:
> 
> 1) The IOMMU group is tied to the PE (usually) so we can only setup the
>    iommu groups after we've done resource allocation since BAR location
>    determines the device's PE, and:
> 2) The sysfs directory for the pci_dev needs to be available since
>    iommu_add_device() wants to add an attribute for the iommu group.
> 
> However, since commit 30d87ef8b38d ("powerpc/pci: Fix
> pcibios_setup_device() ordering") both conditions are met when
> hose->ops->dma_dev_setup() is called so there's no real need to do
> this in the fixup.
> 
> Moving the call to iommu_add_device() into pnv_pci_ioda_dma_setup_dev()
> is a nice cleanup since it puts all the per-device IOMMU setup into one
> place. It also results in all (non-nvlink) devices getting their iommu
> group via a common path rather than relying on the bus notifier hack
> in pnv_tce_iommu_bus_notifier() to handle the adding VFs and
> hotplugged devices to their group.
> 
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>  arch/powerpc/platforms/powernv/npu-dma.c  |  8 ++++
>  arch/powerpc/platforms/powernv/pci-ioda.c | 47 +++++++----------------
>  arch/powerpc/platforms/powernv/pci.c      | 20 ----------
>  3 files changed, 21 insertions(+), 54 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index 4fbbdfa8b327..df27b8d7e78f 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -469,6 +469,12 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  			compound_group->pgsizes = pe->table_group.pgsizes;
>  	}
>  
> +	/*
> +	 * The gpu would have been added to the iommu group that's created
> +	 * for the PE. Pull it out now.
> +	 */
> +	iommu_del_device(&gpdev->dev);
> +
>         /*
>  	* I'm not sure this is strictly required, but it's probably a good idea
>  	* since the table_group for the PE is going to be attached to the
> @@ -478,7 +484,9 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  	*/
>  	iommu_group_put(pe->table_group.group);
>  
> +	/* now put the GPU into the compound group */
>  	pnv_comp_attach_table_group(npucomp, pe);
> +	iommu_add_device(compound_group, &gpdev->dev);
>  
>  	return compound_group;
>  }
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index cf0aaef1b8fa..9198b7882b57 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1774,12 +1774,10 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>  	WARN_ON(get_dma_ops(&pdev->dev) != &dma_iommu_ops);
>  	pdev->dev.archdata.dma_offset = pe->tce_bypass_base;
>  	set_iommu_table_base(&pdev->dev, pe->table_group.tables[0]);
> -	/*
> -	 * Note: iommu_add_device() will fail here as
> -	 * for physical PE: the device is already added by now;
> -	 * for virtual PE: sysfs entries are not ready yet and
> -	 * tce_iommu_bus_notifier will add the device to a group later.
> -	 */
> +
> +	/* PEs with a DMA weight of zero won't have a group */
> +	if (pe->table_group.group)
> +		iommu_add_device(&pe->table_group, &pdev->dev);
>  }
>  
>  /*
> @@ -2628,39 +2626,20 @@ static void pnv_pci_ioda_setup_iommu_api(void)
>  	struct pnv_ioda_pe *pe;
>  
>  	/*
> -	 * There are 4 types of PEs:
> -	 * - PNV_IODA_PE_BUS: a downstream port with an adapter,
> -	 *   created from pnv_pci_setup_bridge();
> -	 * - PNV_IODA_PE_BUS_ALL: a PCI-PCIX bridge with devices behind it,
> -	 *   created from pnv_pci_setup_bridge();
> -	 * - PNV_IODA_PE_VF: a SRIOV virtual function,
> -	 *   created from pnv_pcibios_sriov_enable();
> -	 * - PNV_IODA_PE_DEV: an NPU or OCAPI device,
> -	 *   created from pnv_pci_ioda_fixup().
> +	 * For non-nvlink devices the IOMMU group is registered when the PE is
> +	 * configured and devices are added to the group when the per-device
> +	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
> +	 * only initialise for "normal" IODA PHBs.
>  	 *
> -	 * Normally a PE is represented by an IOMMU group, however for
> -	 * devices with side channels the groups need to be more strict.
> +	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
> +	 * in the same IOMMU group, so that's handled here.
>  	 */
>  	list_for_each_entry(hose, &hose_list, list_node) {
>  		phb = hose->private_data;
>  
> -		if (phb->type == PNV_PHB_NPU_NVLINK ||
> -		    phb->type == PNV_PHB_NPU_OCAPI)
> -			continue;
> -
> -		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> -			struct iommu_table_group *table_group;
> -
> -			table_group = pnv_try_setup_npu_table_group(pe);
> -			if (!table_group) {
> -				if (!pnv_pci_ioda_pe_dma_weight(pe))
> -					continue;
> -
> -				table_group = &pe->table_group;
> -			}
> -			pnv_ioda_setup_bus_iommu_group(pe, table_group,
> -					pe->pbus);
> -		}
> +		if (phb->type == PNV_PHB_IODA2)
> +			list_for_each_entry(pe, &phb->ioda.pe_list, list)
> +				pnv_try_setup_npu_table_group(pe);
>  	}
>  
>  	/*
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 5bf818246339..091fe1cf386b 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -955,28 +955,8 @@ static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
>  		unsigned long action, void *data)
>  {
>  	struct device *dev = data;
> -	struct pci_dev *pdev;
> -	struct pci_dn *pdn;
> -	struct pnv_ioda_pe *pe;
> -	struct pci_controller *hose;
> -	struct pnv_phb *phb;
>  
>  	switch (action) {
> -	case BUS_NOTIFY_ADD_DEVICE:
> -		pdev = to_pci_dev(dev);
> -		pdn = pci_get_pdn(pdev);
> -		hose = pci_bus_to_host(pdev->bus);
> -		phb = hose->private_data;
> -
> -		WARN_ON_ONCE(!phb);
> -		if (!pdn || pdn->pe_number == IODA_INVALID_PE || !phb)
> -			return 0;
> -
> -		pe = &phb->ioda.pe_array[pdn->pe_number];
> -		if (!pe->table_group.group)
> -			return 0;
> -		iommu_add_device(&pe->table_group, dev);
> -		return 0;
>  	case BUS_NOTIFY_DEL_DEVICE:
>  		iommu_del_device(dev);
>  		return 0;
> 

-- 
Alexey
