Return-Path: <linuxppc-dev+bounces-1847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F56799527A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 16:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNJvK2j26z2yYk;
	Wed,  9 Oct 2024 01:54:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728399260;
	cv=none; b=HUjGnw/XhMXeFstXB9dr89FEtDscr1akYfMQnJ9ayeF7BP3rM+8PFrs9F52OoBR8H3K4pmx7MA0S/hB3Zg7eqWuMmB1gBUt669W9oyMaeIyyMnASVt5lGFamtMbLthRffZ1pKYzMJDihc89vuvD+4T4mCSQCfD8BoLVpITqXVirSrNIqJjDZGrzTkYZtsf75EEBgPL/nagJSQUuja8ZQ96cvBgesgl6U2HyAcRd5nlecswy0Q43Xg/MG36Ocdx0tE6lLdrJO4DeIGb+bvD5BTNWSDzR1YeHwutsAXSd3oNoV8SLB4WnyE7fX8Z5nEMbiYSbQ/X5Zngjlj375YGJpqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728399260; c=relaxed/relaxed;
	bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5WT1zyECWQ9MqrAaLojf6YV/HOnJ/TCHO3HZohWf5wvW9c1Fc+6+b/zJXaRGcq8nhXzuYLpqr8T/BMRSKZLfLEwq+VLNKeN+RWAegvu99OKAWbfVSI5Ib9iDMFKVWNzXP7MVVdjAZHkr2w7LvlnZnpga+2p5TF5bJlXG8+y4VjARkO7KlGaQHR81fwosD6jrhblRXBOjtMvop42mKmynxSmW5XWXuEf+LKRVszEL8+oVpwvfPeYBK2cX8KdridreMqUSsGZJChW67mkVnXdXy0hHZ69VzsYQEXRXWQjNG4v/cyzWtyGJnPiqFia3dOUzvaFeD0GFQWQkPGGAc/aQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ESlNivr8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ESlNivr8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=richard.henderson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNJvG5KWfz2yTH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 01:54:16 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4267669b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Oct 2024 07:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728399254; x=1729004054; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=ESlNivr83IhTW9B20HlkY525OEiCE73TqJ0yW4sHSQmZTKvTYxsN3XmGArqVUg9UOY
         x1L6JOcYYFFmfB1wCsjB6tll8Vfam4UAI0P6NDPc7KlbCcvn07mlvIx/iw+9q4yDgNvT
         SnbC/RrsL1jxcowdxuUX81uPBrfv3Tm9qT31T9bJrmhNh7gKWe+hZTB/984RBDpC2nwe
         ulGUnb5U57MrT8RVXDosenEYHWQ2/vYE++jbts4XB+UWUA80i9dK3reCLtXyGmr3vVWn
         295gpImuQ4Cr5o/r14GIjBdXcE+N4i0PvtFx+8Gk7ZDsosM7XoqDSmiFw4bTB+FjNuDn
         qQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399254; x=1729004054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=miWeDK6Om0sMLqCSX3jah1iY0KTelxG9w9Ke0SI4M4M5tbWjaUEFJ/V117OCP6ZByp
         5dCOHPrzY3KZHCg8Ma2Lz5dQeD1cIFqCRBQ7SDPQCewZTGG0O8qlu1wyBI4UaLV1h511
         P5zR7rlBofYqJm6iBau51O7Jk56q44LeL8a0z0gXgqEsoNqaRCbZduykIuAXj9dPfPgx
         1Iimsjo+B7jdbQbgn+vyDBSRpfWdUjGN4lSzmYtlW7RO6S4z1cajqw+Pr1UcUeHQjmhX
         5W9JSeRn86L2MomDy940CtQVybtIF9DukagLOS5C3G/4Ttj6wRfYpYEBrd2VaphtWXN0
         a+xg==
X-Forwarded-Encrypted: i=1; AJvYcCXbyCfjoMzQIFESaVUUw7dqB/C/0x5LRRC5dYPZHpQNbDsWdnlMDo9any+POqLnQH9pf57Jj4OUU7T3qds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwxF3g92fgRcuVR5Lzq6Vul4rr7oApmb10ky5wS0JIxIhPBpepv
	4cxNsVoCyG3WOiAYEJGWhPbk1jT7r7Z/U+v6SmnCixC9QrLISjANMCnwOPST5Cc=
X-Google-Smtp-Source: AGHT+IEE7e5dtXU6pMg21/0OJnrotv0zSN5hz6Qh4qER1MpIu7AV7t7dgpJ2YGuT0VFYFJ+iVS/TPg==
X-Received: by 2002:a05:6a21:4581:b0:1d2:eaea:39d7 with SMTP id adf61e73a8af0-1d8a193d1c4mr595970637.9.1728399253860;
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd5006sm6207044b3a.77.2024.10.08.07.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Message-ID: <5fe42a14-5070-43f7-8333-ed37c29c947f@linaro.org>
Date: Tue, 8 Oct 2024 07:54:10 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] alpha: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-7-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241008075023.3052370-7-jvetter@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/8/24 00:50, Julian Vetter wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v8:
> - Mask the argument with 0xff because now it's an int and not a u8
>    anymore


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> ---
>   arch/alpha/include/asm/io.h | 6 ++----
>   arch/alpha/kernel/io.c      | 4 ++--
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index b191d87f89c4..e7d52c8159b0 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -591,13 +591,11 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
>   /*
>    * String version of IO memory access ops:
>    */
> -extern void memcpy_fromio(void *, const volatile void __iomem *, long);
> -extern void memcpy_toio(volatile void __iomem *, const void *, long);
>   extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
>   
> -static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
> +static inline void memset_io(volatile void __iomem *dst, int c, size_t count)
>   {
> -	_memset_c_io(addr, 0x0101010101010101UL * c, len);
> +	_memset_c_io(dst, 0x0101010101010101UL * (c & 0xff), count);
>   }
>   
>   #define __HAVE_ARCH_MEMSETW_IO
> diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
> index c28035d6d1e6..69c06f1b158d 100644
> --- a/arch/alpha/kernel/io.c
> +++ b/arch/alpha/kernel/io.c
> @@ -481,7 +481,7 @@ EXPORT_SYMBOL(outsl);
>    * Copy data from IO memory space to "real" memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
> +void memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */
> @@ -535,7 +535,7 @@ EXPORT_SYMBOL(memcpy_fromio);
>    * Copy data from "real" memory space to IO memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_toio(volatile void __iomem *to, const void *from, long count)
> +void memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */


