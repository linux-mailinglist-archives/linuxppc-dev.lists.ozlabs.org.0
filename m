Return-Path: <linuxppc-dev+bounces-10384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA77B0F8B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 19:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnLJh2RZ2z30HB;
	Thu, 24 Jul 2025 03:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753290692;
	cv=none; b=nhkSvHgJJNRTNJUfzSWLdkm3PWPJnflt1ctzq8/Cj+bO2PlIl/tZPt1gc2AcaRNHeQGzgjkxti4MQV22UeQfYM4AJm5hutlai8pThwyukpxg2BYReJDO6ljV00Qs1UaUrn1Rv0yRRQnNMqeM6Yx7GO2rjOT1dHCAyWhVIsaeMRDCrog5PO6O6FQC7TLgg87MmdJkjKOAaHeJ3pAlqwLo3RN4lopIk6Yey3u9isYBQzhrGY4cbCOq9zQtsHu6AeR4hKfRU97nsCUhOUuejaUwbY9LnEHGcxGDx1XXqkxDNjGeo/UyQmAQXW/XO63jf/x9Flzt/lxJYd7wDENX3gdfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753290692; c=relaxed/relaxed;
	bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YHUtmdGJsbydynIYmhRKb5MkmdsHWEQ9YCKWWZpKRdZYuVCXZr+MBO7JR5HjaWN+y4aByXl1Q+0GNnCsgBHO9+5UD3f9QgVhrKhMoTHn3E1bNS9RJZKME/AypECkaDBz3HUw2Th5ocS2U0Lo5cfEdbDf46lkm4kqCp2M0np+1kAB2W27yliNEnobcvRt4SwvdY9lf2cIHZvpeF5av6ffdjZ6jTH9CfVIg/LFrqXMgVPTjE31I1lvYlzNxy24qNReCkEGx1c5z+Ng+hWmPRK0/+wodtgfzE2YFSJZaPUptFmsGd/AQ6+6kL0cluBcuxU8Ka0ebQU+RAEnP5wfGlnUGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuTlKtPL; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuTlKtPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnLJf13Rfz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 03:11:29 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3309587d2d1so42361fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753290685; x=1753895485; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=FuTlKtPLwVJ81hPQnKYqy0T2vCpveeT9gXh4GCTA1LwmuStl9OPaBRRjlJUGema8I6
         5GlrlQkgkrD614CRjRZ6/cp9SbLtPXuOk/K9qhIwhS+4Fxq7lP9KjahrzXb8WaBiI4Rd
         MvDFyepte67NEnX+NyV+kBqIH1mCGrhjyhGyiTS9ZpadTLF8j6zaay+VRXwFWfrUsYhZ
         jGqvaGRx7wyfCUvxfZ0Q6frADxHZOvM/qyQ8Z8D2KymTBZJIUq+ms0qhtjSjkXkJ1AUS
         cfUZWoGe1Z/clHvjT2jmpv4gx7IR3TDIGbxYuZq2AM0mBP4wledT/xLyQSPFz++zu5bt
         Po5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753290685; x=1753895485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0LUnIOIz73OOlhKmDgw5NN8XNp7rSGUS+XkRlIQ8F4=;
        b=njWpkFFn/mDZJBA8GTBR3uKzsEIjsd9MHbIWvpRngzy5AVtzMjvSt9DJUEvEPTqutD
         /s3YxkRCv89e1GWYt7VcLCA6AvNtJgDFi3suKtx6LG0A0P+QlHobCWeOj0j2KznvAwDC
         ELnTbwhYBAzG5867bxlUghuvtOHiDyqoWBAbbWu3ujbox03M0Kj29/HNhsZr6//F81mK
         RFBEj/bT5OmvPWwNfMjiVYj2qJiswBtoN/NK6NX237Ng6q7+gJlwl19NLKKpliL4QDXz
         8KjveH2pnoHYiwhSRoAT9vophaTDau3clPnviy61So/6bQBJV4bMinVEQPZZMh1ooZvG
         Z3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/+WwzInz1LqrvXMsipJvRrc5SjpoM3D55d/42+RYvPpPgO8/3kXwcE/Vx/GpHipgrXNQqMyncpnXAWPA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwAXW3Sagxn2QBEa27M/pI3vrsq8WSHsMK6sDIudcYKDHNf8uHG
	Dl1th+e22VhWAjRL0WLu4NG9m7LDJar0qM+zVrX9dRjtLyGM9lckfLkS
X-Gm-Gg: ASbGncvPt6Mw0kNemxvwtgx5yGpVC7qiVP1DiPxVXwVYu7NTwl/IdHduDI/GEqEz9YH
	nOoraQosl6OScj1h4Qhc+MNJLrhkZcFxHBM7mwOJzzPbPyVS4o7ElAB/Qrbn1jExouehWceIX58
	ATYNVJYrQD71OAAKi04Z74RD0mndcj4adg8WBsf0dhTpbx3n9hgfUHwk/+WE8PWUmz/lry3Q2H5
	Bp7to7CdXLLST2OnW8jmDHcK1oe1ZT3i3L6ZZ/96zhED7TIxXUXCPpWnF2u5iJwQr1LJ4HfICE4
	f3YIxJXp8uUgQYWi3gBqyIfLDwqCoTUAEZVUkwAhUft97ND95kfpjD/xRpP9RJXQILzE5eI87SK
	24f135HNp/SDM7xHE0p+xkn3An5Qi
X-Google-Smtp-Source: AGHT+IH2g67FKl5Ss4FX0QBC4tL2LXDPhFaEQPcQJWbHc0FwMHy9whqZBWSEtQi4JTvV5r53QIeSPA==
X-Received: by 2002:a05:651c:f19:b0:32d:fd8c:7e76 with SMTP id 38308e7fff4ca-330dfd2d969mr3521411fa.7.1753290684563;
        Wed, 23 Jul 2025 10:11:24 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91d9eaasm19869811fa.85.2025.07.23.10.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:11:23 -0700 (PDT)
Message-ID: <4dd38293-4307-474f-8eb7-0e83f5d3b996@gmail.com>
Date: Wed, 23 Jul 2025 19:10:59 +0200
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
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <20250717142732.292822-9-snovitoll@gmail.com>
 <85de2e1f-a787-4862-87e4-2681e749cef0@gmail.com>
 <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxiD98BLmEmPhkJQgv297bP_7qw+Vm_icFhTiDYN7WvLjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/22/25 4:17 PM, Sabyrzhan Tasbolatov wrote:
> On Tue, Jul 22, 2025 at 4:00 AM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>>> UserMode Linux needs deferred KASAN initialization as it has a custom
>>> kasan_arch_is_ready() implementation that tracks shadow memory readiness
>>> via the kasan_um_is_ready flag.
>>>
>>> Select ARCH_DEFER_KASAN to enable the unified static key mechanism
>>> for runtime KASAN control. Call kasan_init_generic() which handles
>>> Generic KASAN initialization and enables the static key.
>>>
>>> Delete the key kasan_um_is_ready in favor of the unified kasan_enabled()
>>> interface.
>>>
>>> Note that kasan_init_generic has __init macro, which is called by
>>> kasan_init() which is not marked with __init in arch/um code.
>>>
>>> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
>>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
>>> ---
>>> Changes in v3:
>>> - Added CONFIG_ARCH_DEFER_KASAN selection for proper runtime control
>>> ---
>>>  arch/um/Kconfig             | 1 +
>>>  arch/um/include/asm/kasan.h | 5 -----
>>>  arch/um/kernel/mem.c        | 4 ++--
>>>  3 files changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
>>> index f08e8a7fac9..fd6d78bba52 100644
>>> --- a/arch/um/Kconfig
>>> +++ b/arch/um/Kconfig
>>> @@ -8,6 +8,7 @@ config UML
>>>       select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>>>       select ARCH_HAS_CPU_FINALIZE_INIT
>>>       select ARCH_HAS_FORTIFY_SOURCE
>>> +     select ARCH_DEFER_KASAN
>>>       select ARCH_HAS_GCOV_PROFILE_ALL
>>>       select ARCH_HAS_KCOV
>>>       select ARCH_HAS_STRNCPY_FROM_USER
>>> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
>>> index f97bb1f7b85..81bcdc0f962 100644
>>> --- a/arch/um/include/asm/kasan.h
>>> +++ b/arch/um/include/asm/kasan.h
>>> @@ -24,11 +24,6 @@
>>>
>>>  #ifdef CONFIG_KASAN
>>>  void kasan_init(void);
>>> -extern int kasan_um_is_ready;
>>> -
>>> -#ifdef CONFIG_STATIC_LINK
>>> -#define kasan_arch_is_ready() (kasan_um_is_ready)
>>> -#endif
>>>  #else
>>>  static inline void kasan_init(void) { }
>>>  #endif /* CONFIG_KASAN */
>>> diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
>>> index 76bec7de81b..058cb70e330 100644
>>> --- a/arch/um/kernel/mem.c
>>> +++ b/arch/um/kernel/mem.c
>>> @@ -21,9 +21,9 @@
>>>  #include <os.h>
>>>  #include <um_malloc.h>
>>>  #include <linux/sched/task.h>
>>> +#include <linux/kasan.h>
>>>
>>>  #ifdef CONFIG_KASAN
>>> -int kasan_um_is_ready;
>>>  void kasan_init(void)
>>>  {
>>>       /*
>>> @@ -32,7 +32,7 @@ void kasan_init(void)
>>>        */
>>>       kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
>>>       init_task.kasan_depth = 0;
>>> -     kasan_um_is_ready = true;
>>> +     kasan_init_generic();
>>
>> I think this runs before jump_label_init(), and static keys shouldn't be switched before that.>  }
> 
> I got the warning in my local compilation and from kernel CI [1].
> 
> arch/um places kasan_init() in own `.kasan_init` section, while
> kasan_init_generic() is called from __init.

No, kasan_init() is in text section as the warning says. It's kasan_init_ptr in .kasan_init.
Adding __init to kasan_init() should fix the warning.


> Could you suggest a way how I can verify the functions call order?
> 

By code inspection? or run uder gdb.

kasan_init() is initialization routine called before main().
jump_label_init() called from start_kernel()<-start_kernel_proc()<-... main()

> I need to familiarize myself with how to run arch/um locally 

It's as simple as:
ARCH=um  make 
./linux rootfstype=hostfs ro init=/bin/bash


