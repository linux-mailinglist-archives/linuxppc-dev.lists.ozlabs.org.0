Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B03C544C85B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 20:02:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqDkc4jV9z3bN8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 06:02:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vm4pO5Qa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vm4pO5Qa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqDjn6pbgz2xgb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 06:02:04 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAIlE6s010235; 
 Wed, 10 Nov 2021 19:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=bEZobj7RwXt/DUC6+of4EuWiJDtav/P0WFoz/EtcnkY=;
 b=Vm4pO5QaYv4/aMQnSVjO5Rd7tj5PQ52jtdbPIUM9deKXujK1BNX8RASDAVqsHYTSyS5O
 mvplDyd9TEaX9H1RFWStWnq2WdexlGnAQjxmOuUcZ+qlhCOoPmhpsoWD60/ZdqWxvD8Y
 0b8BQvpKtoNIdWc4GjQgqIWOMw5iZJZI4qX9MGgCrfUQBxnLHNERYxglVuNL00XIcSCH
 bSDyWBILQEC3juLhR4J2eZBdEmnlkIwXJZ8eNRm0nonZ3EnGKFreVfcKkHfgD2r/uK9N
 U8XIXUCD7GLtdZ+Qwa+wsSPYsZAByZur7yKI3HONFRSYltwFpV03VweTJ07Dkv/E3yse lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8knu891q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 19:01:56 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AAInxnq015955;
 Wed, 10 Nov 2021 19:01:56 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3c8knu8914-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 19:01:56 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAIv76i032251;
 Wed, 10 Nov 2021 19:01:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3c5hbanup3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Nov 2021 19:01:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AAItAvr62783946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 10 Nov 2021 18:55:10 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28BEDAE06E;
 Wed, 10 Nov 2021 19:01:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E052BAE065;
 Wed, 10 Nov 2021 19:01:47 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.43.105.81])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 10 Nov 2021 19:01:47 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ppc64/fadump: fix inaccurate CPU state info in vmcore
 generated with panic
Date: Thu, 11 Nov 2021 00:31:43 +0530
Message-Id: <20211110190143.186346-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dVA5KCPvJ-y42pJmqGpX9HvO0DPWluEC
X-Proofpoint-ORIG-GUID: tVXYrv7PPEyMBfa1q6vuqAIRR0ffE7ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_07,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=860 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100092
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, sourabhjain@linux.ibm.com,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In panic path, fadump is triggered via a panic notifier function.
Before calling panic notifier functions, smp_send_stop() gets called,
which stops all CPUs except the panic'ing CPU. Commit 8389b37dffdc
("powerpc: stop_this_cpu: remove the cpu from the online map.") and
again commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
started marking CPUs as offline while stopping them. So, if a kernel
has either of the above commits, vmcore captured with fadump via panic
path would show only the panic'ing CPU as online. Sample output of
crash-utility with such vmcore:

  # crash vmlinux vmcore
  ...
        KERNEL: vmlinux
      DUMPFILE: vmcore  [PARTIAL DUMP]
          CPUS: 1
          DATE: Wed Nov 10 09:56:34 EST 2021
        UPTIME: 00:00:42
  LOAD AVERAGE: 2.27, 0.69, 0.24
         TASKS: 183
      NODENAME: XXXXXXXXX
       RELEASE: 5.15.0+
       VERSION: #974 SMP Wed Nov 10 04:18:19 CST 2021
       MACHINE: ppc64le  (2500 Mhz)
        MEMORY: 8 GB
         PANIC: "Kernel panic - not syncing: sysrq triggered crash"
           PID: 3394
       COMMAND: "bash"
          TASK: c0000000150a5f80  [THREAD_INFO: c0000000150a5f80]
           CPU: 1
         STATE: TASK_RUNNING (PANIC)

  crash> p -x __cpu_online_mask
  __cpu_online_mask = $1 = {
    bits = {0x2, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
  }
  crash>
  crash>
  crash> p -x __cpu_active_mask
  __cpu_active_mask = $2 = {
    bits = {0xff, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
  }
  crash>

While this has been the case since fadump was introduced, the issue
was not identified for two probable reasons:

  - In general, the bulk of the vmcores analyzed were from crash
    due to exception.

  - The above did change since commit 8341f2f222d7 ("sysrq: Use
    panic() to force a crash") started using panic() instead of
    deferencing NULL pointer to force a kernel crash. But then
    commit de6e5d38417e ("powerpc: smp_send_stop do not offline
    stopped CPUs") stopped marking CPUs as offline till kernel
    commit bab26238bbd4 ("powerpc: Offline CPU in stop_this_cpu()")
    reverted that change.

To avoid vmcore from showing only one CPU as online in panic path,
skip marking non panic'ing CPUs as offline while stopping them
during fadump crash.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c23ee842c4c3..20555d5d5966 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -61,6 +61,7 @@
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
 #include <asm/kup.h>
+#include <asm/fadump.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -626,7 +627,8 @@ static void nmi_stop_this_cpu(struct pt_regs *regs)
 	/*
 	 * IRQs are already hard disabled by the smp_handle_nmi_ipi.
 	 */
-	set_cpu_online(smp_processor_id(), false);
+	if (!(oops_in_progress && should_fadump_crash()))
+		set_cpu_online(smp_processor_id(), false);
 
 	spin_begin();
 	while (1)
@@ -650,7 +652,8 @@ static void stop_this_cpu(void *dummy)
 	 * to know other CPUs are offline before it breaks locks to flush
 	 * printk buffers, in case we panic()ed while holding the lock.
 	 */
-	set_cpu_online(smp_processor_id(), false);
+	if (!(oops_in_progress && should_fadump_crash()))
+		set_cpu_online(smp_processor_id(), false);
 
 	spin_begin();
 	while (1)
-- 
2.31.1

