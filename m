Return-Path: <linuxppc-dev+bounces-1009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBFE96C677
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 20:31:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzWK41LTKz2xtK;
	Thu,  5 Sep 2024 04:31:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725474664;
	cv=none; b=mkSQSwQl/PWemxvGa3XzPYosKgk+q836C3dqACLtonI0CSYOA8YHq56803WxRNvvkQe4y6e0PGkmwBzUXIBdJ4YETDgSvs9Z4VhtnyERN8JMGUFhWdMjFDoLdRppMI0pB3XlFO8qlBSiQk4Th3n6EdyDyv56xu/K3a02lAOWNxJaMi4YhUDdtXKu/WgySfTeXT8wbZFFmxh5CHLzdbT7VVwq9pBoCMa0EUFqochB4YKtOkeUSiv4LZX6laNeUgmwXZ6Th1M3ZM6hDUbyIotAwhAnjlyCJUP590u2elHUq9J0r6wQ2mwvZm5Lh1wrviIEfPH0gXcOr9Aw3JK7b6R+YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725474664; c=relaxed/relaxed;
	bh=oQA1j/vyOiYGDZLLl2f9HVBR0MU2RF4wR2B6TuQXkgg=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:Date:Message-ID:
	 References:MIME-version:Content-type; b=NEHhpC14ByGf7vE1pAl+sKlLP4josLN0j7dvZhhJvETLeOwIgMX3XizgSEHi1orT8yziKlf0iPllq7gsqa+k/P/3aguuLmQHm98+Pdqwn9Wf/aKErmBaZxpf3ufqfUisi9ET5ec44tfUJDnGZZxQQaQkAkk0BEZkeE8h83jyK6KycdGNS4sRGP7BdpDfBfbY/iLeZKPoSo0eCcZbJ56rBB31mEf8lEoZZ3NeUC7NJvSuGTI/WG8+lkPicott0ujRxV2p56vvrlpc6nvmnX/6NFyY6N43dHVTptwret8uxcy9gEwvlQOyT3bKvdgvw0y5W0Q9iAwEvdwOeMv40zSlQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T3bfQAMy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T3bfQAMy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzWK32dS7z2xYr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 04:31:02 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71434174201so5659283b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 11:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725474658; x=1726079458; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQA1j/vyOiYGDZLLl2f9HVBR0MU2RF4wR2B6TuQXkgg=;
        b=T3bfQAMy99TYuu8rzf6di57IA0TRH5T/FLtIpJtrDnH7rW6pj3xQ2Xw4OLeqAVki4+
         sSQkNlQIEi0mvoNX/G8Lhtu/0punZt2sFCF+ibSG0Y1dqMyNHR8Uofb8z/FkYJcXBdsI
         j0zMwTX66GR6I1zwlYvl3kQEqx3ybDnS59nWmj1479/mAPQUjGftFe66Rcz0N/zkHLCH
         B0b2gl0FPfdomWHUdQIuNMFSH3iBY5xUSIEd+Vohvum3A+8qPWK5Xe+0UbJ15ZrAKhnz
         A0NmFNdG7iJx+wb9Ru2TzSB3IWcwdmGtDnLibITN1vtO0fpLTEtK44bq5otEhsk2D19W
         Dunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474658; x=1726079458;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQA1j/vyOiYGDZLLl2f9HVBR0MU2RF4wR2B6TuQXkgg=;
        b=UEJVYSGnlC8JXyRxVAG3JAfmDpW+SREhElC/nRhBUzByCCZWontthMvbYCY5EY9Mh6
         93PvvrmHCdyDy+SpV7qnZUhRKSZ6nchyvd08wUqYG6+8BR75pXgaSi660lEju43832OS
         2YutMMxxv7NGUhK9lvMAp36dXpZ21aJbWzawtCLR8Ps3Kyvd9QlvIqJgfD5FX8HSK+t8
         Cj0iZeiwMLmDIx1ffg9q98IBLFxDKgdwA9lQw+ZyuMt3SFQ7L4q7NBLQl6B4zb0zv52H
         x9nEDF1JWqYN/Yd8tlvX5UFQXakXUqFpkGinp6xutEkAvw0hZaXJZ/oz0AJSEXwlkHuK
         nsYw==
X-Forwarded-Encrypted: i=1; AJvYcCX4lZp17YJjmppOKg9ZfMZLaLNJPewrOn5LGZSidgLTKAuBcngBXhOmXIS6fUPtPemJoZKs/CgRYug1D/s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwDt3BCojq5eqOEt8Z6LRsfJzbz6nVng/xFTSzfhuo2aDNE+vmE
	mKnMQ71CgAZTJQ/brIRqtS+syixuAFrF3pU4PUhax6JAIVW3WXjI
X-Google-Smtp-Source: AGHT+IHZcT63E7cWHqijv03WrUy8adVUctQaEhU8KzN5Y2oA6KO+/giMLtwjUwbqus8F3YDBq4CovA==
X-Received: by 2002:a05:6a21:3a82:b0:1cc:e969:a772 with SMTP id adf61e73a8af0-1cecf4dbd91mr18000347637.20.1725474658341;
        Wed, 04 Sep 2024 11:30:58 -0700 (PDT)
Received: from dw-tp ([171.76.86.74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785a940dsm1924527b3a.186.2024.09.04.11.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 11:30:57 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Subject: Re: [RFC v1 01/10] book3s64/hash: Remove kfence support temporarily
In-Reply-To: <898f4c98-f72a-4ade-b5c6-8efaa852da4d@csgroup.eu>
Date: Wed, 04 Sep 2024 23:57:54 +0530
Message-ID: <87bk132s0l.fsf@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com> <b6a09a2f5495b144048929280a11338a2e70ba33.1722408881.git.ritesh.list@gmail.com> <898f4c98-f72a-4ade-b5c6-8efaa852da4d@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit


Sorry for the delayed response. Was pulled into something else.

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 31/07/2024 à 09:56, Ritesh Harjani (IBM) a écrit :
>> [Vous ne recevez pas souvent de courriers de ritesh.list@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>> 
>> Kfence on book3s Hash on pseries is anyways broken. It fails to boot
>> due to RMA size limitation. That is because, kfence with Hash uses
>> debug_pagealloc infrastructure. debug_pagealloc allocates linear map
>> for entire dram size instead of just kfence relevant objects.
>> This means for 16TB of DRAM it will require (16TB >> PAGE_SHIFT)
>> which is 256MB which is half of RMA region on P8.
>> crash kernel reserves 256MB and we also need 2048 * 16KB * 3 for
>> emergency stack and some more for paca allocations.
>> That means there is not enough memory for reserving the full linear map
>> in the RMA region, if the DRAM size is too big (>=16TB)
>> (The issue is seen above 8TB with crash kernel 256 MB reservation).
>> 
>> Now Kfence does not require linear memory map for entire DRAM.
>> It only needs for kfence objects. So this patch temporarily removes the
>> kfence functionality since debug_pagealloc code needs some refactoring.
>> We will bring in kfence on Hash support in later patches.
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/include/asm/kfence.h     |  5 +++++
>>   arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++++++-----
>>   2 files changed, 16 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
>> index fab124ada1c7..f3a9476a71b3 100644
>> --- a/arch/powerpc/include/asm/kfence.h
>> +++ b/arch/powerpc/include/asm/kfence.h
>> @@ -10,6 +10,7 @@
>> 
>>   #include <linux/mm.h>
>>   #include <asm/pgtable.h>
>> +#include <asm/mmu.h>
>> 
>>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>>   #define ARCH_FUNC_PREFIX "."
>> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
>> 
>>   static inline bool arch_kfence_init_pool(void)
>>   {
>> +#ifdef CONFIG_PPC64
>> +       if (!radix_enabled())
>> +               return false;
>> +#endif
>
> Avoid #ifdefs whenever possible. Here you can do:
>
> 	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled())
> 		return false;
>

Sure. I will change it.

>>          return !kfence_disabled;
>>   }
>>   #endif
>> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
>> index 01c3b4b65241..1a1b50735fa0 100644
>> --- a/arch/powerpc/mm/book3s64/hash_utils.c
>> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
>> @@ -431,7 +431,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
>>                          break;
>> 
>>                  cond_resched();
>> -               if (debug_pagealloc_enabled_or_kfence() &&
>> +               if (debug_pagealloc_enabled() &&
>>                          (paddr >> PAGE_SHIFT) < linear_map_hash_count)
>>                          linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
>>          }
>> @@ -814,7 +814,7 @@ static void __init htab_init_page_sizes(void)
>>          bool aligned = true;
>>          init_hpte_page_sizes();
>> 
>> -       if (!debug_pagealloc_enabled_or_kfence()) {
>> +       if (!debug_pagealloc_enabled()) {
>>                  /*
>>                   * Pick a size for the linear mapping. Currently, we only
>>                   * support 16M, 1M and 4K which is the default
>> @@ -1134,7 +1134,7 @@ static void __init htab_initialize(void)
>> 
>>          prot = pgprot_val(PAGE_KERNEL);
>> 
>> -       if (debug_pagealloc_enabled_or_kfence()) {
>> +       if (debug_pagealloc_enabled()) {
>>                  linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
>>                  linear_map_hash_slots = memblock_alloc_try_nid(
>>                                  linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
>> @@ -2117,7 +2117,7 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
>>          }
>>   }
>> 
>> -#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
>> +#if defined(CONFIG_DEBUG_PAGEALLOC)
>
> Use #ifdef
>

Sure. Thanks!

-ritesh

