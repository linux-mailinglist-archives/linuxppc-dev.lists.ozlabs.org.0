Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C680468D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 22:28:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QXHJ0cK1zDrp4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 06:28:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::244; helo=mail-oi1-x244.google.com;
 envelope-from=larry.finger@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwfinger.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o3N5dXiK"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QXFT1MtjzDrhc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 06:26:36 +1000 (AEST)
Received: by mail-oi1-x244.google.com with SMTP id m206so2860026oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 13:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hu6UH6SAxMoZ+zdg3c2COyOtX79gFZR/VtwmhecH8dA=;
 b=o3N5dXiKLQ9PbDeRIB98rfVh15PxoVFa/1ufQzJRNpgABUqbXosiApy2K7CWnu2aFD
 lptSKRX1xOc2/Zt5x5tc1uypFmRuOfUjlR1XzP+CMxmQijfWhcAJWJ6hQZO/28zmqhMu
 ZZWs09so+lam17Oqi0ATZLBRk2R90J8lyxq5m2cKDJ6z0QdTrYTWgX2CG6kbO5VtTq/C
 HVVB4iWvAUoIhVRd1sRZmKBbAV4u+Gs+PblKIbCyDifVZ8qXaUf9fpXu+R7YQS4sOVgV
 SYMWYwzNgoKTsz+wYF2ceul3EWIC8IquOZzyX5r46poJ2lIi8oFLO9yWjpaoOZfsyK6p
 aZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hu6UH6SAxMoZ+zdg3c2COyOtX79gFZR/VtwmhecH8dA=;
 b=lRi2ZNTt+tQwQWEEUiEQrmy9Etd5a84vpTqbRea7eU6p39hkMjIuU0U94R1hhEJba3
 NrNi7O0QuyB8goPr0XAJvmKeTbZqt3hyNCPwP1jLw4pekxDs4CteiJeNGcUbmpN0sLX4
 CroHoFzhNHVnGNdq4gYgE1waTrdayjI6IC06v738L4waXpeypMyIKZYycWiNOan8PbqL
 7VBfprwgLRcxvixZvKa53ydJzAZZj2pnJBZltDySAHbQnj0gZJxHovaaWkTQusBx/9v5
 uZHd5OVPwgvrmsUY7H47eRNzGytsf5XSMgIZ3V3PfIrYLah3ccJuuGVQEcyChAKxWcSQ
 2eiA==
X-Gm-Message-State: APjAAAWDpTEew7j+eQOAizIZeFaz71webABScc46Lr2NqRGDNWrofmzZ
 ghOav3rekU8JbuPTWqSn9ns=
X-Google-Smtp-Source: APXvYqypZyd7CSFEGroYYb1iKjlsO3SWJUCtaP6WveZciRKaw0cfbgSxgbaQDgwzxZnfKZpsek1gNw==
X-Received: by 2002:aca:3d54:: with SMTP id k81mr2811911oia.111.1560543992838; 
 Fri, 14 Jun 2019 13:26:32 -0700 (PDT)
Received: from [192.168.1.112] (cpe-24-31-245-230.kc.res.rr.com.
 [24.31.245.230])
 by smtp.gmail.com with ESMTPSA id q2sm1532873oia.45.2019.06.14.13.26.31
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 13:26:32 -0700 (PDT)
Subject: Re: [PATCH] powerpc: enable a 30-bit ZONE_DMA for 32-bit pmac
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Mathieu Malaterre <malat@debian.org>
References: <20190613082446.18685-1-hch@lst.de>
 <CA+7wUswMtpVCoX0H5eF=GUY8jWDAEWa9Z223tKiKHiL69hhHtQ@mail.gmail.com>
 <20190614191532.GC27145@darkstar.musicnaut.iki.fi>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <d508cc9c-435f-4108-17ac-6db74640514c@lwfinger.net>
Date: Fri, 14 Jun 2019 15:26:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614191532.GC27145@darkstar.musicnaut.iki.fi>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/14/19 2:15 PM, Aaro Koskinen wrote:
> Hi,
> 
> On Fri, Jun 14, 2019 at 09:24:16AM +0200, Mathieu Malaterre wrote:
>> On Thu, Jun 13, 2019 at 10:27 AM Christoph Hellwig <hch@lst.de> wrote:
>>> With the strict dma mask checking introduced with the switch to
>>> the generic DMA direct code common wifi chips on 32-bit powerbooks
>>> stopped working.  Add a 30-bit ZONE_DMA to the 32-bit pmac builds
>>> to allow them to reliably allocate dma coherent memory.
>>>
>>> Fixes: 65a21b71f948 ("powerpc/dma: remove dma_nommu_dma_supported")
>>> Reported-by: Aaro Koskinen <aaro.koskinen@iki.fi>
>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>> ---
>>>   arch/powerpc/include/asm/page.h         | 7 +++++++
>>>   arch/powerpc/mm/mem.c                   | 3 ++-
>>>   arch/powerpc/platforms/powermac/Kconfig | 1 +
>>>   3 files changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/page.h b/arch/powerpc/include/asm/page.h
>>> index b8286a2013b4..0d52f57fca04 100644
>>> --- a/arch/powerpc/include/asm/page.h
>>> +++ b/arch/powerpc/include/asm/page.h
>>> @@ -319,6 +319,13 @@ struct vm_area_struct;
>>>   #endif /* __ASSEMBLY__ */
>>>   #include <asm/slice.h>
>>>
>>> +/*
>>> + * Allow 30-bit DMA for very limited Broadcom wifi chips on many powerbooks.
>>
>> nit: would it be possible to mention explicit reference to b43-legacy.
>> Using b43 on my macmini g4 never showed those symptoms (using
>> 5.2.0-rc2+)
> 
> According to Wikipedia Mac mini G4 is limited to 1 GB RAM, so that's
> why you don't see the issue.

He wouldn't see it with b43. Those cards have 32-bit DMA.

Larry


