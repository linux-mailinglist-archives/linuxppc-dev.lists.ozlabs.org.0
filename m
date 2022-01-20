Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32D494DCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 13:20:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JfhRg3YjPz3bcp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jan 2022 23:20:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MKJncdpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=MKJncdpA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JfhQv2vf9z30Ky
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 23:19:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20KAvUFm006427; 
 Thu, 20 Jan 2022 12:19:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=eU+WpzBVTMUzPLF0NFawum1x+6LlzgVqg0PBU/5+U1Y=;
 b=MKJncdpAIib1jLn+x3Cca9uX4HDlgVRZmpt7dGRz6Xtjzlfc8b+G2HtytliCUjLiZBsu
 Buj0UXfo6yuYJchOof6womlTM65SNzPpxZ8Aqe3XwFMTPZyVAfZGdFll3941APOkMqr9
 d4YMRNdNdzBb7MXJr5nUhKL3r9wX3LxqJbvln7GRMPahKHgEAuQBQlbNflFS2hCGezFf
 j/BnSO+ZXjVpKkL6arBS6AH4k9cgCbe4Je1CCYJJRi4sdL3WNhHLX446Lxv0orMWdjz+
 6GxaMyXyRMlujNW4YnTT6ZIXnmfat04sRflr2sglGfyL9+pSW/kcA1fYWDANqV4QMy8H Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dq6enhn9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 12:19:44 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20KCIfXi006647;
 Thu, 20 Jan 2022 12:19:44 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dq6enhn91-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 12:19:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20KCI30s024880;
 Thu, 20 Jan 2022 12:19:41 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03fra.de.ibm.com with ESMTP id 3dknway8r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jan 2022 12:19:41 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20KCJch842860948
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 12:19:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 19096A4060;
 Thu, 20 Jan 2022 12:19:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFFF8A4054;
 Thu, 20 Jan 2022 12:19:35 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.43.10.13])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Jan 2022 12:19:35 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5] powerpc/mce: Avoid using irq_work_queue() in realmode
Date: Thu, 20 Jan 2022 17:49:31 +0530
Message-Id: <20220120121931.517974-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fPtOxvRwA27LJvki0XjequN2bh5VsWN0
X-Proofpoint-ORIG-GUID: NKrJMOuzybwSUzrZ7vUlNGf1Sz36-yYw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-20_04,2022-01-20_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201200062
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com,
 npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In realmode mce handler we use irq_work_queue() to defer
the processing of mce events, irq_work_queue() can only
be called when translation is enabled because it touches
memory outside RMA, hence we enable translation before
calling irq_work_queue and disable on return, though it
is not safe to do in realmode.

To avoid this, program the decrementer and call the event
processing functions from timer handler.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
V2:
* Use arch_irq_work_raise to raise decrementer interrupt.
* Avoid having atomic variable.

V3:
* Fix build error.
  Reported by kernel test bot.

V4:
* Rename some functions and variables
* Remove mces_to_process counter and add a flag to indicate
  there is a mce info to process.

V5:
* Fix the build warning, reported by kernel test robot.
---
 arch/powerpc/include/asm/machdep.h       |  2 +
 arch/powerpc/include/asm/mce.h           | 13 +++++
 arch/powerpc/include/asm/paca.h          |  1 +
 arch/powerpc/kernel/mce.c                | 60 +++++++++++++-----------
 arch/powerpc/kernel/time.c               |  2 +
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 arch/powerpc/platforms/pseries/ras.c     | 32 +------------
 arch/powerpc/platforms/pseries/setup.c   |  1 +
 8 files changed, 53 insertions(+), 59 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index e821037f74f0..36d2f34aa352 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -99,6 +99,8 @@ struct machdep_calls {
 	/* Called during machine check exception to retrive fixup address. */
 	bool		(*mce_check_early_recovery)(struct pt_regs *regs);
 
+	void            (*machine_check_log_err)(void);
+
 	/* Motherboard/chipset features. This is a kind of general purpose
 	 * hook used to control some machine specific features (like reset
 	 * lines, chip power control, etc...).
diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 331d944280b8..c9f0936bd3c9 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -235,8 +235,21 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+void mce_irq_work_queue(void);
 int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
+
+#ifdef CONFIG_PPC_BOOK3S_64
+void mce_run_irq_context_handlers(void);
+#else
+static inline void mce_run_irq_context_handlers(void) { };
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_PPC_BOOK3S_64
+void set_mce_pending_irq_work(void);
+void clear_mce_pending_irq_work(void);
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 void flush_erat(void);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 295573a82c66..8330968ca346 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -288,6 +288,7 @@ struct paca_struct {
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	struct mce_info *mce_info;
+	u8 mce_pending_irq_work;
 #endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 2503dd4713b9..6cd4b1409874 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -28,19 +28,9 @@
 
 #include "setup.h"
 
-static void machine_check_process_queued_event(struct irq_work *work);
-static void machine_check_ue_irq_work(struct irq_work *work);
 static void machine_check_ue_event(struct machine_check_event *evt);
 static void machine_process_ue_event(struct work_struct *work);
 
-static struct irq_work mce_event_process_work = {
-        .func = machine_check_process_queued_event,
-};
-
-static struct irq_work mce_ue_event_irq_work = {
-	.func = machine_check_ue_irq_work,
-};
-
 static DECLARE_WORK(mce_ue_event_work, machine_process_ue_event);
 
 static BLOCKING_NOTIFIER_HEAD(mce_notifier_list);
@@ -89,6 +79,13 @@ static void mce_set_error_info(struct machine_check_event *mce,
 	}
 }
 
+void mce_irq_work_queue(void)
+{
+	/* Raise decrementer interrupt */
+	arch_irq_work_raise();
+	set_mce_pending_irq_work();
+}
+
 /*
  * Decode and save high level MCE information into per cpu buffer which
  * is an array of machine_check_event structure.
@@ -217,7 +214,7 @@ void release_mce_event(void)
 	get_mce_event(NULL, true);
 }
 
-static void machine_check_ue_irq_work(struct irq_work *work)
+static void machine_check_ue_work(void)
 {
 	schedule_work(&mce_ue_event_work);
 }
@@ -239,7 +236,7 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	irq_work_queue(&mce_ue_event_irq_work);
+	mce_irq_work_queue();
 }
 
 /*
@@ -249,7 +246,6 @@ void machine_check_queue_event(void)
 {
 	int index;
 	struct machine_check_event evt;
-	unsigned long msr;
 
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
@@ -263,20 +259,7 @@ void machine_check_queue_event(void)
 	memcpy(&local_paca->mce_info->mce_event_queue[index],
 	       &evt, sizeof(evt));
 
-	/*
-	 * Queue irq work to process this event later. Before
-	 * queuing the work enable translation for non radix LPAR,
-	 * as irq_work_queue may try to access memory outside RMO
-	 * region.
-	 */
-	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
-		msr = mfmsr();
-		mtmsr(msr | MSR_IR | MSR_DR);
-		irq_work_queue(&mce_event_process_work);
-		mtmsr(msr);
-	} else {
-		irq_work_queue(&mce_event_process_work);
-	}
+	mce_irq_work_queue();
 }
 
 void mce_common_process_ue(struct pt_regs *regs,
@@ -338,7 +321,7 @@ static void machine_process_ue_event(struct work_struct *work)
  * process pending MCE event from the mce event queue. This function will be
  * called during syscall exit.
  */
-static void machine_check_process_queued_event(struct irq_work *work)
+static void machine_check_process_queued_event(void)
 {
 	int index;
 	struct machine_check_event *evt;
@@ -363,6 +346,27 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	}
 }
 
+void set_mce_pending_irq_work(void)
+{
+	local_paca->mce_pending_irq_work = 1;
+}
+
+void clear_mce_pending_irq_work(void)
+{
+	local_paca->mce_pending_irq_work = 0;
+}
+
+void mce_run_irq_context_handlers(void)
+{
+	if (unlikely(local_paca->mce_pending_irq_work)) {
+		if (ppc_md.machine_check_log_err)
+			ppc_md.machine_check_log_err();
+		machine_check_process_queued_event();
+		machine_check_ue_work();
+		clear_mce_pending_irq_work();
+	}
+}
+
 void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 62361cc7281c..13a7360b6199 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -70,6 +70,7 @@
 #include <asm/vdso_datapage.h>
 #include <asm/firmware.h>
 #include <asm/asm-prototypes.h>
+#include <asm/mce.h>
 
 /* powerpc clocksource/clockevent code */
 
@@ -638,6 +639,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 
 	if (test_irq_work_pending()) {
 		clear_irq_work_pending();
+		mce_run_irq_context_handlers();
 		irq_work_run();
 	}
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 56c9ef9052e9..af162aeeae86 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -21,6 +21,7 @@ struct pt_regs;
 extern int pSeries_system_reset_exception(struct pt_regs *regs);
 extern int pSeries_machine_check_exception(struct pt_regs *regs);
 extern long pseries_machine_check_realmode(struct pt_regs *regs);
+void pSeries_machine_check_log_err(void);
 
 #ifdef CONFIG_SMP
 extern void smp_init_pseries(void);
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 74c9b1b5bc66..f2e9eb2195f1 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -23,11 +23,6 @@ static DEFINE_SPINLOCK(ras_log_buf_lock);
 
 static int ras_check_exception_token;
 
-static void mce_process_errlog_event(struct irq_work *work);
-static struct irq_work mce_errlog_process_work = {
-	.func = mce_process_errlog_event,
-};
-
 #define EPOW_SENSOR_TOKEN	9
 #define EPOW_SENSOR_INDEX	0
 
@@ -717,7 +712,6 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	struct pseries_errorlog *pseries_log;
 	struct pseries_mc_errorlog *mce_log = NULL;
 	int disposition = rtas_error_disposition(errp);
-	unsigned long msr;
 	u8 error_type;
 
 	if (!rtas_error_extended(errp))
@@ -731,40 +725,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	error_type = mce_log->error_type;
 
 	disposition = mce_handle_err_realmode(disposition, error_type);
-
-	/*
-	 * Enable translation as we will be accessing per-cpu variables
-	 * in save_mce_event() which may fall outside RMO region, also
-	 * leave it enabled because subsequently we will be queuing work
-	 * to workqueues where again per-cpu variables accessed, besides
-	 * fwnmi_release_errinfo() crashes when called in realmode on
-	 * pseries.
-	 * Note: All the realmode handling like flushing SLB entries for
-	 *       SLB multihit is done by now.
-	 */
 out:
-	msr = mfmsr();
-	mtmsr(msr | MSR_IR | MSR_DR);
-
 	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
 					      disposition);
-
-	/*
-	 * Queue irq work to log this rtas event later.
-	 * irq_work_queue uses per-cpu variables, so do this in virt
-	 * mode as well.
-	 */
-	irq_work_queue(&mce_errlog_process_work);
-
-	mtmsr(msr);
-
 	return disposition;
 }
 
 /*
  * Process MCE rtas errlog event.
  */
-static void mce_process_errlog_event(struct irq_work *work)
+void pSeries_machine_check_log_err(void)
 {
 	struct rtas_error_log *err;
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 83a04d967a59..069d7b3bb142 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1086,6 +1086,7 @@ define_machine(pseries) {
 	.system_reset_exception = pSeries_system_reset_exception,
 	.machine_check_early	= pseries_machine_check_realmode,
 	.machine_check_exception = pSeries_machine_check_exception,
+	.machine_check_log_err	= pSeries_machine_check_log_err,
 #ifdef CONFIG_KEXEC_CORE
 	.machine_kexec          = pSeries_machine_kexec,
 	.kexec_cpu_down         = pseries_kexec_cpu_down,
-- 
2.31.1

