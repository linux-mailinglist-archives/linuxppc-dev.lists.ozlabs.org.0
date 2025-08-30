Return-Path: <linuxppc-dev+bounces-11513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465FEB3C7A7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLq56B6Pz2yys;
	Sat, 30 Aug 2025 13:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526049;
	cv=none; b=KIDLffK7JDckLBIK9vRHTktfdUmTbVajavHDlO6UWMSS77S/0q+k7M0zKLgmYiWvsYYW7kSS+sgFo/wuwp+EW6zhLunZCVHG/YHFWJjFm0bVL7gzc/SDOo/kHq/VaJlevazVADaQZu/uV8ttNdkOjy3cwvp26Ss5Dtd94s5jOUHUC3SCClMFrZvu9WwKLP8zhHwazVZgXkeqb7+TDewAehc5IaUBquVxAv45lSjcweXpwNDzFCMM1YTeztueBo3KHpJT9bih7X5nlfmY5UqPhqPyg/IAL0BCJdFKRdpaGMRplRi4RMLqmo6ouXFnx0hQsGNklBIe16osElOPmdDpNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526049; c=relaxed/relaxed;
	bh=91RPs/0fYM/0BKV/CtBkeG0ygHgvI5Jam/unEho/Uss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NNX/5s+W9n+8aT9mWjnG/TSiKFlwow0k82OJWVVfr7GADS2Z/Wofrrz1o1WIZcEqDCT0pHGUaGoqJCkhnnxwjDunK9GSGHoomhEtOI1vQOXlOjjejq1+7rpnr/15jsZX2FKO/jQdeXRVzMG+o9VwK3OhrBRJTqnwaxMi/qwhA8hEzRA1Y2F5kMrX52s0sX+MpHnZwbc5ZbIT26s0imFPUv9dU/Am96wrK/KrchLmdhdjVnBYinNITzWsj/FQyPGBCEhJRd4/bKEAgZZvy9MnQDkBx7IvU2ndVZQbEOQh24dQ1n/yXORYRFEChX6YMTZuF4pUuoG1ttKATVNwhsb4lA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XOkDVmr9; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XOkDVmr9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLq51J28z2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:09 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323266d6f57so2971500a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526046; x=1757130846; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91RPs/0fYM/0BKV/CtBkeG0ygHgvI5Jam/unEho/Uss=;
        b=XOkDVmr9vPcQFtWAUufEbclL6g/dREWBkrn65qdKXUzlVQRS13GyGUDqakjQuC8DYn
         JLKDyq8lYzVyE0v8wKJjGE9hN3MjBLIL75/aCUwRrBp3VlBJZ1SvL2PGRhkz5gibNPhL
         fAHSfE3vHjuGd37lFGZqS3XXkkVMdPNc3eaSbO5NfmGO/g5e3iKGHPOH6N87mh8/yxGg
         Hc8BZ7TJYHnrWGpEPcmJdkuXbhqAgt91TYhulP5xJFPsa6n6GojKe+uj2ztmCnOqtT/Y
         9veFrYjZpBQu5iDw3/fz83Nqyb+nuSAWKd+GPfwCW7X+ZqdhXWtDfQratjaz9XdV9mcP
         +Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526046; x=1757130846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91RPs/0fYM/0BKV/CtBkeG0ygHgvI5Jam/unEho/Uss=;
        b=d+NbO1Am7uFdTpBeqrpa5MR7w35cphGeNnjCZz/faVC7tUmyxwjfdTj4y05yIghMWf
         Ua1Ya+s2KCqoUVO8I1QMdU7fmuuncdkSMxfFpDjlZriHH3MV5UesGdv2rAtcALdfiIdn
         tJ23I0RqqX5ACIBzGM1t+nEZojufcHAd1UOZMmy3svZrMc42ARNIjLJNdI1Puz6XqZxZ
         w+WvMhgJiSX79i/cpjyAvxoRn8UJnb8BJlYXSOmnN5JQedMBhbETvHqGNKpp0hkWvJyv
         /JEE8Lz5m80/r0D+S9fE3UitZ3+6LDIekuQRAseCkWlQEe7ZDm7oIm0KPizT2778ejNp
         Cssw==
X-Gm-Message-State: AOJu0Ywa6JgFc5CB2dzghZlbwtF7CQExr5f0UmtqbB/dk40dK6+b4eVQ
	wAvRLYSsXnzQenNuiLoQeneuJp3X169DNKMOccr3CK9qZJ0ERPmliIUWZ/b66A==
X-Gm-Gg: ASbGncv1GJwkv8v5AD+0Ukgh+HR6/MN4NNWZKUrsteXvgwk4Ic8RlgYNU1A7w8xVVfM
	pw2VewJ4MROnEiDfxl4CJCsKgzKJzjDHxVV8fBpzdXBjdIV1VbOTsTBjr6PMZyW0hO2AOec8RaS
	keOikH9+z1RMhZYweEUtgZ3n+P74ofEQKt/yPkooFME3iQh8Wx7qTxVNuLmU6AULm+8KSorruyD
	1tHNYyPsvI2wmE8wIZso8cvyvFsMYDCvj+oFokiXQwPue+CoYxwlkxB9djz45RyWcl2Tw99n+4K
	uqMB1KXlHMjbn6Fwrd/HJ8ziLnaZ65P3Rmx2WtXCo7owCTMYSm9KKV9bv8VWbTCbRKnW7e53qfX
	TyLFVgiBXXMJYDI4nIN2Ui/fDBg==
X-Google-Smtp-Source: AGHT+IErkqyMgcM5O4XsY4PE7xy0Jnw7MTzY3U7M20aCxbjJOga65xvpy+dBG2J3XXIo8tmY5uvLLA==
X-Received: by 2002:a17:90b:2751:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-32815412c9emr1406893a91.3.1756526045848;
        Fri, 29 Aug 2025 20:54:05 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:05 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Donet Tom <donettom@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	stable@vger.kernel.org
Subject: [RFC 1/8] powerpc/mm: Fix SLB multihit issue during SLB preload
Date: Sat, 30 Aug 2025 09:21:40 +0530
Message-ID: <6378feb7f4aeb8353905926a63c938022cf07f6c.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Donet Tom <donettom@linux.ibm.com>

On systems using the hash MMU, there is a software SLB preload cache that
mirrors the entries loaded into the hardware SLB buffer. This preload
cache is subject to periodic eviction — typically after every 256 context
switches — to remove old entry.

To optimize performance, the kernel skips switch_mmu_context() in
switch_mm_irqs_off() when the prev and next mm_struct are the same.
However, on hash MMU systems, this can lead to inconsistencies between
the hardware SLB and the software preload cache.

If an SLB entry for a process is evicted from the software cache on one
CPU, and the same process later runs on another CPU without executing
switch_mmu_context(), the hardware SLB may retain stale entries. If the
kernel then attempts to reload that entry, it can trigger an SLB
multi-hit error.

The following timeline shows how stale SLB entries are created and can
cause a multi-hit error when a process moves between CPUs without a
MMU context switch.

CPU 0                                   CPU 1
-----                                    -----
Process P
exec                                    swapper/1
 load_elf_binary
  begin_new_exc
    activate_mm
     switch_mm_irqs_off
      switch_mmu_context
       switch_slb
       /*
        * This invalidates all
        * the entries in the HW
        * and setup the new HW
        * SLB entries as per the
        * preload cache.
        */
context_switch
sched_migrate_task migrates process P to cpu-1

Process swapper/0                       context switch (to process P)
(uses mm_struct of Process P)           switch_mm_irqs_off()
                                         switch_slb
                                           load_slb++
                                            /*
                                            * load_slb becomes 0 here
                                            * and we evict an entry from
                                            * the preload cache with
                                            * preload_age(). We still
                                            * keep HW SLB and preload
                                            * cache in sync, that is
                                            * because all HW SLB entries
                                            * anyways gets evicted in
                                            * switch_slb during SLBIA.
                                            * We then only add those
                                            * entries back in HW SLB,
                                            * which are currently
                                            * present in preload_cache
                                            * (after eviction).
                                            */
                                        load_elf_binary continues...
                                         setup_new_exec()
                                          slb_setup_new_exec()

                                        sched_switch event
                                        sched_migrate_task migrates
                                        process P to cpu-0

context_switch from swapper/0 to Process P
 switch_mm_irqs_off()
  /*
   * Since both prev and next mm struct are same we don't call
   * switch_mmu_context(). This will cause the HW SLB and SW preload
   * cache to go out of sync in preload_new_slb_context. Because there
   * was an SLB entry which was evicted from both HW and preload cache
   * on cpu-1. Now later in preload_new_slb_context(), when we will try
   * to add the same preload entry again, we will add this to the SW
   * preload cache and then will add it to the HW SLB. Since on cpu-0
   * this entry was never invalidated, hence adding this entry to the HW
   * SLB will cause a SLB multi-hit error.
   */
load_elf_binary continues...
 START_THREAD
  start_thread
   preload_new_slb_context
   /*
    * This tries to add a new EA to preload cache which was earlier
    * evicted from both cpu-1 HW SLB and preload cache. This caused the
    * HW SLB of cpu-0 to go out of sync with the SW preload cache. The
    * reason for this was, that when we context switched back on CPU-0,
    * we should have ideally called switch_mmu_context() which will
    * bring the HW SLB entries on CPU-0 in sync with SW preload cache
    * entries by setting up the mmu context properly. But we didn't do
    * that since the prev mm_struct running on cpu-0 was same as the
    * next mm_struct (which is true for swapper / kernel threads). So
    * now when we try to add this new entry into the HW SLB of cpu-0,
    * we hit a SLB multi-hit error.
    */

WARNING: CPU: 0 PID: 1810970 at arch/powerpc/mm/book3s64/slb.c:62
assert_slb_presence+0x2c/0x50(48 results) 02:47:29 [20157/42149]
Modules linked in:
CPU: 0 UID: 0 PID: 1810970 Comm: dd Not tainted 6.16.0-rc3-dirty #12
VOLUNTARY
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected)
0x4d0200 0xf000004 of:SLOF,HEAD hv:linux,kvm pSeries
NIP:  c00000000015426c LR: c0000000001543b4 CTR: 0000000000000000
REGS: c0000000497c77e0 TRAP: 0700   Not tainted  (6.16.0-rc3-dirty)
MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER: 00000000
CFAR: c0000000001543b0 IRQMASK: 3
<...>
NIP [c00000000015426c] assert_slb_presence+0x2c/0x50
LR [c0000000001543b4] slb_insert_entry+0x124/0x390
Call Trace:
  0x7fffceb5ffff (unreliable)
  preload_new_slb_context+0x100/0x1a0
  start_thread+0x26c/0x420
  load_elf_binary+0x1b04/0x1c40
  bprm_execve+0x358/0x680
  do_execveat_common+0x1f8/0x240
  sys_execve+0x58/0x70
  system_call_exception+0x114/0x300
  system_call_common+0x160/0x2c4

>From the above analysis, during early exec the hardware SLB is cleared,
and entries from the software preload cache are reloaded into hardware
by switch_slb. However, preload_new_slb_context and slb_setup_new_exec
also attempt to load some of the same entries, which can trigger a
multi-hit. In most cases, these additional preloads simply hit existing
entries and add nothing new. Removing these functions avoids redundant
preloads and eliminates the multi-hit issue. This patch removes these
two functions.

We tested process switching performance using the context_switch
benchmark on POWER9/hash, and observed no regression.

Without this patch: 129041 ops/sec
With this patch:    129341 ops/sec

We also measured SLB faults during boot, and the counts are essentially
the same with and without this patch.

SLB faults without this patch: 19727
SLB faults with this patch:    19786

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
cc:  <stable@vger.kernel.org>
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 -
 arch/powerpc/kernel/process.c                 |  5 --
 arch/powerpc/mm/book3s64/internal.h           |  2 -
 arch/powerpc/mm/book3s64/mmu_context.c        |  2 -
 arch/powerpc/mm/book3s64/slb.c                | 88 -------------------
 5 files changed, 98 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 1c4eebbc69c9..e1f77e2eead4 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -524,7 +524,6 @@ void slb_save_contents(struct slb_entry *slb_ptr);
 void slb_dump_contents(struct slb_entry *slb_ptr);

 extern void slb_vmalloc_update(void);
-void preload_new_slb_context(unsigned long start, unsigned long sp);

 #ifdef CONFIG_PPC_64S_HASH_MMU
 void slb_set_size(u16 size);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 855e09886503..2b9799157eb4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1897,8 +1897,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	return 0;
 }

-void preload_new_slb_context(unsigned long start, unsigned long sp);
-
 /*
  * Set up a thread for executing a new program
  */
@@ -1906,9 +1904,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 {
 #ifdef CONFIG_PPC64
 	unsigned long load_addr = regs->gpr[2];	/* saved by ELF_PLAT_INIT */
-
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
-		preload_new_slb_context(start, sp);
 #endif

 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index a57a25f06a21..c26a6f0c90fc 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -24,8 +24,6 @@ static inline bool stress_hpt(void)

 void hpt_do_stress(unsigned long ea, unsigned long hpte_group);

-void slb_setup_new_exec(void);
-
 void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);

 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 4e1e45420bd4..fb9dcf9ca599 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -150,8 +150,6 @@ static int hash__init_new_context(struct mm_struct *mm)
 void hash__setup_new_exec(void)
 {
 	slice_setup_new_exec();
-
-	slb_setup_new_exec();
 }
 #else
 static inline int hash__init_new_context(struct mm_struct *mm)
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6b783552403c..7e053c561a09 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -328,94 +328,6 @@ static void preload_age(struct thread_info *ti)
 	ti->slb_preload_tail = (ti->slb_preload_tail + 1) % SLB_PRELOAD_NR;
 }

-void slb_setup_new_exec(void)
-{
-	struct thread_info *ti = current_thread_info();
-	struct mm_struct *mm = current->mm;
-	unsigned long exec = 0x10000000;
-
-	WARN_ON(irqs_disabled());
-
-	/*
-	 * preload cache can only be used to determine whether a SLB
-	 * entry exists if it does not start to overflow.
-	 */
-	if (ti->slb_preload_nr + 2 > SLB_PRELOAD_NR)
-		return;
-
-	hard_irq_disable();
-
-	/*
-	 * We have no good place to clear the slb preload cache on exec,
-	 * flush_thread is about the earliest arch hook but that happens
-	 * after we switch to the mm and have already preloaded the SLBEs.
-	 *
-	 * For the most part that's probably okay to use entries from the
-	 * previous exec, they will age out if unused. It may turn out to
-	 * be an advantage to clear the cache before switching to it,
-	 * however.
-	 */
-
-	/*
-	 * preload some userspace segments into the SLB.
-	 * Almost all 32 and 64bit PowerPC executables are linked at
-	 * 0x10000000 so it makes sense to preload this segment.
-	 */
-	if (!is_kernel_addr(exec)) {
-		if (preload_add(ti, exec))
-			slb_allocate_user(mm, exec);
-	}
-
-	/* Libraries and mmaps. */
-	if (!is_kernel_addr(mm->mmap_base)) {
-		if (preload_add(ti, mm->mmap_base))
-			slb_allocate_user(mm, mm->mmap_base);
-	}
-
-	/* see switch_slb */
-	asm volatile("isync" : : : "memory");
-
-	local_irq_enable();
-}
-
-void preload_new_slb_context(unsigned long start, unsigned long sp)
-{
-	struct thread_info *ti = current_thread_info();
-	struct mm_struct *mm = current->mm;
-	unsigned long heap = mm->start_brk;
-
-	WARN_ON(irqs_disabled());
-
-	/* see above */
-	if (ti->slb_preload_nr + 3 > SLB_PRELOAD_NR)
-		return;
-
-	hard_irq_disable();
-
-	/* Userspace entry address. */
-	if (!is_kernel_addr(start)) {
-		if (preload_add(ti, start))
-			slb_allocate_user(mm, start);
-	}
-
-	/* Top of stack, grows down. */
-	if (!is_kernel_addr(sp)) {
-		if (preload_add(ti, sp))
-			slb_allocate_user(mm, sp);
-	}
-
-	/* Bottom of heap, grows up. */
-	if (heap && !is_kernel_addr(heap)) {
-		if (preload_add(ti, heap))
-			slb_allocate_user(mm, heap);
-	}
-
-	/* see switch_slb */
-	asm volatile("isync" : : : "memory");
-
-	local_irq_enable();
-}
-
 static void slb_cache_slbie_kernel(unsigned int index)
 {
 	unsigned long slbie_data = get_paca()->slb_cache[index];
--
2.50.1


