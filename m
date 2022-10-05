Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886F05F4F88
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 07:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj3LB0wJMz3dxw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:39:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XU1aEUBs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XU1aEUBs;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj3Bw6NJrz3bjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 16:33:28 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2952hPuO021411;
	Wed, 5 Oct 2022 05:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hOYE9XwTnViRRpP9Az0VajLPyAQiKrHt6MqYXWToiVE=;
 b=XU1aEUBsOc6lfI81ZL8cpiP0Otz+CsIB96SOTIqftzK0c3Hag4Zs81cGFOFl/cogOIVa
 YEsdNK3OMSadTcoCkvrTwB0g+uMpGe2po/IxLQ5hhWBCUnj2dX7OQ7ktR/l2PgFNi0Ap
 qkhGgGTYPMDoRTijB7ZcFtVKGmBu3LXzRdS9BBZ9KvD3Xi78+b8qTumMY7UdANULVsiO
 KCRAcDZjW2sdvnNKUSMCAHqp6FICqIq0TmyonDsIk/ZuxGSc/KfOq0sMqiYE9AKm6XX1
 nkqxQIOp/63DBd1OyICS9aFR6cUxun6eB2GpWt44PVGkJdBnXN2MWE8vn+YjN6n+jm6K sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0gpqfcuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:33:16 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2955QTLF002959;
	Wed, 5 Oct 2022 05:33:16 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0gpqfcp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:33:16 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2955KQlB030035;
	Wed, 5 Oct 2022 05:32:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3jxd6953xu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2955WoPG62456308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Oct 2022 05:32:51 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5EEE5204F;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 366055204E;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 34427600F0;
	Wed,  5 Oct 2022 16:32:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc/code-patching: Implement generic text patching function
Date: Wed,  5 Oct 2022 16:32:29 +1100
Message-Id: <20221005053234.29312-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005053234.29312-1-bgray@linux.ibm.com>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h0vxMzMa5jRKH_kR8JGohuju05S4fyvd
X-Proofpoint-ORIG-GUID: 0YG50yVfgCByeytcBYTLWvp6n1eZOGcG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 mlxlogscore=858 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050034
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a generic text patching mechanism for patches of size int or long
bytes.

The patch_instruction function is reimplemented in terms of this
more generic function. This generic implementation allows patching of
arbitrary long data, such as pointers on 64-bit.

On 32-bit patch_int is marked noinline to prevent a mis-optimisation.
Without noinline, inside patch_branch the compiler may inline all the
way to do_patch_memory, preventing the compiler from inlining
do_patch_memory into patch_int. This would needlessly force patch_int
to be a branch to do_patch_memory.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/code-patching.h | 29 ++++++++++
 arch/powerpc/lib/code-patching.c         | 73 ++++++++++++++++++------
 2 files changed, 85 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 3f881548fb61..170bfa848c7c 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -72,7 +72,36 @@ static inline int create_branch(ppc_inst_t *instr, const u32 *addr,
 int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 		       unsigned long target, int flags);
 int patch_branch(u32 *addr, unsigned long target, int flags);
+
+/* patch_uint and patch_ulong must only be called on addresses where the patch
+ * does not cross a cacheline, otherwise it may not be flushed properly and
+ * mixes of new and stale data may be observed.
+ *
+ * patch_instruction and other instruction patchers automatically satisfy this
+ * requirement due to instruction alignment requirements.
+ */
+
+int patch_uint(void *addr, unsigned int val);
+
+#ifdef CONFIG_PPC64
+
+int patch_ulong(void *addr, unsigned long val);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
+
+#else
+
+static inline int patch_ulong(void *addr, unsigned long val)
+{
+	return patch_uint(addr, val);
+}
+
+static inline int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	return patch_uint(addr, ppc_inst_val(instr));
+}
+
+#endif
+
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
 
 static inline unsigned long patch_site_addr(s32 *site)
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 125c55e3e148..ecdd2e523d9a 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -15,20 +15,24 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>
 
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
+static int __patch_memory(void *patch_addr, unsigned long val, void *exec_addr,
+			   bool is_dword)
 {
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
-	} else {
-		u64 val = ppc_inst_as_ulong(instr);
+	/* Prefixed instruction may cross cacheline if cacheline smaller than 64 bytes */
+	BUILD_BUG_ON(IS_ENABLED(CONFIG_PPC64) && L1_CACHE_BYTES < 64);
 
+	if (unlikely(is_dword))
 		__put_kernel_nofault(patch_addr, &val, u64, failed);
-	}
+	else
+		__put_kernel_nofault(patch_addr, &val, u32, failed);
 
-	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
-							    "r" (exec_addr));
+	/* Assume data is inside a single cacheline */
+	dcbst(patch_addr);
+	mb(); /* sync */
+	/* Flush on the EA that may be executed in case of a non-coherent icache */
+	icbi(exec_addr);
+	mb(); /* sync */
+	isync();
 
 	return 0;
 
@@ -38,7 +42,10 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	return __patch_instruction(addr, instr, addr);
+	if (ppc_inst_prefixed(instr))
+		return __patch_memory(addr, ppc_inst_as_ulong(instr), addr, true);
+	else
+		return __patch_memory(addr, ppc_inst_val(instr), addr, false);
 }
 
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
@@ -149,7 +156,7 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __do_patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	u32 *patch_addr;
@@ -166,7 +173,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	err = __patch_memory(patch_addr, val, addr, is_dword);
 
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -174,7 +181,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return err;
 }
 
-int patch_instruction(u32 *addr, ppc_inst_t instr)
+static int do_patch_memory(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
 	unsigned long flags;
@@ -186,15 +193,47 @@ int patch_instruction(u32 *addr, ppc_inst_t instr)
 	 */
 	if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) ||
 	    !static_branch_likely(&poking_init_done))
-		return raw_patch_instruction(addr, instr);
+		return __patch_memory(addr, val, addr, is_dword);
 
 	local_irq_save(flags);
-	err = __do_patch_instruction(addr, instr);
+	err = __do_patch_memory(addr, val, is_dword);
 	local_irq_restore(flags);
 
 	return err;
 }
-NOKPROBE_SYMBOL(patch_instruction);
+
+#ifdef CONFIG_PPC64
+
+int patch_uint(void *addr, unsigned int val)
+{
+	return do_patch_memory(addr, val, false);
+}
+NOKPROBE_SYMBOL(patch_uint)
+
+int patch_ulong(void *addr, unsigned long val)
+{
+	return do_patch_memory(addr, val, true);
+}
+NOKPROBE_SYMBOL(patch_ulong)
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	if (ppc_inst_prefixed(instr))
+		return patch_ulong(addr, ppc_inst_as_ulong(instr));
+	else
+		return patch_uint(addr, ppc_inst_val(instr));
+}
+NOKPROBE_SYMBOL(patch_instruction)
+
+#else
+
+noinline int patch_uint(void *addr, unsigned int val)
+{
+	return do_patch_memory(addr, val, false);
+}
+NOKPROBE_SYMBOL(patch_uint)
+
+#endif
 
 int patch_branch(u32 *addr, unsigned long target, int flags)
 {
-- 
2.37.3

