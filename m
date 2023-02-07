Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4D68CC62
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 03:00:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9mY80TZSz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 13:00:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RYRdP8aX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RYRdP8aX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9mW91rh4z3c81
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 12:58:28 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316NLZHY027136;
	Tue, 7 Feb 2023 01:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9lexai+aoL1hPV7x+d+hk6xkqxCU2noO3J6iCSEOaj8=;
 b=RYRdP8aXAXm0AnranG7O1UFO3Xynq5ASUeACllVzMpep+KpBGyGdMPG8vvIHq2KeCOhW
 48BJdvt2xO//kCvN05ZTv6iFi5VkZAVW+NgoaTFSX4pTyI3qz14hAQFDWqZq2SofNi8o
 09h8ROXp8XIdGrilDrTEId+32v5NNaOyN0XofH4sm/GF53rcmyUnRaPkf56hU4/wAuHp
 RWlz9Nmt9aeKX03GM5F2NVy/0pYrgZN+iu8tvyA0/WU4JM+ltLAu4+hrP7eWU2K2rB/B
 W3nlJVqdki401bJPUd50VAyHD3zeiE+aUPbPg6RksgwPDiEZ1ze6PFuPzzicjBL4J0v0 NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkb5fayh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:24 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3171XQq7034174;
	Tue, 7 Feb 2023 01:58:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkb5faygd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 316HS62I021016;
	Tue, 7 Feb 2023 01:58:21 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfk0n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:21 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3171wJma25428602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 01:58:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 509922004B;
	Tue,  7 Feb 2023 01:58:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A91A20043;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 800DF60060;
	Tue,  7 Feb 2023 12:58:16 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/code-patching: Add generic memory patching
Date: Tue,  7 Feb 2023 12:56:41 +1100
Message-Id: <20230207015643.590684-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207015643.590684-1-bgray@linux.ibm.com>
References: <20230207015643.590684-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B2B8RC2yHCIVsjBKKuSin0n3BDnNbuW-
X-Proofpoint-ORIG-GUID: _sckbDpgCOkpWqGsR_4yPzU1ZcN8_M81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070012
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
Cc: erhard_f@mailbox.org, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
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

GCC 12.2.1 compiled kernels show the following structure:

- ppc64le_defconfig (ppc64, strict RWX): patch_{uint,ulong,instruction}()
  are small wrappers that tail call into patch_memory()

- ppc_defconfig (ppc32, strict RWX): patch_uint() is the only full RWX
  aware implementation. All use of patch size is eliminated.

  Note: patch_instruction() is marked noinline to prevent making
  patch_instruction() a wrapper of patch_memory(); GCC likes to tail
  call patch_branch() -> patch_memory(), skipping patch_instruction()
  and preventing patch_memory() from inlining inside patch_instruction().

- pmac32_defconfig (ppc32, no strict RWX): patch_uint() and
  raw_patch_instruction() are both implemented but have the same
  ~40 byte function body (as is the case already mind).
---
 arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
 arch/powerpc/lib/code-patching.c         | 69 +++++++++++++++++-------
 2 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..89fc4c3f6ecf 100644
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
+#define patch_u32 patch_uint
+
+int patch_ulong(void *addr, unsigned long val);
+#define patch_u64 patch_ulong
+
+#else
+
+static inline int patch_uint(u32 *addr, unsigned int val)
+{
+	return patch_instruction(addr, ppc_inst(val));
+}
+#define patch_u32 patch_uint
+
+static inline int patch_ulong(void *addr, unsigned long val)
+{
+	return patch_instruction(addr, ppc_inst(val));
+}
+
+#endif
+
 static inline unsigned long patch_site_addr(s32 *site)
 {
 	return (unsigned long)site + *site;
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index b00112d7ad46..0f7e9949faf0 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -20,16 +20,14 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
+static int __patch_memory(void *exec_addr, unsigned long val, void *patch_addr,
+			  bool is_dword)
 {
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
-	} else {
-		u64 val = ppc_inst_as_ulong(instr);
-
+	if (IS_ENABLED(CONFIG_PPC64) && unlikely(is_dword)) {
 		__put_kernel_nofault(patch_addr, &val, u64, failed);
+	} else {
+		unsigned int val32 = val;
+		__put_kernel_nofault(patch_addr, &val32, u32, failed);
 	}
 
 	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
@@ -43,7 +41,10 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	return __patch_instruction(addr, instr, addr);
+	if (ppc_inst_prefixed(instr))
+		return __patch_memory(addr, ppc_inst_as_ulong(instr), addr, true);
+	else
+		return __patch_memory(addr, ppc_inst_val(instr), addr, false);
 }
 
 struct patch_context {
@@ -278,7 +279,7 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
+static int __do_patch_memory_mm(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -307,7 +308,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 
 	orig_mm = start_using_temp_mm(patching_mm);
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_memory(addr, val, patch_addr, is_dword);
 
 	/* hwsync performed by __patch_instruction (sync) if successful */
 	if (err)
@@ -328,7 +329,7 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __do_patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -345,7 +346,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_memory(addr, val, patch_addr, is_dword);
 
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -353,7 +354,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-int patch_instruction(u32 *addr, ppc_inst_t instr)
+static int patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	unsigned long flags;
@@ -365,18 +366,50 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
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
+noinline int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	return patch_memory(addr, ppc_inst_val(instr), false);
+}
+NOKPROBE_SYMBOL(patch_instruction)
+
+#endif
 
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
-- 
2.39.1

