Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D721E79B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 07:38:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5Tp63T2DzDqRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 15:38:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ddoH6JCe; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5TmY0J20zDqLP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 15:37:16 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id t15so990595pjq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vLE4vx1xbNciTUOhT87LUF75oDEmVTGNQvOjgdIQFl0=;
 b=ddoH6JCeTJTWXFi7gowCpqT99ARZMQ2o0dctjqjtEvgQApiMP1nDApWXnFumF/bhWw
 CsyHI0zgeTO43N/rmmfNNtWC7TGqC36e/FSGeEwlmABt0+58N8ttVldjPX1buoTQLMfX
 7+uFMz2YpAL/ucx2nuAianagFBWsmt57eXOKtfpoZXhgXQgHLitZL/UjzYlHhz/JwumH
 4xpDVLQW/vh2nZRHzgEj+j3DXTkLnhBU6ehF9BW8UtvmUIAmbMKMbCpkqev8DHRGfyaN
 5RNhtztCrT8sCL1qr1B5zGPJ2QrM1SHoqb7ZbCDptWfBz312U1C7sRErfdPyPiquEkQx
 Og4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vLE4vx1xbNciTUOhT87LUF75oDEmVTGNQvOjgdIQFl0=;
 b=ibb6PtOXPalPc44pEkWPguKmamVP5xSBYcLIQunfBsmcsJRIm7tC9A68UheBcoXpqV
 h9BhC4N7jmQrFnHK9fwbdH+Ko2ZP9cDd/7u4Xjmrfc3yDcA/ACRvEVqg3UsryRn/Pe3V
 L7rLE8a6v4JryZxFrZZ4ldNgeul/kTTbes6qoo0rvjYeQl+NsagyYljfwlM/wtbt7q1Q
 1dwkxxRF+ia8oqNa3FBP9VcNzCaqVz/6TAUVtT+dTQmJ8laLM9kU4XjevU/gco0dQJvh
 b6gTvtjP3UdFrKMPqkqwZrpjDvS4eRROVmf5t8QZE9KY+U0LpwlXTrji83TwFUlaKC9o
 fBCw==
X-Gm-Message-State: AOAM532qWqfefFA7daXPTkQst4cH1EMgPFOgFx+k8QWMpiNOqwbsyw9N
 6Yq72Dz3+2KwNavMoitcwrFnTIDVdikUWw==
X-Google-Smtp-Source: ABdhPJzCXmOuRaTFUeNSMMPztSxjuH6S2rv5I5h7ZBSBWehHHk/bpEYSpgRTJeuDZgFZnDNmMXca1Q==
X-Received: by 2002:a17:902:8f83:: with SMTP id
 z3mr487387plo.162.1594705031261; 
 Mon, 13 Jul 2020 22:37:11 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id r9sm1187565pje.12.2020.07.13.22.37.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 22:37:10 -0700 (PDT)
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
Date: Tue, 14 Jul 2020 15:37:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-4-oohall@gmail.com>
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



On 10/07/2020 15:23, Oliver O'Halloran wrote:
> There's an optimisation in the PE setup which skips performing DMA
> setup for a PE if we only have bridges in a PE. The assumption being
> that only "real" devices will DMA to system memory, which is probably
> fair. However, if we start off with only bridge devices in a PE then
> add a non-bridge device the new device won't be able to use DMA  because
> we never configured it.
> 
> Fix this (admittedly pretty weird) edge case by tracking whether we've done
> the DMA setup for the PE or not. If a non-bridge device is added to the PE
> (via rescan or hotplug, or whatever) we can set up DMA on demand.

So hotplug does not work on powernv then, right? I thought you tested it
a while ago, or this patch is the result of that attempt? If it is, then

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> This also means the only remaining user of the old "DMA Weight" code is
> the IODA1 DMA setup code that it was originally added for, which is good.


Is ditching IODA1 in the plan? :)

> 
> Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> Alexey, do we need to have the IOMMU API stuff set/clear this flag?


I'd say no as that API only cares if a device is in a PE and for those
the PE DMA setup  optimization is skipped. Thanks,




> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 48 ++++++++++++++---------
>  arch/powerpc/platforms/powernv/pci.h      |  7 ++++
>  2 files changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index bfb40607aa0e..bb9c1cc60c33 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -141,6 +141,7 @@ static struct pnv_ioda_pe *pnv_ioda_init_pe(struct pnv_phb *phb, int pe_no)
>  
>  	phb->ioda.pe_array[pe_no].phb = phb;
>  	phb->ioda.pe_array[pe_no].pe_number = pe_no;
> +	phb->ioda.pe_array[pe_no].dma_setup_done = false;
>  
>  	/*
>  	 * Clear the PE frozen state as it might be put into frozen state
> @@ -1685,6 +1686,12 @@ static int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>  }
>  #endif /* CONFIG_PCI_IOV */
>  
> +static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
> +				       struct pnv_ioda_pe *pe);
> +
> +static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> +				       struct pnv_ioda_pe *pe);
> +
>  static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>  {
>  	struct pnv_phb *phb = pci_bus_to_pnvhb(pdev->bus);
> @@ -1713,6 +1720,24 @@ static void pnv_pci_ioda_dma_dev_setup(struct pci_dev *pdev)
>  		pci_info(pdev, "Added to existing PE#%x\n", pe->pe_number);
>  	}
>  
> +	/*
> +	 * We assume that bridges *probably* don't need to do any DMA so we can
> +	 * skip allocating a TCE table, etc unless we get a non-bridge device.
> +	 */
> +	if (!pe->dma_setup_done && !pci_is_bridge(pdev)) {
> +		switch (phb->type) {
> +		case PNV_PHB_IODA1:
> +			pnv_pci_ioda1_setup_dma_pe(phb, pe);
> +			break;
> +		case PNV_PHB_IODA2:
> +			pnv_pci_ioda2_setup_dma_pe(phb, pe);
> +			break;
> +		default:
> +			pr_warn("%s: No DMA for PHB#%x (type %d)\n",
> +				__func__, phb->hose->global_number, phb->type);
> +		}
> +	}
> +
>  	if (pdn)
>  		pdn->pe_number = pe->pe_number;
>  	pe->device_count++;
> @@ -2222,6 +2247,7 @@ static void pnv_pci_ioda1_setup_dma_pe(struct pnv_phb *phb,
>  	pe->table_group.tce32_size = tbl->it_size << tbl->it_page_shift;
>  	iommu_init_table(tbl, phb->hose->node, 0, 0);
>  
> +	pe->dma_setup_done = true;
>  	return;
>   fail:
>  	/* XXX Failure: Try to fallback to 64-bit only ? */
> @@ -2536,9 +2562,6 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
>  {
>  	int64_t rc;
>  
> -	if (!pnv_pci_ioda_pe_dma_weight(pe))
> -		return;
> -
>  	/* TVE #1 is selected by PCI address bit 59 */
>  	pe->tce_bypass_base = 1ull << 59;
>  
> @@ -2563,6 +2586,7 @@ static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
>  	iommu_register_group(&pe->table_group, phb->hose->global_number,
>  			     pe->pe_number);
>  #endif
> +	pe->dma_setup_done = true;
>  }
>  
>  int64_t pnv_opal_pci_msi_eoi(struct irq_chip *chip, unsigned int hw_irq)
> @@ -3136,7 +3160,6 @@ static void pnv_pci_fixup_bridge_resources(struct pci_bus *bus,
>  
>  static void pnv_pci_configure_bus(struct pci_bus *bus)
>  {
> -	struct pnv_phb *phb = pci_bus_to_pnvhb(bus);
>  	struct pci_dev *bridge = bus->self;
>  	struct pnv_ioda_pe *pe;
>  	bool all = (bridge && pci_pcie_type(bridge) == PCI_EXP_TYPE_PCI_BRIDGE);
> @@ -3160,17 +3183,6 @@ static void pnv_pci_configure_bus(struct pci_bus *bus)
>  		return;
>  
>  	pnv_ioda_setup_pe_seg(pe);
> -	switch (phb->type) {
> -	case PNV_PHB_IODA1:
> -		pnv_pci_ioda1_setup_dma_pe(phb, pe);
> -		break;
> -	case PNV_PHB_IODA2:
> -		pnv_pci_ioda2_setup_dma_pe(phb, pe);
> -		break;
> -	default:
> -		pr_warn("%s: No DMA for PHB#%x (type %d)\n",
> -			__func__, phb->hose->global_number, phb->type);
> -	}
>  }
>  
>  static resource_size_t pnv_pci_default_alignment(void)
> @@ -3289,11 +3301,10 @@ static long pnv_pci_ioda1_unset_window(struct iommu_table_group *table_group,
>  
>  static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
>  {
> -	unsigned int weight = pnv_pci_ioda_pe_dma_weight(pe);
>  	struct iommu_table *tbl = pe->table_group.tables[0];
>  	int64_t rc;
>  
> -	if (!weight)
> +	if (!pe->dma_setup_done)
>  		return;
>  
>  	rc = pnv_pci_ioda1_unset_window(&pe->table_group, 0);
> @@ -3313,10 +3324,9 @@ static void pnv_pci_ioda1_release_pe_dma(struct pnv_ioda_pe *pe)
>  static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
>  {
>  	struct iommu_table *tbl = pe->table_group.tables[0];
> -	unsigned int weight = pnv_pci_ioda_pe_dma_weight(pe);
>  	int64_t rc;
>  
> -	if (!weight)
> +	if (pe->dma_setup_done)
>  		return;
>  
>  	rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 0727dec9a0d1..6aa6aefb637d 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -87,6 +87,13 @@ struct pnv_ioda_pe {
>  	bool			tce_bypass_enabled;
>  	uint64_t		tce_bypass_base;
>  
> +	/*
> +	 * Used to track whether we've done DMA setup for this PE or not. We
> +	 * want to defer allocating TCE tables, etc until we've added a
> +	 * non-bridge device to the PE.
> +	 */
> +	bool			dma_setup_done;
> +
>  	/* MSIs. MVE index is identical for for 32 and 64 bit MSI
>  	 * and -1 if not supported. (It's actually identical to the
>  	 * PE number)
> 

-- 
Alexey
