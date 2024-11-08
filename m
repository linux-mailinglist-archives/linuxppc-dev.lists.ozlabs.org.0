Return-Path: <linuxppc-dev+bounces-3042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 939989C1A52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 11:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlFLJ1VJTz3bs2;
	Fri,  8 Nov 2024 21:19:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731061192;
	cv=none; b=afx05LceLSt9/yDT/F6u863fskiFGqLyP4vcg1K0jJzeoT4BUeaUmbWtM3Lvs3WxoGe1FpTsOtgtOJI1bpP39GFbjDcnT0ghyFqVgafhTj6SWq2+HFO4jmvclKs7t6KV2tSChshwP3VLT6AYd8FbStdPBIA3H6RIb7b0OVfMxOK7w8+z7vjeIdNHdgFvSTKYMCtlHvFOHVS/qKezJLSuBq+YcbNPVE9NanTH69i4oac5uQ6G4hciZyQxNpvZMCaaqedhoiG5LwgghZlxsKaRqwNacdJW8DR2DSAUSpi8herk6L/XqtTx3jBUATPCoapB4tHG7Ai6ZlokqrO9L1kOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731061192; c=relaxed/relaxed;
	bh=ZmZbDuVNdsB6rfHoU1gG+RQPOpr0AllDOPKLUkMQ6As=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSEvW4XDST+4Gc5/Q38MsiQr9H6WYu/HyjLMvfZTbQB0YY7XS8S2CyuAE53mV6I99UcfEkbnTQJ86yanF4wZ3wWpSR9YtaQN4ac/eXfFGj5WQFSrBeejsXh3lU1hIFu/zJNNpiFhJmnsvweeRdQYYugX5mbyh3rBoRtypNe8MeNOSfHvmlv7pfekwjYER3A2VY29oNLdTFp+As5xmJcWFLFfXMVXg7wKSAHRqIUTUrUJaQl6j4Mcfjiw2UXchriuFngViVyaaFXTQRn5OvE0UNK3dJlzuBoElgNzNq2jPK4NMsx/5X3tD7EPgY4tih3gavoufh335fjvM04oFiwOzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DoUu8d+B; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DoUu8d+B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlFLG6R0Tz300M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 21:19:49 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A8AA6hp000754;
	Fri, 8 Nov 2024 10:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ZmZbDuVNdsB6rfHoU1gG+RQPOpr0AllDOPKLUkMQ6
	As=; b=DoUu8d+BRiz15KfrTJoZeSrkzQdbJxWQLHHYP8ka+1Ah8+75/AWtCiif5
	e1Eb1+ExOHRhSL24TvQnvOTL5uav4BZigRBak+JWiXf+gvece5oTo8wCd8jP7gv9
	GHOm/igmtKbZPQvhKHWuGsFODfyXRM4CWzKRStaGHppOhe+vhdDfy4xKKbxZDxiV
	CK4wjuCCXXY5uxTDjd/8pnnmud6OGB+u3AzQYDP/KUTgHPfjJHTidedl1PaSs3QB
	JKCoahRG5BhPztB7OglErSYjMfrjWUyNg7O74FhmvasIfE8YsxjdesXlsxEOe3qa
	7WiNl+5sU6QROl7Nf4QbSkZn9CnDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sgn7r14b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 10:19:21 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A8AJL25020337;
	Fri, 8 Nov 2024 10:19:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42sgn7r149-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 10:19:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A87F8P3005873;
	Fri, 8 Nov 2024 10:19:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42p0mj9xcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 10:19:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A8AJG1E46989742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 10:19:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A724A2006E;
	Fri,  8 Nov 2024 10:19:16 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F4272006A;
	Fri,  8 Nov 2024 10:19:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.214.182])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Nov 2024 10:19:14 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, maddy@linux.ibm.com,
        christophe.leroy@csgroup.eu, peterz@infradead.org,
        bigeasy@linutronix.de, ankur.a.arora@oracle.com, sshegde@linux.ibm.com
Subject: [PATCH] powerpc: Add preempt lazy support
Date: Fri,  8 Nov 2024 15:48:53 +0530
Message-ID: <20241108101853.277808-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jw__p7IwxvXTVHuRhr1Q_mu4oDDaLeSy
X-Proofpoint-GUID: pW8ybG_FRUvz7ZIX3PhoKQDM7q88Gsvf
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=319 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411080082
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Define preempt lazy bit for Powerpc. Use bit 9 which is free and within
16 bit range of NEED_RESCHED, so compiler can issue single andi. 

Since Powerpc doesn't use the generic entry/exit, add lazy check at exit
to user. CONFIG_PREEMPTION is defined for lazy/full/rt so use it for 
return to kernel. 

Ran a few benchmarks and db workload on Power10. Performance is close to
preempt=none/voluntary. It is possible that some patterns would
differ in lazy[2]. More details of preempt lazy is here [1]

Since Powerpc system can have large core count and large memory, 
preempt lazy is going to be helpful in avoiding soft lockup issues. 

[1]: https://lore.kernel.org/lkml/20241007074609.447006177@infradead.org/
[2]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig                   | 1 +
 arch/powerpc/include/asm/thread_info.h | 9 ++++++---
 arch/powerpc/kernel/interrupt.c        | 4 ++--
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8094a01974cc..2f625aecf94b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -145,6 +145,7 @@ config PPC
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API
+	select ARCH_HAS_PREEMPT_LAZY
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 6ebca2996f18..2785c7462ebf 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -103,6 +103,7 @@ void arch_setup_new_exec(void);
 #define TIF_PATCH_PENDING	6	/* pending live patching update */
 #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
 #define TIF_SINGLESTEP		8	/* singlestepping active */
+#define TIF_NEED_RESCHED_LAZY	9       /* Scheduler driven lazy preemption */
 #define TIF_SECCOMP		10	/* secure computing */
 #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
 #define TIF_NOERROR		12	/* Force successful syscall return */
@@ -122,6 +123,7 @@ void arch_setup_new_exec(void);
 #define _TIF_SYSCALL_TRACE	(1<<TIF_SYSCALL_TRACE)
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
+#define _TIF_NEED_RESCHED_LAZY	(1<<TIF_NEED_RESCHED_LAZY)
 #define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_POLLING_NRFLAG	(1<<TIF_POLLING_NRFLAG)
 #define _TIF_32BIT		(1<<TIF_32BIT)
@@ -142,9 +144,10 @@ void arch_setup_new_exec(void);
 				 _TIF_SYSCALL_EMU)
 
 #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
-				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
-				 _TIF_RESTORE_TM | _TIF_PATCH_PENDING | \
-				 _TIF_NOTIFY_SIGNAL)
+				 _TIF_NEED_RESCHED_LAZY | _TIF_NOTIFY_RESUME | \
+				 _TIF_UPROBE | _TIF_RESTORE_TM | \
+				 _TIF_PATCH_PENDING | _TIF_NOTIFY_SIGNAL)
+
 #define _TIF_PERSYSCALL_MASK	(_TIF_RESTOREALL|_TIF_NOERROR)
 
 /* Bits in local_flags */
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index af62ec974b97..8f4acc55407b 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -185,7 +185,7 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 	ti_flags = read_thread_flags();
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
 		local_irq_enable();
-		if (ti_flags & _TIF_NEED_RESCHED) {
+		if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
 			schedule();
 		} else {
 			/*
@@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 		/* Returning to a kernel context with local irqs enabled. */
 		WARN_ON_ONCE(!(regs->msr & MSR_EE));
 again:
-		if (IS_ENABLED(CONFIG_PREEMPT)) {
+		if (IS_ENABLED(CONFIG_PREEMPTION)) {
 			/* Return to preemptible kernel context */
 			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
 				if (preempt_count() == 0)
-- 
2.43.5

