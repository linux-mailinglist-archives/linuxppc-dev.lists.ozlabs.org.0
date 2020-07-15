Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC3F220257
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 04:31:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B61bc1SjszDqSF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 12:31:24 +1000 (AEST)
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
 header.s=20150623 header.b=1BlKM5Nw; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B61Yl0555zDqFM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 12:29:44 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id mn17so1456628pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 19:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=g1krVqMM3QFXof29hfjQavbmxpI/FHf1mr74hwGNwtI=;
 b=1BlKM5Nw9RI55qNfIZIrxNNIFqAc3ezMuq2o9Ix/2uXzc84etq14oUtrwCcCIoD9xu
 pG3XNu+1FJiOSFYGI5ohvSOhZuDYjWNF9dzcdns8Ay2rz8BNWp9vRku/+EKayM5EyoyG
 WdgreNRBGPg52K/IFdV/RhyislrPzI+tsnZ16f9ZMg5lsdEtOgf8KOQNwlQeXYZIZwp1
 ovyW2N+CWRTbZC7//2lSkl5bbgHSw4wl8XPWRp/0voseCiZeewJ/QjK7cmBc0hKH8k1K
 MQMYZo8lAWBsdto4PhJgYLGBN4a+RdoUuj+uNsbHyvlwaa7013OjcAkPZkrnpYmjr8kd
 hwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=g1krVqMM3QFXof29hfjQavbmxpI/FHf1mr74hwGNwtI=;
 b=fTG2+EwwBwbFaloV8mNIpCsWTYsdf//GLl84ZOMGUKtyJm9IvTCVxa2CGT/ZV4PWg+
 2GH3KLjZ9FRuBsfAkMqmMiPOjIs3nNKWPPJtfc5L/ImVAxPgjjniiuEcJmyIYBlWlav8
 aitrb++a4UbqZlS9dBTbSs5aBb52xVNvUkYcBT4nrT8Ti471aAHBWCWk6ietc4FCrfAV
 G6KKRa+t2v8CrfZKIzoVntoC+HNinY5LZM0yD+iBqHw6s1YUvRKoIq041aQp8K2rWEGp
 rYeuUl5Myq48mqHI2KOGGAp8RhxBdWp9vMQeBajWncRRn1xD9Pd55UtsYxgMANVPVZlA
 025Q==
X-Gm-Message-State: AOAM533RtKn9vThj4w23vfqZzX2cYxG7WqVMkHgVN9NsMEW0iifbL676
 09F8WREc3K4gLjnXi94fMUgEIMR8MeIAqA==
X-Google-Smtp-Source: ABdhPJygTnrHje/vdU8QW1Q6UjsURh2k+uM4/Lt+orXZhQAWa7BnnUNLqThaDpzzUgvsVp7uFBL0QQ==
X-Received: by 2002:a17:90a:84:: with SMTP id a4mr7710366pja.110.1594780181056; 
 Tue, 14 Jul 2020 19:29:41 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id z11sm399682pfg.169.2020.07.14.19.29.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 19:29:39 -0700 (PDT)
Subject: Re: [PATCH 10/15] powerpc/powernv/pci: Refactor pnv_ioda_alloc_pe()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-11-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <dd85f256-0f52-f2f5-f729-2d5b7269f895@ozlabs.ru>
Date: Wed, 15 Jul 2020 12:29:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-11-oohall@gmail.com>
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
> Rework the PE allocation logic to allow allocating blocks of PEs rather
> than individually. We'll use this to allocate contigious blocks of PEs for
> the SR-IOVs.

The patch does not do just this, it also adds missing mutexes (which is
good) but still misses them in pnv_pci_sriov_disable() and
pnv_pci_ioda_pe_dump().




> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 41 ++++++++++++++++++-----
>  arch/powerpc/platforms/powernv/pci.h      |  2 +-
>  2 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 2d36a9ebf0e9..c9c25fb0783c 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -145,23 +145,45 @@ static void pnv_ioda_reserve_pe(struct pnv_phb *phb, int pe_no)
>  		return;
>  	}
>  
> +	mutex_lock(&phb->ioda.pe_alloc_mutex);
>  	if (test_and_set_bit(pe_no, phb->ioda.pe_alloc))
>  		pr_debug("%s: PE %x was reserved on PHB#%x\n",
>  			 __func__, pe_no, phb->hose->global_number);
> +	mutex_unlock(&phb->ioda.pe_alloc_mutex);
>  
>  	pnv_ioda_init_pe(phb, pe_no);
>  }
>  
> -struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb)
> +struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb, int count)
>  {
> -	long pe;
> +	struct pnv_ioda_pe *ret = NULL;
> +	int run = 0, pe, i;
>  
> +	mutex_lock(&phb->ioda.pe_alloc_mutex);
> +
> +	/* scan backwards for a run of @count cleared bits */
>  	for (pe = phb->ioda.total_pe_num - 1; pe >= 0; pe--) {
> -		if (!test_and_set_bit(pe, phb->ioda.pe_alloc))
> -			return pnv_ioda_init_pe(phb, pe);
> +		if (test_bit(pe, phb->ioda.pe_alloc)) {
> +			run = 0;
> +			continue;
> +		}
> +
> +		run++;
> +		if (run == count)
> +			break;
>  	}
> +	if (run != count)
> +		goto out;
>  
> -	return NULL;
> +	for (i = pe; i < pe + count; i++) {
> +		set_bit(i, phb->ioda.pe_alloc);
> +		pnv_ioda_init_pe(phb, i);
> +	}
> +	ret = &phb->ioda.pe_array[pe];
> +
> +out:
> +	mutex_unlock(&phb->ioda.pe_alloc_mutex);
> +	return ret;
>  }
>  
>  void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
> @@ -173,7 +195,10 @@ void pnv_ioda_free_pe(struct pnv_ioda_pe *pe)
>  	WARN_ON(pe->npucomp); /* NPUs for nvlink are not supposed to be freed */
>  	kfree(pe->npucomp);
>  	memset(pe, 0, sizeof(struct pnv_ioda_pe));
> +
> +	mutex_lock(&phb->ioda.pe_alloc_mutex);
>  	clear_bit(pe_num, phb->ioda.pe_alloc);
> +	mutex_unlock(&phb->ioda.pe_alloc_mutex);
>  }
>  
>  /* The default M64 BAR is shared by all PEs */
> @@ -976,7 +1001,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_dev_PE(struct pci_dev *dev)
>  	if (pdn->pe_number != IODA_INVALID_PE)
>  		return NULL;
>  
> -	pe = pnv_ioda_alloc_pe(phb);
> +	pe = pnv_ioda_alloc_pe(phb, 1);
>  	if (!pe) {
>  		pr_warn("%s: Not enough PE# available, disabling device\n",
>  			pci_name(dev));
> @@ -1047,7 +1072,7 @@ static struct pnv_ioda_pe *pnv_ioda_setup_bus_PE(struct pci_bus *bus, bool all)
>  
>  	/* The PE number isn't pinned by M64 */
>  	if (!pe)
> -		pe = pnv_ioda_alloc_pe(phb);
> +		pe = pnv_ioda_alloc_pe(phb, 1);
>  
>  	if (!pe) {
>  		pr_warn("%s: Not enough PE# available for PCI bus %04x:%02x\n",
> @@ -3065,7 +3090,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
>  		pnv_ioda_reserve_pe(phb, phb->ioda.root_pe_idx);
>  	} else {
>  		/* otherwise just allocate one */
> -		root_pe = pnv_ioda_alloc_pe(phb);
> +		root_pe = pnv_ioda_alloc_pe(phb, 1);
>  		phb->ioda.root_pe_idx = root_pe->pe_number;
>  	}
>  
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 58c97e60c3db..b4c9bdba7217 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -223,7 +223,7 @@ int pnv_ioda_deconfigure_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
>  void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb, struct pnv_ioda_pe *pe);
>  void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
>  
> -struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb);
> +struct pnv_ioda_pe *pnv_ioda_alloc_pe(struct pnv_phb *phb, int count);
>  void pnv_ioda_free_pe(struct pnv_ioda_pe *pe);
>  
>  #ifdef CONFIG_PCI_IOV
> 

-- 
Alexey
