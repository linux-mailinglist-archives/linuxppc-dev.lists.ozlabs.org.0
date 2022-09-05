Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A145ACB12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 08:39:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLf4d1YHJz3bd5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 16:39:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jnGEjEU+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jnGEjEU+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLf3t5PlWz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 16:38:34 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2855IHGh025617;
	Mon, 5 Sep 2022 06:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8TEdPXo1dDxWgaWUs5K8oDacokVDE9GVrpOXZ7SyIRc=;
 b=jnGEjEU+2sIF3xQojlh1AWMxfrciQJsXkmK70lExS+KW16u+sG2x70Exn3MB/xSDldgk
 LLREmHIqzS5gzV0uaTaiYgJMVrK7Y4/M7MgK8Bql2u+JDtlzny3FbreRnksX4eSPUVc1
 CDooNkCssPDqGUKZXHArUoWkLxE2aGHU4o+GF6AobbFqY6e/tiA2VSiCCgU3qQBuVhCS
 D6sPMgTH8SS3ENZjpjFyU8SBJtkaA1R++aM5U8vbt09pDJCGJiHK8mh6F2EUztHEo90F
 kVhhUH2EFmoAv1amFR0rw1CUtdXUjJAutKObZRZGbxL49PdKKzwvgi8ZlBoXkquaFQLN gQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdaunht1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:38:28 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2856adsh026379;
	Mon, 5 Sep 2022 06:38:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3jbx6hsg0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Sep 2022 06:38:26 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2856cNrJ39780784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Sep 2022 06:38:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 669054C04A;
	Mon,  5 Sep 2022 06:38:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BD5A4C040;
	Mon,  5 Sep 2022 06:38:21 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown [9.43.116.66])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  5 Sep 2022 06:38:21 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PACTH v2] powerpc/pseries/mce: Avoid instrumentation in realmode
Date: Mon,  5 Sep 2022 12:08:11 +0530
Message-Id: <20220905063811.16454-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hhka4Luv9SgChFDM3sbelwydzv-FqKij
X-Proofpoint-ORIG-GUID: Hhka4Luv9SgChFDM3sbelwydzv-FqKij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-05_04,2022-09-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=19 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=64 impostorscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=19
 spamscore=19 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050031
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of machine check error handling is done in realmode,
As of now instrumentation is not possible for any code that
runs in realmode.
When MCE is injected on KASAN enabled kernel, crash is
observed, Hence force inline or mark no instrumentation
for functions which can run in realmode, to avoid KASAN
instrumentation.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: Force inline few more functions.
---
 arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
 arch/powerpc/include/asm/interrupt.h | 2 +-
 arch/powerpc/include/asm/rtas.h      | 4 ++--
 arch/powerpc/kernel/rtas.c           | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 26ede09c521d..3264991fe524 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 
-static inline notrace unsigned long irq_soft_mask_return(void)
+static __always_inline notrace unsigned long irq_soft_mask_return(void)
 {
 	return READ_ONCE(local_paca->irq_soft_mask);
 }
@@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
  * for the critical section and as a clobber because
  * we changed paca->irq_soft_mask
  */
-static inline notrace void irq_soft_mask_set(unsigned long mask)
+static __always_inline notrace void irq_soft_mask_set(unsigned long mask)
 {
 	/*
 	 * The irq mask must always include the STD bit if any are set.
@@ -144,7 +144,7 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 	barrier();
 }
 
-static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
+static __always_inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
 {
 	unsigned long flags = irq_soft_mask_return();
 
@@ -162,7 +162,7 @@ static inline notrace unsigned long irq_soft_mask_or_return(unsigned long mask)
 	return flags;
 }
 
-static inline unsigned long arch_local_save_flags(void)
+static __always_inline unsigned long arch_local_save_flags(void)
 {
 	return irq_soft_mask_return();
 }
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 8069dbc4b8d1..090895051712 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -92,7 +92,7 @@ static inline bool is_implicit_soft_masked(struct pt_regs *regs)
 	return search_kernel_soft_mask_table(regs->nip);
 }
 
-static inline void srr_regs_clobbered(void)
+static __always_inline void srr_regs_clobbered(void)
 {
 	local_paca->srr_valid = 0;
 	local_paca->hsrr_valid = 0;
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 00531af17ce0..52d29d664fdf 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -201,13 +201,13 @@ inline uint32_t rtas_ext_event_company_id(struct rtas_ext_event_log_v6 *ext_log)
 #define PSERIES_ELOG_SECT_ID_MCE		(('M' << 8) | 'C')
 
 static
-inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
+__always_inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
 {
 	return be16_to_cpu(sect->id);
 }
 
 static
-inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
+__always_inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
 {
 	return be16_to_cpu(sect->length);
 }
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 693133972294..f9d78245c0e8 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -48,7 +48,7 @@
 /* This is here deliberately so it's only used in this file */
 void enter_rtas(unsigned long);
 
-static inline void do_enter_rtas(unsigned long args)
+static __always_inline void do_enter_rtas(unsigned long args)
 {
 	unsigned long msr;
 
@@ -435,7 +435,7 @@ static char *__fetch_rtas_last_error(char *altbuf)
 #endif
 
 
-static void
+noinstr static void
 va_rtas_call_unlocked(struct rtas_args *args, int token, int nargs, int nret,
 		      va_list list)
 {
-- 
2.37.1

