Return-Path: <linuxppc-dev+bounces-13939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E72B5C40A20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 16:39:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d33CL4XjNz3bsC;
	Sat,  8 Nov 2025 02:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::429"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762529982;
	cv=none; b=LHqneQPDXkbpq2JrLNpz1uoEy30irRXx7tV5akgGpGYEK41/kjq8a3OayBrs8HHfrjFwJaj64KPJg6M9WvkFtl9XE8JZqHE6FqZ1qQ7sQxlf69uWbajCfVsEm/9dvcicNqPjESJXS2KDyoJ+wK93WNn4OQXmZCwnxo0rvdIrTKuDCyB7Xk0BJhGm+zJSgceLps0zsuxJ3mNknbt/HrWl19KXxtGAXb1PUjeM5CQXsbU94lJ8BqQKLV5ZG/fCi7Vu9qlf9HcWeuQGwaov+BMnIWkVujqJIUyPu22kRhMkN47Tm6HtMOa9yYkJ2S7CT8w0Jkd+Qs8Kq9z8tNIS8NqGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762529982; c=relaxed/relaxed;
	bh=rqga9mTz9tAuB6uG3BcapRUEnOv8wIK46KoDgIDUwSo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=CXhSTJdiZMCndcc9KZFs0KWQy7ViaWonbcUn7fSmpWAA1AUCgzJYE/0hZbtPbLbxziamqqQPaJLaBod6yzS2Us2YumYlG7ehNnETXvZJrwcrEpwJfG+AFL62N531uIbyz3evvJXay/1/eJFiYvQu71fvhtpIqAd8XkVRrI2cqpJIf1ANJroyObRcwNucJf1N0NHi3eepTngSKbsX4pDwNRxQdmPbKbZnvOSeIahY9tlVa0myXezTYhDJ6V0zjMgY6kFizhlOqsaIzDnkR3zQwx+refL1tUMSdPCn3bFIrZGKIpSRcj3x7pHHP2lH5jzDFm7tZ95jgzJhf00m25svig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wz+R21iv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wz+R21iv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d33CK1Hxrz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 02:39:40 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so837412b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 07:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762529978; x=1763134778; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqga9mTz9tAuB6uG3BcapRUEnOv8wIK46KoDgIDUwSo=;
        b=Wz+R21ivRgZdHDdF194cnG7bdg8A+LyfE6J123FSnOQLN6OogRXPUI+LzEroNv+aFg
         qnJRlShiWtz5j8k/WCMf/90oEHkBWpugsIhk1GPrGLXe/cQPdiPrc0TcF6sOSXBDS7W4
         uwHYT+bJX9+7IGnJeY+TJf3hof9awDTxRpYvOudSFfXo+mawAmYUBqejr5kSOxNTQZbh
         mueemMVe1kgzsX9KWfPW781ojhn3zzNBxU927UyvCzsIuF1+/W9b384KZhJrHeI9X1V+
         IfxKcP7fXdxzrZ0lnWdMo1T14uvYSuqzyDtQ1fYO0LE9Fg7vv2ZAMxmOIS5N3ErUv+ZL
         VLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529978; x=1763134778;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rqga9mTz9tAuB6uG3BcapRUEnOv8wIK46KoDgIDUwSo=;
        b=TBpvLzhldN3spwzILDBcNqXWp8fxFx9xP8JaYjyhY5/lAo9lyzZYerPQciVa+86iqX
         F6bXYdXakUfSuka8q5MF4C34ZGrbIb6GihvCb/oC7xeiQDa+x80cCO0u+syHKX+aSeQQ
         a1WeWUFbZ7vgg4b3WCW6msvuneVA8ZSo1nNboAST065vr62fIYtHqFaRdCOmT1PRwO57
         RLLl27R/owOA88jMfWr/N0nML4/zYCpjg17Ot//0F3AssVc+TvOthpwb0aAtdotE1Be/
         lHpA9VHecBTGg1sJ82CS4EvINE4mQLfVOmlytWryjoNNoS/lRwNEDDfkxxPGJJ01vgcC
         39SA==
X-Forwarded-Encrypted: i=1; AJvYcCVYxs2l11HB6u4JrJYHtRlAyOcC2TNiBeA2ek42dmHimnpFcX6RrsNQkL0aZngptXRCb9Ay+Xjuj+VcoCk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyYwYq0kzmSky8q8ilWNglmqSGdAf0VTgPpH7Ki5fRshmetBJKZ
	Ou1eKNpBvfhKcGzvfGDzDXIEdZj+Fjhvx32MVY7vzChHqZNACYVNrYeq
X-Gm-Gg: ASbGncsLGIxoYruZiFCv6sADv17ilWfz1SxqvazX53YuVY6LkSAkx0HynATdv2MH0rL
	9y+strkyyIOnviiFkpBU+3a+FwmDVS6az3jB9Lfgz+Zq0YBZ8+mBySrT66yG7+Mu6g64gTfUjNk
	+zs0krLaVexV0rPnn11zCrw/u5VlVzwCKc4FguQ8lgPmfUS1fcmxFpO4DBRAwvD9CXpekECwufj
	tn4XdIkLT/T33zUMBuvVL+7+t1hMKDiovWTkQiFKB0gyLBVuZMBaPGYDk5y0bbW9rUu2o7ol0tg
	ErmNm4zGQkj2obPAGipzNWBpPfME/BmAPHEyEGzYxRmxm+6DB2YkkUUXq9/EUZJaoXvZNnMOF8v
	W/SZZbxWc3eL+Ob3Uc0JOiSBqot46q6RRpAc4kinBg4SmkDZflTuba9mxWnUTKDauqQJIfdYWl8
	T3Snh7
X-Google-Smtp-Source: AGHT+IFd7FDqMbhzpvfwf3UUPVU5ECZ+YWWylnAUydZ2xe0dKAfvbdULKgbHSWRqZULtFHQr1EsJzw==
X-Received: by 2002:a05:6a21:e083:b0:341:cae2:c43b with SMTP id adf61e73a8af0-352b5c00f53mr3194717637.4.1762529977771;
        Fri, 07 Nov 2025 07:39:37 -0800 (PST)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ce9645sm5689749a12.10.2025.11.07.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:39:37 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "David Hildenbrand (Red Hat)" <david@kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Donet Tom <donettom@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
In-Reply-To: <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
Date: Fri, 07 Nov 2025 20:07:01 +0530
Message-ID: <87ecq952pe.ritesh.list@gmail.com>
References: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com> <dd634b17-cc5e-497c-8228-2470f6533177@redhat.com> <82ef1da8-44c4-4a58-bd00-9839548cb72d@csgroup.eu> <ba3a2131-c8d4-481d-aebb-d25be7ae0d19@kernel.org> <d62eea1f-3aff-4b51-976a-4cb8abf502bf@csgroup.eu>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 06/11/2025 à 16:02, David Hildenbrand (Red Hat) a écrit :
>>>> Yes, we discussed that in [1].
>>>>
>>>> We'll have to set ARCH_HAS_GIGANTIC_PAGE on ppc and increase
>>>> MAX_FOLIO_ORDER, because apparently, there might be ppc configs that
>>>> have even larger hugetlb sizes than PUDs.
>>>>
>>>> @Cristophe, I was under the impression that you would send a fix. Do you
>>>> want me to prepare something and send it out?
>>>
>>> Indeed I would have liked to better understand the implications of all
>>> this, but I didn't have the time.
>> 
>> Indeed, too me longer than it should to understand and make up my mind 
>> as well.
>> 
>>>
>>> By the way, you would describe the fix better than me so yes if you can
>>> prepare and send a fix please do.
>> 
>> I just crafted the following. I yet have to test it more, some early
>> feedback+testing would be appreciated!
>> 
>>  From 274928854644c49c92515f8675c090dba15a0db6 Mon Sep 17 00:00:00 2001
>> From: "David Hildenbrand (Red Hat)" <david@kernel.org>
>> Date: Thu, 6 Nov 2025 11:31:45 +0100
>> Subject: [PATCH] mm: fix MAX_FOLIO_ORDER on some ppc64 configs with hugetlb
>> 
>> In the past, CONFIG_ARCH_HAS_GIGANTIC_PAGE indicated that we support
>> runtime allocation of gigantic hugetlb folios. In the meantime it evolved
>> into a generic way for the architecture to state that it supports
>> gigantic hugetlb folios.
>> 
>> In commit fae7d834c43c ("mm: add __dump_folio()") we started using
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE to decide MAX_FOLIO_ORDER: whether we could
>> have folios larger than what the buddy can handle. In the context of
>> that commit, we started using MAX_FOLIO_ORDER to detect page corruptions
>> when dumping tail pages of folios. Before that commit, we assumed that
>> we cannot have folios larger than the highest buddy order, which was
>> obviously wrong.
>> 
>> In commit 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes
>> when registering hstate"), we used MAX_FOLIO_ORDER to detect
>> inconsistencies, and in fact, we found some now.
>> 
>> Powerpc allows for configs that can allocate gigantic folio during boot
>> (not at runtime), that do not set CONFIG_ARCH_HAS_GIGANTIC_PAGE and can
>> exceed PUD_ORDER.
>> 
>> To fix it, let's make powerpc select CONFIG_ARCH_HAS_GIGANTIC_PAGE for
>> all 64bit configs, and increase the maximum folio size to P4D_ORDER.
>> 
>> Ideally, we'd have a better way to obtain a maximum value. But this should
>> be good enough for now fix the issue and now mostly states "no real folio
>> size limit".
>> 
>> While at it, handle gigantic DAX folios more clearly: DAX can only
>> end up creating gigantic folios with HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
>> 
>> Add a new Kconfig option HAVE_GIGANTIC_FOLIOS to make both cases
>> clearer. In particular, worry about ARCH_HAS_GIGANTIC_PAGE only with
>> HUGETLB_PAGE.
>> 
>> Note: with enabling CONFIG_ARCH_HAS_GIGANTIC_PAGE on PPC64, we will now
>> also allow for runtime allocations of folios in some more powerpc configs.
>> I don't think this is a problem, but if it is we could handle it through
>> __HAVE_ARCH_GIGANTIC_PAGE_RUNTIME_SUPPORTED.
>> 
>> While __dump_page()/__dump_folio was also problematic (not handling dumping
>> of tail pages of such gigantic folios correctly), it doesn't relevant
>> critical enough to mark it as a fix.
>> 
>> Fixes: 7b4f21f5e038 ("mm/hugetlb: check for unreasonable folio sizes 
>> when registering hstate")
>> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>
>> ---
>>   arch/powerpc/Kconfig                   | 1 +
>>   arch/powerpc/platforms/Kconfig.cputype | 1 -
>>   include/linux/mm.h                     | 4 ++--
>>   include/linux/pgtable.h                | 1 +
>>   mm/Kconfig                             | 7 +++++++
>>   5 files changed, 11 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index e24f4d88885ae..55c3626c86273 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -137,6 +137,7 @@ config PPC
>>       select ARCH_HAS_DMA_OPS            if PPC64
>>       select ARCH_HAS_FORTIFY_SOURCE
>>       select ARCH_HAS_GCOV_PROFILE_ALL
>> +    select ARCH_HAS_GIGANTIC_PAGE        if PPC64


The patch looks good from PPC64 perspective, it also fixes the problem
reported on corenet64_smp_defconfig...

>
> Problem is not only on PPC64, it is on PPC32 as well, for instance 
> corenet32_smp_defconfig has the problem as well.
>

However on looking deeper into it - I agree with Christophe that this
problem might still exist on PPC32. 

I did try the patch on corenet32_smp_defconfig and I can see the WARN_ON
still triggering. You can check the logs here.. 

https://github.com/riteshharjani/linux-ci/actions/runs/19169468405/job/54799498288


>
> So I think what you want instead is:
>
> diff --git a/arch/powerpc/platforms/Kconfig.cputype 
> b/arch/powerpc/platforms/Kconfig.cputype
> index 7b527d18aa5ee..1f5a1e587740c 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -276,6 +276,7 @@ config PPC_E500
>          select FSL_EMB_PERFMON
>          bool
>          select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
> +       select ARCH_HAS_GIGANTIC_PAGE if ARCH_SUPPORTS_HUGETLBFS
>          select PPC_SMP_MUXED_IPI
>          select PPC_DOORBELL
>          select PPC_KUEP
>
>
>

@Christophe, 

I don't think even the above diff will fix the warning on PPC32. 
The patch defines MAX_FOLIO_ORDER as P4D_ORDER...

+#define MAX_FOLIO_ORDER        P4D_ORDER
+#define P4D_ORDER              (P4D_SHIFT - PAGE_SHIFT)

and for ppc32 in.. 
include/asm-generic/pgtable-nop4d.h
    #define P4D_SHIFT		PGDIR_SHIFT

Then in.. 
arch/powerpc/include/asm/nohash/32/pgtable.h
    #define PGDIR_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
    #define PTE_INDEX_SIZE	PTE_SHIFT

in...
arch/powerpc/include/asm/page_32.h
    #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2)	/* full page */

    #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)


So if you see from above P4D_ORDER is coming down to PTE_INDEX_SIZE 

IIUC, that will cause MAX_FOLIO_ORDER to be 9 in case of e500mc machine type right?

Can you please confirm if the above analysis looks correct to you?

-ritesh



>>       select ARCH_HAS_KCOV
>>       select ARCH_HAS_KERNEL_FPU_SUPPORT    if PPC64 && PPC_FPU
>>       select ARCH_HAS_MEMBARRIER_CALLBACKS
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/ 
>> platforms/Kconfig.cputype
>> index 7b527d18aa5ee..4c321a8ea8965 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -423,7 +423,6 @@ config PPC_64S_HASH_MMU
>>   config PPC_RADIX_MMU
>>       bool "Radix MMU Support"
>>       depends on PPC_BOOK3S_64
>> -    select ARCH_HAS_GIGANTIC_PAGE
>
> Should remain I think.
>
>>       default y
>>       help
>>         Enable support for the Power ISA 3.0 Radix style MMU. Currently 
>> this
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index d16b33bacc32b..4842edc875185 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -2074,7 +2074,7 @@ static inline unsigned long folio_nr_pages(const 
>> struct folio *folio)
>>       return folio_large_nr_pages(folio);
>>   }
>> 
>> -#if !defined(CONFIG_ARCH_HAS_GIGANTIC_PAGE)
>> +#if !defined(CONFIG_HAVE_GIGANTIC_FOLIOS)
>>   /*
>>    * We don't expect any folios that exceed buddy sizes (and consequently
>>    * memory sections).
>> @@ -2092,7 +2092,7 @@ static inline unsigned long folio_nr_pages(const 
>> struct folio *folio)
>>    * There is no real limit on the folio size. We limit them to the 
>> maximum we
>>    * currently expect (e.g., hugetlb, dax).
>>    */
>> -#define MAX_FOLIO_ORDER        PUD_ORDER
>> +#define MAX_FOLIO_ORDER        P4D_ORDER
>>   #endif
>> 
>>   #define MAX_FOLIO_NR_PAGES    (1UL << MAX_FOLIO_ORDER)
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 32e8457ad5352..09fc3c2ba39e2 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -7,6 +7,7 @@
>> 
>>   #define PMD_ORDER    (PMD_SHIFT - PAGE_SHIFT)
>>   #define PUD_ORDER    (PUD_SHIFT - PAGE_SHIFT)
>> +#define P4D_ORDER    (P4D_SHIFT - PAGE_SHIFT)
>> 
>>   #ifndef __ASSEMBLY__
>>   #ifdef CONFIG_MMU
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 0e26f4fc8717b..ca3f146bc7053 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -908,6 +908,13 @@ config PAGE_MAPCOUNT
>>   config PGTABLE_HAS_HUGE_LEAVES
>>       def_bool TRANSPARENT_HUGEPAGE || HUGETLB_PAGE
>> 
>> +#
>> +# We can end up creating gigantic folio.
>> +#
>> +config HAVE_GIGANTIC_FOLIOS
>> +    def_bool (HUGETLB_PAGE && ARCH_HAS_GIGANTIC_PAGE) || \
>> +         (ZONE_DEVICE && HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
>> +
>>   # TODO: Allow to be enabled without THP
>>   config ARCH_SUPPORTS_HUGE_PFNMAP
>>       def_bool n

