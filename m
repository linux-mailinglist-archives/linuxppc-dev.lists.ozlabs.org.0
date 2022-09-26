Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F31625E9960
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:19:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbXf16RWqz3bcw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:19:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iLGmQ12c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iLGmQ12c;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbXdM6dV8z2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:18:47 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZPQB004541;
	Mon, 26 Sep 2022 06:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QR+jjVFO9nnUMKPiu8squEvRboNrrDUcc/GsSvJJ2bw=;
 b=iLGmQ12coFBejmslpplKrfqIK7slsFx0TGKy4S92bS0sslRASyEK5staf8dQNKDYVb75
 z1aA6FQx09/OKb++fzB0b55DSqRMt/W80uCLo9kIIONUpyacahR2oPP0n3DlSGkMsujD
 ooblmE0c0OCKnucsWZLGmm6iyqXhX/zIcUX2yqvF0Du4h/vSsBsf5N30tnAH6BAcTEtU
 lMX1VcxoTdEmFgUvoZG2ZhBDw7yhgU4eXJurGs5F4j71Keoordvr8+jk3ubqeeTB0tIW
 VQI+Qrd/3RMvKCRfLMYPQ8rAbRg/nVFvJQHd9wjzV+Z6+pkkOVVMnAq7u8NhotkTCKu3 cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbjj3ya2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:18:37 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q5uCKf003605;
	Mon, 26 Sep 2022 06:18:37 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbjj3y9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:18:37 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q65QKe032191;
	Mon, 26 Sep 2022 06:18:35 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3jss5j1yj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:18:35 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6IWje31195602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:18:32 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 615205204F;
	Mon, 26 Sep 2022 06:18:32 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name (unknown [9.43.94.236])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1F3A752050;
	Mon, 26 Sep 2022 06:18:29 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3] powerpc/pseries/mce: Avoid instrumentation in realmode
Date: Mon, 26 Sep 2022 11:48:27 +0530
Message-Id: <20220926061827.95102-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yrqJ79VxqniI8DxuG-ULhOmP8DwYLwn0
X-Proofpoint-ORIG-GUID: 3MXcBKACwpnbOJny4F60EmpAnTrBTfJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 malwarescore=0 mlxscore=1
 spamscore=1 impostorscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=226 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260036
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, npiggin@gmail.com, mahesh@linux.ibm.com, sachinp@linux.ibm.com
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

v3: Adding noinstr to few functions instead of __always_inline.
---
 arch/powerpc/include/asm/hw_irq.h    | 8 ++++----
 arch/powerpc/include/asm/interrupt.h | 2 +-
 arch/powerpc/include/asm/rtas.h      | 4 ++--
 arch/powerpc/kernel/rtas.c           | 4 ++--
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 983551859891..c4d542b4a623 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -111,7 +111,7 @@ static inline void __hard_RI_enable(void)
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 
-static inline notrace unsigned long irq_soft_mask_return(void)
+noinstr static unsigned long irq_soft_mask_return(void)
 {
 	unsigned long flags;
 
@@ -128,7 +128,7 @@ static inline notrace unsigned long irq_soft_mask_return(void)
  * for the critical section and as a clobber because
  * we changed paca->irq_soft_mask
  */
-static inline notrace void irq_soft_mask_set(unsigned long mask)
+noinstr static void irq_soft_mask_set(unsigned long mask)
 {
 	/*
 	 * The irq mask must always include the STD bit if any are set.
@@ -155,7 +155,7 @@ static inline notrace void irq_soft_mask_set(unsigned long mask)
 		: "memory");
 }
 
-static inline notrace unsigned long irq_soft_mask_set_return(unsigned long mask)
+noinstr static unsigned long irq_soft_mask_set_return(unsigned long mask)
 {
 	unsigned long flags;
 
@@ -191,7 +191,7 @@ static inline notrace unsigned long irq_soft_mask_or_return(unsigned long mask)
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

