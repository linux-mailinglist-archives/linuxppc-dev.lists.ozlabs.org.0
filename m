Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6D3651C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 07:19:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPX6T4CMjz303t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 15:19:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=AEe+OnFJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AEe+OnFJ; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPX623xhjz2xb7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 15:18:47 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id g16so2171531plq.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 22:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=73AAcxdshwVHBh5SM/Wh/8tNFMypchVB46zj9Wl6Tpo=;
 b=AEe+OnFJmpMQ2eaKh5qExivHBVzJAoN9mx/uHr8Z4TzuN16v7pDgroD8PE5y8+ONC7
 55AixR19RdBV3W8PsLWpCiLGnJqnWJfsndx6l4IJicFoMlVsI6Hmx8ldr7R5LGDRnx+H
 QBpFlgdl8ecXWFpol1dbW0BpDAHa5XRl8BwhmrFFdBQeSlm5tfjLHpZEJmfpo1XOp13v
 GsBiH1hzy7HCmDBGxd/rJL0R+VpZoYp4L9ls9L3cSTO7+x62oiNZ/PcR7d0y4gXrHm6b
 IcmkGTGgkcZfIQ4ZlGnImTVRMCemi6ZOn8CZCJA47SRM9+xsvO72PyUtHa2q7SvtQtk2
 ywcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=73AAcxdshwVHBh5SM/Wh/8tNFMypchVB46zj9Wl6Tpo=;
 b=DOhVVwMvA8JtMY42SU2R4DzbbMGc5mVCzz7uLeGFy65RVKWni9pOKNSG34XTvLsjTz
 SF29rHCI+wldhE4g2rwUl6r4bZWd3eJQgPpigA30mGQdNd5mWlLAjnAJvq+1WvqnJE1u
 sqNLMwVYN+UlMMWELiV/IJPs6JLNP2hba258XyoblpRlsHg3WGo440itn6tN0OZhl+RF
 RZi+Z66Ho+rOb//vxM7nLeyzDN57RjY35Ez0/F3ic6vJIs/MkNETC+kW5lEac4GZA8pJ
 cZtxH0n0Sk8ltRo4lnEjHRBkQjyCUK6+j9zJU+oAQ9TApBahvzw8X6vETmf9a+T8y3PH
 nTzg==
X-Gm-Message-State: AOAM531zbdADQi0GADCGPR5I/M2l79TjaknWIkGiDprcllINs93ZObpc
 +0x4WN2KtlxCS8kEa/86GzjwEA==
X-Google-Smtp-Source: ABdhPJy//9ofYwNeDVmogiXfm/F9Svow7vj/jXnh2HHYWuXUt4HyHTuZZYDmjzQ1+zcpxiKChTbB5A==
X-Received: by 2002:a17:902:be02:b029:e6:bb0d:6c1e with SMTP id
 r2-20020a170902be02b02900e6bb0d6c1emr26915647pls.77.1618895922211; 
 Mon, 19 Apr 2021 22:18:42 -0700 (PDT)
Received: from localhost
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id w21sm1063751pjy.21.2021.04.19.22.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 22:18:41 -0700 (PDT)
Message-ID: <58b28a98-37aa-055f-5dec-d8c0005c9519@ozlabs.ru>
Date: Tue, 20 Apr 2021 15:18:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH 1/1] powerpc/pseries/iommu: Fix window size for direct
 mapping with pmem
Content-Language: en-US
To: Leonardo Bras <leobras.c@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20210420045404.438735-1-leobras.c@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210420045404.438735-1-leobras.c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 20/04/2021 14:54, Leonardo Bras wrote:
> As of today, if the DDW is big enough to fit (1 << MAX_PHYSMEM_BITS) it's
> possible to use direct DMA mapping even with pmem region.
> 
> But, if that happens, the window size (len) is set to
> (MAX_PHYSMEM_BITS - page_shift) instead of MAX_PHYSMEM_BITS, causing a
> pagesize times smaller DDW to be created, being insufficient for correct
> usage.
> 
> Fix this so the correct window size is used in this case.

Good find indeed.

afaict this does not create a huge problem though as 
query.largest_available_block is always smaller than (MAX_PHYSMEM_BITS - 
page_shift) where it matters (phyp).


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> Fixes: bf6e2d562bbc4("powerpc/dma: Fallback to dma_ops when persistent memory present")
> Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> ---
>   arch/powerpc/platforms/pseries/iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 9fc5217f0c8e..836cbbe0ecc5 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1229,7 +1229,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   	if (pmem_present) {
>   		if (query.largest_available_block >=
>   		    (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
> -			len = MAX_PHYSMEM_BITS - page_shift;
> +			len = MAX_PHYSMEM_BITS;
>   		else
>   			dev_info(&dev->dev, "Skipping ibm,pmemory");
>   	}
> 

-- 
Alexey
