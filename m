Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A082519F341
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:05:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wmQ03XdqzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:05:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=pC+w7xij; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wm8m17XDzDqnM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:54:15 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id kx8so6217867pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3m+Q67BacC1nvhZxrOHSSopsOVpaJnwfneOMzNWGbVE=;
 b=pC+w7xijABBGhBULg07cTD9uHFkLzxNhr9JOK06uDWS0iUTWhVX2EEiROXn/dZETyM
 C7fd4CbBfIvaqBIADF89wcH3bpk71+0BkhfFqqsRjia4TwfCDzMS3romOL0OMsTDCCRa
 llGB7SS+LLemspa1vuDh6RrFIfq8OgCXbIGyKjCiApMbd8J5l8lNqKjtzSs4x8Fo+WIQ
 6+mbOwBSLt8WZVgSFfGshwyGFemTPFM3bZbuq554izhL6y0iLRDHsNvj4nX3yLbW0m2d
 +lZODcD/JyqfJFOxpmcXijeHH1CHU4tzAywkJwbPf3gPVxUgLt9AKdi8bBJSwk6NP110
 3Bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3m+Q67BacC1nvhZxrOHSSopsOVpaJnwfneOMzNWGbVE=;
 b=AMvTraKcu8rhhOA8B541bMTLn0C3zMx4911Abf+ud+gh/mqbyLGJ8TNtDMkmHdwrw+
 usAbyvs0slzof2LB/7RGsGfSCnQcuzNpxDJWP7Gy0PzDLI80ox8g0f7PR6Ei6KlFLpSt
 Hi5bhNAdo90B4VnC3W0KiHspvwJIrO89x4vEP4q3/EUbawTDmo6v3Jp0j0QRazvCuFAP
 CwpHYMPtBFUD1hCLHag06XNDPGPrtMtRl3yl2RJl/csnKD+eexNTvfxsl0gsj8EkXHHr
 duj/hpkh5buzFF1dpmj9e/kZ7+KGJAhdiA/mgeloUu2ZZ11fSHTiPexWXrD6Nka/5Uoj
 ibgw==
X-Gm-Message-State: AGi0PuYi4gmk1S0nCGaX7ELA71Sjo8KWr92/w72mYG4qB5pQsUZzoXb9
 hlnumTZklciPz9CiNZFGEIyUi7Vkdvo=
X-Google-Smtp-Source: APiQypLq4wvtcFPfmK7mrsULVKvmBuscf5ar9SVjKKNH5EHn5isZhaOMK4knkgYZZVwbcIE2o1vhLw==
X-Received: by 2002:a17:902:d70f:: with SMTP id
 w15mr669597ply.138.1586166852921; 
 Mon, 06 Apr 2020 02:54:12 -0700 (PDT)
Received: from [192.168.10.94] (124-171-87-207.dyn.iinet.net.au.
 [124.171.87.207])
 by smtp.gmail.com with ESMTPSA id h34sm8427616pjb.47.2020.04.06.02.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 02:54:12 -0700 (PDT)
Subject: Re: [PATCH 7/7] powerpc/powernv/npu: Move IOMMU group setup into
 npu-dma.c
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406030745.24595-1-oohall@gmail.com>
 <20200406030745.24595-8-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <09cb94cb-a57f-078f-c5e0-b844d798b3a5@ozlabs.ru>
Date: Mon, 6 Apr 2020 19:54:09 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200406030745.24595-8-oohall@gmail.com>
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
> The NVlink IOMMU group setup is only relevant to NVLink devices so move
> it into the NPU containment zone. This let us remove some prototypes in
> pci.h and staticfy some function definitions.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>  arch/powerpc/platforms/powernv/npu-dma.c  | 54 +++++++++++++++++++-
>  arch/powerpc/platforms/powernv/pci-ioda.c | 60 +++--------------------
>  arch/powerpc/platforms/powernv/pci.h      |  6 +--
>  3 files changed, 60 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
> index df27b8d7e78f..abeaa533b976 100644
> --- a/arch/powerpc/platforms/powernv/npu-dma.c
> +++ b/arch/powerpc/platforms/powernv/npu-dma.c
> @@ -15,6 +15,7 @@
>  
>  #include <asm/debugfs.h>
>  #include <asm/powernv.h>
> +#include <asm/ppc-pci.h>
>  #include <asm/opal.h>
>  
>  #include "pci.h"
> @@ -425,7 +426,8 @@ static void pnv_comp_attach_table_group(struct npu_comp *npucomp,
>  	++npucomp->pe_num;
>  }
>  
> -struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
> +static struct iommu_table_group *
> +	pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  {
>  	struct iommu_table_group *compound_group;
>  	struct npu_comp *npucomp;
> @@ -491,7 +493,7 @@ struct iommu_table_group *pnv_try_setup_npu_table_group(struct pnv_ioda_pe *pe)
>  	return compound_group;
>  }
>  
> -struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
> +static struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
>  {
>  	struct iommu_table_group *table_group;
>  	struct npu_comp *npucomp;
> @@ -534,6 +536,54 @@ struct iommu_table_group *pnv_npu_compound_attach(struct pnv_ioda_pe *pe)
>  
>  	return table_group;
>  }
> +
> +void pnv_pci_npu_setup_iommu_groups(void)
> +{
> +	struct pci_controller *hose;
> +	struct pnv_phb *phb;
> +	struct pnv_ioda_pe *pe;
> +
> +	/*
> +	 * For non-nvlink devices the IOMMU group is registered when the PE is
> +	 * configured and devices are added to the group when the per-device
> +	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
> +	 * only initialise for "normal" IODA PHBs.
> +	 *
> +	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
> +	 * in the same IOMMU group, so that's handled here.
> +	 */
> +	list_for_each_entry(hose, &hose_list, list_node) {
> +		phb = hose->private_data;
> +
> +		if (phb->type == PNV_PHB_IODA2)
> +			list_for_each_entry(pe, &phb->ioda.pe_list, list)
> +				pnv_try_setup_npu_table_group(pe);
> +	}
> +
> +	/*
> +	 * Now we have all PHBs discovered, time to add NPU devices to
> +	 * the corresponding IOMMU groups.
> +	 */
> +	list_for_each_entry(hose, &hose_list, list_node) {
> +		unsigned long  pgsizes;
> +
> +		phb = hose->private_data;
> +
> +		if (phb->type != PNV_PHB_NPU_NVLINK)
> +			continue;
> +
> +		pgsizes = pnv_ioda_parse_tce_sizes(phb);
> +		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> +			/*
> +			 * IODA2 bridges get this set up from
> +			 * pci_controller_ops::setup_bridge but NPU bridges
> +			 * do not have this hook defined so we do it here.
> +			 */
> +			pe->table_group.pgsizes = pgsizes;
> +			pnv_npu_compound_attach(pe);
> +		}
> +	}
> +}
>  #endif /* CONFIG_IOMMU_API */
>  
>  int pnv_npu2_init(struct pci_controller *hose)
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index c020ade3a846..dba0c2c09f61 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -1288,7 +1288,7 @@ static void pnv_ioda_setup_npu_PEs(struct pci_bus *bus)
>  		pnv_ioda_setup_npu_PE(pdev);
>  }
>  
> -static void pnv_pci_ioda_setup_PEs(void)
> +static void pnv_pci_ioda_setup_nvlink(void)
>  {
>  	struct pci_controller *hose;
>  	struct pnv_phb *phb;
> @@ -1312,6 +1312,11 @@ static void pnv_pci_ioda_setup_PEs(void)
>  		list_for_each_entry(pe, &phb->ioda.pe_list, list)
>  			pnv_npu2_map_lpar(pe, MSR_DR | MSR_PR | MSR_HV);
>  	}
> +
> +#ifdef CONFIG_IOMMU_API
> +	/* setup iommu groups so we can do nvlink pass-thru */
> +	pnv_pci_npu_setup_iommu_groups();
> +#endif
>  }
>  
>  #ifdef CONFIG_PCI_IOV
> @@ -2584,56 +2589,6 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
>  	.take_ownership = pnv_ioda2_take_ownership,
>  	.release_ownership = pnv_ioda2_release_ownership,
>  };
> -
> -static void pnv_pci_ioda_setup_iommu_api(void)
> -{
> -	struct pci_controller *hose;
> -	struct pnv_phb *phb;
> -	struct pnv_ioda_pe *pe;
> -
> -	/*
> -	 * For non-nvlink devices the IOMMU group is registered when the PE is
> -	 * configured and devices are added to the group when the per-device
> -	 * DMA setup is run. That's done in hose->ops.dma_dev_setup() which is
> -	 * only initialise for "normal" IODA PHBs.
> -	 *
> -	 * For NVLink devices we need to ensure the NVLinks and the GPU end up
> -	 * in the same IOMMU group, so that's handled here.
> -	 */
> -	list_for_each_entry(hose, &hose_list, list_node) {
> -		phb = hose->private_data;
> -
> -		if (phb->type == PNV_PHB_IODA2)
> -			list_for_each_entry(pe, &phb->ioda.pe_list, list)
> -				pnv_try_setup_npu_table_group(pe);
> -	}
> -
> -	/*
> -	 * Now we have all PHBs discovered, time to add NPU devices to
> -	 * the corresponding IOMMU groups.
> -	 */
> -	list_for_each_entry(hose, &hose_list, list_node) {
> -		unsigned long  pgsizes;
> -
> -		phb = hose->private_data;
> -
> -		if (phb->type != PNV_PHB_NPU_NVLINK)
> -			continue;
> -
> -		pgsizes = pnv_ioda_parse_tce_sizes(phb);
> -		list_for_each_entry(pe, &phb->ioda.pe_list, list) {
> -			/*
> -			 * IODA2 bridges get this set up from
> -			 * pci_controller_ops::setup_bridge but NPU bridges
> -			 * do not have this hook defined so we do it here.
> -			 */
> -			pe->table_group.pgsizes = pgsizes;
> -			pnv_npu_compound_attach(pe);
> -		}
> -	}
> -}
> -#else /* !CONFIG_IOMMU_API */
> -static void pnv_pci_ioda_setup_iommu_api(void) { };
>  #endif
>  
>  static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
> @@ -3132,8 +3087,7 @@ static void pnv_pci_enable_bridges(void)
>  
>  static void pnv_pci_ioda_fixup(void)
>  {
> -	pnv_pci_ioda_setup_PEs();
> -	pnv_pci_ioda_setup_iommu_api();
> +	pnv_pci_ioda_setup_nvlink();
>  	pnv_pci_ioda_create_dbgfs();
>  
>  	pnv_pci_enable_bridges();
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 0c5845a1f05d..20941ef2706e 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -209,11 +209,7 @@ extern void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>  /* Nvlink functions */
>  extern void pnv_npu_try_dma_set_bypass(struct pci_dev *gpdev, bool bypass);
>  extern void pnv_pci_ioda2_tce_invalidate_entire(struct pnv_phb *phb, bool rm);
> -extern struct pnv_ioda_pe *pnv_pci_npu_setup_iommu(struct pnv_ioda_pe *npe);
> -extern struct iommu_table_group *pnv_try_setup_npu_table_group(
> -		struct pnv_ioda_pe *pe);
> -extern struct iommu_table_group *pnv_npu_compound_attach(
> -		struct pnv_ioda_pe *pe);
> +extern void pnv_pci_npu_setup_iommu_groups(void);
>  
>  /* pci-ioda-tce.c */
>  #define POWERNV_IOMMU_DEFAULT_LEVELS	2
> 

-- 
Alexey
