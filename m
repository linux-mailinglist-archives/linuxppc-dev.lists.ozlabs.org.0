Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367840194C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 11:53:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H33cQ2jkxz3c9R
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Sep 2021 19:53:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGbnMZUf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=schnelle@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HGbnMZUf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H33XM55M4z2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Sep 2021 19:49:39 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1869itWX113765; Mon, 6 Sep 2021 05:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=MfTBH/wj704sI78hkYKh8E/j6flSPX+WxBHk6F/st3w=;
 b=HGbnMZUf7A+UCwCMjD4VzsuioyEAiPZvfzQ7EiSnubWd2HmXCUt/Ij9DD1auHh2CoaE5
 ft2RqM/5n6FRPmxx0A+JfE/9nP279bwy6a2L38p4qVPlU2MGIUxLBBonIiRvhg8YTpAM
 mB6offVPxDrQfd7nfWWxKagIbc/LC+8c+ExthTZpyed0GR7/is8cwZ6CN8WRwj/xLHMw
 fnox9w4znC7uylvZnyU2/ifVbgNqqUBM4XIfBawSUCq5bQHnzXewW3f3znAdYnO/mF5g
 dtgdtQVhtCY40BXE5HHFT1UdejUyfYF5PoTOTjDy+4suAB38bM2FZ02nXZ8IgjdrrCOB HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awgmj02yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:37 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1869ixQI114118;
 Mon, 6 Sep 2021 05:49:36 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3awgmj02xr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 05:49:36 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1869lcF8009203;
 Mon, 6 Sep 2021 09:49:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3av02j1acd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Sep 2021 09:49:34 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1869jHNr59900194
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Sep 2021 09:45:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C3D42047;
 Mon,  6 Sep 2021 09:49:30 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 108664203F;
 Mon,  6 Sep 2021 09:49:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Sep 2021 09:49:29 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 5/5] s390/pci: implement minimal PCI error recovery
Date: Mon,  6 Sep 2021 11:49:27 +0200
Message-Id: <20210906094927.524106-6-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906094927.524106-1-schnelle@linux.ibm.com>
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -0M7NwmVOwrBqh-RzuIOmxy_aDRRc5yX
X-Proofpoint-ORIG-GUID: CxqUWo8_gVon-NnN8LNgzP04S4ObIIP5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-06_05:2021-09-03,
 2021-09-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2108310000
 definitions=main-2109060058
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
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When the platform detects an error on a PCI function or a service action
has been performed it is put in the error state and an error event
notification is provided to the OS.

Currently we treat all error event notifications the same and simply set
pdev->error_state = pci_channel_io_perm_failure requiring user
intervention such as use of the recover attribute to get the device
usable again. Despite requiring a manual step this also has the
disadvantage that the device is completely torn down and recreated
resulting in higher level devices such as a block or network device
being recreated. In case of a block device this also means that it may
need to be removed and added to a software raid even if that could
otherwise survive with a temporary degradation.

This is of course not ideal more so since an error notification with PEC
0x3A indicates that the platform already performed error recovery
successfully or that the error state was caused by a service action that
is now finished.

At least in this case we can assume that the error state can be reset
and the function made usable again. So as not to have the disadvantage
of a full tear down and recreation we need to coordinate this recovery
with the driver. Thankfully there is already a well defined recovery
flow for this described in Documentation/PCI/pci-error-recovery.rst.

The implementation of this is somewhat straight forward and simplified
by the fact that our recovery flow is defined per PCI function. As
a reset we use the newly introduced zpci_hot_reset_device() which also
takes the PCI function out of the error state.

Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 arch/s390/include/asm/pci.h |   4 +-
 arch/s390/pci/pci.c         |  49 ++++++++++
 arch/s390/pci/pci_event.c   | 190 +++++++++++++++++++++++++++++++++++-
 3 files changed, 241 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index 2a2ed165a270..558877aff2e5 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -294,8 +294,10 @@ void zpci_debug_exit(void);
 void zpci_debug_init_device(struct zpci_dev *, const char *);
 void zpci_debug_exit_device(struct zpci_dev *);
 
-/* Error reporting */
+/* Error handling */
 int zpci_report_error(struct pci_dev *, struct zpci_report_error_header *);
+int zpci_clear_error_state(struct zpci_dev *zdev);
+int zpci_reset_load_store_blocked(struct zpci_dev *zdev);
 
 #ifdef CONFIG_NUMA
 
diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
index a6322f45b5bd..77a3e85d43fb 100644
--- a/arch/s390/pci/pci.c
+++ b/arch/s390/pci/pci.c
@@ -954,6 +954,55 @@ int zpci_report_error(struct pci_dev *pdev,
 }
 EXPORT_SYMBOL(zpci_report_error);
 
+/**
+ * zpci_clear_error_state() - Clears the zPCI error state of the device
+ * @zdev: The zdev for which the zPCI error state should be reset
+ *
+ * Clear the zPCI error state of the device. If clearing the zPCI error state
+ * fails the device is left in the error state. In this case it may make sense
+ * to call zpci_io_perm_failure() on the associated pdev if it exists.
+ *
+ * Returns: 0 on success, -EIO otherwise
+ */
+int zpci_clear_error_state(struct zpci_dev *zdev)
+{
+	u64 req = ZPCI_CREATE_REQ(zdev->fh, 0, ZPCI_MOD_FC_RESET_ERROR);
+	struct zpci_fib fib = {0};
+	u8 status;
+	int rc;
+
+	rc = zpci_mod_fc(req, &fib, &status);
+	if (rc)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * zpci_reset_load_store_blocked() - Re-enables L/S from error state
+ * @zdev: The zdev for which to unblock load/store access
+ *
+ * R-eenables load/store access for a PCI function in the error state while
+ * keeping DMA blocked. In this state drivers can poke MMIO space to determine
+ * if error recovery is possible while catching any rogue DMA access from the
+ * device.
+ *
+ * Returns: 0 on success, -EIO otherwise
+ */
+int zpci_reset_load_store_blocked(struct zpci_dev *zdev)
+{
+	u64 req = ZPCI_CREATE_REQ(zdev->fh, 0, ZPCI_MOD_FC_RESET_BLOCK);
+	struct zpci_fib fib = {0};
+	u8 status;
+	int rc;
+
+	rc = zpci_mod_fc(req, &fib, &status);
+	if (rc)
+		return -EIO;
+
+	return 0;
+}
+
 static int zpci_mem_init(void)
 {
 	BUILD_BUG_ON(!is_power_of_2(__alignof__(struct zpci_fmb)) ||
diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
index e868d996ec5b..ac9ed1572d39 100644
--- a/arch/s390/pci/pci_event.c
+++ b/arch/s390/pci/pci_event.c
@@ -47,15 +47,190 @@ struct zpci_ccdf_avail {
 	u16 pec;			/* PCI event code */
 } __packed;
 
+static inline bool ers_result_indicates_abort(pci_ers_result_t ers_res)
+{
+	switch (ers_res) {
+	case PCI_ERS_RESULT_CAN_RECOVER:
+	case PCI_ERS_RESULT_RECOVERED:
+	case PCI_ERS_RESULT_NEED_RESET:
+		return false;
+	default:
+		return true;
+	}
+}
+
+static pci_ers_result_t zpci_event_notify_error_detected(struct pci_dev *pdev)
+{
+	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
+	struct pci_driver *driver = pdev->driver;
+
+	pr_debug("%s: calling error_detected() callback\n", pci_name(pdev));
+	ers_res = driver->err_handler->error_detected(pdev,  pdev->error_state);
+	if (ers_result_indicates_abort(ers_res))
+		pr_info("%s: driver can't recover\n", pci_name(pdev));
+	else if (ers_res == PCI_ERS_RESULT_NEED_RESET)
+		pr_debug("%s: driver needs reset to recover\n", pci_name(pdev));
+
+	return ers_res;
+}
+
+static pci_ers_result_t zpci_event_do_error_state_clear(struct pci_dev *pdev)
+{
+	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
+	struct pci_driver *driver = pdev->driver;
+	struct zpci_dev *zdev = to_zpci(pdev);
+	int rc;
+
+	pr_debug("%s: reset load/store blocked\n", pci_name(pdev));
+	rc = zpci_reset_load_store_blocked(zdev);
+	if (rc) {
+		pr_err("%s: reset load/store blocked failed\n", pci_name(pdev));
+		/* Let's try a full reset instead */
+		return PCI_ERS_RESULT_NEED_RESET;
+	}
+
+	if (driver->err_handler->mmio_enabled) {
+		pr_debug("%s: calling mmio_enabled() callback\n", pci_name(pdev));
+		ers_res = driver->err_handler->mmio_enabled(pdev);
+		if (ers_result_indicates_abort(ers_res)) {
+			pr_info("%s: driver can't recover after enabling MMIO\n", pci_name(pdev));
+			return ers_res;
+		} else if (ers_res == PCI_ERS_RESULT_NEED_RESET) {
+			pr_debug("%s: driver needs reset to recover\n", pci_name(pdev));
+			return ers_res;
+		}
+	}
+
+	pr_debug("%s: clearing error state\n", pci_name(pdev));
+	rc = zpci_clear_error_state(zdev);
+	if (!rc) {
+		pdev->error_state = pci_channel_io_normal;
+	} else {
+		pr_err("%s: resetting error state failed\n", pci_name(pdev));
+		/* Let's try a full reset instead */
+		return PCI_ERS_RESULT_NEED_RESET;
+	}
+
+	return ers_res;
+}
+
+static pci_ers_result_t zpci_event_do_reset(struct pci_dev *pdev)
+{
+	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
+	struct pci_driver *driver = pdev->driver;
+
+	pr_info("%s: initiating reset\n", pci_name(pdev));
+	if (zpci_hot_reset_device(to_zpci(pdev))) {
+		pr_err("%s: resetting function failed\n", pci_name(pdev));
+		return ers_res;
+	}
+	pdev->error_state = pci_channel_io_normal;
+	if (driver->err_handler->slot_reset) {
+		ers_res = driver->err_handler->slot_reset(pdev);
+		if (ers_result_indicates_abort(ers_res)) {
+			pr_info("%s: driver can't recover after slot reset\n", pci_name(pdev));
+			return ers_res;
+		}
+	}
+
+	return ers_res;
+}
+
+/* zpci_event_attempt_error_recovery - Try to recover the given PCI function
+ * @pdev: PCI function to recover currently in the error state
+ *
+ * We follow the scheme outlined in Documentation/PCI/pci-error-recovery.rst.
+ * With the simplification that recovery always happens per function
+ * and the platform determines which functions are affected for
+ * multi-function devices.
+ */
+static pci_ers_result_t zpci_event_attempt_error_recovery(struct pci_dev *pdev)
+{
+	pci_ers_result_t ers_res = PCI_ERS_RESULT_DISCONNECT;
+	struct pci_driver *driver;
+
+	/*
+	 * Ensure that the PCI function is not removed concurrently, no driver
+	 * is unbound or probed and that userspace can't access its
+	 * configuration space while we perform recovery.
+	 */
+	pci_dev_lock(pdev);
+	/*
+	 * Between getting the pdev and locking it the PCI device may have been
+	 * removed e.g. by a concurrent call to recover_store().
+	 */
+	if (!pci_dev_is_added(pdev))
+		goto out_unlock;
+	if (pdev->error_state == pci_channel_io_perm_failure) {
+		ers_res = PCI_ERS_RESULT_DISCONNECT;
+		goto out_unlock;
+	}
+	pdev->error_state = pci_channel_io_frozen;
+
+	driver = pdev->driver;
+	if (!driver || !driver->err_handler || !driver->err_handler->error_detected) {
+		pr_info("%s: driver does not support error recovery\n", pci_name(pdev));
+		goto out_unlock;
+	}
+
+	ers_res = zpci_event_notify_error_detected(pdev);
+	if (ers_result_indicates_abort(ers_res))
+		goto out_unlock;
+
+	if (ers_res == PCI_ERS_RESULT_CAN_RECOVER) {
+		ers_res = zpci_event_do_error_state_clear(pdev);
+		if (ers_result_indicates_abort(ers_res))
+			goto out_unlock;
+	}
+
+	if (ers_res == PCI_ERS_RESULT_NEED_RESET)
+		ers_res = zpci_event_do_reset(pdev);
+
+	if (ers_res != PCI_ERS_RESULT_RECOVERED) {
+		pr_err("%s: recovery failed\n", pci_name(pdev));
+		goto out_unlock;
+	}
+
+	pr_info("%s: resuming operations\n", pci_name(pdev));
+	if (driver->err_handler->resume)
+		driver->err_handler->resume(pdev);
+out_unlock:
+	pci_dev_unlock(pdev);
+
+	return ers_res;
+}
+
+/* zpci_event_io_failure - Report IO failure state es to driver
+ * @pdev: PCI function to report as failed
+ */
+static void zpci_event_io_failure(struct pci_dev *pdev, pci_channel_state_t es)
+{
+	struct pci_driver *driver;
+
+	pci_dev_lock(pdev);
+	if (!pci_dev_is_added(pdev))
+		goto out_unlock;
+	pdev->error_state = es;
+	driver = pdev->driver;
+	if (driver && driver->err_handler && driver->err_handler->error_detected)
+		driver->err_handler->error_detected(pdev, pdev->error_state);
+out_unlock:
+	pci_dev_unlock(pdev);
+}
+
 static void __zpci_event_error(struct zpci_ccdf_err *ccdf)
 {
 	struct zpci_dev *zdev = get_zdev_by_fid(ccdf->fid);
 	struct pci_dev *pdev = NULL;
+	pci_ers_result_t ers_res;
 
 	zpci_err("error CCDF:\n");
 	zpci_err_hex(ccdf, sizeof(*ccdf));
 
 	if (zdev)
+		zpci_update_fh(zdev, ccdf->fh);
+
+	if (zdev->zbus->bus)
 		pdev = pci_get_slot(zdev->zbus->bus, zdev->devfn);
 
 	pr_err("%s: Event 0x%x reports an error for PCI function 0x%x\n",
@@ -64,7 +239,20 @@ static void __zpci_event_error(struct zpci_ccdf_err *ccdf)
 	if (!pdev)
 		return;
 
-	pdev->error_state = pci_channel_io_perm_failure;
+	switch (ccdf->pec) {
+	case 0x003a: /* Service Action or Error Recovery Successful */
+		ers_res = zpci_event_attempt_error_recovery(pdev);
+		if (ers_res != PCI_ERS_RESULT_RECOVERED)
+			zpci_event_io_failure(pdev, pci_channel_io_perm_failure);
+		break;
+	default:
+		/*
+		 * Mark as frozen not permanently failed because the device
+		 * could be subsequently recovered by the platform.
+		 */
+		zpci_event_io_failure(pdev, pci_channel_io_frozen);
+		break;
+	}
 	pci_dev_put(pdev);
 }
 
-- 
2.25.1

