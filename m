Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD384E979
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 21:16:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hspb/o17;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW7YS3BFXz3cXh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 07:16:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hspb/o17;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW7Xf5wymz3bsQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 07:16:02 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 418J5j3e005460;
	Thu, 8 Feb 2024 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PDQz6409YA4V9u/TJ/Nmcg5VNmdpvniWmPutcoSBfcs=;
 b=hspb/o176NBnfRJH+gFKfwpX4KrqvieC5vKy0r0Owx2vP2l3/SvtXcRIFGUmGUyReFdq
 B0VTDOxEwbiFUX5E3sa0CCNhRpsoYwd0ODI5GDmTQE3lZ4AbrDgiMEKWIt9EVC0l7ndN
 5mZA4lB2QsPu+SI2AJnWpmGLxe1JFHMc+V+Zn164eJLehyDFZ6j/Q+W5Gxf0DnmDud5n
 VuWCZCY9wUJYxoiJUN8tqP4yZWIa8zrKCAEWQMrPsXcEkGEVpcS2TArFsOFoYEjYzj/y
 /CkxXCj2E119gBLrs1eDMlsFslnonmsq/4z7DT7FXFzgXjdEuMsKNZ9A7aKCclQ7YFDM zA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w53vxb0by-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 418JvTmg003071;
	Thu, 8 Feb 2024 20:15:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w53vxb0bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:54 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 418IGJl7008519;
	Thu, 8 Feb 2024 20:15:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w221kejv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 418KFnJx20447838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Feb 2024 20:15:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B353320067;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A387A2004E;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 7A994E04F6; Thu,  8 Feb 2024 21:15:49 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v2 2/5] sched/vtime: get rid of generic vtime_task_switch() implementation
Date: Thu,  8 Feb 2024 21:15:46 +0100
Message-Id: <2baebb95af9772959a0d85d0bd789afdfd2baf94.1707422448.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1707422448.git.agordeev@linux.ibm.com>
References: <cover.1707422448.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PlIw3QKyaiuYG22CXmb6OvN3ZwwFV-aQ
X-Proofpoint-ORIG-GUID: gSkOW2J9oJlvbBFr27bzSoglDUh76aQk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_08,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=617 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402080108
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The generic vtime_task_switch() implementation gets built only
if __ARCH_HAS_VTIME_TASK_SWITCH is not defined, but requires an
architecture to implement arch_vtime_task_switch() callback at
the same time, which is confusing.

Further, arch_vtime_task_switch() is implemented for 32-bit PowerPC
architecture only and vtime_task_switch() generic variant is rather
superfluous.

Simplify the whole vtime_task_switch() wiring by moving the existing
generic implementation to PowerPC.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/powerpc/include/asm/cputime.h | 13 -------------
 arch/powerpc/kernel/time.c         | 22 ++++++++++++++++++++++
 kernel/sched/cputime.c             | 13 -------------
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 4961fb38e438..aff858ca99c0 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -32,23 +32,10 @@
 #ifdef CONFIG_PPC64
 #define get_accounting(tsk)	(&get_paca()->accounting)
 #define raw_get_accounting(tsk)	(&local_paca->accounting)
-static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
 
 #else
 #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
 #define raw_get_accounting(tsk)	get_accounting(tsk)
-/*
- * Called from the context switch with interrupts disabled, to charge all
- * accumulated times to the current process, and to prepare accounting on
- * the next process.
- */
-static inline void arch_vtime_task_switch(struct task_struct *prev)
-{
-	struct cpu_accounting_data *acct = get_accounting(current);
-	struct cpu_accounting_data *acct0 = get_accounting(prev);
-
-	acct->starttime = acct0->starttime;
-}
 #endif
 
 /*
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index df20cf201f74..c0fdc6d94fee 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -354,6 +354,28 @@ void vtime_flush(struct task_struct *tsk)
 	acct->hardirq_time = 0;
 	acct->softirq_time = 0;
 }
+
+/*
+ * Called from the context switch with interrupts disabled, to charge all
+ * accumulated times to the current process, and to prepare accounting on
+ * the next process.
+ */
+void vtime_task_switch(struct task_struct *prev)
+{
+	if (is_idle_task(prev))
+		vtime_account_idle(prev);
+	else
+		vtime_account_kernel(prev);
+
+	vtime_flush(prev);
+
+	if (!IS_ENABLED(CONFIG_PPC64)) {
+		struct cpu_accounting_data *acct = get_accounting(current);
+		struct cpu_accounting_data *acct0 = get_accounting(prev);
+
+		acct->starttime = acct0->starttime;
+	}
+}
 #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
 
 void __no_kcsan __delay(unsigned long loops)
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index af7952f12e6c..aa48b2ec879d 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -424,19 +424,6 @@ static inline void irqtime_account_process_tick(struct task_struct *p, int user_
  */
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 
-# ifndef __ARCH_HAS_VTIME_TASK_SWITCH
-void vtime_task_switch(struct task_struct *prev)
-{
-	if (is_idle_task(prev))
-		vtime_account_idle(prev);
-	else
-		vtime_account_kernel(prev);
-
-	vtime_flush(prev);
-	arch_vtime_task_switch(prev);
-}
-# endif
-
 void vtime_account_irq(struct task_struct *tsk, unsigned int offset)
 {
 	unsigned int pc = irq_count() - offset;
-- 
2.40.1

