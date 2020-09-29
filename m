Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B727BBBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:05:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0m4v6SHZzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:05:19 +1000 (AEST)
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
 header.s=20150623 header.b=NOsx140C; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lvD2szpzDqHn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:56:56 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id y14so2739575pgf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fAldvTo8axufXMmXABSEs/MfQr4P8m2C6ONMBeT/H7Y=;
 b=NOsx140Cr1k/1K36kaETKjGzYmlj/CspJK/5rGrQCMl0PJT97jmGQdgsf3o5zM3aD0
 Grh4lx/lN0P7hDQSMebjvzbtFZICKb6ZMPL9UHRd6P6TgHipzew+ADifrEPHx+rcYn16
 mX2Kiz5k87ncyiEsDkwbZUP4eQ5b9at2vs074UB6dMrN2EgeUMuSa6l5ECyVQJpAhQRi
 H6HSpvFTJAi1nPF+ZxZwH3wtEejiqSPiAqbChkerY2fW13xjqGqbmY3kw2l+iahX7rRQ
 AANnh4B7hO3OoAtEC1qc80JPZoKyZVYrQm77KTc0hsBl1jPZYfEYj6yAWa8TB2BZtJgB
 0hFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fAldvTo8axufXMmXABSEs/MfQr4P8m2C6ONMBeT/H7Y=;
 b=nX3O5nKId4DiJ/0I8yPeZpFHrK372sWbSTtu0EOSyBE37pn+yLZQ6q/EJfK/+/zmWv
 jfq8AJo1DUamfblFikTklF7z1Vl6MPH4GyHsJsthfbUgnOAs6BZMqpi1fBHATkfK643X
 s3sJOi3d5vrFTFlGiOu7rZ2oWt4efTL+QWs6SJoadJKkLwFmjResBu6bvpHjN9k8sYUS
 ntPsFDw1QDjBYmRnu0qJk7zSVuZldcSdrvL/5BHZiFsxok0k86Ws3//Zj/+oZsr0fzpZ
 q0x5i/wz8aEKANvdE9K78GuNaoeC026frPIhCpcjUYyijh3Frjp4t46s++DQWBxOb5wT
 SyPw==
X-Gm-Message-State: AOAM531vUKfNmIzZHe7JXhm6BcZaCT3eCz0ju0LZhhEp27hHGQNYUg43
 JWoWPLGeRffSOM9tHJz5U1M5BpkxHJJ4gndp
X-Google-Smtp-Source: ABdhPJz1J92TPN9ARnU1X9nudFUjNXSwXlpo4Qpn7igcp75Fm9vNCxP/5FPp4XudOaGovortXG3Erw==
X-Received: by 2002:a17:902:fe81:b029:d2:abce:b4a8 with SMTP id
 x1-20020a170902fe81b02900d2abceb4a8mr244120plm.38.1601351813877; 
 Mon, 28 Sep 2020 20:56:53 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id s28sm3466821pfd.111.2020.09.28.20.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:56:53 -0700 (PDT)
Subject: Re: [PATCH v2 09/14] powerpc/pseries/iommu: Add ddw_property_create()
 and refactor enable_ddw()
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-10-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8442d9df-d9f9-f919-211b-e94cc1822e26@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:56:47 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-10-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/09/2020 03:07, Leonardo Bras wrote:
> Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
> 
> Code used to create a ddw property that was previously scattered in
> enable_ddw() is now gathered in ddw_property_create(), which deals with
> allocation and filling the property, letting it ready for
> of_property_add(), which now occurs in sequence.
> 
> This created an opportunity to reorganize the second part of enable_ddw():
> 
> Without this patch enable_ddw() does, in order:
> kzalloc() property & members, create_ddw(), fill ddwprop inside property,
> ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
> of_add_property(), and list_add().
> 
> With this patch enable_ddw() does, in order:
> create_ddw(), ddw_property_create(), of_add_property(),
> ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
> and list_add().
> 
> This change requires of_remove_property() in case anything fails after
> of_add_property(), but we get to do tce_setrange_multi_pSeriesLP_walk
> in all memory, which looks the most expensive operation, only if
> everything else succeeds.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 106 +++++++++++++++----------
>   1 file changed, 63 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index bba8584a8f9d..510ccb0521af 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -177,7 +177,7 @@ static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
>   		if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
>   			ret = (int)rc;
>   			tce_free_pSeriesLP(liobn, tcenum_start, tceshift,
> -			                   (npages_start - (npages + 1)));
> +					   (npages_start - (npages + 1)));

Unrelated spaces change, the existing code does not seem incorrect (tabs 
first, then spaces).


>   			break;
>   		}
>   
> @@ -215,7 +215,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_PUT_TCE_IND)) {
>   		return tce_build_pSeriesLP(tbl->it_index, tcenum,
>   					   tceshift, npages, uaddr,
> -		                           direction, attrs);
> +					   direction, attrs);


And here.

>   	}
>   
>   	local_irq_save(flags);	/* to protect tcep and the page behind it */
> @@ -269,7 +269,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
>   	if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
>   		ret = (int)rc;
>   		tce_freemulti_pSeriesLP(tbl, tcenum_start,
> -		                        (npages_start - (npages + limit)));
> +					(npages_start - (npages + limit)));

And here.

>   		return ret;
>   	}
>   
> @@ -1121,6 +1121,35 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
>   			 ret);
>   }
>   
> +static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
> +					    u32 page_shift, u32 window_shift)
> +{
> +	struct dynamic_dma_window_prop *ddwprop;
> +	struct property *win64;
> +
> +	win64 = kzalloc(sizeof(*win64), GFP_KERNEL);
> +	if (!win64)
> +		return NULL;
> +
> +	win64->name = kstrdup(propname, GFP_KERNEL);
> +	ddwprop = kzalloc(sizeof(*ddwprop), GFP_KERNEL);
> +	win64->value = ddwprop;
> +	win64->length = sizeof(*ddwprop);
> +	if (!win64->name || !win64->value) {
> +		kfree(win64);
> +		kfree(win64->name);
> +		kfree(win64->value);
> +		return NULL;
> +	}
> +
> +	ddwprop->liobn = cpu_to_be32(liobn);
> +	ddwprop->dma_base = cpu_to_be64(dma_addr);
> +	ddwprop->tce_shift = cpu_to_be32(page_shift);
> +	ddwprop->window_shift = cpu_to_be32(window_shift);
> +
> +	return win64;
> +}
> +
>   /*
>    * If the PE supports dynamic dma windows, and there is space for a table
>    * that can map all pages in a linear offset, then setup such a table,
> @@ -1138,12 +1167,11 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	struct ddw_query_response query;
>   	struct ddw_create_response create;
>   	int page_shift;
> -	u64 max_addr;
> +	u64 max_addr, win_addr;
>   	struct device_node *dn;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	struct direct_window *window;
> -	struct property *win64;
> -	struct dynamic_dma_window_prop *ddwprop;
> +	struct property *win64 = NULL;
>   	struct failed_ddw_pdn *fpdn;
>   	bool default_win_removed = false;
>   
> @@ -1245,72 +1273,64 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		goto out_failed;
>   	}
>   	len = order_base_2(max_addr);
> -	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
> -	if (!win64) {
> -		dev_info(&dev->dev,
> -			"couldn't allocate property for 64bit dma window\n");
> -		goto out_failed;
> -	}
> -	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
> -	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
> -	win64->length = sizeof(*ddwprop);
> -	if (!win64->name || !win64->value) {
> -		dev_info(&dev->dev,
> -			"couldn't allocate property name and value\n");
> -		goto out_free_prop;
> -	}
>   
>   	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
>   	if (ret != 0)
> -		goto out_free_prop;
> -
> -	ddwprop->liobn = cpu_to_be32(create.liobn);
> -	ddwprop->dma_base = cpu_to_be64(((u64)create.addr_hi << 32) |
> -			create.addr_lo);
> -	ddwprop->tce_shift = cpu_to_be32(page_shift);
> -	ddwprop->window_shift = cpu_to_be32(len);
> +		goto out_failed;
>   
>   	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
> -		  create.liobn, dn);
> +		create.liobn, dn);


Unrelated. If you think the spaces/tabs thing needs to be fixed, make it 
a separate patch and do all these changes there at once.


>   
> -	window = ddw_list_new_entry(pdn, ddwprop);
> +	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
> +	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
> +				    page_shift, len);
> +	if (!win64) {
> +		dev_info(&dev->dev,
> +			 "couldn't allocate property, property name, or value\n");
> +		goto out_win_del;
> +	}
> +
> +	ret = of_add_property(pdn, win64);
> +	if (ret) {
> +		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
> +			pdn, ret);
> +		goto out_prop_free;
> +	}
> +
> +	window = ddw_list_new_entry(pdn, win64->value);
>   	if (!window)
> -		goto out_clear_window;
> +		goto out_prop_del;
>   
>   	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
>   			win64->value, tce_setrange_multi_pSeriesLP_walk);
>   	if (ret) {
>   		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
>   			 dn, ret);
> -		goto out_free_window;
> -	}
> -
> -	ret = of_add_property(pdn, win64);
> -	if (ret) {
> -		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
> -			 pdn, ret);
> -		goto out_free_window;
> +		goto out_list_del;
>   	}
>   
>   	spin_lock(&direct_window_list_lock);
>   	list_add(&window->list, &direct_window_list);
>   	spin_unlock(&direct_window_list_lock);
>   
> -	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
> +	dev->dev.archdata.dma_offset = win_addr;
>   	goto out_unlock;
>   
> -out_free_window:
> +out_list_del:
>   	kfree(window);
>   
> -out_clear_window:
> -	remove_ddw(pdn, true);
> +out_prop_del:
> +	of_remove_property(pdn, win64);
>   
> -out_free_prop:
> +out_prop_free:


Really? :) s/out_prop_del/out_del_prop/ may be? The less unrelated 
changes the better.


>   	kfree(win64->name);
>   	kfree(win64->value);
>   	kfree(win64);
>   	win64 = NULL;
>   
> +out_win_del:
> +	remove_ddw(pdn, true);
> +
>   out_failed:
>   	if (default_win_removed)
>   		reset_dma_window(dev, pdn);
> 

-- 
Alexey
