Return-Path: <linuxppc-dev+bounces-10671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C16B1B924
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 19:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxKrV2vPhz3bmC;
	Wed,  6 Aug 2025 03:18:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754414298;
	cv=none; b=KJgwdhJnotMce78urRR/3fP0oa42IjLo//ew5yRIPOAVWhPdbcN9LS6CvdYyyilxoYuFJfXxV0fcJi1izNO+vlMCidz9AqXreiVwZkIWhThB1FTAD6O8HoihdjAyu6URgYXR3CBhvUBPeJgnX4xMLK+e3cpyfOioXYKTiNMj8xmqrqAYg9EIiVWUYBOtZazj6MTb+uwlD64txG7y4njl1XOmysmTzJMpN+Db6WvQUFkjLgGQHPHGuI//D4N1rl9opshHiDIFAbnQfbFN1gm4EfSroeiD7vN5xOMcLpOKrh4UaeSh6/KwNYyxpaXR71/GHEA/avtpb4/CjoRiGV5pCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754414298; c=relaxed/relaxed;
	bh=RZ2R+1+DK7TrYxovSWYDOowvbSOnIqHJEfLqNkyHn6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kkwoiTv8i+7xH9Ni3mgBnEAp8hfNZvxZdFAAJZdmvgKjinraeJdSFvH37EE6SleaoqnpIOzpu/DliL6IYq/s/vfvQ++WSiq2nQTIbSZ9ojmDfJTEs+SAWg59o/tFhVKkOayKSsIP7i73MpFuOhXpSjgQnrer/bUx2GnxEFxFMmxf2U8mqxnNUnANcZWBnt3qzNmWfTY5bkRwFrddfQqpfgQqQSOxVsbfVWqY6PI2Z42gT1vpYuoRCFESDVJDlv4PqyOO+CCY0o1+x4eb/Pp3P9/LuUqq5BwpH+wLHY9hNKAI3dPvtcvI8lPzbzOtaAb2u4FT3P/69OySH/t95loMGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RK3X5Qxz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RK3X5Qxz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxKrS5rrpz3bkg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 03:18:16 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-332211b014dso8333631fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754414292; x=1755019092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RZ2R+1+DK7TrYxovSWYDOowvbSOnIqHJEfLqNkyHn6I=;
        b=RK3X5QxzpjIGYfOZOENVACypMYbYAlfiaI6lEFxJREOystB+j7G082mXWJUocjl4dj
         hUZIXF3iLVokSEO9nr6K11FBEuKo7EKrnga/aHtbPvhnzZYy6wE3JbPDatAU0N7UNoCx
         CPvwl7F0Oiz2OGo6vGEN1xRCHgotziQjEjhSfJvbhywvnF9g5rXwIfMrxK8A01B8gLLH
         dK2Xy6pC0AIduY+qABZyzczO7hWk94Eyy29zWuS7pogE7x85JAPZN3UiM+1nvCngJxnR
         oYDdbODVrFNLYwxVYkxmVOJ90Q2TkNQznx8/KE73J2s1rc9/4QkUbEgq4DgQDXhVP8KO
         iIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414292; x=1755019092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ2R+1+DK7TrYxovSWYDOowvbSOnIqHJEfLqNkyHn6I=;
        b=O97g7s5BzKGb1IRLSbxoq2u+zynRApixHSgFotmCURZMhkimwGkZYJgrk7+7vkL+Te
         0BewaeE8LfTgUqerGugbU8lQAyN+N+PrSN1rR6z5HiHCoERoGfvz4J9ySCpWxtkEGfYv
         xfVGP1HyGpR+gXhLRpozhM1l87AwTJaNNqAZhoBza7r89mv2K40k9K4ZV4PWMNn3aciz
         UaZ9QVKMtnvjuaxyMEWDKCgDdcZuHDdbtbTnSaHV3HlcRW49hHSZe0NaJe8ZQySHzRkk
         z18//ovXFmGhIRuOCoDxikt9a8taiWZu+UtCfqssCexSL/Mkgo5IpYoxlAzVkdY/uWPw
         Yl4g==
X-Forwarded-Encrypted: i=1; AJvYcCW+NsnQvnX0POrjHJB5izqogcpdI3ynv7nUn5nuc2YiKKygsUUo8VY1+yM6/O6Sjw241kLC3y+J3ilZ40M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YymhBqy/PLQ2h/03nMsuLLwEJr+KdKmlyNN59dMJwNoq8zNC16M
	2m+YcnzdwHgj93VbCJ713moyNxniQVsc8Swr9p9gjXNGkGxwfDFF4e6f
X-Gm-Gg: ASbGncug6Ive97q/Od2jD3PmhoOSUVOofcKzs+p4VlKJ+J6/J8qsJLweRUalaOREOTY
	iUqMYF3ZNPif44R6uSNxJs0vKhl5bxmGTTnq8ZPqelR1kikoS1+l75m+AYFGYf5vK6obdGeOaQI
	J5cvG/f9zrWOONZNjjlDMMwRmYZuUGrHij2tncDl7IXEvkIR9dOcnGjaNjRog3Y1MZnSh8aHIan
	58QfoUv9Uk6gaAAUMbM+mW9ZUPP2C4P64p6uWwGysl/IFsYe0jp2VMOFUNCJizrGy84JeSCNW8t
	2JOeeV9tpv3xMbIXlDCJAZ79p6OzJ08I3jQfEoBcxEYxgRrr7R8YNs4CjxWPzfPajWLZyGGZi0A
	mUqYf0J2FKfGS+kvih3UaJsnk9Q8538QdpsYl+4+5HVA8AD6qiQ==
X-Google-Smtp-Source: AGHT+IFS2HbTLqS5A/HgTtiIoYjwUumHARImAD+oD4FUxoQg3JqtFBL0/dOcC7iWrPVn65io3WaVpA==
X-Received: by 2002:a2e:be24:0:b0:32b:5a24:b9d8 with SMTP id 38308e7fff4ca-33256856534mr14686731fa.8.1754414291879;
        Tue, 05 Aug 2025 10:18:11 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382be4a7sm21072541fa.32.2025.08.05.10.18.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:18:11 -0700 (PDT)
Message-ID: <e15e1012-566f-45a7-81d5-fd504af780da@gmail.com>
Date: Tue, 5 Aug 2025 19:17:25 +0200
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
Subject: Re: [PATCH v4 5/9] kasan/loongarch: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-6-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250805142622.560992-6-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> LoongArch needs deferred KASAN initialization as it has a custom
> kasan_arch_is_ready() implementation that tracks shadow memory
> readiness via the kasan_early_stage flag.
> 
> Select ARCH_DEFER_KASAN to enable the unified static key mechanism
> for runtime KASAN control. Call kasan_init_generic() which handles
> Generic KASAN initialization and enables the static key.
> 
> Replace kasan_arch_is_ready() with kasan_enabled() and delete the
> flag kasan_early_stage in favor of the unified kasan_enabled()
> interface.
> 
> Note that init_task.kasan_depth = 0 is called after kasan_init_generic(),
> which is different than in other arch kasan_init(). This is left
> unchanged as it cannot be tested.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v4:
> - Replaced !kasan_enabled() with !kasan_shadow_initialized() in
>   loongarch which selects ARCH_DEFER_KASAN (Andrey Ryabinin)
> ---
>  arch/loongarch/Kconfig             | 1 +
>  arch/loongarch/include/asm/kasan.h | 7 -------
>  arch/loongarch/mm/kasan_init.c     | 8 ++------
>  3 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index f0abc38c40a..f6304c073ec 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -9,6 +9,7 @@ config LOONGARCH
>  	select ACPI_PPTT if ACPI
>  	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
>  	select ARCH_BINFMT_ELF_STATE
> +	select ARCH_DEFER_KASAN
>  	select ARCH_DISABLE_KASAN_INLINE
>  	select ARCH_ENABLE_MEMORY_HOTPLUG
>  	select ARCH_ENABLE_MEMORY_HOTREMOVE
> diff --git a/arch/loongarch/include/asm/kasan.h b/arch/loongarch/include/asm/kasan.h
> index 62f139a9c87..0e50e5b5e05 100644
> --- a/arch/loongarch/include/asm/kasan.h
> +++ b/arch/loongarch/include/asm/kasan.h
> @@ -66,7 +66,6 @@
>  #define XKPRANGE_WC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKPRANGE_WC_KASAN_OFFSET)
>  #define XKVRANGE_VC_SHADOW_OFFSET	(KASAN_SHADOW_START + XKVRANGE_VC_KASAN_OFFSET)
>  
> -extern bool kasan_early_stage;
>  extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>  
>  #define kasan_mem_to_shadow kasan_mem_to_shadow
> @@ -75,12 +74,6 @@ void *kasan_mem_to_shadow(const void *addr);
>  #define kasan_shadow_to_mem kasan_shadow_to_mem
>  const void *kasan_shadow_to_mem(const void *shadow_addr);
>  
> -#define kasan_arch_is_ready kasan_arch_is_ready
> -static __always_inline bool kasan_arch_is_ready(void)
> -{
> -	return !kasan_early_stage;
> -}
> -
>  #define addr_has_metadata addr_has_metadata
>  static __always_inline bool addr_has_metadata(const void *addr)
>  {
> diff --git a/arch/loongarch/mm/kasan_init.c b/arch/loongarch/mm/kasan_init.c
> index d2681272d8f..57fb6e98376 100644
> --- a/arch/loongarch/mm/kasan_init.c
> +++ b/arch/loongarch/mm/kasan_init.c
> @@ -40,11 +40,9 @@ static pgd_t kasan_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
>  #define __pte_none(early, pte) (early ? pte_none(pte) : \
>  ((pte_val(pte) & _PFN_MASK) == (unsigned long)__pa(kasan_early_shadow_page)))
>  
> -bool kasan_early_stage = true;
> -
>  void *kasan_mem_to_shadow(const void *addr)
>  {
> -	if (!kasan_arch_is_ready()) {
> +	if (!kasan_shadow_initialized()) {
>  		return (void *)(kasan_early_shadow_page);
>  	} else {
>  		unsigned long maddr = (unsigned long)addr;
> @@ -298,8 +296,6 @@ void __init kasan_init(void)
>  	kasan_populate_early_shadow(kasan_mem_to_shadow((void *)VMALLOC_START),
>  					kasan_mem_to_shadow((void *)KFENCE_AREA_END));
>  
> -	kasan_early_stage = false;
> -

There is a reason for this line to be here.
Your patch will change the result of the follow up kasan_mem_to_shadow() call and
feed the wrong address to kasan_map_populate()


>  	/* Populate the linear mapping */
>  	for_each_mem_range(i, &pa_start, &pa_end) {
>  		void *start = (void *)phys_to_virt(pa_start);
> @@ -329,5 +325,5 @@ void __init kasan_init(void)
>  
>  	/* At this point kasan is fully initialized. Enable error messages */
>  	init_task.kasan_depth = 0;
> -	pr_info("KernelAddressSanitizer initialized.\n");
> +	kasan_init_generic();
>  }


