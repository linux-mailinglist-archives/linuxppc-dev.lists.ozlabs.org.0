Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A96537D38
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 21:27:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KbKJ1H1lzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 05:27:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::342; helo=mail-ot1-x342.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tfehlKGs"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KbHh26xjzDqlX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 05:26:24 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id 107so3048927otj.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 12:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=//bEoSLNLLHE97BPxRCj2Ov+nlOv5NirkYFgfSUW6IE=;
 b=tfehlKGsfTi1m7hhM0Xjrl6wu/1FJz5YNvaZjnKEboFeHFs3iFSgzJkRWdCSVxUQwK
 VwB5xDNIKJGAxswP++nk/enpOXH6PlOVd/C3I9AfnISZHKR6GWlgLskNPRU1h/bNpnqo
 2JnW7XY7REpC1hYxXeiCTaUPNwn92eJoeTNDKX6EQv0oHvsnJL2QZ0+lZ/t3sGaYOI+/
 7w6bJjmTKe2MNEgBbHPFvZRtjdzrZBQRFh/HYvKkjCyoWw075tiXM0Qx1QVkY2amPY+w
 R/vtWSsTe6/xnFN3nup4WWtmib3FF7B5uNi4TEwcEZ6t+gf7OGkesQQYLrz4/vmTG3kT
 /pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=//bEoSLNLLHE97BPxRCj2Ov+nlOv5NirkYFgfSUW6IE=;
 b=VAOI6nKVetACglDYwtNHXmP8E4HnJ6b1+rQ5hBwD1tZxcy9BGX5xa1yGHTN1oooXWN
 mMpWOBq5KvhP0BERHVRqiQfBnAa540yDcGvUgrxbNEaZxYfuGI1UX7HlHomVd9mtAgzB
 /Ah7KNY6iw20k487MaeYtXU1ogwB6cXJy9jvop+EaUY/9C2EFbnc0wyyKPEeXzB80/l3
 ZRrNW9MDWiGLcaxWvHd/tUh7fvVVz8H75frmofasARP1K0ht2PoetqJJARw949n8TuVW
 J37uShSNYI9wfMqB5chuW5Z3ykY+wLBrCxhb2AYPen46U15sPnn0boGuWo0kTccyT/ZV
 IJyw==
X-Gm-Message-State: APjAAAWY2IxnVssKnMSIFA2cj4q7sXM5hMJMKY2K0hQIYljAJcbXz9bJ
 2yl1fucTP4fmkS4y6xNnXkM=
X-Google-Smtp-Source: APXvYqwL7j7Huo/G41SF8PlkxfC7vQ8YdiJ33WC5yoMAWg0YVvY404CgtKWoG3ue/NITZ97pzuvy4w==
X-Received: by 2002:a05:6830:1303:: with SMTP id
 p3mr16235060otq.267.1559849182214; 
 Thu, 06 Jun 2019 12:26:22 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id b12sm922890otk.59.2019.06.06.12.26.20
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 12:26:21 -0700 (PDT)
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
Message-ID: <59528af0-f250-f5e7-50c0-0a163ccfa59c@lwfinger.net>
Date: Thu, 6 Jun 2019 14:26:19 -0500
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

I am generating a test kernel with this patch.

FYI, the "free" command on my machine shows 1.5+ G of memory. That likely means 
I have 2G installed.

I have tested a patched kernel in which b43legacy falls back to a 31-bit DMA 
mask when the 32-bit one failed. That worked, but would likely kill the x86 
version. Let me know if think a fix in the driver rather than the kernel would 
be better. I still need to understand why the same setup works in b43 and fails 
in b43legacy. :(

Larry
