Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 528F87C9E65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 07:05:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPC9FZht;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S84my1dGXz3vYl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 16:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aPC9FZht;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S84l33vsHz3bpd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 16:03:43 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39G4rUrv010953;
	Mon, 16 Oct 2023 05:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kLMUA279eFfnsqYVEqQOCwl2btWrEjoT8rcwrqPuQj4=;
 b=aPC9FZhtA1viiu4U85FWMOvVotdQz3EuPFgEsPKmZFx7lim5o3dYqml77oZhq/2kSjgi
 i7d/MmmCH3u9wGbpMbnMhgzMNJS+N4FA8KrwOeCsbu0WMs5mw4RXP5uhCmGx+w7HevBI
 A4dqNgfVpxqZgC2TqDkgXGBY2uw1L/vQtd2gkF33gQIOdpYy0wSmT1s93mwQ/kuhcUII
 PrvTK6+DPluAi43YMBZeKodaA5BZ2gjhjY116jyUtYrouQChXMHZRhBB+J6xj3t5VeQE
 xRppT+CkwO0dXsK2QHm6IFmyvnXL4dp8XmVmk0lLw4J4pkySN6YvqliiwiHMYYN4IZ4b 0g== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3trutr3ra5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:36 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39G1lBGd019900;
	Mon, 16 Oct 2023 05:03:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr81163r3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:35 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39G53XOW43647496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 05:03:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54FC82004D;
	Mon, 16 Oct 2023 05:03:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 76A5B2004B;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2335660425;
	Mon, 16 Oct 2023 16:03:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/code-patching: Add generic memory patching
Date: Mon, 16 Oct 2023 16:01:45 +1100
Message-ID: <20231016050147.115686-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016050147.115686-1-bgray@linux.ibm.com>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lv9enxP0LvaCMIgOi40QqmUWHQY3cX4j
X-Proofpoint-ORIG-GUID: Lv9enxP0LvaCMIgOi40QqmUWHQY3cX4j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160044
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

While the instruction flushing is not required for data patches, the
use cases for data patching (mainly module loading and static calls)
are less performance sensitive than for instruction patching
(ftrace activation). So the instruction flushing remains unconditional
in this patch.

ppc32 does not support prefixed instructions, so is unaffected by the
original issue. Care is taken in not exposing the size parameter in the
public (non-static) interface, so the compiler can const-propagate it
away.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * Deduplicate patch_32() definition
    * Use u32 for val32
    * Remove noinline
---
 arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
 arch/powerpc/lib/code-patching.c         | 66 ++++++++++++++++++------
 2 files changed, 83 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..7c6056bb1706 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -75,6 +75,39 @@ int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
 
+/*
+ * patch_uint() and patch_ulong() should only be called on addresses where the
+ * patch does not cross a cacheline, otherwise it may not be flushed properly
+ * and mixes of new and stale data may be observed. It cannot cross a page
+ * boundary, as only the target page is mapped as writable.
+ *
+ * patch_instruction() and other instruction patchers automatically satisfy this
+ * requirement due to instruction alignment requirements.
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
+static inline int patch_uint(u32 *addr, unsigned int val)
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
index b00112d7ad46..60289332412f 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -20,15 +20,14 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
+static int __patch_memory(void *exec_addr, unsigned long val, void *patch_addr,
+			  bool is_dword)
 {
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
+	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
+		u32 val32 = val;
 
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
+		__put_kernel_nofault(patch_addr, &val32, u32, failed);
 	} else {
-		u64 val = ppc_inst_as_ulong(instr);
-
 		__put_kernel_nofault(patch_addr, &val, u64, failed);
 	}
 
@@ -43,7 +42,10 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	return __patch_instruction(addr, instr, addr);
+	if (ppc_inst_prefixed(instr))
+		return __patch_memory(addr, ppc_inst_as_ulong(instr), addr, true);
+	else
+		return __patch_memory(addr, ppc_inst_val(instr), addr, false);
 }
 
 struct patch_context {
@@ -278,7 +280,7 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
+static int __do_patch_memory_mm(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -307,7 +309,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 
 	orig_mm = start_using_temp_mm(patching_mm);
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_memory(addr, val, patch_addr, is_dword);
 
 	/* hwsync performed by __patch_instruction (sync) if successful */
 	if (err)
@@ -328,7 +330,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __do_patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -345,7 +347,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_memory(addr, val, patch_addr, is_dword);
 
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -353,7 +355,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-int patch_instruction(u32 *addr, ppc_inst_t instr)
+static int patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	unsigned long flags;
@@ -365,18 +367,50 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 	 */
 	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
 	    !static_branch_likely(&poking_init_done))
-		return raw_patch_instruction(addr, instr);
+		return __patch_memory(addr, val, addr, is_dword);
 
 	local_irq_save(flags);
 	if (mm_patch_enabled())
-		err = __do_patch_instruction_mm(addr, instr);
+		err = __do_patch_memory_mm(addr, val, is_dword);
 	else
-		err = __do_patch_instruction(addr, instr);
+		err = __do_patch_memory(addr, val, is_dword);
 	local_irq_restore(flags);
 
 	return err;
 }
-NOKPROBE_SYMBOL(patch_instruction);
+
+#ifdef CONFIG_PPC64
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	if (ppc_inst_prefixed(instr))
+		return patch_memory(addr, ppc_inst_as_ulong(instr), true);
+	else
+		return patch_memory(addr, ppc_inst_val(instr), false);
+}
+NOKPROBE_SYMBOL(patch_instruction)
+
+int patch_uint(void *addr, unsigned int val)
+{
+	return patch_memory(addr, val, false);
+}
+NOKPROBE_SYMBOL(patch_uint)
+
+int patch_ulong(void *addr, unsigned long val)
+{
+	return patch_memory(addr, val, true);
+}
+NOKPROBE_SYMBOL(patch_ulong)
+
+#else
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	return patch_memory(addr, ppc_inst_val(instr), false);
+}
+NOKPROBE_SYMBOL(patch_instruction)
+
+#endif
 
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
-- 
2.39.2

