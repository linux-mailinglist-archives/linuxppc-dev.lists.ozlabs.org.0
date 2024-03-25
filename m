Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2BB88B484
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 23:50:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PAdiRetj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Snw04Kgz3vZQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 09:50:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PAdiRetj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3SmB4Krsz3cWN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 09:49:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42PLiCvk005768;
	Mon, 25 Mar 2024 22:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=W8Lkyeh58Qvnfgh3bAhyRz1Cc4TFOtOZLJJH6rX4yRI=;
 b=PAdiRetj0D0zjnB4m8LKuM4cvJd0q6hR3CYVTndNeyXNV5PRMPG9mtStlInVyY/CQvrX
 yNktCDrkKQ13bmI5Ihrl6MjMGMfNq3gZ2YmlHNEVi2rz7/2bnVdtvGtsww8+jby1vBAp
 rPpSCWy8A/55EGbNifCd+DBM9Y3yjqh5fpERMLjHJsMgzeqXylEUHE2T+RmAcDmnQDSC
 jnIggPAFzzQdVvSOXW+q38RbTLNA7biMjNTwdUHW/ycswja7PHAGFCxC+L8S6L4q3Rok
 JF+RTqdKmxaLXTqxxUH9J8d25gfCJNME+qVcnTXqLGpXKCXURCVk2BQ2Agt26LUGCFAM AQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3hbfg341-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:04 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42PKEBrC028717;
	Mon, 25 Mar 2024 22:49:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adp438h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:03 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42PMmx1d40698284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 22:49:01 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 868D920043;
	Mon, 25 Mar 2024 22:48:59 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98A3C20040;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DC3CA6015D;
	Tue, 26 Mar 2024 09:48:55 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/code-patching: Introduce open_patch_window()/close_patch_window()
Date: Tue, 26 Mar 2024 09:48:46 +1100
Message-ID: <20240325224848.20987-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rb9U6hpwU4LoFNHLQ0il49JUc6vk4B3m
X-Proofpoint-GUID: rb9U6hpwU4LoFNHLQ0il49JUc6vk4B3m
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_22,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250143
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The code patching capabilities have grown, and the specific quirks for
setting up and tearing down the patching window are getting duplicated.

This commit introduces an abstraction for working with this patching
window. It defines open_patch_window() to set up the writable alias
page, and close_patch_window() to remove it and flush the TLB. The
actual mechanism for providing this patching window is an implementation
detail that consumers don't need to worry about. Consumers are still
responsible for flushing/syncing any changes they make through this
alias page though.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v1: https://lore.kernel.org/all/20240315025937.407590-1-bgray@linux.ibm.com/

This design can be readily extended to remap the writable page to
another physical page without incurring all of the entry and exit
overhead. But that might have problems with spending too long in
an interrupts disabled context, so I've left it out for now.
---
 arch/powerpc/lib/code-patching.c | 113 +++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index df64343b9214..7c193e19e297 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -276,6 +276,119 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
+/*
+ * Represents an active patching window.
+ */
+struct patch_window {
+	/*
+	 * Page aligned patching window address. The page is a writable alias of
+	 * the configured target page.
+	 */
+	unsigned long text_poke_addr;
+	/*
+	 * Pointer to the PTE for the patching window page.
+	 */
+	pte_t *ptep;
+	/*
+	 * (Temporary MM patching only) The original MM before creating the
+	 * patching window.
+	 */
+	struct mm_struct *orig_mm;
+	/*
+	 * (Temporary MM patching only) The patching window MM.
+	 */
+	struct mm_struct *patch_mm;
+	/*
+	 * (Temporary MM patching only) Lock for the patching window PTE.
+	 */
+	spinlock_t *ptl;
+};
+
+/*
+ * Calling this function opens a 'patching window' that maps a
+ * page starting at ctx->text_poke_addr (which is set by this function)
+ * as a writable alias to the page starting at addr.
+ *
+ * Upon success, callers must invoke the corresponding close_patch_window()
+ * function to return to the original state. Callers are also responsible
+ * for syncing any changes they make inside the window.
+ *
+ * Interrupts must be disabled for the entire duration of the patching. The PIDR
+ * is potentially changed during this time.
+ */
+static int open_patch_window(void *addr, struct patch_window *ctx)
+{
+	unsigned long pfn = get_patch_pfn(addr);
+
+	lockdep_assert_irqs_disabled();
+
+	ctx->text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr);
+
+	if (!mm_patch_enabled()) {
+		ctx->ptep = __this_cpu_read(cpu_patching_context.pte);
+		__set_pte_at(&init_mm, ctx->text_poke_addr,
+			     ctx->ptep, pfn_pte(pfn, PAGE_KERNEL), 0);
+
+		/* See ptesync comment in radix__set_pte_at() */
+		if (radix_enabled())
+			asm volatile("ptesync" ::: "memory");
+
+		return 0;
+	}
+
+	ctx->orig_mm = current->active_mm;
+	ctx->patch_mm = __this_cpu_read(cpu_patching_context.mm);
+
+	ctx->ptep = get_locked_pte(ctx->patch_mm, ctx->text_poke_addr, &ctx->ptl);
+	if (!ctx->ptep)
+		return -ENOMEM;
+
+	__set_pte_at(ctx->patch_mm, ctx->text_poke_addr,
+		     ctx->ptep, pfn_pte(pfn, PAGE_KERNEL), 0);
+
+	/* order PTE update before use, also serves as the hwsync */
+	asm volatile("ptesync" ::: "memory");
+
+	/*
+	 * Changing mm requires context synchronising instructions on both sides of
+	 * the context switch, as well as a hwsync between the last instruction for
+	 * which the address of an associated storage access was translated using
+	 * the current context. switch_mm_irqs_off() performs an isync after the
+	 * context switch.
+	 */
+	isync();
+	switch_mm_irqs_off(ctx->orig_mm, ctx->patch_mm, current);
+
+	WARN_ON(!mm_is_thread_local(ctx->patch_mm));
+
+	suspend_breakpoints();
+	return 0;
+}
+
+static void close_patch_window(struct patch_window *ctx)
+{
+	lockdep_assert_irqs_disabled();
+
+	if (!mm_patch_enabled()) {
+		pte_clear(&init_mm, ctx->text_poke_addr, ctx->ptep);
+		flush_tlb_kernel_range(ctx->text_poke_addr, ctx->text_poke_addr + PAGE_SIZE);
+		return;
+	}
+
+	isync();
+	switch_mm_irqs_off(ctx->patch_mm, ctx->orig_mm, current);
+	restore_breakpoints();
+
+	pte_clear(ctx->patch_mm, ctx->text_poke_addr, ctx->ptep);
+	/*
+	 * ptesync to order PTE update before TLB invalidation done
+	 * by radix__local_flush_tlb_page_psize (in _tlbiel_va)
+	 */
+	local_flush_tlb_page_psize(ctx->patch_mm, ctx->text_poke_addr, mmu_virtual_psize);
+
+	pte_unmap_unlock(ctx->ptep, ctx->ptl);
+}
+
 static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 {
 	int err;
-- 
2.44.0

