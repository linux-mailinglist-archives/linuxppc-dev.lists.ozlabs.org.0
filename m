Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5002ECF03
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 12:50:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBPgc3CKJzDr7B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 22:50:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jmU+8u3h; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBPZw5CybzDr6l
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jan 2021 22:46:32 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 107Amkbi135711; Thu, 7 Jan 2021 06:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=kUHKC8Ouu5hkPT7SgwvRQkbJKMe+bQqCf0tKTXgtduo=;
 b=jmU+8u3hNmQQHo7WrkRCGgND/vkoWkC363O4xPbHQUNSWXgE/F8IlVFYHKdJxbTLrJWD
 Xk/3rglbbzxT4RwE7YOIfBpTs0XILmYYHGwq7zPaUTgNAC4WPoKZWd9KVs6HH3mdd672
 EApisGtDWLlcGZPqF6Slkts54rxbklqo+X72uFzAG5D1Tl97TeMYpA9+uuFIVHt/CdaA
 baFRxBECL7ubrh2i6Q5tyNdzaHVnIsVxOFDyXMvG4bJKRpVmn0fYCwe+SiEZXI4413MP
 uLr6jqdrIcAPXDH4Nzhd5GXGF2j/aVeNjZaqop8CigBmf1cMOA8CRcEDhJQjvVo5L2GD dA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x0vj8cfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 06:01:04 -0500
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 107Anca2139440;
 Thu, 7 Jan 2021 06:01:04 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35x0vj8cds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 06:01:03 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 107AqrMH027552;
 Thu, 7 Jan 2021 11:01:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 35va37hajb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jan 2021 11:01:01 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 107B0w4W28967168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Jan 2021 11:00:58 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D003AE045;
 Thu,  7 Jan 2021 11:00:58 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD9DAAE05D;
 Thu,  7 Jan 2021 11:00:56 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.175])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  7 Jan 2021 11:00:56 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/mce: Remove per cpu variables from MCE handlers
Date: Thu,  7 Jan 2021 16:30:17 +0530
Message-Id: <20210107110017.62938-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-07_05:2021-01-07,
 2021-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101070059
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

Maximum recursive depth of MCE is 4, Considering the maximum depth
allowed reduce the size of event to 10 from 100.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: Dynamically allocate memory for machine check event info
---
 arch/powerpc/include/asm/mce.h     | 21 +++++++-
 arch/powerpc/include/asm/paca.h    |  4 ++
 arch/powerpc/kernel/mce.c          | 86 ++++++++++++++++++------------
 arch/powerpc/kernel/setup-common.c |  2 +-
 4 files changed, 78 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index e6c27ae843dc..8d6e3a7a9f37 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -204,7 +204,18 @@ struct mce_error_info {
 	bool			ignore_event;
 };
 
-#define MAX_MC_EVT	100
+#define MAX_MC_EVT	10
+
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
 
 /* Release flags for get_mce_event() */
 #define MCE_EVENT_RELEASE	true
@@ -233,5 +244,13 @@ long __machine_check_early_realmode_p7(struct pt_regs *regs);
 long __machine_check_early_realmode_p8(struct pt_regs *regs);
 long __machine_check_early_realmode_p9(struct pt_regs *regs);
 long __machine_check_early_realmode_p10(struct pt_regs *regs);
+#define get_mce_info() local_paca->mce_info
+#endif /* CONFIG_PPC_BOOK3S_64 */
+
+#ifdef CONFIG_PPC_BOOK3S_64
+void mce_init(void);
+#else
+static inline void mce_init(void) { };
 #endif /* CONFIG_PPC_BOOK3S_64 */
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
index 9f3e133b57b7..14142ddbedf2 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -17,23 +17,12 @@
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
-
 static void machine_check_process_queued_event(struct irq_work *work);
 static void machine_check_ue_irq_work(struct irq_work *work);
 static void machine_check_ue_event(struct machine_check_event *evt);
@@ -103,8 +92,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		    struct mce_error_info *mce_err,
 		    uint64_t nip, uint64_t addr, uint64_t phys_addr)
 {
-	int index = __this_cpu_inc_return(mce_nest_count) - 1;
-	struct machine_check_event *mce = this_cpu_ptr(&mce_event[index]);
+	int index = get_mce_info()->mce_nest_count++;
+	struct machine_check_event *mce = &get_mce_info()->mce_event[index];
 
 	/*
 	 * Return if we don't have enough space to log mce event.
@@ -191,7 +180,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
  */
 int get_mce_event(struct machine_check_event *mce, bool release)
 {
-	int index = __this_cpu_read(mce_nest_count) - 1;
+	int index = get_mce_info()->mce_nest_count - 1;
 	struct machine_check_event *mc_evt;
 	int ret = 0;
 
@@ -201,7 +190,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 
 	/* Check if we have MCE info to process. */
 	if (index < MAX_MC_EVT) {
-		mc_evt = this_cpu_ptr(&mce_event[index]);
+		mc_evt = &get_mce_info()->mce_event[index];
 		/* Copy the event structure and release the original */
 		if (mce)
 			*mce = *mc_evt;
@@ -211,7 +200,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 	}
 	/* Decrement the count to free the slot. */
 	if (release)
-		__this_cpu_dec(mce_nest_count);
+		get_mce_info()->mce_nest_count--;
 
 	return ret;
 }
@@ -233,13 +222,13 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-	index = __this_cpu_inc_return(mce_ue_count) - 1;
+	index = get_mce_info()->mce_ue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_ue_count);
+		get_mce_info()->mce_ue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_ue_event_queue[index]), evt, sizeof(*evt));
+	memcpy(&get_mce_info()->mce_ue_event_queue[index], evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
 	irq_work_queue(&mce_ue_event_irq_work);
@@ -256,13 +245,13 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
-	index = __this_cpu_inc_return(mce_queue_count) - 1;
+	index = get_mce_info()->mce_queue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_queue_count);
+		get_mce_info()->mce_queue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_event_queue[index]), &evt, sizeof(evt));
+	memcpy(&get_mce_info()->mce_event_queue[index], &evt, sizeof(evt));
 
 	/* Queue irq work to process this event later. */
 	irq_work_queue(&mce_event_process_work);
@@ -289,9 +278,9 @@ static void machine_process_ue_event(struct work_struct *work)
 	int index;
 	struct machine_check_event *evt;
 
-	while (__this_cpu_read(mce_ue_count) > 0) {
-		index = __this_cpu_read(mce_ue_count) - 1;
-		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+	while (get_mce_info()->mce_ue_count > 0) {
+		index = get_mce_info()->mce_ue_count - 1;
+		evt = &get_mce_info()->mce_ue_event_queue[index];
 		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
@@ -304,7 +293,7 @@ static void machine_process_ue_event(struct work_struct *work)
 		 */
 		if (evt->error_type == MCE_ERROR_TYPE_UE) {
 			if (evt->u.ue_error.ignore_event) {
-				__this_cpu_dec(mce_ue_count);
+				get_mce_info()->mce_ue_count--;
 				continue;
 			}
 
@@ -320,7 +309,7 @@ static void machine_process_ue_event(struct work_struct *work)
 					"was generated\n");
 		}
 #endif
-		__this_cpu_dec(mce_ue_count);
+		get_mce_info()->mce_ue_count--;
 	}
 }
 /*
@@ -338,17 +327,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	 * For now just print it to console.
 	 * TODO: log this error event to FSP or nvram.
 	 */
-	while (__this_cpu_read(mce_queue_count) > 0) {
-		index = __this_cpu_read(mce_queue_count) - 1;
-		evt = this_cpu_ptr(&mce_event_queue[index]);
+	while (get_mce_info()->mce_queue_count > 0) {
+		index = get_mce_info()->mce_queue_count - 1;
+		evt = &get_mce_info()->mce_event_queue[index];
 
 		if (evt->error_type == MCE_ERROR_TYPE_UE &&
 		    evt->u.ue_error.ignore_event) {
-			__this_cpu_dec(mce_queue_count);
+			get_mce_info()->mce_queue_count--;
 			continue;
 		}
 		machine_check_print_event_info(evt, false, false);
-		__this_cpu_dec(mce_queue_count);
+		get_mce_info()->mce_queue_count--;
 	}
 }
 
@@ -741,3 +730,34 @@ long hmi_exception_realmode(struct pt_regs *regs)
 
 	return 1;
 }
+
+void __init mce_init(void)
+{
+	int i, size;
+	struct mce_info *mce_info;
+
+	if (!radix_enabled() && firmware_has_feature(FW_FEATURE_LPAR)) {
+		size = sizeof(struct mce_info) * num_possible_cpus();
+		mce_info = memblock_alloc_try_nid(size, sizeof(struct mce_info),
+						  MEMBLOCK_LOW_LIMIT,
+						  ppc64_rma_size,
+						  NUMA_NO_NODE);
+		if (!mce_info)
+			goto err;
+		for_each_possible_cpu(i)
+			paca_ptrs[i]->mce_info = mce_info + i;
+		return;
+	}
+	for_each_possible_cpu(i) {
+		mce_info =
+		      memblock_alloc_node(sizeof(struct mce_info),
+					  __alignof__(*paca_ptrs[i]->mce_info),
+					  cpu_to_node(i));
+		if (!mce_info)
+			goto err;
+		paca_ptrs[i]->mce_info = mce_info;
+	}
+	return;
+err:
+	panic("Failed allocate memory MCE event data\n");
+}
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 71f38e9248be..17dc451f0e45 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -916,7 +916,6 @@ void __init setup_arch(char **cmdline_p)
 	/* On BookE, setup per-core TLB data structures. */
 	setup_tlb_core_data();
 #endif
-
 	/* Print various info about the machine that has been gathered so far. */
 	print_system_info();
 
@@ -938,6 +937,7 @@ void __init setup_arch(char **cmdline_p)
 	exc_lvl_early_init();
 	emergency_stack_init();
 
+	mce_init();
 	smp_release_cpus();
 
 	initmem_init();
-- 
2.26.2

