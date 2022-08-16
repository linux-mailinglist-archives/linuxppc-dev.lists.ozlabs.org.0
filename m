Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C227594F0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 05:30:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6Gqs0LJWz3cfv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 13:30:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gba5NpMJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gba5NpMJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Gmz4YJfz2y8Q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 13:27:47 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27G1sZQP007021;
	Tue, 16 Aug 2022 03:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=80O4I3mKKR+hNzP8N8zMoUqroLgVs3z/K5TosXFIjYU=;
 b=gba5NpMJQ6aO332O7Ii0Sa4GqwRRP5Tl9MTDWnYmxMJfKD5gLSZJ40WgczYgnbEfuWmj
 cUW6NV1MygmFA5QJFEWdX0f842oenc0lZunq896q8TNhx9CNsFCrVQA5k+xFLFup7Dwa
 znrZRo88ua3lJb4gCg0Z1015d3UkX811qCc2BLFs7ZjLyXRJW+2q7dDgYuwjdKMoS6Np
 I8hmFzYZptgJy9RtS1TsDOP1cEWfqkW17ZZ3gE5/nuVrLMWBj9HnKcGRBcseZguZ0Qn+
 ejaQJ1zs8fbFYlAsHeOatRuyMemE7JHuCni9LffP7aqlZJlwXKXigekkxAaAjEUZ8n/A MQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3j02061k5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 03:27:42 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27G3KfTh022491;
	Tue, 16 Aug 2022 03:27:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3hx3k91xs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Aug 2022 03:27:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27G3RaeJ34537848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Aug 2022 03:27:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C9BAE051;
	Tue, 16 Aug 2022 03:27:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B17CAE045;
	Tue, 16 Aug 2022 03:27:34 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.domain.name (unknown [9.43.31.7])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 16 Aug 2022 03:27:34 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC 3/3] powerpc/eeh: Asynchronous recovery
Date: Tue, 16 Aug 2022 08:57:16 +0530
Message-Id: <20220816032716.108297-4-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
References: <20220816032716.108297-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4CDX4wxZYTjjSKcJVuA8gbOclV8MzN7I
X-Proofpoint-GUID: 4CDX4wxZYTjjSKcJVuA8gbOclV8MzN7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208160011
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

Based on the original work from Sam Bobroff.

Currently, EEH recovery is entirely serialized and takes place within
a single kernel thread. This can cause recovery to take a long time
when there are many devices.

To shorten recovery time, this change allows recovery to proceed in
parallel in two ways:
- Each PHB is given it's own recovery event queue and can be recovered
independently from other PHBs.
- Driver handlers are called in parallel, but with the constraint that
handlers higher up (closer to the PHB) in the PE hierarchy must be
called before those lower down.

To maintain the constraint, above, the driver handlers are called by
traversing the tree of affected PEs from the top, stopping to call
handlers (in parallel) when a PE with devices is discovered. When the
calls for that PE are complete, traversal continues at each child PE.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 arch/powerpc/include/asm/eeh.h        |   1 +
 arch/powerpc/include/asm/eeh_event.h  |   7 +
 arch/powerpc/include/asm/pci-bridge.h |   3 +
 arch/powerpc/kernel/eeh_driver.c      | 323 +++++++++++++++++++-------
 arch/powerpc/kernel/eeh_event.c       |  65 +++---
 arch/powerpc/kernel/eeh_pe.c          |   3 +
 6 files changed, 288 insertions(+), 114 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index f659c0433de5..2728aee5cb0b 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -128,6 +128,7 @@ static inline bool eeh_pe_passed(struct eeh_pe *pe)
 #define EEH_DEV_NO_HANDLER	(1 << 8)	/* No error handler	*/
 #define EEH_DEV_SYSFS		(1 << 9)	/* Sysfs created	*/
 #define EEH_DEV_REMOVED		(1 << 10)	/* Removed permanently	*/
+#define EEH_DEV_RECOVERING	(1 << 11)	/* Recovering		*/
 
 struct eeh_dev {
 	int mode;			/* EEH mode			*/
diff --git a/arch/powerpc/include/asm/eeh_event.h b/arch/powerpc/include/asm/eeh_event.h
index a1fe736bc4cf..b21f49e87b7b 100644
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
@@ -15,16 +17,21 @@
  * callback.
  */
 struct eeh_event {
+	struct work_struct	work;
 	struct list_head	list;	/* to form event queue	*/
 	struct eeh_pe		*pe;	/* EEH PE		*/
 	unsigned int		id;	/* Event ID		*/
 };
 
+extern spinlock_t eeh_eventlist_lock;
+
 int eeh_event_init(void);
+int eeh_phb_event(struct eeh_pe *pe);
 int eeh_send_failure_event(struct eeh_pe *pe);
 int __eeh_send_failure_event(struct eeh_pe *pe);
 void eeh_remove_event(struct eeh_pe *pe, bool force);
 void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe);
+void eeh_handle_normal_event_work(struct work_struct *work);
 void eeh_handle_special_event(void);
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
index c85f901227c9..74806009f50a 100644
--- a/arch/powerpc/include/asm/pci-bridge.h
+++ b/arch/powerpc/include/asm/pci-bridge.h
@@ -131,6 +131,9 @@ struct pci_controller {
 	struct irq_domain	*dev_domain;
 	struct irq_domain	*msi_domain;
 	struct fwnode_handle	*fwnode;
+
+	bool eeh_in_progress;
+	struct list_head eeh_eventlist;
 };
 
 /* These are used for config access before all the PCI probing
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 894326cc4dfa..3abd5f2d146c 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -12,12 +12,17 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pci_hotplug.h>
+#include <linux/kthread.h>
+#include <linux/workqueue.h>
+#include <linux/completion.h>
 #include <asm/eeh.h>
 #include <asm/eeh_event.h>
 #include <asm/ppc-pci.h>
 #include <asm/pci-bridge.h>
 #include <asm/rtas.h>
 
+static atomic_t eeh_wu_id = ATOMIC_INIT(0);
+
 struct eeh_rmv_data {
 	struct list_head removed_vf_list;
 	int removed_dev_count;
@@ -248,73 +253,59 @@ static void eeh_set_irq_state(struct eeh_pe *root, bool enable)
 }
 
 typedef enum pci_ers_result (*eeh_report_fn)(unsigned int event_id,
+					     unsigned int id,
 					     struct pci_dev *,
 					     struct pci_driver *);
 static void eeh_pe_report_pdev(unsigned int event_id,
-			       struct pci_dev *pdev, eeh_report_fn fn,
+			       unsigned int id,
+			       struct pci_dev *pdev,
+			       const char *fn_name, eeh_report_fn fn,
 			       enum pci_ers_result *result,
-			       const char *handler_name)
+			       bool late, bool removed, bool passed)
 {
-	struct eeh_dev *edev;
 	struct pci_driver *driver;
-	bool actionable, late, removed, passed;
 	enum pci_ers_result new_result;
 
-	edev = pci_dev_to_eeh_dev(pdev);
-	if (!edev) {
-		pci_info(pdev, "EEH(%u): no EEH state for device", event_id);
-		return;
-	}
-	/* Cache some useful values before releasing the lock: */
-	actionable = eeh_edev_actionable(edev);
-	late = edev->mode & EEH_DEV_NO_HANDLER;
-	removed = eeh_dev_removed(edev);
-	passed = eeh_pe_passed(edev->pe);
-	if (actionable) {
+	/*
+	 * Driver callbacks may end up calling back into EEH functions
+	 * (for example by removing a PCI device) which will deadlock
+	 * unless the EEH locks are released first. Note that it may be
+	 * re-acquired by the report functions, if necessary.
+	 */
+	device_lock(&pdev->dev);
+	driver = eeh_pcid_get(pdev);
+
+	if (!driver) {
+		pci_info(pdev, "EEH(%u): W%u: no driver", event_id, id);
+	} else if (!driver->err_handler) {
+		pci_info(pdev, "EEH(%u): W%u: driver not EEH aware", event_id, id);
+	} else if (late) {
+		pci_info(pdev, "EEH(%u): W%u: driver bound too late", event_id, id);
+	} else {
+		pci_info(pdev, "EEH(%u): EVENT=HANDLER_CALL HANDLER='%s'\n",
+			 event_id, fn_name);
+
+		new_result = fn(event_id, id, pdev, driver);
+
 		/*
-		 * Driver callbacks may end up calling back into EEH functions
-		 * (for example by removing a PCI device) which will deadlock
-		 * unless the EEH locks are released first. Note that it may be
-		 * re-acquired by the report functions, if necessary.
+		 * It's not safe to use edev here, because the locks
+		 * have been released and devices could have changed.
 		 */
-		eeh_recovery_unlock();
-		device_lock(&pdev->dev);
-		driver = eeh_pcid_get(pdev);
-
-		if (!driver)
-			pci_info(pdev, "EEH(%u): no driver", event_id);
-		else if (!driver->err_handler)
-			pci_info(pdev, "EEH(%u): driver not EEH aware", event_id);
-		else if (late)
-			pci_info(pdev, "EEH(%u): driver bound too late", event_id);
-		else {
-			pr_warn("EEH(%u): EVENT=HANDLER_CALL DEVICE=%04x:%02x:%02x.%x DRIVER='%s' HANDLER='%s'\n",
-				event_id, edev->controller->global_number,
-				PCI_BUSNO(edev->bdfn), PCI_SLOT(edev->bdfn),
-				PCI_FUNC(edev->bdfn), driver->name, handler_name);
-
-			new_result = fn(event_id, pdev, driver);
-			/*
-			 * It's not safe to use edev here, because the locks
-			 * have been released and devices could have changed.
-			 */
-			pr_warn("EEH(%u): EVENT=HANDLER_RETURN RESULT='%s'\n",
-				event_id, pci_ers_result_name(new_result));
-			pci_info(pdev, "EEH(%u): %s driver reports: %s",
-				 event_id, driver->name,
-				 pci_ers_result_name(new_result));
-			if (result)
-				*result = pci_ers_merge_result(*result,
-							       new_result);
+		pr_warn("EEH(%u): EVENT=HANDLER_RETURN RESULT='%s'\n",
+			event_id, pci_ers_result_name(new_result));
+		pci_info(pdev, "EEH(%u): W%u: %s driver reports: '%s'",
+			 event_id, id, driver->name,
+			 pci_ers_result_name(new_result));
+		if (result) {
+			eeh_recovery_lock();
+			*result = pci_ers_merge_result(*result,
+						       new_result);
+			eeh_recovery_unlock();
 		}
-		if (driver)
-			eeh_pcid_put(pdev);
-		device_unlock(&pdev->dev);
-		eeh_recovery_lock();
-	} else {
-		pci_info(pdev, "EEH(%u): not actionable (%d,%d,%d)",
-			 event_id, !!pdev, !removed, !passed);
 	}
+	if (driver)
+		eeh_pcid_put(pdev);
+	device_unlock(&pdev->dev);
 }
 
 struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
@@ -354,27 +345,153 @@ static void pdev_cache_list_destroy(struct pci_dev **pdevs)
 	kfree(pdevs);
 }
 
-static void eeh_pe_report(unsigned int event_id,
-			  const char *name, struct eeh_pe *root,
-			  eeh_report_fn fn, enum pci_ers_result *result)
+struct work_unit {
+	unsigned int id;
+	struct work_struct work;
+	unsigned int event_id;
+	struct pci_dev *pdev;
+	struct eeh_pe *pe;
+	const char *fn_name;
+	eeh_report_fn fn;
+	enum pci_ers_result *result;
+	atomic_t *count;
+	struct completion *done;
+};
+
+static void eeh_pe_report_pdev_thread(struct work_struct *work);
+/*
+ * Traverse down from a PE through it's children, to find devices and enqueue
+ * jobs to call the handler (fn) on them.  But do not traverse below a PE that
+ * has devices, so that devices are always handled strictly before their
+ * children. (Traversal is continued by the jobs after handlers are called.)
+ * The recovery lock must be held.
+ * TODO: Convert away from recursive descent traversal?
+ */
+static bool enqueue_pe_work(struct eeh_pe *root, unsigned int event_id,
+			    const char *fn_name, eeh_report_fn fn,
+			    enum pci_ers_result *result, atomic_t *count,
+			    struct completion *done)
 {
-	struct pci_dev **pdevs, **pdevp;
+	struct eeh_pe *pe;
+	struct eeh_dev *edev, *tmp;
+	struct work_unit *wu;
+	bool work_added = false;
+
+	if (list_empty(&root->edevs)) {
+		list_for_each_entry(pe, &root->child_list, child)
+			work_added |= enqueue_pe_work(pe, event_id, fn_name,
+						      fn, result, count, done);
+	} else {
+		eeh_pe_for_each_dev(root, edev, tmp) {
+			work_added = true;
+			edev->mode |= EEH_DEV_RECOVERING;
+			atomic_inc(count);
+			WARN_ON(!(edev->mode & EEH_DEV_RECOVERING));
+			wu = kmalloc(sizeof(*wu), GFP_KERNEL);
+			wu->id = (unsigned int)atomic_inc_return(&eeh_wu_id);
+			wu->event_id = event_id;
+			get_device(&edev->pdev->dev);
+			wu->pdev = edev->pdev;
+			wu->pe = root;
+			wu->fn_name = fn_name;
+			wu->fn = fn;
+			wu->result = result;
+			wu->count = count;
+			wu->done = done;
+			INIT_WORK(&wu->work, eeh_pe_report_pdev_thread);
+			pr_debug("EEH(%u): Queue work unit W%u for device %s (count ~ %d)\n",
+				 event_id, wu->id, pci_name(edev->pdev),
+				 atomic_read(count));
+			queue_work(system_unbound_wq, &wu->work);
+		}
+		/* This PE has devices, so don't traverse further now */
+	}
+	return work_added;
+}
+
+static void eeh_pe_report_pdev_thread(struct work_struct *work)
+{
+	struct work_unit *wu = container_of(work, struct work_unit, work);
+	struct eeh_dev *edev, *oedev, *tmp;
+	struct eeh_pe *pe;
+	int todo;
 
-	pr_info("EEH(%u): Beginning: '%s'\n", event_id, name);
 	/*
 	 * It would be convenient to continue to hold the recovery lock here
 	 * but driver callbacks can take a very long time or never return at
 	 * all.
 	 */
-	pdevs = pdev_cache_list_create(root);
-	for (pdevp = pdevs; pdevp && *pdevp; pdevp++) {
-		/*
-		 * NOTE! eeh_recovery_lock() is released briefly
-		 * in eeh_pe_report_pdev()
-		 */
-		eeh_pe_report_pdev(event_id, *pdevp, fn, result, name);
+	pr_debug("EEH(%u): W%u: start (device: %s)\n", wu->event_id, wu->id, pci_name(wu->pdev));
+	eeh_recovery_lock();
+	edev = pci_dev_to_eeh_dev(wu->pdev);
+	if (edev) {
+		bool late, removed, passed;
+
+		WARN_ON(!(edev->mode & EEH_DEV_RECOVERING));
+		removed = eeh_dev_removed(edev);
+		passed = eeh_pe_passed(edev->pe);
+		late = edev->mode & EEH_DEV_NO_HANDLER;
+		if (eeh_edev_actionable(edev)) {
+			eeh_recovery_unlock();
+			eeh_pe_report_pdev(wu->event_id, wu->id, wu->pdev,
+					   wu->fn_name, wu->fn, wu->result,
+					   late, removed, passed);
+			eeh_recovery_lock();
+		} else {
+			pci_info(wu->pdev, "EEH(%u): W%u: Not actionable (%d,%d,%d)\n",
+				 wu->event_id, wu->id, !!wu->pdev, !removed, !passed);
+		}
+		edev = pci_dev_to_eeh_dev(wu->pdev); // Re-acquire after lock release
+		if (edev)
+			edev->mode &= ~EEH_DEV_RECOVERING;
+		/* The edev may be lost, but not moved to a different PE! */
+		WARN_ON(eeh_dev_to_pe(edev) && (eeh_dev_to_pe(edev) != wu->pe));
+		todo = 0;
+		eeh_pe_for_each_dev(wu->pe, oedev, tmp)
+			if (oedev->mode & EEH_DEV_RECOVERING)
+				todo++;
+		pci_dbg(wu->pdev, "EEH(%u): W%u: Remaining devices in this PE: %d\n",
+			wu->event_id, wu->id, todo);
+		if (todo) {
+			pr_debug("EEH(%u): W%u: Remaining work units at this PE: %d\n",
+				 wu->event_id, wu->id, todo);
+		} else {
+			pr_debug("EEH(%u): W%u: All work for this PE complete, continuing traversal:\n",
+				 wu->event_id, wu->id);
+			list_for_each_entry(pe, &wu->pe->child_list, child)
+				enqueue_pe_work(pe, wu->event_id, wu->fn_name,
+						wu->fn, wu->result, wu->count,
+						wu->done);
+		}
+	} else {
+		pr_warn("EEH(%u): W%u: Device removed.\n", wu->event_id, wu->id);
+	}
+	eeh_recovery_unlock();
+	if (atomic_dec_and_test(wu->count)) {
+		pr_debug("EEH(%u): W%u: done\n", wu->event_id, wu->id);
+		complete(wu->done);
+	}
+	put_device(&wu->pdev->dev);
+	kfree(wu);
+}
+
+static void eeh_pe_report(unsigned int event_id, const char *name, struct eeh_pe *root,
+			  eeh_report_fn fn, enum pci_ers_result *result)
+{
+	atomic_t count = ATOMIC_INIT(0);
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	pr_info("EEH(%u): Beginning: '%s'\n", event_id, name);
+	if (enqueue_pe_work(root, event_id, name, fn, result, &count, &done)) {
+		pr_info("EEH(%u): Waiting for asynchronous recovery work to complete...\n",
+			event_id);
+		eeh_recovery_unlock();
+		wait_for_completion_interruptible(&done);
+		pr_info("EEH(%u): Asynchronous recovery work is complete.\n", event_id);
+		eeh_recovery_lock();
+	} else {
+		pr_info("EEH(%u): No recovery work do.\n", event_id);
 	}
-	pdev_cache_list_destroy(pdevs);
 
 	if (result)
 		pr_info("EEH(%u): Finished:'%s' with aggregate recovery state:'%s'\n",
@@ -391,6 +508,7 @@ static void eeh_pe_report(unsigned int event_id,
  * Report an EEH error to each device driver.
  */
 static enum pci_ers_result eeh_report_error(unsigned int event_id,
+					    unsigned int id,
 					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
@@ -401,7 +519,8 @@ static enum pci_ers_result eeh_report_error(unsigned int event_id,
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
-	pci_info(pdev, "Invoking %s->error_detected(IO frozen)", driver->name);
+	pci_info(pdev, "EEH(%u): W%u: Invoking %s->error_detected(IO frozen)",
+		 event_id, id, driver->name);
 	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
 
 	eeh_serialize_lock(&flags);
@@ -423,13 +542,14 @@ static enum pci_ers_result eeh_report_error(unsigned int event_id,
  * are now enabled.
  */
 static enum pci_ers_result eeh_report_mmio_enabled(unsigned int event_id,
+						   unsigned int id,
 						   struct pci_dev *pdev,
 						   struct pci_driver *driver)
 {
 	if (!driver->err_handler->mmio_enabled)
 		return PCI_ERS_RESULT_NONE;
-	pci_info(pdev, "EEH(%u): Invoking %s->mmio_enabled()",
-		 event_id, driver->name);
+	pci_info(pdev, "EEH(%u): W%u: Invoking %s->mmio_enabled()",
+		 event_id, id, driver->name);
 	return driver->err_handler->mmio_enabled(pdev);
 }
 
@@ -445,6 +565,7 @@ static enum pci_ers_result eeh_report_mmio_enabled(unsigned int event_id,
  * driver can work again while the device is recovered.
  */
 static enum pci_ers_result eeh_report_reset(unsigned int event_id,
+					    unsigned int id,
 					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
@@ -458,8 +579,8 @@ static enum pci_ers_result eeh_report_reset(unsigned int event_id,
 		return PCI_ERS_RESULT_NONE;
 	}
 	eeh_serialize_unlock(flags);
-	pci_info(pdev, "EEH(%u): Invoking %s->slot_reset()",
-		 event_id, driver->name);
+	pci_info(pdev, "EEH(%u): W%u: Invoking %s->slot_reset()",
+		 event_id, id, driver->name);
 	return driver->err_handler->slot_reset(pdev);
 }
 
@@ -500,6 +621,7 @@ static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
  * to make the recovered device work again.
  */
 static enum pci_ers_result eeh_report_resume(unsigned int event_id,
+					     unsigned int id,
 					     struct pci_dev *pdev,
 					     struct pci_driver *driver)
 {
@@ -514,8 +636,8 @@ static enum pci_ers_result eeh_report_resume(unsigned int event_id,
 	}
 	eeh_serialize_unlock(flags);
 
-	pci_info(pdev, "EEH(%u): Invoking %s->resume()",
-		 event_id, driver->name);
+	pci_info(pdev, "EEH(%u): W%u Invoking %s->resume()",
+		 event_id, id, driver->name);
 	driver->err_handler->resume(pdev);
 
 	pci_uevent_ers(pdev, PCI_ERS_RESULT_RECOVERED);
@@ -537,6 +659,7 @@ static enum pci_ers_result eeh_report_resume(unsigned int event_id,
  * dead, and that no further recovery attempts will be made on it.
  */
 static enum pci_ers_result eeh_report_failure(unsigned int event_id,
+					      unsigned int id,
 					      struct pci_dev *pdev,
 					      struct pci_driver *driver)
 {
@@ -545,8 +668,8 @@ static enum pci_ers_result eeh_report_failure(unsigned int event_id,
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
-	pci_info(pdev, "EEH(%u): Invoking %s->error_detected(permanent failure)",
-		 event_id, driver->name);
+	pci_info(pdev, "EEH(%u): W%u: Invoking %s->error_detected(permanent failure)",
+		 event_id, id, driver->name);
 	rc = driver->err_handler->error_detected(pdev,
 						 pci_channel_io_perm_failure);
 
@@ -995,9 +1118,10 @@ static void eeh_clear_slot_attention(struct pci_dev *pdev)
  */
 void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 {
+	struct eeh_pe *tmp_pe;
+	struct pci_controller *phb = pe->phb;
 	struct pci_bus *bus;
 	struct eeh_dev *edev, *tmp;
-	struct eeh_pe *tmp_pe;
 	struct pci_dev **pdevs, **pdevp;
 	int rc = 0;
 	enum pci_ers_result result = PCI_ERS_RESULT_NONE;
@@ -1009,7 +1133,7 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
 		pr_err("EEH(%u): %s: Cannot find PCI bus for PHB#%x-PE#%x\n",
-			event_id, __func__, pe->phb->global_number, pe->addr);
+			event_id, __func__, phb->global_number, pe->addr);
 		eeh_recovery_unlock();
 		return;
 	}
@@ -1030,7 +1154,7 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 
 	if (!devices) {
 		pr_debug("EEH(%u): Frozen PHB#%x-PE#%x is empty!\n",
-			event_id, pe->phb->global_number, pe->addr);
+			event_id, phb->global_number, pe->addr);
 		goto out; /* nothing to recover */
 	}
 
@@ -1042,12 +1166,12 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
 		pr_err("EEH(%u): Recovering PHB#%x, location: %s\n",
-			event_id, pe->phb->global_number, eeh_pe_loc_get(pe));
+			event_id, phb->global_number, eeh_pe_loc_get(pe));
 	} else {
-		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
+		struct eeh_pe *phb_pe = eeh_phb_pe_get(phb);
 
 		pr_err("EEH(%u): Recovering PHB#%x-PE#%x\n",
-		       event_id, pe->phb->global_number, pe->addr);
+		       event_id, phb->global_number, pe->addr);
 		pr_err("EEH(%u): PE location: %s, PHB location: %s\n",
 		       event_id, eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
 	}
@@ -1062,7 +1186,7 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 		int i;
 
 		pr_err("EEH(%u): Frozen PHB#%x-PE#%x detected\n",
-		       event_id, pe->phb->global_number, pe->addr);
+		       event_id, phb->global_number, pe->addr);
 
 		/* FIXME: Use the same format as dump_stack() */
 		pr_err("EEH(%u): Call Trace:\n", event_id);
@@ -1081,7 +1205,7 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	pe->freeze_count++;
 	if (pe->freeze_count > eeh_max_freezes) {
 		pr_err("EEH(%u): PHB#%x-PE#%x has failed %d times in the last hour and has been permanently disabled.\n",
-		       event_id, pe->phb->global_number, pe->addr,
+		       event_id, phb->global_number, pe->addr,
 		       pe->freeze_count);
 
 		goto recover_failed;
@@ -1229,7 +1353,7 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	 */
 	pr_err("EEH(%u): Unable to recover from failure from PHB#%x-PE#%x.\n"
 		"Please try reseating or replacing it\n",
-		event_id, pe->phb->global_number, pe->addr);
+		event_id, phb->global_number, pe->addr);
 
 	eeh_slot_error_detail(event_id, pe, EEH_LOG_PERM);
 
@@ -1284,6 +1408,30 @@ void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 	eeh_recovery_unlock();
 }
 
+void eeh_handle_normal_event_work(struct work_struct *work)
+{
+	unsigned long flags;
+	struct eeh_event *event = container_of(work, struct eeh_event, work);
+	struct pci_controller *phb = event->pe->phb;
+
+	eeh_handle_normal_event(event->id, event->pe);
+
+	kfree(event);
+	spin_lock_irqsave(&eeh_eventlist_lock, flags);
+	WARN_ON_ONCE(!phb->eeh_in_progress);
+	if (list_empty(&phb->eeh_eventlist)) {
+		phb->eeh_in_progress = false;
+		pr_debug("EEH(%u): No more work to do\n", event->id);
+	} else {
+		pr_warn("EEH(%u): More work to do\n", event->id);
+		event = list_entry(phb->eeh_eventlist.next,
+				   struct eeh_event, list);
+		list_del(&event->list);
+		queue_work(system_unbound_wq, &event->work);
+	}
+	spin_unlock_irqrestore(&eeh_eventlist_lock, flags);
+}
+
 /**
  * eeh_handle_special_event - Handle EEH events without a specific failing PE
  *
@@ -1353,8 +1501,7 @@ void eeh_handle_special_event(void)
 		 */
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
-			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
-			eeh_handle_normal_event(0, pe);
+			eeh_phb_event(pe);
 		} else {
 			eeh_for_each_pe(pe, tmp_pe)
 				eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index 6c205a77581f..f01cb8e981e1 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -22,7 +22,7 @@
  *  work-queue, where a worker thread can drive recovery.
  */
 
-static DEFINE_SPINLOCK(eeh_eventlist_lock);
+DEFINE_SPINLOCK(eeh_eventlist_lock);
 static DECLARE_COMPLETION(eeh_eventlist_event);
 static LIST_HEAD(eeh_eventlist);
 
@@ -61,7 +61,7 @@ static int eeh_event_handler(void * dummy)
 			continue;
 
 		/* We might have event without binding PE */
-		if (event->pe)
+		if (event->pe) /* TODO: Unused now? */
 			eeh_handle_normal_event(event->id, event->pe);
 		else
 			eeh_handle_special_event();
@@ -94,33 +94,56 @@ int eeh_event_init(void)
 	return 0;
 }
 
-/**
- * eeh_send_failure_event - Generate a PCI error event
- * @pe: EEH PE
- *
- * This routine can be called within an interrupt context;
- * the actual event will be delivered in a normal context
- * (from a workqueue).
- */
-int __eeh_send_failure_event(struct eeh_pe *pe)
+int eeh_phb_event(struct eeh_pe *pe)
 {
-	unsigned long flags;
 	struct eeh_event *event;
+	unsigned long flags;
 
 	event = kzalloc(sizeof(*event), GFP_ATOMIC);
 	if (!event) {
 		pr_err("EEH: out of memory, event not handled\n");
 		return -ENOMEM;
 	}
-	event->pe = pe;
+
 	do {
 		/* Skip over the special value (0) */
 		event->id = (unsigned int)atomic_inc_return(&eeh_event_id);
 	} while (!event->id);
 
-	pr_err("EEH(%u): EVENT=ERROR_DETECTED PHB=%#x PE=%#x\n",
-	      event->id, pe->phb->global_number, pe->addr);
+	spin_lock_irqsave(&eeh_eventlist_lock, flags);
+	INIT_WORK(&event->work, eeh_handle_normal_event_work);
+	if (pe) {
+		event->pe = pe;
+		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
+		pr_err("EEH(%u): EVENT=ERROR_DETECTED PHB=%#x PE=%#x\n",
+		       event->id, pe->phb->global_number, pe->addr);
+		if (event->pe->phb->eeh_in_progress) {
+			pr_info("EEH: EEH already in progress on this PHB, queueing.\n");
+			list_add(&event->list, &event->pe->phb->eeh_eventlist);
+		} else {
+			pr_info("EEH: Beginning recovery on this PHB.\n");
+			WARN_ON_ONCE(!list_empty(&event->pe->phb->eeh_eventlist));
+			event->pe->phb->eeh_in_progress = true;
+			queue_work(system_unbound_wq, &event->work);
+		}
+	} else {
+		list_add(&event->list, &eeh_eventlist);
+		complete(&eeh_eventlist_event);
+	}
+	spin_unlock_irqrestore(&eeh_eventlist_lock, flags);
+	return 0;
+}
 
+/**
+ * eeh_send_failure_event - Generate a PCI error event
+ * @pe: EEH PE
+ *
+ * This routine can be called within an interrupt context;
+ * the actual event will be delivered in a normal context
+ * (from a workqueue).
+ */
+int __eeh_send_failure_event(struct eeh_pe *pe)
+{
 	/*
 	 * Mark the PE as recovering before inserting it in the queue.
 	 * This prevents the PE from being free()ed by a hotplug driver
@@ -136,18 +159,8 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
 					 ARRAY_SIZE(pe->stack_trace), 0);
 #endif /* CONFIG_STACKTRACE */
 
-		eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
 	}
-
-	/* We may or may not be called in an interrupt context */
-	spin_lock_irqsave(&eeh_eventlist_lock, flags);
-	list_add(&event->list, &eeh_eventlist);
-	spin_unlock_irqrestore(&eeh_eventlist_lock, flags);
-
-	/* For EEH deamon to knick in */
-	complete(&eeh_eventlist_event);
-
-	return 0;
+	return eeh_phb_event(pe);
 }
 
 int eeh_send_failure_event(struct eeh_pe *pe)
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 8f30ad3df8e0..0e9676b2d71f 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -81,6 +81,9 @@ int eeh_phb_pe_create(struct pci_controller *phb)
 {
 	struct eeh_pe *pe;
 
+	phb->eeh_in_progress = false; /* TODO: Necessary? */
+	INIT_LIST_HEAD(&phb->eeh_eventlist);
+
 	/* Allocate PHB PE */
 	pe = eeh_pe_alloc(phb, EEH_PE_PHB);
 	if (!pe) {
-- 
2.37.1

