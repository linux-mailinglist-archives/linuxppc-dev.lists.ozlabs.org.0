Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776388B480
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 23:49:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Od3EFEir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3Smz4Phfz3dWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 09:49:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Od3EFEir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3SmB0ZZ3z3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 09:49:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42PMbk7Y012539;
	Mon, 25 Mar 2024 22:49:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Nl+zfknWDVplKwfWjHcs+Mxck+p7z/ycCUwTkRzYzQc=;
 b=Od3EFEir8s76PoRua5acADphMkkkcCDfdMht7jOUc8HVJsZzVTYDFPhhnnkna2lr1Nmb
 mABSXt+2P+xjoyXwuD8v4FvoMWiZ++egfgmgsHCBGmW6mj0Uss5Vrh6VNC9fxP8MGfBo
 Su1BDqXwaiqsxXA03/qjMZ7N+npT6UyaiSpmCnj0N7mEDcaXfF6p51Q3xDiuEB9OqktX
 9CVsmnofCkX98i5fLYynLsEFgTWrvktxxumn+I6AFtiT3vVpZTHsJzWMtb96Ry+E3SwZ
 Lay4ZhICSk85td9aIx2XTZF/JzYEng2rsITnNQezIKRZXg/Mer7oDAj4pZfsBZEqQzNB 9Q== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x3fkmg8sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:03 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42PLrFrE003804;
	Mon, 25 Mar 2024 22:49:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2c42kk49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 22:49:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42PMmxM644433906
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 22:49:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79C5720043;
	Mon, 25 Mar 2024 22:48:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9104A2004D;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 22:48:58 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DF98A60429;
	Tue, 26 Mar 2024 09:48:55 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/code-patching: Convert to open_patch_window()/close_patch_window()
Date: Tue, 26 Mar 2024 09:48:47 +1100
Message-ID: <20240325224848.20987-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325224848.20987-1-bgray@linux.ibm.com>
References: <20240325224848.20987-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JKmsuZbl_o1YVQAXwdN5pwNQSCWpqNrY
X-Proofpoint-ORIG-GUID: JKmsuZbl_o1YVQAXwdN5pwNQSCWpqNrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_22,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2403210000
 definitions=main-2403250142
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

The existing patching alias page setup and teardown sections can be
simplified to make use of the new open_patch_window() abstraction.

This eliminates the _mm variants of the helpers, consumers no longer
need to check mm_patch_enabled(), and consumers no longer need to worry
about synchronization and flushing beyond the changes they make in the
patching window.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * Removed an outdated comment about syncing
---
 arch/powerpc/lib/code-patching.c | 179 +++----------------------------
 1 file changed, 15 insertions(+), 164 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 7c193e19e297..b3a644290369 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -66,40 +66,6 @@ static bool mm_patch_enabled(void)
 	return IS_ENABLED(CONFIG_SMP) && radix_enabled();
 }
 
-/*
- * The following applies for Radix MMU. Hash MMU has different requirements,
- * and so is not supported.
- *
- * Changing mm requires context synchronising instructions on both sides of
- * the context switch, as well as a hwsync between the last instruction for
- * which the address of an associated storage access was translated using
- * the current context.
- *
- * switch_mm_irqs_off() performs an isync after the context switch. It is
- * the responsibility of the caller to perform the CSI and hwsync before
- * starting/stopping the temp mm.
- */
-static struct mm_struct *start_using_temp_mm(struct mm_struct *temp_mm)
-{
-	struct mm_struct *orig_mm = current->active_mm;
-
-	lockdep_assert_irqs_disabled();
-	switch_mm_irqs_off(orig_mm, temp_mm, current);
-
-	WARN_ON(!mm_is_thread_local(temp_mm));
-
-	suspend_breakpoints();
-	return orig_mm;
-}
-
-static void stop_using_temp_mm(struct mm_struct *temp_mm,
-			       struct mm_struct *orig_mm)
-{
-	lockdep_assert_irqs_disabled();
-	switch_mm_irqs_off(temp_mm, orig_mm, current);
-	restore_breakpoints();
-}
-
 static int text_area_cpu_up(unsigned int cpu)
 {
 	struct vm_struct *area;
@@ -389,73 +355,20 @@ static void close_patch_window(struct patch_window *ctx)
 	pte_unmap_unlock(ctx->ptep, ctx->ptl);
 }
 
-static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
-{
-	int err;
-	u32 *patch_addr;
-	unsigned long text_poke_addr;
-	pte_t *pte;
-	unsigned long pfn = get_patch_pfn(addr);
-	struct mm_struct *patching_mm;
-	struct mm_struct *orig_mm;
-	spinlock_t *ptl;
-
-	patching_mm = __this_cpu_read(cpu_patching_context.mm);
-	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
-
-	pte = get_locked_pte(patching_mm, text_poke_addr, &ptl);
-	if (!pte)
-		return -ENOMEM;
-
-	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
-
-	/* order PTE update before use, also serves as the hwsync */
-	asm volatile("ptesync": : :"memory");
-
-	/* order context switch after arbitrary prior code */
-	isync();
-
-	orig_mm = start_using_temp_mm(patching_mm);
-
-	err = __patch_instruction(addr, instr, patch_addr);
-
-	/* context synchronisation performed by __patch_instruction (isync or exception) */
-	stop_using_temp_mm(patching_mm, orig_mm);
-
-	pte_clear(patching_mm, text_poke_addr, pte);
-	/*
-	 * ptesync to order PTE update before TLB invalidation done
-	 * by radix__local_flush_tlb_page_psize (in _tlbiel_va)
-	 */
-	local_flush_tlb_page_psize(patching_mm, text_poke_addr, mmu_virtual_psize);
-
-	pte_unmap_unlock(pte, ptl);
-
-	return err;
-}
-
 static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	int err;
+	struct patch_window ctx;
 	u32 *patch_addr;
-	unsigned long text_poke_addr;
-	pte_t *pte;
-	unsigned long pfn = get_patch_pfn(addr);
-
-	text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+	int err;
 
-	pte = __this_cpu_read(cpu_patching_context.pte);
-	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
-	/* See ptesync comment in radix__set_pte_at() */
-	if (radix_enabled())
-		asm volatile("ptesync": : :"memory");
+	err = open_patch_window(addr, &ctx);
+	if (err)
+		return err;
 
+	patch_addr = (u32 *)(ctx.text_poke_addr + offset_in_page(addr));
 	err = __patch_instruction(addr, instr, patch_addr);
 
-	pte_clear(&init_mm, text_poke_addr, pte);
-	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+	close_patch_window(&ctx);
 
 	return err;
 }
@@ -475,10 +388,7 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
-	if (mm_patch_enabled())
-		err = __do_patch_instruction_mm(addr, instr);
-	else
-		err = __do_patch_instruction(addr, instr);
+	err = __do_patch_instruction(addr, instr);
 	local_irq_restore(flags);
 
 	return err;
@@ -534,80 +444,24 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 	return err;
 }
 
-/*
- * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
- */
-static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool repeat_instr)
-{
-	struct mm_struct *patching_mm, *orig_mm;
-	unsigned long pfn = get_patch_pfn(addr);
-	unsigned long text_poke_addr;
-	spinlock_t *ptl;
-	u32 *patch_addr;
-	pte_t *pte;
-	int err;
-
-	patching_mm = __this_cpu_read(cpu_patching_context.mm);
-	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
-
-	pte = get_locked_pte(patching_mm, text_poke_addr, &ptl);
-	if (!pte)
-		return -ENOMEM;
-
-	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
-
-	/* order PTE update before use, also serves as the hwsync */
-	asm volatile("ptesync" ::: "memory");
-
-	/* order context switch after arbitrary prior code */
-	isync();
-
-	orig_mm = start_using_temp_mm(patching_mm);
-
-	err = __patch_instructions(patch_addr, code, len, repeat_instr);
-
-	/* context synchronisation performed by __patch_instructions */
-	stop_using_temp_mm(patching_mm, orig_mm);
-
-	pte_clear(patching_mm, text_poke_addr, pte);
-	/*
-	 * ptesync to order PTE update before TLB invalidation done
-	 * by radix__local_flush_tlb_page_psize (in _tlbiel_va)
-	 */
-	local_flush_tlb_page_psize(patching_mm, text_poke_addr, mmu_virtual_psize);
-
-	pte_unmap_unlock(pte, ptl);
-
-	return err;
-}
-
 /*
  * A page is mapped and instructions that fit the page are patched.
  * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
  */
 static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
-	unsigned long pfn = get_patch_pfn(addr);
-	unsigned long text_poke_addr;
+	struct patch_window ctx;
 	u32 *patch_addr;
-	pte_t *pte;
 	int err;
 
-	text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
-
-	pte = __this_cpu_read(cpu_patching_context.pte);
-	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
-	/* See ptesync comment in radix__set_pte_at() */
-	if (radix_enabled())
-		asm volatile("ptesync" ::: "memory");
+	err = open_patch_window(addr, &ctx);
+	if (err)
+		return err;
 
+	patch_addr = (u32 *)(ctx.text_poke_addr + offset_in_page(addr));
 	err = __patch_instructions(patch_addr, code, len, repeat_instr);
 
-	pte_clear(&init_mm, text_poke_addr, pte);
-	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+	close_patch_window(&ctx);
 
 	return err;
 }
@@ -628,10 +482,7 @@ int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
 
 		local_irq_save(flags);
-		if (mm_patch_enabled())
-			err = __do_patch_instructions_mm(addr, code, plen, repeat_instr);
-		else
-			err = __do_patch_instructions(addr, code, plen, repeat_instr);
+		err = __do_patch_instructions(addr, code, plen, repeat_instr);
 		local_irq_restore(flags);
 		if (err)
 			return err;
-- 
2.44.0

