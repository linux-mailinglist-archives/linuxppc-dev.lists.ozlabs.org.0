Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E728A8203
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:25:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWFmYNU9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJVM5zLnz3vdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWFmYNU9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSq0sbfz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:54 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HBMNKx031994;
	Wed, 17 Apr 2024 11:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5O4IY6A250N0GRTQmXKdcHsvN5briL+cB9ZG4/7rL/k=;
 b=QWFmYNU9P5V2D/IbFg1As7X84GvyZY0zbmX437VbUH13BHDwlnG/GXDqmOnrEs3jYg2X
 fnN+CK1FtcBat/+RRmiLdHeqGDkkgMMWh/DGjFxcAwUYtp5l/9BRaMqd7BgzawMvH4eS
 2MWFcnu1HVlfEXwuNZ8PgIdtENZdkH13316d9bJIn7pcnWO4j6+3eZkyEfLUF8NINS1+
 bSqhKobO0fXRTxnlWwsISXnbDqyH5kh4tYj0v4YYABQh7HZhbiOWTx0wEuQe2r16JYx1
 wQHVMYbyLejN/RDOxhmtFq2g9ftKMh21fb3pqwAXCaK2B3umlIJLo/UxQ2FQiweQyj2Y KQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjdg1g029-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:49 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H9KEjX015874;
	Wed, 17 Apr 2024 11:23:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vmbtp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNiwe50594120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 094F620049;
	Wed, 17 Apr 2024 11:23:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A1332004B;
	Wed, 17 Apr 2024 11:23:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DF93761013;
	Wed, 17 Apr 2024 21:23:40 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/9] powerpc/dexcr: Track the DEXCR per-process
Date: Wed, 17 Apr 2024 21:23:18 +1000
Message-ID: <20240417112325.728010-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lr0Fa4mlkd5maRxFJORRwlCUTD7vwPv6
X-Proofpoint-ORIG-GUID: lr0Fa4mlkd5maRxFJORRwlCUTD7vwPv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 impostorscore=0 mlxlogscore=881 malwarescore=0 priorityscore=1501
 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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

Add capability to make the DEXCR act as a per-process SPR.

We do not yet have an interface for changing the values per task. We
also expect the kernel to use a single DEXCR value across all tasks
while in privileged state, so there is no need to synchronize after
changing it (the userspace aspects will synchronize upon returning to
userspace).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h     |  1 +
 arch/powerpc/kernel/process.c            | 10 ++++++++++
 arch/powerpc/kernel/ptrace/ptrace-view.c |  7 +------
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index b2c51d337e60..882e31296ea6 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -260,6 +260,7 @@ struct thread_struct {
 	unsigned long   sier2;
 	unsigned long   sier3;
 	unsigned long	hashkeyr;
+	unsigned long	dexcr;
 
 #endif
 };
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 9452a54d356c..d482c3fd81d7 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1185,6 +1185,9 @@ static inline void save_sprs(struct thread_struct *t)
 
 	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
 		t->hashkeyr = mfspr(SPRN_HASHKEYR);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		t->dexcr = mfspr(SPRN_DEXCR);
 #endif
 }
 
@@ -1267,6 +1270,10 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) &&
 	    old_thread->hashkeyr != new_thread->hashkeyr)
 		mtspr(SPRN_HASHKEYR, new_thread->hashkeyr);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31) &&
+	    old_thread->dexcr != new_thread->dexcr)
+		mtspr(SPRN_DEXCR, new_thread->dexcr);
 #endif
 
 }
@@ -1878,6 +1885,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
 		p->thread.hashkeyr = current->thread.hashkeyr;
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		p->thread.dexcr = mfspr(SPRN_DEXCR);
 #endif
 	return 0;
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 584cf5c3df50..c1819e0a6684 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -469,12 +469,7 @@ static int dexcr_get(struct task_struct *target, const struct user_regset *regse
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		return -ENODEV;
 
-	/*
-	 * The DEXCR is currently static across all CPUs, so we don't
-	 * store the target's value anywhere, but the static value
-	 * will also be correct.
-	 */
-	membuf_store(&to, (u64)lower_32_bits(DEXCR_INIT));
+	membuf_store(&to, (u64)lower_32_bits(target->thread.dexcr));
 
 	/*
 	 * Technically the HDEXCR is per-cpu, but a hypervisor can't reasonably
-- 
2.44.0

