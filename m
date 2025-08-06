Return-Path: <linuxppc-dev+bounces-10692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02235B1C705
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 15:50:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxsB31hfmz30W5;
	Wed,  6 Aug 2025 23:50:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754488219;
	cv=none; b=I9vyafJMesx3hMOVrGKWfLaTLq3spZztFbffZ0ZlFKenTr2YvHi+RMaUpb4Vh0xnFjAAOy49dG8jGI3YJuVH2Ni7RbvsAw+wi7C9//aoa/Lyow8X1JoZchD22s8sGb3t+i7Ck99cSIvgHQ/rwTKRZLzLlepcc34kQdR08cyMuYPjAdA8M6RoH0bK0lSHpDeiAv1K2g7OGmRa6YccvFbTeB1eWWwyoQr1qvkdyXLJXs8uTTMS4SNDxQZj148hn4LHUcrjBE/ydpBac9xsgsZ+9BvssNKPnOZH8apjOOHvGfkjN7aOe3VF0NwB8WxVqjAPhOhw+xw9c+7YJqHsgicEew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754488219; c=relaxed/relaxed;
	bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIdbanMaw4MsDzQfSiAAfGkbb5xExZc1UVGiKX9WcciGQhfqwsJrYUo0rXfwYUii80kfDEpnYetJIYrAucTVebfkCiAracxO4ckETLNsCzgXnLMorGSogRncnWb7rLCFArdPFTMIosR9IghrUBwSppbDss0dsa8cBV1/AdjXs7fwl1q5Tu7cdt91TjrAr5iwolXnHlc0nHCkyYgp58qeS56Fdyv1jZ1FdL68GBVpgWQhbWU0N7soUdXO1Ie/R7VpCwLFXRTsWymPUDmnAiFSm0ETi3ROg7IZZkVuhsh63tKSY6Kphbq1Kn8ld80RM/Ey8b8X7O4/ZemneF0yZUrXiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cSQr5jlt; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cSQr5jlt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxsB16vJwz2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 23:50:16 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-332211b014dso9774131fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 06:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754488210; x=1755093010; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=cSQr5jltBvzxOUWiC6Ci4mcpGpXHC+SBHdKe4FnwFPjCHqnqX+MrfvBE16iV75njV7
         h0QLM8anbTBihLFa2mVVaQwHIVlhQCuxISL3qClbwPgwPMDGrZLH0RMqbNDmfoCbA7WI
         syYT7JcqT2zUzVenRWynJBo0hN03r0pOiGkMEhxO31roUa4/xZN0DnVzPQWcRXYQPb8Z
         wr+VzXSOU0gzsNmW5iBOhvAat9qyBmtPe+16+RGVxCoecmUNea30jlEP3JOiEDoXJrXv
         3zYBqLJa2t9IQdqGOGz6XXaXRJSQ/FFjZ5AbHVgdkaZ8hy7QgnrdgvDUSr1edJLsS3u3
         /ZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754488210; x=1755093010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDOCIZR6gSwH1CTXkpwwYCK6HLPl+F0ICSkVzqPXsh0=;
        b=v+WMvodP3GKrt6Q6mLq9JK7RAj7Ktgl8IDJa2u5JETfJ5iXtc5+yRx/z0wD6Ph0ZF/
         0cz8zaPm29BDQRMDQ+U/TTOFMnXJ2p0zJrlD3eoN+Mrf27rFbKkITnTRtwy+KJC8rFuF
         r337UgjBuCm0UlXzjtVyV7MCIzUlu/EgCwTB+dwJrH1cQey4JeJMULYNhH5m6UoE4XxW
         joVdkPVLSRzjazZ4zIxYFnlpaKch8qosJQ2BUpH08hMosI5SPviSM8NIKf5100AQB12d
         q/MOuhR1WawG9rAkZ+Sq/YPp2mmBnfm+3UFeDCQCjxII9JDOse2wKNlfCC4WX9U/jVN+
         qcxA==
X-Forwarded-Encrypted: i=1; AJvYcCVTc4OAK/tCCWM23jUBebEQka0BpwDUl921ZsGaadL5po2puRJ8MRuCc+0fFnJXFZuFUmzQ6xUDoT8Q0+E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNoeSWOsF8A0Zy5c9usSbVIyayEvVXWWQkBP/q8Om2bd5TbQYa
	voZbvpIaKsUENTV/1qJ2dYMOiw+kvw++AnOWmnahE43tzkl6UECSya+y
X-Gm-Gg: ASbGncteZVjBDoGHupzsrKyWUY/i2K/VETOHp2i1pAgqVhy9TeSoioto5m8iyBJXqyn
	Aqx+GbNzJ/1+PDZMXfgvhyjf/L4iLPbj/I63qMXGe/wKUQmukmvVsXMtidDspKZ73jadCp5Y1l8
	40wnEGy41knr4Lg0eiGuMv6LVXpqqw754FMuPHBFTrwG9G3mKcorZ05RGMvvIL9jaszTeIz8PUa
	aPvjGRRYR8uRlKgIYC7tlbjc9Fm8SB6MKn7ZpiD6j6oA5/kJflfNWquTJIZrzdAsWggNHZXOqyW
	1nizAezlJy9eixJt5eccYJGunKrNZYJhC0sPsn+muTbrrKnuY4Wwqbbk5gJQ852GU6z1Zt/HlLa
	0ndp2VN/jLKrK91HfQbAObsn1+BF7094uBLRE2UY4vMuO5Tuikg==
X-Google-Smtp-Source: AGHT+IEsyaC4e5C8bAXA34DF26BCI2kUm+pbeFPiYngQRQqOaMh9b3JgYLiHo/Ul9EDDlBD4plM96A==
X-Received: by 2002:a05:6512:3b1f:b0:550:ecdf:a7f9 with SMTP id 2adb3069b0e04-55caf35fc1amr414988e87.10.1754488210277;
        Wed, 06 Aug 2025 06:50:10 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88cabbd8sm2356761e87.149.2025.08.06.06.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:50:09 -0700 (PDT)
Message-ID: <ece4aab9-a195-47c9-b370-c84f5dcc0098@gmail.com>
Date: Wed, 6 Aug 2025 15:49:22 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com,
 glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-7-snovitoll@gmail.com>
 <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
 <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxhs+Rt9-q6tKi3Kvu7HpZ2VgZAc4XEXZ4MEB60UbFjDKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/6/25 6:35 AM, Sabyrzhan Tasbolatov wrote:
> On Tue, Aug 5, 2025 at 10:19 PM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
>>>
>>> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
>>> index 9083bfdb773..8d14c8fc2cd 100644
>>> --- a/arch/um/Kconfig
>>> +++ b/arch/um/Kconfig
>>> @@ -5,6 +5,7 @@ menu "UML-specific options"
>>>  config UML
>>>       bool
>>>       default y
>>> +     select ARCH_DEFER_KASAN
>>
>> select ARCH_DEFER_KASAN if STATIC_LINK
> 
> As pointed out in commit 5b301409e8bc("UML: add support for KASAN
> under x86_64"),
> 
> : Also note that, while UML supports both KASAN in inline mode
> (CONFIG_KASAN_INLINE)
> : and static linking (CONFIG_STATIC_LINK), it does not support both at
> the same time.
> 
> I've tested that for UML,
> ARCH_DEFER_KASAN works if STATIC_LINK && KASAN_OUTLINE
> ARCH_DEFER_KASAN works if KASAN_INLINE && !STATIC_LINK
> 
> ARCH_DEFER_KASAN if STATIC_LINK, and KASAN_INLINE=y by default from defconfig
> crashes with SEGFAULT here (I didn't understand what it is, I think
> the main() constructors
> is not prepared in UML):
> 
>  ► 0       0x609d6f87 strlen+43
>    1       0x60a20db0 _dl_new_object+48
>    2       0x60a24627 _dl_non_dynamic_init+103
>    3       0x60a25f9a __libc_init_first+42
>    4       0x609eb6b2 __libc_start_main_impl+2434
>    5       0x6004a025 _start+37
> 

No surprise here, kasan_arch_is_ready() or ARCH_DEFER_KASAN doesn't work with KASAN_INLINE=y
This configuration combination (STATIC_LINK + KASAN_INLINE) wasn't possible before:

#ifndef kasan_arch_is_ready
static inline bool kasan_arch_is_ready(void)   { return true; }
#elif !defined(CONFIG_KASAN_GENERIC) || !defined(CONFIG_KASAN_OUTLINE)
#error kasan_arch_is_ready only works in KASAN generic outline mode!
#endif



> Since this is the case only for UML, AFAIU, I don't think we want to change
> conditions in lib/Kconfig.kasan. Shall I leave UML Kconfig as it is? e.g.
> 
> select ARCH_DEFER_KASAN
> 

No, this should have if STATIC_LINK


