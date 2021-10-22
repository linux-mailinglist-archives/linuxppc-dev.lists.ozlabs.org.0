Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47614374FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:45:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbKG62JRkz3cW5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=awf6I8Bs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=awf6I8Bs; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbKFS0g3Rz307B
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:44:43 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id q187so2842287pgq.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=6HQC/PAKn97DXZaXH1VIWSSg6c2VzJyGRDKtaHFULbI=;
 b=awf6I8BsmNPG2+UM/mjyvtXP0cpxcXlBTYqa9WYdMax7zDAo3XC4HQj+8YHOhDDOmO
 eNkS4zgUY1umY0WpAFDaEw/7+LH1XTEEjNdkjRBUkO3i6zmDheuaGIoEhibLgvrq5PmG
 r3u4/Vn5aVdkKxVhKqeTCaTVsgLhYgNN3Bp4EFaaPU34oGQV/z31GLc3WZTtGdMsbDqz
 azadQ99kze8Wcsvxedr3zOVF1912bixSqsDqTG91aL3XO3vgowt2YcWQXpL6txyeCysQ
 WPKgmYN7fuYHypa8T7L++uq8yW9u8c3gTKdvsTmMBzyaYk4VjKCk3W/AFFbQUJcxUz0m
 tlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=6HQC/PAKn97DXZaXH1VIWSSg6c2VzJyGRDKtaHFULbI=;
 b=vc3/HK0DMZ3JH0FiVdfy6N1JYQbMoXInglYLWDrhnECQjAy9kB4uD4cC15Akty7OW7
 8VZtmDQcsJTl9YZH0HOTAZRydYlCJ36lxk6f+NUNCabsDpLEQda31pEdBc9KkxKegGkV
 HbNF3n88aI4gE69OjHsMARe3rwgyDikcWR3C+T29tBMwXhA90b/IoW7SYHlBWiDjRT8A
 IIT5FDAsdX3UuJHpbX4cWQQIIh9CqLwh4cknobtY0ZUN+YpB8jBCWvRz1J/gjYyxRQJB
 FbvkP0+UuphNXhoLZ+L+kxq0jJz72XXItRTcaLdAmRY79sgrDsQsJ2XaBKGmKSWaAdHG
 FBlw==
X-Gm-Message-State: AOAM530fPPLt/wE+F0mBBUJT1sE6DxQSWvtDcdBhmcLm0HXHSGOjBSQV
 hkEeaFbJdiQV3xvvsMjADJQvshULqWo0ug==
X-Google-Smtp-Source: ABdhPJwqmvjBUDc58EYr80jUsiD6U5kDdinkOH17gAfC/zDd1aWhZPSpV2h3wn6CbGkde2jPxDLvIg==
X-Received: by 2002:a63:6ac8:: with SMTP id f191mr8394187pgc.386.1634895880187; 
 Fri, 22 Oct 2021 02:44:40 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id u4sm9184814pfh.147.2021.10.22.02.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:44:40 -0700 (PDT)
Date: Fri, 22 Oct 2021 19:44:35 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 16/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-17-npiggin@gmail.com>
 <cfd73dd0-a7a2-b8b3-34d8-5a225758b056@csgroup.eu>
 <1634895021.4d2890ma8z.astroid@bobo.none>
In-Reply-To: <1634895021.4d2890ma8z.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1634895802.b8fpd1k6y1.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of October 22, 2021 7:34 pm:
> Excerpts from Christophe Leroy's message of October 22, 2021 5:18 pm:
>>=20
>>=20
>> Le 22/10/2021 =C3=A0 00:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>>> Compiling out hash support code when CONFIG_PPC_64S_HASH_MMU=3Dn saves
>>> 128kB kernel image size (90kB text) on powernv_defconfig minus KVM,
>>> 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>>>=20
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>   arch/powerpc/Kconfig                          |  2 +-
>>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 19 +++++++++--
>>>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++
>>>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>>>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>>>   arch/powerpc/include/asm/paca.h               |  8 +++++
>>>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
>>>   arch/powerpc/kernel/entry_64.S                |  4 +--
>>>   arch/powerpc/kernel/exceptions-64s.S          | 16 +++++++++
>>>   arch/powerpc/kernel/mce.c                     |  2 +-
>>>   arch/powerpc/kernel/mce_power.c               | 10 ++++--
>>>   arch/powerpc/kernel/paca.c                    | 18 ++++------
>>>   arch/powerpc/kernel/process.c                 | 13 +++----
>>>   arch/powerpc/kernel/prom.c                    |  2 ++
>>>   arch/powerpc/kernel/setup_64.c                |  5 +++
>>>   arch/powerpc/kexec/core_64.c                  |  4 +--
>>>   arch/powerpc/kexec/ranges.c                   |  4 +++
>>>   arch/powerpc/mm/book3s64/Makefile             | 15 ++++----
>>>   arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 ++
>>>   arch/powerpc/mm/book3s64/mmu_context.c        | 34 +++++++++++++++---=
-
>>>   arch/powerpc/mm/book3s64/pgtable.c            |  2 +-
>>>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>>>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>>>   arch/powerpc/mm/ptdump/Makefile               |  2 +-
>>>   arch/powerpc/platforms/powernv/idle.c         |  2 ++
>>>   arch/powerpc/platforms/powernv/setup.c        |  2 ++
>>>   arch/powerpc/platforms/pseries/lpar.c         | 11 ++++--
>>>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>>>   arch/powerpc/platforms/pseries/mobility.c     |  6 ++++
>>>   arch/powerpc/platforms/pseries/ras.c          |  2 ++
>>>   arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>>>   arch/powerpc/platforms/pseries/setup.c        |  6 ++--
>>>   arch/powerpc/xmon/xmon.c                      |  8 +++--
>>>   drivers/misc/lkdtm/Makefile                   |  2 +-
>>>   drivers/misc/lkdtm/core.c                     |  2 +-
>>>   35 files changed, 177 insertions(+), 51 deletions(-)
>>>=20
>>=20
>>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/in=
clude/asm/book3s/64/mmu.h
>>> index c02f42d1031e..d94ebae386b6 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>>> @@ -233,7 +245,8 @@ static inline void setup_initial_memory_limit(phys_=
addr_t first_memblock_base,
>>>   	 * know which translations we will pick. Hence go with hash
>>>   	 * restrictions.
>>>   	 */
>>> -	return hash__setup_initial_memory_limit(first_memblock_base,
>>> +	if (!radix_enabled())
>>> +		return hash__setup_initial_memory_limit(first_memblock_base,
>>>   					   first_memblock_size);
>>=20
>> It is a void function, using return is not correct.
>=20
> I guess for this case I can fix as I go.
>=20
>>> @@ -112,8 +112,15 @@ static inline void hash__flush_tlb_kernel_range(un=
signed long start,
>>>  =20
>>>   struct mmu_gather;
>>>   extern void hash__tlb_flush(struct mmu_gather *tlb);
>>> +extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>>> +				unsigned long addr);
>>=20
>> 'extern' is superflous
>=20
> Ditto.
>=20
>>> @@ -144,12 +147,21 @@ static int hash__init_new_context(struct mm_struc=
t *mm)
>>>   	return index;
>>>   }
>>>  =20
>>> +void slb_setup_new_exec(void);
>>=20
>> Include arch/powerpc/mm/book3s64/internal.h instead
>=20
> Will do.
>=20
>>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3=
s64/pgtable.c
>>> index 7d556b5513e4..57d2d797c4f6 100644
>>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>>> @@ -535,7 +535,7 @@ static int __init pgtable_debugfs_setup(void)
>>>   }
>>>   arch_initcall(pgtable_debugfs_setup);
>>>  =20
>>> -#ifdef CONFIG_ZONE_DEVICE
>>> +#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_AL=
IGN)
>>=20
>> Patch 12 does
>>=20
>> 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64
>=20
> Ah, I meant to change that to PPC_64S_HASH_MMU.

Oh I did in this patch, I was looking at the wrong commit.

Thanks,
Nick
