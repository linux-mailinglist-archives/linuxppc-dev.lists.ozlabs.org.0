Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EF35BA6C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:25:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPG06P7Xz3bZP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:25:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qX0cTvdD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qX0cTvdD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPDg5K8Tz2xrH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:24:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5fuUu004728;
	Fri, 16 Sep 2022 06:24:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cVIvcIO4FNiAS7+bhAOH9qB0SLMv2jv7w0+Z9XT28Xk=;
 b=qX0cTvdDs8ltUHb5XS9mV/VqSjXZvx71UQRhMxNt8D5LSvraiR+9FC0ZQPd8bw4Bxc/L
 sjQl31X65PcOGrS1ZtHMVF3xUW/5IZ6vDRi4FTkGWTaUCZ64DNWs+fiaHUsHxiaQonhL
 yM9IY5tS5fSKKcI1gxmc9qvb3OBcYQBPKV7A+OKAhJ94EXVos+jSA8F7SgX3GQi1lWHb
 AjnUvRzhjhwqMLu8FPzaf9553vu2WUF0UySL9leEb6w7AhkUjwoJiD3Qqt0tgGokx6T7
 cOTC+IYkChqKmKacg5gjuwJmdbkxDpn55o85kseO29GNL4QncVyTuNvILnudTil17zlz BQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk7j14tg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:19 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5gPR4005743;
	Fri, 16 Sep 2022 06:24:18 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk7j14su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:18 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G6LFCM030575;
	Fri, 16 Sep 2022 06:24:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crdwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:16 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G6ODj538797748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 06:24:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAB1111C050;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ACFE11C04A;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B93A8603C2;
	Fri, 16 Sep 2022 16:24:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/code-patching: Implement generic text patching function
Date: Fri, 16 Sep 2022 16:23:25 +1000
Message-Id: <20220916062330.430468-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916062330.430468-1-bgray@linux.ibm.com>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2UaEYHegxjgP1ZKN0lDp-UdhEEJbzLRD
X-Proofpoint-ORIG-GUID: 8cypm5SNvo-teIfQQcDkvJCkbBx2KhcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=920 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209160045
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a generic text patching mechanism for patches of 1, 2, 4, or 8
bytes. The patcher conditionally syncs the icache depending on if
the content will be executed (as opposed to, e.g., read-only data).

The `patch_instruction` function is reimplemented in terms of this
more generic function. This generic implementation allows patching of
arbitrary 64-bit data, whereas the original `patch_instruction` decided
the size based on the 'instruction' opcode, so was not suitable for
arbitrary data.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/code-patching.h |   1 +
 arch/powerpc/lib/code-patching.c         | 135 +++++++++++++++--------
 2 files changed, 89 insertions(+), 47 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 1c6316ec4b74..6a52c19dae46 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -76,6 +76,7 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
+int patch_text_data(void *dest, const void *src, size_t size);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index ad0cf3108dd0..a09a0898c2ce 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -3,6 +3,7 @@
  *  Copyright 2008 Michael Ellerman, IBM Corporation.
  */
 
+#include <linux/mm.h>
 #include <linux/kprobes.h>
 #include <linux/vmalloc.h>
 #include <linux/init.h>
@@ -14,32 +15,7 @@
 #include <asm/page.h>
 #include <asm/code-patching.h>
 #include <asm/inst.h>
-
-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
-{
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u32, failed);
-	} else {
-		u64 val = ppc_inst_as_ulong(instr);
-
-		__put_kernel_nofault(patch_addr, &val, u64, failed);
-	}
-
-	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
-							    "r" (exec_addr));
-
-	return 0;
-
-failed:
-	return -EPERM;
-}
-
-int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
-{
-	return __patch_instruction(addr, instr, addr);
-}
+#include <asm/cacheflush.h>
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 static DEFINE_PER_CPU(struct vm_struct *, text_poke_area);
@@ -147,16 +123,44 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __patch_text(void *dest, const void *src, size_t size, bool is_exec, void *exec_addr)
+{
+	if (virt_to_pfn(dest) != virt_to_pfn(dest + size - 1))
+		return -EFAULT;
+
+	switch (size) {
+		case 1:
+			__put_kernel_nofault(dest, src, u8, failed);
+			break;
+		case 2:
+			__put_kernel_nofault(dest, src, u16, failed);
+			break;
+		case 4:
+			__put_kernel_nofault(dest, src, u32, failed);
+			break;
+		case 8:
+			__put_kernel_nofault(dest, src, u64, failed);
+			break;
+	}
+
+	asm ("dcbst 0, %0; sync" :: "r" (dest));
+
+	if (is_exec)
+		asm ("icbi 0,%0; sync; isync" :: "r" (exec_addr));
+
+	return 0;
+
+failed:
+	return -EPERM;
+}
+
+static pte_t *start_text_patch(void* dest, u32 **patch_addr)
 {
-	int err;
-	u32 *patch_addr;
-	unsigned long text_poke_addr;
 	pte_t *pte;
-	unsigned long pfn = get_patch_pfn(addr);
+	unsigned long text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
+	unsigned long pfn = get_patch_pfn(dest);
 
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+	*patch_addr = (u32 *)(text_poke_addr + offset_in_page(dest));
 
 	pte = virt_to_kpte(text_poke_addr);
 	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
@@ -164,33 +168,63 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");
 
-	err = __patch_instruction(addr, instr, patch_addr);
+	return pte;
+}
 
+static void finish_text_patch(pte_t *pte)
+{
+	unsigned long text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+}
+
+static int do_patch_text(void *dest, const void *src, size_t size, bool is_exec)
+{
+	int err;
+	pte_t *pte;
+	u32 *patch_addr;
+
+	pte = start_text_patch(dest, &patch_addr);
+	err = __patch_text(patch_addr, src, size, is_exec, dest);
+	finish_text_patch(pte);
 
 	return err;
 }
 
-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int patch_text(void *dest, const void *src, size_t size, bool is_exec)
 {
 	int err;
 	unsigned long flags;
 
-	/*
-	 * During early early boot patch_instruction is called
-	 * when text_poke_area is not ready, but we still need
-	 * to allow patching. We just do the plain old patching
-	 */
+	/* Make sure we aren't patching a freed init section */
+	if (static_branch_likely(&init_mem_is_free) && init_section_contains(dest, 4))
+		return 0;
+
 	if (!static_branch_likely(&poking_init_done))
-		return raw_patch_instruction(addr, instr);
+		return __patch_text(dest, src, size, is_exec, dest);
 
 	local_irq_save(flags);
-	err = __do_patch_instruction(addr, instr);
+	err = do_patch_text(dest, src, size, is_exec);
 	local_irq_restore(flags);
 
 	return err;
 }
+
+int patch_text_data(void *dest, const void *src, size_t size) {
+	return patch_text(dest, src, size, false);
+}
+
+int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	if (!ppc_inst_prefixed(instr)) {
+		u32 val = ppc_inst_val(instr);
+		return __patch_text(addr, &val, sizeof(val), true, addr);
+	} else {
+		u64 val = ppc_inst_as_ulong(instr);
+		return __patch_text(addr, &val, sizeof(val), true, addr);
+	}
+}
+
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
 static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
@@ -198,17 +232,24 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return raw_patch_instruction(addr, instr);
 }
 
+void *patch_memory(void *dest, const void *src, size_t size)
+{
+	return memcpy(dest, src, size);
+}
+
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 __ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);
 
 int patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	/* Make sure we aren't patching a freed init section */
-	if (static_branch_likely(&init_mem_is_free) && init_section_contains(addr, 4))
-		return 0;
-
-	return do_patch_instruction(addr, instr);
+	if (!ppc_inst_prefixed(instr)) {
+		u32 val = ppc_inst_val(instr);
+		return patch_text(addr, &val, sizeof(val), true);
+	} else {
+		u64 val = ppc_inst_as_ulong(instr);
+		return patch_text(addr, &val, sizeof(val), true);
+	}
 }
 NOKPROBE_SYMBOL(patch_instruction);
 
-- 
2.37.3

