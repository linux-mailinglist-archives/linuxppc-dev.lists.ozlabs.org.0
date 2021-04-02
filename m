Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CE5353130
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 00:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBw455MZWz3c6x
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 09:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OKGHJftp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OKGHJftp; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBw3c6f8bz3brl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 09:39:55 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FBw3V4g6Rz9sRf;
 Sat,  3 Apr 2021 09:39:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1617403190;
 bh=sV0OWVXcFCr+x4gmJtNDMNPD+NpZGgWodjOniK6RRJQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OKGHJftp81k4imhBmTGCLRTeP0LwzbfJOlkU3mNe/1b/TA1u1Y3fuvLt4OyHZIqMc
 zsodgt5XjOafH8Vad8EVr7CPs2h3013leHzab5KLPfVZnZL74ermGYTBFePeq03pks
 JrAZWiy9E19/A1RbGS377LrZXDU+JwRfCaOr/VlhAFa0y5ls2041sIlxiP64vMs/g7
 GTFu9meoXv9ztbRcOcpmRoab5pSkTmaBM8U0zpWBLP6kK2pZFUuUSBfPBKHzRZs2Jn
 5bOaql1xtRZbgtt/DpUFXZMdADLiDmLbwAB+Iq1vCGWgzXX0ajlpqFojPP8HzsKD5L
 o0kDtQKiVgCqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/14] powerpc/64s: avoid reloading (H)SRR registers if
 they are still valid
In-Reply-To: <20210315220402.260594-5-npiggin@gmail.com>
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-5-npiggin@gmail.com>
Date: Sat, 03 Apr 2021 09:39:47 +1100
Message-ID: <877dlk1fbg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Nicholas Piggin <npiggin@gmail.com> writes:
> When an interrupt is taken, the SRR registers are set to return to
> where it left off. Unless they are modified in the meantime, or the
> return address or MSR are modified, there is no need to reload these
> registers when returning from interrupt.
>
> Introduce per-CPU flags that track the validity of SRR and HSRR
> registers, clear them when returning from interrupt, using the registers
> for something else (e.g., OPAL calls), or adjusting return address or MSR.
>
> This improves the performance of interrupt returns.
>
> XXX: may not need to invalidate both hsrr and srr all the time
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

I needed something like below to get 32-bit building.

cheers


diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 6d6237e0cbd7..7f9bbd19db10 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -153,15 +153,21 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 	regs->gpr[3] = rc;
 }
 
-static inline void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+static inline void invalidate_srrs(void)
 {
-	regs->nip = ip;
 #ifdef CONFIG_PPC_BOOK3S_64
+	// XXX: We may not need to invalidate both hsrr and srr all the time
 	local_paca->hsrr_valid = 0;
 	local_paca->srr_valid = 0;
 #endif
 }
 
+static inline void regs_set_return_ip(struct pt_regs *regs, unsigned long ip)
+{
+	regs->nip = ip;
+	invalidate_srrs();
+}
+
 static inline void regs_add_return_ip(struct pt_regs *regs, long offset)
 {
 	regs_set_return_ip(regs, regs->nip + offset);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 200b4805f999..82623b57e2d6 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -98,8 +98,7 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	    !test_thread_flag(TIF_RESTORE_TM)) {
 		tsk->thread.ckpt_regs.msr = tsk->thread.regs->msr;
 		set_thread_flag(TIF_RESTORE_TM);
-		local_paca->hsrr_valid = 0;
-		local_paca->srr_valid = 0;
+		invalidate_srrs();
 	}
 }
 
@@ -164,8 +163,7 @@ static void __giveup_fpu(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 }
 
 void giveup_fpu(struct task_struct *tsk)
@@ -249,8 +247,7 @@ static void __giveup_altivec(struct task_struct *tsk)
 	if (cpu_has_feature(CPU_FTR_VSX))
 		msr &= ~MSR_VSX;
 	tsk->thread.regs->msr = msr;
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 }
 
 void giveup_altivec(struct task_struct *tsk)
@@ -566,8 +563,7 @@ void notrace restore_math(struct pt_regs *regs)
 		msr_check_and_clear(new_msr);
 
 		regs->msr |= new_msr | fpexc_mode;
-		local_paca->hsrr_valid = 0;
-		local_paca->srr_valid = 0;
+		invalidate_srrs();
 	}
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -1293,8 +1289,7 @@ struct task_struct *__switch_to(struct task_struct *prev,
 			atomic_read(&current->mm->context.vas_windows)))
 			asm volatile(PPC_CP_ABORT);
 	}
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
 	return last;
@@ -1884,8 +1879,7 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 }
 EXPORT_SYMBOL(start_thread);
 
@@ -1936,8 +1930,7 @@ int set_fpexc_mode(struct task_struct *tsk, unsigned int val)
 	if (regs != NULL && (regs->msr & MSR_FP) != 0) {
 		regs->msr = (regs->msr & ~(MSR_FE0|MSR_FE1))
 			| tsk->thread.fpexc_mode;
-		local_paca->hsrr_valid = 0;
-		local_paca->srr_valid = 0;
+		invalidate_srrs();
 	}
 	return 0;
 }
@@ -1990,8 +1983,7 @@ int set_endian(struct task_struct *tsk, unsigned int val)
 	else
 		return -EINVAL;
 
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 
 	return 0;
 }
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 4cb38afa28a8..9d1d6070a516 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -115,8 +115,8 @@ SYSCALL_DEFINE0(switch_endian)
 	struct thread_info *ti;
 
 	current->thread.regs->msr ^= MSR_LE;
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+
+	invalidate_srrs();
 
 	/*
 	 * Set TIF_RESTOREALL so that r3 isn't clobbered on return to
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 96505d4bba1c..2b94bf21d6ae 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3480,8 +3480,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 	unsigned long val;
 	unsigned long ea;
 
-	local_paca->hsrr_valid = 0;
-	local_paca->srr_valid = 0;
+	invalidate_srrs();
 
 	r = analyse_instr(&op, regs, instr);
 	if (r < 0)
