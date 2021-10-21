Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B133435BCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 09:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZfPk4f56z3c5J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 18:34:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qbYZVra2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qbYZVra2; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZfNz4pf5z2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 18:33:53 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 n36-20020a17090a5aa700b0019fa884ab85so2433869pji.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 00:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=p9Yo9tVbSo0H3SHXU7/aZ5LG/w8RYkwTkRtraqWIzOg=;
 b=qbYZVra2KdMNnyOdVSmwbY/D7jp/uVf44ahUP7VbKOb0yyfMQpztM0RO1eDifxMc2q
 uweRpu4JWzC4wdWezSKjf4QShaFw5qUg0/GDBrOLZ/pI2u4on4ihG40z5Ih0iTVokjWn
 gI0IITqyAVWnjBhwCPP9DLL3gBuWhoZ8T3w7QixggQi7lNfq5AeNc4AOQW0lRvlgUoyU
 GUTJkevDOHtaNGuLvO0zmaf7DeWQu5UsoH2U7v83UgEhJ3idSIJ8HzXrGuW+6sbFXW5S
 d/rfRhXCekO3hgwXD1ufs57m/XUmrEjG6p3eEyoAiNJdYqu8/utkKeJw6oSWZsOx01yt
 vw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=p9Yo9tVbSo0H3SHXU7/aZ5LG/w8RYkwTkRtraqWIzOg=;
 b=tIw3Ptx6oh7sWvB8diFe0dFNUr+EkrqV+I2OvuTWjSYWRm2A4R35E1I2DJQDFFK4TI
 pCnZ/2YPQXd+4K2m0QADiYUkKbGDE9qysGMPUm9ZrQb2lhiEIopn0tErqrTkUSe51dZ3
 R8z8wUhxfEr+3zfHnM7mXsA9mP+ahcq4zpYRJjqD1OwRptXcDKk+ppfq0DZ03JuBeQoB
 WUw68LYt0U65BqMHkxSqtSmhsgkVVCyCvleEahVXhnyJP2inU7kuDF7hUy3vRE0lMtQk
 PvwRWNGl3aOxR+CHXrs1er1hNUVnAPTmML/WHzNkN2LnzD60Ths9xwwe/KHvMv+2unk1
 r+Kw==
X-Gm-Message-State: AOAM5316tnhQOnsHhIOHcMOJgNf8aZrxuNLYo5OXTJA+Nfm7RDVsHXqo
 26hkV2zFZPyoECUugMJhGYuBAe5mfRA=
X-Google-Smtp-Source: ABdhPJxtQkPn7LQfblflEDL4S8axbwgt62Ze1+rIPS7m6sGiIW8E4/ByURgAjkh6VSI9BDJtQPrtyw==
X-Received: by 2002:a17:90a:e010:: with SMTP id
 u16mr4785033pjy.217.1634801630060; 
 Thu, 21 Oct 2021 00:33:50 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 q16sm5776087pfu.36.2021.10.21.00.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 00:33:49 -0700 (PDT)
Date: Thu, 21 Oct 2021 17:33:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 13/16] powerpc/64s: Move hash MMU code under a new
 Kconfig name
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021035417.2157804-1-npiggin@gmail.com>
 <20211021035417.2157804-14-npiggin@gmail.com>
 <affad7bd-64c5-d9eb-c80a-81c4ff67d6e2@csgroup.eu>
In-Reply-To: <affad7bd-64c5-d9eb-c80a-81c4ff67d6e2@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634800508.2xc9upolsy.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 21, 2021 3:43 pm:
>=20
>=20
> Le 21/10/2021 =C3=A0 05:54, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Introduce a new option CONFIG_PPC_64S_HASH_MMU, and make 64s hash
>> code depend on it.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig                          |  2 +-
>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 19 +++++++++--
>>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++
>>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>>   arch/powerpc/include/asm/mmu.h                | 16 +++++++--
>>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>>   arch/powerpc/include/asm/paca.h               |  8 +++++
>>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
>>   arch/powerpc/kernel/dt_cpu_ftrs.c             | 14 +++++---
>>   arch/powerpc/kernel/entry_64.S                |  4 +--
>>   arch/powerpc/kernel/exceptions-64s.S          | 16 +++++++++
>>   arch/powerpc/kernel/mce.c                     |  2 +-
>>   arch/powerpc/kernel/mce_power.c               | 10 ++++--
>>   arch/powerpc/kernel/paca.c                    | 18 ++++------
>>   arch/powerpc/kernel/process.c                 | 13 +++----
>>   arch/powerpc/kernel/prom.c                    |  2 ++
>>   arch/powerpc/kernel/setup_64.c                |  5 +++
>>   arch/powerpc/kexec/core_64.c                  |  4 +--
>>   arch/powerpc/kexec/ranges.c                   |  4 +++
>>   arch/powerpc/mm/book3s64/Makefile             | 15 ++++----
>>   arch/powerpc/mm/book3s64/hugetlbpage.c        |  2 ++
>>   arch/powerpc/mm/book3s64/mmu_context.c        | 34 +++++++++++++++----
>>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>>   arch/powerpc/mm/ioremap.c                     | 13 ++++---
>>   arch/powerpc/mm/pgtable.c                     | 10 ++++--
>>   arch/powerpc/mm/ptdump/Makefile               |  2 +-
>>   arch/powerpc/platforms/Kconfig.cputype        |  4 +++
>>   arch/powerpc/platforms/powernv/idle.c         |  2 ++
>>   arch/powerpc/platforms/powernv/setup.c        |  2 ++
>>   arch/powerpc/platforms/pseries/lpar.c         | 11 ++++--
>>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>>   arch/powerpc/platforms/pseries/mobility.c     |  6 ++++
>>   arch/powerpc/platforms/pseries/ras.c          |  2 ++
>>   arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>>   arch/powerpc/platforms/pseries/setup.c        |  6 ++--
>>   arch/powerpc/xmon/xmon.c                      |  8 +++--
>>   drivers/misc/lkdtm/Makefile                   |  2 +-
>>   drivers/misc/lkdtm/core.c                     |  2 +-
>>   39 files changed, 219 insertions(+), 64 deletions(-)
>=20
> I'm still unconfortable with the quantity of files impacted in that commi=
t.

Hmm. Splitting it into N partial patches that have the same result
doesn't seem better to me. There's a few other little things that are
be better split out, but size of the patch will not shrink much.

>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>> index c02f42d1031e..d94ebae386b6 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>=20
>> @@ -193,8 +198,15 @@ static inline struct subpage_prot_table *mm_ctx_sub=
page_prot(mm_context_t *ctx)
>>   extern int mmu_linear_psize;
>>   extern int mmu_virtual_psize;
>>   extern int mmu_vmalloc_psize;
>> -extern int mmu_vmemmap_psize;
>>   extern int mmu_io_psize;
>> +#else /* CONFIG_PPC_64S_HASH_MMU */
>> +#ifdef CONFIG_PPC_64K_PAGES
>=20
> Avoid nested #ifdefs and do
>=20
> #elif defined(CONFIG_PPC_64K_PAGES)

I sort of like the nesting because this is the !HASH block. But I don't=20
care much so I can do it your way if you prefer.

>> @@ -223,6 +226,13 @@ enum {
>>   #ifdef CONFIG_E500
>>   #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
>>   #endif
>> +#ifdef CONFIG_PPC_BOOK3S_64
>=20
> No need of this CONFIG_PPC_BOOK3S_64 ifdef, it is necessarily defined if=20
> either CONFIG_PPC_RADIX_MMU or CONFIG_PPC_64S_HASH_MMU is defined

Good point.

>> +#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
>> +#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_RADIX
>> +#elif !defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU=
)
>> +#define MMU_FTRS_ALWAYS		MMU_FTR_HPTE_TABLE
>> +#endif
>> +#endif
>>  =20
>>   #ifndef MMU_FTRS_ALWAYS
>>   #define MMU_FTRS_ALWAYS		0
>=20
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index 046c99e31d01..65b695e9401e 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -1369,11 +1369,15 @@ EXC_COMMON_BEGIN(data_access_common)
>>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>>   	andis.	r0,r4,DSISR_DABRMATCH@h
>>   	bne-	1f
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   BEGIN_MMU_FTR_SECTION
>>   	bl	do_hash_fault
>>   MMU_FTR_SECTION_ELSE
>>   	bl	do_page_fault
>>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>> +#else
>> +	bl	do_page_fault
>> +#endif
>=20
> Maybe we could always branch to do_page_fault() and get redirected to=20
> do_hash_fault() from do_page_fault() if BOOK3S64 && !radix_enabled() ?

Not trivial because of do_hash_fault().

A book3s_64_do_page_fault() raw hander which calls do_hash_fault or=20
do_page_fault if necessary, but that's less optimal and we already
have this gunk so might as well keep it.

>=20
> Another solution is to make it a GAS macro ?

For this I don't find it too bad. Another macro means another thing to=20
look up. Maybe if we had more callers but for now this isn't too=20
terrible.

>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_=
64.c
>> index 7d4bcbc3124e..59b1a1833143 100644
>> --- a/arch/powerpc/kernel/setup_64.c
>> +++ b/arch/powerpc/kernel/setup_64.c
>> @@ -887,6 +887,8 @@ void __init setup_per_cpu_areas(void)
>>   	} else if (radix_enabled()) {
>>   		atom_size =3D PAGE_SIZE;
>>   	} else {
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>=20
> Use IS_ENABLED()

Can't because of mmu_linear_psize.

>> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
>> index cd16b407f47e..ab105d33e0b0 100644
>> --- a/arch/powerpc/mm/pgtable.c
>> +++ b/arch/powerpc/mm/pgtable.c
>> @@ -81,9 +81,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
>>  =20
>>   static pte_t set_pte_filter_hash(pte_t pte)
>>   {
>> -	if (radix_enabled())
>> -		return pte;
>> -
>>   	pte =3D __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
>>   	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACH=
E) ||
>>   				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
>> @@ -112,6 +109,9 @@ static inline pte_t set_pte_filter(pte_t pte)
>>   {
>>   	struct page *pg;
>>  =20
>> +	if (radix_enabled())
>> +		return pte;
>> +
>>   	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>>   		return set_pte_filter_hash(pte);
>>  =20
>> @@ -144,6 +144,10 @@ static pte_t set_access_flags_filter(pte_t pte, str=
uct vm_area_struct *vma,
>>   {
>>   	struct page *pg;
>>  =20
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	return pte;
>> +#endif
>=20
> Aren't you changing the behaviour here for RADIX ?

No, 64s always has MMU_FTR_HPTE_TABLE until now. I should actually split=20
this change out.

> Anyway, can use IS_ENABLED()

Good point.

>=20
>> +
>>   	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
>>   		return pte;
>>  =20
>> diff --git a/arch/powerpc/mm/ptdump/Makefile b/arch/powerpc/mm/ptdump/Ma=
kefile
>> index 4050cbb55acf..b533caaf0910 100644
>> --- a/arch/powerpc/mm/ptdump/Makefile
>> +++ b/arch/powerpc/mm/ptdump/Makefile
>> @@ -10,5 +10,5 @@ obj-$(CONFIG_PPC_BOOK3S_64)	+=3D book3s64.o
>>  =20
>>   ifdef CONFIG_PTDUMP_DEBUGFS
>>   obj-$(CONFIG_PPC_BOOK3S_32)	+=3D bats.o segment_regs.o
>> -obj-$(CONFIG_PPC_BOOK3S_64)	+=3D hashpagetable.o
>> +obj-$(CONFIG_PPC_64S_HASH_MMU)	+=3D hashpagetable.o
>>   endif
>> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platf=
orms/Kconfig.cputype
>> index a208997ade88..01726e7f2c7f 100644
>> --- a/arch/powerpc/platforms/Kconfig.cputype
>> +++ b/arch/powerpc/platforms/Kconfig.cputype
>> @@ -105,6 +105,7 @@ config PPC_BOOK3S_64
>>   	select HAVE_MOVE_PMD
>>   	select HAVE_MOVE_PUD
>>   	select IRQ_WORK
>> +	select PPC_64S_HASH_MMU
>=20
> Not needed
>=20
>>   	select PPC_MM_SLICES
>>   	select PPC_HAVE_KUEP
>>   	select PPC_HAVE_KUAP
>> @@ -364,6 +365,9 @@ config SPE
>>  =20
>>   	  If in doubt, say Y here.
>>  =20
>> +config PPC_64S_HASH_MMU
>> +	bool
>=20
> Add
> 	depends on PPC_BOOK3S_64
> 	default y
>=20
>> +
>>   config PPC_RADIX_MMU
>>   	bool "Radix MMU Support"
>>   	depends on PPC_BOOK3S_64
>=20
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index dd8241c009e5..33de8d798c95 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -1160,9 +1160,11 @@ cmds(struct pt_regs *excp)
>>   			show_tasks();
>>   			break;
>>   #ifdef CONFIG_PPC_BOOK3S
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>=20
> And BOOK3S/32 ???

Oops, good catch.

Thanks,
Nick

>=20
>>   		case 'u':
>>   			dump_segments();
>>   			break;
>> +#endif
>>   #elif defined(CONFIG_44x)
>>   		case 'u':
>>   			dump_tlb_44x();
