Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90729CFF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 13:44:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLpDv1FpVzDqV7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 23:44:47 +1100 (AEDT)
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
 header.s=pp1 header.b=HsMke5n9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLp2q66XWzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 23:36:03 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09SCWDbK134428; Wed, 28 Oct 2020 08:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=I5JcxohQrT3TjuBGQEwWlf663PWz64CJ5RSVCJUk+OU=;
 b=HsMke5n9hB/9Hw1M8Izb003Pu/8MLaUJyy1L1JtP+z2rYdeAPH32Vmodgkv3VKAuy0Cb
 l4OkXc7w35zA+TadM1sfQIaGkwkDixOsg8nTzvO6dH/KsEObYGULgW9drsRDVZ8Zgioi
 4f8amY7cpmIFRB3DoTgSho8sD7KupnOYTRtu23Tmy9J9zj2xail40DTVhn9/tUFgX2//
 H2nsd0/KostYNJQRlJKqWspGOONVx8iIFmPmzJnofDD+ocqhNDk4H6io/MIEM94AX1oR
 AGd+2ZhoWNONoGwi5KCJJqpblPuZnXRR4+OyTK1Bbz5Ld5PhbtyOsQGEbHPcdcMrT5Wf 0w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34esjks9kx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:55 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09SCYRjQ143835;
 Wed, 28 Oct 2020 08:35:55 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34esjks9jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 08:35:54 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09SCR2QT011225;
 Wed, 28 Oct 2020 12:35:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 34cbhh4g64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Oct 2020 12:35:52 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09SCZo7535783166
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Oct 2020 12:35:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12B17A404D;
 Wed, 28 Oct 2020 12:35:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 076BBA4040;
 Wed, 28 Oct 2020 12:35:48 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.79.210.102])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Oct 2020 12:35:47 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 4/4] powerpc/paravirt: Use is_kvm_guest in vcpu_is_preempted
Date: Wed, 28 Oct 2020 18:05:12 +0530
Message-Id: <20201028123512.871051-5-srikar@linux.vnet.ibm.com>
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
 mlxlogscore=999 spamscore=0
 adultscore=0 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

If its a shared lpar but not a KVM guest, then see if the vCPU is
related to the calling vCPU. On PowerVM, only cores can be preempted.
So if one vCPU is a non-preempted state, we can decipher that all other
vCPUs sharing the same core are in non-preempted state.

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
 arch/powerpc/include/asm/paravirt.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index 9362c94fe3aa..edc08f04aef7 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -10,6 +10,9 @@
 #endif
 
 #ifdef CONFIG_PPC_SPLPAR
+#include <asm/kvm_guest.h>
+#include <asm/cputhreads.h>
+
 DECLARE_STATIC_KEY_FALSE(shared_processor);
 
 static inline bool is_shared_processor(void)
@@ -74,6 +77,21 @@ static inline bool vcpu_is_preempted(int cpu)
 {
 	if (!is_shared_processor())
 		return false;
+
+#ifdef CONFIG_PPC_SPLPAR
+	if (!is_kvm_guest()) {
+		int first_cpu = cpu_first_thread_sibling(smp_processor_id());
+
+		/*
+		 * Preemption can only happen at core granularity. This CPU
+		 * is not preempted if one of the CPU of this core is not
+		 * preempted.
+		 */
+		if (cpu_first_thread_sibling(cpu) == first_cpu)
+			return false;
+	}
+#endif
+
 	if (yield_count_of(cpu) & 1)
 		return true;
 	return false;
-- 
2.18.4

