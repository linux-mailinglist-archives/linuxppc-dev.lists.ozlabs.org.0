Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9787B2623
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 21:50:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=anNFOzvT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxPGR3Bpxz3cnH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 05:50:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=anNFOzvT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxPDd3W6rz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 05:48:49 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38SJgEhn024860;
	Thu, 28 Sep 2023 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AoYLP/MnhSCSSXeX7DgGl+fhFUwfz85Tk3MmzRpvFOA=;
 b=anNFOzvT8eGzBZlOmRLNfnUCF8iwhKHyCjw4bsh3f90SNCCcQJ5PZUeol7YluG/Rdh0E
 5tOOUWjDhh/bZuw0/E03nZ4TnarEUV4iiKsf96PRKyOrSNdod0JyeAPaKDVCPyDQouy/
 kE+fZXKgCRFBajaqvv1Zm3X0xFmmGoOw8uHeb0BdFiYJUGsGW9aNSAqNaPUAbRxMWzXJ
 rrpO96AL/dunmRPWfTo8To13xalaNKu1wNUNWcPET1h/6/MeU3iG7RdXg+kc7bT/Zon7
 cfygiInAke4kwK2KadisY7xpT3GVEV+OKaJBQk603VLjoYY7b6iNwyvdQYxao8qVwq3n kQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tdfvfg5nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 19:48:28 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38SJ25mL008167;
	Thu, 28 Sep 2023 19:48:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3taaqyyp8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 19:48:26 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38SJmOaA44630396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Sep 2023 19:48:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA8F720043;
	Thu, 28 Sep 2023 19:48:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C68F220040;
	Thu, 28 Sep 2023 19:48:22 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.85.6])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Sep 2023 19:48:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org
Subject: [PATCH v5 1/5] powerpc/code-patching: introduce patch_instructions()
Date: Fri, 29 Sep 2023 01:18:14 +0530
Message-ID: <20230928194818.261163-2-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928194818.261163-1-hbathini@linux.ibm.com>
References: <20230928194818.261163-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aNwSgxiE30fo-pLYWxoR1sA_9OCHVBzo
X-Proofpoint-ORIG-GUID: aNwSgxiE30fo-pLYWxoR1sA_9OCHVBzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_19,2023-09-28_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=301 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280167
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

patch_instruction() entails setting up pte, patching the instruction,
clearing the pte and flushing the tlb. If multiple instructions need
to be patched, every instruction would have to go through the above
drill unnecessarily. Instead, introduce function patch_instructions()
that sets up the pte, clears the pte and flushes the tlb only once per
page range of instructions to be patched. This adds a slight overhead
to patch_instruction() call while improving the patching time for
scenarios where more than one instruction needs to be patched.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/lib/code-patching.c         | 93 +++++++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..43a4aedfa703 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -74,6 +74,7 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
+int patch_instructions(void *addr, void *code, size_t len, bool repeat_instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index b00112d7ad46..4ff002bc41f6 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -278,7 +278,36 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
+static int __patch_instructions(u32 *patch_addr, void *code, size_t len, bool repeat_instr)
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
+			memset64((uint64_t *)patch_addr, val, len / 8);
+		} else {
+			u32 val = ppc_inst_val(instr);
+
+			memset32(patch_addr, val, len / 4);
+		}
+	} else
+		memcpy(patch_addr, code, len);
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
+static int __do_patch_instructions_mm(u32 *addr, void *code, size_t len, bool repeat_instr)
 {
 	int err;
 	u32 *patch_addr;
@@ -307,11 +336,15 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 
 	orig_mm = start_using_temp_mm(patching_mm);
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	/* Single instruction case. */
+	if (len == 0) {
+		err = __patch_instruction(addr, *(ppc_inst_t *)code, patch_addr);
 
-	/* hwsync performed by __patch_instruction (sync) if successful */
-	if (err)
-		mb();  /* sync */
+		/* hwsync performed by __patch_instruction (sync) if successful */
+		if (err)
+			mb();  /* sync */
+	} else
+		err = __patch_instructions(patch_addr, code, len, repeat_instr);
 
 	/* context synchronisation performed by __patch_instruction (isync or exception) */
 	stop_using_temp_mm(patching_mm, orig_mm);
@@ -328,7 +361,11 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+/*
+ * A page is mapped and instructions that fit the page are patched.
+ * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ */
+static int __do_patch_instructions(u32 *addr, void *code, size_t len, bool repeat_instr)
 {
 	int err;
 	u32 *patch_addr;
@@ -345,7 +382,11 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	/* Single instruction case. */
+	if (len == 0)
+		err = __patch_instruction(addr, *(ppc_inst_t *)code, patch_addr);
+	else
+		err = __patch_instructions(patch_addr, code, len, repeat_instr);
 
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -369,15 +410,49 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 
 	local_irq_save(flags);
 	if (mm_patch_enabled())
-		err = __do_patch_instruction_mm(addr, instr);
+		err = __do_patch_instructions_mm(addr, &instr, 0, false);
 	else
-		err = __do_patch_instruction(addr, instr);
+		err = __do_patch_instructions(addr, &instr, 0, false);
 	local_irq_restore(flags);
 
 	return err;
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
+/*
+ * Patch 'addr' with 'len' bytes of instructions from 'code'.
+ *
+ * If repeat_instr is true, the same instruction is filled for
+ * 'len' bytes.
+ */
+int patch_instructions(void *addr, void *code, size_t len, bool repeat_instr)
+{
+	unsigned long flags;
+	size_t plen;
+	int err;
+
+	while (len > 0) {
+		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
+
+		local_irq_save(flags);
+		if (mm_patch_enabled())
+			err = __do_patch_instructions_mm(addr, code, plen, repeat_instr);
+		else
+			err = __do_patch_instructions(addr, code, plen, repeat_instr);
+		local_irq_restore(flags);
+		if (err)
+			break;
+
+		len -= plen;
+		addr = addr + plen;
+		if (!repeat_instr)
+			code = code + plen;
+	}
+
+	return err;
+}
+NOKPROBE_SYMBOL(patch_instructions);
+
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
 	ppc_inst_t instr;
-- 
2.41.0

