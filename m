Return-Path: <linuxppc-dev+bounces-7860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB972A94F64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:29:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1nQ38QGz3c4V;
	Mon, 21 Apr 2025 20:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745231354;
	cv=none; b=ZODpq23693dxthbcTeOFIOnAkt8M3/OLd99Crs4Qj3WPj+cjimPUCslyQO9e0YObdNCGyDIOmsWzhTM0t1kDEhkNKY9eLExdvj6awhxS46Ghyn2q1MG14OvoZXAIaxA6N1TKyInZKUhefzJJ1mGlyzCa+bgpot9lPnz2FKN4QGiJdty5c3ANhmiCB8xpKiwlnCI/yTSZGTSvTd5XoKQy1qTDy3e4vzVncsyJKUvs9BCQdvphzEUbym8xse4jopU0gUBi+CNHBAH0dfmLvvVdgxbdEXnppk7mQabra61rPf7dROntf9b7pVQB4fuV+TAqN6yyxnCiWwuA4ndESGPiHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745231354; c=relaxed/relaxed;
	bh=bBkKyQurXNwRtsScOu9g+rkHUT9LDyH5h2GRVKWlHW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpNfuQG12C2DbIw7XkDhCZ6wKAU2CQlnc5h8uVUydDrIZ+tNQpZod+ORuveM7pKjHjll2bfdrG4MaN69Tektp4ExXZYyeGhVrsgY7FIGVJzaNMwRYj4V9+OFn4sABky6wT7QCM26yKcIYScAiQb4tLrizDuZLxvG7cVsiNm+fWA80NpN3lKu8AQmGnv2negPAkSOBchu7B7dmx6LtGRi4K0bn0JETqACwp/7XcPTK9hBJHOEitsNERrovkSqyohSMIyXJ/h2NQjR3YI9O2SMF7PUeWZTzQ57hhbW9QCqxq+LecmaS34Bt/JKUxxANKjBg54fso/f4bOkt1MvNUheQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQ46Hufb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQ46Hufb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1nP3XmBz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:29:13 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KKWBpq002084;
	Mon, 21 Apr 2025 10:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=bBkKyQurXNwRtsScO
	u9g+rkHUT9LDyH5h2GRVKWlHW8=; b=bQ46HufbhVgc2/2UhQvpMjy4bgMO3Tlxl
	Lt/5lMOqyu5JvUiJ1LgH3uzIe31LLT5zcI4zb5yZu9+RNdx/S5lDTd9j/gD3P04G
	QWNpCjnFV3PkVgyIQnKTZnVInS7pnhBBuaGfDcSpoeXmSfHpohxdXhO9JNpkUyd3
	ci5wdKgUuXWGzl1NOgjnZ1Daz8i6RY9OkbawotCd8m3qaDZFcrbkdisBtxtSINYb
	qfbPAnsLunmh40n6d7ua0GwZB1mRVv7KMs3MVI88ZWkokEIb5zf9Y+OmxTSeCH4R
	mJdMHgM/n6YXbt01RecsI/P5BLmB5Z3rUEyWECVu0ZbCwwsfn6dzQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrkq31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:58 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LASuoR020077;
	Mon, 21 Apr 2025 10:28:58 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 464ycrkq2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L6HaIU012493;
	Mon, 21 Apr 2025 10:28:57 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5sx40e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:57 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LASshx53281050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:28:54 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0956A20074;
	Mon, 21 Apr 2025 10:28:54 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 212902006A;
	Mon, 21 Apr 2025 10:28:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 10:28:51 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, sshegde@linux.ibm.com,
        gautam@linux.ibm.com, vaibhav@linux.ibm.com, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
Date: Mon, 21 Apr 2025 15:58:36 +0530
Message-ID: <20250421102837.78515-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250421102837.78515-1-sshegde@linux.ibm.com>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Jp7xrN4C c=1 sm=1 tr=0 ts=68061deb cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=ORXw20NSZVeh7yTWmm0A:9
X-Proofpoint-GUID: hoL7Txpgf8T-Hv-v2-Hffgks_KovU81M
X-Proofpoint-ORIG-GUID: JHPzvNKdWUgVSGhHeegJaH4E-lDrZDzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

There is generic entry framework to handle signals and check for
reschedule etc before entering the guest. Use that framework for
powerpc.

Advantages:
- Less code duplication.
- powerpc kvm now understands NR and NR_lazy bits.
- powerpc can enable HAVE_POSIX_CPU_TIMERS_TASK_WORK, currently the
  powerpc/kvm code doesn't handle TIF_NOTIFY_RESUME.

Testing: No splats seen in below cases.
- Booted KVM guest on PowerVM and PowerNV systems. 
- Ran stress-ng CPU stressors in each above case. 
- On PowerNV host, tried preempt=lazy/full and run stress-ng CPU stressor
  in the KVM guest. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig         |  1 +
 arch/powerpc/kvm/book3s_hv.c | 13 +++++++------
 arch/powerpc/kvm/powerpc.c   | 22 ++++++++--------------
 3 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6722625a4..83807ae44 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -299,6 +299,7 @@ config PPC
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC			if KASAN && EXECMEM
+	select KVM_XFER_TO_GUEST_WORK
 	select LOCK_MM_AND_FIND_VMA
 	select MMU_GATHER_PAGE_SIZE
 	select MMU_GATHER_RCU_TABLE_FREE
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 19f4d298d..123539642 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -80,8 +80,8 @@
 #include <asm/ultravisor.h>
 #include <asm/dtl.h>
 #include <asm/plpar_wrappers.h>
-
 #include <trace/events/ipi.h>
+#include <linux/entry-kvm.h>
 
 #include "book3s.h"
 #include "book3s_hv.h"
@@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	}
 
 	if (need_resched())
-		cond_resched();
+		schedule();
 
 	kvmppc_update_vpas(vcpu);
 
@@ -5097,10 +5097,11 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		return -EINVAL;
 	}
 
-	/* No need to go into the guest when all we'll do is come back out */
-	if (signal_pending(current)) {
-		run->exit_reason = KVM_EXIT_INTR;
-		return -EINTR;
+	/* use generic frameworks to handle signals, need_resched  */
+	if (__xfer_to_guest_mode_work_pending()) {
+		r = xfer_to_guest_mode_handle_work(vcpu);
+		if (r)
+			return r;
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 153587741..4ff334532 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -34,6 +34,7 @@
 #endif
 #include <asm/ultravisor.h>
 #include <asm/setup.h>
+#include <linux/entry-kvm.h>
 
 #include "timing.h"
 #include "../mm/mmu_decl.h"
@@ -80,24 +81,17 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 {
 	int r;
 
+	/* use generic framework to handle need resched and signals */
+	if (__xfer_to_guest_mode_work_pending()) {
+		r = xfer_to_guest_mode_handle_work(vcpu);
+		if (r)
+			return r;
+	}
+
 	WARN_ON(irqs_disabled());
 	hard_irq_disable();
 
 	while (true) {
-		if (need_resched()) {
-			local_irq_enable();
-			cond_resched();
-			hard_irq_disable();
-			continue;
-		}
-
-		if (signal_pending(current)) {
-			kvmppc_account_exit(vcpu, SIGNAL_EXITS);
-			vcpu->run->exit_reason = KVM_EXIT_INTR;
-			r = -EINTR;
-			break;
-		}
-
 		vcpu->mode = IN_GUEST_MODE;
 
 		/*
-- 
2.48.1


