Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F271B622349
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 05:59:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6Xns69m9z3f7S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 15:59:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QXzxB4lH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QXzxB4lH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6Xcm6Xg6z3bhv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 15:51:52 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A92Ksu0022636;
	Wed, 9 Nov 2022 04:51:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mR2hwfLKZFEBSos4Fqqgy9Pnqzt+M2wg3ss1vcXkWCc=;
 b=QXzxB4lH2NwLO2Oxqf+dzOjUgTadvEdDS9sH3jTN45giYsorgSIUdEbMKCvtOfANdLFI
 mIkkZtgjRQDvIcCWzUafQGC0xt3djJPnq0i3EFQLCjITt2QxwV4svN3ww8SJ/S0zf0wt
 mwaSYSNUHGqUfN9dF4VTL2gf/+rZrxd0Cs8YBSYK7K2seXcRFVbW/FMe74V0jvb+gRUQ
 ItCbl9408eSNCUr5gUJWer55O0jCONTjV0ffSMErbBaJgxpthUeDNmnwVG1WGc5gyFZe
 yQUtm5YGUQ2vGNkxKjMeBqVv+K40IgXH2U4JMGlpwZTs0+TDK4wp3w5TYw6EnmATG11x LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqxte47fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:38 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A93vMRB007272;
	Wed, 9 Nov 2022 04:51:38 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqxte47dn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:38 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A94akJN008595;
	Wed, 9 Nov 2022 04:51:35 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma01fra.de.ibm.com with ESMTP id 3kngs4kpa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 04:51:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A94qBPl33685812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 04:52:11 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 25E114C046;
	Wed,  9 Nov 2022 04:51:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A9804C040;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  9 Nov 2022 04:51:32 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F406B607D0;
	Wed,  9 Nov 2022 15:51:28 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 8/9] powerpc/code-patching: Use temporary mm for Radix MMU
Date: Wed,  9 Nov 2022 15:51:11 +1100
Message-Id: <20221109045112.187069-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221109045112.187069-1-bgray@linux.ibm.com>
References: <20221109045112.187069-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PgJad6CqMgyFAal0WepBRttz76tcJbjd
X-Proofpoint-ORIG-GUID: VEN02E8IWH7WrBL0J73o1fRHqCz6LwZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-08_06,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211090028
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
Cc: ajd@linux.ibm.com, jniethe5@gmail.com, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Christopher M. Riedl" <cmr@bluescreens.de>

x86 supports the notion of a temporary mm which restricts access to
temporary PTEs to a single CPU. A temporary mm is useful for situations
where a CPU needs to perform sensitive operations (such as patching a
STRICT_KERNEL_RWX kernel) requiring temporary mappings without exposing
said mappings to other CPUs. Another benefit is that other CPU TLBs do
not need to be flushed when the temporary mm is torn down.

Mappings in the temporary mm can be set in the userspace portion of the
address-space.

Interrupts must be disabled while the temporary mm is in use. HW
breakpoints, which may have been set by userspace as watchpoints on
addresses now within the temporary mm, are saved and disabled when
loading the temporary mm. The HW breakpoints are restored when unloading
the temporary mm. All HW breakpoints are indiscriminately disabled while
the temporary mm is in use - this may include breakpoints set by perf.

Use the `poking_init` init hook to prepare a temporary mm and patching
address. Initialize the temporary mm by copying the init mm. Choose a
randomized patching address inside the temporary mm userspace address
space. The patching address is randomized between PAGE_SIZE and
DEFAULT_MAP_WINDOW-PAGE_SIZE.

Bits of entropy with 64K page size on BOOK3S_64:

	bits of entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)

	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
	bits of entropy = log2(128TB / 64K)
	bits of entropy = 31

The upper limit is DEFAULT_MAP_WINDOW due to how the Book3s64 Hash MMU
operates - by default the space above DEFAULT_MAP_WINDOW is not
available. Currently the Hash MMU does not use a temporary mm so
technically this upper limit isn't necessary; however, a larger
randomization range does not further "harden" this overall approach and
future work may introduce patching with a temporary mm on Hash as well.

Randomization occurs only once during initialization for each CPU as it
comes online.

The patching page is mapped with PAGE_KERNEL to set EAA[0] for the PTE
which ignores the AMR (so no need to unlock/lock KUAP) according to
PowerISA v3.0b Figure 35 on Radix.

Based on x86 implementation:

commit 4fc19708b165
("x86/alternatives: Initialize temporary mm for patching")

and:

commit b3fd8e83ada0
("x86/alternatives: Use temporary mm for text poking")

From: Benjamin Gray <bgray@linux.ibm.com>

Synchronisation is done according to ISA 3.1B Book 3 Chapter 13
"Synchronization Requirements for Context Alterations". Switching the mm
is a change to the PID, which requires a CSI before and after the change,
and a hwsync between the last instruction that performs address
translation for an associated storage access.

Instruction fetch is an associated storage access, but the instruction
address mappings are not being changed, so it should not matter which
context they use. We must still perform a hwsync to guard arbitrary
prior code that may have accessed a userspace address.

TLB invalidation is local and VA specific. Local because only this core
used the patching mm, and VA specific because we only care that the
writable mapping is purged. Leaving the other mappings intact is more
efficient, especially when performing many code patches in a row (e.g.,
as ftrace would).

Signed-off-by: Christopher M. Riedl <cmr@bluescreens.de>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
v10:	* Don't open-code mm init and teardown
v9:	* Add back Christopher M. Riedl signed-off-by
	* Remove temp_mm_state
---
 arch/powerpc/lib/code-patching.c | 177 ++++++++++++++++++++++++++++++-
 1 file changed, 172 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 3055eef7dcdc..5b0022997296 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -4,12 +4,17 @@
  */
 
 #include <linux/kprobes.h>
+#include <linux/mmu_context.h>
+#include <linux/random.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/cpuhotplug.h>
 #include <linux/uaccess.h>
 #include <linux/jump_label.h>
 
+#include <asm/debug.h>
+#include <asm/pgalloc.h>
+#include <asm/tlb.h>
 #include <asm/tlbflush.h>
 #include <asm/page.h>
 #include <asm/code-patching.h>
@@ -42,11 +47,54 @@ int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
+
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
+static DEFINE_PER_CPU(struct mm_struct *, cpu_patching_mm);
+static DEFINE_PER_CPU(unsigned long, cpu_patching_addr);
+static DEFINE_PER_CPU(pte_t *, cpu_patching_pte);
 
 static int map_patch_area(void *addr, unsigned long text_poke_addr);
 static void unmap_patch_area(unsigned long addr);
 
+static bool mm_patch_enabled(void)
+{
+	return IS_ENABLED(CONFIG_SMP) && radix_enabled();
+}
+
+/*
+ * The following applies for Radix MMU. Hash MMU has different requirements,
+ * and so is not supported.
+ *
+ * Changing mm requires context synchronising instructions on both sides of
+ * the context switch, as well as a hwsync between the last instruction for
+ * which the address of an associated storage access was translated using
+ * the current context.
+ *
+ * switch_mm_irqs_off() performs an isync after the context switch. It is
+ * the responsibility of the caller to perform the CSI and hwsync before
+ * starting/stopping the temp mm.
+ */
+static struct mm_struct *start_using_temp_mm(struct mm_struct *temp_mm)
+{
+	struct mm_struct *orig_mm = current->active_mm;
+
+	lockdep_assert_irqs_disabled();
+	switch_mm_irqs_off(orig_mm, temp_mm, current);
+
+	WARN_ON(!mm_is_thread_local(temp_mm));
+
+	suspend_breakpoints();
+	return orig_mm;
+}
+
+static void stop_using_temp_mm(struct mm_struct *temp_mm,
+			       struct mm_struct *orig_mm)
+{
+	lockdep_assert_irqs_disabled();
+	switch_mm_irqs_off(temp_mm, orig_mm, current);
+	restore_breakpoints();
+}
+
 static int text_area_cpu_up(unsigned int cpu)
 {
 	struct vm_struct *area;
@@ -79,14 +127,86 @@ static int text_area_cpu_down(unsigned int cpu)
 	return 0;
 }
 
+static void put_patching_mm(struct mm_struct *mm, unsigned long patching_addr)
+{
+	struct mmu_gather tlb;
+
+	tlb_gather_mmu(&tlb, mm);
+	free_pgd_range(&tlb, patching_addr, patching_addr + PAGE_SIZE, 0, 0);
+	mmput(mm);
+}
+
+static int text_area_cpu_up_mm(unsigned int cpu)
+{
+	struct mm_struct *mm;
+	unsigned long addr;
+	pte_t *pte;
+	spinlock_t *ptl;
+
+	mm = copy_init_mm();
+	if (WARN_ON(!mm))
+		goto fail_no_mm;
+
+	/*
+	 * Choose a random page-aligned address from the interval
+	 * [PAGE_SIZE .. DEFAULT_MAP_WINDOW - PAGE_SIZE].
+	 * The lower address bound is PAGE_SIZE to avoid the zero-page.
+	 */
+	addr = (1 + (get_random_long() % (DEFAULT_MAP_WINDOW / PAGE_SIZE - 2))) << PAGE_SHIFT;
+
+	/*
+	 * PTE allocation uses GFP_KERNEL which means we need to
+	 * pre-allocate the PTE here because we cannot do the
+	 * allocation during patching when IRQs are disabled.
+	 *
+	 * Using get_locked_pte() to avoid open coding, the lock
+	 * is unnecessary.
+	 */
+	pte = get_locked_pte(mm, addr, &ptl);
+	if (!pte)
+		goto fail_no_pte;
+	pte_unmap_unlock(pte, ptl);
+
+	this_cpu_write(cpu_patching_mm, mm);
+	this_cpu_write(cpu_patching_addr, addr);
+	this_cpu_write(cpu_patching_pte, pte);
+
+	return 0;
+
+fail_no_pte:
+	put_patching_mm(mm, addr);
+fail_no_mm:
+	return -ENOMEM;
+}
+
+static int text_area_cpu_down_mm(unsigned int cpu)
+{
+	put_patching_mm(this_cpu_read(cpu_patching_mm),
+			this_cpu_read(cpu_patching_addr));
+
+	this_cpu_write(cpu_patching_mm, NULL);
+	this_cpu_write(cpu_patching_addr, 0);
+	this_cpu_write(cpu_patching_pte, NULL);
+
+	return 0;
+}
+
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(poking_init_done);
 
 void __init poking_init(void)
 {
-	int ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
-				    "powerpc/text_poke:online",
-				    text_area_cpu_up,
-				    text_area_cpu_down);
+	int ret;
+
+	if (mm_patch_enabled())
+		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"powerpc/text_poke_mm:online",
+					text_area_cpu_up_mm,
+					text_area_cpu_down_mm);
+	else
+		ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
+					"powerpc/text_poke:online",
+					text_area_cpu_up,
+					text_area_cpu_down);
 
 	/* cpuhp_setup_state returns >= 0 on success */
 	if (WARN_ON(ret < 0))
@@ -148,6 +268,50 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
+static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
+{
+	int err;
+	u32 *patch_addr;
+	unsigned long text_poke_addr;
+	pte_t *pte;
+	unsigned long pfn = get_patch_pfn(addr);
+	struct mm_struct *patching_mm;
+	struct mm_struct *orig_mm;
+
+	patching_mm = __this_cpu_read(cpu_patching_mm);
+	pte = __this_cpu_read(cpu_patching_pte);
+	text_poke_addr = __this_cpu_read(cpu_patching_addr);
+	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+
+	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
+
+	/* order PTE update before use, also serves as the hwsync */
+	asm volatile("ptesync": : :"memory");
+
+	/* order context switch after arbitrary prior code */
+	isync();
+
+	orig_mm = start_using_temp_mm(patching_mm);
+
+	err = __patch_instruction(addr, instr, patch_addr);
+
+	/* hwsync performed by __patch_instruction (sync) if successful */
+	if (err)
+		mb();  /* sync */
+
+	/* context synchronisation performed by __patch_instruction (isync or exception) */
+	stop_using_temp_mm(patching_mm, orig_mm);
+
+	pte_clear(patching_mm, text_poke_addr, pte);
+	/*
+	 * ptesync to order PTE update before TLB invalidation done
+	 * by radix__local_flush_tlb_page_psize (in _tlbiel_va)
+	 */
+	local_flush_tlb_page_psize(patching_mm, text_poke_addr, mmu_virtual_psize);
+
+	return err;
+}
+
 static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	int err;
@@ -187,7 +351,10 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
-	err = __do_patch_instruction(addr, instr);
+	if (mm_patch_enabled())
+		err = __do_patch_instruction_mm(addr, instr);
+	else
+		err = __do_patch_instruction(addr, instr);
 	local_irq_restore(flags);
 
 	return err;
-- 
2.38.1

