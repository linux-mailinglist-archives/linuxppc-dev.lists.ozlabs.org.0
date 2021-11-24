Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7C45B7D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:56:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzby66vF2z3c8R
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:56:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n9MO57NH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n9MO57NH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbwX3mnrz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:55:24 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AO9kTid024157; 
 Wed, 24 Nov 2021 09:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=g90Wt3/4kTFHQS8a07W8eug8K7pKBdQ6xt1QZGZHVw4=;
 b=n9MO57NHsoFBygzZMITkGlAbHPmt8543B64SkHERu4oHMB69Ow6olNhsIgIVUqm6vWlo
 I6O0OolysIGU5ZBI5QCuFw1wHQo/Oh/rocRUJvahXJhqQ1CY9MlzwgrUctr564Zi+VDo
 3B/UryUQOWugnfrs1jVxKDmDTzDKW3a4NoD22qY0I9UnFhw/nFNfY389jcTGA/9UG7F7
 X6FOGe2PJkHfJzeqWhNJ3ZutNfGess/v7l2QWn1vt/rfLEH0/saLTC5/+sgniIrFfV8Q
 wsUOg1aj8iARjlAZ6eImqZPu/frn6IwLZKUdsfxKZaZJZGXAc32D0560peKNiH38+Bem RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chk2c0593-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:16 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AO9m0cQ030481;
 Wed, 24 Nov 2021 09:55:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3chk2c058m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AO9rDv2022710;
 Wed, 24 Nov 2021 09:55:13 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 3cernayuuk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 09:55:13 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AO9tAB418481618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 09:55:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D019D5205A;
 Wed, 24 Nov 2021 09:55:09 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name
 (unknown [9.43.72.119])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5E4F55204E;
 Wed, 24 Nov 2021 09:55:06 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 1/2] powerpc/mce: Avoid using irq_work_queue() in realmode
Date: Wed, 24 Nov 2021 15:24:59 +0530
Message-Id: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zitctRSK9TyvoeCNJNXy94ph4QRfH-Ud
X-Proofpoint-GUID: 3A42KWLrC7vNSWjz_xfVa5D0X_6qAv6r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_03,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240053
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
---
 arch/powerpc/include/asm/machdep.h       |  2 +
 arch/powerpc/include/asm/mce.h           |  2 +
 arch/powerpc/include/asm/paca.h          |  1 +
 arch/powerpc/kernel/mce.c                | 51 +++++++++++-------------
 arch/powerpc/kernel/time.c               |  3 ++
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 arch/powerpc/platforms/pseries/ras.c     | 31 +-------------
 arch/powerpc/platforms/pseries/setup.c   |  1 +
 8 files changed, 34 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 9c3c9f04129f..d22b222ba471 100644
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
index 331d944280b8..6e306aaf58aa 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -235,8 +235,10 @@ extern void machine_check_print_event_info(struct machine_check_event *evt,
 unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
 extern void mce_common_process_ue(struct pt_regs *regs,
 				  struct mce_error_info *mce_err);
+void machine_check_raise_dec_intr(void);
 int mce_register_notifier(struct notifier_block *nb);
 int mce_unregister_notifier(struct notifier_block *nb);
+void mce_run_late_handlers(void);
 #ifdef CONFIG_PPC_BOOK3S_64
 void flush_and_reload_slb(void);
 void flush_erat(void);
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index dc05a862e72a..d463c796f7fa 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -280,6 +280,7 @@ struct paca_struct {
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	struct mce_info *mce_info;
+	u32 mces_to_process;
 #endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index fd829f7f25a4..8e17f29472a0 100644
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
@@ -89,6 +79,12 @@ static void mce_set_error_info(struct machine_check_event *mce,
 	}
 }
 
+/* Raise decrementer interrupt */
+void machine_check_raise_dec_intr(void)
+{
+	arch_irq_work_raise();
+}
+
 /*
  * Decode and save high level MCE information into per cpu buffer which
  * is an array of machine_check_event structure.
@@ -135,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 	if (mce->error_type == MCE_ERROR_TYPE_UE)
 		mce->u.ue_error.ignore_event = mce_err->ignore_event;
 
+	local_paca->mces_to_process++;
+
 	if (!addr)
 		return;
 
@@ -217,7 +215,7 @@ void release_mce_event(void)
 	get_mce_event(NULL, true);
 }
 
-static void machine_check_ue_irq_work(struct irq_work *work)
+static void machine_check_ue_work(void)
 {
 	schedule_work(&mce_ue_event_work);
 }
@@ -239,7 +237,7 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
-	irq_work_queue(&mce_ue_event_irq_work);
+	machine_check_raise_dec_intr();
 }
 
 /*
@@ -249,7 +247,6 @@ void machine_check_queue_event(void)
 {
 	int index;
 	struct machine_check_event evt;
-	unsigned long msr;
 
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
@@ -263,20 +260,7 @@ void machine_check_queue_event(void)
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
+	machine_check_raise_dec_intr();
 }
 
 void mce_common_process_ue(struct pt_regs *regs,
@@ -338,7 +322,7 @@ static void machine_process_ue_event(struct work_struct *work)
  * process pending MCE event from the mce event queue. This function will be
  * called during syscall exit.
  */
-static void machine_check_process_queued_event(struct irq_work *work)
+static void machine_check_process_queued_event(void)
 {
 	int index;
 	struct machine_check_event *evt;
@@ -363,6 +347,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	}
 }
 
+void mce_run_late_handlers(void)
+{
+	if (unlikely(local_paca->mces_to_process)) {
+		if (ppc_md.machine_check_log_err)
+			ppc_md.machine_check_log_err();
+		machine_check_process_queued_event();
+		machine_check_ue_work();
+		local_paca->mces_to_process--;
+	}
+}
+
 void machine_check_print_event_info(struct machine_check_event *evt,
 				    bool user_mode, bool in_guest)
 {
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index cae8f03a44fe..94c591b6f9d2 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -594,6 +594,9 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
 
 	if (test_irq_work_pending()) {
 		clear_irq_work_pending();
+#ifdef CONFIG_PPC_BOOK3S_64
+		mce_run_late_handlers();
+#endif
 		irq_work_run();
 	}
 
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3544778e06d0..9cf0d33dfbf5 100644
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
index 56092dccfdb8..8613f9cc5798 100644
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
 
@@ -729,40 +724,16 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
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
index 8a62af5b9c24..9bdc487b8e35 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1084,6 +1084,7 @@ define_machine(pseries) {
 	.system_reset_exception = pSeries_system_reset_exception,
 	.machine_check_early	= pseries_machine_check_realmode,
 	.machine_check_exception = pSeries_machine_check_exception,
+	.machine_check_log_err	= pSeries_machine_check_log_err,
 #ifdef CONFIG_KEXEC_CORE
 	.machine_kexec          = pSeries_machine_kexec,
 	.kexec_cpu_down         = pseries_kexec_cpu_down,
-- 
2.31.1

