Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A612CEC26
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 11:28:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnTS20l20zDr3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=EPMwt0bR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnTPk3z7YzDr0v
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 21:26:02 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4A2D0f019368; Fri, 4 Dec 2020 05:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=3u1NWuTTz0f+VRk2i0tyekmqSKwodbZ0RAz+lM8KwLg=;
 b=EPMwt0bRDoiKHx8agRqZBAC11otNu1vvziHz4ENCZ7mt0V4A/dhK2ZTq4ICSyjtQLUBV
 ekv4EmDWzPxH0g1XKBGVBEbALU5GouU7oy9MLDf3eczHDDxJbAx9FnOFAKOA8B2qfHzh
 gneQFDqt3c6SvlPtP1BJ4VbiLY8ddoCHVnTU5U6YVApixPO/cuRFfW6VW5WxMRvKPAb9
 GfdhECZhIZyDNnoaeNsE0gY7z9wNaQIKWVrO/mkG52+s3sU3RXvlmD51KrVnuolhdDqQ
 EDKlwR1PVoV0CjWTykCgBS14Z7HhLVW15ORSah9QGCPIu1+777uv8BqIgC1ckMjKXPff xg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357h7g46nd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 05:25:55 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B4A2QbC020923;
 Fri, 4 Dec 2020 05:25:55 -0500
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357h7g46mv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 05:25:55 -0500
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4AHC3K020605;
 Fri, 4 Dec 2020 10:25:53 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 353e689388-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 10:25:53 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4ANLSM26804514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 10:23:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAADDAE04D;
 Fri,  4 Dec 2020 10:23:20 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C00BAE051;
 Fri,  4 Dec 2020 10:23:19 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.71.200])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  4 Dec 2020 10:23:19 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mce: Remove per cpu variables from MCE handlers
Date: Fri,  4 Dec 2020 15:53:10 +0530
Message-Id: <20201204102310.76213-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_03:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 suspectscore=2 spamscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040057
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
 arch/powerpc/include/asm/mce.h  |  2 +-
 arch/powerpc/include/asm/paca.h | 12 ++++++++
 arch/powerpc/kernel/mce.c       | 54 +++++++++++++--------------------
 3 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
index 89aa8248a57d..feef45f2b51b 100644
--- a/arch/powerpc/include/asm/mce.h
+++ b/arch/powerpc/include/asm/mce.h
@@ -204,7 +204,7 @@ struct mce_error_info {
 	bool			ignore_event;
 };
 
-#define MAX_MC_EVT	100
+#define MAX_MC_EVT	10
 
 /* Release flags for get_mce_event() */
 #define MCE_EVENT_RELEASE	true
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index 9454d29ff4b4..4769954efa7d 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -29,6 +29,7 @@
 #include <asm/hmi.h>
 #include <asm/cpuidle.h>
 #include <asm/atomic.h>
+#include <asm/mce.h>
 
 #include <asm-generic/mmiowb_types.h>
 
@@ -273,6 +274,17 @@ struct paca_struct {
 #ifdef CONFIG_MMIOWB
 	struct mmiowb_state mmiowb_state;
 #endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	int mce_nest_count;
+	struct machine_check_event mce_event[MAX_MC_EVT];
+	/* Queue for delayed MCE events. */
+	int mce_queue_count;
+	struct machine_check_event mce_event_queue[MAX_MC_EVT];
+
+	/* Queue for delayed MCE UE events. */
+	int mce_ue_count;
+	struct machine_check_event  mce_ue_event_queue[MAX_MC_EVT];
+#endif /* CONFIG_PPC_BOOK3S_64 */
 } ____cacheline_aligned;
 
 extern void copy_mm_to_paca(struct mm_struct *mm);
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index 63702c0badb9..5f53d02d6cbb 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -22,18 +22,6 @@
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
@@ -103,8 +91,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
 		    struct mce_error_info *mce_err,
 		    uint64_t nip, uint64_t addr, uint64_t phys_addr)
 {
-	int index = __this_cpu_inc_return(mce_nest_count) - 1;
-	struct machine_check_event *mce = this_cpu_ptr(&mce_event[index]);
+	int index = get_paca()->mce_nest_count++;
+	struct machine_check_event *mce = &get_paca()->mce_event[index];
 
 	/*
 	 * Return if we don't have enough space to log mce event.
@@ -191,7 +179,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
  */
 int get_mce_event(struct machine_check_event *mce, bool release)
 {
-	int index = __this_cpu_read(mce_nest_count) - 1;
+	int index = get_paca()->mce_nest_count - 1;
 	struct machine_check_event *mc_evt;
 	int ret = 0;
 
@@ -201,7 +189,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 
 	/* Check if we have MCE info to process. */
 	if (index < MAX_MC_EVT) {
-		mc_evt = this_cpu_ptr(&mce_event[index]);
+		mc_evt = &get_paca()->mce_event[index];
 		/* Copy the event structure and release the original */
 		if (mce)
 			*mce = *mc_evt;
@@ -211,7 +199,7 @@ int get_mce_event(struct machine_check_event *mce, bool release)
 	}
 	/* Decrement the count to free the slot. */
 	if (release)
-		__this_cpu_dec(mce_nest_count);
+		get_paca()->mce_nest_count--;
 
 	return ret;
 }
@@ -233,13 +221,13 @@ static void machine_check_ue_event(struct machine_check_event *evt)
 {
 	int index;
 
-	index = __this_cpu_inc_return(mce_ue_count) - 1;
+	index = get_paca()->mce_ue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_ue_count);
+		get_paca()->mce_ue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_ue_event_queue[index]), evt, sizeof(*evt));
+	memcpy(&get_paca()->mce_ue_event_queue[index], evt, sizeof(*evt));
 
 	/* Queue work to process this event later. */
 	irq_work_queue(&mce_ue_event_irq_work);
@@ -256,13 +244,13 @@ void machine_check_queue_event(void)
 	if (!get_mce_event(&evt, MCE_EVENT_RELEASE))
 		return;
 
-	index = __this_cpu_inc_return(mce_queue_count) - 1;
+	index = get_paca()->mce_queue_count++;
 	/* If queue is full, just return for now. */
 	if (index >= MAX_MC_EVT) {
-		__this_cpu_dec(mce_queue_count);
+		get_paca()->mce_queue_count--;
 		return;
 	}
-	memcpy(this_cpu_ptr(&mce_event_queue[index]), &evt, sizeof(evt));
+	memcpy(&get_paca()->mce_event_queue[index], &evt, sizeof(evt));
 
 	/* Queue irq work to process this event later. */
 	irq_work_queue(&mce_event_process_work);
@@ -289,9 +277,9 @@ static void machine_process_ue_event(struct work_struct *work)
 	int index;
 	struct machine_check_event *evt;
 
-	while (__this_cpu_read(mce_ue_count) > 0) {
-		index = __this_cpu_read(mce_ue_count) - 1;
-		evt = this_cpu_ptr(&mce_ue_event_queue[index]);
+	while (get_paca()->mce_ue_count > 0) {
+		index = get_paca()->mce_ue_count - 1;
+		evt = &get_paca()->mce_ue_event_queue[index];
 		blocking_notifier_call_chain(&mce_notifier_list, 0, evt);
 #ifdef CONFIG_MEMORY_FAILURE
 		/*
@@ -304,7 +292,7 @@ static void machine_process_ue_event(struct work_struct *work)
 		 */
 		if (evt->error_type == MCE_ERROR_TYPE_UE) {
 			if (evt->u.ue_error.ignore_event) {
-				__this_cpu_dec(mce_ue_count);
+				get_paca()->mce_ue_count--;
 				continue;
 			}
 
@@ -320,7 +308,7 @@ static void machine_process_ue_event(struct work_struct *work)
 					"was generated\n");
 		}
 #endif
-		__this_cpu_dec(mce_ue_count);
+		get_paca()->mce_ue_count--;
 	}
 }
 /*
@@ -338,17 +326,17 @@ static void machine_check_process_queued_event(struct irq_work *work)
 	 * For now just print it to console.
 	 * TODO: log this error event to FSP or nvram.
 	 */
-	while (__this_cpu_read(mce_queue_count) > 0) {
-		index = __this_cpu_read(mce_queue_count) - 1;
-		evt = this_cpu_ptr(&mce_event_queue[index]);
+	while (get_paca()->mce_queue_count > 0) {
+		index = get_paca()->mce_queue_count - 1;
+		evt = &get_paca()->mce_event_queue[index];
 
 		if (evt->error_type == MCE_ERROR_TYPE_UE &&
 		    evt->u.ue_error.ignore_event) {
-			__this_cpu_dec(mce_queue_count);
+			get_paca()->mce_queue_count--;
 			continue;
 		}
 		machine_check_print_event_info(evt, false, false);
-		__this_cpu_dec(mce_queue_count);
+		get_paca()->mce_queue_count--;
 	}
 }
 
-- 
2.26.2

