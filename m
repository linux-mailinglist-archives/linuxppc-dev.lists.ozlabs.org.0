Return-Path: <linuxppc-dev+bounces-13557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D14C20CA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 16:00:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy6jH0Kb3z3cQx;
	Fri, 31 Oct 2025 02:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761836402;
	cv=none; b=Mde7LAv89GgSyEh2VvrugzCefcem9JfI8YHMDuF9qNXU/QIZk18sG5a84wpz2nYTMzj/PlgyIn90GLxLw6guW3dE2NRtOZCtdL48mqBrKX4/+1OE8duh/7tBN/aaqWlnLLk3jNX93hfp0YNplJVAsffFlWB1PHHMpFliCRj8LXXIXBabj1WZnIDHU8OKe97/Xe4LELA8eSeOrEYZoakMzm9nhRca5/iAfGwmyp7j3SXqoUnXrUqSKILA+ygcW2GU1z5XgtePyU7rKV8jwftPH61fyKi+FSZxvbLyLnHsyJgKu9WHl2kX6JgrFD6p8O39dSvMdVpRTPIeX1PuXjc7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761836402; c=relaxed/relaxed;
	bh=uuziBlgvOH0r9+656GUlSCaphYP6g+B0/PWKSYQ90SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SUU2sEm4etzEnVgJ7+4nsrcF7nSqoinYwerh/l5xTVVopeUc74g9TrZPUw31aRoTWCpoEF5dm1yUIbtVr0gAjnZQ6k/GnDhL/ZS6pycD64KbcGdEf4g4Z2+NproVmxbUyy7Y8AUWBaGI5Qvp+WyMPXLj1PHa+V1Bi3fTy2QFVL32q/4IQNCZIGQQju1STAJnDdJdPN5TPJAZDs5NV/EcoXyIcVsBEAJGxWbCYDegF+FQLLJGHNtGoeY1HhBwvUE032/iAOomkVrZ+bKexltLZ3Oq4gow/ditcctHhjww8noOVSsMueCi1rzwh/mgpX9wy12hIyxr0u8iB8tZOoE1+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wpmp+EW8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wpmp+EW8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy6jF1sR1z3bfQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 02:00:01 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1233913b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761836399; x=1762441199; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuziBlgvOH0r9+656GUlSCaphYP6g+B0/PWKSYQ90SI=;
        b=Wpmp+EW8Uz0nOuh7gojRqnkBR4Fhw/VCRUSjTHzQwYBHuZqBEXDJ2f5YQndIYZmd+I
         1O+qvM7w3Nk0ZzB4A1vjdqZ7kmpa1NlC+0RBsoBcfRw/9AjOaF+GkBeRs15Ti6woVHEe
         YqvzdqVVf0y5V8oAeim4Js/52WUeWelkf1fwVedD8KkMEiREofOtrRsqf3VNxMxdprtn
         Suw/uon75NFQAckOff1YOyvOzE5ZJFPUTeBx2HfpWp//oFz+YA1+yL1KPLpWHFy+RO45
         ifAIj+p3yVKvrJ8YKqLvFhuaj5SggNfpwJK7h4BlUL+r+KCEfK7UcjGObkeLfX8tkfLw
         Dn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761836399; x=1762441199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuziBlgvOH0r9+656GUlSCaphYP6g+B0/PWKSYQ90SI=;
        b=tb5AzAciYBVYvpkpsP9UZ9mCa5laEKYj19RFCT7hMR3Nk0C+GBgGZeaS//aDw4/8Ja
         pmcF5ylZvT0f/cCCC/GJhxwyKdNow0I/TuNYJpOxsClB5FenT5or4KWRz0NUcZMMeRb3
         taA+ZgwTfnrH8AjYgWR4dNeD+04mJjgQyvtEXSIM+OM4ihM/kqluSiHrBrEqEcAFPL2F
         VVPmDD617sOIAo6/g+xSlIsKuVe5pDLLOPhgtSB0uJwXMQhl7xI0ODSeiFHXmqYNagDn
         zeNKCbEtaHol71ITbMqho0XC69ubfMuy2cjFVKZFVLTh9IGfVAy7oTMzOJibAbfHTMzg
         +RIw==
X-Gm-Message-State: AOJu0YydUwKnuT78wT4uVvNXiVCPlVPz4akmEri8HmOhgIW5v7/AwvxU
	BpB06vQmkrrZH75s3Wsw1+i8Z/7baKkH98C49VH1gUh3xqYCq9+SoGmmFB8yjHUK
X-Gm-Gg: ASbGncvWsIYMblJotkHyBhtpvj/9mrmBB+pEIsQwuPwV05fxA414rJt0f8NKmSq4dAm
	eRbSWeOLIsU2s63PCiTz4qjcNgzzED97Vc2vJngSjCwKGWZC3eviDg9rmdkfvRtdbGsH3r8y8hu
	+UMNvM1wxyIpUCOVY3pBxZMWHfxeC0H/HrOQxivxBTAG7z5C9LSrMbEbUpsJkSP1tV4xZSpjZ8b
	um3QOeu5dggHroG5MPMUxCx22HEk1DpeVNNTqDZwucBeQZpXPYEelE/VpCOb7h7YnzzSLv9RFgy
	eOnO4yhjGHcdw2tNaMQg0hESjbd2efpPuRKx8sPd6yAL1z5BK1oldV5tVMk4Ycp1CtxyiP5Kq31
	CETSaXeWpABGhBBLYJ3XSvEC1d0hxHQVbywE59DofHPASzcSum2cXrPSAxZFyrw2pjVUAvw==
X-Google-Smtp-Source: AGHT+IFyFNsRceHmA/6OOSoHT8exNmg5rVyB4OkfPv6gvIRtn6n8VuUmm9UF30h+wOYMtSuHhJwWYQ==
X-Received: by 2002:a05:6a00:1742:b0:7a1:49f7:ad04 with SMTP id d2e1a72fcca58-7a4e2dfd22fmr9588913b3a.14.1761836398762;
        Thu, 30 Oct 2025 07:59:58 -0700 (PDT)
Received: from dw-tp ([171.76.85.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41404987esm18594112b3a.36.2025.10.30.07.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 07:59:57 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>,
	Pavithra Prakash <pavrampu@linux.ibm.com>,
	stable@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 01/11] powerpc/64s/slb: Fix SLB multihit issue during SLB preload
Date: Thu, 30 Oct 2025 20:27:26 +0530
Message-ID: <0ac694ae683494fe8cadbd911a1a5018d5d3c541.1761834163.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1761834163.git.ritesh.list@gmail.com>
References: <cover.1761834163.git.ritesh.list@gmail.com>
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
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: <linuxppc-dev@lists.ozlabs.org>
Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
cc: <stable@vger.kernel.org>
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 -
 arch/powerpc/kernel/process.c                 |  5 --
 arch/powerpc/mm/book3s64/internal.h           |  2 -
 arch/powerpc/mm/book3s64/mmu_context.c        |  2 -
 arch/powerpc/mm/book3s64/slb.c                | 88 -------------------
 5 files changed, 98 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 346351423207..af12e2ba8eb8 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -524,7 +524,6 @@ void slb_save_contents(struct slb_entry *slb_ptr);
 void slb_dump_contents(struct slb_entry *slb_ptr);
 
 extern void slb_vmalloc_update(void);
-void preload_new_slb_context(unsigned long start, unsigned long sp);
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 void slb_set_size(u16 size);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index eb23966ac0a9..a45fe147868b 100644
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
2.51.0


