Return-Path: <linuxppc-dev+bounces-10701-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C09B1CC9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Aug 2025 21:52:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4by1CS48ZLz3bnJ;
	Thu,  7 Aug 2025 05:52:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::731"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754509924;
	cv=none; b=JGqwdMNuqY+8fr58Cva+Ld6oFxh5p68pYhGx6RNDc6rRjMhM5un5EeAF+VoVILWOY1lXJXo4bxik7kNA5uTZwny20OQe+UDpQZIshylw8i4RyBLicObxKFtJx1Foo+u+ZVd5icZumAoATUyI/L/mEFV9fFUJINIjX6dopgo13t02HHcsp+tSklzfkXvk6xhyuuyG3WfUwuNRtaadksqyrVjPEXrlRw/3MOI5LScA1L7FBo60joX6L4rb/+J7NpwjbO1wc1k0V5N+oe7/tL9URyvl9uaQk40F871Nv+obPZWW87y/uFIs08Jrw0LtAMj9dwWSqp1ujBnSooX9LTJkww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754509924; c=relaxed/relaxed;
	bh=jOJUufvksrkNMkhUfUMzFksoWwIudiaNrjydPYTPe/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAumHV+i9+yNoOtpZOz9/fewo9HJSbyZZoXr4rkJH6tGhulLSS2gppyCeakR9TgwQtUNUxgnKmVlrTgL80Q8rvmEiLTojW5hFFoJXK0RTtYfQKkcixIvCVrMuSoeccfT7gMyMVNH6I4Sh9FL0bhAx8dvWELrZZH46JfOF3nyU0bOIF5inR+EXmTuIiyzuhIzI8VwV+aaTeqBY7IEi1Sv9f7L6dDgeJiOLR3Qt/No063M/FLMvS2OPluAeXDM/DFTba4hpkwsy3vcdMAwA11XDEVYDZFZzq6/enM32AX4TWlJKp8eJ67XhG94+6vf9W/ALDf2DQkmlmtBv3ipfeScYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V/4C6Thg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V/4C6Thg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731; helo=mail-qk1-x731.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4by1CR1w7Dz3bmC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 05:52:02 +1000 (AEST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7e684d49270so1372685a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Aug 2025 12:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754509919; x=1755114719; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jOJUufvksrkNMkhUfUMzFksoWwIudiaNrjydPYTPe/E=;
        b=V/4C6ThgatFckCdSh31hj08vs67ngRjS9kDsPlEb8lvxx42e2Ms/vrDdNp2wJKjPAe
         GljngUkMNhqjjiINMfNNZqO66ZWgDQ4+HgoYQS+eZO9F2AbzLRqWgZ1c7DqHt1wctffe
         nzDk1eG+5ZDOpc1A2FLSqlu6KYSvjBGorLDK0mIDPKqAh+Sww/30k6Ia1vTbiwGatQVk
         cBOxTwKkfWXH0A7GdAYPRWUo6Q4JKVxfWfABSUOmYl0Kp0OF5KUmy72Lpf05r8nqGMyK
         mTJrUzwUAfV4vdO9CRVDy7jy6MzUpdAORrcdQJwDUgmsb9ocTgkSqrF1pmDXfQO2pQo5
         bJbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754509919; x=1755114719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jOJUufvksrkNMkhUfUMzFksoWwIudiaNrjydPYTPe/E=;
        b=CTPWHuTAlkeV4hMQzkAzf5vg2f8Xh4+eurPotPUERTI162gdSfLVj+UQvHIHXtQZqG
         MUfVRGWBdoZQ9yHxRZX7GBlGDIWRTnMRNxQNVbaq4Mn3xOtrXSKYGwyIa+ZRoHh81VoL
         3YRuGLcmTefhmRMSpxfaUzs7UuzFGYXnjfQubk912J0y7sl3cDtgfpYazkfRI+miLSIV
         QBrDbfCRVjmI6QUByEuafQ+XRgKzl6/7cZMXPD7kjkYe872WxlZm2MFfDxaQ+ej54KO4
         hpRA1nTwCiieyAKfTssM6PRui3zNtpCMGCB+NiGG8WrYFu4b1EA+24ofjMoxmyKPN1Bh
         p5LA==
X-Forwarded-Encrypted: i=1; AJvYcCVBcBfXm7sXfYlI3CWil/DTXcuHque38qzabqZDk0naTEySTamBiNYCLRQE71yRVF9rS1+yMtkEAccZByM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywtw/96CwNEAT4NzrYdhyQyhEeEkm29MTu4wcpc34Ic3uNwzj8A
	Qrz83MiDmiqb1PCEMacwT9Tgeu21j3qkzEvV9scZQm4GkJ1OUQEkPfw+
X-Gm-Gg: ASbGnctSkqadPZUxe2IK00eH1b9qB8jKl2o8O8xUnwDDKq6CwBTHdmfZm8RPy22U4Z6
	KX529Azk+LhIrFcgY2rdusBWOhc2FGFfvc+IS1B2mQ6fA4bx+Vavjw16UHXwv7D1aIJgJO4ysJZ
	RrzAoMwi74x0vUV8q9oFiYZhvDG8B4pCwmW7mZ94/aUEYjrtn6+BV6Kq/4psTeZmZ0pc9fGxC89
	7BPFjcvYA2hFr+sILpcq/GTiSxt0O6Emt9qIXFgedzFdNPjBuiS378YRuH66BjDNj8tGatzzR+Z
	urChAr0Um9WMOLKjCjVY370TWmKsNVTPulOZJIiARCMsJW+fFRocrTLK4WnIVXdnzLOO1Zxwxv+
	F+r7CFN9TFYalws+sk/XdPs7Ka+Q1/SYwbI/MWIxLjtMQ+ALYw2k5oaKtPZssKPbojBwb
X-Google-Smtp-Source: AGHT+IFmzUMSDyUQoeXjvqgYHBfr+pQThJ0xtd5NGlSxIHAVfwgMAAXU9ZJsjUzM039DpZsjSBydog==
X-Received: by 2002:a05:620a:1a04:b0:7e2:6be2:38eb with SMTP id af79cd13be357-7e814d64573mr316228785a.4.1754509919359;
        Wed, 06 Aug 2025 12:51:59 -0700 (PDT)
Received: from [192.168.0.18] (cable-94-189-140-132.dynamic.sbb.rs. [94.189.140.132])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f5c55a2sm866617085a.36.2025.08.06.12.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 12:51:58 -0700 (PDT)
Message-ID: <dd25cb14-5df1-4b2c-bff7-0ca901dfd824@gmail.com>
Date: Wed, 6 Aug 2025 21:51:07 +0200
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
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, trishalfonso@google.com, davidgow@google.com,
 glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-2-snovitoll@gmail.com>
 <5a73e633-a374-47f2-a1e1-680e24d9f260@gmail.com>
 <CACzwLxg=zC-82sY6f-z0VOnmbpN2E8tQxe7RyOnynpbJEFP+NA@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxg=zC-82sY6f-z0VOnmbpN2E8tQxe7RyOnynpbJEFP+NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/6/25 4:15 PM, Sabyrzhan Tasbolatov wrote:
> On Wed, Aug 6, 2025 at 6:35 PM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
>>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures that need
>>> to defer KASAN initialization until shadow memory is properly set up,
>>> and unify the static key infrastructure across all KASAN modes.
>>>
>>> Some architectures (like PowerPC with radix MMU) need to set up their
>>> shadow memory mappings before KASAN can be safely enabled, while others
>>> (like s390, x86, arm) can enable KASAN much earlier or even from the
>>> beginning.
>>>
>>> Historically, the runtime static key kasan_flag_enabled existed only for
>>> CONFIG_KASAN_HW_TAGS mode. Generic and SW_TAGS modes either relied on
>>> architecture-specific kasan_arch_is_ready() implementations or evaluated
>>> KASAN checks unconditionally, leading to code duplication.
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
>>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
>>> ---
>>> Changes in v4:
>>> - Fixed HW_TAGS static key functionality (was broken in v3)
>>
>> I don't think it fixed. Before you patch kasan_enabled() esentially
>> worked like this:
>>
>>  if (IS_ENABLED(CONFIG_KASAN_HW_TAGS))
>>         return static_branch_likely(&kasan_flag_enabled);
>>  else
>>         return IS_ENABLED(CONFIG_KASAN);
>>
>> Now it's just IS_ENABLED(CONFIG_KASAN);
> 
> In v4 it is:
> 
>         #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
>         static __always_inline bool kasan_shadow_initialized(void)
>         {
>                 return static_branch_likely(&kasan_flag_enabled);
>         }
>         #else
>         static __always_inline bool kasan_shadow_initialized(void)
>         {
>                 return kasan_enabled(); // which is IS_ENABLED(CONFIG_KASAN);
>         }
>         #endif
> 
> So for HW_TAGS, KASAN is enabled in kasan_init_hw_tags().

You are referring to  kasan_shadow_initialized(), but I was talking about kasan_enabled() specifically.
E.g. your patch changes behavior for kasan_init_slab_obj() which doesn't use kasan_shadow_initialized()
 (in the case of HW_TAGS=y && kasan_flag_enabled = false) :

static __always_inline void * __must_check kasan_init_slab_obj(
                                struct kmem_cache *cache, const void *object)
{
        if (kasan_enabled())
                return __kasan_init_slab_obj(cache, object);
        return (void *)object;
}



>>> +#if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
>>> +/*
>>> + * Global runtime flag for KASAN modes that need runtime control.
>>> + * Used by ARCH_DEFER_KASAN architectures and HW_TAGS mode.
>>> + */
>>>  DECLARE_STATIC_KEY_FALSE(kasan_flag_enabled);
>>>
>>> -static __always_inline bool kasan_enabled(void)
>>> +/*
>>> + * Runtime control for shadow memory initialization or HW_TAGS mode.
>>> + * Uses static key for architectures that need deferred KASAN or HW_TAGS.
>>> + */
>>> +static __always_inline bool kasan_shadow_initialized(void)
>>
>> Don't rename it, just leave as is - kasan_enabled().
>> It's better name, shorter and you don't need to convert call sites, so
>> there is less chance of mistakes due to unchanged kasan_enabled() -> kasan_shadow_initialized().
> 
> I actually had the only check "kasan_enabled()" in v2, but went to
> double check approach in v3
> after this comment:
> https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com/

AFAIU the comment suggest that we need two checks/flags, one in kasan_enabled() which checks
whether kasan was enabled via cmdline (currently only for HW_TAGS)
 and one in kasan_arch_is_ready()(or kasan_shadow_initialized()) which checks if arch initialized KASAN.
And this not what v3/v4 does. v4 basically  have one check, just under different name. 

Separate checks might be needed if we have code paths that need 'kasan_arch_is_ready() && !kasan_enabled()'
and vise versa '!kasan_arch_is_ready() && kasan_enabled()'.

From the top of my head, I can't say if we have such cases.

> 
> Ok, we will have the **only** check kasan_enabled() then in
> kasan-enabled.h which
> 
>         #if defined(CONFIG_ARCH_DEFER_KASAN) || defined(CONFIG_KASAN_HW_TAGS)
>         static __always_inline bool kasan_enabled(void)
>         {
>                 return static_branch_likely(&kasan_flag_enabled);
>         }
>         #else
>         static inline bool kasan_enabled(void)
>         {
>                 return IS_ENABLED(CONFIG_KASAN);
>         }
> 
> And will remove kasan_arch_is_ready (current kasan_shadow_initialized in v4).
> 
> So it is the single place to check if KASAN is enabled for all arch
> and internal KASAN code.
> Same behavior is in the current mainline code but only for HW_TAGS.
> 
> Is this correct?
> 

Yep, that's what I meant.

>>
>>
>>>  {
>>>       return static_branch_likely(&kasan_flag_enabled);
>>>  }
>>>
>>> -static inline bool kasan_hw_tags_enabled(void)
>>> +static inline void kasan_enable(void)
>>> +{
>>> +     static_branch_enable(&kasan_flag_enabled);
>>> +}
>>> +#else
>>> +/* For architectures that can enable KASAN early, use compile-time check. */
>>> +static __always_inline bool kasan_shadow_initialized(void)
>>>  {
>>>       return kasan_enabled();
>>>  }
>>>
>>
>> ...
>>
>>>
>>>  void kasan_populate_early_vm_area_shadow(void *start, unsigned long size);
>>> -int kasan_populate_vmalloc(unsigned long addr, unsigned long size);
>>> -void kasan_release_vmalloc(unsigned long start, unsigned long end,
>>> +
>>> +int __kasan_populate_vmalloc(unsigned long addr, unsigned long size);
>>> +static inline int kasan_populate_vmalloc(unsigned long addr, unsigned long size)
>>> +{
>>> +     if (!kasan_shadow_initialized())
>>> +             return 0;
>>
>>
>> What's the point of moving these checks to header?
>> Leave it in C, it's easier to grep and navigate code this way.
> 
> Andrey Konovalov had comments [1] to avoid checks in C
> by moving them to headers under __wrappers.
> 
> : 1. Avoid spraying kasan_arch_is_ready() throughout the KASAN
> : implementation and move these checks into include/linux/kasan.h (and
> : add __wrappers when required).
> 
> [1] https://lore.kernel.org/all/CA+fCnZcGyTECP15VMSPh+duLmxNe=ApHfOnbAY3NqtFHZvceZw@mail.gmail.com/
> 

I think Andrey K. meant cases when we have multiple implementations of one function for each mode.
In such case it makes sense to merge multiple kasan_arch_is_ready() checks into one in the header.
But in case like with kasan_populate_vmalloc() we have only one implementation so I don't see any
value in adding wrapper/moving to header. 

>>
>>
>>> +     return __kasan_populate_vmalloc(addr, size);
>>> +}
>>> +
>>> +void __kasan_release_vmalloc(unsigned long start, unsigned long end,
>>>                          unsigned long free_region_start,
>>>                          unsigned long free_region_end,
>>>                          unsigned long flags);
>>> +static inline void kasan_release_vmalloc(unsigned long start,
>>> +                        unsigned long end,
>>> +                        unsigned long free_region_start,
>>> +                        unsigned long free_region_end,
>>> +                        unsigned long flags)
>>> +{
>>> +     if (kasan_shadow_initialized())
>>> +             __kasan_release_vmalloc(start, end, free_region_start,
>>> +                        free_region_end, flags);
>>> +}
>>>
>>
>> ...> @@ -250,7 +259,7 @@ static inline void poison_slab_object(struct kmem_cache *cache, void *object,
>>>  bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>>>                               unsigned long ip)
>>>  {
>>> -     if (!kasan_arch_is_ready() || is_kfence_address(object))
>>> +     if (is_kfence_address(object))
>>>               return false;
>>>       return check_slab_allocation(cache, object, ip);
>>>  }
>>> @@ -258,7 +267,7 @@ bool __kasan_slab_pre_free(struct kmem_cache *cache, void *object,
>>>  bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>>>                      bool still_accessible)
>>>  {
>>> -     if (!kasan_arch_is_ready() || is_kfence_address(object))
>>> +     if (is_kfence_address(object))
>>>               return false;
>>>
>>>       poison_slab_object(cache, object, init, still_accessible);
>>> @@ -282,9 +291,6 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
>>>
>>>  static inline bool check_page_allocation(void *ptr, unsigned long ip)
>>>  {
>>> -     if (!kasan_arch_is_ready())
>>> -             return false;
>>> -
>>
>>
>> Well, you can't do this yet, because no arch using ARCH_DEFER_KASAN yet, so this breaks
>> bisectability.
>> Leave it, and remove with separate patch only when there are no users left.
> 
> Will do in v5 at the end of patch series.
> 
>>
>>>       if (ptr != page_address(virt_to_head_page(ptr))) {
>>>               kasan_report_invalid_free(ptr, ip, KASAN_REPORT_INVALID_FREE);
>>>               return true;
>>> @@ -511,7 +517,7 @@ bool __kasan_mempool_poison_object(void *ptr, unsigned long ip)
>>>               return true;
>>>       }
>>>
>>> -     if (is_kfence_address(ptr) || !kasan_arch_is_ready())
>>> +     if (is_kfence_address(ptr))
>>>               return true;
>>>
>>>       slab = folio_slab(folio);
>>
>>


