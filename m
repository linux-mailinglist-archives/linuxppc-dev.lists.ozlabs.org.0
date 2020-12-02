Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF7E2CB43B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 06:12:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm6Y051T0zDr7d
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 16:12:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QnoZfPn5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm6Nr19sPzDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 16:05:31 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B2521Ro068430; Wed, 2 Dec 2020 00:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yEB/GESLfTfV1IK45SIsN0uOiXlMtTFwBiRsE+WI1kg=;
 b=QnoZfPn5DENnqLdWGqtu2lczovvnwdO7yMBNuoNIiK1t9zgYOmql+ncmXXF/kxCGcPw7
 dEa4Wjr0u+53RVHOaylBS+SI4jGKALLP2QGTtp4xazk849V91+Mb9Oc2RredcLmlTFo0
 kdg9LSUswoKROCuDVJhCzOh6pzLIR4s2UQaBcooVAypbHrQsvdi4/pGJG2VjsF89n0v7
 NhMbEx2t86OW7hGhhK9+zh2crXthQAhXfIkK1HmvgF8jlnWimWk5CC2l5yVmrJPWpZYv
 JoNx8B42XyS2JQDFI7bGKam/+zubTFzF6x9vzVUojND828PrjQvoaVgeG+8gVNAlq/1I 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355k194utd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:05:10 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B2524v2068508;
 Wed, 2 Dec 2020 00:05:09 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 355k194usv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 00:05:09 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B253kYl015302;
 Wed, 2 Dec 2020 05:05:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 353dtha048-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Dec 2020 05:05:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B2555sa7013024
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Dec 2020 05:05:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39E4F4C04E;
 Wed,  2 Dec 2020 05:05:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1ABC4C046;
 Wed,  2 Dec 2020 05:05:02 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.85.125.1])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Dec 2020 05:05:02 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 1/4] powerpc: Refactor is_kvm_guest declaration to new
 header
Date: Wed,  2 Dec 2020 10:34:53 +0530
Message-Id: <20201202050456.164005-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201202050456.164005-1-srikar@linux.vnet.ibm.com>
References: <20201202050456.164005-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-01_12:2020-11-30,
 2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=840 clxscore=1015 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012020027
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Phil Auld <pauld@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Waiman Long <longman@redhat.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Only code/declaration movement, in anticipation of doing a kvm-aware
vcpu_is_preempted. No additional changes.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Phil Auld <pauld@redhat.com>
Acked-by: Waiman Long <longman@redhat.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v1->v2:
v1: https://lore.kernel.org/linuxppc-dev/20201028123512.871051-1-srikar@linux.vnet.ibm.com/t/#u
 - Moved a hunk to fix a no previous prototype warning reported by: lkp@intel.com
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/C6PTRPHWMC7VV4OTYN3ISYKDHTDQS6YI/

 arch/powerpc/include/asm/firmware.h  |  6 ------
 arch/powerpc/include/asm/kvm_guest.h | 15 +++++++++++++++
 arch/powerpc/include/asm/kvm_para.h  |  2 +-
 arch/powerpc/kernel/firmware.c       |  1 +
 arch/powerpc/platforms/pseries/smp.c |  1 +
 5 files changed, 18 insertions(+), 7 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kvm_guest.h

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 0b295bdb201e..aa6a5ef5d483 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -134,12 +134,6 @@ extern int ibm_nmi_interlock_token;
 
 extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
-#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
-bool is_kvm_guest(void);
-#else
-static inline bool is_kvm_guest(void) { return false; }
-#endif
-
 #ifdef CONFIG_PPC_PSERIES
 void pseries_probe_fw_features(void);
 #else
diff --git a/arch/powerpc/include/asm/kvm_guest.h b/arch/powerpc/include/asm/kvm_guest.h
new file mode 100644
index 000000000000..c0ace884a0e8
--- /dev/null
+++ b/arch/powerpc/include/asm/kvm_guest.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020  IBM Corporation
+ */
+
+#ifndef __POWERPC_KVM_GUEST_H__
+#define __POWERPC_KVM_GUEST_H__
+
+#if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
+bool is_kvm_guest(void);
+#else
+static inline bool is_kvm_guest(void) { return false; }
+#endif
+
+#endif /* __POWERPC_KVM_GUEST_H__ */
diff --git a/arch/powerpc/include/asm/kvm_para.h b/arch/powerpc/include/asm/kvm_para.h
index 744612054c94..abe1b5e82547 100644
--- a/arch/powerpc/include/asm/kvm_para.h
+++ b/arch/powerpc/include/asm/kvm_para.h
@@ -8,7 +8,7 @@
 #ifndef __POWERPC_KVM_PARA_H__
 #define __POWERPC_KVM_PARA_H__
 
-#include <asm/firmware.h>
+#include <asm/kvm_guest.h>
 
 #include <uapi/asm/kvm_para.h>
 
diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index fe48d319d490..5f48e5ad24cd 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 
 #include <asm/firmware.h>
+#include <asm/kvm_guest.h>
 
 #ifdef CONFIG_PPC64
 unsigned long powerpc_firmware_features __read_mostly;
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 92922491a81c..d578732c545d 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -42,6 +42,7 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/code-patching.h>
 #include <asm/svm.h>
+#include <asm/kvm_guest.h>
 
 #include "pseries.h"
 
-- 
2.18.4

