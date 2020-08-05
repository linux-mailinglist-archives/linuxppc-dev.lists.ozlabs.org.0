Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9465323C3F1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 05:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLxfN6D7YzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 13:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mzV+7XEN; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLxcQ0XMDzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 13:16:52 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id j21so4896966pgi.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z2B0RmAB4ikc/fEMgmPCTBuqG3VCsesR19swZhGr12s=;
 b=mzV+7XENhGV3RDNd+3/YtuVeJgGsZwTDMz5ITjJYRIixwwkM5nHl41KlWqNAaCHVLr
 NQdOUmTBr5pRVXOCF6WUveXIiW69y41xCZM9vBRSBo8ZKuvg/86XUG3U6RlN2iLQLTjo
 lhS7jc4mq7VW/Tz0IA367v3kKOy2GVBXXGUvCV9T+u7Slhy5Z5DKK2V5Y/ITgvYOI+xQ
 e0hp9QmJE698waeExf4ukAvSXycqflodSd7oDuvJwGNT2lJQp5EnDkru5Zg8lUSXBUZe
 sFCbyJeNnVbMM4MsV9b0RGekpY33L5333J22MOCimfNHaiI5XDF/Rw3CAWtWL6WNLEtc
 sznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Z2B0RmAB4ikc/fEMgmPCTBuqG3VCsesR19swZhGr12s=;
 b=lHbyhqS6YNLfAVEkjQ0m4Cr1BwgtzzE2uI/D7OU4eTbM7Tk55rdClVxlCYghjL3Ge2
 3vg8j3yicXpagmPqDLNpdMy7WUtjiyg9XilOqKP7y7ldNeF/XtfGV2O0e8v2oEucSw5G
 4CDRhGI23dwULHNp/MXi2nqGdVSoYZXzKcVbM3OxrJnwWERduQUTKW/jhWaVYfLa7jL+
 vk9b1h7PE6C3HqNYC8eGL6YfiGtqbswGFXGN1H2VegW/BLD3tGZ8wU2LmE7wLdB2sejs
 4MC55yGKytVvoXUb+/BsEXMIaIRUEhhJ75mvlETd/VMXx/qNi5gJLkY52c3DkmvVgOsY
 QNsw==
X-Gm-Message-State: AOAM5302VG2pndi0g2pd+xqdbVESdIE34F9wGfIYTg3DRjzXB5/coUlN
 W4EgPgnpFfea28FdXj3O/UB92w==
X-Google-Smtp-Source: ABdhPJwK8RLvQaxRUsa+qfF1Br+vOHOQ14vIi7MBMEyvJoUSMTzoNyBHd7Tg58pGKzqET0CAMfgaOQ==
X-Received: by 2002:aa7:9d04:: with SMTP id k4mr1354807pfp.256.1596597409860; 
 Tue, 04 Aug 2020 20:16:49 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id v77sm866846pfc.137.2020.08.04.20.16.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Aug 2020 20:16:48 -0700 (PDT)
Subject: Re: [PATCH v5 1/4] powerpc/pseries/iommu: Create defines for
 operations in ibm,ddw-applicable
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200805030455.123024-1-leobras.c@gmail.com>
 <20200805030455.123024-2-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <62a5bd43-6c81-0c79-806c-e9001ae010f6@ozlabs.ru>
Date: Wed, 5 Aug 2020 13:16:41 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805030455.123024-2-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/08/2020 13:04, Leonardo Bras wrote:
> Create defines to help handling ibm,ddw-applicable values, avoiding
> confusion about the index of given operations.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> Tested-by: David Dai <zdai@linux.vnet.ibm.com>

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> ---
>  arch/powerpc/platforms/pseries/iommu.c | 43 ++++++++++++++++----------
>  1 file changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 6d47b4a3ce39..ac0d6376bdad 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -39,6 +39,14 @@
>  
>  #include "pseries.h"
>  
> +enum {
> +	DDW_QUERY_PE_DMA_WIN  = 0,
> +	DDW_CREATE_PE_DMA_WIN = 1,
> +	DDW_REMOVE_PE_DMA_WIN = 2,
> +
> +	DDW_APPLICABLE_SIZE
> +};
> +
>  static struct iommu_table_group *iommu_pseries_alloc_group(int node)
>  {
>  	struct iommu_table_group *table_group;
> @@ -771,12 +779,12 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>  {
>  	struct dynamic_dma_window_prop *dwp;
>  	struct property *win64;
> -	u32 ddw_avail[3];
> +	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>  	u64 liobn;
>  	int ret = 0;
>  
>  	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
> -					 &ddw_avail[0], 3);
> +					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
>  
>  	win64 = of_find_property(np, DIRECT64_PROPNAME, NULL);
>  	if (!win64)
> @@ -798,15 +806,15 @@ static void remove_ddw(struct device_node *np, bool remove_prop)
>  		pr_debug("%pOF successfully cleared tces in window.\n",
>  			 np);
>  
> -	ret = rtas_call(ddw_avail[2], 1, 1, NULL, liobn);
> +	ret = rtas_call(ddw_avail[DDW_REMOVE_PE_DMA_WIN], 1, 1, NULL, liobn);
>  	if (ret)
>  		pr_warn("%pOF: failed to remove direct window: rtas returned "
>  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
> -			np, ret, ddw_avail[2], liobn);
> +			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
>  	else
>  		pr_debug("%pOF: successfully removed direct window: rtas returned "
>  			"%d to ibm,remove-pe-dma-window(%x) %llx\n",
> -			np, ret, ddw_avail[2], liobn);
> +			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
>  
>  delprop:
>  	if (remove_prop)
> @@ -889,11 +897,11 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
>  	buid = pdn->phb->buid;
>  	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
>  
> -	ret = rtas_call(ddw_avail[0], 3, 5, (u32 *)query,
> -		  cfg_addr, BUID_HI(buid), BUID_LO(buid));
> +	ret = rtas_call(ddw_avail[DDW_QUERY_PE_DMA_WIN], 3, 5, (u32 *)query,
> +			cfg_addr, BUID_HI(buid), BUID_LO(buid));
>  	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
> -		" returned %d\n", ddw_avail[0], cfg_addr, BUID_HI(buid),
> -		BUID_LO(buid), ret);
> +		" returned %d\n", ddw_avail[DDW_QUERY_PE_DMA_WIN], cfg_addr,
> +		 BUID_HI(buid), BUID_LO(buid), ret);
>  	return ret;
>  }
>  
> @@ -920,15 +928,16 @@ static int create_ddw(struct pci_dev *dev, const u32 *ddw_avail,
>  
>  	do {
>  		/* extra outputs are LIOBN and dma-addr (hi, lo) */
> -		ret = rtas_call(ddw_avail[1], 5, 4, (u32 *)create,
> -				cfg_addr, BUID_HI(buid), BUID_LO(buid),
> -				page_shift, window_shift);
> +		ret = rtas_call(ddw_avail[DDW_CREATE_PE_DMA_WIN], 5, 4,
> +				(u32 *)create, cfg_addr, BUID_HI(buid),
> +				BUID_LO(buid), page_shift, window_shift);
>  	} while (rtas_busy_delay(ret));
>  	dev_info(&dev->dev,
>  		"ibm,create-pe-dma-window(%x) %x %x %x %x %x returned %d "
> -		"(liobn = 0x%x starting addr = %x %x)\n", ddw_avail[1],
> -		 cfg_addr, BUID_HI(buid), BUID_LO(buid), page_shift,
> -		 window_shift, ret, create->liobn, create->addr_hi, create->addr_lo);
> +		"(liobn = 0x%x starting addr = %x %x)\n",
> +		 ddw_avail[DDW_CREATE_PE_DMA_WIN], cfg_addr, BUID_HI(buid),
> +		 BUID_LO(buid), page_shift, window_shift, ret, create->liobn,
> +		 create->addr_hi, create->addr_lo);
>  
>  	return ret;
>  }
> @@ -996,7 +1005,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	int page_shift;
>  	u64 dma_addr, max_addr;
>  	struct device_node *dn;
> -	u32 ddw_avail[3];
> +	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>  	struct direct_window *window;
>  	struct property *win64;
>  	struct dynamic_dma_window_prop *ddwprop;
> @@ -1029,7 +1038,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	 * the property is actually in the parent, not the PE
>  	 */
>  	ret = of_property_read_u32_array(pdn, "ibm,ddw-applicable",
> -					 &ddw_avail[0], 3);
> +					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
>  	if (ret)
>  		goto out_failed;
>  
> 

-- 
Alexey
