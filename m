Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CB637DE2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 22:13:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KcKp6HpbzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 06:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="stIiNeN9"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KcJN2BCWzDql8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 06:12:04 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id l15so3175778otn.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZplH1ueYIFTxbhcNaq6d9TNtLXhmYa3vn9NLw27k9Lg=;
 b=stIiNeN9hdh/mk6PIsJUOcTV5NamnY+Y+K3zQGA/YUbAsxjwv51CGIsZSrrY1ygC5u
 Ndjv8UvipwdJcvPnTGbXklxessOCWoR2PVsRgn7tauT5lgtngZvoq0M5wzWL7bpi+g9N
 XdwMm8VvjAqoO3mCTAqphKPLlYiLz7IABHFHrfYUGnBPM8P1Wd0eWhQJWHzUz4Z2bgQq
 2DwHS6Z2slz5m7Tq6KXezIEwPtYEhG/fj5ic/eCici/bSdauJ1rFG44EgZ55tfYqAAfr
 Bspd6Y2TT//5MgX+Hb8pqXXVcU7WnLCRyajfW6952doLGSTff8CYoBhTEP+0DjqoAG8E
 bXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZplH1ueYIFTxbhcNaq6d9TNtLXhmYa3vn9NLw27k9Lg=;
 b=I9A+X6xa7Lo0qfythC7RmXpUaJ8pV9lAbInnpJWiOLYTQv16N9L25SwVuhKqyMchQH
 b+eg4ZWCsumYqtvVcEGHLhFMLvtfBvnxqj6Lu12687K160h1VJmnss5KyMN7wFG37vhK
 VcIQ9pIXdZoX1mGG+5Ew3BV2l3c+5cIIHSKo9v3UPQH7RxPuEWY2VT1M3mcWIrdPVVjX
 3M4CFDRVCWoy3kqofqRxyPgDfrti6wVa7GIQRn11zHUVUkfNX38P7y1ZoPjCrbO7IXG0
 btP3LGALUcX7cqd43Dp8Cod8sARY5ogYAFVcEjvrYReKuKWqZZKeSYJbWP/wmSENIbp9
 1XcA==
X-Gm-Message-State: APjAAAWQ1OTEy264EChx9zVNq7b6YmzsKuMML7wh9BfS7wsRNbBNSegi
 ZCiALVGvld1YrdP+ZyjRpjM=
X-Google-Smtp-Source: APXvYqz5aiOuHakWTOD3QUBMVJRMbspstMuG5nak7/mBIuhot/sBvNQAywuKuD4N3fv4rPTfgxvGyA==
X-Received: by 2002:a9d:2f69:: with SMTP id h96mr15834204otb.366.1559851921100; 
 Thu, 06 Jun 2019 13:12:01 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id a15sm2187otl.20.2019.06.06.13.11.56
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 13:11:56 -0700 (PDT)
Subject: Re: [BISECTED REGRESSION] b43legacy broken on G4 PowerBook
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
References: <20190605225059.GA9953@darkstar.musicnaut.iki.fi>
 <dfe6451c93574b61d4bdde4a05c5f8ccf86b31a0.camel@kernel.crashing.org>
 <20190606093149.GA11598@darkstar.musicnaut.iki.fi>
 <d87ac9a7faac0d5522cb496d74afc586410fed9c.camel@kernel.crashing.org>
 <f8df19ffe5b75537045119037459ae9ad4a1de39.camel@kernel.crashing.org>
 <20190606114325.GA7497@lst.de>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <1a9e2b2f-b388-bc13-3b90-9d6b4038073b@lwfinger.net>
Date: Thu, 6 Jun 2019 15:11:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606114325.GA7497@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/6/19 6:43 AM, Christoph Hellwig wrote:
> On Thu, Jun 06, 2019 at 08:57:49PM +1000, Benjamin Herrenschmidt wrote:
>>> Wow... that's an odd amount. One thing we could possibly do is add code
>>> to limit the amount of RAM when we detect that device....
>>
>> Sent too quickly... I mean that *or* force swiotlb at 30-bits on those systems based
>> on detecting the presence of that device in the device-tree.
> 
> swiotlb doesn't really help you, as these days swiotlb on matters for
> the dma_map* case.  What would help is a ZONE_DMA that covers these
> devices.  No need to do the 24-bit x86 does, but 30-bit would do it.
> 
> WIP patch for testing below:
> 
> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
> index b8286a2013b4..7a367ce87c41 100644
> --- a/arch/powerpc/include/asm/page.h
> +++ b/arch/powerpc/include/asm/page.h
> @@ -319,6 +319,10 @@ struct vm_area_struct;
>   #endif /* __ASSEMBLY__ */
>   #include <asm/slice.h>
>   
> +#if 1 /* XXX: pmac?  dynamic discovery? */
> +#define ARCH_ZONE_DMA_BITS 30
> +#else
>   #define ARCH_ZONE_DMA_BITS 31
> +#endif
>   
>   #endif /* _ASM_POWERPC_PAGE_H */
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index cba29131bccc..2540d3b2588c 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -248,7 +248,8 @@ void __init paging_init(void)
>   	       (long int)((top_of_ram - total_ram) >> 20));
>   
>   #ifdef CONFIG_ZONE_DMA
> -	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn, 0x7fffffffUL >> PAGE_SHIFT);
> +	max_zone_pfns[ZONE_DMA]	= min(max_low_pfn,
> +			((1UL << ARCH_ZONE_DMA_BITS) - 1) >> PAGE_SHIFT);
>   #endif
>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>   #ifdef CONFIG_HIGHMEM
> 

This trial patch failed.

Larry

