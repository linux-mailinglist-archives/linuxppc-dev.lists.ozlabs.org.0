Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2119B43449A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 07:20:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYzTv3prZz2ynr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 16:20:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KaNNTPlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KaNNTPlw; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYzTG3ZbVz2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 16:20:17 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id kk10so1644441pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=E8TY/wbrpQNN2uflMMW2iBVbskLQy9qknIp1U63BDEA=;
 b=KaNNTPlwBiZvrK45zDCnIKByffg4PZpqH3FmlwQrlPDu7s3o7iG7khNs2hc3NUMw17
 gRQZHDdSF+MgJ0AB+S3aX1/cW6jdGDZbmjM+nwKvzckj761w9PGRc0l9Ys59Qdshp58i
 9h4TSoXZM8eEI+mrCvmvrQE42HlxQNsED6L6Ki0fxh5yvoMluPxpvGsSmQJOi0d0rM/A
 jXpz9rlMJ+lFhkKyyxCuETICa9jZGIel2YD9vH9PDlSWyoo2pjacyMLZ0Gz9bP9jH0W3
 ywhmOZoCTt2Clc/Lxrv7Bc23WiFrCsWTrbsIrWLsvyTim50mfAgDo8yUJ26isyGIsGtB
 VCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=E8TY/wbrpQNN2uflMMW2iBVbskLQy9qknIp1U63BDEA=;
 b=zoJqBK60qlP06J7AGSycgFIX3d7jsa8Ox4ExQmj791yZdnpNsTGltKFW89dlehBD0b
 Hum8n93NzvKtGPKpD+1bBM7+dWufNBvDYvLaYF/cl8snE30eBgltiuIgKmB3LvSRS8fz
 w0Kiu0O+R6a9Q3wPE5fzMeLxKGdvQ7Jh+mdZWQK469WUA8dIGSrUtXqLWbNaxSGa6YNy
 PYuUOFBphZdW0A/oGEF4/B2Q9QY9kLa9fUpm+82d4Mgc5W5KJ5XARqlB0gOb94ljRNjR
 AVBaN9WnUbUUxCq49N6yJ2+Z7HRpdjLCXKSr4QL6CqfyelA0abqStJRlpfMhyMNB79Op
 eP5g==
X-Gm-Message-State: AOAM533MO5SB1fhCTeqBTaq7+luR72PEx4qL00/jo6tnddTHIuP3tNoh
 oXf8Kn9G029TyO4svB1duecINFCd36I=
X-Google-Smtp-Source: ABdhPJxpsGp/qgEDT2OnvDuPRgKzgxkQceTjEw0wLTL+CvMVhMfn3mjwiM3rJE19tHhs+d14uucxoA==
X-Received: by 2002:a17:902:ab0e:b0:13f:37ae:9582 with SMTP id
 ik14-20020a170902ab0e00b0013f37ae9582mr37683795plb.82.1634707214246; 
 Tue, 19 Oct 2021 22:20:14 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 k5sm950478pfc.111.2021.10.19.22.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 22:20:13 -0700 (PDT)
Date: Wed, 20 Oct 2021 15:20:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 09/11] powerpc/64s: Make hash MMU code build
 configurable
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211015154624.922960-1-npiggin@gmail.com>
 <20211015154624.922960-10-npiggin@gmail.com>
 <eb342e34-8a97-a7f1-ee56-c8874b1bcd85@csgroup.eu>
In-Reply-To: <eb342e34-8a97-a7f1-ee56-c8874b1bcd85@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634706455.61svsep858.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 19, 2021 6:05 pm:
>=20
>=20
> Le 15/10/2021 =C3=A0 17:46, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Introduce a new option CONFIG_PPC_64S_HASH_MMU which allows the 64s hash
>> MMU code to be compiled out if radix is selected and the minimum
>> supported CPU type is POWER9 or higher, and KVM is not selected.
>>=20
>> This saves 128kB kernel image size (90kB text) on powernv_defconfig
>> minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>=20
> This patch is huge, it could be split in several smaller patches ?
>=20
> I'm sure at least the Kconfig stuff can be do as a second step. In first=20
> step just make CONFIG_PPC_64S_HASH_MMU always y.

I can do that.

>=20
> I'm wondering if we could also reduce the amount of #ifdefs in C files,=20
> by using IS_ENABLED() and/or stubs defined in H files.

I didn't see a lot of low hanging things there. A lot of it is struct
members and globals and things. E.g., something like this -

@@ -175,7 +181,9 @@ static int radix__init_new_context(struct mm_struct *mm=
)
         */
        asm volatile("ptesync;isync" : : : "memory");
=20
+#ifdef CONFIG_PPC_64S_HASH_MMU
        mm->context.hash_context =3D NULL;
+#endif
=20
        return index;
 }

In theory we could add a mm_set_hash_context(mm, NULL) function to do=20
this for us, but if it is only required in this one bit of radix init
code then I would say the new function actually adds a reading burden
on all the rest of the code that uses it (or if we only use it in
this one place then it's pretty pointless).

>=20
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig                          |  1 +
>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 22 ++++++++++++++++++-
>>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++++
>>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 ++++
>>   arch/powerpc/include/asm/mmu.h                | 14 +++++++++---
>>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>>   arch/powerpc/include/asm/paca.h               |  8 +++++++
>>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
>>   arch/powerpc/kernel/dt_cpu_ftrs.c             |  8 ++++++-
>>   arch/powerpc/kernel/entry_64.S                |  4 ++--
>>   arch/powerpc/kernel/exceptions-64s.S          | 16 ++++++++++++++
>>   arch/powerpc/kernel/mce.c                     |  2 +-
>>   arch/powerpc/kernel/mce_power.c               | 10 ++++++---
>>   arch/powerpc/kernel/paca.c                    | 18 ++++++---------
>>   arch/powerpc/kernel/process.c                 | 13 ++++++-----
>>   arch/powerpc/kernel/prom.c                    |  2 ++
>>   arch/powerpc/kernel/setup_64.c                |  4 ++++
>>   arch/powerpc/kexec/core_64.c                  |  4 ++--
>>   arch/powerpc/kexec/ranges.c                   |  4 ++++
>>   arch/powerpc/kvm/Kconfig                      |  1 +
>>   arch/powerpc/mm/book3s64/Makefile             | 17 ++++++++------
>>   arch/powerpc/mm/book3s64/hash_utils.c         | 10 ---------
>>   .../{hash_hugetlbpage.c =3D> hugetlbpage.c}     |  6 +++++
>>   arch/powerpc/mm/book3s64/mmu_context.c        | 16 ++++++++++++++
>>   arch/powerpc/mm/book3s64/pgtable.c            | 12 ++++++++++
>>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 ++++
>>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>>   arch/powerpc/mm/pgtable.c                     | 10 ++++++---
>>   arch/powerpc/platforms/Kconfig.cputype        | 21 +++++++++++++++++-
>>   arch/powerpc/platforms/cell/Kconfig           |  1 +
>>   arch/powerpc/platforms/maple/Kconfig          |  1 +
>>   arch/powerpc/platforms/microwatt/Kconfig      |  2 +-
>>   arch/powerpc/platforms/pasemi/Kconfig         |  1 +
>>   arch/powerpc/platforms/powermac/Kconfig       |  1 +
>>   arch/powerpc/platforms/powernv/Kconfig        |  2 +-
>>   arch/powerpc/platforms/powernv/idle.c         |  2 ++
>>   arch/powerpc/platforms/powernv/setup.c        |  2 ++
>>   arch/powerpc/platforms/pseries/lpar.c         | 11 ++++++++--
>>   arch/powerpc/platforms/pseries/lparcfg.c      |  2 +-
>>   arch/powerpc/platforms/pseries/mobility.c     |  6 +++++
>>   arch/powerpc/platforms/pseries/ras.c          |  2 ++
>>   arch/powerpc/platforms/pseries/reconfig.c     |  2 ++
>>   arch/powerpc/platforms/pseries/setup.c        |  6 +++--
>>   arch/powerpc/xmon/xmon.c                      |  8 +++++--
>>   44 files changed, 233 insertions(+), 60 deletions(-)
>>   rename arch/powerpc/mm/book3s64/{hash_hugetlbpage.c =3D> hugetlbpage.c=
} (95%)
>>=20
>=20
>> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/m=
mu.h
>> index 8abe8e42e045..0f89fcab834d 100644
>> --- a/arch/powerpc/include/asm/mmu.h
>> +++ b/arch/powerpc/include/asm/mmu.h
>> @@ -157,7 +157,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
>>  =20
>>   enum {
>>   	MMU_FTRS_POSSIBLE =3D
>> -#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
>> +#if defined(CONFIG_PPC_BOOK3S_604)
>>   		MMU_FTR_HPTE_TABLE |
>>   #endif
>>   #ifdef CONFIG_PPC_8xx
>> @@ -184,15 +184,18 @@ enum {
>>   		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
>>   #endif
>>   #ifdef CONFIG_PPC_BOOK3S_64
>> +		MMU_FTR_KERNEL_RO |
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   		MMU_FTR_NO_SLBIE_B | MMU_FTR_16M_PAGE | MMU_FTR_TLBIEL |
>>   		MMU_FTR_LOCKLESS_TLBIE | MMU_FTR_CI_LARGE_PAGE |
>>   		MMU_FTR_1T_SEGMENT | MMU_FTR_TLBIE_CROP_VA |
>> -		MMU_FTR_KERNEL_RO | MMU_FTR_68_BIT_VA |
>> +		MMU_FTR_68_BIT_VA | MMU_FTR_HPTE_TABLE |
>>   #endif
>>   #ifdef CONFIG_PPC_RADIX_MMU
>>   		MMU_FTR_TYPE_RADIX |
>>   		MMU_FTR_GTSE |
>>   #endif /* CONFIG_PPC_RADIX_MMU */
>> +#endif
>>   #ifdef CONFIG_PPC_KUAP
>>   	MMU_FTR_BOOK3S_KUAP |
>>   #endif /* CONFIG_PPC_KUAP */
>> @@ -223,6 +226,11 @@ enum {
>>   #ifdef CONFIG_E500
>>   #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
>>   #endif
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
>> +#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_RADIX
>> +#endif
>> +#endif
>=20
> Should you also set MMU_FTR_HPTE_TABLE in MMU_FTRS_ALWAYS when HAS_MMU=20
> && !RADIX ?

Yeah, good point.

>>  =20
>>   #ifndef MMU_FTRS_ALWAYS
>>   #define MMU_FTRS_ALWAYS		0
>> @@ -329,7 +337,7 @@ static __always_inline bool radix_enabled(void)
>>   	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
>>   }
>>  =20
>> -static inline bool early_radix_enabled(void)
>> +static __always_inline bool early_radix_enabled(void)
>>   {
>>   	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
>>   }
>=20
>> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/bo=
ok3s64/mmu_context.c
>> index c10fc8a72fb3..642cabc25e99 100644
>> --- a/arch/powerpc/mm/book3s64/mmu_context.c
>> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>> @@ -31,6 +31,7 @@ static int alloc_context_id(int min_id, int max_id)
>>   	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
>>   }
>>  =20
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   void hash__reserve_context_id(int id)
>>   {
>>   	int result =3D ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
>> @@ -50,7 +51,9 @@ int hash__alloc_context_id(void)
>>   	return alloc_context_id(MIN_USER_CONTEXT, max);
>>   }
>>   EXPORT_SYMBOL_GPL(hash__alloc_context_id);
>> +#endif
>>  =20
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   static int realloc_context_ids(mm_context_t *ctx)
>>   {
>>   	int i, id;
>> @@ -144,12 +147,15 @@ static int hash__init_new_context(struct mm_struct=
 *mm)
>>   	return index;
>>   }
>>  =20
>> +void slb_setup_new_exec(void);
>> +
>>   void hash__setup_new_exec(void)
>>   {
>>   	slice_setup_new_exec();
>>  =20
>>   	slb_setup_new_exec();
>>   }
>> +#endif
>>  =20
>>   static int radix__init_new_context(struct mm_struct *mm)
>>   {
>> @@ -175,7 +181,9 @@ static int radix__init_new_context(struct mm_struct =
*mm)
>>   	 */
>>   	asm volatile("ptesync;isync" : : : "memory");
>>  =20
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   	mm->context.hash_context =3D NULL;
>> +#endif
>>  =20
>>   	return index;
>>   }
>> @@ -186,8 +194,10 @@ int init_new_context(struct task_struct *tsk, struc=
t mm_struct *mm)
>>  =20
>>   	if (radix_enabled())
>>   		index =3D radix__init_new_context(mm);
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   	else
>>   		index =3D hash__init_new_context(mm);
>> +#endif
>=20
> I really dislike #ifdef nested in if/else.
>=20
> Can you do something like
>=20
> 	if (radix_enabled()
> 		index =3D radix__init_new_context(mm);
> 	else if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
> 		index =3D hash__init_new_context(mm);

If radix_enabled() constant folds properly then even the 2nd if AFAIKS=20
should not be required. Maybe it does now after some of your patches.

I'll check.

>=20
>=20
>>  =20
>>   	if (index < 0)
>>   		return index;
>> @@ -211,6 +221,7 @@ void __destroy_context(int context_id)
>>   }
>>   EXPORT_SYMBOL_GPL(__destroy_context);
>>  =20
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   static void destroy_contexts(mm_context_t *ctx)
>>   {
>>   	int index, context_id;
>> @@ -222,6 +233,7 @@ static void destroy_contexts(mm_context_t *ctx)
>>   	}
>>   	kfree(ctx->hash_context);
>>   }
>> +#endif
>>  =20
>>   static void pmd_frag_destroy(void *pmd_frag)
>>   {
>> @@ -274,7 +286,11 @@ void destroy_context(struct mm_struct *mm)
>>   		process_tb[mm->context.id].prtb0 =3D 0;
>>   	else
>>   		subpage_prot_free(mm);
>> +#ifdef CONFIG_PPC_64S_HASH_MMU
>>   	destroy_contexts(&mm->context);
>> +#else
>> +	ida_free(&mmu_context_ida, mm->context.id);
>=20
> Is that correct ? Was it done somewhere else before ?

Yeah in destroy_contexts. hash has a extended_id union member that=20
covers id.

I could just move this into destroy_contexts though, at least remove the=20
ifdef here.

Thanks,
Nick
