Return-Path: <linuxppc-dev+bounces-7187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F066DA679C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 17:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHHcb4xBRz2yrm;
	Wed, 19 Mar 2025 03:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742315983;
	cv=none; b=FMM84Hx+XpzI70GJymFostIcz5YJNM/SZAwDeTS7iUlvOd6+ZcLQXmVKcQVXytizTCF+ZW8LINEz0s8Nxd7xTNV0rjldDG56dDoAdUqx2CxhSCZe4VolUhZ4Dw6dWsBC6f3uq/P7VgCakMhhOqEG8dndIOYFryb1T2EpnsMfegFe503EkkjBCRx88VA9atryUaXKt2W0w4jSIo+T8PG1Q73PaYnB5bOzY65oLrEmheP7TkxxuvfHmnCG8Lzc0JwJhLg1SZ8Z/IlZHc/+uoUwFI46CYuWsz3VVax0NAySsgP5Tupb1dD3zgY4s/+992cbXIZ8RuI6Soe40ect/3ItPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742315983; c=relaxed/relaxed;
	bh=0OMo6kY73E1DUQ5n4WQl1+v1FiQJTXExWUjOORF3Lm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NkSxbv4GnkFG/ZOK4A8R8ztGeaA5HHE9bfv7NGsy0DdNusQbVqWIGZjH7WmsNJIBmoNgdgcaliiHokpIdnJ55eL44Aj4gauKHa8EntDrJPvSEeS5H+H2Ne4A9tcrnwNQ0E3/7x227RcF6HGXPyDumCCwY47s9x5oQPxM+XYZu3wgGNcKrEsiocE5k3Ev4+UdJEz6xZRDh2dn2u/GdFyY3kfWzE6WCQ04V3d/PeF1YoJhcFibqzgCfZx6bxSec42xi29X2kayN7MIdbSfT54ATv6xzczVD6zi/GJoJ7XR9Nrwf+UVJGaCrXJ9covV+RXa7ZgILTEFMTZGBKHpRONNkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+ncaTLA; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+ncaTLA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHHcY6H3lz2yKs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 03:39:41 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-226185948ffso48435805ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 09:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742315979; x=1742920779; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=0OMo6kY73E1DUQ5n4WQl1+v1FiQJTXExWUjOORF3Lm0=;
        b=m+ncaTLAYrDsIs7pyyq+bvHvM/fD1AT+sE3M3Qy3HGltvYkykIrg1d+DkYiDCjekG2
         6+N3/L/Vs7WRMBsETkvmwOtNH/n8LWBw7r6O5JI4roJDD5ugExTikA1y2HJwWcL7fvHn
         62ivewZRFA7GLpPE/7/079ypxnzPrYr/2EAh4TEyLmBT8DxqDmltTPnQf9wshhpdeGHC
         I6MWntVL3AqLEcBMSKRnQJmEb+SM5PZLcNoprNfbAWErToAzu6au964z3TTZvux6wW20
         YvamQqIPZRFk6/Nil8pFBPOcon6QmhziFEn7P3j+zDR3DkDVP03g8y1XlgfsnWlBdrMt
         jUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315979; x=1742920779;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OMo6kY73E1DUQ5n4WQl1+v1FiQJTXExWUjOORF3Lm0=;
        b=DC2bJPQaRAN/ORofZhVvIJMbe2WcfCRLZnL3NZf4r6KrQdYWnKoRxEklCjMhVVztrY
         PQn7s6uQT+0PJtKEGpdcFLrklBTpcv1b+xkHXHacHGhZTtNM10tWVG71siMoO13F6JZP
         DjHlpGvfKqAtAL+kCU1QN/dLj8yAjRPZ1f2HJ8UISngf0X/ZhTiYnXSHl1CGWFfn6AEp
         U7LF01UAv6X2arwhAYy6VjlUbMh22ETbtTZzrtNGVE02UV/4LNQLjy0LxZBukblWySUl
         ZBWtubW9KQO2WU1gyDNgY2uWzExezVKL+qn7ar5hlp401PvmSwVmuweaOgIunXnvzIaz
         Pvhg==
X-Forwarded-Encrypted: i=1; AJvYcCXp3vhcGV9lbrj+VMn3forKxsXsDcP21Cbjxc4PJUN+eEzX7V8qiT5Gb+nhj89Ht6nTUpc9MzHa/FfHDXk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YydB9QXMIeKabICMtpClXi/59gXZSu5oQnCuWejHk5p/j/ggrbm
	sdndFZMu3a6wnRy5REmJGlbb9sVfWnyhRwMg0GeeFllwoHPn7X59
X-Gm-Gg: ASbGncuJRZcbLS6poA9EO0EQNEdx4wx04Jp+hgq5pchX2RWcfE2SdTT6cmWHpKyjZRG
	A7MI7LIraYIUWBMqpmWdQWLlT0cPvJOg+PQneMwiqWwqGD5h1bKvfWvunn/TtEwSDrXVFc16gHk
	pDkw2tOaqcPx1c20uhVnqJQYEVByQoYgqmoGA3Nx0fP4eku9g5P7bdcMTzGY1rXrwV2By2W7SXF
	qvpc+HBmgWI0po+5/lsTy4k3t0psU3goAmvxcvicO9Z+Bc4O2ofvvxapN+SUdsH3Z10FTiSODoT
	b6hU98KyVkPfCWcdNlVV5NJMDErWc2QIw/Qltfov6tsF3s3la37+4bsdvi8k5cSAKhtKhDTb1l7
	2+s4BLIZu0XBDs1jJ0g==
X-Google-Smtp-Source: AGHT+IGE5m6c7zPdMBD4x7LWCETtpVBn2q4Mh4LJo0JYKNyDmFsLhMqkHIw+PJnwPR3g3D5sK0aeCQ==
X-Received: by 2002:a17:902:ea0c:b0:223:3bf6:7e6a with SMTP id d9443c01a7336-2262c5383e0mr62696385ad.12.1742315979380;
        Tue, 18 Mar 2025 09:39:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68aa906sm97145285ad.88.2025.03.18.09.39.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 09:39:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <17a383b4-2add-4e74-b7ca-d7ef2baac4f9@roeck-us.net>
Date: Tue, 18 Mar 2025 09:39:35 -0700
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/14] arm64: Add support for suppressing warning
 backtraces
To: Will Deacon <will@kernel.org>, Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Kees Cook <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>,
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard
 <mripard@kernel.org>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alessandro Carminati <alessandro.carminati@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Linux Kernel Functional Testing <lkft@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-8-acarmina@redhat.com>
 <20250313122503.GA7438@willie-the-truck>
 <CAGegRW5r3V2-_44-X353vS-GZwDYG=SVwc6MzSGE8GdFQuFoKA@mail.gmail.com>
 <20250318155946.GC13829@willie-the-truck>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250318155946.GC13829@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/18/25 08:59, Will Deacon wrote:
> On Thu, Mar 13, 2025 at 05:40:59PM +0100, Alessandro Carminati wrote:
>> On Thu, Mar 13, 2025 at 1:25 PM Will Deacon <will@kernel.org> wrote:
>>>
>>> On Thu, Mar 13, 2025 at 11:43:22AM +0000, Alessandro Carminati wrote:
>>>> diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
>>>> index 28be048db3f6..044c5e24a17d 100644
>>>> --- a/arch/arm64/include/asm/bug.h
>>>> +++ b/arch/arm64/include/asm/bug.h
>>>> @@ -11,8 +11,14 @@
>>>>
>>>>   #include <asm/asm-bug.h>
>>>>
>>>> +#ifdef HAVE_BUG_FUNCTION
>>>> +# define __BUG_FUNC  __func__
>>>> +#else
>>>> +# define __BUG_FUNC  NULL
>>>> +#endif
>>>> +
>>>>   #define __BUG_FLAGS(flags)                           \
>>>> -     asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
>>>> +     asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
>>>
>>> Why is 'i' the right asm constraint to use here? It seems a bit odd to
>>> use that for a pointer.
>>
>> I received this code as legacy from a previous version.
>> In my review, I considered the case when HAVE_BUG_FUNCTION is defined:
>> Here, __BUG_FUNC is defined as __func__, which is the name of the
>> current function as a string literal.
>> Using the constraint "i" seems appropriate to me in this case.
>>
>> However, when HAVE_BUG_FUNCTION is not defined:
>> __BUG_FUNC is defined as NULL. Initially, I considered it literal 0,
>> but after investigating your concern, I found:
>>
>> ```
>> $ echo -E "#include <stdio.h>\n#include <stddef.h>\nint main()
>> {\nreturn 0;\n}" | aarch64-linux-gnu-gcc -E -dM - | grep NULL
>> #define NULL ((void *)0)
>> ```
>>
>> I realized that NULL is actually a pointer that is not a link time
>> symbol, and using the "i" constraint with NULL may result in undefined
>> behavior.
>>
>> Would the following alternative definition for __BUG_FUNC be more convincing?
>>
>> ```
>> #ifdef HAVE_BUG_FUNCTION
>>      #define __BUG_FUNC __func__
>> #else
>>      #define __BUG_FUNC (uintptr_t)0
>> #endif
>> ```
>> Let me know your thoughts.
> 
> Thanks for the analysis; I hadn't noticed this specific issue, it just
> smelled a bit fishy. Anyway, the diff above looks better, thanks.
> 

It has been a long time, but I seem to recall that I ran into trouble when
trying to use a different constraint.

Guenter


