Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D827BD2F1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 07:59:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SHkaULGc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3pJY1dHKz3vjL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 16:59:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SHkaULGc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3pBx3lN0z3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Oct 2023 16:54:33 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3995kLMM028973;
	Mon, 9 Oct 2023 05:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MjJwOu77RTyAGRTBLuLPeBaK5iXlZL6tbBOZvxg6iOQ=;
 b=SHkaULGc2u8bmWhxgS4vu799n94afH/L93VgBpei/fKSc9xiVn0taJ3XT5l9ryqEdBH8
 j9HG32lif7Qc+nal9ryTQtilY0EY5UMZ3NBWpzLTmR9fv1d1xLlnbj61P13Dte50b0jv
 TqsoLoAbDZbb66oqT+yNvbKgO6vKPYRQ481k7gKqdU8buip3nZ8xPa4Oc3dr/uQMVXtE
 p6opLc7EsCJC9826lo2Ri5e4aO704PoTgznRXUdJ8PGfBnPyEqB6B9yW/F5kbAz5OYkV
 3+AZ0yQdzf1KWEmwTovblHeiJ3eis4MWUGrOtFP9bMCrInhwk6RddZctE6k7VJFXGpIp uA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb880nwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:29 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3995kNSk029205;
	Mon, 9 Oct 2023 05:54:28 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmb880nw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:28 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3995YY0f028185;
	Mon, 9 Oct 2023 05:54:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1xq4jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:54:27 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3995sPQ423790260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Oct 2023 05:54:25 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B69C20043;
	Mon,  9 Oct 2023 05:54:25 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE20B20040;
	Mon,  9 Oct 2023 05:54:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Oct 2023 05:54:24 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B229D6064D;
	Mon,  9 Oct 2023 16:54:20 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/6] powerpc/dexcr: Add enforced userspace ROP protection config
Date: Mon,  9 Oct 2023 16:54:06 +1100
Message-ID: <20231009055406.142940-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009055406.142940-1-bgray@linux.ibm.com>
References: <20231009055406.142940-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k3rRnDd5CgBOW5VkTpTdvlBOceb_Ufnh
X-Proofpoint-GUID: 72cUSnSJ-Bip46tPPRoQIEK0XlC50BRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_04,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=772 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add a kernel config option PPC_USER_ENFORCE_ROP_PROTECT to enforce
DEXCR[NPHIE] globally regardless of prctl() or hypervisor. If set, don't
report NPHIE as editable via prctl(), as the prctl() value can never
take effect.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/Kconfig        | 5 +++++
 arch/powerpc/kernel/dexcr.c | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3aaadfd2c8eb..4851cb463dc0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -473,6 +473,11 @@ config PGTABLE_LEVELS
 	default 2 if !PPC64
 	default 4
 
+config PPC_USER_ENFORCE_ROP_PROTECT
+	bool
+	depends on PPC_BOOK3S_64
+	default y
+
 source "arch/powerpc/sysdev/Kconfig"
 source "arch/powerpc/platforms/Kconfig"
 
diff --git a/arch/powerpc/kernel/dexcr.c b/arch/powerpc/kernel/dexcr.c
index e790f76787db..01d8fa28ca17 100644
--- a/arch/powerpc/kernel/dexcr.c
+++ b/arch/powerpc/kernel/dexcr.c
@@ -1,6 +1,8 @@
+#include <linux/cache.h>
 #include <linux/capability.h>
 #include <linux/cpu.h>
 #include <linux/init.h>
+#include <linux/kconfig.h>
 #include <linux/prctl.h>
 #include <linux/sched.h>
 #include <linux/sysctl.h>
@@ -14,7 +16,7 @@
 #define DEXCR_PRCTL_EDITABLE ( \
 	DEXCR_PR_IBRTPD | \
 	DEXCR_PR_SRAPD | \
-	DEXCR_PR_NPHIE)
+	(!IS_ENABLED(CONFIG_PPC_USER_ENFORCE_ROP_PROTECT) ? DEXCR_PR_NPHIE : 0))
 
 static unsigned long dexcr_supported __ro_after_init = 0;
 
@@ -45,6 +47,9 @@ unsigned long get_thread_dexcr(struct thread_struct const *thread)
 {
 	unsigned long dexcr = thread->dexcr_enabled;
 
+	if (IS_ENABLED(CONFIG_PPC_USER_ENFORCE_ROP_PROTECT))
+		dexcr |= DEXCR_PR_NPHIE;
+
 	/* 
 	 * spec_branch_hint_enable may be written to concurrently via sysctl.
 	 * The sysctl handler is careful to use WRITE_ONCE, so we avoid
-- 
2.41.0

