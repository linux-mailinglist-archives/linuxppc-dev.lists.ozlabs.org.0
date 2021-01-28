Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D48633073F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 11:45:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRHF80zl8zDsPf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 21:45:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AaBy85W5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRH996134zDr1b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 21:42:21 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10SAWO9E150780; Thu, 28 Jan 2021 05:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TG6pcxXIe1iP0IJ/EM9scPdCse58x6r1qbDlAfbuluo=;
 b=AaBy85W54plLQmiq1W+W0vGHqS2tEIaDvLFEOZuGlet3l1bV8HsyFMOECbhh/lqV+blI
 bk3Al4dxD1Lqcj9P/3huB0LltPiDn5n5p79ag2hwHt0vnfadgUkW9mmHpGvx3dftVsAF
 QFqh7cG7FwSXH12zAWerZHeoxO2Olmsu7/laVCMehCvZ7Vjcx7vN4sPvtYpxEl89MvDT
 5suFalAGrUe07EN60MRB1rqcji4TMgWO6K2igm8KfDHO2Zr0gWETc2TYfb9t8L98t/sd
 n2UF0TgToD/eaQNHxAhnAAR/ZrUNnH/LaRxSFv0T0JlgsU0qrl70q55kZFnAlquzgt53 XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqgwfmtd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 05:42:06 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10SAXb9g155739;
 Thu, 28 Jan 2021 05:42:05 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36bqgwfmt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 05:42:05 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10SAcBqR015552;
 Thu, 28 Jan 2021 10:42:03 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 368b2haewg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Jan 2021 10:42:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10SAg0pg48693530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Jan 2021 10:42:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEDA4A405F;
 Thu, 28 Jan 2021 10:42:00 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13ADCA4054;
 Thu, 28 Jan 2021 10:41:59 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.68.86])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Jan 2021 10:41:58 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 2/2] powerpc/mce: Remove per cpu variables from MCE handlers
Date: Thu, 28 Jan 2021 16:11:43 +0530
Message-Id: <20210128104143.70668-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128104143.70668-1-ganeshgr@linux.ibm.com>
References: <20210128104143.70668-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_05:2021-01-27,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101280050
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
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Access to per-cpu variables requires translation to be enabled on
pseries machine running in hash mmu mode, Since part of MCE handler
runs in realmode and part of MCE handling code is shared between ppc
architectures pseries and powernv, it becomes difficult to manage
these variables differently on different architectures, So have
these variables in paca instead of having them as per-cpu variables
to avoid complications.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: Dynamically allocate memory for machine check event info.

v3: Remove check for hash mmu lpar, use memblock_alloc_try_nid
    to allocate memory.

v4: Spliting the patch into two.

v5: Fix build error for PPC32.
---
 arch/powerpc/include/asm/mce.h     | 18 +++++++
 arch/powerpc/include/asm/paca.h    |  4 ++
 arch/powerpc/kernel/mce.c          | 79 ++++++++++++++++++------------
 arch/powerpc/kernel/setup-common.c |  2 +
 4 files changed, 71 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 7d8b6679ec68..331d944280b8 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -206,6 +206,17 @@ struct mce_error_info {
 
 #define MAX_MC_EVT	10
 
+struct mce_info {
+	int mce_nest_count;
+	struct machine_check_event mce_event[MAX_MC_EVT];
+	/* Queue for delayed MCE events. */
+	int mce_queue_count;
+	struct machine_check_event mce_event_queue[MAX_MC_EVT];
+	/* Queue for delayed MCE UE events. */
+	int mce_ue_count;
+	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
+};
+
 /* Release flags for get_mce_event() */
 #define MCE_EVENT_RELEASE	true
 #define MCE_EVENT_DONTRELEASE	false
@@ -234,4 +245,11 @@ long __machine_check_early_realmode_p8(struct pt_regs *regs);
 long __machine_check_early_realmode_p9(struct pt_regs *regs);
 long __machine_check_early_realmode_p10(struct pt_regs *regs);
 #endif /* CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_PPC_BOOK3S_64
+void mce_init(void);
+#else
+static inline void mce_init(void) { };
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
 #endif /* __ASM_PPC64_MCE_H__ */
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..38e0c55e845d 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -29,6 +29,7 @@
 #include <asm/hmi.h>
 #include <asm/cpuidle.h>
 #include <asm/atomic.h>
+#include <asm/mce.h>
 
 #include <asm-generic/mmiowb_types.h>
 
@@ -273,6 +274,9 @@ struct paca_struct {
 #ifdef CONFIG_MMIOWB
 	struct mmiowb_state mmiowb_state;
 #endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	struct mce_info *mce_info;
+#endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
 extern void copy_mm_to_paca(struct mm_struct *mm);
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 9f3e133b57b7..6ec5c68997ed 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -17,22 +17,13 @@
 #include <linux/irq_work.h>
 #include <linux/extable.h>
 #include <linux/ftrace.h>
+#include <linux/memblock.h>
 
 #include <asm/machdep.h>
 #include <asm/mce.h>
 #include <asm/nmi.h>
 
-static DEFINE_PER_CPU(int, mce_nest_count);
-static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT], mce_event);
-
-/* Queue for delayed MCE events. */
-static DEFINE_PER_CPU(int, mce_queue_count);
-static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT], mce_event_queue);
-
-/* Queue for delayed MCE UE events. */
-static DEFINE_PER_CPU(int, mce_ue_count);
-static DEFINE_PER_CPU(struct machine_check_event[MAX_MC_EVT],
-					mce_ue_event_queue);
+#include "setup.h"
 
 static void machine_check_process_queued_event(struct irq_work *work);
 static void machine_check_ue_irq_work(struct irq_work *work);
@@ -103,9 +94,10 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		    struct mce_error_info *mce_err,
 		    uint64_t nip, uint64_t addr, uint64_t phys_addr)
 {
-	int index = __this_cpu_inc_return(mce_nest_count) - 1;
-	struct machine_check_event *mce = this_cpu_ptr(&mce_event[index]);
+	int index = local_paca->mce_info->mce_nest_count++;
+	struct machine_check_event *mce;
 
+	mce = &local_paca->mce_info->mce_event[index];
 	/*
 	 * Return if we don't have enough space to log mce event.
 	 * mce_nest_count may go beyond MAX_MC_EVT but that's ok,
@@ -191,7 +183,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
  */
 int get_mce_event(struct machine_check_event *mce, bool release)
 {
-	int index = __this_cpu_read(mce_nest_count) - 1;
+	int index = local_paca->mce_info->mce_nest_count - 1;
 	struct machine_check_event *mc_evt;
 	int ret = 0;
 
@@ -201,7 +193,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 
 	/* Check if we have MCE info to process. */
 	if (index < MAX_MC_EVT) {
-		mc_evt = this_cpu_ptr(&mce_event[index]);
+		mc_evt = &local_paca->mce_info->mce_event[index];
 		/* Copy the event structure and release the original */
 		if (mce)
 			*mce = *mc_evt;
@@ -211,7 +203,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 	}
 	/* Decrement the count to free the slot. */
 	if (release)
-		__this_cpu_dec(mce_nest_count);
+		local_paca->mce_info->mce_nest_count--;
 
 	return ret;
 }
@@ -233,13 +225,14 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-	index = __this_cpu_inc_return(mce_ue_count) - 1;
+	index = local_paca->mce_info->mce_ue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_ue_count);
+		local_paca->mce_info->mce_ue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_ue_event_queue[index]), evt, sizeof(*evt));
+	memcpy(&local_paca->mce_info->mce_ue_event_queue[index],
+	       evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
 	irq_work_queue(&mce_ue_event_irq_work);
@@ -256,13 +249,14 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
-	index = __this_cpu_inc_return(mce_queue_count) - 1;
+	index = local_paca->mce_info->mce_queue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_queue_count);
+		local_paca->mce_info->mce_queue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_event_queue[index]), &evt, sizeof(evt));
+	memcpy(&local_paca->mce_info->mce_event_queue[index],
+	       &evt, sizeof(evt));
 
 	/* Queue irq work to process this event later. */
 	irq_work_queue(&mce_event_process_work);
@@ -289,9 +283,9 @@ static void machine_process_ue_event(struct work_struct *work)
 	int index;
 	struct machine_check_event *evt;
 
-	while (__this_cpu_read(mce_ue_count) > 0) {
-		index = __this_cpu_read(mce_ue_count) - 1;
-		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+	while (local_paca->mce_info->mce_ue_count > 0) {
+		index = local_paca->mce_info->mce_ue_count - 1;
+		evt = &local_paca->mce_info->mce_ue_event_queue[index];
 		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
@@ -304,7 +298,7 @@ static void machine_process_ue_event(struct work_struct *work)
 		 */
 		if (evt->error_type == MCE_ERROR_TYPE_UE) {
 			if (evt->u.ue_error.ignore_event) {
-				__this_cpu_dec(mce_ue_count);
+				local_paca->mce_info->mce_ue_count--;
 				continue;
 			}
 
@@ -320,7 +314,7 @@ static void machine_process_ue_event(struct work_struct *work)
 					"was generated\n");
 		}
 #endif
-		__this_cpu_dec(mce_ue_count);
+		local_paca->mce_info->mce_ue_count--;
 	}
 }
 /*
@@ -338,17 +332,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	 * For now just print it to console.
 	 * TODO: log this error event to FSP or nvram.
 	 */
-	while (__this_cpu_read(mce_queue_count) > 0) {
-		index = __this_cpu_read(mce_queue_count) - 1;
-		evt = this_cpu_ptr(&mce_event_queue[index]);
+	while (local_paca->mce_info->mce_queue_count > 0) {
+		index = local_paca->mce_info->mce_queue_count - 1;
+		evt = &local_paca->mce_info->mce_event_queue[index];
 
 		if (evt->error_type == MCE_ERROR_TYPE_UE &&
 		    evt->u.ue_error.ignore_event) {
-			__this_cpu_dec(mce_queue_count);
+			local_paca->mce_info->mce_queue_count--;
 			continue;
 		}
 		machine_check_print_event_info(evt, false, false);
-		__this_cpu_dec(mce_queue_count);
+		local_paca->mce_info->mce_queue_count--;
 	}
 }
 
@@ -741,3 +735,24 @@ long hmi_exception_realmode(struct pt_regs *regs)
 
 	return 1;
 }
+
+void __init mce_init(void)
+{
+	struct mce_info *mce_info;
+	u64 limit;
+	int i;
+
+	limit = min(ppc64_bolted_size(), ppc64_rma_size);
+	for_each_possible_cpu(i) {
+		mce_info = memblock_alloc_try_nid(sizeof(*mce_info),
+						  __alignof__(*mce_info),
+						  MEMBLOCK_LOW_LIMIT,
+						  limit, cpu_to_node(i));
+		if (!mce_info)
+			goto err;
+		paca_ptrs[i]->mce_info = mce_info;
+	}
+	return;
+err:
+	panic("Failed to allocate memory for MCE event data\n");
+}
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 71f38e9248be..d480f091e0ad 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -64,6 +64,7 @@
 #include <asm/mmu_context.h>
 #include <asm/cpu_has_feature.h>
 #include <asm/kasan.h>
+#include <asm/mce.h>
 
 #include "setup.h"
 
@@ -938,6 +939,7 @@ void __init setup_arch(char **cmdline_p)
 	exc_lvl_early_init();
 	emergency_stack_init();
 
+	mce_init();
 	smp_release_cpus();
 
 	initmem_init();
-- 
2.26.2

