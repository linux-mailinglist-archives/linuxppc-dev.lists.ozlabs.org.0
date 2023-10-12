Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B01B7C7799
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 22:05:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGoU+pSB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S60x86zRkz3vYZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 07:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGoU+pSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S60vK5BxBz3cC7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 07:03:41 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39CK2X5g026212;
	Thu, 12 Oct 2023 20:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=FGl4ownzoNJXB/rmMWZZIxw9H4Wfbqhv55Yl8Zm1Y+c=;
 b=sGoU+pSBnTMTrdMWv8djIzJrVig5ebNM1fKsE3CvM1IVPZL8LaYItzZAjvXEOevmMVUN
 krnq23ko9BxQS/I0F8B0EOY4BS2Mr1/y3vbGCY33PgasUccaTzHIBIlOg1sMOzuEfxjd
 odQqWmDRjFnwWTUwpnfili/54wmLJCENYWYhdetYsiiYSIarjpL3Y5NxmdrnsCNYIHbB
 CJ1WVJ5Jxx4e3fHAhzSGVDWxxc/Xv3qHNiD/115wIg4EYMaATrrzvsdarNiFbG55MQqK
 6OHVPVoD1r9D4E1rMSBvG/BY/kRt8KJnphOdVAvStGEr5pXlXGAcnMBP5LuXQ0QY/xy/ Vg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tpqfy00p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:03:19 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39CIgZDI023064;
	Thu, 12 Oct 2023 20:03:18 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc21jtr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 20:03:18 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39CK3GnM17171110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Oct 2023 20:03:17 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5D572004B;
	Thu, 12 Oct 2023 20:03:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BCBF20040;
	Thu, 12 Oct 2023 20:03:14 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.73.24])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Oct 2023 20:03:14 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v6 1/5] powerpc/code-patching: introduce patch_instructions()
Date: Fri, 13 Oct 2023 01:33:06 +0530
Message-ID: <20231012200310.235137-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012200310.235137-1-hbathini@linux.ibm.com>
References: <20231012200310.235137-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uFEmo6AccHJO_YkPZzTD9PsTVRBEkusJ
X-Proofpoint-ORIG-GUID: uFEmo6AccHJO_YkPZzTD9PsTVRBEkusJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_12,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=844
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120167
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

patch_instruction() entails setting up pte, patching the instruction,
clearing the pte and flushing the tlb. If multiple instructions need
to be patched, every instruction would have to go through the above
drill unnecessarily. Instead, introduce patch_instructions() function
that sets up the pte, clears the pte and flushes the tlb only once per
page range of instructions to be patched. This duplicates most of the
code patching logic, instead of merging with it, to avoid performance
degradation observed for single instruction patching on ppc32 with
the code path merged.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Acked-by: Song Liu <song@kernel.org>
---

Changes in v6:
* Skipped merging code path of patch_instruction() & patch_instructions()
  to avoid performance overhead observed on ppc32 with that.


 arch/powerpc/include/asm/code-patching.h |   1 +
 arch/powerpc/lib/code-patching.c         | 138 +++++++++++++++++++++++
 2 files changed, 139 insertions(+)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..0e29ccf903d0 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -74,6 +74,7 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
+int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index b00112d7ad46..a115496f934b 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -378,6 +378,144 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
+static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool repeat_instr)
+{
+	unsigned long start = (unsigned long)patch_addr;
+
+	/* Repeat instruction */
+	if (repeat_instr) {
+		ppc_inst_t instr = ppc_inst_read(code);
+
+		if (ppc_inst_prefixed(instr)) {
+			u64 val = ppc_inst_as_ulong(instr);
+
+			memset64((u64 *)patch_addr, val, len / 8);
+		} else {
+			u32 val = ppc_inst_val(instr);
+
+			memset32(patch_addr, val, len / 4);
+		}
+	} else {
+		memcpy(patch_addr, code, len);
+	}
+
+	smp_wmb();	/* smp write barrier */
+	flush_icache_range(start, start + len);
+	return 0;
+}
+
+/*
+ * A page is mapped and instructions that fit the page are patched.
+ * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ */
+static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool repeat_instr)
+{
+	struct mm_struct *patching_mm, *orig_mm;
+	unsigned long pfn = get_patch_pfn(addr);
+	unsigned long text_poke_addr;
+	spinlock_t *ptl;
+	u32 *patch_addr;
+	pte_t *pte;
+	int err;
+
+	patching_mm = __this_cpu_read(cpu_patching_context.mm);
+	text_poke_addr = __this_cpu_read(cpu_patching_context.addr);
+	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+
+	pte = get_locked_pte(patching_mm, text_poke_addr, &ptl);
+	if (!pte)
+		return -ENOMEM;
+
+	__set_pte_at(patching_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
+
+	/* order PTE update before use, also serves as the hwsync */
+	asm volatile("ptesync" ::: "memory");
+
+	/* order context switch after arbitrary prior code */
+	isync();
+
+	orig_mm = start_using_temp_mm(patching_mm);
+
+	err = __patch_instructions(patch_addr, code, len, repeat_instr);
+
+	/* context synchronisation performed by __patch_instructions */
+	stop_using_temp_mm(patching_mm, orig_mm);
+
+	pte_clear(patching_mm, text_poke_addr, pte);
+	/*
+	 * ptesync to order PTE update before TLB invalidation done
+	 * by radix__local_flush_tlb_page_psize (in _tlbiel_va)
+	 */
+	local_flush_tlb_page_psize(patching_mm, text_poke_addr, mmu_virtual_psize);
+
+	pte_unmap_unlock(pte, ptl);
+
+	return err;
+}
+
+/*
+ * A page is mapped and instructions that fit the page are patched.
+ * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ */
+static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
+{
+	unsigned long pfn = get_patch_pfn(addr);
+	unsigned long text_poke_addr;
+	u32 *patch_addr;
+	pte_t *pte;
+	int err;
+
+	text_poke_addr = (unsigned long)__this_cpu_read(cpu_patching_context.addr) & PAGE_MASK;
+	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+
+	pte = __this_cpu_read(cpu_patching_context.pte);
+	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
+	/* See ptesync comment in radix__set_pte_at() */
+	if (radix_enabled())
+		asm volatile("ptesync" ::: "memory");
+
+	err = __patch_instructions(patch_addr, code, len, repeat_instr);
+
+	pte_clear(&init_mm, text_poke_addr, pte);
+	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+
+	return err;
+}
+
+/*
+ * Patch 'addr' with 'len' bytes of instructions from 'code'.
+ *
+ * If repeat_instr is true, the same instruction is filled for
+ * 'len' bytes.
+ */
+int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
+{
+	while (len > 0) {
+		unsigned long flags;
+		size_t plen;
+		int err;
+
+		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
+
+		local_irq_save(flags);
+		if (mm_patch_enabled())
+			err = __do_patch_instructions_mm(addr, code, plen, repeat_instr);
+		else
+			err = __do_patch_instructions(addr, code, plen, repeat_instr);
+		local_irq_restore(flags);
+		if (err)
+			return err;
+
+		len -= plen;
+		addr = (u32 *)((unsigned long)addr + plen);
+		if (!repeat_instr)
+			code = (u32 *)((unsigned long)code + plen);
+	}
+
+	return 0;
+}
+NOKPROBE_SYMBOL(patch_instructions);
+
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
 	ppc_inst_t instr;
-- 
2.41.0

