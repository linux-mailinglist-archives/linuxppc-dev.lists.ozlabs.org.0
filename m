Return-Path: <linuxppc-dev+bounces-10385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EC5B0F91C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jul 2025 19:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnLnt3wY8z30QJ;
	Thu, 24 Jul 2025 03:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753292002;
	cv=none; b=BfcJ2duajvDfUG4Drksmm5I/2Y9KvmsMOLr2hLUTd9dYyAZxloQglWmaj9ZtNbHQc7hbtiLjaD+AlAOzIS4aVSd7vIWS42twJcuGhrpE2GLq9DkOkQLM+guEtf54ONJ67+JtV36WWzhKSHE3RhpGPwMe2w0t72h3TUOPsqq/Fvzn2SKyu7NPKdaxqQ0+w5qEH0io0p8WtjVOnSJA5nfcxiPwGxNOEWvmf0sRE2Ft9M+g/UI5mW57bnxJcOqUF2Ye90rVpqERdabPYvrjMxIe0M+sSJFWRuwz7+Itb8TcrZHRDh/I0Qa709zcZvobOmHdKkSenO5ngYxTK8rBWwyaRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753292002; c=relaxed/relaxed;
	bh=KBM3XOa1GXkPG7AU5j/kIOwYcdf4HqHkAm2pQZ3zu3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SlUdCMEE4a3cM3GKuKiNNcb67GdFJwtigk+dHjlAuEWNlrW0R4j/M5deRszDZcgfW7f2iaHA1NjuJNf7k418yOYeG1E2JdNwgVONjP7nDWWQjBVedRQUHrZLg4K52E5Tei+1JOQ5AXd0y3hPT6vKx9JdZex5RyW+zCEhFznTUYoITGRarzu+5CKrruqlOag42nG9kLUNWMRbORvVqxAOwgfaVdncYg5bGUvmrL5dxReDC+rPZXfXYSnm2/U60y/HqAun3uT/SGhhbuSMW+oQR3oPzLNiMIE5f78DksmpfOH3SycX/7ni2XIs3aWS2dXPnx4AxrX73KmlORrcRt/pUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M3c9L09R; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M3c9L09R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnLns3L8Vz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 03:33:20 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5550bb2787dso6629e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 10:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753291998; x=1753896798; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBM3XOa1GXkPG7AU5j/kIOwYcdf4HqHkAm2pQZ3zu3U=;
        b=M3c9L09RySppH1clAdL46QvfdmAh1Z8bkpi7VFTZP3TJ6rMsxEiZT8S+4NZ/zOe8Rc
         woeb7BRfyah1oQPMVZqRO6B8P+7IvHz4YZ+5T6dwQoIa5Qu2SEnWJmKHwhXF/kFBvYMJ
         25Ng6tGPzbLKmVbEi6t9Gc/xQ8RDQTqEN+EFjmqjB9BnP8EY3Tne/i8dZUk0Opcj+VhJ
         GP8z1zW5dHrWuBy4H0kQpq9+K1R1KQ57UGFSM+D1MTfWbMykYGCCB+rTPIToeNb3nY7M
         9qXRkUjxDSPv4o426nv2NdXPW4djdez2cC+Z/lkwYXxm8Zn5dtJg4Gfua5+kOcnJvVEc
         pHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753291998; x=1753896798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBM3XOa1GXkPG7AU5j/kIOwYcdf4HqHkAm2pQZ3zu3U=;
        b=I1DTD9IPa2WbexOEeV8XsggfQGiHALQyZZF04SsjSwrJ0A6c5v64E3RjYuQFZz8d2N
         ZHXghT91sRLGoxN5W98V1E47L5qACJD78BVwrzDqjpT5g9D/JqToLKiYsVHi/BmeDCeB
         9xavfMZv9KlHH72elknLbRcUyj0YNrlCEvPkxLfrrd5uEVFroJcsOeZUeWnRSpd9eBza
         SfpKwcRaaNAIFGIzJFQVfDJxU2Xy7ha7eqoyq70MSBBEjWVX5fivEVIWzZwSBgSS8Rub
         4oZDUTYdFzkLZlC8Q5c3mGE/knqK9Y8OUK9oKDl2wCgguQYueVR55iwmN0jpaaJrtdLM
         ++Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWlsADdwTjl/yrK9Dc+hIs4ikm9N5fh7Y4N/mEPfdZZ26PGZSw4jGg5wbg3hYN/E47jJE3WmXjVejQPpj4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmbFydXP8xnhH9ajxO+KtF0TdyXeJA2QSGFiQirwZcyT7K6f0W
	8ygOfSLz63lDP6/BcIvMfrPGzaRE09j6a9r4LPPvCVNIdFm+kumYyYMO
X-Gm-Gg: ASbGnctZkUNnQzQzAHfdIVqH1PVDd6qyu00XfC+tsOoDQmeEcqwerUeWSG1woxZaw3o
	GA48JB7f4KC9jDG4TFJuKCA+Vy4U53VNtjyoGd852EZvdh9X4Wf38Yho1a3bzVG2GWq6lMq5SDB
	rcDpW8fb9GKfNJlytNhPXAkUHkI+vlXkRTp3+GZQHeM4kSQXPIJM4e+3OxKk4pCKIYNA5oeb5kH
	vtSrnTLGY8hUQlvGmWlMA0N12/Z2MP9WQ5fpPqCRTbpWMR2wVk10LGPddogUEWmhPv7NUQ8xF0T
	KhplEodzqc1PHHIOFERZKS+QOauL2uIVVt55rcP7mN76swPplRX+FKKdxysDVvwwu3FYnkW2h1T
	I+cewS2D1UshJyZda6JML6jOIWzSXkU9ETplWfgw=
X-Google-Smtp-Source: AGHT+IEhfKgja72kmMEVu8mg+y0GPA2wBPQGXBF9w7fJkfAZVikcQ8zyKptW1cZk85GIYWtzdxftWQ==
X-Received: by 2002:a05:6512:3c8b:b0:553:24b4:6492 with SMTP id 2adb3069b0e04-55a5132157emr458860e87.5.1753291997236;
        Wed, 23 Jul 2025 10:33:17 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31aac980sm2396014e87.74.2025.07.23.10.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:33:16 -0700 (PDT)
Message-ID: <f7051d82-559f-420d-a766-6126ba2ed5ab@gmail.com>
Date: Wed, 23 Jul 2025 19:32:51 +0200
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
Subject: Re: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove
 arch-specific implementations
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: hca@linux.ibm.com, christophe.leroy@csgroup.eu, andreyknvl@gmail.com,
 agordeev@linux.ibm.com, akpm@linux-foundation.org, glider@google.com,
 dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250717142732.292822-1-snovitoll@gmail.com>
 <f10f3599-509d-4455-94a3-fcbeeffd8219@gmail.com>
 <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <CACzwLxjD0oXGGm2dkDdXjX0sxoNC2asQbjigkDWGCn48bitxSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/22/25 8:21 PM, Sabyrzhan Tasbolatov wrote:
> On Tue, Jul 22, 2025 at 3:59 AM Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:
>>
>>
>>
>> On 7/17/25 4:27 PM, Sabyrzhan Tasbolatov wrote:
>>
>>> === Testing with patches
>>>
>>> Testing in v3:
>>>
>>> - Compiled every affected arch with no errors:
>>>
>>> $ make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
>>>       OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>>>       HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
>>>       ARCH=$ARCH
>>>
>>> $ clang --version
>>> ClangBuiltLinux clang version 19.1.4
>>> Target: x86_64-unknown-linux-gnu
>>> Thread model: posix
>>>
>>> - make ARCH=um produces the warning during compiling:
>>>       MODPOST Module.symvers
>>>       WARNING: modpost: vmlinux: section mismatch in reference: \
>>>               kasan_init+0x43 (section: .ltext) -> \
>>>               kasan_init_generic (section: .init.text)
>>>
>>> AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
>>> is placed in own section ".kasan_init", which calls kasan_init_generic()
>>> which is marked with "__init".
>>>
>>> - Booting via qemu-system- and running KUnit tests:
>>>
>>> * arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
>>> * x86_64 (GENERIC): no regression, no errors
>>>
>>
>> It would be interesting to see whether ARCH_DEFER_KASAN=y arches work.
>> These series add static key into __asan_load*()/_store*() which are called
>> from everywhere, including the code patching static branches during the switch.
>>
>> I have suspicion that the code patching static branches during static key switch
>> might not be prepared to the fact the current CPU might try to execute this static
>> branch in the middle of switch.
> 
> AFAIU, you're referring to this function in mm/kasan/generic.c:
> 
> static __always_inline bool check_region_inline(const void *addr,
> 
>       size_t size, bool write,
> 
>       unsigned long ret_ip)
> {
>         if (!kasan_shadow_initialized())
>                 return true;
> ...
> }
> 
> and particularly, to architectures that selects ARCH_DEFER_KASAN=y, which are
> loongarch, powerpc, um. So when these arch try to enable the static key:
> 
> 1. static_branch_enable(&kasan_flag_enabled) called
> 2. Kernel patches code - changes jump instructions
> 3. Code patching involves memory writes
> 4. Memory writes can trigger any KASAN wrapper function
> 5. Wrapper calls kasan_shadow_initialized()
> 6. kasan_shadow_initialized() calls static_branch_likely(&kasan_flag_enabled)
> 7. This reads the static key being patched --- this is the potential issue?
> 


Yes, that's right.


> The current runtime check is following in tis v3 patch series:
> 
> #ifdef CONFIG_ARCH_DEFER_KASAN
> ...
> static __always_inline bool kasan_shadow_initialized(void)
> {
>         return static_branch_likely(&kasan_flag_enabled);
> }
> ...
> #endif
> 
> I wonder, if I should add some protection only for KASAN_GENERIC,
> where check_region_inline() is called (or for all KASAN modes?):
> 
> #ifdef CONFIG_ARCH_DEFER_KASAN
> ...
> static __always_inline bool kasan_shadow_initialized(void)
> {
>         /* Avoid recursion (?) during static key patching */
>         if (static_key_count(&kasan_flag_enabled.key) < 0)
>                 return false;
>         return static_branch_likely(&kasan_flag_enabled);
> }
> ...
> #endif
> 
> Please suggest where the issue is and if I understood the problem.

I don't know if it's a real problem or not. I'm just pointing out that we might
have tricky use case here and maybe that's a problem, because nobody had such use
case in mind. But maybe it's just fine.
I think we just need to boot test it, to see if this works.

> I might try to run QEMU on powerpc with KUnits to see if I see any logs.
powerpc used static key same way before your patches, so powerpc should be fine.

