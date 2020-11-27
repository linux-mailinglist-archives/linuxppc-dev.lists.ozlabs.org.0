Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DE12C5F66
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 06:02:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj2Yn0x8TzDrcd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:02:37 +1100 (AEDT)
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
 header.s=pp1 header.b=qZal/H78; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj29c5s4VzDrTN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 15:45:08 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AR4WN0v077747; Thu, 26 Nov 2020 23:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=i0Ei/YzCHhdnYv1XW6P8Vcek9a73dd9xmL4Fc8ZOClY=;
 b=qZal/H78d2Rf+5XRGUPiq6sv226TzzCR3RQCsig0bbxHPEF6yLoQ42et0rOlg+wGQBqk
 WpIHkGIJdmNQ3IBTp1IbijdVUjSaBoxTicF28YBVoGBnr/FzTNRPrHPhAEviOujX1r4V
 gUrDCbbfU/zMa1SXMI6HXe0Scoa7WxXbyEy7gTKLxQES0q8U/UwaBoVCT4yiPIU3W+Hb
 4v/NEH38CEOOd/GOC15QvesM2t62zX2CU3SGF3+KZsjA8TT/LAJ2WxrKDNZj8Tk1cAS9
 nnufhghQ1zAZdBt0XcJhStwzO8UEnx5Av28BdKU4hd6e/M2664nGqZhTtAvmVVVk1q4W dw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 352sg21gtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Nov 2020 23:44:58 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AR4fiSs031161;
 Fri, 27 Nov 2020 04:44:57 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01dal.us.ibm.com with ESMTP id 34xth9y6qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2020 04:44:57 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AR4iokN26018048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 04:44:50 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F5BF6E04E;
 Fri, 27 Nov 2020 04:44:56 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EDD56E053;
 Fri, 27 Nov 2020 04:44:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.45.115])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 27 Nov 2020 04:44:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 09/22] powerpc/exec: Set thread.regs early during exec
Date: Fri, 27 Nov 2020 10:14:11 +0530
Message-Id: <20201127044424.40686-10-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
References: <20201127044424.40686-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-27_01:2020-11-26,
 2020-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011270021
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
 arch/powerpc/kernel/process.c          | 27 +++++++++++++-------------
 2 files changed, 13 insertions(+), 16 deletions(-)

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
index d421a2c7f822..649ea224658e 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1527,14 +1527,22 @@ void flush_thread(void)
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 }
 
-#ifdef CONFIG_PPC_BOOK3S_64
 void arch_setup_new_exec(void)
 {
-	if (radix_enabled())
-		return;
-	hash__setup_new_exec();
-}
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (!radix_enabled())
+		hash__setup_new_exec();
 #endif
+	/*
+	 * If we exec out of a kernel thread then thread.regs will not be
+	 * set.  Do it now.
+	 */
+	if (!current->thread.regs) {
+		struct pt_regs *regs = task_stack_page(current) + THREAD_SIZE;
+		current->thread.regs = regs - 1;
+	}
+}
 
 #ifdef CONFIG_PPC64
 /**
@@ -1765,15 +1773,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
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

