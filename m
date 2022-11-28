Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 703E9639FA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:46:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL8xg2M6Hz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:46:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAyfNnWV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAyfNnWV;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wh4YHgz2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:55 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1jwpW026327;
	Mon, 28 Nov 2022 02:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mXIE/L9uW7hegdcFJuAX9MidU8J74OeAKasrGLrUgQE=;
 b=YAyfNnWV06SBVe3nkc1n8RMoV/UkNZFDyBaE3h2aj9LMuAD3nOZRAZltq45inzoNmvIk
 gZl65h/iElEzlPjUkSGD1cLkiptb/iJ+sNf6/C8tJfqX0IPTOTVSmUqxxEK51Ua6kiIs
 adCmWmuBW7tH5HAyWfaQHd7RxFfl1NT9Rzhzv680SJx129HvMBN531OoH7KKnRk/Pwue
 LsyBIlB95xJmHiMfovRMPR9d5T/hygZFu4hR6ji7pPM0bA4qZ75W+NujnIweFM/IZP3N
 yOMxn+3DKmjLmo4chA2+hcWeC29T9DGTknFyntmx42t8FaCQ3DmIp+by1OQnZrqfaVpD Tg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vnnun0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:49 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2Zw2r032505;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hsurp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjg21114866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A27A4C044;
	Mon, 28 Nov 2022 02:45:45 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F8034C040;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5F71E60810;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 08/13] powerpc/dexcr: Add enforced userspace ROP protection config
Date: Mon, 28 Nov 2022 13:44:53 +1100
Message-Id: <20221128024458.46121-9-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HEZMgtMptc9MVkiQ5LAnuAUPHHSSGaQs
X-Proofpoint-GUID: HEZMgtMptc9MVkiQ5LAnuAUPHHSSGaQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DEXCR Non-Privileged Hash Instruction Enable (NPHIE) aspect controls
whether the hashst and hashchk instructions are treated as no-ops by the
CPU.

NPHIE behaviour per ISA 3.1B:

0:	hashst and hashchk instructions are executed as no-ops
	(even when allowed by PCR)

1:	hashst and hashchk instructions are executed normally
	(if allowed by PCR)

Currently this aspect may be set per-process by prctl() or enforced
globally by the hypervisor.

Add a kernel config option PPC_USER_ROP_PROTECT to enforce DEXCR[NPHIE]
globally regardless of prctl() or hypervisor. If set, don't report
NPHIE as editable via prctl(), as the prctl() value can never take
effect.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig        |  5 +++++
 arch/powerpc/kernel/dexcr.c | 15 +++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 699df27b0e2f..ba3458d07744 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -434,6 +434,11 @@ config PGTABLE_LEVELS
 	default 2 if !PPC64
 	default 4
 
+config PPC_USER_ROP_PROTECT
+	bool
+	depends on PPC_BOOK3S_64
+	default y
+
 source "arch/powerpc/sysdev/Kconfig"
 source "arch/powerpc/platforms/Kconfig"
 
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index 8239bcc92026..394140fc23aa 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -2,6 +2,7 @@
 #include <linux/capability.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
+#include <linux/kconfig.h>
 #include <linux/prctl.h>
 #include <linux/sched.h>
 #include <linux/spinlock.h>
@@ -18,8 +19,8 @@
 #define DEFAULT_DEXCR	0
 
 /* Allow process configuration of these by default */
-#define DEXCR_PRCTL_EDITABLE (DEXCR_PRO_SBHE | DEXCR_PRO_IBRTPD | \
-			      DEXCR_PRO_SRAPD | DEXCR_PRO_NPHIE)
+static unsigned long dexcr_prctl_editable __ro_after_init =
+	DEXCR_PRO_SBHE | DEXCR_PRO_IBRTPD | DEXCR_PRO_SRAPD | DEXCR_PRO_NPHIE;
 
 /*
  * Lock to protect system DEXCR override from concurrent updates.
@@ -83,6 +84,12 @@ static int __init dexcr_init(void)
 	if (early_cpu_has_feature(CPU_FTR_DEXCR_SBHE))
 		update_userspace_system_dexcr(DEXCR_PRO_SBHE, spec_branch_hint_enable);
 
+	if (early_cpu_has_feature(CPU_FTR_DEXCR_NPHIE) &&
+	    IS_ENABLED(CONFIG_PPC_USER_ROP_PROTECT)) {
+		update_userspace_system_dexcr(DEXCR_PRO_NPHIE, 1);
+		dexcr_prctl_editable &= ~DEXCR_PRO_NPHIE;
+	}
+
 	return 0;
 }
 early_initcall(dexcr_init);
@@ -131,7 +138,7 @@ static int dexcr_aspect_get(struct task_struct *task, unsigned int aspect)
 {
 	int ret = 0;
 
-	if (aspect & DEXCR_PRCTL_EDITABLE)
+	if (aspect & dexcr_prctl_editable)
 		ret |= PR_PPC_DEXCR_PRCTL;
 
 	if (aspect & task->thread.dexcr_mask) {
@@ -174,7 +181,7 @@ int dexcr_prctl_get(struct task_struct *task, unsigned long which)
 
 static int dexcr_aspect_set(struct task_struct *task, unsigned int aspect, unsigned long ctrl)
 {
-	if (!(aspect & DEXCR_PRCTL_EDITABLE))
+	if (!(aspect & dexcr_prctl_editable))
 		return -ENXIO;  /* Aspect is not allowed to be changed by prctl */
 
 	if (aspect & task->thread.dexcr_forced)
-- 
2.38.1

