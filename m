Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95A731D27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:53:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKaf3Mlx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhmzY1DdVz3brl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DKaf3Mlx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhmtP66sJz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 01:49:01 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FFHMP2017877;
	Thu, 15 Jun 2023 15:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=on9QF5cwMEEnHAeMGmfeT1a/1qzMzHzn/yyNFcBfqOA=;
 b=DKaf3MlxvQINoBhfrydUqL1PBbpD3gAJBSg1OWhNZf6cAjVxGKib4bXG3W3rFKfDpMg1
 pGZivHXg3nL4vFewPA5oRmhSXZ2UCiPf7KioPUVF4UmBjTrFVVddG+qhaF5rJrfBsJXA
 ELGeCqJ7egZazJlpOrNykFnBAdWhCuxvnRgJOlwBKXFhVa5q0T/IHs/YJL1dEPvgKWTu
 bW1O7gAr2eAHeRF3uFBfOkJxmwrVRw1+bBObWc33RYB6k9hEFtB8FVrDKq/y5VWPt0yR
 qm84mj1lqH0CD+YA4TfOAWZSmW4KH4mOBpK84pFPS4uHOehb0u+UjpvqH9hcHs0vKVAF Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r855fh8bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:48:43 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35FFg6Rb006014;
	Thu, 15 Jun 2023 15:47:33 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r855fh459-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:47:32 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F4mYmE005997;
	Thu, 15 Jun 2023 15:46:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt53pbc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35FFkftU63832374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 15:46:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3BF420049;
	Thu, 15 Jun 2023 15:46:41 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B37D2004B;
	Thu, 15 Jun 2023 15:46:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.144.159.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 15:46:41 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] powerpc: Add HOTPLUG_SMT support
Date: Thu, 15 Jun 2023 17:46:34 +0200
Message-ID: <20230615154635.13660-10-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615154635.13660-1-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ppC8F6EmRUH-9xgzOu2Ah9I49X86RDd5
X-Proofpoint-ORIG-GUID: NgSuJk7yUgH_WK8ORfA1uyoVVK_4aLRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_12,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150136
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

Add support for HOTPLUG_SMT, which enables the generic sysfs SMT support
files in /sys/devices/system/cpu/smt, as well as the "nosmt" boot
parameter.

Implement the recently added hooks to allow partial SMT states, allow
any number of threads per core.

Tie the config symbol to HOTPLUG_CPU, which enables it on the major
platforms that support SMT. If there are other platforms that want the
SMT support that can be tweaked in future.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
[ldufour: pass current SMT level to cpu_smt_set_num_threads]
[ldufour: remove topology_smt_supported]
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/Kconfig                |  1 +
 arch/powerpc/include/asm/topology.h | 20 ++++++++++++++++++++
 arch/powerpc/kernel/smp.c           |  8 +++++++-
 3 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..5cf87ca10a9c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -273,6 +273,7 @@ config PPC
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN
+	select HOTPLUG_SMT			if HOTPLUG_CPU
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 8a4d4f4d9749..7602f17d688a 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -143,5 +143,25 @@ static inline int cpu_to_coregroup_id(int cpu)
 #endif
 #endif
 
+#ifdef CONFIG_HOTPLUG_SMT
+#include <linux/cpu_smt.h>
+#include <asm/cputhreads.h>
+
+static inline bool topology_smt_threads_supported(unsigned int num_threads)
+{
+	return num_threads <= threads_per_core;
+}
+
+static inline bool topology_is_primary_thread(unsigned int cpu)
+{
+	return cpu == cpu_first_thread_sibling(cpu);
+}
+
+static inline bool topology_smt_thread_allowed(unsigned int cpu)
+{
+	return cpu_thread_in_core(cpu) < cpu_smt_num_threads;
+}
+#endif
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TOPOLOGY_H */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 265801a3e94c..cdb77d36cdd0 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1087,7 +1087,7 @@ static int __init init_big_cores(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
-	unsigned int cpu;
+	unsigned int cpu, num_threads;
 
 	DBG("smp_prepare_cpus\n");
 
@@ -1154,6 +1154,12 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 
 	if (smp_ops && smp_ops->probe)
 		smp_ops->probe();
+
+	// Initalise the generic SMT topology support
+	num_threads = 1;
+	if (smt_enabled_at_boot)
+		num_threads = smt_enabled_at_boot;
+	cpu_smt_set_num_threads(num_threads, threads_per_core);
 }
 
 void smp_prepare_boot_cpu(void)
-- 
2.41.0

