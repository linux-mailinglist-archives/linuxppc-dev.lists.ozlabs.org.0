Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA34F253CB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 06:29:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcV9p1b65zDqBW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 14:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UGYbU75D; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcTm35v7zzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 14:10:27 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R42eJv037009; Thu, 27 Aug 2020 00:10:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K8NErmSNZEj/1I8ruTqmNSS8bj0LRSWwNycMbO6eS7k=;
 b=UGYbU75Da6S/fJKi0ouRVR8trjFK/VLyM98wONRfPOeKlEYkmbULkFovLslConJr4fuZ
 V62kq3wzlMn8ZReYYgoIKB6t9Czek7AfwaodTh3xEQQJSq16PkY253W+7KaHEw0PEwgM
 VnsS9ZQPPjnM+tLhzD1qAWRK7z1rkOmbSRAFRHpHdxIJskHZXz8lyfd2U1AHFlHwyQyA
 Bq+oC7glQJO9xtpZTV/G0chbIFM5dmqJRqDdSCWovyZK+VfbJuVrpN/ZufmBXAs1LPxb
 y+KAhld1gLQkxn1Nipyp4loefcLbgBIBYBCilworiHCIdMr73v+/6A5WeurXNp+Q2day nw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33643mj9xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 00:10:21 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R47gmO002044;
 Thu, 27 Aug 2020 04:10:21 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 332ujrgrgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:10:21 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R4AKNX57868640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 04:10:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6985C28059;
 Thu, 27 Aug 2020 04:10:20 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32A2528058;
 Thu, 27 Aug 2020 04:10:19 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.74.195])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 04:10:18 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 10/23] powerpc/exec: Set thread.regs early during exec
Date: Thu, 27 Aug 2020 09:39:18 +0530
Message-Id: <20200827040931.297759-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
References: <20200827040931.297759-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_14:2020-08-26,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008270028
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In later patches during exec, we would like to access default regs.kuap to
control access to the user mapping. Having thread.regs set early makes the
code changes simpler.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/thread_info.h |  2 --
 arch/powerpc/kernel/process.c          | 37 +++++++++++++++++---------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index ca6c97025704..9418dff1cfe1 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -77,10 +77,8 @@ struct thread_info {
 /* how to get the thread information struct from C */
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
-#ifdef CONFIG_PPC_BOOK3S_64
 void arch_setup_new_exec(void);
 #define arch_setup_new_exec arch_setup_new_exec
-#endif
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 016bd831908e..4633924ea77f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1494,10 +1494,32 @@ void flush_thread(void)
 #ifdef CONFIG_PPC_BOOK3S_64
 void arch_setup_new_exec(void)
 {
-	if (radix_enabled())
-		return;
-	hash__setup_new_exec();
+	if (!radix_enabled())
+		hash__setup_new_exec();
+
+	/*
+	 * If we exec out of a kernel thread then thread.regs will not be
+	 * set.  Do it now.
+	 */
+	if (!current->thread.regs) {
+		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
+		current->thread.regs = regs - 1;
+	}
+
 }
+#else
+void arch_setup_new_exec(void)
+{
+	/*
+	 * If we exec out of a kernel thread then thread.regs will not be
+	 * set.  Do it now.
+	 */
+	if (!current->thread.regs) {
+		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
+		current->thread.regs = regs - 1;
+	}
+}
+
 #endif
 
 #ifdef CONFIG_PPC64
@@ -1731,15 +1753,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 #endif
 #endif
 
-	/*
-	 * If we exec out of a kernel thread then thread.regs will not be
-	 * set.  Do it now.
-	 */
-	if (!current->thread.regs) {
-		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
-		current->thread.regs = regs - 1;
-	}
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/*
 	 * Clear any transactional state, we're exec()ing. The cause is
-- 
2.26.2

