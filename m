Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A109127BBD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 06:13:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0mGp615yzDqTs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 14:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=0OSlCrt8; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0lw9195SzDqJL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 13:57:44 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id 5so2772630pgf.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 20:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HL69zotpWAOcyBCJkjYTUA9J0pLf7f/zHJ4uvfJOVZc=;
 b=0OSlCrt8IeuBJUzDeUm5NStjfWUfJA4u4WTVLWkXsVnHakm8SzF1LcoGHzh0wfTQ/j
 g2BOkB1Q5/rB1rD9vdG6ydD0CcdkTcku3HFn1J+J40UBO51CeChgiKsijrRtNoF3Kdo/
 TipyByuuSnjwdOarAXRXfhlh5IgunQuHTgyAcL9U8iP6dDzBPNo1X+QZ49qnu98HKaI5
 U5JGkQdj0yv27qYqha1kPlnWolhQvbg5SSFGaXSZUvoetZu80B4kqvePGvimAkbfoRAs
 kf0XZHq7slnX1XsV4aGmNv4Y6HwoTxhPoK3INCY44a0AkmHSjJmeCJqZqb7OG3cpXlfi
 xB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HL69zotpWAOcyBCJkjYTUA9J0pLf7f/zHJ4uvfJOVZc=;
 b=ecUn2CTkHXfdSmY1t04CPAAQHzfJO8covNmsArAJFu8F+NPIppcdG666924gWqEGeR
 H8ukXEUFg3/ZGp4rhgu66hroUbXNoZgkCcg3xFz/TbfKAdR+WaJwJXJoNCAg3p9lgeIJ
 xIj7wDCx6vaABW6CsRobvrSMc/E7+MvBs5dNsmp5+DRaEBCkXnn/smQgMPPAKRn6yTIg
 U4TZjHWwDblZQ5roDz6HjKk5L9QBvdPeq66K2lxofGsxlMnaWI9KEt4TCaHqpmPH+G9/
 KxyJr2w8j+CM2PzvVdF5nOXwLXqTQb76hdZ+qZOrL5qY9b0sYEXwOwiFWJUOFshCaLFz
 8P2Q==
X-Gm-Message-State: AOAM532G7enVNzbP6hoAWOA8amww1iuepzO9suHFbY5Lone6QapUsSCB
 q5mvJpeKEodzOle8YcdqLIsQLQHg8IYifBbf
X-Google-Smtp-Source: ABdhPJzod/8VJylhDivx8Xp06Qz0XYFwZpHrtg9DPCMZosi+G+oD6Lq0zx+N94DqgxXTqOjgPby9Pg==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr1820016pgq.325.1601351862430; 
 Mon, 28 Sep 2020 20:57:42 -0700 (PDT)
Received: from [192.168.10.88] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with UTF8SMTPSA id y6sm2947256pji.1.2020.09.28.20.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2020 20:57:41 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] powerpc/pseries/iommu: Add ddw_list_new_entry()
 helper
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Ram Pai
 <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
 <20200911170738.82818-8-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <903f88a7-af27-a1a9-e810-769be412cb9e@ozlabs.ru>
Date: Tue, 29 Sep 2020 13:57:36 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:82.0) Gecko/20100101
 Thunderbird/82.0
MIME-Version: 1.0
In-Reply-To: <20200911170738.82818-8-leobras.c@gmail.com>
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
> There are two functions creating direct_window_list entries in a
> similar way, so create a ddw_list_new_entry() to avoid duplicity and
> simplify those functions.
> 
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> ---
>   arch/powerpc/platforms/pseries/iommu.c | 32 +++++++++++++++++---------
>   1 file changed, 21 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 49008d2e217d..e4c17d27dcf3 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -869,6 +869,21 @@ static u64 find_existing_ddw(struct device_node *pdn)
>   	return dma_addr;
>   }
>   
> +static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
> +						const struct dynamic_dma_window_prop *dma64)
> +{
> +	struct direct_window *window;
> +
> +	window = kzalloc(sizeof(*window), GFP_KERNEL);
> +	if (!window)
> +		return NULL;
> +
> +	window->device = pdn;
> +	window->prop = dma64;
> +
> +	return window;
> +}
> +
>   static int find_existing_ddw_windows(void)
>   {
>   	int len;
> @@ -881,18 +896,15 @@ static int find_existing_ddw_windows(void)
>   
>   	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
>   		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
> -		if (!direct64)
> -			continue;
> -
> -		window = kzalloc(sizeof(*window), GFP_KERNEL);
> -		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
> -			kfree(window);
> +		if (!direct64 || len < sizeof(*direct64)) {
>   			remove_ddw(pdn, true);
>   			continue;
>   		}
>   
> -		window->device = pdn;
> -		window->prop = direct64;
> +		window = ddw_list_new_entry(pdn, direct64);
> +		if (!window)
> +			break;
> +
>   		spin_lock(&direct_window_list_lock);
>   		list_add(&window->list, &direct_window_list);
>   		spin_unlock(&direct_window_list_lock);
> @@ -1261,7 +1273,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
>   		  create.liobn, dn);
>   
> -	window = kzalloc(sizeof(*window), GFP_KERNEL);
> +	window = ddw_list_new_entry(pdn, ddwprop);
>   	if (!window)
>   		goto out_clear_window;
>   
> @@ -1280,8 +1292,6 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   		goto out_free_window;
>   	}
>   
> -	window->device = pdn;
> -	window->prop = ddwprop;
>   	spin_lock(&direct_window_list_lock);
>   	list_add(&window->list, &direct_window_list);
>   	spin_unlock(&direct_window_list_lock);
> 

-- 
Alexey
