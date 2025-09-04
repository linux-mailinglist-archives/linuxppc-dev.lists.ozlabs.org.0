Return-Path: <linuxppc-dev+bounces-11695-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 156D3B42E51
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 02:39:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHLFb0STXz2yrK;
	Thu,  4 Sep 2025 10:38:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756946338;
	cv=none; b=aH1FDk4qud26EE+89zxtpaDF3Fsu/Sg4xfY3ibVKzqnJEi0g0NKMGy2EdON0J9srfdlT/fBZ9PXXEfOkvbY+gADElFowQgxgoFRt2whS9VY9uHi4Oy6BIbJ1MFKAP5eW2P3rHart6N1wS2IYkCIUSwReq3ltTkLE4d6De0di5MU/uw2Zu7SH13ASt1ip+D1FTwm/dWK53pi9GdZWbVXAH5IhotYgolH+b1g2PYfa593x8OFGVmqQjqSCHYZ8qa3VL4OFyi0HgYeDx8zdS1HBY/3dHxS8x6AnKHjf9kD9ClibPabHghSOZ/+IuinCd4cviSFW/EMKHvk8qLdB8RTm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756946338; c=relaxed/relaxed;
	bh=M9wjahpjajRVdLTvLPg2jmwGdR+YAWepelf042yY0AY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=gyWZM+Oj1As/VAEC4tDjaSUt4JWfh26HFv2FNF6lI+ygA+Sdk3Fh+MIZWFRwWBDyBDHajEMUrt959pX1UbK4j7ShVzndSJETtCSJyQBmUd+rhflNRVYdqUM3YkOqZr3TF1Yv07Kf8V2XoYa/oBJBKXXZ+CO+4/GsWn8GPfAxZ//RUgClQRQqzYPe16y0UKaFjpE3VdTpsGdFvc4mZSJ9yUTaxYCUXVj8c6HAQINue+HUKdoOmnGxM2o1tHZy21MFRXq88Y+96YIYN7GNX/1zseAe0n45PEErPf33rtRU/RranmB27cHfB1x/wDcMaMz9tbNLvk6FuBLaxtXar0dM5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IEzSNUF1; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IEzSNUF1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHLFY32Vwz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 10:38:56 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-327771edfbbso385043a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 17:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756946333; x=1757551133; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M9wjahpjajRVdLTvLPg2jmwGdR+YAWepelf042yY0AY=;
        b=IEzSNUF1LfRU89fsWAl1DQYYmbep/vEKFJWTq1VU+kGPhka9K8Ea5lde3daqT3iuUB
         YZj6Y+1P/kUXxp6UMbf/BaBybe4wMCupzaG1Mj6B+Y4fCwBXsNEbd3q6+V6A9dhh6FNJ
         /zEe1SFHDp4aa6sE67A41ahdW8Bkutm+kJuLIkWDqtUjsBMxan1nWLFvHq8LtnzIegal
         LQOlf7YJRx6yYNdHsk2isabGvv5BGp8WddB9es6JOUYqld2KDZk3gW4wykeT9bDVES+f
         gZ2+p2+1TuT1iM7dxg1l0OsOIYy3sNFhQYDOp03fC9n8oyoh+2wjDgPeYrI4LYrprDX2
         YDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946333; x=1757551133;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9wjahpjajRVdLTvLPg2jmwGdR+YAWepelf042yY0AY=;
        b=KZ2TV4R1p5iqcxCyXBz4c2bwIQHodOvilxpz9iM/T6+3CXDiDMWXXHTAq9XHRp6S7k
         HZPmdJL06JFBuRG/j7D93HK2L2V9Jk/2gXrrQae5bwehfFmFqx+rsRTkKlTh4cG+Ejch
         UUslL4iFFYQ585QYNZrCxkEQht0nO2nan7cA8QoFpmpxf9+/qOv+aHhYtaAh2WN3sqa6
         bseAWmMpLKKR4YaOGKdBcTmZrExMR272nzHgfYw2zsvGsCa8s176RpckSkmgcAXHyKF8
         Si3NJAkaJD3ouaewCFMI6hMtPcRzE1wwn9c6eWQML4bX1A4K2HULVawJJ8deZUdSpAVZ
         gb4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6dQeLBZTnzZAdwUEHbuGkx2V5QZRy2abOLyDVYHQZ35Avp6GGBpKKaC00X/cIgZyk6qKbteX+41WuAyo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxtias/RWxkj/4Zviiqkn97h7ooytK9eOBCESypXQQOzPp0ZAjB
	4SvJ3grgaIk2OKL1g/pJye1miMFBDP9QR/b9Wp04Nu5wPa0RaGKDSrvI
X-Gm-Gg: ASbGncvNdWG5rWwzSTGJfT4b6b0SsKjU3J8bXeWwvb2uJr5pk03CFwqvnoqQ1CbHzyj
	AWAJn02fWODA0SKRRUWbBT/3Ek2NLxcLtPE8ZYZAi32Gw/p8Gl5IGsQN5Ch40XmxcQd01LAlBZg
	tQoTV0fYic+OTi6m0uWgyXMMMtwSg56ivyQ3qAoPrw2A6Zao4Wrsk11QCTDKjB7zzqU3dff0gFd
	6mVfsQpJU7uM1AmpB/Tcd9Bt8h7/EsjBM0op8NYd8ky80eEXhJ66qeys5gnS+TYFNYhrXGavNaD
	cVBpKu8hynyICrQAfFSaI+H7APEyPura+TE9uhaK3uI1X8Jx4Y2P/r6mfHIZLNuzfgkiL4VauGf
	pF6mhcUykOwmLiPx4DaiBxuM=
X-Google-Smtp-Source: AGHT+IF8fWb/70JgPLh7N7Xn466vomeY7twFDDtFD6ID6JfG4YJmNgXkQZrYmfFbnlzFyM4OYAuWoQ==
X-Received: by 2002:a17:90b:3811:b0:32b:6145:fa63 with SMTP id 98e67ed59e1d1-32b614601acmr4849866a91.4.1756946333006;
        Wed, 03 Sep 2025 17:38:53 -0700 (PDT)
Received: from dw-tp ([171.76.85.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4fb98f9f6asm1185841a12.8.2025.09.03.17.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 17:38:52 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, ryabinin.a.a@gmail.com, christophe.leroy@csgroup.eu, bhe@redhat.com, hca@linux.ibm.com, andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn, davidgow@google.com, glider@google.com, dvyukov@google.com, alexghiti@rivosinc.com
Cc: alex@ghiti.fr, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, elver@google.com, kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org, snovitoll@gmail.com
Subject: Re: [PATCH v6 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
In-Reply-To: <20250810125746.1105476-2-snovitoll@gmail.com>
Date: Thu, 04 Sep 2025 05:54:04 +0530
Message-ID: <87ldmv6p5n.ritesh.list@gmail.com>
References: <20250810125746.1105476-1-snovitoll@gmail.com> <20250810125746.1105476-2-snovitoll@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

Sabyrzhan Tasbolatov <snovitoll@gmail.com> writes:

> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures [1] that need
> to defer KASAN initialization until shadow memory is properly set up,
> and unify the static key infrastructure across all KASAN modes.
>
> [1] PowerPC, UML, LoongArch selects ARCH_DEFER_KASAN.
>
> The core issue is that different architectures haveinconsistent approaches
> to KASAN readiness tracking:
> - PowerPC, LoongArch, and UML arch, each implement own
>   kasan_arch_is_ready()
> - Only HW_TAGS mode had a unified static key (kasan_flag_enabled)
> - Generic and SW_TAGS modes relied on arch-specific solutions or always-on
>     behavior
>
> This patch addresses the fragmentation in KASAN initialization
> across architectures by introducing a unified approach that eliminates
> duplicate static keys and arch-specific kasan_arch_is_ready()
> implementations.
>
> Let's replace kasan_arch_is_ready() with existing kasan_enabled() check,
> which examines the static key being enabled if arch selects
> ARCH_DEFER_KASAN or has HW_TAGS mode support.
> For other arch, kasan_enabled() checks the enablement during compile time.
>
> Now KASAN users can use a single kasan_enabled() check everywhere.
>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v6:
> - Added more details in git commit message
> - Fixed commenting format per coding style in UML (Christophe Leroy)
> - Changed exporting to GPL for kasan_flag_enabled (Christophe Leroy)
> - Converted ARCH_DEFER_KASAN to def_bool depending on KASAN to avoid
>         arch users to have `if KASAN` condition (Christophe Leroy)
> - Forgot to add __init for kasan_init in UML
>
> Changes in v5:
> - Unified patches where arch (powerpc, UML, loongarch) selects
>     ARCH_DEFER_KASAN in the first patch not to break
>     bisectability
> - Removed kasan_arch_is_ready completely as there is no user
> - Removed __wrappers in v4, left only those where it's necessary
>     due to different implementations
>
> Changes in v4:
> - Fixed HW_TAGS static key functionality (was broken in v3)
> - Merged configuration and implementation for atomicity
> ---
>  arch/loongarch/Kconfig                 |  1 +
>  arch/loongarch/include/asm/kasan.h     |  7 ------
>  arch/loongarch/mm/kasan_init.c         |  8 +++----
>  arch/powerpc/Kconfig                   |  1 +
>  arch/powerpc/include/asm/kasan.h       | 12 ----------
>  arch/powerpc/mm/kasan/init_32.c        |  2 +-
>  arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
>  arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
>  arch/um/Kconfig                        |  1 +
>  arch/um/include/asm/kasan.h            |  5 ++--
>  arch/um/kernel/mem.c                   | 13 ++++++++---
>  include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--------
>  include/linux/kasan.h                  |  6 +++++
>  lib/Kconfig.kasan                      | 12 ++++++++++
>  mm/kasan/common.c                      | 17 ++++++++++----
>  mm/kasan/generic.c                     | 19 +++++++++++----
>  mm/kasan/hw_tags.c                     |  9 +-------
>  mm/kasan/kasan.h                       |  8 ++++++-
>  mm/kasan/shadow.c                      | 12 +++++-----
>  mm/kasan/sw_tags.c                     |  1 +
>  mm/kasan/tags.c                        |  2 +-
>  21 files changed, 106 insertions(+), 70 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 93402a1d9c9f..4730c676b6bf 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -122,6 +122,7 @@ config PPC
>  	# Please keep this list sorted alphabetically.
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
> +	select ARCH_NEEDS_DEFER_KASAN		if PPC_RADIX_MMU
>  	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
>  	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
> diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> index b5bbb94c51f6..957a57c1db58 100644
> --- a/arch/powerpc/include/asm/kasan.h
> +++ b/arch/powerpc/include/asm/kasan.h
> @@ -53,18 +53,6 @@
>  #endif
>  
>  #ifdef CONFIG_KASAN
> -#ifdef CONFIG_PPC_BOOK3S_64
> -DECLARE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> -
> -static __always_inline bool kasan_arch_is_ready(void)
> -{
> -	if (static_branch_likely(&powerpc_kasan_enabled_key))
> -		return true;
> -	return false;
> -}
> -
> -#define kasan_arch_is_ready kasan_arch_is_ready
> -#endif
>  
>  void kasan_early_init(void);
>  void kasan_mmu_init(void);
> diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
> index 03666d790a53..1d083597464f 100644
> --- a/arch/powerpc/mm/kasan/init_32.c
> +++ b/arch/powerpc/mm/kasan/init_32.c
> @@ -165,7 +165,7 @@ void __init kasan_init(void)
>  
>  	/* At this point kasan is fully initialized. Enable error messages */
>  	init_task.kasan_depth = 0;
> -	pr_info("KASAN init done\n");
> +	kasan_init_generic();
>  }
>  
>  void __init kasan_late_init(void)
> diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
> index 60c78aac0f63..0d3a73d6d4b0 100644
> --- a/arch/powerpc/mm/kasan/init_book3e_64.c
> +++ b/arch/powerpc/mm/kasan/init_book3e_64.c
> @@ -127,7 +127,7 @@ void __init kasan_init(void)
>  
>  	/* Enable error messages */
>  	init_task.kasan_depth = 0;
> -	pr_info("KASAN init done\n");
> +	kasan_init_generic();
>  }
>  
>  void __init kasan_late_init(void) { }
> diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
> index 7d959544c077..dcafa641804c 100644
> --- a/arch/powerpc/mm/kasan/init_book3s_64.c
> +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> @@ -19,8 +19,6 @@
>  #include <linux/memblock.h>
>  #include <asm/pgalloc.h>
>  
> -DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> -
>  static void __init kasan_init_phys_region(void *start, void *end)
>  {
>  	unsigned long k_start, k_end, k_cur;
> @@ -92,11 +90,9 @@ void __init kasan_init(void)
>  	 */
>  	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
>  
> -	static_branch_inc(&powerpc_kasan_enabled_key);
> -
>  	/* Enable error messages */
>  	init_task.kasan_depth = 0;
> -	pr_info("KASAN init done\n");
> +	kasan_init_generic();
>  }
>  

Only book3s64 needs static keys here because of radix v/s hash mode
selection during runtime. The changes in above for powerpc looks good to
me. It's a nice cleanup too.

So feel free to take:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc

However I have few comments below...

...
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 9142964ab9c9..e3765931a31f 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -32,6 +32,15 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> +/*
> + * Definition of the unified static key declared in kasan-enabled.h.
> + * This provides consistent runtime enable/disable across KASAN modes.
> + */
> +DEFINE_STATIC_KEY_FALSE(kasan_flag_enabled);
> +EXPORT_SYMBOL_GPL(kasan_flag_enabled);
> +#endif
> +
>  struct slab *kasan_addr_to_slab(const void *addr)
>  {
>  	if (virt_addr_valid(addr))
> @@ -246,7 +255,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  				unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))

For changes in mm/kasan/common.c.. you have removed !kasan_enabled()
check at few places. This seems to be partial revert of commit [1]:
  
  b3c34245756ada "kasan: catch invalid free before SLUB reinitializes the object" 

Can you please explain why this needs to be removed? 
Also the explaination of the same should be added in the commit msg too.

[1]: https://lore.kernel.org/all/20240809-kasan-tsbrcu-v8-1-aef4593f9532@google.com/

>  		return false;
>  	return check_slab_allocation(cache, object, ip);
>  }
> @@ -254,7 +263,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  		       bool still_accessible)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))
>  		return false;
>  
>  	/*
> @@ -293,7 +302,7 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  
>  static inline bool check_page_allocation(void *ptr, unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready())
> +	if (!kasan_enabled())
>  		return false;
>  
>  	if (ptr != page_address(virt_to_head_page(ptr))) {
> @@ -522,7 +531,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
>  		return true;
>  	}
>  
> -	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> +	if (is_kfence_address(ptr))
>  		return true;
>  
>  	slab = folio_slab(folio);

-ritesh

