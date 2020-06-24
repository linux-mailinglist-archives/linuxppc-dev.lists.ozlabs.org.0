Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EAF206B9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 07:21:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sBMT0TXmzDqdZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 15:21:25 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sBKX4JvCzDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 15:19:43 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O50v60043451
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:19:40 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwytuj94-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 01:19:39 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05O5GQ4v010973
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:19:37 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31uus507h3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:19:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05O5IGGM60621208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:18:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A6E85204E
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:19:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 7DAFF52054
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 05:19:34 +0000 (GMT)
Received: from osmium.ibmuc.com (unknown [9.102.55.70])
 (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4670DA01FE
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 15:19:33 +1000 (AEST)
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH RFC 1/1] powerpc/eeh: Provide a unique ID for each EEH recovery
Date: Wed, 24 Jun 2020 15:19:32 +1000
Message-Id: <f81f645ba66b760c31f25014f03a0c3a4970f993.1592975969.git.sbobroff@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_01:2020-06-23,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 cotscore=-2147483648 suspectscore=1 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240033
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Give a unique ID to each recovery event, to ease log parsing and
prepare for parallel recovery.

Also add some new messages with a very simple format that may be
useful to log-parsers.

Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
---
This patch should be applied on top of my recent(ish) set:
"powerpc/eeh: Synchronization for safety".

 arch/powerpc/include/asm/eeh_event.h |   3 +-
 arch/powerpc/include/asm/ppc-pci.h   |   2 +-
 arch/powerpc/kernel/eeh.c            |  45 ++++---
 arch/powerpc/kernel/eeh_driver.c     | 189 +++++++++++++++------------
 arch/powerpc/kernel/eeh_event.c      |  12 +-
 5 files changed, 148 insertions(+), 103 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh_event.h b/arch/powerpc/include/asm/eeh_event.h
index dadde7d52f46..a1fe736bc4cf 100644
--- a/arch/powerpc/include/asm/eeh_event.h
+++ b/arch/powerpc/include/asm/eeh_event.h
@@ -17,13 +17,14 @@
 struct eeh_event {
 	struct list_head	list;	/* to form event queue	*/
 	struct eeh_pe		*pe;	/* EEH PE		*/
+	unsigned int		id;	/* Event ID		*/
 };
 
 int eeh_event_init(void);
 int eeh_send_failure_event(struct eeh_pe *pe);
 int __eeh_send_failure_event(struct eeh_pe *pe);
 void eeh_remove_event(struct eeh_pe *pe, bool force);
-void eeh_handle_normal_event(struct eeh_pe *pe);
+void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe);
 void eeh_handle_special_event(void);
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/ppc-pci.h b/arch/powerpc/include/asm/ppc-pci.h
index 7f4be5a05eb3..ec62b491ff97 100644
--- a/arch/powerpc/include/asm/ppc-pci.h
+++ b/arch/powerpc/include/asm/ppc-pci.h
@@ -47,7 +47,7 @@ extern int rtas_setup_phb(struct pci_controller *phb);
 void eeh_addr_cache_insert_dev(struct pci_dev *dev);
 void eeh_addr_cache_rmv_dev(struct pci_dev *dev);
 struct eeh_dev *eeh_addr_cache_get_dev(unsigned long addr);
-void eeh_slot_error_detail(struct eeh_pe *pe, int severity);
+void eeh_slot_error_detail(unsigned int event_id, struct eeh_pe *pe, int severity);
 int eeh_pci_enable(struct eeh_pe *pe, int function);
 int eeh_pe_reset_full(struct eeh_pe *pe, bool include_passed);
 void eeh_save_bars(struct eeh_dev *edev);
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 68e6dfa526a5..54f921ff7621 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -197,7 +197,8 @@ EXPORT_SYMBOL_GPL(eeh_recovery_must_be_locked);
  * for the indicated PCI device, and puts them into a buffer
  * for RTAS error logging.
  */
-static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
+static size_t eeh_dump_dev_log(unsigned int event_id, struct eeh_dev *edev,
+			       char *buf, size_t len)
 {
 	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
 	u32 cfg;
@@ -206,34 +207,37 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 	char buffer[128];
 
 	if (!pdn) {
-		pr_warn("EEH: Note: No error log for absent device.\n");
+		pr_warn("EEH(%u): Note: No error log for absent device.\n",
+			event_id);
 		return 0;
 	}
 
 	n += scnprintf(buf+n, len-n, "%04x:%02x:%02x.%01x\n",
 		       pdn->phb->global_number, pdn->busno,
 		       PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
-	pr_warn("EEH: of node=%04x:%02x:%02x.%01x\n",
+	pr_warn("EEH(%u): of node=%04x:%02x:%02x.%01x\n",
+		event_id,
 		pdn->phb->global_number, pdn->busno,
 		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
 
 	eeh_ops->read_config(pdn, PCI_VENDOR_ID, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
-	pr_warn("EEH: PCI device/vendor: %08x\n", cfg);
+	pr_warn("EEH(%u): PCI device/vendor: %08x\n", event_id, cfg);
 
 	eeh_ops->read_config(pdn, PCI_COMMAND, 4, &cfg);
 	n += scnprintf(buf+n, len-n, "cmd/stat:%x\n", cfg);
-	pr_warn("EEH: PCI cmd/status register: %08x\n", cfg);
+	pr_warn("EEH(%u): PCI cmd/status register: %08x\n", event_id, cfg);
 
 	/* Gather bridge-specific registers */
 	if (edev->mode & EEH_DEV_BRIDGE) {
 		eeh_ops->read_config(pdn, PCI_SEC_STATUS, 2, &cfg);
 		n += scnprintf(buf+n, len-n, "sec stat:%x\n", cfg);
-		pr_warn("EEH: Bridge secondary status: %04x\n", cfg);
+		pr_warn("EEH(%u): Bridge secondary status: %04x\n",
+			event_id, cfg);
 
 		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &cfg);
 		n += scnprintf(buf+n, len-n, "brdg ctl:%x\n", cfg);
-		pr_warn("EEH: Bridge control: %04x\n", cfg);
+		pr_warn("EEH(%u): Bridge control: %04x\n", event_id, cfg);
 	}
 
 	/* Dump out the PCI-X command and status regs */
@@ -241,18 +245,19 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 	if (cap) {
 		eeh_ops->read_config(pdn, cap, 4, &cfg);
 		n += scnprintf(buf+n, len-n, "pcix-cmd:%x\n", cfg);
-		pr_warn("EEH: PCI-X cmd: %08x\n", cfg);
+		pr_warn("EEH(%u): PCI-X cmd: %08x\n", event_id, cfg);
 
 		eeh_ops->read_config(pdn, cap+4, 4, &cfg);
 		n += scnprintf(buf+n, len-n, "pcix-stat:%x\n", cfg);
-		pr_warn("EEH: PCI-X status: %08x\n", cfg);
+		pr_warn("EEH(%u): PCI-X status: %08x\n", event_id, cfg);
 	}
 
 	/* If PCI-E capable, dump PCI-E cap 10 */
 	cap = edev->pcie_cap;
 	if (cap) {
 		n += scnprintf(buf+n, len-n, "pci-e cap10:\n");
-		pr_warn("EEH: PCI-E capabilities and status follow:\n");
+		pr_warn("EEH(%u): PCI-E capabilities and status follow:\n",
+			event_id);
 
 		for (i=0; i<=8; i++) {
 			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
@@ -263,8 +268,8 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 					pr_warn("%s\n", buffer);
 
 				l = scnprintf(buffer, sizeof(buffer),
-					      "EEH: PCI-E %02x: %08x ",
-					      4*i, cfg);
+					      "EEH(%u): PCI-E %02x: %08x ",
+					      event_id, 4*i, cfg);
 			} else {
 				l += scnprintf(buffer+l, sizeof(buffer)-l,
 					       "%08x ", cfg);
@@ -279,7 +284,8 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 	cap = edev->aer_cap;
 	if (cap) {
 		n += scnprintf(buf+n, len-n, "pci-e AER:\n");
-		pr_warn("EEH: PCI-E AER capability register set follows:\n");
+		pr_warn("EEH(%u): PCI-E AER capability register set follows:\n",
+			event_id);
 
 		for (i=0; i<=13; i++) {
 			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
@@ -304,16 +310,13 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
 	return n;
 }
 
-static void *eeh_dump_pe_log(struct eeh_pe *pe, void *flag)
+static void eeh_dump_pe_log(unsigned int event_id, struct eeh_pe *pe, size_t *plen)
 {
 	struct eeh_dev *edev, *tmp;
-	size_t *plen = flag;
 
 	eeh_pe_for_each_dev(pe, edev, tmp)
-		*plen += eeh_dump_dev_log(edev, pci_regs_buf + *plen,
+		*plen += eeh_dump_dev_log(event_id, edev, pci_regs_buf + *plen,
 					  EEH_PCI_REGS_LOG_LEN - *plen);
-
-	return NULL;
 }
 
 /**
@@ -326,9 +329,10 @@ static void *eeh_dump_pe_log(struct eeh_pe *pe, void *flag)
  * out from the config space of the corresponding PCI device, while
  * the error log is fetched through platform dependent function call.
  */
-void eeh_slot_error_detail(struct eeh_pe *pe, int severity)
+void eeh_slot_error_detail(unsigned int event_id, struct eeh_pe *pe, int severity)
 {
 	size_t loglen = 0;
+	struct eeh_pe *tmp_pe;
 
 	/*
 	 * When the PHB is fenced or dead, it's pointless to collect
@@ -368,7 +372,8 @@ void eeh_slot_error_detail(struct eeh_pe *pe, int severity)
 			eeh_pe_restore_bars(pe);
 
 			pci_regs_buf[0] = 0;
-			eeh_pe_traverse(pe, eeh_dump_pe_log, &loglen);
+			eeh_for_each_pe(pe, tmp_pe)
+				eeh_dump_pe_log(event_id, tmp_pe, &loglen);
 		}
 	}
 
diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index f21e0910f80a..0dbc218597e3 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -248,10 +248,13 @@ static void eeh_set_irq_state(struct eeh_pe *root, bool enable)
 	}
 }
 
-typedef enum pci_ers_result (*eeh_report_fn)(struct pci_dev *,
+typedef enum pci_ers_result (*eeh_report_fn)(unsigned int event_id,
+					     struct pci_dev *,
 					     struct pci_driver *);
-static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
-			       enum pci_ers_result *result)
+static void eeh_pe_report_pdev(unsigned int event_id,
+			       struct pci_dev *pdev, eeh_report_fn fn,
+			       enum pci_ers_result *result,
+			       const char *handler_name)
 {
 	struct eeh_dev *edev;
 	struct pci_driver *driver;
@@ -260,7 +263,7 @@ static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
 
 	edev = pci_dev_to_eeh_dev(pdev);
 	if (!edev) {
-		pci_info(pdev, "no EEH state for device");
+		pci_info(pdev, "EEH(%u): no EEH state for device", event_id);
 		return;
 	}
 	/* Cache some useful values before releasing the lock: */
@@ -280,19 +283,26 @@ static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
 		driver = eeh_pcid_get(pdev);
 
 		if (!driver)
-			pci_info(pdev, "no driver");
+			pci_info(pdev, "EEH(%u): no driver", event_id);
 		else if (!driver->err_handler)
-			pci_info(pdev, "driver not EEH aware");
+			pci_info(pdev, "EEH(%u): driver not EEH aware", event_id);
 		else if (late)
-			pci_info(pdev, "driver bound too late");
+			pci_info(pdev, "EEH(%u): driver bound too late", event_id);
 		else {
-			new_result = fn(pdev, driver);
+			pr_warn("EEH(%u): EVENT=HANDLER_CALL DEVICE=%04x:%02x:%02x.%x DRIVER='%s' HANDLER='%s'\n",
+				event_id, edev->controller->global_number,
+				PCI_BUSNO(edev->bdfn), PCI_SLOT(edev->bdfn),
+				PCI_FUNC(edev->bdfn), driver->name, handler_name);
+
+			new_result = fn(event_id, pdev, driver);
 			/*
 			 * It's not safe to use edev here, because the locks
 			 * have been released and devices could have changed.
 			 */
-			pci_info(pdev, "%s driver reports: '%s'",
-				      driver->name,
+			pr_warn("EEH(%u): EVENT=HANDLER_RETURN RESULT='%s'\n",
+				event_id, pci_ers_result_name(new_result));
+			pci_info(pdev, "EEH(%u): %s driver reports: %s",
+				      event_id, driver->name,
 				      pci_ers_result_name(new_result));
 			if (result)
 				*result = pci_ers_merge_result(*result,
@@ -303,8 +313,8 @@ static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
 		device_unlock(&pdev->dev);
 		eeh_recovery_lock();
 	} else {
-		pci_info(pdev, "not actionable (%d,%d,%d)", !!pdev,
-			 !removed, !passed);
+		pci_info(pdev, "EEH(%u): not actionable (%d,%d,%d)",
+			 event_id, !!pdev, !removed, !passed);
 	}
 }
 
@@ -345,12 +355,13 @@ static void pdev_cache_list_destroy(struct pci_dev **pdevs)
 	kfree(pdevs);
 }
 
-static void eeh_pe_report(const char *name, struct eeh_pe *root,
+static void eeh_pe_report(unsigned int event_id,
+			  const char *name, struct eeh_pe *root,
 			  eeh_report_fn fn, enum pci_ers_result *result)
 {
 	struct pci_dev **pdevs, **pdevp;
 
-	pr_info("EEH: Beginning: '%s'\n", name);
+	pr_info("EEH(%u): Beginning: '%s'\n", event_id, name);
 	/*
 	 * It would be convenient to continue to hold the recovery lock here
 	 * but driver callbacks can take a very long time or never return at
@@ -362,15 +373,15 @@ static void eeh_pe_report(const char *name, struct eeh_pe *root,
 		 * NOTE! eeh_recovery_lock() is released briefly
 		 * in eeh_pe_report_pdev()
 		 */
-		eeh_pe_report_pdev(*pdevp, fn, result);
+		eeh_pe_report_pdev(event_id, *pdevp, fn, result, name);
 	}
 	pdev_cache_list_destroy(pdevs);
 
 	if (result)
-		pr_info("EEH: Finished:'%s' with aggregate recovery state:'%s'\n",
-			name, pci_ers_result_name(*result));
+		pr_info("EEH(%u): Finished:'%s' with aggregate recovery state:'%s'\n",
+			event_id, name, pci_ers_result_name(*result));
 	else
-		pr_info("EEH: Finished:'%s'", name);
+		pr_info("EEH(%u): Finished:'%s'", event_id, name);
 }
 
 /**
@@ -380,7 +391,8 @@ static void eeh_pe_report(const char *name, struct eeh_pe *root,
  *
  * Report an EEH error to each device driver.
  */
-static enum pci_ers_result eeh_report_error(struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_error(unsigned int event_id,
+					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
@@ -410,12 +422,14 @@ static enum pci_ers_result eeh_report_error(struct pci_dev *pdev,
  * Tells each device driver that IO ports, MMIO and config space I/O
  * are now enabled.
  */
-static enum pci_ers_result eeh_report_mmio_enabled(struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_mmio_enabled(unsigned int event_id,
+						   struct pci_dev *pdev,
 						   struct pci_driver *driver)
 {
 	if (!driver->err_handler->mmio_enabled)
 		return PCI_ERS_RESULT_NONE;
-	pci_info(pdev, "Invoking %s->mmio_enabled()", driver->name);
+	pci_info(pdev, "EEH(%u): Invoking %s->mmio_enabled()",
+		 event_id, driver->name);
 	return driver->err_handler->mmio_enabled(pdev);
 }
 
@@ -429,7 +443,8 @@ static enum pci_ers_result eeh_report_mmio_enabled(struct pci_dev *pdev,
  * some actions, usually to save data the driver needs so that the
  * driver can work again while the device is recovered.
  */
-static enum pci_ers_result eeh_report_reset(struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_reset(unsigned int event_id,
+					    struct pci_dev *pdev,
 					    struct pci_driver *driver)
 {
 	struct eeh_dev *edev;
@@ -442,7 +457,8 @@ static enum pci_ers_result eeh_report_reset(struct pci_dev *pdev,
 		return PCI_ERS_RESULT_NONE;
 	}
 	eeh_serialize_unlock(flags);
-	pci_info(pdev, "Invoking %s->slot_reset()", driver->name);
+	pci_info(pdev, "EEH(%u): Invoking %s->slot_reset()",
+		 event_id, driver->name);
 	return driver->err_handler->slot_reset(pdev);
 }
 
@@ -482,7 +498,8 @@ static void eeh_dev_restore_state(struct eeh_dev *edev, void *userdata)
  * could resume so that the device driver can do some initialization
  * to make the recovered device work again.
  */
-static enum pci_ers_result eeh_report_resume(struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_resume(unsigned int event_id,
+					     struct pci_dev *pdev,
 					     struct pci_driver *driver)
 {
 	struct eeh_dev *edev;
@@ -496,7 +513,8 @@ static enum pci_ers_result eeh_report_resume(struct pci_dev *pdev,
 	}
 	eeh_serialize_unlock(flags);
 
-	pci_info(pdev, "Invoking %s->resume()", driver->name);
+	pci_info(pdev, "EEH(%u): Invoking %s->resume()",
+		 event_id, driver->name);
 	driver->err_handler->resume(pdev);
 
 	pci_uevent_ers(pdev, PCI_ERS_RESULT_RECOVERED);
@@ -517,7 +535,8 @@ static enum pci_ers_result eeh_report_resume(struct pci_dev *pdev,
  * This informs the device driver that the device is permanently
  * dead, and that no further recovery attempts will be made on it.
  */
-static enum pci_ers_result eeh_report_failure(struct pci_dev *pdev,
+static enum pci_ers_result eeh_report_failure(unsigned int event_id,
+					      struct pci_dev *pdev,
 					      struct pci_driver *driver)
 {
 	enum pci_ers_result rc;
@@ -525,8 +544,8 @@ static enum pci_ers_result eeh_report_failure(struct pci_dev *pdev,
 	if (!driver->err_handler->error_detected)
 		return PCI_ERS_RESULT_NONE;
 
-	pci_info(pdev, "Invoking %s->error_detected(permanent failure)",
-		 driver->name);
+	pci_info(pdev, "EEH(%u): Invoking %s->error_detected(permanent failure)",
+		 event_id, driver->name);
 	rc = driver->err_handler->error_detected(pdev,
 						 pci_channel_io_perm_failure);
 
@@ -579,7 +598,8 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
  * lock is dropped (which it must be in order to take the PCI rescan/remove
  * lock without risking a deadlock).
  */
-static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
+static void eeh_rmv_device(unsigned int event_id,
+			   struct pci_dev *pdev, void *userdata)
 {
 	struct eeh_dev *edev;
 	struct pci_driver *driver;
@@ -588,8 +608,8 @@ static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
 
 	edev = pci_dev_to_eeh_dev(pdev);
 	if (!edev) {
-		pci_warn(pdev, "EEH: Device removed during processing (#%d)\n",
-			 __LINE__);
+		pci_warn(pdev, "EEH(%u): Device removed during processing (#%d)\n",
+			 event_id, __LINE__);
 		return;
 	}
 	/*
@@ -617,7 +637,8 @@ static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
 	}
 
 	/* Remove it from PCI subsystem */
-	pci_info(pdev, "EEH: Removing device without EEH sensitive driver\n");
+	pci_info(pdev, "EEH(%u): Removing device without EEH sensitive driver\n",
+		 event_id);
 	edev->mode |= EEH_DEV_DISCONNECTED;
 	if (rmv_data)
 		rmv_data->removed_dev_count++;
@@ -743,7 +764,8 @@ int eeh_pe_reset_and_recover(struct eeh_pe *pe)
  * During the reset, udev might be invoked because those affected
  * PCI devices will be removed and then added.
  */
-static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
+static int eeh_reset_device(unsigned int event_id,
+			    struct eeh_pe *pe, struct pci_bus *bus,
 			    struct eeh_rmv_data *rmv_data,
 			    bool driver_eeh_aware)
 {
@@ -777,7 +799,7 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 		pdevs = pdev_cache_list_create(pe);
 		/* eeh_rmv_device() may re-acquire the recovery lock */
 		for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
-			eeh_rmv_device(*pdevp, rmv_data);
+			eeh_rmv_device(event_id, *pdevp, rmv_data);
 		pdev_cache_list_destroy(pdevs);
 	} else {
 		eeh_recovery_unlock();
@@ -825,8 +847,8 @@ static int eeh_reset_device(struct eeh_pe *pe, struct pci_bus *bus,
 	 * potentially weird things happen.
 	 */
 	if (!driver_eeh_aware || rmv_data->removed_dev_count) {
-		pr_info("EEH: Sleep 5s ahead of %s hotplug\n",
-			(driver_eeh_aware ? "partial" : "complete"));
+		pr_info("EEH(%u): Sleep 5s ahead of %s hotplug\n",
+			event_id, (driver_eeh_aware ? "partial" : "complete"));
 		eeh_recovery_unlock();
 		ssleep(5);
 		eeh_recovery_lock();
@@ -982,7 +1004,7 @@ static void eeh_clear_slot_attention(struct pci_dev *pdev)
  * drivers (which cause a second set of hotplug events to go out to
  * userspace).
  */
-void eeh_handle_normal_event(struct eeh_pe *pe)
+void eeh_handle_normal_event(unsigned int event_id, struct eeh_pe *pe)
 {
 	struct pci_bus *bus;
 	struct eeh_dev *edev, *tmp;
@@ -997,8 +1019,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	eeh_recovery_lock();
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
-		pr_err("%s: Cannot find PCI bus for PHB#%x-PE#%x\n",
-			__func__, pe->phb->global_number, pe->addr);
+		pr_err("EEH(%u): %s: Cannot find PCI bus for PHB#%x-PE#%x\n",
+			event_id, __func__, pe->phb->global_number, pe->addr);
 		eeh_recovery_unlock();
 		return;
 	}
@@ -1018,22 +1040,27 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 				devices++;
 
 	if (!devices) {
-		pr_debug("EEH: Frozen PHB#%x-PE#%x is empty!\n",
-			pe->phb->global_number, pe->addr);
+		pr_debug("EEH(%u): Frozen PHB#%x-PE#%x is empty!\n",
+			event_id, pe->phb->global_number, pe->addr);
 		goto out; /* nothing to recover */
 	}
 
+	pe->freeze_count++;
+	pr_warn("EEH(%u): EVENT=RECOVERY_START TYPE=%s PHB=%#x PE=%#x COUNT=%d\n",
+		event_id, ((pe->type & EEH_PE_PHB) ? "PHB" : "PE"),
+		pe->phb->global_number, pe->addr, pe->freeze_count);
+
 	/* Log the event */
 	if (pe->type & EEH_PE_PHB) {
-		pr_err("EEH: Recovering PHB#%x, location: %s\n",
-			pe->phb->global_number, eeh_pe_loc_get(pe));
+		pr_err("EEH(%u): Recovering PHB#%x, location: %s\n",
+			event_id, pe->phb->global_number, eeh_pe_loc_get(pe));
 	} else {
 		struct eeh_pe *phb_pe = eeh_phb_pe_get(pe->phb);
 
-		pr_err("EEH: Recovering PHB#%x-PE#%x\n",
-		       pe->phb->global_number, pe->addr);
-		pr_err("EEH: PE location: %s, PHB location: %s\n",
-		       eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
+		pr_err("EEH(%u): Recovering PHB#%x-PE#%x\n",
+		       event_id, pe->phb->global_number, pe->addr);
+		pr_err("EEH(%u): PE location: %s, PHB location: %s\n",
+		       event_id, eeh_pe_loc_get(pe), eeh_pe_loc_get(phb_pe));
 	}
 
 #ifdef CONFIG_STACKTRACE
@@ -1045,23 +1072,22 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		void **ptrs = (void **) pe->stack_trace;
 		int i;
 
-		pr_err("EEH: Frozen PHB#%x-PE#%x detected\n",
-		       pe->phb->global_number, pe->addr);
+		pr_err("EEH(%u): Frozen PHB#%x-PE#%x detected\n",
+		       event_id, pe->phb->global_number, pe->addr);
 
 		/* FIXME: Use the same format as dump_stack() */
-		pr_err("EEH: Call Trace:\n");
+		pr_err("EEH(%u): Call Trace:\n", event_id);
 		for (i = 0; i < pe->trace_entries; i++)
-			pr_err("EEH: [%pK] %pS\n", ptrs[i], ptrs[i]);
+			pr_err("EEH(%u): [%pK] %pS\n", event_id, ptrs[i], ptrs[i]);
 
 		pe->trace_entries = 0;
 	}
 #endif /* CONFIG_STACKTRACE */
 
 	eeh_pe_update_time_stamp(pe);
-	pe->freeze_count++;
 	if (pe->freeze_count > eeh_max_freezes) {
-		pr_err("EEH: PHB#%x-PE#%x has failed %d times in the last hour and has been permanently disabled.\n",
-		       pe->phb->global_number, pe->addr,
+		pr_err("EEH(%u): PHB#%x-PE#%x has failed %d times in the last hour and has been permanently disabled.\n",
+		       event_id, pe->phb->global_number, pe->addr,
 		       pe->freeze_count);
 		result = PCI_ERS_RESULT_DISCONNECT;
 	}
@@ -1081,12 +1107,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * hotplug for this case.
 	 */
 	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		pr_warn("EEH: This PCI device has failed %d times in the last hour and will be permanently disabled after %d failures.\n",
-			pe->freeze_count, eeh_max_freezes);
-		pr_info("EEH: Notify device drivers to shutdown\n");
+		pr_warn("EEH(%u): This PCI device has failed %d times in the last hour and will be permanently disabled after %d failures.\n",
+			event_id, pe->freeze_count, eeh_max_freezes);
+		pr_info("EEH(%u): Notify device drivers to shutdown\n", event_id);
 		eeh_set_channel_state(pe, pci_channel_io_frozen);
 		eeh_set_irq_state(pe, false);
-		eeh_pe_report("error_detected(IO frozen)", pe,
+		eeh_pe_report(event_id, "error_detected(IO frozen)", pe,
 			      eeh_report_error, &result);
 		if ((pe->type & EEH_PE_PHB) &&
 		    result != PCI_ERS_RESULT_NONE &&
@@ -1100,7 +1126,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	if (result != PCI_ERS_RESULT_DISCONNECT) {
 		rc = eeh_wait_state(pe, MAX_WAIT_FOR_RECOVERY*1000, true);
 		if (rc < 0 || rc == EEH_STATE_NOT_SUPPORT) {
-			pr_warn("EEH: Permanent failure\n");
+			pr_warn("EEH(%u): Permanent failure\n", event_id);
 			result = PCI_ERS_RESULT_DISCONNECT;
 		}
 	}
@@ -1110,8 +1136,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * have been informed.
 	 */
 	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		pr_info("EEH: Collect temporary log\n");
-		eeh_slot_error_detail(pe, EEH_LOG_TEMP);
+		pr_info("EEH(%u): Collect temporary log\n", event_id);
+		eeh_slot_error_detail(event_id, pe, EEH_LOG_TEMP);
 	}
 
 	/* If all device drivers were EEH-unaware, then shut
@@ -1119,8 +1145,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * go down willingly, without panicing the system.
 	 */
 	if (result == PCI_ERS_RESULT_NONE) {
-		pr_info("EEH: Reset with hotplug activity\n");
-		rc = eeh_reset_device(pe, bus, NULL, false);
+		pr_info("EEH(%u): Reset with hotplug activity\n", event_id);
+		rc = eeh_reset_device(event_id, pe, bus, NULL, false);
 		if (rc) {
 			pr_warn("%s: Unable to reset, err=%d\n",
 				__func__, rc);
@@ -1130,7 +1156,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 
 	/* If all devices reported they can proceed, then re-enable MMIO */
 	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
-		pr_info("EEH: Enable I/O for affected devices\n");
+		pr_info("EEH(%u): Enable I/O for affected devices\n", event_id);
 		rc = eeh_pci_enable(pe, EEH_OPT_THAW_MMIO);
 
 		if (rc < 0) {
@@ -1138,15 +1164,15 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		} else if (rc) {
 			result = PCI_ERS_RESULT_NEED_RESET;
 		} else {
-			pr_info("EEH: Notify device drivers to resume I/O\n");
-			eeh_pe_report("mmio_enabled", pe,
+			pr_info("EEH(%u): Notify device drivers to resume I/O\n", event_id);
+			eeh_pe_report(event_id, "mmio_enabled", pe,
 				      eeh_report_mmio_enabled, &result);
 		}
 	}
 
 	/* If all devices reported they can proceed, then re-enable DMA */
 	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
-		pr_info("EEH: Enabled DMA for affected devices\n");
+		pr_info("EEH(%u): Enabled DMA for affected devices\n", event_id);
 		rc = eeh_pci_enable(pe, EEH_OPT_THAW_DMA);
 
 		if (rc < 0) {
@@ -1166,8 +1192,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 
 	/* If any device called out for a reset, then reset the slot */
 	if (result == PCI_ERS_RESULT_NEED_RESET) {
-		pr_info("EEH: Reset without hotplug activity\n");
-		rc = eeh_reset_device(pe, bus, &rmv_data, true);
+		pr_info("EEH(%u): Reset without hotplug activity\n", event_id);
+		rc = eeh_reset_device(event_id, pe, bus, &rmv_data, true);
 		if (rc) {
 			pr_warn("%s: Cannot reset, err=%d\n",
 				__func__, rc);
@@ -1176,7 +1202,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			result = PCI_ERS_RESULT_NONE;
 			eeh_set_channel_state(pe, pci_channel_io_normal);
 			eeh_set_irq_state(pe, true);
-			eeh_pe_report("slot_reset", pe, eeh_report_reset,
+			eeh_pe_report(event_id, "slot_reset", pe, eeh_report_reset,
 				      &result);
 		}
 	}
@@ -1194,10 +1220,10 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		}
 
 		/* Tell all device drivers that they can resume operations */
-		pr_info("EEH: Notify device driver to resume\n");
+		pr_info("EEH(%u): Notify device driver to resume\n", event_id);
 		eeh_set_channel_state(pe, pci_channel_io_normal);
 		eeh_set_irq_state(pe, true);
-		eeh_pe_report("resume", pe, eeh_report_resume, NULL);
+		eeh_pe_report(event_id, "resume", pe, eeh_report_resume, NULL);
 		eeh_for_each_pe(pe, tmp_pe) {
 			eeh_pe_for_each_dev(tmp_pe, edev, tmp) {
 				edev->mode &= ~EEH_DEV_NO_HANDLER;
@@ -1205,24 +1231,25 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 			}
 		}
 
-		pr_info("EEH: Recovery successful.\n");
+		pr_info("EEH(%u): Recovery successful.\n", event_id);
 	} else  {
 		/*
 		 * About 90% of all real-life EEH failures in the field
 		 * are due to poorly seated PCI cards. Only 10% or so are
 		 * due to actual, failed cards.
 		 */
-		pr_err("EEH: Unable to recover from failure from PHB#%x-PE#%x.\n"
+		pr_err("EEH(%u): Unable to recover from failure from PHB#%x-PE#%x.\n"
 		       "Please try reseating or replacing it\n",
-			pe->phb->global_number, pe->addr);
+			event_id, pe->phb->global_number, pe->addr);
 
-		eeh_slot_error_detail(pe, EEH_LOG_PERM);
+		eeh_slot_error_detail(event_id, pe, EEH_LOG_PERM);
 
 		/* Notify all devices that they're about to go down. */
 		eeh_set_channel_state(pe, pci_channel_io_perm_failure);
 		eeh_set_irq_state(pe, false);
-		eeh_pe_report("error_detected(permanent failure)", pe,
+		eeh_pe_report(event_id, "error_detected(permanent failure)", pe,
 			      eeh_report_failure, NULL);
+		pr_crit("EEH(%u): EVENT=RECOVERY_END RESULT=failure\n", event_id);
 
 		/* Mark the PE to be removed permanently */
 		eeh_pe_state_mark(pe, EEH_PE_REMOVED);
@@ -1235,7 +1262,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		if (pe->type & EEH_PE_VF) {
 			pdevs = pdev_cache_list_create(pe);
 			for (pdevp = pdevs; pdevp && *pdevp; pdevp++)
-				eeh_rmv_device(*pdevp, NULL);
+				eeh_rmv_device(event_id, *pdevp, NULL);
 			pdev_cache_list_destroy(pdevs);
 			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
 		} else {
@@ -1251,6 +1278,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		}
 	}
 
+	pr_info("EEH(%u): EVENT=RECOVERY_END RESULT=success\n", event_id);
+
 out:
 	/*
 	 * Clean up any PEs without devices. While marked as EEH_PE_RECOVERYING
@@ -1338,7 +1367,7 @@ void eeh_handle_special_event(void)
 		if (rc == EEH_NEXT_ERR_FROZEN_PE ||
 		    rc == EEH_NEXT_ERR_FENCED_PHB) {
 			eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
-			eeh_handle_normal_event(pe);
+			eeh_handle_normal_event(0, pe);
 		} else {
 			eeh_for_each_pe(pe, tmp_pe)
 				eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
@@ -1347,7 +1376,7 @@ void eeh_handle_special_event(void)
 			/* Notify all devices to be down */
 			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
 			eeh_set_channel_state(pe, pci_channel_io_perm_failure);
-			eeh_pe_report(
+			eeh_pe_report(0,
 				"error_detected(permanent failure)", pe,
 				eeh_report_failure, NULL);
 
diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
index a7a8dc182efb..bd38d6fe5449 100644
--- a/arch/powerpc/kernel/eeh_event.c
+++ b/arch/powerpc/kernel/eeh_event.c
@@ -26,6 +26,9 @@ static DEFINE_SPINLOCK(eeh_eventlist_lock);
 static DECLARE_COMPLETION(eeh_eventlist_event);
 static LIST_HEAD(eeh_eventlist);
 
+/* Event ID 0 is reserved for special events */
+static atomic_t eeh_event_id = ATOMIC_INIT(1);
+
 /**
  * eeh_event_handler - Dispatch EEH events.
  * @dummy - unused
@@ -59,7 +62,7 @@ static int eeh_event_handler(void * dummy)
 
 		/* We might have event without binding PE */
 		if (event->pe)
-			eeh_handle_normal_event(event->pe);
+			eeh_handle_normal_event(event->id, event->pe);
 		else
 			eeh_handle_special_event();
 
@@ -110,6 +113,13 @@ int __eeh_send_failure_event(struct eeh_pe *pe)
 		return -ENOMEM;
 	}
 	event->pe = pe;
+	do {
+		/* Skip over the special value (0) */
+		event->id = (unsigned int)atomic_inc_return(&eeh_event_id);
+	} while (!event->id);
+
+	pr_err("EEH(%u): EVENT=ERROR_DETECTED PHB=%#x PE=%#x\n",
+	      event->id, pe->phb->global_number, pe->addr);
 
 	/*
 	 * Mark the PE as recovering before inserting it in the queue.
-- 
2.22.0.216.g00a2a96fc9

