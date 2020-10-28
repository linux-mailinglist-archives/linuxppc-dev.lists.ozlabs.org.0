Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DB29CFF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:47:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLpJ35cVdzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:47:31 +1100 (AEDT)
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
 header.s=pp1 header.b=QLHjLkk1; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLp3574mGzDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:36:17 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SCWEos105204; Wed, 28 Oct 2020 08:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GvOqN0IyagIevXHaBf7kW2i68lDHUqnEa0Nw2ZMl3JI=;
 b=QLHjLkk1GZbyXlpzgBeDHyxDuIYIqlAKam4/UWc1klAhfmBcavd7cg+wkYLjzfb+qkxH
 j5s1esto0FmL6AUyJGco5f0hhG7YZiStq2cRy4RJVQMY6MRtzL+pg/GGkHk9XbRdoNJ5
 1OFcl/XQixd6e/XGC8ScV5j9Cdtdf9NSOX5I0RuDHrN4gBpfLBw8dsSQMaWzOxwkDLgB
 WVmGSdqpiL8vtCGQ/gAtCTvE095GHFGV0Yj10q41bs4uqX8WUSOwAHXSDYn+mWKKztxY
 x5q3C5qe67WjV3DEjgTsSATBR2fIecJWDsZexIJieFhmdzd/MrH1pg7bPcYOWzwe/q57 cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34d97hm3hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:36:07 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09SCWMWt105831;
 Wed, 28 Oct 2020 08:36:02 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34d97hm3a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:36:02 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SCRsP6011719;
 Wed, 28 Oct 2020 12:35:50 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 34cbhh4g62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:35:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SCZlMv34013692
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 12:35:47 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B641BA4040;
 Wed, 28 Oct 2020 12:35:47 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB953A4057;
 Wed, 28 Oct 2020 12:35:45 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.210.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 12:35:45 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/4] powerpc: Reintroduce is_kvm_guest in a new avatar
Date: Wed, 28 Oct 2020 18:05:11 +0530
Message-Id: <20201028123512.871051-4-srikar@linux.vnet.ibm.com>
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
 spamscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxlogscore=917
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010280083
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

Introduce a static branch that would be set during boot if the OS
happens to be a KVM guest. Subsequent checks to see if we are on KVM
will rely on this static branch. This static branch would be used in
vcpu_is_preempted in a subsequent patch.

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
 arch/powerpc/include/asm/kvm_guest.h | 10 ++++++++++
 arch/powerpc/include/asm/kvm_para.h  |  2 +-
 arch/powerpc/kernel/firmware.c       |  3 +++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_guest.h b/arch/powerpc/include/asm/kvm_guest.h
index ba8291e02ba9..627ba272e781 100644
--- a/arch/powerpc/include/asm/kvm_guest.h
+++ b/arch/powerpc/include/asm/kvm_guest.h
@@ -7,8 +7,18 @@
 #define __POWERPC_KVM_GUEST_H__
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
+#include <linux/jump_label.h>
+
+DECLARE_STATIC_KEY_FALSE(kvm_guest);
+
+static inline bool is_kvm_guest(void)
+{
+	return static_branch_unlikely(&kvm_guest);
+}
+
 bool check_kvm_guest(void);
 #else
+static inline bool is_kvm_guest(void) { return false; }
 static inline bool check_kvm_guest(void) { return false; }
 #endif
 
diff --git a/arch/powerpc/include/asm/kvm_para.h b/arch/powerpc/include/asm/kvm_para.h
index 6fba06b6cfdb..abe1b5e82547 100644
--- a/arch/powerpc/include/asm/kvm_para.h
+++ b/arch/powerpc/include/asm/kvm_para.h
@@ -14,7 +14,7 @@
 
 static inline int kvm_para_available(void)
 {
-	return IS_ENABLED(CONFIG_KVM_GUEST) && check_kvm_guest();
+	return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
 }
 
 static inline unsigned int kvm_arch_para_features(void)
diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index 61243267d4cf..28498fc573f2 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 
 #include <asm/firmware.h>
+#include <asm/kvm_guest.h>
 
 #ifdef CONFIG_PPC64
 unsigned long powerpc_firmware_features __read_mostly;
@@ -21,6 +22,7 @@ EXPORT_SYMBOL_GPL(powerpc_firmware_features);
 #endif
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
+DEFINE_STATIC_KEY_FALSE(kvm_guest);
 bool check_kvm_guest(void)
 {
 	struct device_node *hyper_node;
@@ -32,6 +34,7 @@ bool check_kvm_guest(void)
 	if (!of_device_is_compatible(hyper_node, "linux,kvm"))
 		return 0;
 
+	static_branch_enable(&kvm_guest);
 	return 1;
 }
 #endif
-- 
2.18.4

