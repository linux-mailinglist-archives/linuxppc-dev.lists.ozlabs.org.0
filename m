Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4566B203476
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 12:04:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r4l637mKzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 20:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=fe4ZhvE8; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r4hb0jjjzDqWy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 20:02:20 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id b5so8178564pfp.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 03:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/NcVIXiiE9x8ZKquN67mQqSl2HACuH3AEuB0kcfccLA=;
 b=fe4ZhvE8bqQfEcQUTBKXYiEkK0bn58gnRochRX32i7AbCiMyg30uCIggbk9ysCIYBw
 AWJMoSJAanabCNkyg3Ymh+nK2GbJB2BWKj9+ddL+GIMIumjCEwWc1HOCDNyhHLXutnuJ
 mldQDZFqMSjEjldV9Z/RGN3aplt9/6LbK4PdK4j2yBzdsbC3XC4wQRsx9x2GtfyUI19e
 j6VDiDIQ+u/GUq+9aXZORxdP2Xw65L9NZs5Pmu43YMcgiBXgBlh3XzkDP1W+TNwoVyN6
 XVVBlRceDl7rEg6HIUaHn1GJ5lFDIeSVoYwEDuHP2Opa7169rfJPyiuVZsyS6k0yNE+h
 xHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/NcVIXiiE9x8ZKquN67mQqSl2HACuH3AEuB0kcfccLA=;
 b=PFNACWKUr01JwCBwEpMVDTpTUgm3LEfcRgCfMXhnfaBwdEppc/ZEXqCdo8a57gbakv
 ZEOiPyjrOuMIoIdeX7BJrHQ/B+mYcgXDrPI1JZqT0MOg3ocSzoF+6gNLaTOFYgC2FWen
 MulfPS+gUrdY0ISyLuS/ra52DXnjBWL3qNZCn/m27/c83wHZQC7jgDdEOBwGcS4nceG+
 Ll8Yp6pFOgoQh9p6GOpvms64fTT0S3rdhxsacpQjSwDaMG51xRC53b/ja4421r2zeysY
 iXuxllxdqLD/+FXekJBTbI43cop3KhkzliMacw87oW97HBfHD4TPcFc3+XG9krIxeNGR
 qIkg==
X-Gm-Message-State: AOAM530ts13ey5yrPtPvJdHzfxo0GTt/Sa5XIVwPPTrytnYPueLKV1Bo
 cw69VFpgG3+OvBuWY4RkKVNZcg==
X-Google-Smtp-Source: ABdhPJzKas5uAo1jsU2w0QcY5qWWjcoAVvUKu/iBMDzfZpg15AYSPL4Fuq4OCRM+6/B5DhvLlxmKmw==
X-Received: by 2002:a63:935c:: with SMTP id w28mr12061329pgm.174.1592820137007; 
 Mon, 22 Jun 2020 03:02:17 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id ev20sm12693732pjb.8.2020.06.22.03.02.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jun 2020 03:02:16 -0700 (PDT)
Subject: Re: [PATCH 1/4] powerpc/pseries/iommu: Update call to
 ibm,query-pe-dma-windows
To: Leonardo Bras <leobras.c@gmail.com>
References: <20200619050619.266888-1-leobras.c@gmail.com>
 <20200619050619.266888-2-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <cfbcacde-ca7f-5fc7-2fcf-267f698f3d49@ozlabs.ru>
Date: Mon, 22 Jun 2020 20:02:11 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619050619.266888-2-leobras.c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Ram Pai <linuxram@us.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/06/2020 15:06, Leonardo Bras wrote:
> From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can make the number of
> outputs from "ibm,query-pe-dma-windows" go from 5 to 6.
> 
> This change of output size is meant to expand the address size of
> largest_available_block PE TCE from 32-bit to 64-bit, which ends up
> shifting page_size and migration_capable.
> 
> This ends up requiring the update of
> ddw_query_response->largest_available_block from u32 to u64, and manually
> assigning the values from the buffer into this struct, according to
> output size.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>  arch/powerpc/platforms/pseries/iommu.c | 57 +++++++++++++++++++++-----
>  1 file changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 6d47b4a3ce39..e5a617738c8b 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -334,7 +334,7 @@ struct direct_window {
>  /* Dynamic DMA Window support */
>  struct ddw_query_response {
>  	u32 windows_available;
> -	u32 largest_available_block;
> +	u64 largest_available_block;
>  	u32 page_size;
>  	u32 migration_capable;
>  };
> @@ -869,14 +869,32 @@ static int find_existing_ddw_windows(void)
>  }
>  machine_arch_initcall(pseries, find_existing_ddw_windows);
>  
> +/*
> + * From LoPAR level 2.8, "ibm,ddw-extensions" index 3 can rule how many output
> + * parameters ibm,query-pe-dma-windows will have, ranging from 5 to 6.
> + */
> +
> +static int query_ddw_out_sz(struct device_node *par_dn)

Can easily be folded into query_ddw().

> +{
> +	int ret;
> +	u32 ddw_ext[3];
> +
> +	ret = of_property_read_u32_array(par_dn, "ibm,ddw-extensions",
> +					 &ddw_ext[0], 3);
> +	if (ret || ddw_ext[0] < 2 || ddw_ext[2] != 1)


Oh that PAPR thing again :-/

===
The “ibm,ddw-extensions” property value is a list of integers the first
integer indicates the number of extensions implemented and subsequent
integers, one per extension, provide a value associated with that
extension.
===

So ddw_ext[0] is length.
Listindex==2 is for "reset" says PAPR and
Listindex==3 is for this new 64bit "largest_available_block".

So I'd expect ddw_ext[2] to have the "reset" token and ddw_ext[3] to
have "1" for this new feature but indexes are smaller. I am confused.
Either way these "2" and "3" needs to be defined in macros, "0" probably
too.

Please post 'lsprop "ibm,ddw-extensions"' here. Thanks,



> +		return 5;
> +	return 6;
> +}
> +
>  static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
> -			struct ddw_query_response *query)
> +		     struct ddw_query_response *query,
> +		     struct device_node *par_dn)
>  {
>  	struct device_node *dn;
>  	struct pci_dn *pdn;
> -	u32 cfg_addr;
> +	u32 cfg_addr, query_out[5];
>  	u64 buid;
> -	int ret;
> +	int ret, out_sz;
>  
>  	/*
>  	 * Get the config address and phb buid of the PE window.
> @@ -888,12 +906,29 @@ static int query_ddw(struct pci_dev *dev, const u32 *ddw_avail,
>  	pdn = PCI_DN(dn);
>  	buid = pdn->phb->buid;
>  	cfg_addr = ((pdn->busno << 16) | (pdn->devfn << 8));
> +	out_sz = query_ddw_out_sz(par_dn);
> +
> +	ret = rtas_call(ddw_avail[0], 3, out_sz, query_out,
> +			cfg_addr, BUID_HI(buid), BUID_LO(buid));
> +	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x returned %d\n",
> +		 ddw_avail[0], cfg_addr, BUID_HI(buid), BUID_LO(buid), ret);
> +
> +	switch (out_sz) {
> +	case 5:
> +		query->windows_available = query_out[0];
> +		query->largest_available_block = query_out[1];
> +		query->page_size = query_out[2];
> +		query->migration_capable = query_out[3];
> +		break;
> +	case 6:
> +		query->windows_available = query_out[0];
> +		query->largest_available_block = ((u64)query_out[1] << 32) |
> +						 query_out[2];
> +		query->page_size = query_out[3];
> +		query->migration_capable = query_out[4];
> +		break;
> +	}
>  
> -	ret = rtas_call(ddw_avail[0], 3, 5, (u32 *)query,
> -		  cfg_addr, BUID_HI(buid), BUID_LO(buid));
> -	dev_info(&dev->dev, "ibm,query-pe-dma-windows(%x) %x %x %x"
> -		" returned %d\n", ddw_avail[0], cfg_addr, BUID_HI(buid),
> -		BUID_LO(buid), ret);
>  	return ret;
>  }
>  
> @@ -1040,7 +1075,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	 * of page sizes: supported and supported for migrate-dma.
>  	 */
>  	dn = pci_device_to_OF_node(dev);
> -	ret = query_ddw(dev, ddw_avail, &query);
> +	ret = query_ddw(dev, ddw_avail, &query, pdn);
>  	if (ret != 0)
>  		goto out_failed;
>  
> @@ -1068,7 +1103,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>  	/* check largest block * page size > max memory hotplug addr */
>  	max_addr = ddw_memory_hotplug_max();
>  	if (query.largest_available_block < (max_addr >> page_shift)) {
> -		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %u "
> +		dev_dbg(&dev->dev, "can't map partition max 0x%llx with %llu "
>  			  "%llu-sized pages\n", max_addr,  query.largest_available_block,
>  			  1ULL << page_shift);
>  		goto out_failed;
> 

-- 
Alexey
