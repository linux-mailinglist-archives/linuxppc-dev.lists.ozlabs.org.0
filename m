Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8530EB99
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:47:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWQy84RRHzDwsl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 15:47:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e;
 helo=mail-yb1-xb2e.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=heMir1TN; dkim-atps=neutral
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWQwN4sTJzDwr1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 15:45:37 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id k4so1927509ybp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Feb 2021 20:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PTpx5gIyJQXCopoq7XrX1+kPvauvgZ5QrG094PQotu0=;
 b=heMir1TNy4CWudNk6wKHVJQDOsYYiCCip/VHhn4lIHU7GrUavwrYwMoxT3D8wAAr6I
 LVaUW6PO5oCvzaDetSg1CvYKh5dcRpL13XDUegx043Ek5SyJvrv6DDO6a70p8M4w6Chh
 a1o39SOSPeql4LZY4u4w4nCiytBS4/d86rtC6tPG9hvPMkEznvsjce0W9r7q2g6/votJ
 UASz/NPc8bVarVwGR+/jcCABcTmAFfeh9mih0E2DQ7r7BpJgnrIdVUTlhgEh6TAfBwHB
 76zQOlSsBjc2CGuSHA9Hc8LE//jem9fSwVV5OcWnl6mELmOOpCzib23pkGzW4QFSvxfE
 nQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PTpx5gIyJQXCopoq7XrX1+kPvauvgZ5QrG094PQotu0=;
 b=MTTdmutABJwgUtf19UZuqmBLigI3ZpbNS+1ca1yy+AbGwPIEcM7Nn6KsCb3RIABT31
 hLm63mLlwjTkN6iTa369npAQ0rDynPbx4X5/jsTX7qRDS+1Wv8lU+hs57VbO306/sM3j
 aSDT05OoVBV5ZJZOldAdp83gzWqWfzjStjFCgm+36ypSU/T4+bzdnp1yN8PdMCq3qd1k
 hGX0RoffXV6mrqon5uWnG595wyVMYMN/F8HiSE+cGRiVqNZU/wo2i+vs+StD9835XW2Y
 AwyE2qAk5WjkKlXzZ+ywB712aQ0ULrNWta2Rd3WwV7UlS5v0nq/9XrpfH83ghaKxIBZT
 qAJg==
X-Gm-Message-State: AOAM532tz4toISvS4lfz7q+sqFVFykK95J3nVcLiWiZnYvIfXZEML/1u
 FuiYJzTU4G6/a1yf0k+vLfFGlnZbIaokV93MGDo=
X-Google-Smtp-Source: ABdhPJyTgBv5L4PWI5mrjdAOluMwn+hXF+DtBUIY1OMKSSKNgyZ/Iq39UE3wzZoXnrdng/oO9iYA5xT7yswO0YycYfY=
X-Received: by 2002:a25:dad3:: with SMTP id n202mr9526175ybf.8.1612413934167; 
 Wed, 03 Feb 2021 20:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20210203235907.961243-1-jniethe5@gmail.com>
 <1612409379.adcakadx0b.astroid@bobo.none>
In-Reply-To: <1612409379.adcakadx0b.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Thu, 4 Feb 2021 15:45:22 +1100
Message-ID: <CACzsE9qefCovqO9GsnRf=Sg6Zs_qcCUn_kQuaNhc_5xOgXRRsA@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/64s: Fix pte update for kernel memory on radix
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, cmr@codefail.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 4, 2021 at 2:31 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Jordan Niethe's message of February 4, 2021 9:59 am:
> > When adding a pte a ptesync is needed to order the update of the pte
> > with subsequent accesses otherwise a spurious fault may be raised.
> >
> > radix__set_pte_at() does not do this for performance gains. For
> > non-kernel memory this is not an issue as any faults of this kind are
> > corrected by the page fault handler.  For kernel memory these faults are
> > not handled.  The current solution is that there is a ptesync in
> > flush_cache_vmap() which should be called when mapping from the vmalloc
> > region.
> >
> > However, map_kernel_page() does not call flush_cache_vmap(). This is
> > troublesome in particular for code patching with Strict RWX on radix. In
> > do_patch_instruction() the page frame that contains the instruction to
> > be patched is mapped and then immediately patched. With no ordering or
> > synchronization between setting up the pte and writing to the page it is
> > possible for faults.
> >
> > As the code patching is done using __put_user_asm_goto() the resulting
> > fault is obscured - but using a normal store instead it can be seen:
> >
> > [  418.498768][  T757] BUG: Unable to handle kernel data access on write at 0xc008000008f24a3c
> > [  418.498790][  T757] Faulting instruction address: 0xc00000000008bd74
> > [  418.498805][  T757] Oops: Kernel access of bad area, sig: 11 [#1]
> > [  418.498828][  T757] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
> > [  418.498843][  T757] Modules linked in: nop_module(PO+) [last unloaded: nop_module]
> > [  418.498872][  T757] CPU: 4 PID: 757 Comm: sh Tainted: P           O      5.10.0-rc5-01361-ge3c1b78c8440-dirty #43
> > [  418.498936][  T757] NIP:  c00000000008bd74 LR: c00000000008bd50 CTR: c000000000025810
> > [  418.498979][  T757] REGS: c000000016f634a0 TRAP: 0300   Tainted: P           O       (5.10.0-rc5-01361-ge3c1b78c8440-dirty)
> > [  418.499033][  T757] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44002884  XER: 00000000
> > [  418.499084][  T757] CFAR: c00000000007c68c DAR: c008000008f24a3c DSISR: 42000000 IRQMASK: 1
> >
> > This results in the kind of issue reported here:
> > https://lore.kernel.org/linuxppc-dev/15AC5B0E-A221-4B8C-9039-FA96B8EF7C88@lca.pw/
> >
> > Chris Riedl suggested a reliable way to reproduce the issue:
> > $ mount -t debugfs none /sys/kernel/debug
> > $ (while true; do echo function > /sys/kernel/debug/tracing/current_tracer ; echo nop > /sys/kernel/debug/tracing/current_tracer ; done)&
> >
> > Turning ftrace on and off does a large amount of code patching which in
> > usually less then 5min will crash giving a trace like:
> >
> > [  146.668988][  T809] ftrace-powerpc: (____ptrval____): replaced (4b473b11) != old (60000000)
> > [  146.668995][  T809] ------------[ ftrace bug ]------------
> > [  146.669031][  T809] ftrace failed to modify
> > [  146.669039][  T809] [<c000000000bf8e5c>] napi_busy_loop+0xc/0x390
> > [  146.669045][  T809]  actual:   11:3b:47:4b
> > [  146.669070][  T809] Setting ftrace call site to call ftrace function
> > [  146.669075][  T809] ftrace record flags: 80000001
> > [  146.669081][  T809]  (1)
> > [  146.669081][  T809]  expected tramp: c00000000006c96c
> > [  146.669096][  T809] ------------[ cut here ]------------
> > [  146.669104][  T809] WARNING: CPU: 4 PID: 809 at kernel/trace/ftrace.c:2065 ftrace_bug+0x28c/0x2e8
> > [  146.669109][  T809] Modules linked in: nop_module(PO-) [last unloaded: nop_module]
> > [  146.669130][  T809] CPU: 4 PID: 809 Comm: sh Tainted: P           O      5.10.0-rc5-01360-gf878ccaf250a #1
> > [  146.669136][  T809] NIP:  c00000000024f334 LR: c00000000024f330 CTR: c0000000001a5af0
> > [  146.669142][  T809] REGS: c000000004c8b760 TRAP: 0700   Tainted: P           O       (5.10.0-rc5-01360-gf878ccaf250a)
> > [  146.669147][  T809] MSR:  900000000282b033 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 28008848  XER: 20040000
> > [  146.669208][  T809] CFAR: c0000000001a9c98 IRQMASK: 0
> > [  146.669208][  T809] GPR00: c00000000024f330 c000000004c8b9f0 c000000002770600 0000000000000022
> > [  146.669208][  T809] GPR04: 00000000ffff7fff c000000004c8b6d0 0000000000000027 c0000007fe9bcdd8
> > [  146.669208][  T809] GPR08: 0000000000000023 ffffffffffffffd8 0000000000000027 c000000002613118
> > [  146.669208][  T809] GPR12: 0000000000008000 c0000007fffdca00 0000000000000000 0000000000000000
> > [  146.669208][  T809] GPR16: 0000000023ec37c5 0000000000000000 0000000000000000 0000000000000008
> > [  146.669208][  T809] GPR20: c000000004c8bc90 c0000000027a2d20 c000000004c8bcd0 c000000002612fe8
> > [  146.669208][  T809] GPR24: 0000000000000038 0000000000000030 0000000000000028 0000000000000020
> > [  146.669208][  T809] GPR28: c000000000ff1b68 c000000000bf8e5c c00000000312f700 c000000000fbb9b0
> > [  146.669384][  T809] NIP [c00000000024f334] ftrace_bug+0x28c/0x2e8
> > [  146.669391][  T809] LR [c00000000024f330] ftrace_bug+0x288/0x2e8
> > [  146.669396][  T809] Call Trace:
> > [  146.669403][  T809] [c000000004c8b9f0] [c00000000024f330] ftrace_bug+0x288/0x2e8 (unreliable)
> > [  146.669418][  T809] [c000000004c8ba80] [c000000000248778] ftrace_modify_all_code+0x168/0x210
> > [  146.669429][  T809] [c000000004c8bab0] [c00000000006c528] arch_ftrace_update_code+0x18/0x30
> > [  146.669440][  T809] [c000000004c8bad0] [c000000000248954] ftrace_run_update_code+0x44/0xc0
> > [  146.669451][  T809] [c000000004c8bb00] [c00000000024dc88] ftrace_startup+0xf8/0x1c0
> > [  146.669461][  T809] [c000000004c8bb40] [c00000000024dd9c] register_ftrace_function+0x4c/0xc0
> > [  146.669472][  T809] [c000000004c8bb70] [c00000000026e750] function_trace_init+0x80/0xb0
> > [  146.669484][  T809] [c000000004c8bba0] [c000000000266b84] tracing_set_tracer+0x2a4/0x4f0
> > [  146.669495][  T809] [c000000004c8bc70] [c000000000266ea4] tracing_set_trace_write+0xd4/0x130
> > [  146.669506][  T809] [c000000004c8bd20] [c000000000422790] vfs_write+0xf0/0x330
> > [  146.669518][  T809] [c000000004c8bd70] [c000000000422bb4] ksys_write+0x84/0x140
> > [  146.669529][  T809] [c000000004c8bdc0] [c00000000003499c] system_call_exception+0x14c/0x230
> > [  146.669540][  T809] [c000000004c8be20] [c00000000000d860] system_call_common+0xf0/0x27c
> > [  146.669549][  T809] Instruction dump:
> > [  146.669558][  T809] 48000014 3c62fe88 38631718 4bf5a941 60000000 7fc3f378 4bff877d 7c641b78
> > [  146.669598][  T809] 3c62fe88 38631730 4bf5a925 60000000 <0fe00000> 38210090 3d22fd90 39000001
> > [  146.669638][  T809] ---[ end trace 5ea7076ea28c0fbd ]---
> >
> > To fix this when updating kernel memory ptes using ptesync.
> >
> > Fixes: 37bc3e5fd764 ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
> > Fixes: f1cb8f9beba8 ("powerpc/64s/radix: avoid ptesync after set_pte and ptep_set_access_flags")
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>
> Good catch. I would say it just fixes the latter patch doesn't it? The
> previous one just happens to break because it's using the broken API?
Yes that is true. I will send another revision that removes that from
the 'Fixes' and also add a self test.
>
> Anyhow,
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
>
> > ---
> > v2: Only ptesync is needed
> > ---
> >  arch/powerpc/include/asm/book3s/64/radix.h | 6 ++++--
> >  arch/powerpc/mm/book3s64/radix_pgtable.c   | 4 ++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> > index c7813dc628fc..59cab558e2f0 100644
> > --- a/arch/powerpc/include/asm/book3s/64/radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> > @@ -222,8 +222,10 @@ static inline void radix__set_pte_at(struct mm_struct *mm, unsigned long addr,
> >        * from ptesync, it should probably go into update_mmu_cache, rather
> >        * than set_pte_at (which is used to set ptes unrelated to faults).
> >        *
> > -      * Spurious faults to vmalloc region are not tolerated, so there is
> > -      * a ptesync in flush_cache_vmap.
> > +      * Spurious faults from the kernel memory are not tolerated, so there
> > +      * is a ptesync in flush_cache_vmap, and __map_kernel_page() follows
> > +      * the pte update sequence from ISA Book III 6.10 Translation Table
> > +      * Update Synchronization Requirements.
> >        */
> >  }
> >
> > diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > index 3adcf730f478..1d5eec847b88 100644
> > --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> > +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> > @@ -108,7 +108,7 @@ static int early_map_kernel_page(unsigned long ea, unsigned long pa,
> >
> >  set_the_pte:
> >       set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
> > -     smp_wmb();
> > +     asm volatile("ptesync": : :"memory");
> >       return 0;
> >  }
> >
> > @@ -168,7 +168,7 @@ static int __map_kernel_page(unsigned long ea, unsigned long pa,
> >
> >  set_the_pte:
> >       set_pte_at(&init_mm, ea, ptep, pfn_pte(pfn, flags));
> > -     smp_wmb();
> > +     asm volatile("ptesync": : :"memory");
> >       return 0;
> >  }
> >
> > --
> > 2.25.1
> >
> >
