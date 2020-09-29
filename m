Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B5427BBA9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 05:59:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0lyG5M8tzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 13:59:34 +1000 (AEST)
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
 header.s=20150623 header.b=CiQSt+0G; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0ltY2SgdzDqHn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:56:21 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id u24so2782816pgi.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uEGlmO5KhSuosaDVjtaaNomeLUTdCnMknGgTnvomOCw=;
 b=CiQSt+0GjkvzuZdBZx0ISzxV5HXENRidkcJlgAMEVzAPeA/mPkad9y8A0QmpMfKMdD
 2x17UnG5a36XQ8PzUflVk/T9APZZcKO6Xp8pW0CMZJW6HU/hcPNAUDbZ2IbmEEqgcv75
 2p3lNCtEqmgc1CQzCcUNN0wCtT1MR7W1iOiYYqFiCuBycqiKFKnb/20bPiTSeQDs3Mp7
 gUL0KZc51Ww+Aj07RFy+c+j3RDtY28bVjstTtum4CCakRRtM4VvwewGPbKSHOC1nMcoc
 VTjjGZE0iBveRoE6tqmGZBOK2zz89IlbgB1nKpFpvElvAPMb4dGqemx2L335fhzJEWGI
 mybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uEGlmO5KhSuosaDVjtaaNomeLUTdCnMknGgTnvomOCw=;
 b=GdhS8oiBQj36Gu76wQMLv8p/bAQi8XwMElOS0TS9CLjjwh5FJPtEPhfl7MWckexPCt
 lklBaNzSwLDsznLrlAu0xvT65vrhhvv+jcsTO8yAGQ2a5hQMh1uy0UBmgD4/YTZhnyqm
 629knNo8Vk4ptfkAgrGoSJL2GjYcsCWSpLxglWN/t78VsvTyjsx0j/rurwNDFPYO4zHq
 TLs6VO+sIGyLPpZYyWYusLakpqKv3AcbT5o66CHHkKVC+nsLQRrl+UoE9N1eavPEDq+l
 8RIkc/Siy1eTD/9yq13i8ji6wSgvSx9c9wAG6d1OFQmDHtSDzcd3bgtEKbtpcm6sY2o1
 ZlSA==
X-Gm-Message-State: AOAM532CPn/xQ8DzenNaPc+nd2xkaRqGAxazVXgtpyjyNvWiZpb7xyQ2
 eazbUIuYmvARTUw4jTG7k5hwopwwzNnq76y+
X-Google-Smtp-Source: ABdhPJz24NAZbJjw/H8Yxa8w7ju1aFqL2iXKEeFN7zwceoEXMkc66iHTUcjmuMwhZxlJaFZmqT2Sng==
X-Received: by 2002:a63:6746:: with SMTP id b67mr1565074pgc.301.1601351778238; 
 Mon, 28 Sep 2020 20:56:18 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id a2sm3128791pfk.201.2020.09.28.20.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:56:17 -0700 (PDT)
Subject: Re: [PATCH v2 11/14] powerpc/pseries/iommu: Update
 remove_dma_window() to accept property name
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-12-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <5b26b874-6f7a-ce1f-fe33-d6861f7ffb4b@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:56:11 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-12-leobras.c@gmail.com>
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
> Update remove_dma_window() so it can be used to remove DDW with a given
> property name.
> 

Out of context this seems useless. How about?
===
At the moment pseries stores information about created directly mapped 
DDW window in DIRECT64_PROPNAME. We are going to implement indirect DDW 
window which we need to preserve during kexec so we need another 
property for that.
===

Feel free to correct my english :)


> This enables the creation of new property names for DDW, so we can
> have different usage for it, like indirect mapping.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index abd36b257725..f6a65ecd1db5 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -818,31 +818,32 @@ static void remove_dma_window(struct device_node *np, u32 *ddw_avail,
>   			np, ret, ddw_avail[DDW_REMOVE_PE_DMA_WIN], liobn);
>   }
>   
> -static void remove_ddw(struct device_node *np, bool remove_prop)
> +static int remove_ddw(struct device_node *np, bool remove_prop, const char *win_name)
>   {
>   	struct property *win;
>   	u32 ddw_avail[DDW_APPLICABLE_SIZE];
>   	int ret = 0;
>   
> +	win = of_find_property(np, win_name, NULL);
> +	if (!win)
> +		return -EINVAL;
> +
>   	ret = of_property_read_u32_array(np, "ibm,ddw-applicable",
>   					 &ddw_avail[0], DDW_APPLICABLE_SIZE);
>   	if (ret)
> -		return;
> -
> -	win = of_find_property(np, DIRECT64_PROPNAME, NULL);
> -	if (!win)
> -		return;
> +		return 0;
>   
>   	if (win->length >= sizeof(struct dynamic_dma_window_prop))
>   		remove_dma_window(np, ddw_avail, win);
>   
>   	if (!remove_prop)
> -		return;
> +		return 0;
>   
>   	ret = of_remove_property(np, win);
>   	if (ret)
>   		pr_warn("%pOF: failed to remove direct window property: %d\n",
>   			np, ret);
> +	return 0;


You do not test the return code anywhere until 13/14 so I'd say merge 
this one into 13/14, the same comment applies to 12/14. If you do not 
move chunks in 13/14, it is going to be fairly small patch.


>   }
>   
>   static bool find_existing_ddw(struct device_node *pdn, u64 *dma_addr)
> @@ -894,7 +895,7 @@ static int find_existing_ddw_windows(void)
>   	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
>   		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
>   		if (!direct64 || len < sizeof(*direct64)) {
> -			remove_ddw(pdn, true);
> +			remove_ddw(pdn, true, DIRECT64_PROPNAME);
>   			continue;
>   		}
>   
> @@ -1325,7 +1326,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	win64 = NULL;
>   
>   out_win_del:
> -	remove_ddw(pdn, true);
> +	remove_ddw(pdn, true, DIRECT64_PROPNAME);
>   
>   out_failed:
>   	if (default_win_removed)
> @@ -1480,7 +1481,7 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>   		 * we have to remove the property when releasing
>   		 * the device node.
>   		 */
> -		remove_ddw(np, false);
> +		remove_ddw(np, false, DIRECT64_PROPNAME);
>   		if (pci && pci->table_group)
>   			iommu_pseries_free_group(pci->table_group,
>   					np->full_name);
> 

-- 
Alexey
