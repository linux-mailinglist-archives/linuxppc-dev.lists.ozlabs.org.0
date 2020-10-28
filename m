Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D529CFEC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:38:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLp571NVWzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:38:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NwJFu0bd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLp2m60SszDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:36:00 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SCXV0U123184; Wed, 28 Oct 2020 08:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=rHF6Yz59thCYyjQXEOJ1jQe6RNpwoec7Q33DAyj1sg0=;
 b=NwJFu0bdrOPw1NPOyLZcR5/P6fiQPXDoWRXoT6bKwvXrREuf1vitt1mc3LQIuYNiG0UB
 fqijZ6qbe2DXFM29VLpuaemWm+YgypabyfPo8pVW8Gvp+PMh435zDvTf0oK/sRaHpKxK
 aH/7mCYQr0MAiuiZDDbctn0Zo2jiKH3tdke5Ldf8x8egplagAHnizwlRozlJr7CFXLeO
 7bBvtGlWYFqw/jLskzF3z2OqJwlmFvBpu/4Lby7KoGY4ZHvaInJZXBq+a6wzfNYhBroa
 Zp/ehDr+dYOaNIie08+Vo+8oU9YehfkJeQbHtjkg2mQXAn3+HYreHlaUQUWwLLKAok+p Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34endju226-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:51 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09SCXwOv125263;
 Wed, 28 Oct 2020 08:35:51 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 34endju1xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:51 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SCQvYf027926;
 Wed, 28 Oct 2020 12:35:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 34ejqe8kwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:35:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SCZjds31457732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 12:35:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AC79A4055;
 Wed, 28 Oct 2020 12:35:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3873DA4040;
 Wed, 28 Oct 2020 12:35:43 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.210.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 12:35:43 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/4] powerpc: Rename is_kvm_guest to check_kvm_guest
Date: Wed, 28 Oct 2020 18:05:10 +0530
Message-Id: <20201028123512.871051-3-srikar@linux.vnet.ibm.com>
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
 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

is_kvm_guest() will be reused in subsequent patch in a new avatar.  Hence
rename is_kvm_guest to check_kvm_guest. No additional changes.

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
 arch/powerpc/include/asm/kvm_guest.h | 4 ++--
 arch/powerpc/include/asm/kvm_para.h  | 2 +-
 arch/powerpc/kernel/firmware.c       | 2 +-
 arch/powerpc/platforms/pseries/smp.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_guest.h b/arch/powerpc/include/asm/kvm_guest.h
index c0ace884a0e8..ba8291e02ba9 100644
--- a/arch/powerpc/include/asm/kvm_guest.h
+++ b/arch/powerpc/include/asm/kvm_guest.h
@@ -7,9 +7,9 @@
 #define __POWERPC_KVM_GUEST_H__
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
-bool is_kvm_guest(void);
+bool check_kvm_guest(void);
 #else
-static inline bool is_kvm_guest(void) { return false; }
+static inline bool check_kvm_guest(void) { return false; }
 #endif
 
 #endif /* __POWERPC_KVM_GUEST_H__ */
diff --git a/arch/powerpc/include/asm/kvm_para.h b/arch/powerpc/include/asm/kvm_para.h
index abe1b5e82547..6fba06b6cfdb 100644
--- a/arch/powerpc/include/asm/kvm_para.h
+++ b/arch/powerpc/include/asm/kvm_para.h
@@ -14,7 +14,7 @@
 
 static inline int kvm_para_available(void)
 {
-	return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
+	return IS_ENABLED(CONFIG_KVM_GUEST) && check_kvm_guest();
 }
 
 static inline unsigned int kvm_arch_para_features(void)
diff --git a/arch/powerpc/kernel/firmware.c b/arch/powerpc/kernel/firmware.c
index fe48d319d490..61243267d4cf 100644
--- a/arch/powerpc/kernel/firmware.c
+++ b/arch/powerpc/kernel/firmware.c
@@ -21,7 +21,7 @@ EXPORT_SYMBOL_GPL(powerpc_firmware_features);
 #endif
 
 #if defined(CONFIG_PPC_PSERIES) || defined(CONFIG_KVM_GUEST)
-bool is_kvm_guest(void)
+bool check_kvm_guest(void)
 {
 	struct device_node *hyper_node;
 
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index d578732c545d..c70b4be9f0a5 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -211,7 +211,7 @@ static __init void pSeries_smp_probe(void)
 	if (!cpu_has_feature(CPU_FTR_SMT))
 		return;
 
-	if (is_kvm_guest()) {
+	if (check_kvm_guest()) {
 		/*
 		 * KVM emulates doorbells by disabling FSCR[MSGP] so msgsndp
 		 * faults to the hypervisor which then reads the instruction
-- 
2.18.4

