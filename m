Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEE6732608
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:54:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QC2xY5jy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4zj3kd5z3cFX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QC2xY5jy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sv0SWrz3bmN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:38 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3f2qf002803;
	Fri, 16 Jun 2023 03:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9whf1AyiOPDugy08BCD7Bg8GF7d0RiSyUo5+zKaXJU4=;
 b=QC2xY5jymVlKBT1yiFaCdYU94qwPgWWKRi1iBUW/6lR0A1wooUmnAG5ACreidEYAYcJ/
 VXIM/WME/sUU/5mREbZ97qodEvqQbdZNLuYvRU0ZHgWqDlhvtOrA4eGaHg4Dr79p+qWH
 0hTEtIWZt6RyJIQLM9neWG0v/QcujPYvWjQ55pbZ4csBTNibUyTiBWj50/Z0XwEQoCBR
 1QekAwcjayDjFKlgVQPPnBNmDlunpm8btaDU1hrVzk06XLpHh6njioaxebP/0WuhHn9m
 DlgfEHhHoUq9O4V+MJ18Tp4WUlqbBzVP/hGlETaCRvk957SA/9FIbCloCo80NF/Qj21G +A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fpngfn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:34 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3axsL023811;
	Fri, 16 Jun 2023 03:49:34 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fpngfmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:34 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35FNKlE4025958;
	Fri, 16 Jun 2023 03:49:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee44f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:31 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nTfS15401486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F9D120043;
	Fri, 16 Jun 2023 03:49:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C6ED20040;
	Fri, 16 Jun 2023 03:49:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:29 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 20D70600A8;
	Fri, 16 Jun 2023 13:49:24 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/11] powerpc/dexcr: Support userspace ROP protection
Date: Fri, 16 Jun 2023 13:48:40 +1000
Message-Id: <20230616034846.311705-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qWNTJnR2nx4BL7Zu1RUCOHUHSE8qJxxG
X-Proofpoint-ORIG-GUID: 4b3MOCbRI7ySw-EcNuH9nfSOUxiG0E56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 mlxlogscore=928 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ISA 3.1B hashst and hashchk instructions use a per-cpu SPR HASHKEYR
to hold a key used in the hash calculation. This key should be different
for each process to make it harder for a malicious process to recreate
valid hash values for a victim process.

Add support for storing a per-thread hash key, and setting/clearing
HASHKEYR appropriately.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Add ruscur reviewed-by
v1:	* Guard HASHKEYR update behind change check
	* HASHKEYR reset moved earlier to patch 2
---
 arch/powerpc/include/asm/processor.h |  1 +
 arch/powerpc/kernel/process.c        | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index e96c9b8c2a60..8a6754ffdc7e 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -264,6 +264,7 @@ struct thread_struct {
 	unsigned long   mmcr3;
 	unsigned long   sier2;
 	unsigned long   sier3;
+	unsigned long	hashkeyr;
 
 #endif
 };
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 1fefafb2b29b..b68898ac07e1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1182,6 +1182,9 @@ static inline void save_sprs(struct thread_struct *t)
 		 */
 		t->tar = mfspr(SPRN_TAR);
 	}
+
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		t->hashkeyr = mfspr(SPRN_HASHKEYR);
 #endif
 }
 
@@ -1260,6 +1263,10 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	if (cpu_has_feature(CPU_FTR_P9_TIDR) &&
 	    old_thread->tidr != new_thread->tidr)
 		mtspr(SPRN_TIDR, new_thread->tidr);
+
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) &&
+	    old_thread->hashkeyr != new_thread->hashkeyr)
+		mtspr(SPRN_HASHKEYR, new_thread->hashkeyr);
 #endif
 
 }
@@ -1867,6 +1874,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	}
 
 	p->thread.tidr = 0;
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE))
+		p->thread.hashkeyr = current->thread.hashkeyr;
 #endif
 	return 0;
 }
@@ -1984,6 +1995,12 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	current->thread.tm_tfiar = 0;
 	current->thread.load_tm = 0;
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
+		current->thread.hashkeyr = get_random_long();
+		mtspr(SPRN_HASHKEYR, current->thread.hashkeyr);
+	}
+#endif /* CONFIG_PPC_BOOK3S_64 */
 }
 EXPORT_SYMBOL(start_thread);
 
-- 
2.40.1

