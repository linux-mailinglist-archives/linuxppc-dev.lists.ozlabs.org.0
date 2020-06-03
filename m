Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AB1EC8AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 07:19:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cHK46qqGzDqXN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 15:19:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cHH10znvzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 15:17:48 +1000 (AEST)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id DFBFA80B2E
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 01:17:46 -0400 (EDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id E956560056;
 Wed,  3 Jun 2020 01:17:36 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.239])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 78E4D6004D;
 Wed,  3 Jun 2020 05:17:35 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@lists.ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH 1/5] powerpc/mm: Introduce temporary mm
Date: Wed,  3 Jun 2020 00:19:08 -0500
Message-Id: <20200603051912.23296-2-cmr@informatik.wtf>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200603051912.23296-1-cmr@informatik.wtf>
References: <20200603051912.23296-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

x86 supports the notion of a temporary mm which restricts access to
temporary PTEs to a single CPU. A temporary mm is useful for situations
where a CPU needs to perform sensitive operations (such as patching a
STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
said mappings to other CPUs. A side benefit is that other CPU TLBs do
not need to be flushed when the temporary mm is torn down.

Mappings in the temporary mm can be set in the userspace portion of the
address-space.

Interrupts must be disabled while the temporary mm is in use. HW
breakpoints, which may have been set by userspace as watchpoints on
addresses now within the temporary mm, are saved and disabled when
loading the temporary mm. The HW breakpoints are restored when unloading
the temporary mm. All HW breakpoints are indiscriminately disabled while
the temporary mm is in use.

Based on x86 implementation:

commit cefa929c034e
("x86/mm: Introduce temporary mm structs")

Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/include/asm/debug.h       |  1 +
 arch/powerpc/include/asm/mmu_context.h | 64 ++++++++++++++++++++++++++
 arch/powerpc/kernel/process.c          |  5 ++
 3 files changed, 70 insertions(+)

diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index ec57daf87f40..827350c9bcf3 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -46,6 +46,7 @@ static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
 #endif
 
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk);
+void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk);
 bool ppc_breakpoint_available(void);
 #ifdef CONFIG_PPC_ADV_DEBUG_REGS
 extern void do_send_trap(struct pt_regs *regs, unsigned long address,
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 1a474f6b1992..9269c7c7b04e 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -10,6 +10,7 @@
 #include <asm/mmu.h>	
 #include <asm/cputable.h>
 #include <asm/cputhreads.h>
+#include <asm/debug.h>
 
 /*
  * Most if the context management is out of line
@@ -300,5 +301,68 @@ static inline int arch_dup_mmap(struct mm_struct *oldmm,
 	return 0;
 }
 
+struct temp_mm {
+	struct mm_struct *temp;
+	struct mm_struct *prev;
+	bool is_kernel_thread;
+	struct arch_hw_breakpoint brk[HBP_NUM_MAX];
+};
+
+static inline void init_temp_mm(struct temp_mm *temp_mm, struct mm_struct *mm)
+{
+	temp_mm->temp = mm;
+	temp_mm->prev = NULL;
+	temp_mm->is_kernel_thread = false;
+	memset(&temp_mm->brk, 0, sizeof(temp_mm->brk));
+}
+
+static inline void use_temporary_mm(struct temp_mm *temp_mm)
+{
+	lockdep_assert_irqs_disabled();
+
+	temp_mm->is_kernel_thread = current->mm == NULL;
+	if (temp_mm->is_kernel_thread)
+		temp_mm->prev = current->active_mm;
+	else
+		temp_mm->prev = current->mm;
+
+	/*
+	 * Hash requires a non-NULL current->mm to allocate a userspace address
+	 * when handling a page fault. Does not appear to hurt in Radix either.
+	 */
+	current->mm = temp_mm->temp;
+	switch_mm_irqs_off(NULL, temp_mm->temp, current);
+
+	if (ppc_breakpoint_available()) {
+		struct arch_hw_breakpoint null_brk = {0};
+		int i = 0;
+
+		for (; i < nr_wp_slots(); ++i) {
+			__get_breakpoint(i, &temp_mm->brk[i]);
+			if (temp_mm->brk[i].type != 0)
+				__set_breakpoint(i, &null_brk);
+		}
+	}
+}
+
+static inline void unuse_temporary_mm(struct temp_mm *temp_mm)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (temp_mm->is_kernel_thread)
+		current->mm = NULL;
+	else
+		current->mm = temp_mm->prev;
+	switch_mm_irqs_off(NULL, temp_mm->prev, current);
+
+	if (ppc_breakpoint_available()) {
+		int i = 0;
+
+		for (; i < nr_wp_slots(); ++i)
+			if (temp_mm->brk[i].type != 0)
+				__set_breakpoint(i, &temp_mm->brk[i]);
+	}
+}
+
 #endif /* __KERNEL__ */
 #endif /* __ASM_POWERPC_MMU_CONTEXT_H */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 048d64c4e115..3973144f6980 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -825,6 +825,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
 	return 0;
 }
 
+void __get_breakpoint(int nr, struct arch_hw_breakpoint *brk)
+{
+	memcpy(brk, this_cpu_ptr(&current_brk[nr]), sizeof(*brk));
+}
+
 void __set_breakpoint(int nr, struct arch_hw_breakpoint *brk)
 {
 	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
-- 
2.26.2

