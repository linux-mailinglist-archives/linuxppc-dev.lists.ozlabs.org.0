Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C6888F9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:56:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XM88DUSY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32J447L4z2y3b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:56:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XM88DUSY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32DC3lZzz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:31 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P5fCE0011696;
	Mon, 25 Mar 2024 05:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ESa+NiLlTpzFYmhgHFktXJTFzSXeDdFhRjs59W3vEVM=;
 b=XM88DUSYZjVBcTD+cfMnPZdUC/+Qc6iOjrozsuFNSD7ochhaQaoglm+pB+L97kUn7tox
 4AyqwaYFD9ernFm1LlUEXq5LJo/LsrXMhgCK/uJFGYSHhzWjyB24xGOrQVxKGttihhfZ
 60f9D+sjlEQEMRZrmcp8we9VefsEqqAUvbAeULdgGpZzaKmB1hY8RG6hPm31aJdtJmY2
 cz6lyPpjs7Gf36yVzzwAyixdwJaq6RHOFVTnEFvBWbsZNqhc0UnBl58M96yYcuBgo6s2
 hLAu/1X7i7tbefbhkvS27D98arwejVjCuWca62PukIDCdE3s0Vy+A7JIqXDT+50c8NzV zg== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2hdksjk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:21 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P5amk9028790;
	Mon, 25 Mar 2024 05:53:20 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adny3sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rFoS36176272
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D913E20040;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 110122004B;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CEBB660429;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/5] powerpc/code-patching: Add generic memory patching
Date: Mon, 25 Mar 2024 16:52:58 +1100
Message-ID: <20240325055302.876434-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xSbasb8WOa4Z7wSt6ZC8A3-9aml3vO8c
X-Proofpoint-GUID: xSbasb8WOa4Z7wSt6ZC8A3-9aml3vO8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250030
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
Cc: Naveen N Rao <naveen@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

patch_instruction() is designed for patching instructions in otherwise
readonly memory. Other consumers also sometimes need to patch readonly
memory, so have abused patch_instruction() for arbitrary data patches.

This is a problem on ppc64 as patch_instruction() decides on the patch
width using the 'instruction' opcode to see if it's a prefixed
instruction. Data that triggers this can lead to larger writes, possibly
crossing a page boundary and failing the write altogether.

Introduce patch_uint(), and patch_ulong(), with aliases patch_u32(), and
patch_u64() (on ppc64) designed for aligned data patches. The patch
size is now determined by the called function, and is passed as an
additional parameter to generic internals.

While the instruction flushing is not required for data patches, it
remains unconditional in this patch. A followup series is possible if
benchmarking shows fewer flushes gives an improvement in some
data-patching workload.

ppc32 does not support prefixed instructions, so is unaffected by the
original issue. Care is taken in not exposing the size parameter in the
public (non-static) interface, so the compiler can const-propagate it
away.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v3: * Rename from *_memory to *_mem
    * Change type of ppc32 patch_uint() address to void*
    * Explain introduction of val32 for big endian
    * Some formatting

v2: * Deduplicate patch_32() definition
    * Use u32 for val32
    * Remove noinline
---
 arch/powerpc/include/asm/code-patching.h | 31 ++++++++++++
 arch/powerpc/lib/code-patching.c         | 64 ++++++++++++++++++------
 2 files changed, 80 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 0e29ccf903d0..21a36e2c4e26 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -76,6 +76,37 @@ int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
 int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr);
 
+/*
+ * The data patching functions patch_uint() and patch_ulong(), etc., must be
+ * called on aligned addresses.
+ *
+ * The instruction patching functions patch_instruction() and similar must be
+ * called on addresses satisfying instruction alignment requirements.
+ */
+
+#ifdef CONFIG_PPC64
+
+int patch_uint(void *addr, unsigned int val);
+int patch_ulong(void *addr, unsigned long val);
+
+#define patch_u64 patch_ulong
+
+#else
+
+static inline int patch_uint(void *addr, unsigned int val)
+{
+	return patch_instruction(addr, ppc_inst(val));
+}
+
+static inline int patch_ulong(void *addr, unsigned long val)
+{
+	return patch_instruction(addr, ppc_inst(val));
+}
+
+#endif
+
+#define patch_u32 patch_uint
+
 static inline unsigned long patch_site_addr(s32 *site)
 {
 	return (unsigned long)site + *site;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index c6ab46156cda..a31e313c6321 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -20,15 +20,14 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
+static int __patch_mem(void *exec_addr, unsigned long val, void *patch_addr, bool is_dword)
 {
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
+	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
+		/* For big endian correctness: plain address would use the wrong half */
+		u32 val32 = val;
 
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
+		__put_kernel_nofault(patch_addr, &val32, u32, failed);
 	} else {
-		u64 val = ppc_inst_as_ulong(instr);
-
 		__put_kernel_nofault(patch_addr, &val, u64, failed);
 	}
 
@@ -44,7 +43,10 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	return __patch_instruction(addr, instr, addr);
+	if (ppc_inst_prefixed(instr))
+		return __patch_mem(addr, ppc_inst_as_ulong(instr), addr, true);
+	else
+		return __patch_mem(addr, ppc_inst_val(instr), addr, false);
 }
 
 struct patch_context {
@@ -276,7 +278,7 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
+static int __do_patch_mem_mm(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -305,7 +307,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 
 	orig_mm = start_using_temp_mm(patching_mm);
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_mem(addr, val, patch_addr, is_dword);
 
 	/* context synchronisation performed by __patch_instruction (isync or exception) */
 	stop_using_temp_mm(patching_mm, orig_mm);
@@ -322,7 +324,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __do_patch_mem(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -339,7 +341,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_mem(addr, val, patch_addr, is_dword);
 
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -347,7 +349,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-int patch_instruction(u32 *addr, ppc_inst_t instr)
+static int patch_mem(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	unsigned long flags;
@@ -359,19 +361,51 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 	 */
 	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
 	    !static_branch_likely(&poking_init_done))
-		return raw_patch_instruction(addr, instr);
+		return __patch_mem(addr, val, addr, is_dword);
 
 	local_irq_save(flags);
 	if (mm_patch_enabled())
-		err = __do_patch_instruction_mm(addr, instr);
+		err = __do_patch_mem_mm(addr, val, is_dword);
 	else
-		err = __do_patch_instruction(addr, instr);
+		err = __do_patch_mem(addr, val, is_dword);
 	local_irq_restore(flags);
 
 	return err;
 }
+
+#ifdef CONFIG_PPC64
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	if (ppc_inst_prefixed(instr))
+		return patch_mem(addr, ppc_inst_as_ulong(instr), true);
+	else
+		return patch_mem(addr, ppc_inst_val(instr), false);
+}
 NOKPROBE_SYMBOL(patch_instruction);
 
+int patch_uint(void *addr, unsigned int val)
+{
+	return patch_mem(addr, val, false);
+}
+NOKPROBE_SYMBOL(patch_uint);
+
+int patch_ulong(void *addr, unsigned long val)
+{
+	return patch_mem(addr, val, true);
+}
+NOKPROBE_SYMBOL(patch_ulong);
+
+#else
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	return patch_mem(addr, ppc_inst_val(instr), false);
+}
+NOKPROBE_SYMBOL(patch_instruction)
+
+#endif
+
 static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool repeat_instr)
 {
 	unsigned long start = (unsigned long)patch_addr;
-- 
2.44.0

