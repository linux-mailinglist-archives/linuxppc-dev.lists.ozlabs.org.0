Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF15029CFEE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:42:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLpBH1RxTzDqRg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:42:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GZMmUyHD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLp2l6lwyzDqRs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:35:59 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SCWG32125281; Wed, 28 Oct 2020 08:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=z8Lye+4ks7c7dx3nmISYlHyV2Y6B6yQDB50LnC4pPUY=;
 b=GZMmUyHD9Pmu5SyCEr/0WY5XZ8AQdux9hnvkP/D1YZdtXqga66AQJrYUM49OaWvyBymi
 Q6KXgntpprxZ7R+tbw7FFh38ZBtJBEa4cZB3one4gk/L/0UCMhrkbrhJVGF0oj+AtdKi
 oljEFU2o4oiYpXzSidIplcaD3mZedsc5GcdRe7HKFbUJZz9psbLSrc47I8YdVSzSsWOo
 LS4riac4ymaSnd/ZSI3NCtGuuMNrCg0GGwWDe9oWuxO3BXOE8EH9juO7MZU0x/V3J3ii
 OOoS7wW1JRx2cdVFPC+XvRRG5O8WhFd8Hp/TOFl2CFxyXSDYBp8RbqHKi2p76HV48J4y lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ejcnt088-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:48 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09SCX8EZ131940;
 Wed, 28 Oct 2020 08:35:48 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34ejcnt066-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SCSTX4005495;
 Wed, 28 Oct 2020 12:35:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 34f8cr80pk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:35:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SCZhwX24314124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 12:35:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBCC0A405D;
 Wed, 28 Oct 2020 12:35:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA12A4051;
 Wed, 28 Oct 2020 12:35:40 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.210.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 12:35:40 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/4] powerpc: Refactor is_kvm_guest declaration to new header
Date: Wed, 28 Oct 2020 18:05:09 +0530
Message-Id: <20201028123512.871051-2-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
References: <20201028123512.871051-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-28_06:2020-10-26,
 2020-10-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=962 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010280083
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

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
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
---
 arch/powerpc/include/asm/firmware.h  |  6 ------
 arch/powerpc/include/asm/kvm_guest.h | 15 +++++++++++++++
 arch/powerpc/include/asm/kvm_para.h  |  2 +-
 arch/powerpc/platforms/pseries/smp.c |  1 +
 4 files changed, 17 insertions(+), 7 deletions(-)
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

