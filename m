Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B02146FC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 18:33:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483TrH3ft8zDqZ1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 04:33:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=uSAxAiqi; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Tnr0h0szDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 04:30:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 483Tnf5c41z9ttBK;
 Thu, 23 Jan 2020 18:30:46 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=uSAxAiqi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id G3qys4enj1ab; Thu, 23 Jan 2020 18:30:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 483Tnf2Spxz9ttDF;
 Thu, 23 Jan 2020 18:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1579800646; bh=4V+8mcfK0ldeSXPjhq+Vb65F63p9Ot9zGh3/s9dN+dY=;
 h=From:Subject:To:Cc:Date:From;
 b=uSAxAiqipFb+rDyJZ+jjOWbkv3MZxBlixvVpLfUfraEXACae+hCTWSEUFCU0GvOcs
 ptangA1iKowdn1CGAfxYi7M9K08s0c6pYTBqWYTSuss4MZPf59qCm1mO3uVB5vCkix
 wjbTaQIge6DCmrmtzwkObXhd24nftlCsKclWfZxs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CDAFA8B836;
 Thu, 23 Jan 2020 18:30:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SmNadmwM9Uhp; Thu, 23 Jan 2020 18:30:47 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.111])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E6088B82C;
 Thu, 23 Jan 2020 18:30:47 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6CEEC651E5; Thu, 23 Jan 2020 17:30:47 +0000 (UTC)
Message-Id: <e041f5eedb23f09ab553be8a91c3de2087147320.1579800517.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4] powerpc: use probe_user_read() and probe_user_write()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 23 Jan 2020 17:30:47 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Instead of opencoding, use probe_user_read() to failessly read
a user location and probe_user_write() for writing to user.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
Link to v3: https://patchwork.ozlabs.org/patch/1026042/
v4: Reviving this patch after one year. Now probe_user_read/write() is in the kernel so patch 1 is gone.
v3: No change
v2: Using probe_user_read() instead of probe_user_address()
---
 arch/powerpc/kernel/process.c          | 12 +-----------
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  6 ++----
 arch/powerpc/mm/fault.c                |  6 +-----
 arch/powerpc/oprofile/backtrace.c      | 14 ++------------
 arch/powerpc/perf/callchain.c          | 20 +++-----------------
 arch/powerpc/perf/core-book3s.c        |  8 +-------
 arch/powerpc/sysdev/fsl_pci.c          | 10 ++++------
 7 files changed, 14 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 4df94b6e2f32..79f2cb6ecf87 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1264,16 +1264,6 @@ void show_user_instructions(struct pt_regs *regs)
 
 	pc = regs->nip - (NR_INSN_TO_PRINT * 3 / 4 * sizeof(int));
 
-	/*
-	 * Make sure the NIP points at userspace, not kernel text/data or
-	 * elsewhere.
-	 */
-	if (!__access_ok(pc, NR_INSN_TO_PRINT * sizeof(int), USER_DS)) {
-		pr_info("%s[%d]: Bad NIP, not dumping instructions.\n",
-			current->comm, current->pid);
-		return;
-	}
-
 	seq_buf_init(&s, buf, sizeof(buf));
 
 	while (n) {
@@ -1284,7 +1274,7 @@ void show_user_instructions(struct pt_regs *regs)
 		for (i = 0; i < 8 && n; i++, n--, pc += sizeof(int)) {
 			int instr;
 
-			if (probe_kernel_address((const void *)pc, instr)) {
+			if (probe_user_read(&instr, (void __user *)pc, sizeof(instr))) {
 				seq_buf_printf(&s, "XXXXXXXX ");
 				continue;
 			}
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index da857c8ba6e4..231410dc9db4 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -63,12 +63,10 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	}
 	isync();
 
-	pagefault_disable();
 	if (is_load)
-		ret = raw_copy_from_user(to, from, n);
+		ret = probe_user_read(to, (const void __user *)from, n);
 	else
-		ret = raw_copy_to_user(to, from, n);
-	pagefault_enable();
+		ret = probe_user_write((void __user *)to, from, n);
 
 	/* switch the pid first to avoid running host with unallocated pid */
 	if (quadrant == 1 && pid != old_pid)
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b5047f9b5dec..9e119f98a725 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -279,12 +279,8 @@ static bool bad_stack_expansion(struct pt_regs *regs, unsigned long address,
 		if ((flags & FAULT_FLAG_WRITE) && (flags & FAULT_FLAG_USER) &&
 		    access_ok(nip, sizeof(*nip))) {
 			unsigned int inst;
-			int res;
 
-			pagefault_disable();
-			res = __get_user_inatomic(inst, nip);
-			pagefault_enable();
-			if (!res)
+			if (!probe_user_read(&inst, nip, sizeof(inst)))
 				return !store_updates_sp(inst);
 			*must_retry = true;
 		}
diff --git a/arch/powerpc/oprofile/backtrace.c b/arch/powerpc/oprofile/backtrace.c
index 43245f4a9bcb..2799b922f780 100644
--- a/arch/powerpc/oprofile/backtrace.c
+++ b/arch/powerpc/oprofile/backtrace.c
@@ -28,15 +28,12 @@ static unsigned int user_getsp32(unsigned int sp, int is_first)
 	unsigned int stack_frame[2];
 	void __user *p = compat_ptr(sp);
 
-	if (!access_ok(p, sizeof(stack_frame)))
-		return 0;
-
 	/*
 	 * The most likely reason for this is that we returned -EFAULT,
 	 * which means that we've done all that we can do from
 	 * interrupt context.
 	 */
-	if (__copy_from_user_inatomic(stack_frame, p, sizeof(stack_frame)))
+	if (probe_user_read(stack_frame, (void __user *)p, sizeof(stack_frame)))
 		return 0;
 
 	if (!is_first)
@@ -54,11 +51,7 @@ static unsigned long user_getsp64(unsigned long sp, int is_first)
 {
 	unsigned long stack_frame[3];
 
-	if (!access_ok((void __user *)sp, sizeof(stack_frame)))
-		return 0;
-
-	if (__copy_from_user_inatomic(stack_frame, (void __user *)sp,
-					sizeof(stack_frame)))
+	if (probe_user_read(stack_frame, (void __user *)sp, sizeof(stack_frame)))
 		return 0;
 
 	if (!is_first)
@@ -103,7 +96,6 @@ void op_powerpc_backtrace(struct pt_regs * const regs, unsigned int depth)
 			first_frame = 0;
 		}
 	} else {
-		pagefault_disable();
 #ifdef CONFIG_PPC64
 		if (!is_32bit_task()) {
 			while (depth--) {
@@ -112,7 +104,6 @@ void op_powerpc_backtrace(struct pt_regs * const regs, unsigned int depth)
 					break;
 				first_frame = 0;
 			}
-			pagefault_enable();
 			return;
 		}
 #endif
@@ -123,6 +114,5 @@ void op_powerpc_backtrace(struct pt_regs * const regs, unsigned int depth)
 				break;
 			first_frame = 0;
 		}
-		pagefault_enable();
 	}
 }
diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
index 35d542515faf..cbc251981209 100644
--- a/arch/powerpc/perf/callchain.c
+++ b/arch/powerpc/perf/callchain.c
@@ -155,12 +155,8 @@ static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
 	    ((unsigned long)ptr & 7))
 		return -EFAULT;
 
-	pagefault_disable();
-	if (!__get_user_inatomic(*ret, ptr)) {
-		pagefault_enable();
+	if (!probe_user_read(ret, ptr, sizeof(*ret)))
 		return 0;
-	}
-	pagefault_enable();
 
 	return read_user_stack_slow(ptr, ret, 8);
 }
@@ -171,12 +167,8 @@ static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
 	    ((unsigned long)ptr & 3))
 		return -EFAULT;
 
-	pagefault_disable();
-	if (!__get_user_inatomic(*ret, ptr)) {
-		pagefault_enable();
+	if (!probe_user_read(ret, ptr, sizeof(*ret)))
 		return 0;
-	}
-	pagefault_enable();
 
 	return read_user_stack_slow(ptr, ret, 4);
 }
@@ -293,17 +285,11 @@ static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
  */
 static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
 {
-	int rc;
-
 	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
 	    ((unsigned long)ptr & 3))
 		return -EFAULT;
 
-	pagefault_disable();
-	rc = __get_user_inatomic(*ret, ptr);
-	pagefault_enable();
-
-	return rc;
+	return probe_user_read(ret, ptr, sizeof(*ret));
 }
 
 static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 48604625ab31..3086055bf681 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -415,7 +415,6 @@ static void power_pmu_sched_task(struct perf_event_context *ctx, bool sched_in)
 static __u64 power_pmu_bhrb_to(u64 addr)
 {
 	unsigned int instr;
-	int ret;
 	__u64 target;
 
 	if (is_kernel_addr(addr)) {
@@ -426,13 +425,8 @@ static __u64 power_pmu_bhrb_to(u64 addr)
 	}
 
 	/* Userspace: need copy instruction here then translate it */
-	pagefault_disable();
-	ret = __get_user_inatomic(instr, (unsigned int __user *)addr);
-	if (ret) {
-		pagefault_enable();
+	if (probe_user_read(&instr, (unsigned int __user *)addr, sizeof(instr)))
 		return 0;
-	}
-	pagefault_enable();
 
 	target = branch_target(&instr);
 	if ((!target) || (instr & BRANCH_ABSOLUTE))
diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index 617a443d673d..4a8874bc1057 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1065,13 +1065,11 @@ int fsl_pci_mcheck_exception(struct pt_regs *regs)
 	addr += mfspr(SPRN_MCAR);
 
 	if (is_in_pci_mem_space(addr)) {
-		if (user_mode(regs)) {
-			pagefault_disable();
-			ret = get_user(inst, (__u32 __user *)regs->nip);
-			pagefault_enable();
-		} else {
+		if (user_mode(regs))
+			ret = probe_user_read(&inst, (void __user *)regs->nip,
+					      sizeof(inst));
+		else
 			ret = probe_kernel_address((void *)regs->nip, inst);
-		}
 
 		if (!ret && mcheck_handle_load(regs, inst)) {
 			regs->nip += 4;
-- 
2.25.0

