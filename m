Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03D4374CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 11:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbK2B1BZpz3cND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 20:34:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X82YCoA8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X82YCoA8; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbK1X2l5kz2yxB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 20:34:23 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id e10so2302089plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=FEYJA+JgesKMvIFk98+1owqNBy+DCB2ByIkvT+99u1k=;
 b=X82YCoA8B5sYVdpDNDCOBBZR48NLT7gZgl7DQPv+H/YE1L1YJuR5orFkf36mWw+Yp6
 RMWEbyrOqstRs6wrpgI9RAnt5Kk77jaI3ds9+60zP/rFdVN+h7nzb/PwWHbhPEGgIZgC
 LWhQrrBWsBn7conKGy2zGHojoXi5OWShndIeLOWEFiXSLImAcVxjE3lchA3uF/IG1qM4
 ZKjZE8lEP6iUHXsPTTKZZCKDbqLxP39cmBwYr+6uFqGc7k29vvCUU0FE+FCEeOqe35ky
 NQY7iWPi/b2rAs1bX9LALJihkOVGx48FVViHRL6w1YU1Splv9nkOVRSLThqXyaGVFSZZ
 +e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=FEYJA+JgesKMvIFk98+1owqNBy+DCB2ByIkvT+99u1k=;
 b=W4UXmHjMEjk0K2b7LeDEq8wrkC/2u4nS+KEUoGMopdOgkbSxgIX4S+Fgmz21RoRWdM
 W4UxS/R1ID8foyWfQfPgPB3y/0K4wiYX0L7H2g4AASOyH2esFZDELQFBRUKzrzB1eAFw
 kt5p3jsbIsDRGx5jnl65JM/YtqEGljBUF3lCj6tzUOUFqrnLqzFjXKTDzdChMu9L2LaA
 oQuxDMDHcsMdsYONGqySqc+QExvFMh7C6Mw1Tul00b6DD9yX4Uz4/8nN8/BV0VRTzaua
 WVdI202+xNbqw35pel14E3fPSqTxXuqRwEeo2LonQvIt2tfMuK1zI3lWnvl0kV4vRWnm
 dtRw==
X-Gm-Message-State: AOAM532GIVUo5vPFzvtVqsPywj9q4gfdHD9HD4yI3MLh9dNz+O+leE0/
 XV0cVakTb6bPIPKl6K1TnbGD4FI1FUSI1A==
X-Google-Smtp-Source: ABdhPJyie+T7EhdOrlO/KmdC0ZOU26k+SKYF2KJDurYz/VocdvUzNYnqW0d84JrHE6NQHDheVpGeRw==
X-Received: by 2002:a17:90a:e57:: with SMTP id
 p23mr12918809pja.154.1634895260120; 
 Fri, 22 Oct 2021 02:34:20 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id lw14sm9781294pjb.34.2021.10.22.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Oct 2021 02:34:19 -0700 (PDT)
Date: Fri, 22 Oct 2021 19:34:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 16/18] powerpc/64s: Move hash MMU support code under
 CONFIG_PPC_64S_HASH_MMU
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20211021223013.2641952-1-npiggin@gmail.com>
 <20211021223013.2641952-17-npiggin@gmail.com>
 <cfd73dd0-a7a2-b8b3-34d8-5a225758b056@csgroup.eu>
In-Reply-To: <cfd73dd0-a7a2-b8b3-34d8-5a225758b056@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634895021.4d2890ma8z.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of October 22, 2021 5:18 pm:
>=20
>=20
> Le 22/10/2021 =C3=A0 00:30, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Compiling out hash support code when CONFIG_PPC_64S_HASH_MMU=3Dn saves
>> 128kB kernel image size (90kB text) on powernv_defconfig minus KVM,
>> 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/Kconfig                          |  2 +-
>>   arch/powerpc/include/asm/book3s/64/mmu.h      | 19 +++++++++--
>>   .../include/asm/book3s/64/tlbflush-hash.h     |  7 ++++
>>   arch/powerpc/include/asm/book3s/pgtable.h     |  4 +++
>>   arch/powerpc/include/asm/mmu_context.h        |  2 ++
>>   arch/powerpc/include/asm/paca.h               |  8 +++++
>>   arch/powerpc/kernel/asm-offsets.c             |  2 ++
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
>>   arch/powerpc/mm/book3s64/pgtable.c            |  2 +-
>>   arch/powerpc/mm/book3s64/radix_pgtable.c      |  4 +++
>>   arch/powerpc/mm/copro_fault.c                 |  2 ++
>>   arch/powerpc/mm/ptdump/Makefile               |  2 +-
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
>>   35 files changed, 177 insertions(+), 51 deletions(-)
>>=20
>=20
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/inc=
lude/asm/book3s/64/mmu.h
>> index c02f42d1031e..d94ebae386b6 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -233,7 +245,8 @@ static inline void setup_initial_memory_limit(phys_a=
ddr_t first_memblock_base,
>>   	 * know which translations we will pick. Hence go with hash
>>   	 * restrictions.
>>   	 */
>> -	return hash__setup_initial_memory_limit(first_memblock_base,
>> +	if (!radix_enabled())
>> +		return hash__setup_initial_memory_limit(first_memblock_base,
>>   					   first_memblock_size);
>=20
> It is a void function, using return is not correct.

I guess for this case I can fix as I go.

>> @@ -112,8 +112,15 @@ static inline void hash__flush_tlb_kernel_range(uns=
igned long start,
>>  =20
>>   struct mmu_gather;
>>   extern void hash__tlb_flush(struct mmu_gather *tlb);
>> +extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>> +				unsigned long addr);
>=20
> 'extern' is superflous

Ditto.

>> @@ -144,12 +147,21 @@ static int hash__init_new_context(struct mm_struct=
 *mm)
>>   	return index;
>>   }
>>  =20
>> +void slb_setup_new_exec(void);
>=20
> Include arch/powerpc/mm/book3s64/internal.h instead

Will do.

>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s=
64/pgtable.c
>> index 7d556b5513e4..57d2d797c4f6 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -535,7 +535,7 @@ static int __init pgtable_debugfs_setup(void)
>>   }
>>   arch_initcall(pgtable_debugfs_setup);
>>  =20
>> -#ifdef CONFIG_ZONE_DEVICE
>> +#if defined(CONFIG_ZONE_DEVICE) && defined(ARCH_HAS_MEMREMAP_COMPAT_ALI=
GN)
>=20
> Patch 12 does
>=20
> 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64

Ah, I meant to change that to PPC_64S_HASH_MMU.

>=20
> So this change is not needed
>=20
>>   /*
>>    * Override the generic version in mm/memremap.c.
>>    *
>=20
>> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
>> index dd8241c009e5..30f764476c30 100644
>> --- a/arch/powerpc/xmon/xmon.c
>> +++ b/arch/powerpc/xmon/xmon.c
>> @@ -1160,9 +1160,11 @@ cmds(struct pt_regs *excp)
>>   			show_tasks();
>>   			break;
>>   #ifdef CONFIG_PPC_BOOK3S
>> +#if defined(CONFIG_PPC32) || defined(CONFIG_PPC_64S_HASH_MMU)
>=20
> I think you'll get a build failure here.
>=20
> dump_segments() is defined only with CONFIG_PPC_BOOK3S_64 and=20
> CONFIG_PPC_BOOK3S_32, see
>=20
> https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.=
c#L3745
>=20
> and
>=20
> https://elixir.bootlin.com/linux/v5.15-rc5/source/arch/powerpc/xmon/xmon.=
c#L3784

AFAIKS it is okay because it still has ifdef BOOK3S?

Thanks,
Nick

