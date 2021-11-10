Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4DA44BBEA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 08:02:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpwlw1L5yz300S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 18:02:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oIuqIzxh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oIuqIzxh; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpwlF4SXSz2xX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 18:02:15 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so1234877pjj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=iEQw175G/AjEScvmrBEopwSyooATcYYTR6Pr8u+AOkU=;
 b=oIuqIzxhjArgPzikHG1UhQ1J/ib22YGFL+AcWj/4N8h0kjH51CPz2D1TP6zYYGEl8c
 mZyTgHzhPikW0tx9GII/HtXK9z7w843KkX24hl4plXoG/MirRJf2Ycl58+7uYgSHuV32
 saoG8UVyWo/XJvISAfLRkh/EZqu2mVFFxgs2+6ebZIuO5IR9Rn5wpXCbGmk7xTvMo8Kj
 tc5IIb8v9E9DzgZqpt0I/mdeOFUJ8/K8lplycOzxle43AFnrRmH8hlxHwGv838rkBxTG
 YTm3I1SD1MoBbGMBNRTyggdMzF6E7dodEf898zmaN9r4COlIgN2LLvx5QNcO33pY87iR
 ZXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iEQw175G/AjEScvmrBEopwSyooATcYYTR6Pr8u+AOkU=;
 b=v7gqgXcVcRXIRA1eFD3oVvEVGAgK/O2bUZvukve6c64+btijHj3GgiCDXugqiAc6RP
 PKcCzI0M6p2ZrS0qLWarcGrLsBe6U6mf2HuLMoBBVe5qQXvlnL4OkTUlpuyPe5N8fFjB
 NRv34NIaYE8LE645EmDrkg7u/viZ5R+RkTy10znDTKB33uTafnUYfn3I6/uE6RU60zEA
 XtnxBJdBAdF1XV/miK4VaLZCggPtOuGF8TJFpyFI+vmuDuxI4JenaCWrO2rl6avFxTCT
 mCb2Ik95/iSsyZV5wmCYX+7lefoABmsyiZVLR2c1xXhaA+3zKv6pvu3IkOQ5G2sAJTxy
 fuGg==
X-Gm-Message-State: AOAM532KDiTCH0fEt0r1skEhF+qTod8OdjQXJMDmhGp6QOjKVLHmwdt2
 xBB6e957wWfEPYXfu5pi4lE=
X-Google-Smtp-Source: ABdhPJy2VeJrQarfOSDuQ3JSBZM57QB5t37a3Ed6VgrGVP1Jn2JgAqcY9YIxtuKnEqEek0ype+LXKA==
X-Received: by 2002:a17:90a:ec05:: with SMTP id
 l5mr14634284pjy.68.1636527731991; 
 Tue, 09 Nov 2021 23:02:11 -0800 (PST)
Received: from localhost (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id v22sm21371041pff.93.2021.11.09.23.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 23:02:11 -0800 (PST)
Date: Wed, 10 Nov 2021 17:02:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1] powerpc/64s: Get LPID bit width from device tree
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20211109060716.1977825-1-npiggin@gmail.com>
 <87lf1xowmu.fsf@linux.ibm.com>
In-Reply-To: <87lf1xowmu.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1636526558.bfnkmjwf41.astroid@bobo.none>
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

Excerpts from Fabiano Rosas's message of November 10, 2021 7:19 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Allow the LPID bit width and partition table size to be set at runtime
>> from the device tree.
>>
>> Move the PID bit width detection into the same place.
>>
>> KVM does not support using the extra bits yet, this is mainly required
>> to get the PTCR register values correct.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/mmu.h  |  9 ++---
>>  arch/powerpc/include/asm/kvm_book3s_asm.h |  6 +++-
>>  arch/powerpc/include/asm/reg.h            |  2 --
>>  arch/powerpc/mm/book3s64/pgtable.c        |  5 ---
>>  arch/powerpc/mm/book3s64/radix_pgtable.c  | 13 +------
>>  arch/powerpc/mm/init_64.c                 | 44 +++++++++++++++++++++++
>>  6 files changed, 55 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>> index c02f42d1031e..8c500dd6fee4 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -62,6 +62,9 @@ extern struct patb_entry *partition_tb;
>>  #define PRTS_MASK	0x1f		/* process table size field */
>>  #define PRTB_MASK	0x0ffffffffffff000UL
>>
>> +/* Number of supported LPID bits */
>> +extern unsigned int mmu_lpid_bits;
>> +
>>  /* Number of supported PID bits */
>>  extern unsigned int mmu_pid_bits;
>>
>> @@ -76,10 +79,8 @@ extern unsigned long __ro_after_init radix_mem_block_=
size;
>>  #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
>>  #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
>>
>> -/*
>> - * Power9 currently only support 64K partition table size.
>> - */
>> -#define PATB_SIZE_SHIFT	16
>> +#define PATB_SIZE_SHIFT	(mmu_lpid_bits + 4)
>> +#define PATB_ENTRIES	(1ul << mmu_lpid_bits)
>>
>>  typedef unsigned long mm_context_id_t;
>>  struct spinlock;
>> diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/in=
clude/asm/kvm_book3s_asm.h
>> index b6d31bff5209..4d93e09a1ab9 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s_asm.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
>> @@ -15,7 +15,11 @@
>>  #define XICS_IPI		2	/* interrupt source # for IPIs */
>>
>>  /* LPIDs we support with this build -- runtime limit may be lower */
>> -#define KVMPPC_NR_LPIDS			(LPID_RSVD + 1)
>> +#define KVMPPC_NR_LPIDS		(1ul << 12)
>> +
>> +/* Reserved LPID for partn switching */
>> +#define   LPID_RSVD_POWER7	((1ul << 10) - 1)
>> +#define   LPID_RSVD		(KVMPPC_NR_LPIDS - 1)
>>
>>  /* Maximum number of threads per physical core */
>>  #define MAX_SMT_THREADS		8
>> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/r=
eg.h
>> index e9d27265253b..30983f2fd6a4 100644
>> --- a/arch/powerpc/include/asm/reg.h
>> +++ b/arch/powerpc/include/asm/reg.h
>> @@ -474,8 +474,6 @@
>>  #ifndef SPRN_LPID
>>  #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
>>  #endif
>> -#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching *=
/
>> -#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
>>  #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
>>  #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
>>  #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s=
64/pgtable.c
>> index 9e16c7b1a6c5..13d1fbddecb9 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -207,17 +207,12 @@ void __init mmu_partition_table_init(void)
>>  	unsigned long patb_size =3D 1UL << PATB_SIZE_SHIFT;
>>  	unsigned long ptcr;
>>
>> -	BUILD_BUG_ON_MSG((PATB_SIZE_SHIFT > 36), "Partition table size too lar=
ge.");
>>  	/* Initialize the Partition Table with no entries */
>>  	partition_tb =3D memblock_alloc(patb_size, patb_size);
>>  	if (!partition_tb)
>>  		panic("%s: Failed to allocate %lu bytes align=3D0x%lx\n",
>>  		      __func__, patb_size, patb_size);
>>
>> -	/*
>> -	 * update partition table control register,
>> -	 * 64 K size.
>> -	 */
>>  	ptcr =3D __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
>>  	set_ptcr_when_no_uv(ptcr);
>>  	powernv_set_nmmu_ptcr(ptcr);
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/=
book3s64/radix_pgtable.c
>> index ae20add7954a..1c855434f8dc 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -33,7 +33,6 @@
>>
>>  #include <trace/events/thp.h>
>>
>> -unsigned int mmu_pid_bits;
>>  unsigned int mmu_base_pid;
>>  unsigned long radix_mem_block_size __ro_after_init;
>>
>> @@ -357,18 +356,13 @@ static void __init radix_init_pgtable(void)
>>  						-1, PAGE_KERNEL));
>>  	}
>>
>> -	/* Find out how many PID bits are supported */
>>  	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
>>  			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
>>  		/*
>>  		 * Older versions of KVM on these machines perfer if the
>>  		 * guest only uses the low 19 PID bits.
>>  		 */
>> -		if (!mmu_pid_bits)
>> -			mmu_pid_bits =3D 19;
>> -	} else {
>> -		if (!mmu_pid_bits)
>> -			mmu_pid_bits =3D 20;
>> +		mmu_pid_bits =3D 19;
>>  	}
>>  	mmu_base_pid =3D 1;
>>
>> @@ -449,11 +443,6 @@ static int __init radix_dt_scan_page_sizes(unsigned=
 long node,
>>  	if (type =3D=3D NULL || strcmp(type, "cpu") !=3D 0)
>>  		return 0;
>>
>> -	/* Find MMU PID size */
>> -	prop =3D of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
>> -	if (prop && size =3D=3D 4)
>> -		mmu_pid_bits =3D be32_to_cpup(prop);
>> -
>>  	/* Grab page size encodings */
>>  	prop =3D of_get_flat_dt_prop(node, "ibm,processor-radix-AP-encodings",=
 &size);
>>  	if (!prop)
>> diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
>> index 386be136026e..7d5a6cb7c76d 100644
>> --- a/arch/powerpc/mm/init_64.c
>> +++ b/arch/powerpc/mm/init_64.c
>> @@ -370,6 +370,9 @@ void register_page_bootmem_memmap(unsigned long sect=
ion_nr,
>>  #endif /* CONFIG_SPARSEMEM_VMEMMAP */
>>
>>  #ifdef CONFIG_PPC_BOOK3S_64
>> +unsigned int mmu_lpid_bits;
>> +unsigned int mmu_pid_bits;
>> +
>>  static bool disable_radix =3D !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT)=
;
>>
>>  static int __init parse_disable_radix(char *p)
>> @@ -437,12 +440,53 @@ static void __init early_check_vec5(void)
>>  	}
>>  }
>>
>> +static int __init dt_scan_mmu_pid_width(unsigned long node,
>> +					   const char *uname, int depth,
>> +					   void *data)
>> +{
>> +	int size =3D 0;
>> +	const __be32 *prop;
>> +	const char *type =3D of_get_flat_dt_prop(node, "device_type", NULL);
>> +
>> +	/* We are scanning "cpu" nodes only */
>> +	if (type =3D=3D NULL || strcmp(type, "cpu") !=3D 0)
>> +		return 0;
>> +
>> +	/* Find MMU LPID, PID register size */
>> +	prop =3D of_get_flat_dt_prop(node, "ibm,mmu-lpid-bits", &size);
>> +	if (prop && size =3D=3D 4)
>> +		mmu_lpid_bits =3D be32_to_cpup(prop);
>> +
>> +	prop =3D of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
>> +	if (prop && size =3D=3D 4)
>> +		mmu_pid_bits =3D be32_to_cpup(prop);
>> +
>> +	if (!mmu_pid_bits && !mmu_lpid_bits)
>> +		return 0;
>=20
> What if only one of the properties is present?

Ah that may be a problem because the below fallback would not set the=20
other one that was not found (e.g., some firmware might only give us
ibm,mmu-pid-bits because that was defined earlier).

I will respin.

Thanks,
Nick
