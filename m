Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DF851DDB9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 18:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvxBj0dRmz3cBD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 02:40:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJ4E70a+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IJ4E70a+; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvxB04bNxz3byS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 02:39:51 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246GTvDX022535;
 Fri, 6 May 2022 16:39:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KE/MtdJ6fhH5ykSenvy6zVPv2GAw1TRnq61mhMwDXl0=;
 b=IJ4E70a+DaLdlJQCH/1bWmvqPSGxv+CWiR+AHEx+kE9o7lQWqs3J+iGRjcX+dQEGS4ej
 Pgilsoy8MOBsgVUIk8l/Lid2pAObSLOOVJcGqXqSArh+F5V7tAlRzlWvqU8R+UVBd0df
 TMwaNUPPHZkP8ajsvz0DaiQUS5LFXBjVf44Ng4I0rEZwl4ewogvlDL2pf6z+RFqB7Rul
 3e8ocKqav1W4fZHlHRNbiinDtmn/ZrUEnecaZ+mnOo5lCw9g6nKS/C/SnPvAbxF2WpnS
 e78KMk4Rux54NkZjrnExrbkBhj8bV+2wDKrXn6g4z1LKoIIjv1f/7DlXjdxNOBm9/f1D 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw78fr6m0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:39:44 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 246GVr6h029042;
 Fri, 6 May 2022 16:39:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fw78fr6kp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:39:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 246GT6J7007500;
 Fri, 6 May 2022 16:39:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3fscdk6h34-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 16:39:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 246GQDlg49938822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 16:26:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6E8811C04A;
 Fri,  6 May 2022 16:39:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDA9911C052;
 Fri,  6 May 2022 16:39:35 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.163.23.140])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 May 2022 16:39:35 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/crash: save cpu register data in crash_smp_send_stop()
Date: Fri,  6 May 2022 22:09:33 +0530
Message-Id: <20220506163933.391981-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ez8I-z7pn2pAnND_b9uqtIe66N4s6G3c
X-Proofpoint-ORIG-GUID: C1jWMY6_Nwvvohrh61MnVZgouBjBeG20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_05,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060085
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
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Capture register data for secondary CPUs in crash_smp_send_stop()
instead of doing it much later in crash_kexec_prepare_cpus() function
with another set of NMI IPIs to secondary CPUs. This change avoids
unnecessarily tricky post processing of data to get the right
backtrace for these CPUs.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c  | 40 --------------------------
 arch/powerpc/kexec/crash.c | 58 ++++++++++++++++++++++++++------------
 2 files changed, 40 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index de0f6f09a5dd..7621c3d84c1c 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -60,7 +60,6 @@
 #include <asm/cpu_has_feature.h>
 #include <asm/ftrace.h>
 #include <asm/kup.h>
-#include <asm/fadump.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -620,45 +619,6 @@ void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *))
 }
 #endif
 
-#ifdef CONFIG_NMI_IPI
-static void crash_stop_this_cpu(struct pt_regs *regs)
-#else
-static void crash_stop_this_cpu(void *dummy)
-#endif
-{
-	/*
-	 * Just busy wait here and avoid marking CPU as offline to ensure
-	 * register data is captured appropriately.
-	 */
-	while (1)
-		cpu_relax();
-}
-
-void crash_smp_send_stop(void)
-{
-	static bool stopped = false;
-
-	/*
-	 * In case of fadump, register data for all CPUs is captured by f/w
-	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
-	 * this rtas call to avoid tricky post processing of those CPUs'
-	 * backtraces.
-	 */
-	if (should_fadump_crash())
-		return;
-
-	if (stopped)
-		return;
-
-	stopped = true;
-
-#ifdef CONFIG_NMI_IPI
-	smp_send_nmi_ipi(NMI_IPI_ALL_OTHERS, crash_stop_this_cpu, 1000000);
-#else
-	smp_call_function(crash_stop_this_cpu, NULL, 0);
-#endif /* CONFIG_NMI_IPI */
-}
-
 #ifdef CONFIG_NMI_IPI
 static void nmi_stop_this_cpu(struct pt_regs *regs)
 {
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 22ceeeb705ab..f06dfe71caca 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -25,6 +25,7 @@
 #include <asm/setjmp.h>
 #include <asm/debug.h>
 #include <asm/interrupt.h>
+#include <asm/fadump.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -102,7 +103,7 @@ void crash_ipi_callback(struct pt_regs *regs)
 	/* NOTREACHED */
 }
 
-static void crash_kexec_prepare_cpus(int cpu)
+static void crash_kexec_prepare_cpus(void)
 {
 	unsigned int msecs;
 	volatile unsigned int ncpus = num_online_cpus() - 1;/* Excluding the panic cpu */
@@ -203,7 +204,7 @@ void crash_kexec_secondary(struct pt_regs *regs)
 
 #else	/* ! CONFIG_SMP */
 
-static void crash_kexec_prepare_cpus(int cpu)
+static void crash_kexec_prepare_cpus(void)
 {
 	/*
 	 * move the secondaries to us so that we can copy
@@ -249,6 +250,42 @@ static void __maybe_unused crash_kexec_wait_realmode(int cpu)
 static inline void crash_kexec_wait_realmode(int cpu) {}
 #endif	/* CONFIG_SMP && CONFIG_PPC64 */
 
+void crash_smp_send_stop(void)
+{
+	static int cpus_stopped;
+
+	/*
+	 * In case of fadump, register data for all CPUs is captured by f/w
+	 * on ibm,os-term rtas call. Skip IPI callbacks to other CPUs before
+	 * this rtas call to avoid tricky post processing of those CPUs'
+	 * backtraces.
+	 */
+	if (should_fadump_crash())
+		return;
+
+	if (cpus_stopped)
+		return;
+
+	cpus_stopped = 1;
+
+	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
+	printk_deferred_enter();
+
+	/*
+	 * This function is only called after the system
+	 * has panicked or is otherwise in a critical state.
+	 * The minimum amount of code to allow a kexec'd kernel
+	 * to run successfully needs to happen here.
+	 *
+	 * In practice this means stopping other cpus in
+	 * an SMP system.
+	 * The kernel is broken so disable interrupts.
+	 */
+	hard_irq_disable();
+
+	crash_kexec_prepare_cpus();
+}
+
 /*
  * Register a function to be called on shutdown.  Only use this if you
  * can't reset your device in the second kernel.
@@ -312,21 +349,6 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	unsigned int i;
 	int (*old_handler)(struct pt_regs *regs);
 
-	/* Avoid hardlocking with irresponsive CPU holding logbuf_lock */
-	printk_deferred_enter();
-
-	/*
-	 * This function is only called after the system
-	 * has panicked or is otherwise in a critical state.
-	 * The minimum amount of code to allow a kexec'd kernel
-	 * to run successfully needs to happen here.
-	 *
-	 * In practice this means stopping other cpus in
-	 * an SMP system.
-	 * The kernel is broken so disable interrupts.
-	 */
-	hard_irq_disable();
-
 	/*
 	 * Make a note of crashing cpu. Will be used in machine_kexec
 	 * such that another IPI will not be sent.
@@ -340,7 +362,7 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
 		mdelay(PRIMARY_TIMEOUT);
 
-	crash_kexec_prepare_cpus(crashing_cpu);
+	crash_smp_send_stop();
 
 	crash_save_cpu(regs, crashing_cpu);
 
-- 
2.35.1

