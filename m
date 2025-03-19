Return-Path: <linuxppc-dev+bounces-7198-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C621BA68691
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 09:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHhTk4dMCz2yb9;
	Wed, 19 Mar 2025 19:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742372410;
	cv=none; b=bxQfDdneVIWhU0yxQfJGtxTSs31ix0MJgt/Rwjoxu7KQpr04Ceo+FKKlIPSxueUbQrIAx1P0dZKeYV8sjuZliKFNcL55/CaOOJl8Fkg2T+jgXyjdb5FVZ4nyflxmdmh1Zl35K5u6+bJrXPXcIW7UZOTRJyn2ohpurVZFp0IQxW54IczxcqYqUye8U5WWsFMCW3BaF7eZbhfTJkvpUm4UdjSZsp42trHgM8zG/6q18rEex5C1H0vlz3KDLsnOXnXaUQIBAatNW+OVGY50RtjtPCdg1s9YwoC/1Mm0L+E4P5iutQ5K38zlaO9BOC9DzbdvwEdGogLdrBWi6KnkGayyyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742372410; c=relaxed/relaxed;
	bh=EGvv/fcUS2VuLz6KwWEv9sjhT8Q/k6JOKTd2dHVAKc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=odsfv2VgsOq20TQEPuu6fvHf4wcEpS0T2DvQRkS7ahw/+uMipP+fnDM7rYQSdZiYYaxtu/MEEytlc7ifvcFw6pyQ+cSGz1qd/icnExf3OUPZk4hzOSzf1vPgHvNk+rRsYvZPqEjgqF7ONnwtgGOn9SoGLWkyDfrrXvp7fpu26xpmp3uiZukx6kPidbCptH5sBxmCjEuNID0a8mac9f+aMy8Wks/FVwguMu2kT+NmQg3ktOBnhdu5YXKofGJouGTMOyQcabJk3kl5ronN+ceCCH3B1LgY9xcKaRb+ByIdsw/x3puZYUshsrELK6nD3OUnjiNp/WTRKzXoSqYeSeyeew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHhTh1NhQz2ySb
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 19:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZHh8p3p47z9sSY;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Pdv_1f5SWZW; Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZHh8p2Mb8z9sSX;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2617E8B78F;
	Wed, 19 Mar 2025 09:05:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id K6S1MuFrSThd; Wed, 19 Mar 2025 09:05:30 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 585CB8B763;
	Wed, 19 Mar 2025 09:05:28 +0100 (CET)
Message-ID: <a64bf821-ea90-4fd9-92ec-13bf7b7a3067@csgroup.eu>
Date: Wed, 19 Mar 2025 09:05:27 +0100
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
 Thomas Zimmermann <tzimmermann@suse.de>, Guenter Roeck <linux@roeck-us.net>,
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
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250318155946.GC13829@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 18/03/2025 à 16:59, Will Deacon a écrit :
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

That propably deserves a comment.

Doesn't sparse and/or checkpatch complain about 0 being used in lieu of 
NULL ?

By the way I had similar problem in the past with GCC not seeing NULL as 
a __builtin_constant_p(), refer commit 1d8f739b07bd ("powerpc/kuap: Fix 
set direction in allow/prevent_user_access()")

Christophe

