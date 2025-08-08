Return-Path: <linuxppc-dev+bounces-10770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41395B1EDB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Aug 2025 19:20:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz9lp5n5Yz3bb6;
	Sat,  9 Aug 2025 03:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754673638;
	cv=none; b=JphDwpyt3ihqekzpF87kYJFF3DbXaqkWGFyVpzNXs7gp0XHyyOl1yvWUcE/F0Xro0UmIWFOW1Iy+g+EDxKn+0d/DFWpji/EaOG1sDEp/SRmdOk6tjiF7776HWJXsWv3vR4lvtmEk66Ug4nGs2Gv2fmWq6Bekk2OM9QoB5TnK3Sk40VLN4vXGd5+EHLgLXqcukFr1SPB+g3G9kBg8v1QOTog/Ql60sKm47okViFnlqk1VnxqWFnz+5uDyGNW++15xw1G0ep8YlX89Ac4JlSucBCCijQc3e+hofeyxDHfNsmbZKPyRLf8KnoSf3rC9j5hKf6IGUFE+sq17snw6coA/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754673638; c=relaxed/relaxed;
	bh=bro5Z1PL2eLig5Q2ncFtimJM/b9sdMd4TeRUxnnShL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5C3K5Q5JvwnhMOgaEKG+xbf9Q4qhpNRhDYzFC7AQc4hyly9ErxAoU2vnEV1s3A1Mkf1p05YXd0OGYqapVYjHgsGkXasdvry5yyKCLqaRcTh9QJkc47ORCQQiqzDJjEth8Ue2X+YzGuE6vtPT/ecQWuVvVdCjLww+V9C9m+x9koMwSwhKnFmPSSrPT+R0WZn07G0z5PtgrE6J8aSuB31QlTpqEdQWnU/2idk8j29lnrPo15hRiziNnXSydYqGv8WNxUCVlYOFPacSqs6nCAAfHVS9SpLkA2bzPys/fgEHlxmIeCUYE3rMRRP1J/b1xoor6oxXzavkd9zLL2dvnFxVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bz9ln74qsz2yLB
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Aug 2025 03:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4bz9NX4Hmyz9sSb;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LtEzBBocysS; Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4bz9NX36z3z9sSZ;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 55AF68B770;
	Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Z2c0fwWGRIPg; Fri,  8 Aug 2025 19:03:56 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 20F878B763;
	Fri,  8 Aug 2025 19:03:55 +0200 (CEST)
Message-ID: <af677847-e625-43d7-8750-b2ce4ba9626c@csgroup.eu>
Date: Fri, 8 Aug 2025 19:03:54 +0200
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
Subject: Re: [PATCH v5 1/2] kasan: introduce ARCH_DEFER_KASAN and unify static
 key across modes
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, bhe@redhat.com, hca@linux.ibm.com,
 andreyknvl@gmail.com, akpm@linux-foundation.org, zhangqing@loongson.cn,
 chenhuacai@loongson.cn, davidgow@google.co, glider@google.com,
 dvyukov@google.com, alex@ghiti.fr, agordeev@linux.ibm.com,
 vincenzo.frascino@arm.com, elver@google.com, kasan-dev@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250807194012.631367-1-snovitoll@gmail.com>
 <20250807194012.631367-2-snovitoll@gmail.com>
 <22872a3f-85dc-4740-b605-ba80b5a3b1bc@csgroup.eu>
 <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <CACzwLxjnofD0EsxrtgbG3svXHL+TpYcio4B67SCY9Mi3C-jdsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 08/08/2025 à 17:33, Sabyrzhan Tasbolatov a écrit :
> On Fri, Aug 8, 2025 at 10:03 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 07/08/2025 à 21:40, Sabyrzhan Tasbolatov a écrit :
>>> Introduce CONFIG_ARCH_DEFER_KASAN to identify architectures [1] that need
>>> to defer KASAN initialization until shadow memory is properly set up,
>>> and unify the static key infrastructure across all KASAN modes.
>>
>> That probably desserves more details, maybe copy in informations from
>> the top of cover letter.
>>
>> I think there should also be some exeplanations about
>> kasan_arch_is_ready() becoming kasan_enabled(), and also why
>> kasan_arch_is_ready() completely disappear from mm/kasan/common.c
>> without being replaced by kasan_enabled().
>>
>>>
>>> [1] PowerPC, UML, LoongArch selects ARCH_DEFER_KASAN.
>>>
>>> Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbugzilla.kernel.org%2Fshow_bug.cgi%3Fid%3D217049&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7Cfe4f5a759ad6452b047408ddd691024a%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638902640503259176%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=UM4uvQihJdeWwcC6DIiJXbn4wGsrijjRcHc55uCMErI%3D&reserved=0
>>> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
>>> ---
>>> Changes in v5:
>>> - Unified patches where arch (powerpc, UML, loongarch) selects
>>>     ARCH_DEFER_KASAN in the first patch not to break
>>>     bisectability
>>> - Removed kasan_arch_is_ready completely as there is no user
>>> - Removed __wrappers in v4, left only those where it's necessary
>>>     due to different implementations
>>>
>>> Changes in v4:
>>> - Fixed HW_TAGS static key functionality (was broken in v3)
>>> - Merged configuration and implementation for atomicity
>>> ---
>>>    arch/loongarch/Kconfig                 |  1 +
>>>    arch/loongarch/include/asm/kasan.h     |  7 ------
>>>    arch/loongarch/mm/kasan_init.c         |  8 +++----
>>>    arch/powerpc/Kconfig                   |  1 +
>>>    arch/powerpc/include/asm/kasan.h       | 12 ----------
>>>    arch/powerpc/mm/kasan/init_32.c        |  2 +-
>>>    arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
>>>    arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
>>>    arch/um/Kconfig                        |  1 +
>>>    arch/um/include/asm/kasan.h            |  5 ++--
>>>    arch/um/kernel/mem.c                   | 10 ++++++--
>>>    include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--------
>>>    include/linux/kasan.h                  |  6 +++++
>>>    lib/Kconfig.kasan                      |  8 +++++++
>>>    mm/kasan/common.c                      | 17 ++++++++++----
>>>    mm/kasan/generic.c                     | 19 +++++++++++----
>>>    mm/kasan/hw_tags.c                     |  9 +-------
>>>    mm/kasan/kasan.h                       |  8 ++++++-
>>>    mm/kasan/shadow.c                      | 12 +++++-----
>>>    mm/kasan/sw_tags.c                     |  1 +
>>>    mm/kasan/tags.c                        |  2 +-
>>>    21 files changed, 100 insertions(+), 69 deletions(-)
>>>
>>> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
>>> index f0abc38c40a..cd64b2bc12d 100644
>>> --- a/arch/loongarch/Kconfig
>>> +++ b/arch/loongarch/Kconfig
>>> @@ -9,6 +9,7 @@ config LOONGARCH
>>>        select ACPI_PPTT if ACPI
>>>        select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
>>>        select ARCH_BINFMT_ELF_STATE
>>> +     select ARCH_DEFER_KASAN if KASAN
>>
>> Instead of adding 'if KASAN' in all users, you could do in two steps:
>>
>> Add a symbol ARCH_NEEDS_DEFER_KASAN.
>>
>> +config ARCH_NEEDS_DEFER_KASAN
>> +       bool
>>
>> And then:
>>
>> +config ARCH_DEFER_KASAN
>> +       def_bool
>> +       depends on KASAN
>> +       depends on ARCH_DEFER_KASAN
>> +       help
>> +         Architectures should select this if they need to defer KASAN
>> +         initialization until shadow memory is properly set up. This
>> +         enables runtime control via static keys. Otherwise, KASAN uses
>> +         compile-time constants for better performance.
>>
> 
> Actually, I don't see the benefits from this option. Sorry, have just
> revisited this again.
> With the new symbol, arch (PowerPC, UML, LoongArch) still needs select
> 2 options:
> 
> select ARCH_NEEDS_DEFER_KASAN
> select ARCH_DEFER_KASAN

Sorry, my mistake, ARCH_DEFER_KASAN has to be 'def_bool y'. Missing the 
'y'. That way it is automatically set to 'y' as long as KASAN and 
ARCH_NEEDS_DEFER_KASAN are selected. Should be:

config ARCH_DEFER_KASAN
	def_bool y
	depends on KASAN
	depends on ARCH_NEEDS_DEFER_KASAN


> 
> and the oneline with `if` condition is cleaner.
> select ARCH_DEFER_KASAN if KASAN
> 

I don't think so because it requires all architectures to add 'if KASAN' 
which is not convenient.

Christophe

