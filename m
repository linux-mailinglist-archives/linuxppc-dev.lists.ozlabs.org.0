Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D962E19749E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 08:41:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rNCj59KCzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 17:41:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rNB46NXDzDqW6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 17:40:12 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02U6X9FK078836
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 02:40:09 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303bgdg9xf-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 02:40:08 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Mon, 30 Mar 2020 07:40:04 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 07:40:01 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02U6e12642074424
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 06:40:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 698914204D;
 Mon, 30 Mar 2020 06:40:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 379E742045;
 Mon, 30 Mar 2020 06:40:00 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 06:40:00 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.211.70.38])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4ABBDA0197;
 Mon, 30 Mar 2020 17:39:51 +1100 (AEDT)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 1/1] powerpc/eeh: Synchronization for safety
Date: Mon, 30 Mar 2020 17:39:51 +1100
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033006-0028-0000-0000-000003EE7E46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033006-0029-0000-0000-000024B3FB7E
Message-Id: <049418257caa232ca3e27ee8cbab9b4ff38b11aa.1585550388.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 suspectscore=4 bulkscore=0 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300057
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is currently little synchronization between EEH error detection
(eeh_dev_check_failure()), EEH error recovery
(eeh_handle_{normal,special}_event()) and the PCI subsystem (device
addition and removal), and so there are race conditions that lead to
crashes (often access to free'd memory or LIST_POISON).

However, a solution must consider:
- EEH error detection can occur in interrupt context, which prevents
the use of a mutex.
- EEH recovery may need to sleep, which prevents the use of a spinlock.
- EEH recovery uses PCI operations that may require the PCI
rescan/remove lock and/or device lock to be held
- PCI operations may hold the rescan/remove and/or device lock when
calling into EEH functions.
- Device driver callbacks may perform arbitrary PCI operations
during recovery, including device removal.

In this patch the existing mutex and spinlock are combined with the
EEH_PE_RECOVERING flag to provide some assurances that are then used
to reduce the race conditions.

The fields to be protected are the ones that provide the structure
of the trees of struct eeh_pe that are held for each PHB: the parent
pointer and child lists and the list of struct eeh_dev, as well as
the pe and pdev pointers within struct eeh_dev.

The existing way of using EEH_PE_RECOVERING is kept and slightly
extended: No struct eeh_pe will be removed while it has the flag set
on it. Additionally, when adding new PEs, they are marked
EEH_PE_RECOVERING if their parent PE is marked: this allows the
recovery thread to assume that all PEs underneath the one it's
processing will continue to exist during recovery.

Both the mutex and spinlock are held while any protected field is
changed or a PE is deleted, so holding either of them (elsewhere) will
keep them stable and safe to access. Additionally, if
EEH_PE_RECOVERING is set on a PE then the locks can be released and
re-acquired safely, as long as the protected fields aren't used while
no locks are held. This is used during recovery to release locks
for long sleeps (i.e. during eeh_wait_state() when we may sleep up to
5 minutes), or to maintain lock ordering.

The spinlock is used in error detection (which cannot use a mutex, see
above) and also where it's possible that the mutex is already held.
The mutex is used in areas that don't have that restriction, and where
blocking may be required. Care must be taken when ordering these locks
against the PCI rescan/remove lock and the device locks to avoid
deadlocking.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
Hello everyone,

Here's an attempt to bring some safety to the interactions between the various
moving parts involved in EEH recovery.

It's based on top of my recently posted set: "Release EEH device state
synchronously".

I've tried to explain it in the commit message and code comments, but I'd like
to add:

- I'm not aware of any outstanding problems with the set, but I've kept it RFC
  for now becuase I'm looking for comments on the general strategy and
  direction -- is this a good way to achieve some safety?
- I've only done manual testing so far. If it looks good, I'll try to
  do something more thorough.
- Yes it's one big patch. I'll try to break it up if necessary.
- Good places to review carefully would be eeh_pe_report_pdev() and
  eeh_reset_device().
- The mutex and spinlock need better names. Suggestions welcome.
- I'm not aiming to fix absolutely every case here, just most of them, and to
  provide a decent foundation for fixing the remaining cases as they are
  discovered.

And finally, a big thank you to lockdep :-)

Cheers,
Sam.

 arch/powerpc/include/asm/eeh.h               |   6 +-
 arch/powerpc/kernel/eeh.c                    | 114 +++++--
 arch/powerpc/kernel/eeh_driver.c             | 300 ++++++++++++++-----
 arch/powerpc/kernel/eeh_pe.c                 |  47 ++-
 arch/powerpc/kernel/of_platform.c            |   7 +-
 arch/powerpc/kernel/pci-common.c             |   4 +
 arch/powerpc/kernel/pci-hotplug.c            |   2 +
 arch/powerpc/platforms/powernv/eeh-powernv.c |  13 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   5 +-
 arch/powerpc/platforms/pseries/pci_dlpar.c   |   5 +-
 drivers/pci/hotplug/pnv_php.c                |   5 +-
 drivers/pci/hotplug/rpadlpar_core.c          |   2 +
 drivers/vfio/vfio_spapr_eeh.c                |  10 +-
 13 files changed, 404 insertions(+), 116 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 6f9b2a12540a..1d4c0b19a63c 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -273,11 +273,15 @@ static inline bool eeh_state_active(int state)
 	== (EEH_STATE_MMIO_ACTIVE | EEH_STATE_DMA_ACTIVE);
 }
 
+void eeh_recovery_lock(void);
+void eeh_recovery_unlock(void);
+void eeh_recovery_must_be_locked(void);
+
 typedef void (*eeh_edev_traverse_func)(struct eeh_dev *edev, void *flag);
 typedef void *(*eeh_pe_traverse_func)(struct eeh_pe *pe, void *flag);
 void eeh_set_pe_aux_size(int size);
 int eeh_phb_pe_create(struct pci_controller *phb);
-int eeh_wait_state(struct eeh_pe *pe, int max_wait);
+int eeh_wait_state(struct eeh_pe *pe, int max_wait, bool unlock);
 struct eeh_pe *eeh_phb_pe_get(struct pci_controller *phb);
 struct eeh_pe *eeh_pe_next(struct eeh_pe *pe, struct eeh_pe *root);
 struct eeh_pe *eeh_pe_get(struct pci_controller *phb,
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 12c248a16527..30acae0d10e5 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -108,11 +108,26 @@ bool eeh_debugfs_no_recover;
 /* Platform dependent EEH operations */
 struct eeh_ops *eeh_ops = NULL;
 
-/* Lock to avoid races due to multiple reports of an error */
+/*
+ * confirm_error_lock and eeh_dev_mutex are used together to provide
+ * safety during EEH operations.
+ *
+ * Generally, the spinlock is used in error detection where it's not possible
+ * to use a mutex or where there is potential to deadlock with the mutex, and
+ * the mutex is used during recovery and other PCI related operations. One must
+ * be held when reading and both must be held when making changes to the
+ * protected fields: eeh_pe.parent, child_list, child, edevs and eeh_dev.pe,
+ * .pdev.
+ *
+ * Lock ordering:
+ * - the PCI rescan/remove mutex (see pci_lock_rescan_remove())
+ * - the struct device lock (see device_lock())
+ * - the eeh_dev_mutex mutex (see eeh_recovery_lock())
+ * - the confirm_error_lock spinlock (see eeh_serialize_lock())
+ * - the eeh_eventlist_lock spinlock
+ */
 DEFINE_RAW_SPINLOCK(confirm_error_lock);
 EXPORT_SYMBOL_GPL(confirm_error_lock);
-
-/* Lock to protect passed flags */
 static DEFINE_MUTEX(eeh_dev_mutex);
 
 /* Buffer for reporting pci register dumps. Its here in BSS, and
@@ -160,6 +175,23 @@ void eeh_show_enabled(void)
 		pr_info("EEH: No capable adapters found: recovery disabled.\n");
 }
 
+void eeh_recovery_lock(void)
+{
+	mutex_lock(&eeh_dev_mutex);
+}
+EXPORT_SYMBOL_GPL(eeh_recovery_lock);
+
+void eeh_recovery_unlock(void)
+{
+	mutex_unlock(&eeh_dev_mutex);
+}
+EXPORT_SYMBOL_GPL(eeh_recovery_unlock);
+
+void eeh_recovery_must_be_locked(void)
+{
+	WARN_ON_ONCE(!mutex_is_locked(&eeh_dev_mutex));
+}
+EXPORT_SYMBOL_GPL(eeh_recovery_must_be_locked);
 /*
  * This routine captures assorted PCI configuration space data
  * for the indicated PCI device, and puts them into a buffer
@@ -383,11 +415,12 @@ static inline unsigned long eeh_token_to_phys(unsigned long token)
  * On PowerNV platform, we might already have fenced PHB there.
  * For that case, it's meaningless to recover frozen PE. Intead,
  * We have to handle fenced PHB firstly.
+ *
+ * eeh_serialize_lock must be held when calling this function.
  */
 static int eeh_phb_check_failure(struct eeh_pe *pe)
 {
 	struct eeh_pe *phb_pe;
-	unsigned long flags;
 	int ret;
 
 	if (!eeh_has_flag(EEH_PROBE_MODE_DEV))
@@ -402,7 +435,6 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 	}
 
 	/* If the PHB has been in problematic state */
-	eeh_serialize_lock(&flags);
 	if (phb_pe->state & EEH_PE_ISOLATED) {
 		ret = 0;
 		goto out;
@@ -418,14 +450,12 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
 
 	/* Isolate the PHB and send event */
 	eeh_pe_mark_isolated(phb_pe);
-	eeh_serialize_unlock(flags);
 
 	pr_debug("EEH: PHB#%x failure detected, location: %s\n",
 		phb_pe->phb->global_number, eeh_pe_loc_get(phb_pe));
 	eeh_send_failure_event(phb_pe);
 	return 1;
 out:
-	eeh_serialize_unlock(flags);
 	return ret;
 }
 
@@ -445,12 +475,11 @@ static int eeh_phb_check_failure(struct eeh_pe *pe)
  */
 int eeh_dev_check_failure(struct eeh_dev *edev)
 {
-	int ret;
 	unsigned long flags;
 	struct device_node *dn;
 	struct pci_dev *dev;
 	struct eeh_pe *pe, *parent_pe;
-	int rc = 0;
+	int rc;
 	const char *location = NULL;
 
 	eeh_stats.total_mmio_ffs++;
@@ -462,6 +491,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 		eeh_stats.no_dn++;
 		return 0;
 	}
+	eeh_serialize_lock(&flags);
 	dev = eeh_dev_to_pci_dev(edev);
 	pe = eeh_dev_to_pe(edev);
 
@@ -469,29 +499,33 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	if (!pe) {
 		eeh_stats.ignored_check++;
 		eeh_edev_dbg(edev, "Ignored check\n");
-		return 0;
+		rc = 0;
+		goto dn_unlock;
 	}
 
 	if (!pe->addr && !pe->config_addr) {
 		eeh_stats.no_cfg_addr++;
-		return 0;
+		rc = 0;
+		goto dn_unlock;
 	}
 
 	/*
 	 * On PowerNV platform, we might already have fenced PHB
 	 * there and we need take care of that firstly.
 	 */
-	ret = eeh_phb_check_failure(pe);
-	if (ret > 0)
-		return ret;
+	rc = eeh_phb_check_failure(pe);
+	if (rc > 0)
+		goto dn_unlock;
 
 	/*
 	 * If the PE isn't owned by us, we shouldn't check the
 	 * state. Instead, let the owner handle it if the PE has
 	 * been frozen.
 	 */
-	if (eeh_pe_passed(pe))
-		return 0;
+	if (eeh_pe_passed(pe)) {
+		rc = 0;
+		goto dn_unlock;
+	}
 
 	/* If we already have a pending isolation event for this
 	 * slot, we know it's bad already, we don't need to check.
@@ -499,8 +533,6 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * in one slot might report errors simultaneously, and we
 	 * only want one error recovery routine running.
 	 */
-	eeh_serialize_lock(&flags);
-	rc = 1;
 	if (pe->state & EEH_PE_ISOLATED) {
 		pe->check_count++;
 		if (pe->check_count == EEH_MAX_FAILS) {
@@ -516,6 +548,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 				eeh_driver_name(dev));
 			dump_stack();
 		}
+		rc = 1;
 		goto dn_unlock;
 	}
 
@@ -526,7 +559,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * function zero of a multi-function device.
 	 * In any case they must share a common PHB.
 	 */
-	ret = eeh_ops->get_state(pe, NULL);
+	rc = eeh_ops->get_state(pe, NULL);
 
 	/* Note that config-io to empty slots may fail;
 	 * they are empty when they don't have children.
@@ -534,8 +567,8 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * PE's state, EEH not support and Permanently unavailable
 	 * state, PE is in good state.
 	 */
-	if ((ret < 0) ||
-	    (ret == EEH_STATE_NOT_SUPPORT) || eeh_state_active(ret)) {
+	if ((rc < 0) ||
+	    (rc == EEH_STATE_NOT_SUPPORT) || eeh_state_active(rc)) {
 		eeh_stats.false_positives++;
 		pe->false_positives++;
 		rc = 0;
@@ -554,8 +587,8 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 			break;
 
 		/* Frozen parent PE ? */
-		ret = eeh_ops->get_state(parent_pe, NULL);
-		if (ret > 0 && !eeh_state_active(ret)) {
+		rc = eeh_ops->get_state(parent_pe, NULL);
+		if (rc > 0 && !eeh_state_active(rc)) {
 			pe = parent_pe;
 			pr_err("EEH: Failure of PHB#%x-PE#%x will be handled at parent PHB#%x-PE#%x.\n",
 			       pe->phb->global_number, pe->addr,
@@ -573,7 +606,6 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	 * bridges.
 	 */
 	eeh_pe_mark_isolated(pe);
-	eeh_serialize_unlock(flags);
 
 	/* Most EEH events are due to device driver bugs.  Having
 	 * a stack trace will help the device-driver authors figure
@@ -582,6 +614,7 @@ int eeh_dev_check_failure(struct eeh_dev *edev)
 	pr_debug("EEH: %s: Frozen PHB#%x-PE#%x detected\n",
 		__func__, pe->phb->global_number, pe->addr);
 	eeh_send_failure_event(pe);
+	eeh_serialize_unlock(flags);
 
 	return 1;
 
@@ -685,7 +718,7 @@ int eeh_pci_enable(struct eeh_pe *pe, int function)
 
 	/* Check if the request is finished successfully */
 	if (active_flag) {
-		rc = eeh_wait_state(pe, PCI_BUS_RESET_WAIT_MSEC);
+		rc = eeh_wait_state(pe, PCI_BUS_RESET_WAIT_MSEC, false);
 		if (rc < 0)
 			return rc;
 
@@ -942,7 +975,7 @@ int eeh_pe_reset_full(struct eeh_pe *pe, bool include_passed)
 				pe->phb->global_number, pe->addr, i + 1);
 
 		/* Wait until the PE is in a functioning state */
-		state = eeh_wait_state(pe, PCI_BUS_RESET_WAIT_MSEC);
+		state = eeh_wait_state(pe, PCI_BUS_RESET_WAIT_MSEC, false);
 		if (state < 0) {
 			pr_warn("EEH: Unrecoverable slot failure on PHB#%x-PE#%x",
 				pe->phb->global_number, pe->addr);
@@ -1113,7 +1146,9 @@ static int eeh_device_notifier(struct notifier_block *nb,
 
 	switch (action) {
 	case BUS_NOTIFY_DEL_DEVICE:
+		eeh_recovery_lock();
 		eeh_remove_device(to_pci_dev(dev));
+		eeh_recovery_unlock();
 		break;
 	default:
 		break;
@@ -1195,6 +1230,7 @@ void eeh_add_device_late(struct pci_dev *dev)
 {
 	struct pci_dn *pdn;
 	struct eeh_dev *edev;
+	unsigned long flags;
 
 	if (!dev)
 		return;
@@ -1211,8 +1247,12 @@ void eeh_add_device_late(struct pci_dev *dev)
 	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
 		eeh_ops->probe(pdn, NULL);
 
+	/* Both locks are required to make changes */
+	eeh_recovery_must_be_locked();
+	eeh_serialize_lock(&flags);
 	edev->pdev = dev;
 	dev->dev.archdata.edev = edev;
+	eeh_serialize_unlock(flags);
 
 	eeh_addr_cache_insert_dev(dev);
 }
@@ -1278,6 +1318,7 @@ EXPORT_SYMBOL_GPL(eeh_add_sysfs_files);
 void eeh_remove_device(struct pci_dev *dev)
 {
 	struct eeh_dev *edev;
+	unsigned long flags;
 
 	if (!dev || !eeh_enabled())
 		return;
@@ -1297,7 +1338,11 @@ void eeh_remove_device(struct pci_dev *dev)
 	 * a bit later. So we keep it for BAR restore and remove it
 	 * from the parent PE during the BAR resotre.
 	 */
+	/* Both locks are required to make changes */
+	eeh_recovery_must_be_locked();
+	eeh_serialize_lock(&flags);
 	edev->pdev = NULL;
+	eeh_serialize_unlock(flags);
 
 	/*
 	 * eeh_sysfs_remove_device() uses pci_dev_to_eeh_dev() so we need to
@@ -1323,7 +1368,11 @@ void eeh_remove_device(struct pci_dev *dev)
 	 * for the VF EEH device.
 	 */
 	edev->in_error = false;
+	/* Both locks are required to make changes */
+	eeh_recovery_must_be_locked();
+	eeh_serialize_lock(&flags);
 	dev->dev.archdata.edev = NULL;
+	eeh_serialize_unlock(flags);
 	if (!(edev->pe->state & EEH_PE_KEEP))
 		eeh_rmv_from_parent_pe(edev);
 	else
@@ -1419,7 +1468,7 @@ int eeh_dev_open(struct pci_dev *pdev)
 	struct eeh_dev *edev;
 	int ret = -ENODEV;
 
-	mutex_lock(&eeh_dev_mutex);
+	eeh_recovery_lock();
 
 	/* No PCI device ? */
 	if (!pdev)
@@ -1442,11 +1491,11 @@ int eeh_dev_open(struct pci_dev *pdev)
 
 	/* Increase PE's pass through count */
 	atomic_inc(&edev->pe->pass_dev_cnt);
-	mutex_unlock(&eeh_dev_mutex);
+	eeh_recovery_unlock();
 
 	return 0;
 out:
-	mutex_unlock(&eeh_dev_mutex);
+	eeh_recovery_unlock();
 	return ret;
 }
 EXPORT_SYMBOL_GPL(eeh_dev_open);
@@ -1463,7 +1512,7 @@ void eeh_dev_release(struct pci_dev *pdev)
 {
 	struct eeh_dev *edev;
 
-	mutex_lock(&eeh_dev_mutex);
+	eeh_recovery_lock();
 
 	/* No PCI device ? */
 	if (!pdev)
@@ -1478,7 +1527,7 @@ void eeh_dev_release(struct pci_dev *pdev)
 	WARN_ON(atomic_dec_if_positive(&edev->pe->pass_dev_cnt) < 0);
 	eeh_pe_change_owner(edev->pe);
 out:
-	mutex_unlock(&eeh_dev_mutex);
+	eeh_recovery_unlock();
 }
 EXPORT_SYMBOL(eeh_dev_release);
 
@@ -1834,6 +1883,7 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 	struct eeh_pe *pe;
 	char buf[20];
 	int ret;
+	unsigned long flags;
 
 	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
 	if (!ret)
@@ -1870,7 +1920,9 @@ static ssize_t eeh_force_recover_write(struct file *filp,
 	 * from an odd state (e.g. PE removed, or recovery of a
 	 * non-isolated PE)
 	 */
+	eeh_serialize_lock(&flags);
 	__eeh_send_failure_event(pe);
+	eeh_serialize_unlock(flags);
 
 	return ret < 0 ? ret : count;
 }
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 7b048cee767c..f21e0910f80a 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -248,38 +248,50 @@ static void eeh_set_irq_state(struct eeh_pe *root, bool enable)
 	}
 }
 
-typedef enum pci_ers_result (*eeh_report_fn)(struct eeh_dev *,
-					     struct pci_dev *,
+typedef enum pci_ers_result (*eeh_report_fn)(struct pci_dev *,
 					     struct pci_driver *);
-static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
+static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
 			       enum pci_ers_result *result)
 {
-	struct pci_dev *pdev;
+	struct eeh_dev *edev;
 	struct pci_driver *driver;
+	bool actionable, late, removed, passed;
 	enum pci_ers_result new_result;
 
-	pci_lock_rescan_remove();
-	pdev = edev->pdev;
-	if (pdev)
-		get_device(&pdev->dev);
-	pci_unlock_rescan_remove();
-	if (!pdev) {
-		eeh_edev_info(edev, "no device");
+	edev = pci_dev_to_eeh_dev(pdev);
+	if (!edev) {
+		pci_info(pdev, "no EEH state for device");
 		return;
 	}
-	device_lock(&pdev->dev);
-	if (eeh_edev_actionable(edev)) {
+	/* Cache some useful values before releasing the lock: */
+	actionable = eeh_edev_actionable(edev);
+	late = edev->mode & EEH_DEV_NO_HANDLER;
+	removed = eeh_dev_removed(edev);
+	passed = eeh_pe_passed(edev->pe);
+	if (actionable) {
+		/*
+		 * Driver callbacks may end up calling back into EEH functions
+		 * (for example by removing a PCI device) which will deadlock
+		 * unless the EEH locks are released first. Note that it may be
+		 * re-acquired by the report functions, if necessary.
+		 */
+		eeh_recovery_unlock();
+		device_lock(&pdev->dev);
 		driver = eeh_pcid_get(pdev);
 
 		if (!driver)
-			eeh_edev_info(edev, "no driver");
+			pci_info(pdev, "no driver");
 		else if (!driver->err_handler)
-			eeh_edev_info(edev, "driver not EEH aware");
-		else if (edev->mode & EEH_DEV_NO_HANDLER)
-			eeh_edev_info(edev, "driver bound too late");
+			pci_info(pdev, "driver not EEH aware");
+		else if (late)
+			pci_info(pdev, "driver bound too late");
 		else {
-			new_result = fn(edev, pdev, driver);
-			eeh_edev_info(edev, "%s driver reports: '%s'",
+			new_result = fn(pdev, driver);
+			/*
+			 * It's not safe to use edev here, because the locks
+			 * have been released and devices could have changed.
+			 */
+			pci_info(pdev, "%s driver reports: '%s'",
 				      driver->name,
 				      pci_ers_result_name(new_result));
 			if (result)
@@ -288,25 +300,72 @@ static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
 		}
 		if (driver)
 			eeh_pcid_put(pdev);
+		device_unlock(&pdev->dev);
+		eeh_recovery_lock();
 	} else {
-		eeh_edev_info(edev, "not actionable (%d,%d,%d)", !!pdev,
-			      !eeh_dev_removed(edev), !eeh_pe_passed(edev->pe));
+		pci_info(pdev, "not actionable (%d,%d,%d)", !!pdev,
+			 !removed, !passed);
 	}
-	device_unlock(&pdev->dev);
-	if (edev->pdev != pdev)
-		eeh_edev_warn(edev, "Device changed during processing!\n");
-	put_device(&pdev->dev);
 }
 
-static void eeh_pe_report(const char *name, struct eeh_pe *root,
-			  eeh_report_fn fn, enum pci_ers_result *result)
+struct pci_dev **pdev_cache_list_create(struct eeh_pe *root)
 {
 	struct eeh_pe *pe;
 	struct eeh_dev *edev, *tmp;
+	struct pci_dev **pdevs;
+	int i, n;
+
+	n = 0;
+	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
+		if (edev->pdev)
+			n++;
+	}
+	pdevs = kmalloc(sizeof(*pdevs) * (n + 1), GFP_KERNEL);
+	if (WARN_ON_ONCE(!pdevs))
+		return NULL;
+	i = 0;
+	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp) {
+		if (i < n) {
+			get_device(&edev->pdev->dev);
+			pdevs[i++] = edev->pdev;
+		}
+	}
+	if (WARN_ON_ONCE(i < n))
+		n = i;
+	pdevs[n] = NULL; /* terminator */
+	return pdevs;
+}
+
+static void pdev_cache_list_destroy(struct pci_dev **pdevs)
+{
+	struct pci_dev **pdevp;
+
+	for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
+		put_device(&(*pdevp)->dev);
+	kfree(pdevs);
+}
+
+static void eeh_pe_report(const char *name, struct eeh_pe *root,
+			  eeh_report_fn fn, enum pci_ers_result *result)
+{
+	struct pci_dev **pdevs, **pdevp;
 
 	pr_info("EEH: Beginning: '%s'\n", name);
-	eeh_for_each_pe(root, pe) eeh_pe_for_each_dev(pe, edev, tmp)
-		eeh_pe_report_edev(edev, fn, result);
+	/*
+	 * It would be convenient to continue to hold the recovery lock here
+	 * but driver callbacks can take a very long time or never return at
+	 * all.
+	 */
+	pdevs = pdev_cache_list_create(root);
+	for (pdevp = pdevs; pdevp && *pdevp; pdevp++) {
+		/*
+		 * NOTE! eeh_recovery_lock() is released briefly
+		 * in eeh_pe_report_pdev()
+		 */
+		eeh_pe_report_pdev(*pdevp, fn, result);
+	}
+	pdev_cache_list_destroy(pdevs);
+
 	if (result)
 		pr_info("EEH: Finished:'%s' with aggregate recovery state:'%s'\n",
 			name, pci_ers_result_name(*result));
@@ -316,50 +375,53 @@ static void eeh_pe_report(const char *name, struct eeh_pe *root,
 
 /**
  * eeh_report_error - Report pci error to each device driver
- * @edev: eeh device
+ * @pdev: eeh device
  * @driver: device's PCI driver
  *
  * Report an EEH error to each device driver.
  */
-static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
-					    struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_error(struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
+	struct eeh_dev *edev;
+	unsigned long flags;
 
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
-	eeh_edev_info(edev, "Invoking %s->error_detected(IO frozen)",
-		      driver->name);
+	pci_info(pdev, "Invoking %s->error_detected(IO frozen)", driver->name);
 	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
 
-	edev->in_error = true;
+	eeh_serialize_lock(&flags);
+	edev = pci_dev_to_eeh_dev(pdev);
+	if (edev)
+		edev->in_error = true;
+	eeh_serialize_unlock(flags);
 	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
 	return rc;
 }
 
 /**
  * eeh_report_mmio_enabled - Tell drivers that MMIO has been enabled
- * @edev: eeh device
+ * @pdev: eeh device
  * @driver: device's PCI driver
  *
  * Tells each device driver that IO ports, MMIO and config space I/O
  * are now enabled.
  */
-static enum pci_ers_result eeh_report_mmio_enabled(struct eeh_dev *edev,
-						   struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_mmio_enabled(struct pci_dev *pdev,
 						   struct pci_driver *driver)
 {
 	if (!driver->err_handler->mmio_enabled)
 		return PCI_ERS_RESULT_NONE;
-	eeh_edev_info(edev, "Invoking %s->mmio_enabled()", driver->name);
+	pci_info(pdev, "Invoking %s->mmio_enabled()", driver->name);
 	return driver->err_handler->mmio_enabled(pdev);
 }
 
 /**
  * eeh_report_reset - Tell device that slot has been reset
- * @edev: eeh device
+ * @pdev: eeh device
  * @driver: device's PCI driver
  *
  * This routine must be called while EEH tries to reset particular
@@ -367,13 +429,20 @@ static enum pci_ers_result eeh_report_mmio_enabled(struct eeh_dev *edev,
  * some actions, usually to save data the driver needs so that the
  * driver can work again while the device is recovered.
  */
-static enum pci_ers_result eeh_report_reset(struct eeh_dev *edev,
-					    struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_reset(struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
-	if (!driver->err_handler->slot_reset || !edev->in_error)
+	struct eeh_dev *edev;
+	unsigned long flags;
+
+	eeh_serialize_lock(&flags);
+	edev = pci_dev_to_eeh_dev(pdev);
+	if (!driver->err_handler->slot_reset || !edev->in_error) {
+		eeh_serialize_unlock(flags);
 		return PCI_ERS_RESULT_NONE;
-	eeh_edev_info(edev, "Invoking %s->slot_reset()", driver->name);
+	}
+	eeh_serialize_unlock(flags);
+	pci_info(pdev, "Invoking %s->slot_reset()", driver->name);
 	return driver->err_handler->slot_reset(pdev);
 }
 
@@ -406,41 +475,49 @@ static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
 
 /**
  * eeh_report_resume - Tell device to resume normal operations
- * @edev: eeh device
+ * @pdev: eeh device
  * @driver: device's PCI driver
  *
  * This routine must be called to notify the device driver that it
  * could resume so that the device driver can do some initialization
  * to make the recovered device work again.
  */
-static enum pci_ers_result eeh_report_resume(struct eeh_dev *edev,
-					     struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_resume(struct pci_dev *pdev,
 					     struct pci_driver *driver)
 {
-	if (!driver->err_handler->resume || !edev->in_error)
+	struct eeh_dev *edev;
+	unsigned long flags;
+
+	eeh_serialize_lock(&flags);
+	edev = pci_dev_to_eeh_dev(pdev);
+	if (!driver->err_handler->resume || !edev->in_error) {
+		eeh_serialize_unlock(flags);
 		return PCI_ERS_RESULT_NONE;
+	}
+	eeh_serialize_unlock(flags);
 
-	eeh_edev_info(edev, "Invoking %s->resume()", driver->name);
+	pci_info(pdev, "Invoking %s->resume()", driver->name);
 	driver->err_handler->resume(pdev);
 
-	pci_uevent_ers(edev->pdev, PCI_ERS_RESULT_RECOVERED);
+	pci_uevent_ers(pdev, PCI_ERS_RESULT_RECOVERED);
 #ifdef CONFIG_PCI_IOV
+	eeh_serialize_lock(&flags);
 	if (eeh_ops->notify_resume && eeh_dev_to_pdn(edev))
 		eeh_ops->notify_resume(eeh_dev_to_pdn(edev));
+	eeh_serialize_unlock(flags);
 #endif
 	return PCI_ERS_RESULT_NONE;
 }
 
 /**
  * eeh_report_failure - Tell device driver that device is dead.
- * @edev: eeh device
+ * @pdev: eeh device
  * @driver: device's PCI driver
  *
  * This informs the device driver that the device is permanently
  * dead, and that no further recovery attempts will be made on it.
  */
-static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
-					      struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_failure(struct pci_dev *pdev,
 					      struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
@@ -448,8 +525,8 @@ static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
-	eeh_edev_info(edev, "Invoking %s->error_detected(permanent failure)",
-		      driver->name);
+	pci_info(pdev, "Invoking %s->error_detected(permanent failure)",
+		 driver->name);
 	rc = driver->err_handler->error_detected(pdev,
 						 pci_channel_io_perm_failure);
 
@@ -477,17 +554,44 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
 	}
 
 #ifdef CONFIG_PCI_IOV
-	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);
+	{
+		struct pci_dev *physfn = edev->physfn;
+		int vf_index = eeh_dev_to_pdn(edev)->vf_index;
+
+		get_device(&physfn->dev);
+		eeh_recovery_unlock();
+		/*
+		 * This PCI operation will call back into EEH code where the
+		 * recovery lock will be acquired, so it must be released here,
+		 * first:
+		 */
+		pci_iov_add_virtfn(physfn, vf_index);
+		put_device(&physfn->dev);
+		eeh_recovery_lock();
+	}
 #endif
 	return NULL;
 }
 
-static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
+/*
+ * It's important that this function take a pdev as a parameter, because they
+ * are protected by a reference count. An edev could be lost when the recovery
+ * lock is dropped (which it must be in order to take the PCI rescan/remove
+ * lock without risking a deadlock).
+ */
+static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
 {
+	struct eeh_dev *edev;
 	struct pci_driver *driver;
-	struct pci_dev *dev = eeh_dev_to_pci_dev(edev);
 	struct eeh_rmv_data *rmv_data = (struct eeh_rmv_data *)userdata;
+	unsigned long flags;
 
+	edev = pci_dev_to_eeh_dev(pdev);
+	if (!edev) {
+		pci_warn(pdev, "EEH: Device removed during processing (#%d)\n",
+			 __LINE__);
+		return;
+	}
 	/*
 	 * Actually, we should remove the PCI bridges as well.
 	 * However, that's lots of complexity to do that,
@@ -496,25 +600,24 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 	 * simplicity here.
 	 */
 	if (!eeh_edev_actionable(edev) ||
-	    (dev->hdr_type == PCI_HEADER_TYPE_BRIDGE))
+	    (pdev->hdr_type == PCI_HEADER_TYPE_BRIDGE))
 		return;
 
 	if (rmv_data) {
-		driver = eeh_pcid_get(dev);
+		driver = eeh_pcid_get(pdev);
 		if (driver) {
 			if (driver->err_handler &&
 			    driver->err_handler->error_detected &&
 			    driver->err_handler->slot_reset) {
-				eeh_pcid_put(dev);
+				eeh_pcid_put(pdev);
 				return;
 			}
-			eeh_pcid_put(dev);
+			eeh_pcid_put(pdev);
 		}
 	}
 
 	/* Remove it from PCI subsystem */
-	pr_info("EEH: Removing %s without EEH sensitive driver\n",
-		pci_name(dev));
+	pci_info(pdev, "EEH: Removing device without EEH sensitive driver\n");
 	edev->mode |= EEH_DEV_DISCONNECTED;
 	if (rmv_data)
 		rmv_data->removed_dev_count++;
@@ -523,15 +626,32 @@ static void eeh_rmv_device(struct eeh_dev *edev, void *userdata)
 #ifdef CONFIG_PCI_IOV
 		struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 
+		eeh_recovery_unlock();
+		/*
+		 * This PCI operation will call back into EEH code where
+		 * the recovery lock will be acquired, so it must be released
+		 * here, first:
+		 */
 		pci_iov_remove_virtfn(edev->physfn, pdn->vf_index);
+		eeh_recovery_lock();
+
+		/* Both locks are required to make changes */
+		eeh_serialize_lock(&flags);
 		edev->pdev = NULL;
+		eeh_serialize_unlock(flags);
 #endif
 		if (rmv_data)
 			list_add(&edev->rmv_entry, &rmv_data->removed_vf_list);
 	} else {
+		/*
+		 * Lock ordering requires that the recovery lock be released
+		 * before acquiring the PCI rescan/remove lock.
+		 */
+		eeh_recovery_unlock();
 		pci_lock_rescan_remove();
-		pci_stop_and_remove_bus_device(dev);
+		pci_stop_and_remove_bus_device(pdev);
 		pci_unlock_rescan_remove();
+		eeh_recovery_lock();
 	}
 }
 
@@ -629,6 +749,7 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 {
 	time64_t tstamp;
 	int cnt, rc;
+	struct pci_dev **pdevs, **pdevp;
 	struct eeh_dev *edev;
 	struct eeh_pe *tmp_pe;
 	bool any_passed = false;
@@ -648,11 +769,22 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	 */
 	eeh_pe_state_mark(pe, EEH_PE_KEEP);
 	if (any_passed || driver_eeh_aware || (pe->type & EEH_PE_VF)) {
-		eeh_pe_dev_traverse(pe, eeh_rmv_device, rmv_data);
+		/*
+		 * eeh_rmv_device() may need to release the recovery lock to
+		 * remove a PCI device so we can't rely on the PE lists staying
+		 * valid:
+		 */
+		pdevs = pdev_cache_list_create(pe);
+		/* eeh_rmv_device() may re-acquire the recovery lock */
+		for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
+			eeh_rmv_device(*pdevp, rmv_data);
+		pdev_cache_list_destroy(pdevs);
 	} else {
+		eeh_recovery_unlock();
 		pci_lock_rescan_remove();
 		pci_hp_remove_devices(bus);
 		pci_unlock_rescan_remove();
+		eeh_recovery_lock();
 	}
 
 	/*
@@ -668,7 +800,13 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	if (rc)
 		return rc;
 
+	/*
+	 * The PCI rescan/remove lock must always be taken first, but we need
+	 * both here:
+	 */
+	eeh_recovery_unlock();
 	pci_lock_rescan_remove();
+	eeh_recovery_lock();
 
 	/* Restore PE */
 	eeh_ops->configure_bridge(pe);
@@ -676,10 +814,9 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 
 	/* Clear frozen state */
 	rc = eeh_clear_pe_frozen_state(pe, false);
-	if (rc) {
-		pci_unlock_rescan_remove();
+	pci_unlock_rescan_remove();
+	if (rc)
 		return rc;
-	}
 
 	/* Give the system 5 seconds to finish running the user-space
 	 * hotplug shutdown scripts, e.g. ifdown for ethernet.  Yes,
@@ -690,7 +827,9 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	if (!driver_eeh_aware || rmv_data->removed_dev_count) {
 		pr_info("EEH: Sleep 5s ahead of %s hotplug\n",
 			(driver_eeh_aware ? "partial" : "complete"));
+		eeh_recovery_unlock();
 		ssleep(5);
+		eeh_recovery_lock();
 
 		/*
 		 * The EEH device is still connected with its parent
@@ -704,7 +843,16 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 		} else {
 			if (!driver_eeh_aware)
 				eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
+			/*
+			 * Lock ordering requires that the recovery lock be
+			 * released before acquiring the PCI rescan/remove
+			 * lock.
+			 */
+			eeh_recovery_unlock();
+			pci_lock_rescan_remove();
 			pci_hp_add_devices(bus);
+			pci_unlock_rescan_remove();
+			eeh_recovery_lock();
 		}
 	}
 	eeh_pe_state_clear(pe, EEH_PE_KEEP, true);
@@ -712,7 +860,6 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	pe->tstamp = tstamp;
 	pe->freeze_count = cnt;
 
-	pci_unlock_rescan_remove();
 	return 0;
 }
 
@@ -840,16 +987,19 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	struct pci_bus *bus;
 	struct eeh_dev *edev, *tmp;
 	struct eeh_pe *tmp_pe;
+	struct pci_dev **pdevs, **pdevp;
 	int rc = 0;
 	enum pci_ers_result result = PCI_ERS_RESULT_NONE;
 	struct eeh_rmv_data rmv_data =
 		{LIST_HEAD_INIT(rmv_data.removed_vf_list), 0};
 	int devices = 0;
 
+	eeh_recovery_lock();
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
 		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
 			__func__, pe->phb->global_number, pe->addr);
+		eeh_recovery_unlock();
 		return;
 	}
 
@@ -948,7 +1098,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * sometimes over 300 seconds for certain systems.
 	 */
 	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		rc = eeh_wait_state(pe, MAX_WAIT_FOR_RECOVERY*1000);
+		rc = eeh_wait_state(pe, MAX_WAIT_FOR_RECOVERY*1000, true);
 		if (rc < 0 || rc == EEH_STATE_NOT_SUPPORT) {
 			pr_warn("EEH: Permanent failure\n");
 			result = PCI_ERS_RESULT_DISCONNECT;
@@ -1083,12 +1233,16 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		 * the their PCI config any more.
 		 */
 		if (pe->type & EEH_PE_VF) {
-			eeh_pe_dev_traverse(pe, eeh_rmv_device, NULL);
+			pdevs = pdev_cache_list_create(pe);
+			for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
+				eeh_rmv_device(*pdevp, NULL);
+			pdev_cache_list_destroy(pdevs);
 			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 		} else {
 			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 
+			eeh_recovery_unlock();
 			pci_lock_rescan_remove();
 			pci_hp_remove_devices(bus);
 			pci_unlock_rescan_remove();
@@ -1110,6 +1264,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			eeh_clear_slot_attention(edev->pdev);
 
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
+	eeh_recovery_unlock();
 }
 
 /**
@@ -1118,6 +1273,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
  * Called when an EEH event is detected but can't be narrowed down to a
  * specific PE.  Iterates through possible failures and handles them as
  * necessary.
+ * XXX TODO Needs to be checked sync work
  */
 void eeh_handle_special_event(void)
 {
diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
index 177852e39a25..999b91405581 100644
--- a/arch/powerpc/kernel/eeh_pe.c
+++ b/arch/powerpc/kernel/eeh_pe.c
@@ -102,8 +102,15 @@ int eeh_phb_pe_create(struct pci_controller *phb)
  *
  * Wait for the state of associated PE. It might take some time
  * to retrieve the PE's state.
+ *
+ * Note that if this function sleeps and unlock is true, the EEH recovery lock
+ * will be released and re-acquired.
+ * It is only safe to do this when the PE has the recovering flag set on it.
+ * This is important because the sleep may be
+ * very long (300 seconds) and device removal will be blocked by the recovery
+ * mutex. See eeh_device_notifier().
  */
-int eeh_wait_state(struct eeh_pe *pe, int max_wait)
+int eeh_wait_state(struct eeh_pe *pe, int max_wait, bool unlock)
 {
 	int ret;
 	int mwait;
@@ -119,6 +126,8 @@ int eeh_wait_state(struct eeh_pe *pe, int max_wait)
 #define EEH_STATE_MIN_WAIT_TIME	(1000)
 #define EEH_STATE_MAX_WAIT_TIME	(300 * 1000)
 
+	WARN_ON_ONCE(unlock && !(pe->state & EEH_PE_RECOVERING));
+
 	while (1) {
 		ret = eeh_ops->get_state(pe, &mwait);
 
@@ -141,7 +150,11 @@ int eeh_wait_state(struct eeh_pe *pe, int max_wait)
 			mwait = EEH_STATE_MAX_WAIT_TIME;
 		}
 
+		if (unlock)
+			eeh_recovery_unlock();
 		msleep(min(mwait, max_wait));
+		if (unlock)
+			eeh_recovery_lock();
 		max_wait -= mwait;
 	}
 }
@@ -363,15 +376,24 @@ static struct eeh_pe *eeh_pe_get_parent(struct eeh_dev *edev)
  * exists, the PE type will be changed to EEH_PE_BUS. Otherwise,
  * we have to create new PE to hold the EEH device and the new
  * PE will be linked to its parent PE as well.
+ *
+ * The pci rescan/remove lock must be held when calling this function.
  */
 int eeh_add_to_parent_pe(struct eeh_dev *edev)
 {
+	unsigned long flags;
 	struct eeh_pe *pe, *parent;
-	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
-	int config_addr = (pdn->busno << 8) | (pdn->devfn);
+	struct pci_dn *pdn;
+	int config_addr;
 
+	/* Both locks are required to make changes */
+	eeh_recovery_must_be_locked();
+	eeh_serialize_lock(&flags);
+	pdn = eeh_dev_to_pdn(edev);
+	config_addr = (pdn->busno << 8) | (pdn->devfn);
 	/* Check if the PE number is valid */
 	if (!eeh_has_flag(EEH_VALID_PE_ZERO) && !edev->pe_config_addr) {
+		eeh_serialize_unlock(flags);
 		eeh_edev_err(edev, "PE#0 is invalid for this PHB!\n");
 		return -EINVAL;
 	}
@@ -411,8 +433,14 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 			list_add_tail(&edev->entry, &pe->edevs);
 			eeh_edev_dbg(edev, "Added to bus PE\n");
 		}
+		eeh_serialize_unlock(flags);
 		return 0;
 	}
+	/*
+	 * Release the spinlock so that memory can be allocated without
+	 * using GFP_ATOMIC
+	 */
+	eeh_serialize_unlock(flags);
 
 	/* Create a new EEH PE */
 	if (edev->physfn)
@@ -432,6 +460,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	 * to PHB directly. Otherwise, we have to associate the
 	 * PE with its parent.
 	 */
+	eeh_serialize_lock(&flags);
 	parent = eeh_pe_get_parent(edev);
 	if (!parent) {
 		parent = eeh_phb_pe_get(pdn->phb);
@@ -445,6 +474,9 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	}
 	pe->parent = parent;
 
+	if (parent->state & EEH_PE_RECOVERING)
+		pe->state |= EEH_PE_RECOVERING;
+
 	/*
 	 * Put the newly created PE into the child list and
 	 * link the EEH device accordingly.
@@ -452,6 +484,7 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
 	list_add_tail(&pe->child, &parent->child_list);
 	list_add_tail(&edev->entry, &pe->edevs);
 	edev->pe = pe;
+	eeh_serialize_unlock(flags);
 	eeh_edev_dbg(edev, "Added to device PE (parent: PE#%x)\n",
 		     pe->parent->addr);
 
@@ -466,16 +499,23 @@ int eeh_add_to_parent_pe(struct eeh_dev *edev)
  * Also, the PCI devices or buses could be removed from the system
  * during EEH recovery. So we have to call the function remove the
  * corresponding PE accordingly if necessary.
+ *
+ * The pci rescan/remove lock must be held when calling this function.
  */
 int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 {
+	unsigned long flags;
 	struct eeh_pe *pe, *parent, *child;
 	bool keep, recover;
 	int cnt;
 
+	/* Both locks are required to make changes */
+	eeh_recovery_must_be_locked();
+	eeh_serialize_lock(&flags);
 	pe = eeh_dev_to_pe(edev);
 	if (!pe) {
 		eeh_edev_dbg(edev, "No PE found for device.\n");
+		eeh_serialize_unlock(flags);
 		return -EEXIST;
 	}
 
@@ -542,6 +582,7 @@ int eeh_rmv_from_parent_pe(struct eeh_dev *edev)
 		pe = parent;
 	}
 
+	eeh_serialize_unlock(flags);
 	return 0;
 }
 
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 427fc22f72b6..8de811804008 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -66,8 +66,11 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	eeh_dev_phb_init_dynamic(phb);
 
 	/* Register devices with EEH */
-	if (dev->dev.of_node->child)
+	if (dev->dev.of_node->child) {
+		eeh_recovery_lock();
 		eeh_add_device_tree_early(PCI_DN(dev->dev.of_node));
+		eeh_recovery_unlock();
+	}
 
 	/* Scan the bus */
 	pcibios_scan_phb(phb);
@@ -81,7 +84,9 @@ static int of_pci_phb_probe(struct platform_device *dev)
 	pcibios_claim_one_bus(phb->bus);
 
 	/* Finish EEH setup */
+	eeh_recovery_lock();
 	eeh_add_device_tree_late(phb->bus);
+	eeh_recovery_unlock();
 
 	/* Add probed PCI devices to the device model */
 	pci_bus_add_devices(phb->bus);
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index c6c03416a151..0fb75a2bac3c 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1400,13 +1400,17 @@ void pcibios_finish_adding_to_bus(struct pci_bus *bus)
 	}
 
 	/* Fixup EEH */
+	eeh_recovery_lock();
 	eeh_add_device_tree_late(bus);
+	eeh_recovery_unlock();
 
 	/* Add new devices to global lists.  Register in proc, sysfs. */
 	pci_bus_add_devices(bus);
 
 	/* sysfs files should only be added after devices are added */
+	eeh_recovery_lock();
 	eeh_add_sysfs_files(bus);
+	eeh_recovery_unlock();
 }
 EXPORT_SYMBOL_GPL(pcibios_finish_adding_to_bus);
 
diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index 28e9aa274f64..4066db91ca73 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -110,7 +110,9 @@ void pci_hp_add_devices(struct pci_bus *bus)
 	struct pci_controller *phb;
 	struct device_node *dn = pci_bus_to_OF_node(bus);
 
+	eeh_recovery_lock();
 	eeh_add_device_tree_early(PCI_DN(dn));
+	eeh_recovery_unlock();
 
 	phb = pci_bus_to_host(bus);
 
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 6f300ab7f0e9..1f6ec78ad88b 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -45,10 +45,12 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
 	if (!pdn || eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
+	eeh_recovery_lock();
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 	eeh_add_device_early(pdn);
 	eeh_add_device_late(pdev);
 	eeh_sysfs_add_device(pdev);
+	eeh_recovery_unlock();
 }
 
 static int pnv_eeh_init(void)
@@ -126,6 +128,7 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 	unsigned long addr, mask;
 	char buf[50];
 	int ret;
+	unsigned long flags;
 
 	if (!eeh_ops || !eeh_ops->err_inject)
 		return -ENXIO;
@@ -141,13 +144,21 @@ static ssize_t pnv_eeh_ei_write(struct file *filp,
 	if (ret != 5)
 		return -EINVAL;
 
+	/*
+	 * Use the spinlock rather than the mutex so that errors can be
+	 * injected during slow recovery operations (for testing).
+	 */
+	eeh_serialize_lock(&flags);
 	/* Retrieve PE */
 	pe = eeh_pe_get(hose, pe_no, 0);
-	if (!pe)
+	if (!pe) {
+		eeh_serialize_unlock(flags);
 		return -ENODEV;
+	}
 
 	/* Do error injection */
 	ret = eeh_ops->err_inject(pe, type, func, addr, mask);
+	eeh_serialize_unlock(flags);
 	return ret < 0 ? ret : count;
 }
 
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index c4ef03bec0de..c89a496a210d 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -44,11 +44,13 @@ static int ibm_configure_pe;
 
 void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 {
-	struct pci_dn *pdn = pci_get_pdn(pdev);
+	struct pci_dn *pdn;
 
 	if (eeh_has_flag(EEH_FORCE_DISABLED))
 		return;
 
+	eeh_recovery_lock();
+	pdn = pci_get_pdn(pdev);
 	dev_dbg(&pdev->dev, "EEH: Setting up device\n");
 #ifdef CONFIG_PCI_IOV
 	if (pdev->is_virtfn) {
@@ -79,6 +81,7 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
 	}
 #endif
 	eeh_sysfs_add_device(pdev);
+	eeh_recovery_unlock();
 }
 
 /*
diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
index 361986e4354e..90657bea4736 100644
--- a/arch/powerpc/platforms/pseries/pci_dlpar.c
+++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
@@ -36,8 +36,11 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
 	/* Create EEH devices for the PHB */
 	eeh_dev_phb_init_dynamic(phb);
 
-	if (dn->child)
+	if (dn->child) {
+		eeh_recovery_lock();
 		eeh_add_device_tree_early(PCI_DN(dn));
+		eeh_recovery_unlock();
+	}
 
 	pcibios_scan_phb(phb);
 	pcibios_finish_adding_to_bus(phb->bus);
diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 04565162a449..84ae9cde7344 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -768,7 +768,6 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 	u16 sts, lsts;
 	u8 presence;
 	bool added;
-	unsigned long flags;
 	int ret;
 
 	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &sts);
@@ -806,10 +805,10 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 		edev = pchild ? pci_dev_to_eeh_dev(pchild) : NULL;
 		pe = edev ? edev->pe : NULL;
 		if (pe) {
-			eeh_serialize_lock(&flags);
+			eeh_recovery_lock();
 			eeh_pe_mark_isolated(pe);
-			eeh_serialize_unlock(flags);
 			eeh_pe_set_option(pe, EEH_OPT_FREEZE_PE);
+			eeh_recovery_unlock();
 		}
 	}
 
diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
index 977946e4e613..81ac5e10aa46 100644
--- a/drivers/pci/hotplug/rpadlpar_core.c
+++ b/drivers/pci/hotplug/rpadlpar_core.c
@@ -140,7 +140,9 @@ static void dlpar_pci_add_bus(struct device_node *dn)
 	struct pci_controller *phb = pdn->phb;
 	struct pci_dev *dev = NULL;
 
+	eeh_recovery_lock();
 	eeh_add_device_tree_early(pdn);
+	eeh_recovery_unlock();
 
 	/* Add EADS device to PHB bus, adding new entry to bus->devices */
 	dev = of_create_pci_dev(dn, phb->bus, pdn->devfn);
diff --git a/drivers/vfio/vfio_spapr_eeh.c b/drivers/vfio/vfio_spapr_eeh.c
index 67f55ac1d459..2f184725af5a 100644
--- a/drivers/vfio/vfio_spapr_eeh.c
+++ b/drivers/vfio/vfio_spapr_eeh.c
@@ -54,6 +54,7 @@ long vfio_spapr_iommu_eeh_ioctl(struct iommu_group *group,
 		if (op.argsz < minsz || op.flags)
 			return -EINVAL;
 
+		eeh_recovery_lock();
 		switch (op.op) {
 		case VFIO_EEH_PE_DISABLE:
 			ret = eeh_pe_set_option(pe, EEH_OPT_DISABLE);
@@ -84,10 +85,14 @@ long vfio_spapr_iommu_eeh_ioctl(struct iommu_group *group,
 			break;
 		case VFIO_EEH_PE_INJECT_ERR:
 			minsz = offsetofend(struct vfio_eeh_pe_op, err.mask);
-			if (op.argsz < minsz)
+			if (op.argsz < minsz) {
+				eeh_recovery_unlock();
 				return -EINVAL;
-			if (copy_from_user(&op, (void __user *)arg, minsz))
+			}
+			if (copy_from_user(&op, (void __user *)arg, minsz)) {
+				eeh_recovery_unlock();
 				return -EFAULT;
+			}
 
 			ret = eeh_pe_inject_err(pe, op.err.type, op.err.func,
 						op.err.addr, op.err.mask);
@@ -95,6 +100,7 @@ long vfio_spapr_iommu_eeh_ioctl(struct iommu_group *group,
 		default:
 			ret = -EINVAL;
 		}
+		eeh_recovery_unlock();
 	}
 
 	return ret;
-- 
2.22.0.216.g00a2a96fc9

