Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A7253EA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 09:09:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcYl61mQdzDqf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 17:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcYjT71f9zDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 17:08:29 +1000 (AEST)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <cmr@codefail.de>)
 id 1kBAOi-0000Ie-T7; Wed, 26 Aug 2020 22:24:30 -0700
Received: from MTA-13.privateemail.com (unknown [10.20.147.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id CFEBBA76;
 Thu, 27 Aug 2020 05:24:28 +0000 (UTC)
Received: from mta-13.privateemail.com (localhost [127.0.0.1])
 by mta-13.privateemail.com (Postfix) with ESMTP id 71CB780055;
 Thu, 27 Aug 2020 01:24:25 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.231])
 by mta-13.privateemail.com (Postfix) with ESMTPA id 72FB480060;
 Thu, 27 Aug 2020 05:24:21 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 4/6] powerpc: Introduce temporary mm
Date: Thu, 27 Aug 2020 00:26:57 -0500
Message-Id: <20200827052659.24922-5-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200827052659.24922-1-cmr@codefail.de>
References: <20200827052659.24922-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.000410992690308)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0fJi3Ojdyt5h9PLOIGvr3lipSDasLI4SayDByyq9LIhVFHJ2qMgYuGKo
 fKr8UXe0k0TNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kq02yUY2BU41HLqp9U+7si8M8
 LdvJpZ7k99Lvu8YZXeI6p5bbhGYzvfahQ7X4A9L0Ye/JicEYVQv1wTfnWwJUGLoHT+TiZ2cHCmVO
 a6Hj9ojJiXYVY/LWyydA4cEuciMeJODXbtOodkPED+RkHjVGH2xZ/WG2ZLv5RT/cF5Q6687AHRjU
 JmjnvGEokRBTZJpViFKfD1jKgYfH+6S5qDVYoJU2GVfilQJSaX7ehrnJEB/bhw3Crbac1ieeuRax
 ITFpzO11BRKqT8B4uLrn7iz8uvLBMzbIQcSG8L0jOzL80Q1MxDcqDeEvahfPkDkTlH91LgaQnmF8
 H6pa6B8MTK1ligAJ9G0GMvMSOAhk0taEj8weJNI+C0vMCMVtmGEXbiaCRPGqg4v6OwYy/yt5Cj+T
 3txbXpCgbiKBsA+Ddi6maweYdUirBly/K12a4uqqibUj/dHBojDbLVZkEx6TcwTT039q0aZI3qbh
 XsaDdLgW9brs8lq6YeUVTmb2st+aVE9JYOaeuiH/yEdZH8S1+TgcJBOjh0vPxcQOjKKOrYIQYpwa
 mUdylUIKhf3z2GAHxH7IMNrut00GZ5qvF8IF7tMR7zZ0OXNO45l0fhWSb7cPfaFo+BnGy6ufsd3t
 iveYHZpewov2GavqJ07j7hZY8mVbefiuK2KN35hXmy7nXQ2QuBuxX4OQOI/UQ6jnFfMBgzwOw1To
 H/cUtROfGg27pVfRPjU3fSpvtX7kDRT+AqQr2T3rxJw/s9JEmzH0m3M+UGtqRLz8gWjPByeTxL35
 h3XjL6/rSujC88C300HqAe+jlJ5DPDo3pDJlUlQ25PasjIMI9uAIvgWsH+Wq0zDLDi3S8euO5TcD
 eKjrEmYPn2IVWRsZR6NeDQwp7lDA8K9tDm+p97/T4LRRVYxF+VXiiOfHJN40eTXlWiUAYdLmsJdA
 oPKCpWwKtkkGG+bEnfOEkWTNI3SjTCvjMfNBc9ze9o81pXKSQ+GI7QB7PH97h6/L6Wb57LVs51cV
 C2TOjdXlLnr1FFwa8AyQYqjO7qYtiXb+9Q==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Cc: kernel-hardening@lists.openwall.com
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

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/include/asm/debug.h |  1 +
 arch/powerpc/kernel/process.c    |  5 +++
 arch/powerpc/lib/code-patching.c | 65 ++++++++++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

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
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 016bd831908e..0758a8db6342 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -843,6 +843,11 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
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
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 85d3fdca9452..89b37ece6d2f 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -17,6 +17,7 @@
 #include <asm/code-patching.h>
 #include <asm/setup.h>
 #include <asm/inst.h>
+#include <asm/mmu_context.h>
 
 static int __patch_instruction(struct ppc_inst *exec_addr, struct ppc_inst instr,
 			       struct ppc_inst *patch_addr)
@@ -44,6 +45,70 @@ int raw_patch_instruction(struct ppc_inst *addr, struct ppc_inst instr)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
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
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
 
 #ifdef CONFIG_LKDTM
-- 
2.28.0

