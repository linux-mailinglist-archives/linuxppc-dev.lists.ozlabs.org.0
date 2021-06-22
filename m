Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA33AFCD7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:05:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8G8j5Lw2z3c3V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 16:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dy84to82;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dy84to82; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8G7f5Nxcz302y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 16:04:30 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id v13so9869930ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 23:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8eg43PpaY6wVj1dM6eyKVmax93VWZ6mFDl2VZ8j6wlU=;
 b=dy84to82ZX2UOdhu6wZE4EF/6HSacVerA4NCaBtwaW3077vEy8nM7YjdQ9QlpXlgKc
 v31jsI6P3wyARwB2CwxQcguOMXpOUVbqpivkhK71ZNvmRo/Zvv25z/EJktXg74HusVWK
 PbHu3dWTBgXgXnorjwpF2C8d9/ExwU2FzHCDNfDNO677UlBTxcQgKf+ZY+MqL96hPTVu
 GQBOkG3WUZRhmFKCFRbwlr/McuMtuSw2/S944EyX5Xv3pAmoAt7skpmQOEsUen+YLiEW
 O+z5hF8Smm31UkY4rHczLTQBzcqrpqhPFigJZNzTMW7eXHEWSZ9Uk4cJX6+dyewLUCjv
 2AMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8eg43PpaY6wVj1dM6eyKVmax93VWZ6mFDl2VZ8j6wlU=;
 b=Eov4wj7+TR5yVMoljXdijpIhd5pasFZxLkE+v8cZDwOWl8E0pp3M5O1N92irjaHVrg
 ED7Khsgo6MdDZG1a8Gg89uWtS83mKiD/Qyp91mL49m07AaF/ABSSZgCfgllijS4uE5DO
 c8e2NwOZBX8X6WkqNlSDn3CaLvnL83MtlZU1qVOqCrNGU7h6Ja23l/Xy6JVOuUxdnSFg
 +2e3UQZldABYQa9Z+R+vtmeihEWJwijUu6v71jKZBy3aH9kGsiDiHEfLRIZLy1aVmrpl
 NI2tkxiTbEqA0wHCRhnDzovWJYKezsWbyW20XwNMzKE5kxmixtO/MKKRAozryCgAsUX/
 kAjA==
X-Gm-Message-State: AOAM533PNIU9C3eapmHF/AM2sb0o0H3+1/pc6xCNY9PmBreMuHIRssRA
 1va18YIwmrPpZMMPgq8ewKYKjYUXLK4=
X-Google-Smtp-Source: ABdhPJym8s7C1nKMJHv/H2QviXg2IWOFnFjExBU+Hk+WsYdcwg2knFzZQZ49hkZ7rEexh0HBFoDIxg==
X-Received: by 2002:a17:902:6b04:b029:10b:cf5c:3739 with SMTP id
 o4-20020a1709026b04b029010bcf5c3739mr21088289plk.76.1624341866307; 
 Mon, 21 Jun 2021 23:04:26 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id n33sm11394751pgm.55.2021.06.21.23.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 23:04:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s: Fix "avoid reloading (H)SRR registers if
 they are still valid"
Date: Tue, 22 Jun 2021 16:04:15 +1000
Message-Id: <20210622060416.548187-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622060416.548187-1-npiggin@gmail.com>
References: <20210622060416.548187-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This picks up a bunch of srr invalidation cases missed, and tries to
convert the entire tree including 64e and 32-bit to use the accessors,
to save headaches in future. It also avoids doing the general clobber
after changing several things, to always using the accessors (a few
extra stores to paca is less important than simplicity of the code).
Only one place left where return regs are invalidated is context switching.
This also fixes a bug in context switching due to that invalidation not
being done for a newly created task due to the way ret_from_fork etc works.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/interrupt.h          |  2 +-
 arch/powerpc/include/asm/livepatch.h          |  2 +-
 arch/powerpc/include/asm/probes.h             |  4 +-
 arch/powerpc/include/asm/ptrace.h             |  2 +-
 arch/powerpc/kernel/hw_breakpoint.c           |  4 +-
 arch/powerpc/kernel/kgdb.c                    |  8 ++--
 arch/powerpc/kernel/kprobes-ftrace.c          |  2 +-
 arch/powerpc/kernel/kprobes.c                 | 13 +++---
 arch/powerpc/kernel/mce.c                     |  2 +-
 arch/powerpc/kernel/optprobes.c               |  2 +-
 arch/powerpc/kernel/process.c                 | 24 +++++------
 arch/powerpc/kernel/ptrace/ptrace-adv.c       | 20 +++++----
 arch/powerpc/kernel/ptrace/ptrace-noadv.c     | 14 +++----
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  5 ++-
 arch/powerpc/kernel/signal.c                  | 10 ++---
 arch/powerpc/kernel/signal_32.c               | 42 +++++++++----------
 arch/powerpc/kernel/signal_64.c               | 35 +++++++---------
 arch/powerpc/kernel/traps.c                   | 24 +++++------
 arch/powerpc/kernel/uprobes.c                 |  4 +-
 arch/powerpc/lib/error-inject.c               |  2 +-
 arch/powerpc/lib/sstep.c                      | 17 ++++----
 arch/powerpc/lib/test_emulate_step.c          |  1 +
 arch/powerpc/math-emu/math_efp.c              |  2 +-
 arch/powerpc/platforms/embedded6xx/holly.c    |  4 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  4 +-
 arch/powerpc/platforms/pasemi/idle.c          |  4 +-
 arch/powerpc/platforms/powernv/opal.c         |  2 +-
 arch/powerpc/platforms/pseries/ras.c          |  4 +-
 arch/powerpc/sysdev/fsl_rio.c                 |  4 +-
 arch/powerpc/xmon/xmon.c                      | 14 +++----
 30 files changed, 135 insertions(+), 142 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 6e9d18838d56..de36fb5d9c51 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -91,7 +91,7 @@ static inline void nap_adjust_return(struct pt_regs *regs)
 	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
 		/* Can avoid a test-and-clear because NMIs do not call this */
 		clear_thread_local_flags(_TLF_NAPPING);
-		regs->nip = (unsigned long)power4_idle_nap_return;
+		regs_set_return_ip(regs, (unsigned long)power4_idle_nap_return);
 	}
 #endif
 }
diff --git a/arch/powerpc/include/asm/livepatch.h b/arch/powerpc/include/asm/livepatch.h
index ae25e6e72997..4fe018cc207b 100644
--- a/arch/powerpc/include/asm/livepatch.h
+++ b/arch/powerpc/include/asm/livepatch.h
@@ -16,7 +16,7 @@ static inline void klp_arch_set_pc(struct ftrace_regs *fregs, unsigned long ip)
 {
 	struct pt_regs *regs = ftrace_get_regs(fregs);
 
-	regs->nip = ip;
+	regs_set_return_ip(regs, ip);
 }
 
 #define klp_get_ftrace_location klp_get_ftrace_location
diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm/probes.h
index 84dd1addd434..c5d984700d24 100644
--- a/arch/powerpc/include/asm/probes.h
+++ b/arch/powerpc/include/asm/probes.h
@@ -34,14 +34,14 @@ typedef u32 ppc_opcode_t;
 /* Enable single stepping for the current task */
 static inline void enable_single_step(struct pt_regs *regs)
 {
-	regs->msr |= MSR_SINGLESTEP;
+	regs_set_return_msr(regs, regs->msr | MSR_SINGLESTEP);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 	/*
 	 * We turn off Critical Input Exception(CE) to ensure that the single
 	 * step will be for the instruction we have the probe on; if we don't,
 	 * it is possible we'd get the single step reported for CE.
 	 */
-	regs->msr &= ~MSR_CE;
+	regs_set_return_msr(regs, regs->msr & ~MSR_CE);
 	mtspr(SPRN_DBCR0, mfspr(SPRN_DBCR0) | DBCR0_IC | DBCR0_IDM);
 #ifdef CONFIG_PPC_47x
 	isync();
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index cd01423b1c24..891ac7189d31 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -242,7 +242,7 @@ static inline void regs_set_return_msr(struct pt_regs *regs, unsigned long msr)
 #endif
 }
 
-static inline void return_ip_or_msr_changed(void)
+static inline void set_return_regs_changed(void)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
 	local_paca->hsrr_valid = 0;
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index 8fc7a14e4d71..21a638aff72f 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -486,7 +486,7 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
 	return;
 
 reset:
-	regs->msr &= ~MSR_SE;
+	regs_set_return_msr(regs, regs->msr & ~MSR_SE);
 	for (i = 0; i < nr_wp_slots(); i++) {
 		info = counter_arch_bp(__this_cpu_read(bp_per_reg[i]));
 		__set_breakpoint(i, info);
@@ -537,7 +537,7 @@ static bool stepping_handler(struct pt_regs *regs, struct perf_event **bp,
 			current->thread.last_hit_ubp[i] = bp[i];
 			info[i] = NULL;
 		}
-		regs->msr |= MSR_SE;
+		regs_set_return_msr(regs, regs->msr | MSR_SE);
 		return false;
 	}
 
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index 26163497d69e..e512fa90ab1b 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -372,7 +372,7 @@ int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
 
 void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
 {
-	regs->nip = pc;
+	regs_set_return_ip(regs, pc);
 }
 
 /*
@@ -394,7 +394,7 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 	case 'c':
 		/* handle the optional parameter */
 		if (kgdb_hex2long(&ptr, &addr))
-			linux_regs->nip = addr;
+			regs_set_return_ip(linux_regs, addr);
 
 		atomic_set(&kgdb_cpu_doing_single_step, -1);
 		/* set the trace bit if we're stepping */
@@ -402,9 +402,9 @@ int kgdb_arch_handle_exception(int vector, int signo, int err_code,
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 			mtspr(SPRN_DBCR0,
 			      mfspr(SPRN_DBCR0) | DBCR0_IC | DBCR0_IDM);
-			linux_regs->msr |= MSR_DE;
+			regs_set_return_msr(linux_regs, linux_regs->msr | MSR_DE);
 #else
-			linux_regs->msr |= MSR_SE;
+			regs_set_return_msr(linux_regs, linux_regs->msr | MSR_SE);
 #endif
 			atomic_set(&kgdb_cpu_doing_single_step,
 				   raw_smp_processor_id());
diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
index a4965a32628a..7154d58338cc 100644
--- a/arch/powerpc/kernel/kprobes-ftrace.c
+++ b/arch/powerpc/kernel/kprobes-ftrace.c
@@ -39,7 +39,7 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
 		 * On powerpc, NIP is *before* this instruction for the
 		 * pre handler
 		 */
-		regs->nip -= MCOUNT_INSN_SIZE;
+		regs_add_return_ip(regs, -MCOUNT_INSN_SIZE);
 
 		__this_cpu_write(current_kprobe, p);
 		kcb->kprobe_status = KPROBE_HIT_ACTIVE;
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index a574712ef23b..e357dae2d35b 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -319,8 +319,9 @@ int kprobe_handler(struct pt_regs *regs)
 		kprobe_opcode_t insn = *p->ainsn.insn;
 		if (kcb->kprobe_status == KPROBE_HIT_SS && is_trap(insn)) {
 			/* Turn off 'trace' bits */
-			regs->msr &= ~MSR_SINGLESTEP;
-			regs->msr |= kcb->kprobe_saved_msr;
+			regs_set_return_msr(regs,
+				(regs->msr & ~MSR_SINGLESTEP) |
+				kcb->kprobe_saved_msr);
 			goto no_kprobe;
 		}
 
@@ -451,7 +452,7 @@ int kprobe_post_handler(struct pt_regs *regs)
 
 	/* Adjust nip to after the single-stepped instruction */
 	regs_set_return_ip(regs, (unsigned long)cur->addr + len);
-	regs->msr |= kcb->kprobe_saved_msr;
+	regs_set_return_msr(regs, regs->msr | kcb->kprobe_saved_msr);
 
 	/*Restore back the original saved kprobes variables and continue. */
 	if (kcb->kprobe_status == KPROBE_REENTER) {
@@ -491,8 +492,10 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 		 * normal page fault.
 		 */
 		regs_set_return_ip(regs, (unsigned long)cur->addr);
-		regs->msr &= ~MSR_SINGLESTEP; /* Turn off 'trace' bits */
-		regs->msr |= kcb->kprobe_saved_msr;
+		/* Turn off 'trace' bits */
+		regs_set_return_msr(regs,
+			(regs->msr & ~MSR_SINGLESTEP) |
+			kcb->kprobe_saved_msr);
 		if (kcb->kprobe_status == KPROBE_REENTER)
 			restore_previous_kprobe(kcb);
 		else
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 9a3c2a84a2ac..f4b922a1e6ad 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -273,7 +273,7 @@ void mce_common_process_ue(struct pt_regs *regs,
 	entry = search_kernel_exception_table(regs->nip);
 	if (entry) {
 		mce_err->ignore_event = true;
-		regs->nip = extable_fixup(entry);
+		regs_set_return_ip(regs, extable_fixup(entry));
 	}
 }
 
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index cdf87086fa33..1bd291472dc9 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -123,7 +123,7 @@ static void optimized_callback(struct optimized_kprobe *op,
 		kprobes_inc_nmissed_count(&op->kp);
 	} else {
 		__this_cpu_write(current_kprobe, &op->kp);
-		regs->nip = (unsigned long)op->kp.addr;
+		regs_set_return_ip(regs, (unsigned long)op->kp.addr);
 		get_kprobe_ctlblk()->kprobe_status = KPROBE_HIT_ACTIVE;
 		opt_pre_handler(&op->kp, regs);
 		__this_cpu_write(current_kprobe, NULL);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index a2720e460ef0..2e55597b06c3 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1115,7 +1115,7 @@ void restore_tm_state(struct pt_regs *regs)
 #endif
 	restore_math(regs);
 
-	regs->msr |= msr_diff;
+	regs_set_return_msr(regs, regs->msr | msr_diff);
 }
 
 #else /* !CONFIG_PPC_TRANSACTIONAL_MEM */
@@ -1262,14 +1262,16 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	}
 
 	/*
-	 * Call restore_sprs() before calling _switch(). If we move it after
-	 * _switch() then we miss out on calling it for new tasks. The reason
-	 * for this is we manually create a stack frame for new tasks that
-	 * directly returns through ret_from_fork() or
+	 * Call restore_sprs() and set_return_regs_changed() before calling
+	 * _switch(). If we move it after _switch() then we miss out on calling
+	 * it for new tasks. The reason for this is we manually create a stack
+	 * frame for new tasks that directly returns through ret_from_fork() or
 	 * ret_from_kernel_thread(). See copy_thread() for details.
 	 */
 	restore_sprs(old_thread, new_thread);
 
+	set_return_regs_changed(); /* _switch changes stack (and regs) */
+
 #ifdef CONFIG_PPC32
 	kuap_assert_locked();
 #endif
@@ -1304,8 +1306,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
 		restore_math(current->thread.regs);
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
-	return_ip_or_msr_changed();
-
 	return last;
 }
 
@@ -1857,16 +1857,14 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 			}
 			regs->gpr[2] = toc;
 		}
-		regs->nip = entry;
-		regs->msr = MSR_USER64;
+		regs_set_return_ip(regs, entry);
+		regs_set_return_msr(regs, MSR_USER64);
 	} else {
-		regs->nip = start;
 		regs->gpr[2] = 0;
-		regs->msr = MSR_USER32;
+		regs_set_return_ip(regs, start);
+		regs_set_return_msr(regs, MSR_USER32);
 	}
 
-	return_ip_or_msr_changed();
-
 #endif
 #ifdef CONFIG_VSX
 	current->thread.used_vsr = 0;
diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
index 3990c01ef8cf..399f5d94a3df 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -12,7 +12,7 @@ void user_enable_single_step(struct task_struct *task)
 	if (regs != NULL) {
 		task->thread.debug.dbcr0 &= ~DBCR0_BT;
 		task->thread.debug.dbcr0 |= DBCR0_IDM | DBCR0_IC;
-		regs->msr |= MSR_DE;
+		regs_set_return_msr(regs, regs->msr | MSR_DE);
 	}
 	set_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
@@ -24,7 +24,7 @@ void user_enable_block_step(struct task_struct *task)
 	if (regs != NULL) {
 		task->thread.debug.dbcr0 &= ~DBCR0_IC;
 		task->thread.debug.dbcr0 = DBCR0_IDM | DBCR0_BT;
-		regs->msr |= MSR_DE;
+		regs_set_return_msr(regs, regs->msr | MSR_DE);
 	}
 	set_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
@@ -50,7 +50,7 @@ void user_disable_single_step(struct task_struct *task)
 			 * All debug events were off.....
 			 */
 			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
-			regs->msr &= ~MSR_DE;
+			regs_set_return_msr(regs, regs->msr & ~MSR_DE);
 		}
 	}
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
@@ -82,6 +82,7 @@ int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
 {
+	struct pt_regs *regs = task->thread.regs;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 	int ret;
 	struct thread_struct *thread = &task->thread;
@@ -112,7 +113,7 @@ int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned l
 		dbcr_dac(task) &= ~(DBCR_DAC1R | DBCR_DAC1W);
 		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
 					task->thread.debug.dbcr1)) {
-			task->thread.regs->msr &= ~MSR_DE;
+			regs_set_return_msr(regs, regs->msr & ~MSR_DE);
 			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
 		}
 		return 0;
@@ -132,7 +133,7 @@ int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned l
 		dbcr_dac(task) |= DBCR_DAC1R;
 	if (data & 0x2UL)
 		dbcr_dac(task) |= DBCR_DAC1W;
-	task->thread.regs->msr |= MSR_DE;
+	regs_set_return_msr(regs, regs->msr | MSR_DE);
 	return 0;
 }
 
@@ -220,7 +221,7 @@ static long set_instruction_bp(struct task_struct *child,
 	}
 out:
 	child->thread.debug.dbcr0 |= DBCR0_IDM;
-	child->thread.regs->msr |= MSR_DE;
+	regs_set_return_msr(child->thread.regs, child->thread.regs->msr | MSR_DE);
 
 	return slot;
 }
@@ -336,7 +337,7 @@ static int set_dac(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
 		return -ENOSPC;
 	}
 	child->thread.debug.dbcr0 |= DBCR0_IDM;
-	child->thread.regs->msr |= MSR_DE;
+	regs_set_return_msr(child->thread.regs, child->thread.regs->msr | MSR_DE);
 
 	return slot + 4;
 }
@@ -430,7 +431,7 @@ static int set_dac_range(struct task_struct *child,
 		child->thread.debug.dbcr2  |= DBCR2_DAC12MX;
 	else	/* PPC_BREAKPOINT_MODE_MASK */
 		child->thread.debug.dbcr2  |= DBCR2_DAC12MM;
-	child->thread.regs->msr |= MSR_DE;
+	regs_set_return_msr(child->thread.regs, child->thread.regs->msr | MSR_DE);
 
 	return 5;
 }
@@ -485,7 +486,8 @@ long ppc_del_hwdebug(struct task_struct *child, long data)
 		if (!DBCR_ACTIVE_EVENTS(child->thread.debug.dbcr0,
 					child->thread.debug.dbcr1)) {
 			child->thread.debug.dbcr0 &= ~DBCR0_IDM;
-			child->thread.regs->msr &= ~MSR_DE;
+			regs_set_return_msr(child->thread.regs,
+					child->thread.regs->msr & ~MSR_DE);
 		}
 	}
 	return rc;
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index aa36fcad36cd..a5dd7d2e2c9e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -11,10 +11,8 @@ void user_enable_single_step(struct task_struct *task)
 {
 	struct pt_regs *regs = task->thread.regs;
 
-	if (regs != NULL) {
-		regs->msr &= ~MSR_BE;
-		regs->msr |= MSR_SE;
-	}
+	if (regs != NULL)
+		regs_set_return_msr(regs, (regs->msr & ~MSR_BE) | MSR_SE);
 	set_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
@@ -22,10 +20,8 @@ void user_enable_block_step(struct task_struct *task)
 {
 	struct pt_regs *regs = task->thread.regs;
 
-	if (regs != NULL) {
-		regs->msr &= ~MSR_SE;
-		regs->msr |= MSR_BE;
-	}
+	if (regs != NULL)
+		regs_set_return_msr(regs, (regs->msr & ~MSR_SE) | MSR_BE);
 	set_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
@@ -34,7 +30,7 @@ void user_disable_single_step(struct task_struct *task)
 	struct pt_regs *regs = task->thread.regs;
 
 	if (regs != NULL)
-		regs->msr &= ~(MSR_SE | MSR_BE);
+		regs_set_return_msr(regs, regs->msr & ~(MSR_SE | MSR_BE));
 
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 773bcc4ca843..b8be1d6668b5 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -113,8 +113,9 @@ static unsigned long get_user_msr(struct task_struct *task)
 
 static __always_inline int set_user_msr(struct task_struct *task, unsigned long msr)
 {
-	task->thread.regs->msr &= ~MSR_DEBUGCHANGE;
-	task->thread.regs->msr |= msr & MSR_DEBUGCHANGE;
+	unsigned long newmsr = (task->thread.regs->msr & ~MSR_DEBUGCHANGE) |
+				(msr & MSR_DEBUGCHANGE);
+	regs_set_return_msr(task->thread.regs, newmsr);
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 3f851fa8f5f1..e600764a926c 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -322,16 +322,16 @@ static unsigned long get_tm_stackpointer(struct task_struct *tsk)
 	 * For signals taken in non-TM or suspended mode, we use the
 	 * normal/non-checkpointed stack pointer.
 	 */
-
-	unsigned long ret = tsk->thread.regs->gpr[1];
+	struct pt_regs *regs = tsk->thread.regs;
+	unsigned long ret = regs->gpr[1];
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	BUG_ON(tsk != current);
 
-	if (MSR_TM_ACTIVE(tsk->thread.regs->msr)) {
+	if (MSR_TM_ACTIVE(regs->msr)) {
 		preempt_disable();
 		tm_reclaim_current(TM_CAUSE_SIGNAL);
-		if (MSR_TM_TRANSACTIONAL(tsk->thread.regs->msr))
+		if (MSR_TM_TRANSACTIONAL(regs->msr))
 			ret = tsk->thread.ckpt_regs.gpr[1];
 
 		/*
@@ -341,7 +341,7 @@ static unsigned long get_tm_stackpointer(struct task_struct *tsk)
 		 * (tm_recheckpoint_new_task() would recheckpoint). Besides, we
 		 * enter the signal handler in non-transactional state.
 		 */
-		tsk->thread.regs->msr &= ~MSR_TS_MASK;
+		regs_set_return_msr(regs, regs->msr & ~MSR_TS_MASK);
 		preempt_enable();
 	}
 #endif
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 8f05ed0da292..e482baf2868c 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -505,14 +505,14 @@ static long restore_user_regs(struct pt_regs *regs,
 
 	/* if doing signal return, restore the previous little-endian mode */
 	if (sig)
-		regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
+		regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (msr & MSR_LE));
 
 #ifdef CONFIG_ALTIVEC
 	/*
 	 * Force the process to reload the altivec registers from
 	 * current->thread when it next does altivec instructions
 	 */
-	regs->msr &= ~MSR_VEC;
+	regs_set_return_msr(regs, regs->msr & ~MSR_VEC);
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
 		unsafe_copy_from_user(&current->thread.vr_state, &sr->mc_vregs,
@@ -534,7 +534,7 @@ static long restore_user_regs(struct pt_regs *regs,
 	 * Force the process to reload the VSX registers from
 	 * current->thread when it next does VSX instruction.
 	 */
-	regs->msr &= ~MSR_VSX;
+	regs_set_return_msr(regs, regs->msr & ~MSR_VSX);
 	if (msr & MSR_VSX) {
 		/*
 		 * Restore altivec registers from the stack to a local
@@ -550,12 +550,12 @@ static long restore_user_regs(struct pt_regs *regs,
 	 * force the process to reload the FP registers from
 	 * current->thread when it next does FP instructions
 	 */
-	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1);
+	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1));
 
 #ifdef CONFIG_SPE
 	/* force the process to reload the spe registers from
 	   current->thread when it next does spe instructions */
-	regs->msr &= ~MSR_SPE;
+	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
 		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
@@ -608,10 +608,10 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
 
 	/* Restore the previous little-endian mode */
-	regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (msr & MSR_LE));
 
 #ifdef CONFIG_ALTIVEC
-	regs->msr &= ~MSR_VEC;
+	regs_set_return_msr(regs, regs->msr & ~MSR_VEC);
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
 		unsafe_copy_from_user(&current->thread.ckvr_state, &sr->mc_vregs,
@@ -631,12 +631,12 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		mtspr(SPRN_VRSAVE, current->thread.ckvrsave);
 #endif /* CONFIG_ALTIVEC */
 
-	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1);
+	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1));
 
 	unsafe_copy_fpr_from_user(current, &sr->mc_fregs, failed);
 
 #ifdef CONFIG_VSX
-	regs->msr &= ~MSR_VSX;
+	regs_set_return_msr(regs, regs->msr & ~MSR_VSX);
 	if (msr & MSR_VSX) {
 		/*
 		 * Restore altivec registers from the stack to a local
@@ -655,7 +655,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	/* SPE regs are not checkpointed with TM, so this section is
 	 * simply the same as in restore_user_regs().
 	 */
-	regs->msr &= ~MSR_SPE;
+	regs_set_return_msr(regs, regs->msr & ~MSR_SPE);
 	if (msr & MSR_SPE) {
 		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
 				      ELF_NEVRREG * sizeof(u32), failed);
@@ -725,7 +725,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	 *
 	 * Pull in the MSR TM bits from the user context
 	 */
-	regs->msr = (regs->msr & ~MSR_TS_MASK) | (msr_hi & MSR_TS_MASK);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_TS_MASK) | (msr_hi & MSR_TS_MASK));
 	/* Now, recheckpoint.  This loads up all of the checkpointed (older)
 	 * registers, including FP and V[S]Rs.  After recheckpointing, the
 	 * transactional versions should be loaded.
@@ -740,12 +740,12 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	msr_check_and_set(msr & (MSR_FP | MSR_VEC));
 	if (msr & MSR_FP) {
 		load_fp_state(&current->thread.fp_state);
-		regs->msr |= (MSR_FP | current->thread.fpexc_mode);
+		regs_set_return_msr(regs, regs->msr | (MSR_FP | current->thread.fpexc_mode));
 	}
 #ifdef CONFIG_ALTIVEC
 	if (msr & MSR_VEC) {
 		load_vr_state(&current->thread.vr_state);
-		regs->msr |= MSR_VEC;
+		regs_set_return_msr(regs, regs->msr | MSR_VEC);
 	}
 #endif
 
@@ -858,10 +858,10 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->gpr[4] = (unsigned long)&frame->info;
 	regs->gpr[5] = (unsigned long)&frame->uc;
 	regs->gpr[6] = (unsigned long)frame;
-	regs->nip = (unsigned long) ksig->ka.sa.sa_handler;
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
 	/* enter the signal handler in native-endian mode */
-	regs->msr &= ~MSR_LE;
-	regs->msr |= (MSR_KERNEL & MSR_LE);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
+
 	return 0;
 
 failed:
@@ -947,10 +947,10 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->gpr[1] = newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->gpr[4] = (unsigned long) sc;
-	regs->nip = (unsigned long)ksig->ka.sa.sa_handler;
+	regs_set_return_ip(regs, (unsigned long) ksig->ka.sa.sa_handler);
 	/* enter the signal handler in native-endian mode */
-	regs->msr &= ~MSR_LE;
-	regs->msr |= (MSR_KERNEL & MSR_LE);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
+
 	return 0;
 
 failed:
@@ -1200,7 +1200,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * set, and recheckpoint was not called. This avoid
 		 * hitting a TM Bad thing at RFID
 		 */
-		regs->msr &= ~MSR_TS_MASK;
+		regs_set_return_msr(regs, regs->msr & ~MSR_TS_MASK);
 	}
 	/* Fall through, for non-TM restore */
 #endif
@@ -1289,7 +1289,7 @@ SYSCALL_DEFINE3(debug_setcontext, struct ucontext __user *, ctx,
 	   affect the contents of these registers.  After this point,
 	   failure is a problem, anyway, and it's very unlikely unless
 	   the user is really doing something wrong. */
-	regs->msr = new_msr;
+	regs_set_return_msr(regs, new_msr);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 	current->thread.debug.dbcr0 = new_dbcr0;
 #endif
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 18cfadf57792..d89d93d7300e 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -354,7 +354,7 @@ static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_
 	/* get MSR separately, transfer the LE bit if doing signal return */
 	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
 	if (sig)
-		regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
+		regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (msr & MSR_LE));
 	unsafe_get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3], efault_out);
 	unsafe_get_user(regs->ctr, &sc->gp_regs[PT_CTR], efault_out);
 	unsafe_get_user(regs->link, &sc->gp_regs[PT_LNK], efault_out);
@@ -376,7 +376,7 @@ static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_
 	 * This has to be done before copying stuff into tsk->thread.fpr/vr
 	 * for the reasons explained in the previous comment.
 	 */
-	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
+	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX));
 
 #ifdef CONFIG_ALTIVEC
 	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
@@ -468,7 +468,7 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 		return -EINVAL;
 
 	/* pull in MSR LE from user context */
-	regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (msr & MSR_LE));
 
 	/* The following non-GPR non-FPR non-VR state is also checkpointed: */
 	err |= __get_user(regs->ctr, &tm_sc->gp_regs[PT_CTR]);
@@ -495,7 +495,7 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	 * This has to be done before copying stuff into tsk->thread.fpr/vr
 	 * for the reasons explained in the previous comment.
 	 */
-	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
+	regs_set_return_msr(regs, regs->msr & ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX));
 
 #ifdef CONFIG_ALTIVEC
 	err |= __get_user(v_regs, &sc->v_regs);
@@ -565,7 +565,7 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	preempt_disable();
 
 	/* pull in MSR TS bits from user context */
-	regs->msr |= msr & MSR_TS_MASK;
+	regs_set_return_msr(regs, regs->msr | (msr & MSR_TS_MASK));
 
 	/*
 	 * Ensure that TM is enabled in regs->msr before we leave the signal
@@ -583,7 +583,7 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	 * to be de-scheduled with MSR[TS] set but without calling
 	 * tm_recheckpoint(). This can cause a bug.
 	 */
-	regs->msr |= MSR_TM;
+	regs_set_return_msr(regs, regs->msr | MSR_TM);
 
 	/* This loads the checkpointed FP/VEC state, if used */
 	tm_recheckpoint(&tsk->thread);
@@ -591,11 +591,11 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 	msr_check_and_set(msr & (MSR_FP | MSR_VEC));
 	if (msr & MSR_FP) {
 		load_fp_state(&tsk->thread.fp_state);
-		regs->msr |= (MSR_FP | tsk->thread.fpexc_mode);
+		regs_set_return_msr(regs, regs->msr | (MSR_FP | tsk->thread.fpexc_mode));
 	}
 	if (msr & MSR_VEC) {
 		load_vr_state(&tsk->thread.vr_state);
-		regs->msr |= MSR_VEC;
+		regs_set_return_msr(regs, regs->msr | MSR_VEC);
 	}
 
 	preempt_enable();
@@ -721,8 +721,6 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
 
-	return_ip_or_msr_changed();
-
 	return 0;
 
 efault_out:
@@ -789,7 +787,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * the MSR[TS] that came from user context later, at
 		 * restore_tm_sigcontexts.
 		 */
-		regs->msr &= ~MSR_TS_MASK;
+		regs_set_return_msr(regs, regs->msr & ~MSR_TS_MASK);
 
 		if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
 			goto badframe;
@@ -821,7 +819,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * MSR[TS] set, but without CPU in the proper state,
 		 * causing a TM bad thing.
 		 */
-		current->thread.regs->msr &= ~MSR_TS_MASK;
+		regs_set_return_msr(current->thread.regs,
+				current->thread.regs->msr & ~MSR_TS_MASK);
 		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext)))
 			goto badframe;
 
@@ -836,8 +835,6 @@ SYSCALL_DEFINE0(rt_sigreturn)
 
 	set_thread_flag(TIF_RESTOREALL);
 
-	return_ip_or_msr_changed();
-
 	return 0;
 
 badframe_block:
@@ -917,12 +914,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	/* Set up to return from userspace. */
 	if (tsk->mm->context.vdso) {
-		regs->nip = VDSO64_SYMBOL(tsk->mm->context.vdso, sigtramp_rt64);
+		regs_set_return_ip(regs, VDSO64_SYMBOL(tsk->mm->context.vdso, sigtramp_rt64));
 	} else {
 		err |= setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
 		if (err)
 			goto badframe;
-		regs->nip = (unsigned long) &frame->tramp[0];
+		regs_set_return_ip(regs, (unsigned long) &frame->tramp[0]);
 	}
 
 	/* Allocate a dummy caller frame for the signal handler. */
@@ -947,8 +944,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	}
 
 	/* enter the signal handler in native-endian mode */
-	regs->msr &= ~MSR_LE;
-	regs->msr |= (MSR_KERNEL & MSR_LE);
+	regs_set_return_msr(regs, (regs->msr & ~MSR_LE) | (MSR_KERNEL & MSR_LE));
 	regs->gpr[1] = newsp;
 	regs->gpr[3] = ksig->sig;
 	regs->result = 0;
@@ -962,15 +958,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	if (err)
 		goto badframe;
 
-	return_ip_or_msr_changed();
-
 	return 0;
 
 badframe_block:
 	user_write_access_end();
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
-	return_ip_or_msr_changed();
 
 	return 1;
 }
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index e413f9908664..587165f2d1d2 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -427,7 +427,7 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	return;
 
 nonrecoverable:
-	regs->msr &= ~MSR_RI;
+	regs_set_return_msr(regs, regs->msr & ~MSR_RI);
 #endif
 }
 DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
@@ -549,8 +549,8 @@ static inline int check_io_access(struct pt_regs *regs)
 			printk(KERN_DEBUG "%s bad port %lx at %p\n",
 			       (*nip & 0x100)? "OUT to": "IN from",
 			       regs->gpr[rb] - _IO_BASE, nip);
-			regs->msr |= MSR_RI;
-			regs->nip = extable_fixup(entry);
+			regs_set_return_msr(regs, regs->msr | MSR_RI);
+			regs_set_return_ip(regs, extable_fixup(entry));
 			return 1;
 		}
 	}
@@ -586,8 +586,8 @@ static inline int check_io_access(struct pt_regs *regs)
 #define REASON_BOUNDARY		SRR1_BOUNDARY
 
 #define single_stepping(regs)	((regs)->msr & MSR_SE)
-#define clear_single_step(regs)	((regs)->msr &= ~MSR_SE)
-#define clear_br_trace(regs)	((regs)->msr &= ~MSR_BE)
+#define clear_single_step(regs)	(regs_set_return_msr((regs), (regs)->msr & ~MSR_SE))
+#define clear_br_trace(regs)	(regs_set_return_msr((regs), (regs)->msr & ~MSR_BE))
 #endif
 
 #define inst_length(reason)	(((reason) & REASON_PREFIXED) ? 8 : 4)
@@ -1566,7 +1566,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
  */
 DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
 {
-	regs->msr |= REASON_ILLEGAL;
+	regs_set_return_msr(regs, regs->msr | REASON_ILLEGAL);
 	do_program_check(regs);
 }
 
@@ -1659,7 +1659,7 @@ static void tm_unavailable(struct pt_regs *regs)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (user_mode(regs)) {
 		current->thread.load_tm++;
-		regs->msr |= MSR_TM;
+		regs_set_return_msr(regs, regs->msr | MSR_TM);
 		tm_enable();
 		tm_restore_sprs(&current->thread);
 		return;
@@ -1948,7 +1948,7 @@ static void handle_debug(struct pt_regs *regs, unsigned long debug_status)
 	 */
 	if (DBCR_ACTIVE_EVENTS(current->thread.debug.dbcr0,
 			       current->thread.debug.dbcr1))
-		regs->msr |= MSR_DE;
+		regs_set_return_msr(regs, regs->msr | MSR_DE);
 	else
 		/* Make sure the IDM flag is off */
 		current->thread.debug.dbcr0 &= ~DBCR0_IDM;
@@ -1969,7 +1969,7 @@ DEFINE_INTERRUPT_HANDLER(DebugException)
 	 * instead of stopping here when hitting a BT
 	 */
 	if (debug_status & DBSR_BT) {
-		regs->msr &= ~MSR_DE;
+		regs_set_return_msr(regs, regs->msr & ~MSR_DE);
 
 		/* Disable BT */
 		mtspr(SPRN_DBCR0, mfspr(SPRN_DBCR0) & ~DBCR0_BT);
@@ -1980,7 +1980,7 @@ DEFINE_INTERRUPT_HANDLER(DebugException)
 		if (user_mode(regs)) {
 			current->thread.debug.dbcr0 &= ~DBCR0_BT;
 			current->thread.debug.dbcr0 |= DBCR0_IDM | DBCR0_IC;
-			regs->msr |= MSR_DE;
+			regs_set_return_msr(regs, regs->msr | MSR_DE);
 			return;
 		}
 
@@ -1994,7 +1994,7 @@ DEFINE_INTERRUPT_HANDLER(DebugException)
 		if (debugger_sstep(regs))
 			return;
 	} else if (debug_status & DBSR_IC) { 	/* Instruction complete */
-		regs->msr &= ~MSR_DE;
+		regs_set_return_msr(regs, regs->msr & ~MSR_DE);
 
 		/* Disable instruction completion */
 		mtspr(SPRN_DBCR0, mfspr(SPRN_DBCR0) & ~DBCR0_IC);
@@ -2016,7 +2016,7 @@ DEFINE_INTERRUPT_HANDLER(DebugException)
 			current->thread.debug.dbcr0 &= ~DBCR0_IC;
 			if (DBCR_ACTIVE_EVENTS(current->thread.debug.dbcr0,
 					       current->thread.debug.dbcr1))
-				regs->msr |= MSR_DE;
+				regs_set_return_msr(regs, regs->msr | MSR_DE);
 			else
 				/* Make sure the IDM bit is off */
 				current->thread.debug.dbcr0 &= ~DBCR0_IDM;
diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
index 186f69b11e94..c1723b20f356 100644
--- a/arch/powerpc/kernel/uprobes.c
+++ b/arch/powerpc/kernel/uprobes.c
@@ -62,7 +62,7 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	autask->saved_trap_nr = current->thread.trap_nr;
 	current->thread.trap_nr = UPROBE_TRAP_NR;
-	regs->nip = current->utask->xol_vaddr;
+	regs_set_return_ip(regs, current->utask->xol_vaddr);
 
 	user_enable_single_step(current);
 	return 0;
@@ -119,7 +119,7 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 	 * support doesn't exist and have to fix-up the next instruction
 	 * to be executed.
 	 */
-	regs->nip = (unsigned long)ppc_inst_next((void *)utask->vaddr, &auprobe->insn);
+	regs_set_return_ip(regs, (unsigned long)ppc_inst_next((void *)utask->vaddr, &auprobe->insn));
 
 	user_disable_single_step(current);
 	return 0;
diff --git a/arch/powerpc/lib/error-inject.c b/arch/powerpc/lib/error-inject.c
index 407b992fb02f..e834079d2b5c 100644
--- a/arch/powerpc/lib/error-inject.c
+++ b/arch/powerpc/lib/error-inject.c
@@ -11,6 +11,6 @@ void override_function_with_return(struct pt_regs *regs)
 	 * function in the kernel/module, captured on a kprobe. We don't need
 	 * to worry about 32-bit userspace on a 64-bit kernel.
 	 */
-	regs->nip = regs->link;
+	regs_set_return_ip(regs, regs->link);
 }
 NOKPROBE_SYMBOL(override_function_with_return);
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 90fa3878299a..e51d9f2c95b2 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3480,8 +3480,6 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 	unsigned long val;
 	unsigned long ea;
 
-	return_ip_or_msr_changed();
-
 	r = analyse_instr(&op, regs, instr);
 	if (r < 0)
 		return r;
@@ -3543,7 +3541,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 			/* can't step mtmsr[d] that would clear MSR_RI */
 			return -1;
 		/* here op.val is the mask of bits to change */
-		regs->msr = (regs->msr & ~op.val) | (val & op.val);
+		regs_set_return_msr(regs, (regs->msr & ~op.val) | (val & op.val));
 		goto instr_done;
 
 #ifdef CONFIG_PPC64
@@ -3556,7 +3554,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 		if (IS_ENABLED(CONFIG_PPC_FAST_ENDIAN_SWITCH) &&
 				cpu_has_feature(CPU_FTR_REAL_LE) &&
 				regs->gpr[0] == 0x1ebe) {
-			regs->msr ^= MSR_LE;
+			regs_set_return_msr(regs, regs->msr ^ MSR_LE);
 			goto instr_done;
 		}
 		regs->gpr[9] = regs->gpr[13];
@@ -3564,8 +3562,8 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 		regs->gpr[11] = regs->nip + 4;
 		regs->gpr[12] = regs->msr & MSR_MASK;
 		regs->gpr[13] = (unsigned long) get_paca();
-		regs->nip = (unsigned long) &system_call_common;
-		regs->msr = MSR_KERNEL;
+		regs_set_return_ip(regs, (unsigned long) &system_call_common);
+		regs_set_return_msr(regs, MSR_KERNEL);
 		return 1;
 
 #ifdef CONFIG_PPC_BOOK3S_64
@@ -3575,8 +3573,8 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 		regs->gpr[11] = regs->nip + 4;
 		regs->gpr[12] = regs->msr & MSR_MASK;
 		regs->gpr[13] = (unsigned long) get_paca();
-		regs->nip = (unsigned long) &system_call_vectored_emulate;
-		regs->msr = MSR_KERNEL;
+		regs_set_return_ip(regs, (unsigned long) &system_call_vectored_emulate);
+		regs_set_return_msr(regs, MSR_KERNEL);
 		return 1;
 #endif
 
@@ -3587,7 +3585,8 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 	return 0;
 
  instr_done:
-	regs->nip = truncate_if_32bit(regs->msr, regs->nip + GETLENGTH(op.type));
+	regs_set_return_ip(regs,
+		truncate_if_32bit(regs->msr, regs->nip + GETLENGTH(op.type)));
 	return 1;
 }
 NOKPROBE_SYMBOL(emulate_step);
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 783d1b85ecfe..d8cd73d4b718 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -1582,6 +1582,7 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 	if (!regs || !ppc_inst_val(instr))
 		return -EINVAL;
 
+	/* This is not a return frame regs */
 	regs->nip = patch_site_addr(&patch__exec_instr);
 
 	analysed = analyse_instr(&op, regs, instr);
diff --git a/arch/powerpc/math-emu/math_efp.c b/arch/powerpc/math-emu/math_efp.c
index 0a05e51964c1..39b84e7452e1 100644
--- a/arch/powerpc/math-emu/math_efp.c
+++ b/arch/powerpc/math-emu/math_efp.c
@@ -710,7 +710,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 illegal:
 	if (have_e500_cpu_a005_erratum) {
 		/* according to e500 cpu a005 erratum, reissue efp inst */
-		regs->nip -= 4;
+		regs_add_return_ip(regs, -4);
 		pr_debug("re-issue efp inst: %08lx\n", speinsn);
 		return 0;
 	}
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 53065d564161..85521b3e7098 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -251,8 +251,8 @@ static int ppc750_machine_check_exception(struct pt_regs *regs)
 	/* Are we prepared to handle this fault */
 	if ((entry = search_exception_tables(regs->nip)) != NULL) {
 		tsi108_clear_pci_cfg_error();
-		regs->msr |= MSR_RI;
-		regs->nip = extable_fixup(entry);
+		regs_set_return_msr(regs, regs->msr | MSR_RI);
+		regs_set_return_ip(regs, extable_fixup(entry));
 		return 1;
 	}
 	return 0;
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 5565647dc879..d8da6a483e59 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -173,8 +173,8 @@ static int mpc7448_machine_check_exception(struct pt_regs *regs)
 	/* Are we prepared to handle this fault */
 	if ((entry = search_exception_tables(regs->nip)) != NULL) {
 		tsi108_clear_pci_cfg_error();
-		regs->msr |= MSR_RI;
-		regs->nip = extable_fixup(entry);
+		regs_set_return_msr(regs, regs->msr | MSR_RI);
+		regs_set_return_ip(regs, extable_fixup(entry));
 		return 1;
 	}
 	return 0;
diff --git a/arch/powerpc/platforms/pasemi/idle.c b/arch/powerpc/platforms/pasemi/idle.c
index 1c954c90b0f4..9b88e3cded7d 100644
--- a/arch/powerpc/platforms/pasemi/idle.c
+++ b/arch/powerpc/platforms/pasemi/idle.c
@@ -37,7 +37,7 @@ static int pasemi_system_reset_exception(struct pt_regs *regs)
 	 */
 
 	if (regs->msr & SRR1_WAKEMASK)
-		regs->nip = regs->link;
+		regs_set_return_ip(regs, regs->link);
 
 	switch (regs->msr & SRR1_WAKEMASK) {
 	case SRR1_WAKEDEC:
@@ -58,7 +58,7 @@ static int pasemi_system_reset_exception(struct pt_regs *regs)
 	restore_astate(hard_smp_processor_id());
 
 	/* everything handled */
-	regs->msr |= MSR_RI;
+	regs_set_return_msr(regs, regs->msr | MSR_RI);
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 303d7c775740..2835376e61a4 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -773,7 +773,7 @@ bool opal_mce_check_early_recovery(struct pt_regs *regs)
 	 * Setup regs->nip to rfi into fixup address.
 	 */
 	if (recover_addr)
-		regs->nip = recover_addr;
+		regs_set_return_ip(regs, recover_addr);
 
 out:
 	return !!recover_addr;
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 9d4ef65da7f3..f47c49ab13a5 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -487,8 +487,8 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 	if ((be64_to_cpu(regs->msr) &
 			(MSR_LE|MSR_RI|MSR_DR|MSR_IR|MSR_ME|MSR_PR|
 			 MSR_ILE|MSR_HV|MSR_SF)) == (MSR_DR|MSR_SF)) {
-		regs->nip = be64_to_cpu((__be64)regs->nip);
-		regs->msr = 0;
+		regs_set_return_ip(regs, be64_to_cpu((__be64)regs->nip));
+		regs_set_return_msr(regs, 0);
 	}
 #endif
 
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 07c164f7f8cf..5a95b8ea23d8 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -108,8 +108,8 @@ int fsl_rio_mcheck_exception(struct pt_regs *regs)
 				 __func__);
 			out_be32((u32 *)(rio_regs_win + RIO_LTLEDCSR),
 				 0);
-			regs->msr |= MSR_RI;
-			regs->nip = extable_fixup(entry);
+			regs_set_return_msr(regs, regs->msr | MSR_RI);
+			regs_set_return_ip(regs, extable_fixup(entry));
 			return 1;
 		}
 	}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d..3bd34e92a389 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -514,7 +514,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 
 	bp = in_breakpoint_table(regs->nip, &offset);
 	if (bp != NULL) {
-		regs->nip = bp->address + offset;
+		regs_set_return_ip(regs, bp->address + offset);
 		atomic_dec(&bp->ref_count);
 	}
 
@@ -702,7 +702,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	if (regs->msr & MSR_DE) {
 		bp = at_breakpoint(regs->nip);
 		if (bp != NULL) {
-			regs->nip = (unsigned long) &bp->instr[0];
+			regs_set_return_ip(regs, (unsigned long) &bp->instr[0]);
 			atomic_inc(&bp->ref_count);
 		}
 	}
@@ -712,7 +712,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		if (bp != NULL) {
 			int stepped = emulate_step(regs, ppc_inst_read(bp->instr));
 			if (stepped == 0) {
-				regs->nip = (unsigned long) &bp->instr[0];
+				regs_set_return_ip(regs, (unsigned long) &bp->instr[0]);
 				atomic_inc(&bp->ref_count);
 			} else if (stepped < 0) {
 				printf("Couldn't single-step %s instruction\n",
@@ -766,7 +766,7 @@ static int xmon_bpt(struct pt_regs *regs)
 	/* Are we at the trap at bp->instr[1] for some bp? */
 	bp = in_breakpoint_table(regs->nip, &offset);
 	if (bp != NULL && (offset == 4 || offset == 8)) {
-		regs->nip = bp->address + offset;
+		regs_set_return_ip(regs, bp->address + offset);
 		atomic_dec(&bp->ref_count);
 		return 1;
 	}
@@ -836,7 +836,7 @@ static int xmon_fault_handler(struct pt_regs *regs)
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT)) {
 		bp = in_breakpoint_table(regs->nip, &offset);
 		if (bp != NULL) {
-			regs->nip = bp->address + offset;
+			regs_set_return_ip(regs, bp->address + offset);
 			atomic_dec(&bp->ref_count);
 		}
 	}
@@ -1188,7 +1188,7 @@ cmds(struct pt_regs *excp)
 #ifdef CONFIG_BOOKE
 static int do_step(struct pt_regs *regs)
 {
-	regs->msr |= MSR_DE;
+	regs_set_return_msr(regs, regs->msr | MSR_DE);
 	mtspr(SPRN_DBCR0, mfspr(SPRN_DBCR0) | DBCR0_IC | DBCR0_IDM);
 	return 1;
 }
@@ -1221,7 +1221,7 @@ static int do_step(struct pt_regs *regs)
 			}
 		}
 	}
-	regs->msr |= MSR_SE;
+	regs_set_return_msr(regs, regs->msr | MSR_SE);
 	return 1;
 }
 #endif
-- 
2.23.0

