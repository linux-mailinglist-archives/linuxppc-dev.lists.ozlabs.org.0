Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6A592487
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:17:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BvbN1FL3zDqWn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:17:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SYyT8jJ0"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BvMp5sBJzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:07:01 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id x15so1197014pgg.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 06:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Y6tL4WUrFxGgzaiPD0NZTiiBtUaCv6OX14B+q0lDzi0=;
 b=SYyT8jJ07M/ka6KOz9CwY2TdOdj8ZiwosAwy1x7mTYo7f3aWjoLj1Lm2GJKlKp2ILV
 F5QUnA+/cWnZVQC4WkIXNGH0GkbUZtcyBJe+UR6HR6D/Zfx8kX5WLJoqHP6S1PQwQMqU
 +7mgheUBmJpZrYSzuHSZZNpZIlHku85Exrwp7EHdV9fUFt3eb6w0x8pBXYzHv3s15ZPF
 itvtk9uUGxZyLXT4bufmiCGBkWDezMRZPNEays0rylMrXEfpaM21XwzopHKAlVk/x2up
 GhSPasp6TiGc0Dtq+qyjNYhPjhCSyj5ZwOxg+jHPE/KGffMQW2E9muenPfc8b6X4WpJe
 7cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Y6tL4WUrFxGgzaiPD0NZTiiBtUaCv6OX14B+q0lDzi0=;
 b=EeA9glAzYpe5RekNpK1OnSyxnwS44ZQ34kfc90IEkHDX9Tti415EDWFEn3QPZwK+aA
 JdeA+KqBaSRirF+dCW5P1EZ0Rq88UsLbySnmxye2nR1uB8MeYR9OND6TkHJ9Zs/4vh/g
 CNJTemf6RNS81lNHs5f5OdEgA50q6xuKXbf6asGXjniHzLuqzxwqNMXKTtOdBXXhbeys
 8UUmA0A+Av6+nT7ceKc8aoAWN6gKt0IfvTJkRweoJOTZGgrgmrYO0whh5MpcSrdIkR89
 ua9C0WocMnn42laQOzpQULBhhpUGUCRses4wxUYRdWtWoDP3HR6u97Fv2lHO94v9F+2B
 h9fA==
X-Gm-Message-State: APjAAAXe177QytfVs93a3U55sCNoJ6k695/8c3/Gu6e6j4vU/0OCxqeA
 kUib6ONBdflNrfr3CxDUN3yXaVY6
X-Google-Smtp-Source: APXvYqwXDTe6ug1+6GKYxq8IYrAR0KDRpaJbYdamFpLGAxGDbGFsFbbQFsm5jyxhrn3C5Fz30xZZjQ==
X-Received: by 2002:a63:a302:: with SMTP id s2mr19959984pge.125.1566220018081; 
 Mon, 19 Aug 2019 06:06:58 -0700 (PDT)
Received: from localhost ([58.84.106.74])
 by smtp.gmail.com with ESMTPSA id d128sm8467974pfa.42.2019.08.19.06.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 06:06:57 -0700 (PDT)
Date: Mon, 19 Aug 2019 23:06:47 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc/64s/radix: all CPUs should flush local
 translation structure before turning MMU on
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190816040733.5737-1-npiggin@gmail.com>
 <20190816040733.5737-3-npiggin@gmail.com>
 <87zhk56hjg.fsf@concordia.ellerman.id.au>
In-Reply-To: <87zhk56hjg.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566219902.z61jypkylx.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on August 19, 2019 12:00 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> Rather than sprinkle various translation structure invalidations
>> around different places in early boot, have each CPU flush everything
>> from its local translation structures before enabling its MMU.
>>
>> Radix guests can execute tlbie(l), so have them tlbiel_all in the same
>> place as radix host does.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/mm/book3s64/radix_pgtable.c | 11 ++---------
>>  1 file changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/=
book3s64/radix_pgtable.c
>> index d60cfa05447a..839e01795211 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -382,11 +382,6 @@ static void __init radix_init_pgtable(void)
>>  	 */
>>  	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
>>  	pr_info("Process table %p and radix root for kernel: %p\n", process_tb=
, init_mm.pgd);
>> -	asm volatile("ptesync" : : : "memory");
>> -	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
>> -		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
>> -	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
>> -	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
>> =20
>>  	/*
>>  	 * The init_mm context is given the first available (non-zero) PID,
>> @@ -633,8 +628,7 @@ void __init radix__early_init_mmu(void)
>>  	radix_init_pgtable();
>>  	/* Switch to the guard PID before turning on MMU */
>>  	radix__switch_mmu_context(NULL, &init_mm);
>> -	if (cpu_has_feature(CPU_FTR_HVMODE))
>> -		tlbiel_all();
>> +	tlbiel_all();
>>  }
>=20
> This is oopsing for me in a guest on Power9:
>=20
>   [    0.000000] radix-mmu: Page sizes from device-tree:
>   [    0.000000] radix-mmu: Page size shift =3D 12 AP=3D0x0
>   [    0.000000] radix-mmu: Page size shift =3D 16 AP=3D0x5
>   [    0.000000] radix-mmu: Page size shift =3D 21 AP=3D0x1
>   [    0.000000] radix-mmu: Page size shift =3D 30 AP=3D0x2
>   [    0.000000]  -> fw_vec5_feature_init()
>   [    0.000000]  <- fw_vec5_feature_init()
>   [    0.000000]  -> fw_hypertas_feature_init()
>   [    0.000000]  <- fw_hypertas_feature_init()
>   [    0.000000] radix-mmu: Activating Kernel Userspace Execution Prevent=
ion
>   [    0.000000] radix-mmu: Activating Kernel Userspace Access Prevention
>   [    0.000000] lpar: Using radix MMU under hypervisor
>   [    0.000000] radix-mmu: Mapped 0x0000000000000000-0x0000000040000000 =
with 1.00 GiB pages (exec)
>   [    0.000000] radix-mmu: Mapped 0x0000000040000000-0x0000000100000000 =
with 1.00 GiB pages
>   [    0.000000] radix-mmu: Process table (____ptrval____) and radix root=
 for kernel: (____ptrval____)
>   [    0.000000] Oops: Exception in kernel mode, sig: 4 [#1]
>   [    0.000000] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_CPUS=3D=
2048 NUMA=20
>   [    0.000000] Modules linked in:
>   [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.3.0-rc2-gcc-8.=
2.0-00063-gef906dcf7b75 #633
>   [    0.000000] NIP:  c0000000000838f8 LR: c000000001066864 CTR: c000000=
0000838c0
>   [    0.000000] REGS: c000000001647c40 TRAP: 0700   Not tainted  (5.3.0-=
rc2-gcc-8.2.0-00063-gef906dcf7b75)
>   [    0.000000] MSR:  8000000000043003 <SF,FP,ME,RI,LE>  CR: 48000222  X=
ER: 20040000
>   [    0.000000] CFAR: c0000000000839b4 IRQMASK: 1=20
>   [    0.000000] GPR00: c000000001066864 c000000001647ed0 c00000000164970=
0 0000000000000000=20
>   [    0.000000] GPR04: c000000001608830 0000000000000000 000000000000001=
0 2000000000000000=20
>   [    0.000000] GPR08: 0000000000000c00 0000000000000000 000000000000000=
2 726f6620746f6f72=20
>   [    0.000000] GPR12: c0000000000838c0 c000000001930000 000000000dc5bef=
0 0000000001309e10=20
>   [    0.000000] GPR16: 0000000001309c90 fffffffffffffffd 000000000dc5bef=
0 0000000001339800=20
>   [    0.000000] GPR20: 0000000000000014 0000000001ac0000 000000000dc5bf3=
8 000000000daf0000=20
>   [    0.000000] GPR24: 0000000001f4000c c000000000000000 000000000040000=
0 c000000001802858=20
>   [    0.000000] GPR28: c007ffffffffffff c000000001803954 c000000001681cb=
0 c000000001608830=20
>   [    0.000000] NIP [c0000000000838f8] radix__tlbiel_all+0x48/0x110
>   [    0.000000] LR [c000000001066864] radix__early_init_mmu+0x494/0x4c8
>   [    0.000000] Call Trace:
>   [    0.000000] [c000000001647ed0] [c000000001066820] radix__early_init_=
mmu+0x450/0x4c8 (unreliable)
>   [    0.000000] [c000000001647f60] [c00000000105c628] early_setup+0x160/=
0x198
>   [    0.000000] [c000000001647f90] [000000000000b460] 0xb460
>   [    0.000000] Instruction dump:
>   [    0.000000] 2b830001 39000002 409e00e8 3d220003 3929c318 e9290000 e9=
290010 75290002=20
>   [    0.000000] 41820088 7c4004ac 39200000 79085564 <7d294224> 3940007f =
39201000 38e00000=20
>   [    0.000000] random: get_random_bytes called from print_oops_end_mark=
er+0x40/0x80 with crng_init=3D0
>   [    0.000000] ---[ end trace 0000000000000000 ]---
>=20
>=20
> So I think we still need a HV check in there somewhere.

Oh it's the partition scope flush by the looks. Simulator doesn't seem=20
to be trapping that one.

I'll resend, have to fix the kernel invalidation to also do tlbie for
nest.

Thanks,
Nick
=
