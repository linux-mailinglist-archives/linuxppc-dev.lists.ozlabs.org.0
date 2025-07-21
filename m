Return-Path: <linuxppc-dev+bounces-10346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECD0B0CD73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 01:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmG8C1Sv0z305v;
	Tue, 22 Jul 2025 09:00:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753138827;
	cv=none; b=ANxRJoEBCm26yK1I2KIk7HA3zODtfJpuZ8F03HySI9+wJfexiY1L+ae2p/wuNLaKPk4jXkkNTb+8nwinhLIAYzRtpD1P9aUW2l2GWW3/OT8wQc3hnxpr+oI2mO2I2XCuot/1Bjdy8Yg3Rr/oRpyEvytJ1mDb0phwmfpPfnTPW73owkQcKJ3gMdgUAV0V7R/f9k2FUa3z5w0syu/10Jh3cvexx7zk9wXXDLeGw8cDZnMjiDEGvFiED8kbsq27jqzoc5iERJ2+8amJvweL8VyAhzYTSVeg8VhE1RU5jiOmYiOqiyi1n3kwgtwfck3VVBXUKXyULHYK+/wDBtU/BHwcgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753138827; c=relaxed/relaxed;
	bh=I50g8CBYTAJgx5jeL63ocp0XmC4ojzYZYl9cwyXAxL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDfvvmcSUGednYI7E3yWKV9QWiyq/T3cZjlTaRcnHzynFHJJ5SUMrxAfVjVbf7P0h2REIuGpcINPGPAHkKta47Ly8LN9BJ1K7tuwR6JTRskksSlqOvvlEtlsXLxd6KypG1pJeQppBoAN25L7axHuXBEfm08UBXEgFK79w0dxfxlHTx1FnHqpyPxB/ypbtoIfiV3X39+kzbCXS031lw+eGeXeRbno9Qax9Se4hpmiSFK3BqbmBN/GoQTltzyYS9V1MZfLShuDnaDn3akGDzxr67+3RS8C9Mr3lesg9ZSn5GlWdvZ6wXCYZ0fawrbSaf/q4NL+phXmyhXcN1pBj3Uqzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G7kGTS6Z; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G7kGTS6Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmG8B1nMtz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 09:00:26 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae3ead39d72so86729066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 16:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138823; x=1753743623; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I50g8CBYTAJgx5jeL63ocp0XmC4ojzYZYl9cwyXAxL0=;
        b=G7kGTS6ZIvJ16xrKPGo1wWf0CDRAhXAyo70Zt9fSXP+WYxn/PFjPLnZIeKpP+uxiGr
         opcZ2/8NhTUAEjFl9bn3rxqzSWAtPL+45eXs8jhtETflrACpPAxS6qXtI+5cUK+POwLQ
         +p3NA7VFDDXZuBXv/6DFVMul16rxn/4fMoZOJ2XSdJ7LqQ8Q6AoqfgEzaRLE0czYk3l4
         xGf6yRmDP9I2+hOnwAOd/CVhDip7h3+zNhXGgkTO5zVbhsh2yUZbkoaVCZ1Y/0SeUBjf
         9Wu7TCNFPfq5OIHAptlFHmpfbUrnCZDufXsXrH9r17ep5XECoE3cIJ0bj+UXYJaYi6xV
         +9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138823; x=1753743623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I50g8CBYTAJgx5jeL63ocp0XmC4ojzYZYl9cwyXAxL0=;
        b=ARTpQeDFPQ7b6eK7JO4B6SssQVJMxsy7IbwSfjTG0A/nG1CHJaSN5ByzqEj3IQjh1X
         nlmOnd1/NCmOk/s1GE6vpj9UkxobK8tON24h1tfhMkjB07YUm+3oNty4An0vm/S4BRhq
         M5aEMDT1X5D6TE6twhqTVAMDVSsufnyFVQFIG00PEN6V9u51bOmK9G3LrEeCVng8P1dj
         JYL6YG6zctjhly8J1oJL5QVx/qptjywy1V2aSxpeLyQhwbxGPwQQUs2jWvf+e4bq0lE0
         aRaczpVDRstQeWb7V4B/bRKaGFJ+grlK8ZW4w3EDRJc0X6Q5GLZ9kQEoxeDPYAUQZqMq
         d7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwRDwcfqUubnUvtxFioRc7fePdSNWE3sBSstjr3O5Su0IAah6yvwK+stnT2+BFkPc30ioxvinmRIaRaD4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1hehMMZWEoyGdcfIs/E8bgzrQJKiO26m55vzAq3C2ZhUMv8ly
	k2G0N3cTp2stlcH7RpPQSZmo1IJVtwZnNbFlAQMVDlUtKkUUDcrxxYd0
X-Gm-Gg: ASbGncv/mzAf18aHqimmPLaDQJG8PUc+VkIztbZykC7w07MzAfkKzT8unIPIwFKCKPe
	kpa3i7z9xqThU38hN+d9x8w75X4dv9BLfRXwGGnNrqWOlu04RA5/khsbZSpC0lmAM2N8OM+KIDd
	3eX04Sv+jWB4Mcd3VdUEK5W8LZ5OpHZn5K4scyp2y8OtYBWDOR6dIVFgcnG5He1xUlBY4SPx7Uq
	TR6o4JZQ3S+IvgT8HrLiT7EIXxwa2s2dhJn/peoPHsG4LmNYgyUdBIPAJqfuUq9gfgd2atZ8MNz
	pSfgRJWaS3xOMwQ/dRz57pmR88DJd46+5exrNgwUYEN/yxHq/T0GfwGoulYHA8A+1FxUCuYIwK0
	wTkbBiODO8SlnC18jo+fEfoYlx3cv7u+ZW/ZZnqKw9qSayeR82vPXnzheBHjB/W86dUZn
X-Google-Smtp-Source: AGHT+IGYzqj0kH8wn480kr3FBbj99pmKP5/Eu4pwQHjyBRT16VOhkTt/2Q3FevKH1201wdR/kcGe2g==
X-Received: by 2002:a17:907:db15:b0:ad8:882e:38a with SMTP id a640c23a62f3a-ae9c9b8e572mr853708966b.14.1753138823178;
        Mon, 21 Jul 2025 16:00:23 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d8357sm753164466b.52.2025.07.21.16.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:22 -0700 (PDT)
Message-ID: <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
Date: Tue, 22 Jul 2025 01:00:03 +0200
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
Subject: Re: [PATCH v3 08/12] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-9-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-9-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> UserMode Linux needs deferred KASAN initialization as it has a custom
> kasan_arch_is_ready() implementation that tracks shadow memory readiness
> via the kasan_um_is_ready flag.
> 
> Select ARCH_DEFER_KASAN to enable the unified static key mechanism
> for runtime KASAN control. Call kasan_init_generic() which handles
> Generic KASAN initialization and enables the static key.
> 
> Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
> interface.
> 
> Note that kasan_init_generic has __init macro, which is called by
> kasan_init() which is not marked with __init in arch/um code.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
> ---
>  arch/um/Kconfig             | 1 +
>  arch/um/include/asm/kasan.h | 5 -----
>  arch/um/kernel/mem.c        | 4 ++--
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index f08e8a7fac9..fd6d78bba52 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -8,6 +8,7 @@ config UML
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_HAS_CPU_FINALIZE_INIT
>  	select ARCH_HAS_FORTIFY_SOURCE
> +	select ARCH_DEFER_KASAN
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_STRNCPY_FROM_USER
> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> index f97bb1f7b85..81bcdc0f962 100644
> --- a/arch/um/include/asm/kasan.h
> +++ b/arch/um/include/asm/kasan.h
> @@ -24,11 +24,6 @@
>  
>  #ifdef CONFIG_KASAN
>  void kasan_init(void);
> -extern int kasan_um_is_ready;
> -
> -#ifdef CONFIG_STATIC_LINK
> -#define kasan_arch_is_ready() (kasan_um_is_ready)
> -#endif
>  #else
>  static inline void kasan_init(void) { }
>  #endif /* CONFIG_KASAN */
> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
> index 76bec7de81b..058cb70e330 100644
> --- a/arch/um/kernel/mem.c
> +++ b/arch/um/kernel/mem.c
> @@ -21,9 +21,9 @@
>  #include <os.h>
>  #include <um_malloc.h>
>  #include <linux/sched/task.h>
> +#include <linux/kasan.h>
>  
>  #ifdef CONFIG_KASAN
> -int kasan_um_is_ready;
>  void kasan_init(void)
>  {
>  	/*
> @@ -32,7 +32,7 @@ void kasan_init(void)
>  	 */
>  	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
>  	init_task.kasan_depth = 0;
> -	kasan_um_is_ready = true;
> +	kasan_init_generic();

I think this runs before jump_label_init(), and static keys shouldn't be switched before that.>  }
>  
>  static void (*kasan_init_ptr)(void)


