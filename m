Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0321EA70
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 09:41:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5XX40cC9zDqd2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 17:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AFl3WaZb; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5XTx3hn8zDqDW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 17:39:48 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id q17so6672338pls.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 00:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=orsuHwECM4DK5r0zp3u4cPn/dKPXF/CMR4l0IqD3lsI=;
 b=AFl3WaZbUDPGEtDKlzkIxqsJkHPNjNIzGUtb3UjpLdCrdyPUpR/095iNFGQrHLFwKZ
 evaahS6fxIFJVA+5us4DsrPPZx4KuwqWyDVlOUzQIa1LkbvlIS6gYAmySVdCdZH6ZpHq
 uYmPlrdzCYT9BVd0A4VKfTjfA04RjOsZNOEZgF4T4Q3NWcvu1ePMe2i2BS4E69/pZJVU
 4S0ViSM9Sxu+zsL/KWWC3KuJ58xjwhZSolFXqQejfbkj6oZPUVDqCPnzEcwo/kDV3KKk
 0cpAqFS9gOsRUHz1AsyQN5bbiTxFm4xRuXhUpQZ7l9CjAffAsWLjYfbjjBiq6zC4mv1Q
 HIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=orsuHwECM4DK5r0zp3u4cPn/dKPXF/CMR4l0IqD3lsI=;
 b=hnzP3FqgUk8S53n74u8fTe/eh0/533UwnzXhrqo/WVo4/6ud/Z4A/JBDERekutQdmV
 fCigg7Zq72vf04xx1ttK6tvKii0MOoVAoFhEC/DbMMHCNtdUokYumOWpzNs8nb9/n2Vi
 x3qjIN1lm8asnVW1RIZ1T+ZPnrxUrEv29TfrvqqzhONRZjs3x9lINYHKjyZV+3CzX1oI
 wnaPdKHy7jMMkb/nm7tlXdQgWqh0jLvhe7r3FHn4VOH3W+/Z4WD10prQaLqileQ7isQK
 vegapsN6aEN5kt6XTlTSqc7FGF1CHwlZY/WOLYHHSzVH9GGiMrR0DB1S45i09VCybYfO
 aZWw==
X-Gm-Message-State: AOAM533UtrtAoAHuBJ8ymd8dj7Zw6ViW3x9jon9Tu0BS9fR7pA1rn8/r
 DNzPMwbQYR9J3VauFFANbhjV/wazSHJOWw==
X-Google-Smtp-Source: ABdhPJx80bZUT987jZNV/JOfZPPNKmgO4TsLDGMfKERMs1A/pIs3w9lHMxJkonvsiXYMWFumKR1fDQ==
X-Received: by 2002:a17:90a:6048:: with SMTP id
 h8mr3242934pjm.230.1594712384165; 
 Tue, 14 Jul 2020 00:39:44 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id w17sm14976583pge.10.2020.07.14.00.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 00:39:43 -0700 (PDT)
Subject: Re: [PATCH 04/15] powerpc/powernv/pci: Initialise M64 for IODA1 as a
 1-1 window
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-5-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <2ae6c72d-4d4a-c00f-853b-4aed6e2f7723@ozlabs.ru>
Date: Tue, 14 Jul 2020 17:39:40 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710052340.737567-5-oohall@gmail.com>
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
> We pre-configure the m64 window for IODA1 as a 1-1 segment-PE mapping,
> similar to PHB3. Currently the actual mapping of segments occurs in
> pnv_ioda_pick_m64_pe(), but we can move it into pnv_ioda1_init_m64() and
> drop the IODA1 specific code paths in the PE setup / teardown.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>  arch/powerpc/platforms/powernv/pci-ioda.c | 55 +++++++++++------------
>  1 file changed, 25 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index bb9c1cc60c33..8fb17676d914 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -311,6 +311,28 @@ static int pnv_ioda1_init_m64(struct pnv_phb *phb)
>  		}
>  	}
>  
> +	for (index = 0; index < phb->ioda.total_pe_num; index++) {
> +		int64_t rc;
> +
> +		/*
> +		 * P7IOC supports M64DT, which helps mapping M64 segment
> +		 * to one particular PE#. However, PHB3 has fixed mapping
> +		 * between M64 segment and PE#. In order to have same logic
> +		 * for P7IOC and PHB3, we enforce fixed mapping between M64
> +		 * segment and PE# on P7IOC.
> +		 */
> +		rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> +				index, OPAL_M64_WINDOW_TYPE,
> +				index / PNV_IODA1_M64_SEGS,
> +				index % PNV_IODA1_M64_SEGS);
> +		if (rc != OPAL_SUCCESS) {
> +			pr_warn("%s: Error %lld mapping M64 for PHB#%x-PE#%x\n",
> +				__func__, rc, phb->hose->global_number,
> +				index);
> +			goto fail;
> +		}
> +	}
> +
>  	/*
>  	 * Exclude the segments for reserved and root bus PE, which
>  	 * are first or last two PEs.
> @@ -402,26 +424,6 @@ static struct pnv_ioda_pe *pnv_ioda_pick_m64_pe(struct pci_bus *bus, bool all)
>  			pe->master = master_pe;
>  			list_add_tail(&pe->list, &master_pe->slaves);
>  		}
> -
> -		/*
> -		 * P7IOC supports M64DT, which helps mapping M64 segment
> -		 * to one particular PE#. However, PHB3 has fixed mapping
> -		 * between M64 segment and PE#. In order to have same logic
> -		 * for P7IOC and PHB3, we enforce fixed mapping between M64
> -		 * segment and PE# on P7IOC.
> -		 */
> -		if (phb->type == PNV_PHB_IODA1) {
> -			int64_t rc;
> -
> -			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> -					pe->pe_number, OPAL_M64_WINDOW_TYPE,
> -					pe->pe_number / PNV_IODA1_M64_SEGS,
> -					pe->pe_number % PNV_IODA1_M64_SEGS);
> -			if (rc != OPAL_SUCCESS)
> -				pr_warn("%s: Error %lld mapping M64 for PHB#%x-PE#%x\n",
> -					__func__, rc, phb->hose->global_number,
> -					pe->pe_number);
> -		}
>  	}
>  
>  	kfree(pe_alloc);
> @@ -3354,14 +3356,8 @@ static void pnv_ioda_free_pe_seg(struct pnv_ioda_pe *pe,
>  		if (map[idx] != pe->pe_number)
>  			continue;
>  
> -		if (win == OPAL_M64_WINDOW_TYPE)
> -			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> -					phb->ioda.reserved_pe_idx, win,
> -					idx / PNV_IODA1_M64_SEGS,
> -					idx % PNV_IODA1_M64_SEGS);
> -		else
> -			rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> -					phb->ioda.reserved_pe_idx, win, 0, idx);
> +		rc = opal_pci_map_pe_mmio_window(phb->opal_id,
> +				phb->ioda.reserved_pe_idx, win, 0, idx);
>  
>  		if (rc != OPAL_SUCCESS)
>  			pe_warn(pe, "Error %lld unmapping (%d) segment#%d\n",
> @@ -3380,8 +3376,7 @@ static void pnv_ioda_release_pe_seg(struct pnv_ioda_pe *pe)
>  				     phb->ioda.io_segmap);
>  		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
>  				     phb->ioda.m32_segmap);
> -		pnv_ioda_free_pe_seg(pe, OPAL_M64_WINDOW_TYPE,
> -				     phb->ioda.m64_segmap);
> +		/* M64 is pre-configured by pnv_ioda1_init_m64() */
>  	} else if (phb->type == PNV_PHB_IODA2) {
>  		pnv_ioda_free_pe_seg(pe, OPAL_M32_WINDOW_TYPE,
>  				     phb->ioda.m32_segmap);
> 

-- 
Alexey
