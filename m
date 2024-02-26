Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A08669E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 07:08:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0nL2MBm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjqtm6XwGz3cDk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:08:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s0nL2MBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjqsF43wFz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 17:07:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q4LY3C031126;
	Mon, 26 Feb 2024 06:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O4lJBfWtl9lGgpSpL1VF3sm7vtvO0wsKH+FsEXWVqpI=;
 b=s0nL2MBmAd5EvMr4hEGkYB5/mkr3w3nBfGyJuS8dr6kPw0Q44mPcttQA80l4dbxx8aYe
 hYOKPAwjMBUHhcTvC+r0LyqOZ2fI1tLS/VKyQse65h4DkiCDljhSBAi0Ir4Fiin+enom
 R5rBj3VLr44L+VEsS7tJ8A2zMhNXkI8IDXevJ2K55M8dwBVJx4f5SjhqRyA1F+ezhiuY
 o54fHE8jCwEIdHBHxhV3FiyZPnP7X8oD6LFHsY/Y9vTDgUNOigE4cnwmv+8rlIDjksPT
 AGFuv6mYDUGks0NdhqqDQR2BV6BLBNLfi9M3GAalyyvONQ0YFbKJtbgza8URI4AHQFjc ig== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wg7cjkn1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:07:24 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q35rDT024154;
	Mon, 26 Feb 2024 06:07:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wfw0jxsbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 06:07:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41Q67I1K56361326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 06:07:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10B2720040;
	Mon, 26 Feb 2024 06:07:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB9B32004D;
	Mon, 26 Feb 2024 06:07:14 +0000 (GMT)
Received: from tp-ibm-com.ibmuc.com (unknown [9.171.51.48])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 06:07:14 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/1] powerpc/eeh: Enable PHBs to recovery in parallel
Date: Mon, 26 Feb 2024 11:37:05 +0530
Message-ID: <20240226060705.146261-2-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226060705.146261-1-ganeshgr@linux.ibm.com>
References: <20240226060705.146261-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yv4MC3J82vVopNrQI4OFgGDtKyrot0Jq
X-Proofpoint-GUID: yv4MC3J82vVopNrQI4OFgGDtKyrot0Jq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_03,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402260044
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currnetly, With a single event queue EEH recovery is entirely
serialized and takes place within a single kernel thread. This
can cause recovery to take a long time when there are many
devices.

Have the recovery event queue per PHB and allow the recovery to
happen independently from other PHBs.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh_event.h  |  7 +++++
 arch/powerpc/include/asm/pci-bridge.h |  4 +++
 arch/powerpc/kernel/eeh_driver.c      | 27 +++++++++++++++++--
 arch/powerpc/kernel/eeh_event.c       | 38 ++++++++++++++++++++++++++-
 arch/powerpc/kernel/eeh_pe.c          |  4 +++
 5 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh_event.h b/arch/powerpc/include/asm/eeh_event.h
index dadde7d52f46..6af1b5bb6103 100644
--- a/arch/powerpc/include/asm/eeh_event.h
+++ b/arch/powerpc/include/asm/eeh_event.h
@@ -8,6 +8,8 @@
 #define ASM_POWERPC_EEH_EVENT_H
 #ifdef __KERNEL__
 
+#include <linux/workqueue.h>
+
 /*
  * structure holding pci controller data that describes a
  * change in the isolation status of a PCI slot.  A pointer
@@ -15,15 +17,20 @@
  * callback.
  */
 struct eeh_event {
+	struct work_struct	work;
 	struct list_head	list;	/* to form event queue	*/
 	struct eeh_pe		*pe;	/* EEH PE		*/
 };
 
+extern spinlock_t eeh_eventlist_lock;
+
 int eeh_event_init(void);
+int eeh_phb_event(struct eeh_pe *pe);
 int eeh_send_failure_event(struct eeh_pe *pe);
 int __eeh_send_failure_event(struct eeh_pe *pe);
 void eeh_remove_event(struct eeh_pe *pe, bool force);
 void eeh_handle_normal_event(struct eeh_pe *pe);
+void eeh_handle_normal_event_work(struct work_struct *work);
 void eeh_handle_special_event(void);
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index 2aa3a091ef20..61884d9398bf 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -138,6 +138,10 @@ struct pci_controller {
 
 	/* iommu_ops support */
 	struct iommu_device	iommu;
+
+	bool eeh_in_progress;
+	struct list_head eeh_eventlist;
+	spinlock_t eeh_eventlist_lock;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 48773d2d9be3..d5612303766e 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -1107,6 +1107,30 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
 }
 
+void eeh_handle_normal_event_work(struct work_struct *work)
+{
+	unsigned long flags;
+	struct eeh_event *event = container_of(work, struct eeh_event, work);
+	struct pci_controller *phb = event->pe->phb;
+
+	eeh_handle_normal_event(event->pe);
+
+	kfree(event);
+	spin_lock_irqsave(&phb->eeh_eventlist_lock, flags);
+	WARN_ON_ONCE(!phb->eeh_in_progress);
+	if (list_empty(&phb->eeh_eventlist)) {
+		phb->eeh_in_progress = false;
+		pr_debug("EEH: No more work to do\n");
+	} else {
+		pr_warn("EEH: More work to do\n");
+		event = list_entry(phb->eeh_eventlist.next,
+				   struct eeh_event, list);
+		list_del(&event->list);
+		queue_work(system_unbound_wq, &event->work);
+	}
+	spin_unlock_irqrestore(&phb->eeh_eventlist_lock, flags);
+}
+
 /**
  * eeh_handle_special_event - Handle EEH events without a specific failing PE
  *
@@ -1176,8 +1200,7 @@ void eeh_handle_special_event(void)
 		 */
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
-			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
-			eeh_handle_normal_event(pe);
+			eeh_phb_event(pe);
 		} else {
 			eeh_for_each_pe(pe, tmp_pe)
 				eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index c23a454af08a..86c0a988389e 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -22,7 +22,7 @@
  *  work-queue, where a worker thread can drive recovery.
  */
 
-static DEFINE_SPINLOCK(eeh_eventlist_lock);
+DEFINE_SPINLOCK(eeh_eventlist_lock);
 static DECLARE_COMPLETION(eeh_eventlist_event);
 static LIST_HEAD(eeh_eventlist);
 
@@ -91,6 +91,42 @@ int eeh_event_init(void)
 	return 0;
 }
 
+int eeh_phb_event(struct eeh_pe *pe)
+{
+	struct eeh_event *event;
+	unsigned long flags;
+	struct pci_controller *phb;
+
+	event = kzalloc(sizeof(*event), GFP_ATOMIC);
+	if (!event)
+		return -ENOMEM;
+
+	if (pe) {
+		phb = pe->phb;
+		event->pe = pe;
+		INIT_WORK(&event->work, eeh_handle_normal_event_work);
+		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
+		pr_err("EEH: EVENT=ERROR_DETECTED PHB=%#x PE=%#x\n",
+		       phb->global_number, pe->addr);
+		spin_lock_irqsave(&phb->eeh_eventlist_lock, flags);
+		if (phb->eeh_in_progress) {
+			pr_info("EEH: EEH already in progress on this PHB, queueing.\n");
+			list_add(&event->list, &phb->eeh_eventlist);
+		} else {
+			pr_info("EEH: Beginning recovery on this PHB.\n");
+			WARN_ON_ONCE(!list_empty(&phb->eeh_eventlist));
+			phb->eeh_in_progress = true;
+			queue_work(system_unbound_wq, &event->work);
+		}
+		spin_unlock_irqrestore(&phb->eeh_eventlist_lock, flags);
+	} else {
+		spin_lock_irqsave(&eeh_eventlist_lock, flags);
+		list_add(&event->list, &eeh_eventlist);
+		complete(&eeh_eventlist_event);
+		spin_unlock_irqrestore(&eeh_eventlist_lock, flags);
+	}
+	return 0;
+}
 /**
  * eeh_send_failure_event - Generate a PCI error event
  * @pe: EEH PE
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index e0ce81279624..a72b76241112 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -81,6 +81,10 @@ int eeh_phb_pe_create(struct pci_controller *phb)
 {
 	struct eeh_pe *pe;
 
+	phb->eeh_in_progress = false;
+	INIT_LIST_HEAD(&phb->eeh_eventlist);
+	spin_lock_init(&phb->eeh_eventlist_lock);
+
 	/* Allocate PHB PE */
 	pe = eeh_pe_alloc(phb, EEH_PE_PHB);
 	if (!pe) {
-- 
2.43.2

