Return-Path: <linuxppc-dev+bounces-10344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF8B0CD6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 01:00:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmG7p5vgmz30gC;
	Tue, 22 Jul 2025 09:00:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753138806;
	cv=none; b=bT8bALpUWpNlZQDiOF3UltAhvm4uVi+Dq5x2cwWqaWxCn47KFdjZElf1jEacZjXupHnPnRi9D3DFoxI+6BOn0eY8uI1OMAcQIwR0G7miD8WAhZVrm0BqgQYNA8Fpy7HsMc5yP/m6vJrHp5n2Ahsh+nnfEgsPXLVrw57AMuXXkbmr/04LodZiXSlKmmFYN4FGXkBF1iX3VyWTIZk92l+XMN+YYh3bGu0o/c6PQq5ox68p55/BmKqpJi77TJl2TN80B4TVGoq9ag67uxJ39/teWsjZK7u8R7QUwcpyL8JXG3M0VXXaBTpglR2fVT8JaiyZwPAvdEe4LYY2JaHxL4FKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753138806; c=relaxed/relaxed;
	bh=/MErh+IJZfEbaFHl36LqhlLVHvlXTKmbu8riveWqw+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JS2/9eu9xrjGwHo1DsfjlvnhF6eAx4gxu0TEvw5R8iV2fjln47xUeHRJGoxd1KaJgwTooOeS9BVbESfc8k4DL3Ja+QNR1MPj1sRZooSNaiyAK6UsVeZavKmBttoABsonotenLdFYIGXmUvfoMVuxh1xpKV9aR95NAZuSMfCg3aAilCu6jrade+tFkQvCpA1tfmi7ARdOgTyrDXuKCjSiwZDm3e7ZILK7s2HGxtK3qmYlORdBp/4SWVBCLeDqb4COdugRtNciPnCuAHd2/xQtkfEjlcS2tZThqK20hZv157GbXgRe9HUSHTg6gL3t00u9l+Sn3ntdRbv1+bZB2H7knA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DyKFAeke; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DyKFAeke;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmG7n6MQCz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 09:00:05 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ae35eb87810so98059366b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 16:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753138803; x=1753743603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/MErh+IJZfEbaFHl36LqhlLVHvlXTKmbu8riveWqw+Q=;
        b=DyKFAeke6iDriNM/qwuID3OD/Uae7Y07K47NVX8fPDqQguYIAJfMZFq1HYnXRLxOSL
         8COhOHNL9DVaCv2KEAvJdVi+7csoBYWRzze+W8QRH/+3lIpbzCOtcScCXW/XI0Kw/h1q
         BEZNjBP5uvnNeAXVr/kyyrH2TrwSf21kzJiVcG/Ni0pbPRsNN97ZoeDFD6tNbBBin5DD
         oxALcgJtaWfaNRv1Jb22IXKykcpKLbiG9bu3aM6QmlEsl/Y9AXC8aRNphOgeHRW7D3fQ
         leXGnmGnIvNkD5rYrZly1l/e+AebMZa8KRmB9hILlyNJnj90g6e8GR34gNcrV4HWj81Z
         EDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753138803; x=1753743603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MErh+IJZfEbaFHl36LqhlLVHvlXTKmbu8riveWqw+Q=;
        b=HL/dcD5U9hWYymmM2cYXUHthlhDJ0aNHZviy/wWfjoSpZJS7iLHfHp0XDF8JJBUylX
         ga3TkzRmmno9ZXpjzxOaceS5KZlu7nUeNd1l523PF2CQnryile0g3HwXMRQ5EQILBcNh
         mgnMw/LQI60xrYFw6sx8fcb0OJMjevqMyWVnku5bdeze7R+MkG4GRE4Pj2HcXo+gwIGg
         lZqnGYtNTKD9KUWaQrWOMblNQJ6JVvYBCxnGy1HxCdKNPe/vVhA1YOVVTAnZDPK+iiA8
         TmkzXqF8qLh8Ksmb5bMYhHw/GfbyWI2yF+XlNsVXX/xZmsiDayK0q9JYWUf6I0svcd9O
         JiDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPhee/kaSzIwpuGm8gM4AOKTq0dV4scAxmU4Do3wQxjL+e6ip6Oc+cyPFw099JYWfBU29SrdRNuqzxyBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySB8exKlaBs/XXQY7MfeA/3jukRABen8e9odiA12ziD3RdQnvc
	9inhizTQJAawpj13FULpDwr167Rnh7H57RAsQxs6NBgFQKMWERV3XJuF
X-Gm-Gg: ASbGncu9JV+kfnLZHly/78+yZJzliE6G3jToBUyjsfoWK99wpOkQfYeg/HdQ6cTH8Ke
	ksM6B06+9J94N7CddMdK2F5usD9EXFdFX7MuHqJTahMi7OctsY0IhPWA8IYJe/4VIhhsEfIrGae
	D9WdlBPL8dWoTmQbh5J8xs0sllmlF4j2B/ivf2V5qq9JH6nfdvh/0+mFfwJSVHrfZup6HiSNGZh
	IAS2xvGAFctW47bSY/ZjvA6jfxVVl5qym5gQpE9FYlP3bp/o6QMV4+QHeIK84Q2kKSE/NQJOv73
	kFJIwP71+uKfYXD4QWQo3cjN9xmRSeBi0D6rKgvlwnH0khgD3nuYf0vlqTBBS12gxlouuw7kDNm
	6wb13vUbdQhEPhZhniJle8PO5Pxphk9vcGLCuXq8yjtFVfXpB/Uj9cxthkUyGMravd2oA
X-Google-Smtp-Source: AGHT+IFhWRkAjq0kp3rYVJajv166B7T+5igJwYiG9mr5QC8ggMyhPPllogHKb3eusDQL2P7c9HNNmg==
X-Received: by 2002:a05:6402:3582:b0:612:b0d9:3969 with SMTP id 4fb4d7f45d1cf-612b0d93f03mr5896945a12.8.1753138802656;
        Mon, 21 Jul 2025 16:00:02 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-142-142.dynamic.sbb.rs. [94.189.142.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f543ddsm5962670a12.30.2025.07.21.16.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 16:00:01 -0700 (PDT)
Message-ID: <8f93322a-84c1-402b-b8d4-9c66a2b07b0b@gmail.com>
Date: Tue, 22 Jul 2025 00:59:41 +0200
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
Subject: Re: [PATCH v3 02/12] kasan: unify static kasan_flag_enabled across
 modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-3-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250717142732.292822-3-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
> Historically, the runtime static key kasan_flag_enabled existed only for
> CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> architecture-specific kasan_arch_is_ready() implementations or evaluated
> KASAN checks unconditionally, leading to code duplication.
> 
> This patch implements two-level approach:
> 
> 1. kasan_enabled() - controls if KASAN is enabled at all (compile-time)
> 2. kasan_shadow_initialized() - tracks shadow memory
>    initialization (runtime)
> 
> For architectures that select ARCH_DEFER_KASAN: kasan_shadow_initialized()
> uses a static key that gets enabled when shadow memory is ready.
> 
> For architectures that don't: kasan_shadow_initialized() returns
> IS_ENABLED(CONFIG_KASAN) since shadow is ready from the start.
> 
> This provides:
> - Consistent interface across all KASAN modes
> - Runtime control only where actually needed
> - Compile-time constants for optimal performance where possible
> - Clear separation between "KASAN configured" vs "shadow ready"
> 
> Also adds kasan_init_generic() function that enables the shadow flag and
> handles initialization for Generic mode, and updates SW_TAGS and HW_TAGS
> to use the unified kasan_shadow_enable() function.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v3:
> - Only architectures that need deferred KASAN get runtime overhead
> - Added kasan_shadow_initialized() for shadow memory readiness tracking
> - kasan_enabled() now provides compile-time check for KASAN configuration
> ---
>  include/linux/kasan-enabled.h | 34 ++++++++++++++++++++++++++--------
>  include/linux/kasan.h         |  6 ++++++
>  mm/kasan/common.c             |  9 +++++++++
>  mm/kasan/generic.c            | 11 +++++++++++
>  mm/kasan/hw_tags.c            |  9 +--------
>  mm/kasan/sw_tags.c            |  2 ++
>  6 files changed, 55 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
> index 6f612d69ea0..fa99dc58f95 100644
> --- a/include/linux/kasan-enabled.h
> +++ b/include/linux/kasan-enabled.h
> @@ -4,32 +4,50 @@
>  
>  #include <linux/static_key.h>
>  
> -#ifdef CONFIG_KASAN_HW_TAGS
> +/* Controls whether KASAN is enabled at all (compile-time check). */
> +static __always_inline bool kasan_enabled(void)
> +{
> +	return IS_ENABLED(CONFIG_KASAN);
> +}
>  
> +#ifdef CONFIG_ARCH_DEFER_KASAN
> +/*
> + * Global runtime flag for architectures that need deferred KASAN.
> + * Switched to 'true' by the appropriate kasan_init_*()
> + * once KASAN is fully initialized.
> + */
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>  
> -static __always_inline bool kasan_enabled(void)
> +static __always_inline bool kasan_shadow_initialized(void)
>  {
>  	return static_branch_likely(&kasan_flag_enabled);
>  }
>  
> -static inline bool kasan_hw_tags_enabled(void)
> +static inline void kasan_enable(void)
> +{
> +	static_branch_enable(&kasan_flag_enabled);
> +}
> +#else
> +/* For architectures that can enable KASAN early, use compile-time check. */
> +static __always_inline bool kasan_shadow_initialized(void)
>  {
>  	return kasan_enabled();
>  }
>  
> -#else /* CONFIG_KASAN_HW_TAGS */
> +/* No-op for architectures that don't need deferred KASAN. */
> +static inline void kasan_enable(void) {}
> +#endif /* CONFIG_ARCH_DEFER_KASAN */
>  
> -static inline bool kasan_enabled(void)
> +#ifdef CONFIG_KASAN_HW_TAGS
> +static inline bool kasan_hw_tags_enabled(void)
>  {
> -	return IS_ENABLED(CONFIG_KASAN);
> +	return kasan_enabled();
>  }
> -
> +#else
>  static inline bool kasan_hw_tags_enabled(void)
>  {
>  	return false;
>  }
> -
>  #endif /* CONFIG_KASAN_HW_TAGS */
>  
>  #endif /* LINUX_KASAN_ENABLED_H */
> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
> index 890011071f2..51a8293d1af 100644
> --- a/include/linux/kasan.h
> +++ b/include/linux/kasan.h
> @@ -543,6 +543,12 @@ void kasan_report_async(void);
>  
>  #endif /* CONFIG_KASAN_HW_TAGS */
>  
> +#ifdef CONFIG_KASAN_GENERIC
> +void __init kasan_init_generic(void);
> +#else
> +static inline void kasan_init_generic(void) { }
> +#endif
> +
>  #ifdef CONFIG_KASAN_SW_TAGS
>  void __init kasan_init_sw_tags(void);
>  #else
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index ed4873e18c7..c3a6446404d 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -32,6 +32,15 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +#ifdef CONFIG_ARCH_DEFER_KASAN
> +/*
> + * Definition of the unified static key declared in kasan-enabled.h.
> + * This provides consistent runtime enable/disable across KASAN modes.
> + */
> +DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> +EXPORT_SYMBOL(kasan_flag_enabled);
> +#endif
> +
>  struct slab *kasan_addr_to_slab(const void *addr)
>  {
>  	if (virt_addr_valid(addr))
> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index d54e89f8c3e..03b6d322ff6 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -36,6 +36,17 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +/*
> + * Initialize Generic KASAN and enable runtime checks.
> + * This should be called from arch kasan_init() once shadow memory is ready.
> + */
> +void __init kasan_init_generic(void)
> +{
> +	kasan_enable();
> +
> +	pr_info("KernelAddressSanitizer initialized (generic)\n");
> +}
> +
>  /*
>   * All functions below always inlined so compiler could
>   * perform better optimizations in each of __asan_loadX/__assn_storeX
> diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
> index 9a6927394b5..c8289a3feab 100644
> --- a/mm/kasan/hw_tags.c
> +++ b/mm/kasan/hw_tags.c
> @@ -45,13 +45,6 @@ static enum kasan_arg kasan_arg __ro_after_init;
>  static enum kasan_arg_mode kasan_arg_mode __ro_after_init;
>  static enum kasan_arg_vmalloc kasan_arg_vmalloc __initdata;
>  
> -/*
> - * Whether KASAN is enabled at all.
> - * The value remains false until KASAN is initialized by kasan_init_hw_tags().
> - */
> -DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> -EXPORT_SYMBOL(kasan_flag_enabled);
> -
>  /*
>   * Whether the selected mode is synchronous, asynchronous, or asymmetric.
>   * Defaults to KASAN_MODE_SYNC.
> @@ -260,7 +253,7 @@ void __init kasan_init_hw_tags(void)
>  	kasan_init_tags();
>  
>  	/* KASAN is now initialized, enable it. */
> -	static_branch_enable(&kasan_flag_enabled);
> +	kasan_enable();
>  

This is obviously broken for the HW_TAGS case. kasan_enable() does nothing,
and kasan_hw_tags_enabled() now always return true.

