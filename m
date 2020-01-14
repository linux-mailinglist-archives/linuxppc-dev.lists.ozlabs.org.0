Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF56113A10F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 07:38:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xgkw3Yx9zDqHW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:38:16 +1100 (AEDT)
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
 header.s=20150623 header.b=Bi3OATck; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xgdf3cl0zDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 17:33:41 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id x8so5909941pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 22:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U6ixbhLCHJzav9F8qySR5Gau0YF6Rps2Rp54YQg1alg=;
 b=Bi3OATckvQ0IgRBW4qwbzvwUQtLuQf/k3+3CHl+Xroc6sWl6LtRd9U6vc00rblxYJ3
 s5EfaTEPxzZuikWkdgVNFnUISnQ4GTlwu2VMr8jUzIGvt2J/f34jS5Ds0KlFm2DjVqpM
 SqgzFrRXIaY22jVI7/34Rirm6z7J2PRxjvAZo47YoxL2ufer+4vgHKRvhEOz3ahm33Ja
 v0QIjaMonlKr4M5NUEwI4IUVofKpM358PYwU7njRH6/smU1rxEkrjiY7Hn7GDHJk4xn1
 CvkyHGbaGhdLk9ar+WomUOXZcVXZ4vYzL0GLrTytwrNJWmaekvZU41Fy3MBrTq3qzLsJ
 QD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U6ixbhLCHJzav9F8qySR5Gau0YF6Rps2Rp54YQg1alg=;
 b=AKnomsVTa7bfopeg2gS2LPdoTKl/Gpup9GA2kFIatNSSTOvVovqbwCGFXF1YZR2pKz
 oLNrQWrzJxOYFBM/JSyll33c2crIqcSp34PWzqBPyQ94HUeDv1GSSZnoMbLPC0YKYMJh
 UBAPSJdx+/fCuk5Co8uvwwbtLvdhooTfXUN4Sb+UoHjqILknbo4dYf4mFCUAHFS29c2P
 2pfNUwTPnKPdoaGzs46WDO4wkZb5PZyXvUC3kuNsj7y31ya1t850gNcJPw0iU9nxk+58
 K1NFuuxCH6Hx5oz1JwOlcNaDnQecATA1yFZ8wUol+/au8yyHVubEz+yphxbPCWobzVOz
 rOpQ==
X-Gm-Message-State: APjAAAXYkqE9DXHfTz6IUCQ0khVT1UJw8WBIDfWNzvMKJvz9ebUy575O
 xZLMv+p+MR3eEOMosCIHwl3rKGaMr+8=
X-Google-Smtp-Source: APXvYqyT6FVimj2bO4CxWnS9RNlllS4IRK2Hz5Fo+ynadaafYu1890klb72qJIgjf/xubbCWMeJuZQ==
X-Received: by 2002:a63:3f4f:: with SMTP id m76mr24647697pga.353.1578983618959; 
 Mon, 13 Jan 2020 22:33:38 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id u128sm17049728pfu.60.2020.01.13.22.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 22:33:38 -0800 (PST)
Subject: Re: [PATCH 3/5] powerpc/iov: Move VF pdev fixup into
 pcibios_fixup_iov()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200110070207.439-1-oohall@gmail.com>
 <20200110070207.439-4-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <34e3e4fa-3e72-6eec-0b8b-a7191f889e03@ozlabs.ru>
Date: Tue, 14 Jan 2020 17:33:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200110070207.439-4-oohall@gmail.com>
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



On 10/01/2020 18:02, Oliver O'Halloran wrote:
> An ioda_pe for each VF is allocated in pnv_pci_sriov_enable() before the
> pci_dev for the VF is created. We need to set the pe->pdev pointer at
> some point after the pci_dev is created. Currently we do that in:
> 
> pcibios_bus_add_device()
> 	pnv_pci_dma_dev_setup() (via phb->ops.dma_dev_setup)
> 		/* fixup is done here */
> 		pnv_pci_ioda_dma_dev_setup() (via pnv_phb->dma_dev_setup)
> 
> The fixup needs to be done before setting up DMA for for the VF's PE, but
> there's no real reason to delay it until this point. Move the fixup into
> pnv_pci_ioda_fixup_iov() so the ordering is:
> 
> 	pcibios_add_device()
> 		pnv_pci_ioda_fixup_iov() (via ppc_md.pcibios_fixup_sriov)
> 
> 	pcibios_bus_add_device()
> 		...
> 
> This isn't strictly required, but it's slightly a slightly more logical


s/slightly a slightly/slightly/ ?



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> place to do the fixup and it simplifies pnv_pci_dma_dev_setup().
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 29 +++++++++++++++++++++++++----
>  arch/powerpc/platforms/powernv/pci.c      | 14 --------------
>  2 files changed, 25 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 33d4039..ae177ee 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -2900,9 +2900,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  	struct pci_dn *pdn;
>  	int mul, total_vfs;
>  
> -	if (!pdev->is_physfn || pci_dev_is_added(pdev))
> -		return;
> -
>  	pdn = pci_get_pdn(pdev);
>  	pdn->vfs_expanded = 0;
>  	pdn->m64_single_mode = false;
> @@ -2977,6 +2974,30 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  		res->end = res->start - 1;
>  	}
>  }
> +
> +static void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
> +{
> +	if (WARN_ON(pci_dev_is_added(pdev)))
> +		return;
> +
> +	if (pdev->is_virtfn) {
> +		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
> +
> +		/*
> +		 * VF PEs are single-device PEs so their pdev pointer needs to
> +		 * be set. The pdev doesn't exist when the PE is allocated (in
> +		 * (pcibios_sriov_enable()) so we fix it up here.
> +		 */
> +		pe->pdev = pdev;
> +		WARN_ON(!(pe->flags & PNV_IODA_PE_VF));
> +	} else if (pdev->is_physfn) {
> +		/*
> +		 * For PFs adjust their allocated IOV resources to match what
> +		 * the PHB can support using it's M64 BAR table.
> +		 */
> +		pnv_pci_ioda_fixup_iov_resources(pdev);
> +	}
> +}
>  #endif /* CONFIG_PCI_IOV */
>  
>  static void pnv_ioda_setup_pe_res(struct pnv_ioda_pe *pe,
> @@ -3872,7 +3893,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
>  	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
>  
>  #ifdef CONFIG_PCI_IOV
> -	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov_resources;
> +	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
>  	ppc_md.pcibios_iov_resource_alignment = pnv_pci_iov_resource_alignment;
>  	ppc_md.pcibios_sriov_enable = pnv_pcibios_sriov_enable;
>  	ppc_md.pcibios_sriov_disable = pnv_pcibios_sriov_disable;
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index e8e58a2c..8307e1f 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -814,20 +814,6 @@ void pnv_pci_dma_dev_setup(struct pci_dev *pdev)
>  {
>  	struct pci_controller *hose = pci_bus_to_host(pdev->bus);
>  	struct pnv_phb *phb = hose->private_data;
> -#ifdef CONFIG_PCI_IOV
> -	struct pnv_ioda_pe *pe;
> -
> -	/* Fix the VF pdn PE number */
> -	if (pdev->is_virtfn) {
> -		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> -			if (pe->rid == ((pdev->bus->number << 8) |
> -			    (pdev->devfn & 0xff))) {
> -				pe->pdev = pdev;
> -				break;
> -			}
> -		}
> -	}
> -#endif /* CONFIG_PCI_IOV */
>  
>  	if (phb && phb->dma_dev_setup)
>  		phb->dma_dev_setup(phb, pdev);
> 

-- 
Alexey
