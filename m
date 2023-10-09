Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0C67BD2F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:58:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6lrepky;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pHc23p1z3vlR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6lrepky;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBw5tmxz3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:32 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995nogn019364;
	Mon, 9 Oct 2023 05:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7VOaUHAY/C5QeAKBTeRh3//LDUIp2gtwAWv0sx6sTRY=;
 b=S6lrepkypE8Hw+D1xNHYOEpdPQne/7vnH8YM+6AkNFImYjBH4r9OOIvDKmyxp3ryDQtx
 ifFBkLI2X4gU2LQpyQIxBl6lWZp35l/NuKV9jdoEuMiJkY3vlbPv4USibkE/DST7wB1H
 QaX7DVOGjM2GGyrWrHYqqehEJ+8xkuHMRFcdM1G8kM/jVY1Kr1maPqD5BycfT4Fx1M5/
 TvtB3wzOc665LQyjo71423QGG1BG8RGrMpFyoCAAWqahClwRAIiXQih27M55G+llqqXO
 +1tZWBf3LW4IZQfkPdnsgRiAXdrIv6xyxhYwCrOdiIHfXuAHzXX0qbxmynavZGI+Xa9n bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbq982hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995r6cE031006;
	Mon, 9 Oct 2023 05:54:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmbq982h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:26 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39950JpY024498;
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkhns78q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sNRJ36700664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7727C20043;
	Mon,  9 Oct 2023 05:54:23 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 949E920040;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:22 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id AB61A60531;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/6] powerpc/dexcr: Add thread specific DEXCR configuration
Date: Mon,  9 Oct 2023 16:54:02 +1100
Message-ID: <20231009055406.142940-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VOhBoizrpCCLUULDqQbFVfWiU0ufXVTT
X-Proofpoint-GUID: q1LUQcsdUk8PFmGp97vyFh58EywwPv3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=958 mlxscore=0 bulkscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090051
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add capability to track a DEXCR value per thread.

Nothing actually changes these values yet, but they are correctly
tracked, propagated, and used to set the hardware register.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/processor.h | 12 ++++++++++++
 arch/powerpc/kernel/process.c        | 24 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index b2c51d337e60..28a72023f9bd 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -260,6 +260,9 @@ struct thread_struct {
 	unsigned long   sier2;
 	unsigned long   sier3;
 	unsigned long	hashkeyr;
+	unsigned int	dexcr;		/* Temporary value saved during thread switch */
+	unsigned int	dexcr_enabled;	/* Bitmask of aspects enabled by this thread */
+	unsigned int	dexcr_inherit;	/* Bitmask of aspects to inherit across exec */
 
 #endif
 };
@@ -448,6 +451,15 @@ int exit_vmx_usercopy(void);
 int enter_vmx_ops(void);
 void *exit_vmx_ops(void *dest);
 
+static inline unsigned long get_thread_dexcr(struct thread_struct const *thread)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	return thread->dexcr_enabled;
+#else
+	return 0;
+#endif
+}
+
 #endif /* __KERNEL__ */
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_PROCESSOR_H */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index b68898ac07e1..c05d58b7c6b3 100644
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
+	    old_thread->dexcr != get_thread_dexcr(new_thread))
+		mtspr(SPRN_DEXCR, get_thread_dexcr(new_thread));
 #endif
 
 }
@@ -1634,6 +1641,11 @@ void arch_setup_new_exec(void)
 	current->thread.regs->amr  = default_amr;
 	current->thread.regs->iamr  = default_iamr;
 #endif
+
+#ifdef CONFIG_PPC_BOOK3S_64
+	current->thread.dexcr_enabled &= current->thread.dexcr_inherit;
+	current->thread.dexcr_enabled |= ~current->thread.dexcr_inherit & DEXCR_INIT; 
+#endif
 }
 
 #ifdef CONFIG_PPC64
@@ -1878,6 +1890,11 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
 		p->thread.hashkeyr = current->thread.hashkeyr;
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		p->thread.dexcr_enabled = current->thread.dexcr_enabled;
+		p->thread.dexcr_inherit = current->thread.dexcr_inherit;
+	}
 #endif
 	return 0;
 }
@@ -2000,6 +2017,13 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 		current->thread.hashkeyr = get_random_long();
 		mtspr(SPRN_HASHKEYR, current->thread.hashkeyr);
 	}
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		current->thread.dexcr = 0;
+		current->thread.dexcr_enabled = DEXCR_INIT;
+		current->thread.dexcr_inherit = 0;
+		mtspr(SPRN_DEXCR, get_thread_dexcr(&current->thread));
+	}
 #endif /* CONFIG_PPC_BOOK3S_64 */
 }
 EXPORT_SYMBOL(start_thread);
-- 
2.41.0

