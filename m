Return-Path: <linuxppc-dev+bounces-10691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F96B1C6DC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 15:35:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxrrZ4ft6z30W5;
	Wed,  6 Aug 2025 23:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754487310;
	cv=none; b=iNBjujBXb98KUI0NNVdUA+oe2I21lL0syhL025up84MZu4xfZ6FOHYKuFXK7FE7d6puX4HxTaVv4PW0EnTVb3kz3x02rrtqyCji/OVQPzZQbRAEuCwqWemGzMxxwrO/Es6Y0TxvcSWaDLEijIUlkyX+OctVGmOghdYHJ4Jx1efe8gzQM9dR3VsKZxzDJPDpBJdj0OuVJ+5v2+jMXKcmGWrBHNn7z9mebr3xbrUwElhM4Qi63nEdSXxC9C18R/1hp5O6C4SJf+tkehveJHebGH3vRkz1EXdou4Hn5fH11YxfGwj/BHKpyq7f6gXRIQC2iq09gDXZ6E+PdOJCWVJQA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754487310; c=relaxed/relaxed;
	bh=GkBywKSK+jarcaDEWkMpZ6690o3qyLvHV2Ljs5N+BnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mX0btbDifpybfbv+rTotaze8puvU7UUHiQ///9Do0xrbYLHDI0f1AsI6JpZRnnh9JbUfAEnMqDxT0ytQNSu37X6RBCcah/uWIx4lyyqoxF1Q4/9djS1SU079RWh7L6Kv+9UcPSOmmrnZ7z5K5z9wgDL0gvG3mIRRa369r/q7c0SiwBRSH9sqm7LSPcKVQX+emFkIUBR7oFcsNEHSKhY+3elZE+iYj3H7GjMIx6nwtxNrWMi8ur3Lrr2lh2shuC/WH0zSNS6tw5THl8ei4c+ApowF2htJ32HG6L0Ve7Czbo/KIJYqIYJBNe4s/9cLIDM+8ZPgTIjYkzkTcAKhDtsb0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DUlcIb6b; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DUlcIb6b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxrrX6qn0z2ygJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 23:35:07 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55ba2644bdaso562219e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 06:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754487304; x=1755092104; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GkBywKSK+jarcaDEWkMpZ6690o3qyLvHV2Ljs5N+BnY=;
        b=DUlcIb6bFFzeLsFsqtYh6j3FYdkcabQWjGpRRhXmrAyuN6nodgKwUf4oD7RvFUMet3
         Dqle+QhRIzx8GCn6L770xXIj8sZsfE/P3pK8yAOyNs/Bi00n0khJJr/B2IOg4SOe5Kon
         o1xzTxG788epjbsnObX/Hq/vkY9/UTw1X3UzPDiDfwDTangXe8F2ob7UryoPhPEdWwB0
         BXjLcypzLvBPZe6h4Q55stcwcaCTK2cBNT5v1f5VpoXjBbigoswcOC62X7ecUwPYI8yD
         dhtWwcdwQ9HEABLclb7bCT2VZFme1/9hBfJl0TtLg6HLLfIfv4+JdfwHu1Bujdp2+9eC
         UE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754487304; x=1755092104;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GkBywKSK+jarcaDEWkMpZ6690o3qyLvHV2Ljs5N+BnY=;
        b=exoMGUelry9IyfkD2PeFVRS5O4am7unhr+AbRZYx6NMGUUwYptBMelRt8uNF/7BZzF
         e2O9wmvus/h604KSPtIxtIbmkvsOR2VYvGm6iWjWFAbiLRtmxredLpo/P4tAJtH3h8JR
         z1OxNakpiESqn/OmIi0Lvxrn18LjGX7SJPzQJ4E3/aMHv8z/xFetTWgtLrHqyaar6aFM
         29IKtpggnGc+6LRn5Us9BEQ1JQl81KCpqBbZcp5wQbny2GQq3O38TH90l+f44+YDTHPA
         Ndub4JKpAhpAFnpvesjVme8L888zc/zzntp502i5cMn52Be4GAB4nC/6vDU3QU5se/6F
         5mqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIv1hdHwkYVttXHhZoLGKTd0IbqKu0LOxvBcK62DR2wB4xfEGK2EociaBIfDfSUUy3wmLniYA+SZv++Ms=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yypxo+EbHNjPUlfEuCRAkhLAbxIx/ERSLJaxaiVpQ0uXpQckfa6
	ZzqHDClvjIOnqCIsV8VK2phfZNueGNR6aE0uwDyL0rFzHviLRqsHlpLv
X-Gm-Gg: ASbGncu8jdK9qrv46fNLf0gld5pXK3diQMetGvFa5P4l3lABIfuMyc9mvHWCzp+wouP
	sdGU1kf9ni6T/4Kg8d9dGTn5W40ebaefYCjFYiEMX4ydgkV5f/PGV+eKxjDP9m8/IOFiY3WjaFW
	yJVgXrds0GqRNfed0/Q8s8EzaQXQepdTKJ+2jsJrFjC9UDJDnLFuoSSPpPyyX5cg8syjShiOjw7
	FwmJieIBciEg2PraWyexwRE5GI+phnx/5YM5J2TNZKuU4U9LhDiSXscQgNeHPo8rqNHCKwnUsLz
	shyVMag8klrPlr1KbwmOZAE4Sxs2blTL/xRSmwumPnjn60GgzRJ9krodUWRcgZxm/xCHmsYxiGk
	/sTjD2zx7YIKJ3DjaBKR+O3Nbtssh
X-Google-Smtp-Source: AGHT+IG/+xV14jPScIlu8zUGGDD+ajQ7/dFSreWgfNZ5pS9U8lvRiqBw989XNjNOSP9y7GWZ8ScIMA==
X-Received: by 2002:a05:6512:ad1:b0:55a:4d9e:6536 with SMTP id 2adb3069b0e04-55caf2f956dmr417291e87.2.1754487304191;
        Wed, 06 Aug 2025 06:35:04 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8899ebd2sm2302283e87.42.2025.08.06.06.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 06:35:03 -0700 (PDT)
Message-ID: <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
Date: Wed, 6 Aug 2025 15:34:15 +0200
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
Subject: Re: [PATCH v4 1/9] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-2-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250805142622.560992-2-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
> to defer KASAN initialization until shadow memory is properly set up,
> and unify the static key infrastructure across all KASAN modes.
> 
> Some architectures (like PowerPC with radix MMU) need to set up their
> shadow memory mappings before KASAN can be safely enabled, while others
> (like s390, x86, arm) can enable KASAN much earlier or even from the
> beginning.
> 
> Historically, the runtime static key kasan_flag_enabled existed only for
> CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
> architecture-specific kasan_arch_is_ready() implementations or evaluated
> KASAN checks unconditionally, leading to code duplication.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
> Changes in v4:
> - Fixed HW_TAGS static key functionality (was broken in v3)

I don't think it fixed. Before you patch kasan_enabled() esentially
worked like this:

 if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))
        return static_branch_likely(&kasan_flag_enabled);
 else
        return IS_ENABLED(CONFIG_KASAN);

Now it's just IS_ENABLED(CONFIG_KASAN);

And there are bunch of kasan_enabled() calls left whose behavior changed for
no reason.


> - Merged configuration and implementation for atomicity
> ---
>  include/linux/kasan-enabled.h | 36 +++++++++++++++++++++++-------
>  include/linux/kasan.h         | 42 +++++++++++++++++++++++++++--------
>  lib/Kconfig.kasan             |  8 +++++++
>  mm/kasan/common.c             | 18 ++++++++++-----
>  mm/kasan/generic.c            | 23 +++++++++++--------
>  mm/kasan/hw_tags.c            |  9 +-------
>  mm/kasan/kasan.h              | 36 +++++++++++++++++++++---------
>  mm/kasan/shadow.c             | 32 ++++++--------------------
>  mm/kasan/sw_tags.c            |  4 +++-
>  mm/kasan/tags.c               |  2 +-
>  10 files changed, 133 insertions(+), 77 deletions(-)
> 
> diff --git a/include/linux/kasan-enabled.h b/include/linux/kasan-enabled.h
> index 6f612d69ea0..52a3909f032 100644
> --- a/include/linux/kasan-enabled.h
> +++ b/include/linux/kasan-enabled.h
> @@ -4,32 +4,52 @@
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
> +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
> +/*
> + * Global runtime flag for KASAN modes that need runtime control.
> + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
> + */
>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>  
> -static __always_inline bool kasan_enabled(void)
> +/*
> + * Runtime control for shadow memory initialization or HW_TAGS mode.
> + * Uses static key for architectures that need deferred KASAN or HW_TAGS.
> + */
> +static __always_inline bool kasan_shadow_initialized(void)

Don't rename it, just leave as is - kasan_enabled().
It's better name, shorter and you don't need to convert call sites, so
there is less chance of mistakes due to unchanged kasan_enabled() -> kasan_shadow_initialized().


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

...

>  
>  void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
> -int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> -void kasan_release_vmalloc(unsigned long start, unsigned long end,
> +
> +int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
> +static inline int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
> +{
> +	if (!kasan_shadow_initialized())
> +		return 0;


What's the point of moving these checks to header?
Leave it in C, it's easier to grep and navigate code this way.


> +	return __kasan_populate_vmalloc(addr, size);
> +}
> +
> +void __kasan_release_vmalloc(unsigned long start, unsigned long end,
>  			   unsigned long free_region_start,
>  			   unsigned long free_region_end,
>  			   unsigned long flags);
> +static inline void kasan_release_vmalloc(unsigned long start,
> +			   unsigned long end,
> +			   unsigned long free_region_start,
> +			   unsigned long free_region_end,
> +			   unsigned long flags)
> +{
> +	if (kasan_shadow_initialized())
> +		__kasan_release_vmalloc(start, end, free_region_start,
> +			   free_region_end, flags);
> +}
>  

...> @@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  				unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))
>  		return false;
>  	return check_slab_allocation(cache, object, ip);
>  }
> @@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  		       bool still_accessible)
>  {
> -	if (!kasan_arch_is_ready() || is_kfence_address(object))
> +	if (is_kfence_address(object))
>  		return false;
>  
>  	poison_slab_object(cache, object, init, still_accessible);
> @@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>  
>  static inline bool check_page_allocation(void *ptr, unsigned long ip)
>  {
> -	if (!kasan_arch_is_ready())
> -		return false;
> -


Well, you can't do this yet, because no arch using ARCH_DEFER_KASAN yet, so this breaks
bisectability.
Leave it, and remove with separate patch only when there are no users left.

>  	if (ptr != page_address(virt_to_head_page(ptr))) {
>  		kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
>  		return true;
> @@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
>  		return true;
>  	}
>  
> -	if (is_kfence_address(ptr) || !kasan_arch_is_ready())
> +	if (is_kfence_address(ptr))
>  		return true;
>  
>  	slab = folio_slab(folio);



