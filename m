Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 873EF8FA2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:04:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468rpW08JdzDqsX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468rRw5TdczDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:48:28 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G4mIbf014611
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:26 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2udnsj808f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 00:48:26 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Fri, 16 Aug 2019 05:48:24 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 05:48:21 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G4mKWZ55312582
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 04:48:20 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB41042049;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 174214203F;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 16 Aug 2019 04:48:20 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 56653A03D2;
 Fri, 16 Aug 2019 14:48:16 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/12] powerpc/eeh: Fix crash when edev->pdev changes
Date: Fri, 16 Aug 2019 14:48:14 +1000
X-Mailer: git-send-email 2.22.0.216.g00a2a96fc9
In-Reply-To: <cover.1565930772.git.sbobroff@linux.ibm.com>
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19081604-0020-0000-0000-000003604063
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081604-0021-0000-0000-000021B561E9
Message-Id: <3c590579a0faa24d20c826dcd26c739eb4d454e6.1565930772.git.sbobroff@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160051
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a PCI device is removed during eeh_pe_report_edev(), between the
calls to device_lock() and device_unlock(), edev->pdev will change and
cause a crash as the wrong mutex is released.

To correct this, hold the PCI rescan/remove lock while taking a copy
of edev->pdev and performing a get_device() on it.  Use this value to
release the mutex, but also pass it through to the device driver's EEH
handlers so that they always see the same device.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
v5 * New in this version.

 arch/powerpc/kernel/eeh_driver.c | 44 +++++++++++++++++++++-----------
 1 file changed, 29 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 670b6159cef1..d0d175f22129 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -258,20 +258,27 @@ static void eeh_set_irq_state(struct eeh_pe *root, bool enable)
 }
 
 typedef enum pci_ers_result (*eeh_report_fn)(struct eeh_dev *,
+					     struct pci_dev *,
 					     struct pci_driver *);
 static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
 			       enum pci_ers_result *result)
 {
+	struct pci_dev *pdev;
 	struct pci_driver *driver;
 	enum pci_ers_result new_result;
 
-	if (!edev->pdev) {
+	pci_lock_rescan_remove();
+	pdev = edev->pdev;
+	if (pdev)
+		get_device(&pdev->dev);
+	pci_unlock_rescan_remove();
+	if (!pdev) {
 		eeh_edev_info(edev, "no device");
 		return;
 	}
-	device_lock(&edev->pdev->dev);
+	device_lock(&pdev->dev);
 	if (eeh_edev_actionable(edev)) {
-		driver = eeh_pcid_get(edev->pdev);
+		driver = eeh_pcid_get(pdev);
 
 		if (!driver)
 			eeh_edev_info(edev, "no driver");
@@ -280,7 +287,7 @@ static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
 		else if (edev->mode & EEH_DEV_NO_HANDLER)
 			eeh_edev_info(edev, "driver bound too late");
 		else {
-			new_result = fn(edev, driver);
+			new_result = fn(edev, pdev, driver);
 			eeh_edev_info(edev, "%s driver reports: '%s'",
 				      driver->name,
 				      pci_ers_result_name(new_result));
@@ -289,12 +296,15 @@ static void eeh_pe_report_edev(struct eeh_dev *edev, eeh_report_fn fn,
 							       new_result);
 		}
 		if (driver)
-			eeh_pcid_put(edev->pdev);
+			eeh_pcid_put(pdev);
 	} else {
-		eeh_edev_info(edev, "not actionable (%d,%d,%d)", !!edev->pdev,
+		eeh_edev_info(edev, "not actionable (%d,%d,%d)", !!pdev,
 			      !eeh_dev_removed(edev), !eeh_pe_passed(edev->pe));
 	}
-	device_unlock(&edev->pdev->dev);
+	device_unlock(&pdev->dev);
+	if (edev->pdev != pdev)
+		eeh_edev_warn(edev, "Device changed during processing!\n");
+	put_device(&pdev->dev);
 }
 
 static void eeh_pe_report(const char *name, struct eeh_pe *root,
@@ -321,20 +331,20 @@ static void eeh_pe_report(const char *name, struct eeh_pe *root,
  * Report an EEH error to each device driver.
  */
 static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
+					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
-	struct pci_dev *dev = edev->pdev;
 
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
 	eeh_edev_info(edev, "Invoking %s->error_detected(IO frozen)",
 		      driver->name);
-	rc = driver->err_handler->error_detected(dev, pci_channel_io_frozen);
+	rc = driver->err_handler->error_detected(pdev, pci_channel_io_frozen);
 
 	edev->in_error = true;
-	pci_uevent_ers(dev, PCI_ERS_RESULT_NONE);
+	pci_uevent_ers(pdev, PCI_ERS_RESULT_NONE);
 	return rc;
 }
 
@@ -347,12 +357,13 @@ static enum pci_ers_result eeh_report_error(struct eeh_dev *edev,
  * are now enabled.
  */
 static enum pci_ers_result eeh_report_mmio_enabled(struct eeh_dev *edev,
+						   struct pci_dev *pdev,
 						   struct pci_driver *driver)
 {
 	if (!driver->err_handler->mmio_enabled)
 		return PCI_ERS_RESULT_NONE;
 	eeh_edev_info(edev, "Invoking %s->mmio_enabled()", driver->name);
-	return driver->err_handler->mmio_enabled(edev->pdev);
+	return driver->err_handler->mmio_enabled(pdev);
 }
 
 /**
@@ -366,12 +377,13 @@ static enum pci_ers_result eeh_report_mmio_enabled(struct eeh_dev *edev,
  * driver can work again while the device is recovered.
  */
 static enum pci_ers_result eeh_report_reset(struct eeh_dev *edev,
+					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
 	if (!driver->err_handler->slot_reset || !edev->in_error)
 		return PCI_ERS_RESULT_NONE;
 	eeh_edev_info(edev, "Invoking %s->slot_reset()", driver->name);
-	return driver->err_handler->slot_reset(edev->pdev);
+	return driver->err_handler->slot_reset(pdev);
 }
 
 static void *eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
@@ -412,13 +424,14 @@ static void *eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
  * to make the recovered device work again.
  */
 static enum pci_ers_result eeh_report_resume(struct eeh_dev *edev,
+					     struct pci_dev *pdev,
 					     struct pci_driver *driver)
 {
 	if (!driver->err_handler->resume || !edev->in_error)
 		return PCI_ERS_RESULT_NONE;
 
 	eeh_edev_info(edev, "Invoking %s->resume()", driver->name);
-	driver->err_handler->resume(edev->pdev);
+	driver->err_handler->resume(pdev);
 
 	pci_uevent_ers(edev->pdev, PCI_ERS_RESULT_RECOVERED);
 #ifdef CONFIG_PCI_IOV
@@ -437,6 +450,7 @@ static enum pci_ers_result eeh_report_resume(struct eeh_dev *edev,
  * dead, and that no further recovery attempts will be made on it.
  */
 static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
+					      struct pci_dev *pdev,
 					      struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
@@ -446,10 +460,10 @@ static enum pci_ers_result eeh_report_failure(struct eeh_dev *edev,
 
 	eeh_edev_info(edev, "Invoking %s->error_detected(permanent failure)",
 		      driver->name);
-	rc = driver->err_handler->error_detected(edev->pdev,
+	rc = driver->err_handler->error_detected(pdev,
 						 pci_channel_io_perm_failure);
 
-	pci_uevent_ers(edev->pdev, PCI_ERS_RESULT_DISCONNECT);
+	pci_uevent_ers(pdev, PCI_ERS_RESULT_DISCONNECT);
 	return rc;
 }
 
-- 
2.22.0.216.g00a2a96fc9

