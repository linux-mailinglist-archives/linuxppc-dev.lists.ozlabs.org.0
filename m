Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1C2C38B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:35:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgqN64FhczDqc8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:35:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PXARTjS/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgpzg0xDNzDqXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:17:18 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AP52fwO079609; Wed, 25 Nov 2020 00:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cEnnnS+hOvtH3XlHqv7KuUKjGCG8fkVTumRf1/AJZmE=;
 b=PXARTjS//SWcrkumC8q8WmFODvExnYreB7Qop9gs4hfklkveCVP3jG0aENhPC2njVid8
 v1FO4yckfOXY3YxhHsyKkN7nwaGguUv029ljQ/8lsZjOecvlkCplD+XGZKzYNL49WH5D
 yK34Yyo8q3RAGhUFSBv7FOzu6G0QkNDCMF+gQ7rEB9/tGtc4dzIqXcifdcOu8cOl3bup
 gNcHkooJhXjp/iMwcjLEHchsR0NFXbjRsfSBZi20BH08QSVZwFhBv4xLcazWEsj2b7DS
 wq4mmDfEnbT5OU3BH6QZUiWM6D+AEs6tDMArLyvmvzzvsgpcc04+Fyr5YKHJ9AIk+M7S Ow== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 350meracf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 00:17:15 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AP5DYsu012461;
 Wed, 25 Nov 2020 05:17:13 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 34xth94ukw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Nov 2020 05:17:13 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AP5HDSq28901878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Nov 2020 05:17:13 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70ED8124055;
 Wed, 25 Nov 2020 05:17:13 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECD32124054;
 Wed, 25 Nov 2020 05:17:11 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.195.3])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 25 Nov 2020 05:17:11 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v6 09/22] powerpc/exec: Set thread.regs early during exec
Date: Wed, 25 Nov 2020 10:46:21 +0530
Message-Id: <20201125051634.509286-10-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_07:2020-11-24,
 2020-11-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240121
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

In later patches during exec, we would like to access default regs.amr to
control access to the user mapping. Having thread.regs set early makes the
code changes simpler.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/thread_info.h |  2 --
 arch/powerpc/kernel/process.c          | 37 +++++++++++++++++---------
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 46a210b03d2b..de4c911d9ced 100644
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
index d421a2c7f822..b6b8a845e454 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1530,10 +1530,32 @@ void flush_thread(void)
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
+}
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
 }
+
 #endif
 
 #ifdef CONFIG_PPC64
@@ -1765,15 +1787,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 		preload_new_slb_context(start, sp);
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
2.28.0

