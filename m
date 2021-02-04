Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AB230EAF8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 04:32:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWPJM1hTfzDwqM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 14:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FxZxz+M1; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWPGd64PRzDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 14:31:20 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id y205so1226293pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 19:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=73Uan8ZA+Z/ogLavLBq0FY+1qpW01o1kwU3b9nmu4Ds=;
 b=FxZxz+M1E+6WL2WLtRoAC9AEAR/kO0fvD3rCa9YRKeZaNqyL4MvybVBpIPqhDQPW5b
 YFVoqO4Y1LGvbz83zLv5HMBGBnBktziTV7ca6QIUeIsGaOx2P1LRKezOBB3o50IWxG/C
 dR8Gq2fg3x/nfRLmnXM5gHr6EJ+aiIpUigA4wrJjYS+llYxKFJ76zFaN33UAL7XtVsvB
 hf23vFVOUmZ9Xcpy6U3eWdKeIsTt6SRTgyvjwznRa0e0mirTTn5CcDHL7UirZYLvZJ1c
 nlVfC69T/AcxJ0b5ma4DCL66jKmZMFSGrHqxn/z0+gPrq9gyhzUPmrPNEqGdotV4CFqb
 EXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=73Uan8ZA+Z/ogLavLBq0FY+1qpW01o1kwU3b9nmu4Ds=;
 b=XDiYpTsHWzY1Zoc1moJ4Ix7KKnxKBOzgu5bO3NPttotVrPAYpzg2ihh61j+eVvcLv9
 spG9yDUPIzwIqZDfXsLnBMtMm0EOxVcgw7VI5spfw6yLKYZ6PIF3W98Rc/V25npkopoI
 jyBmR7b67wQH+UupqVOoBiIWqOQiwQJNY7LbZDCZmUr0ZzDE/PI4iM+dguPEMWvzSAp2
 CtV3SuXLe7E94ARBUvO7odGNJAuCof0rfGTjv7VLEbb1uQh8l6OGK/G8Ir2gvR628r6s
 /QfyQfO0OzBoiNpzV2aVQAJC6+6nIClu6yQDpxOMla0brxs9qJrplBfoyXtgIPjlnebY
 LOiQ==
X-Gm-Message-State: AOAM531QTBA6z0PBpXiIQia7JfHx85j5Puqct8LZLhenaF9C0brYM6vh
 H9gFuHS589+IU/avhSTJl/HXGWbLRok=
X-Google-Smtp-Source: ABdhPJyrI7MXvvAtkH8fVVXcnteEmT2HZQEExR8H56lXsJml9KJWI5xbfrGpMAYCtn3cGJp9FM2JuQ==
X-Received: by 2002:a63:b55:: with SMTP id a21mr6881635pgl.409.1612409476306; 
 Wed, 03 Feb 2021 19:31:16 -0800 (PST)
Received: from localhost (60-242-11-44.static.tpgi.com.au. [60.242.11.44])
 by smtp.gmail.com with ESMTPSA id b18sm3839682pfi.173.2021.02.03.19.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 19:31:15 -0800 (PST)
Date: Thu, 04 Feb 2021 13:31:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64s: Fix pte update for kernel memory on radix
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210203235907.961243-1-jniethe5@gmail.com>
In-Reply-To: <20210203235907.961243-1-jniethe5@gmail.com>
MIME-Version: 1.0
Message-Id: <1612409379.adcakadx0b.astroid@bobo.none>
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
Cc: cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Jordan Niethe's message of February 4, 2021 9:59 am:
> When adding a pte a ptesync is needed to order the update of the pte
> with subsequent accesses otherwise a spurious fault may be raised.
>=20
> radix__set_pte_at() does not do this for performance gains. For
> non-kernel memory this is not an issue as any faults of this kind are
> corrected by the page fault handler.  For kernel memory these faults are
> not handled.  The current solution is that there is a ptesync in
> flush_cache_vmap() which should be called when mapping from the vmalloc
> region.
>=20
> However, map_kernel_page() does not call flush_cache_vmap(). This is
> troublesome in particular for code patching with Strict RWX on radix. In
> do_patch_instruction() the page frame that contains the instruction to
> be patched is mapped and then immediately patched. With no ordering or
> synchronization between setting up the pte and writing to the page it is
> possible for faults.
>=20
> As the code patching is done using __put_user_asm_goto() the resulting
> fault is obscured - but using a normal store instead it can be seen:
>=20
> [  418.498768][  T757] BUG: Unable to handle kernel data access on write =
at 0xc008000008f24a3c
> [  418.498790][  T757] Faulting instruction address: 0xc00000000008bd74
> [  418.498805][  T757] Oops: Kernel access of bad area, sig: 11 [#1]
> [  418.498828][  T757] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 =
NUMA PowerNV
> [  418.498843][  T757] Modules linked in: nop_module(PO+) [last unloaded:=
 nop_module]
> [  418.498872][  T757] CPU: 4 PID: 757 Comm: sh Tainted: P           O   =
   5.10.0-rc5-01361-ge3c1b78c8440-dirty #43
> [  418.498936][  T757] NIP:  c00000000008bd74 LR: c00000000008bd50 CTR: c=
000000000025810
> [  418.498979][  T757] REGS: c000000016f634a0 TRAP: 0300   Tainted: P    =
       O       (5.10.0-rc5-01361-ge3c1b78c8440-dirty)
> [  418.499033][  T757] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  =
CR: 44002884  XER: 00000000
> [  418.499084][  T757] CFAR: c00000000007c68c DAR: c008000008f24a3c DSISR=
: 42000000 IRQMASK: 1
>=20
> This results in the kind of issue reported here:
> https://lore.kernel.org/linuxppc-dev/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88=
@lca.pw/
>=20
> Chris Riedl suggested a reliable way to reproduce the issue:
> $ mount -t debugfs none /sys/kernel/debug
> $ (while true; do echo function > /sys/kernel/debug/tracing/current_trace=
r ; echo nop > /sys/kernel/debug/tracing/current_tracer ; done)&
>=20
> Turning ftrace on and off does a large amount of code patching which in
> usually less then 5min will crash giving a trace like:
>=20
> [  146.668988][  T809] ftrace-powerpc: (____ptrval____): replaced (4b473b=
11) !=3D old (60000000)
> [  146.668995][  T809] ------------[ ftrace bug ]------------
> [  146.669031][  T809] ftrace failed to modify
> [  146.669039][  T809] [<c000000000bf8e5c>] napi_busy_loop+0xc/0x390
> [  146.669045][  T809]  actual:   11:3b:47:4b
> [  146.669070][  T809] Setting ftrace call site to call ftrace function
> [  146.669075][  T809] ftrace record flags: 80000001
> [  146.669081][  T809]  (1)
> [  146.669081][  T809]  expected tramp: c00000000006c96c
> [  146.669096][  T809] ------------[ cut here ]------------
> [  146.669104][  T809] WARNING: CPU: 4 PID: 809 at kernel/trace/ftrace.c:=
2065 ftrace_bug+0x28c/0x2e8
> [  146.669109][  T809] Modules linked in: nop_module(PO-) [last unloaded:=
 nop_module]
> [  146.669130][  T809] CPU: 4 PID: 809 Comm: sh Tainted: P           O   =
   5.10.0-rc5-01360-gf878ccaf250a #1
> [  146.669136][  T809] NIP:  c00000000024f334 LR: c00000000024f330 CTR: c=
0000000001a5af0
> [  146.669142][  T809] REGS: c000000004c8b760 TRAP: 0700   Tainted: P    =
       O       (5.10.0-rc5-01360-gf878ccaf250a)
> [  146.669147][  T809] MSR:  900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,=
DR,RI,LE>  CR: 28008848  XER: 20040000
> [  146.669208][  T809] CFAR: c0000000001a9c98 IRQMASK: 0
> [  146.669208][  T809] GPR00: c00000000024f330 c000000004c8b9f0 c00000000=
2770600 0000000000000022
> [  146.669208][  T809] GPR04: 00000000ffff7fff c000000004c8b6d0 000000000=
0000027 c0000007fe9bcdd8
> [  146.669208][  T809] GPR08: 0000000000000023 ffffffffffffffd8 000000000=
0000027 c000000002613118
> [  146.669208][  T809] GPR12: 0000000000008000 c0000007fffdca00 000000000=
0000000 0000000000000000
> [  146.669208][  T809] GPR16: 0000000023ec37c5 0000000000000000 000000000=
0000000 0000000000000008
> [  146.669208][  T809] GPR20: c000000004c8bc90 c0000000027a2d20 c00000000=
4c8bcd0 c000000002612fe8
> [  146.669208][  T809] GPR24: 0000000000000038 0000000000000030 000000000=
0000028 0000000000000020
> [  146.669208][  T809] GPR28: c000000000ff1b68 c000000000bf8e5c c00000000=
312f700 c000000000fbb9b0
> [  146.669384][  T809] NIP [c00000000024f334] ftrace_bug+0x28c/0x2e8
> [  146.669391][  T809] LR [c00000000024f330] ftrace_bug+0x288/0x2e8
> [  146.669396][  T809] Call Trace:
> [  146.669403][  T809] [c000000004c8b9f0] [c00000000024f330] ftrace_bug+0=
x288/0x2e8 (unreliable)
> [  146.669418][  T809] [c000000004c8ba80] [c000000000248778] ftrace_modif=
y_all_code+0x168/0x210
> [  146.669429][  T809] [c000000004c8bab0] [c00000000006c528] arch_ftrace_=
update_code+0x18/0x30
> [  146.669440][  T809] [c000000004c8bad0] [c000000000248954] ftrace_run_u=
pdate_code+0x44/0xc0
> [  146.669451][  T809] [c000000004c8bb00] [c00000000024dc88] ftrace_start=
up+0xf8/0x1c0
> [  146.669461][  T809] [c000000004c8bb40] [c00000000024dd9c] register_ftr=
ace_function+0x4c/0xc0
> [  146.669472][  T809] [c000000004c8bb70] [c00000000026e750] function_tra=
ce_init+0x80/0xb0
> [  146.669484][  T809] [c000000004c8bba0] [c000000000266b84] tracing_set_=
tracer+0x2a4/0x4f0
> [  146.669495][  T809] [c000000004c8bc70] [c000000000266ea4] tracing_set_=
trace_write+0xd4/0x130
> [  146.669506][  T809] [c000000004c8bd20] [c000000000422790] vfs_write+0x=
f0/0x330
> [  146.669518][  T809] [c000000004c8bd70] [c000000000422bb4] ksys_write+0=
x84/0x140
> [  146.669529][  T809] [c000000004c8bdc0] [c00000000003499c] system_call_=
exception+0x14c/0x230
> [  146.669540][  T809] [c000000004c8be20] [c00000000000d860] system_call_=
common+0xf0/0x27c
> [  146.669549][  T809] Instruction dump:
> [  146.669558][  T809] 48000014 3c62fe88 38631718 4bf5a941 60000000 7fc3f=
378 4bff877d 7c641b78
> [  146.669598][  T809] 3c62fe88 38631730 4bf5a925 60000000 <0fe00000> 382=
10090 3d22fd90 39000001
> [  146.669638][  T809] ---[ end trace 5ea7076ea28c0fbd ]---
>=20
> To fix this when updating kernel memory ptes using ptesync.
>=20
> Fixes: 37bc3e5fd764 ("powerpc/lib/code-patching: Use alternate map for pa=
tch_instruction()")
> Fixes: f1cb8f9beba8 ("powerpc/64s/radix: avoid ptesync after set_pte and =
ptep_set_access_flags")
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>

Good catch. I would say it just fixes the latter patch doesn't it? The=20
previous one just happens to break because it's using the broken API?

Anyhow,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
> v2: Only ptesync is needed
> ---
>  arch/powerpc/include/asm/book3s/64/radix.h | 6 ++++--
>  arch/powerpc/mm/book3s64/radix_pgtable.c   | 4 ++--
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/in=
clude/asm/book3s/64/radix.h
> index c7813dc628fc..59cab558e2f0 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -222,8 +222,10 @@ static inline void radix__set_pte_at(struct mm_struc=
t *mm, unsigned long addr,
>  	 * from ptesync, it should probably go into update_mmu_cache, rather
>  	 * than set_pte_at (which is used to set ptes unrelated to faults).
>  	 *
> -	 * Spurious faults to vmalloc region are not tolerated, so there is
> -	 * a ptesync in flush_cache_vmap.
> +	 * Spurious faults from the kernel memory are not tolerated, so there
> +	 * is a ptesync in flush_cache_vmap, and __map_kernel_page() follows
> +	 * the pte update sequence from ISA Book III 6.10 Translation Table
> +	 * Update Synchronization Requirements.
>  	 */
>  }
> =20
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 3adcf730f478..1d5eec847b88 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -108,7 +108,7 @@ static int early_map_kernel_page(unsigned long ea, un=
signed long pa,
> =20
>  set_the_pte:
>  	set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
> -	smp_wmb();
> +	asm volatile("ptesync": : :"memory");
>  	return 0;
>  }
> =20
> @@ -168,7 +168,7 @@ static int __map_kernel_page(unsigned long ea, unsign=
ed long pa,
> =20
>  set_the_pte:
>  	set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
> -	smp_wmb();
> +	asm volatile("ptesync": : :"memory");
>  	return 0;
>  }
> =20
> --=20
> 2.25.1
>=20
>=20
