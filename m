Return-Path: <linuxppc-dev+bounces-3122-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417719C599E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnnwP0sTcz2yZ4;
	Wed, 13 Nov 2024 00:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731419685;
	cv=none; b=ZNcT0JWuvGjX/WPBxu5mZ88zURwGd98Gv6XFpF0bpoXkhKKqdX8QiaU9Qj4qZnnqvBCdbGM6by23IP5fv8HHTirn621DGggSSHC4RPvAQv5KeYTjhS9CwRykztUxTxM+629jATG+XnFCVFChCuNJiUYmFW22XoUrgF5PqgDarE2cE2xXkSAPS0CzNqY3Ya1SAB3OcPQB6+ghe2OCtBnwO5q/+KE2gMkM7ErdEzq5q1Hs52EuzS4tdG24knrQ59Q7H23MYhL+BaxSiCjS0iUGGlqVRsjVwHX5/5udMQ5giE0Gl6LgsJIQuJQgEu/mse7vKO6nfZGnDEmGlAF//ybyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731419685; c=relaxed/relaxed;
	bh=Yr3ZRpv1mokzEc6d8ke9i3IA5cw2qZHz2zJ15nfJxjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XxpRIDfB6WR96YNdm9U9NanDYKD3PkSu98oWpTUWEprl0irPFpm0UlWHGRuMn1gxV+NzB0hgcG0U6Ssh1hproi4hLTqRpXZTWjrUf723JueaFs+QZxiAEp2xwAXyWSpTKJTkKMsj0JXQXyqTCoZFTGOz3u3KVyhtGiiFng55kC9SbdYVprAcXJdWsR14uHCG4rbRUXI7S17idFkseWGPMMs252J0ZjSdhqBJP8f9zOsNYQCdKfqxG767BVILrnJxtdsAlaKHFRYcqdonTB3rLsBksg1y0MAJ1IqMF1UaWOCpQ7CSOxFF8PBCfqVpVTvsR2KMtwLrhV4UX7jetEqvcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=azP7bVf3; dkim-atps=neutral; spf=pass (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=azP7bVf3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnnwK2b4Dz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:54:38 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731419673; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Yr3ZRpv1mokzEc6d8ke9i3IA5cw2qZHz2zJ15nfJxjo=;
	b=azP7bVf3Q7YkyVD9BNMCDzHeNXpHyYh+iHL0nDm+m3C4/dE1t3QrTt8SwR/Zgm6ja1r9Fu4EDxqBdoqdzZ+bLe7HwQS0nLRxwDcBsiqxb9RAriGjlgPEx3WyQCyc8fLUUNxseDAr2d/fiDqxfS2ESmUCTWBm66rT92mgYHEzfYU=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WJHmH-j_1731419671 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 12 Nov 2024 21:54:32 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	xueshuai@linux.alibaba.com
Subject: [PATCH v2 1/2] PCI/DPC: Run recovery on device that detected the error
Date: Tue, 12 Nov 2024 21:54:18 +0800
Message-ID: <20241112135419.59491-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The current implementation of pcie_do_recovery() assumes that the
recovery process is executed on the device that detected the error.
However, the DPC driver currently passes the error port that experienced
the DPC event to pcie_do_recovery().

Use the SOURCE ID register to correctly identify the device that detected the
error. By passing this error device to pcie_do_recovery(), subsequent
patches will be able to accurately access AER status of the error device.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  2 +-
 drivers/pci/pcie/dpc.c | 30 ++++++++++++++++++++++++------
 drivers/pci/pcie/edr.c | 35 ++++++++++++++++++-----------------
 3 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 14d00ce45bfa..0866f79aec54 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -521,7 +521,7 @@ struct rcec_ea {
 void pci_save_dpc_state(struct pci_dev *dev);
 void pci_restore_dpc_state(struct pci_dev *dev);
 void pci_dpc_init(struct pci_dev *pdev);
-void dpc_process_error(struct pci_dev *pdev);
+struct pci_dev *dpc_process_error(struct pci_dev *pdev);
 pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
 #else
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 2b6ef7efa3c1..62a68cde4364 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -257,10 +257,17 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 	return 1;
 }
 
-void dpc_process_error(struct pci_dev *pdev)
+/**
+ * dpc_process_error - handle the DPC error status
+ * @pdev: the port that experienced the containment event
+ *
+ * Return the device that experienced the error.
+ */
+struct pci_dev *dpc_process_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
 	struct aer_err_info info;
+	struct pci_dev *err_dev = NULL;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
@@ -283,6 +290,13 @@ void dpc_process_error(struct pci_dev *pdev)
 		 "software trigger" :
 		 "reserved error");
 
+	if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE ||
+	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE)
+		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
+					    PCI_BUS_NUM(source), source & 0xff);
+	else
+		err_dev = pci_dev_get(pdev);
+
 	/* show RP PIO error detail information */
 	if (pdev->dpc_rp_extensions &&
 	    reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT &&
@@ -295,6 +309,8 @@ void dpc_process_error(struct pci_dev *pdev)
 		pci_aer_clear_nonfatal_status(pdev);
 		pci_aer_clear_fatal_status(pdev);
 	}
+
+	return err_dev;
 }
 
 static void pci_clear_surpdn_errors(struct pci_dev *pdev)
@@ -350,21 +366,23 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
 
 static irqreturn_t dpc_handler(int irq, void *context)
 {
-	struct pci_dev *pdev = context;
+	struct pci_dev *err_port = context, *err_dev = NULL;
 
 	/*
 	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
 	 * of async removal and should be ignored by software.
 	 */
-	if (dpc_is_surprise_removal(pdev)) {
-		dpc_handle_surprise_removal(pdev);
+	if (dpc_is_surprise_removal(err_port)) {
+		dpc_handle_surprise_removal(err_port);
 		return IRQ_HANDLED;
 	}
 
-	dpc_process_error(pdev);
+	err_dev = dpc_process_error(err_port);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
-	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
+	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
+
+	pci_dev_put(err_dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
index e86298dbbcff..6ac95e5e001b 100644
--- a/drivers/pci/pcie/edr.c
+++ b/drivers/pci/pcie/edr.c
@@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
 
 static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 {
-	struct pci_dev *pdev = data, *edev;
+	struct pci_dev *pdev = data, *err_port, *err_dev = NULL;
 	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
 	u16 status;
 
@@ -169,36 +169,36 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 	 * may be that port or a parent of it (PCI Firmware r3.3, sec
 	 * 4.6.13).
 	 */
-	edev = acpi_dpc_port_get(pdev);
-	if (!edev) {
+	err_port = acpi_dpc_port_get(pdev);
+	if (!err_port) {
 		pci_err(pdev, "Firmware failed to locate DPC port\n");
 		return;
 	}
 
-	pci_dbg(pdev, "Reported EDR dev: %s\n", pci_name(edev));
+	pci_dbg(pdev, "Reported EDR dev: %s\n", pci_name(err_port));
 
 	/* If port does not support DPC, just send the OST */
-	if (!edev->dpc_cap) {
-		pci_err(edev, FW_BUG "This device doesn't support DPC\n");
+	if (!err_port->dpc_cap) {
+		pci_err(err_port, FW_BUG "This device doesn't support DPC\n");
 		goto send_ost;
 	}
 
 	/* Check if there is a valid DPC trigger */
-	pci_read_config_word(edev, edev->dpc_cap + PCI_EXP_DPC_STATUS, &status);
+	pci_read_config_word(err_port, err_port->dpc_cap + PCI_EXP_DPC_STATUS, &status);
 	if (!(status & PCI_EXP_DPC_STATUS_TRIGGER)) {
-		pci_err(edev, "Invalid DPC trigger %#010x\n", status);
+		pci_err(err_port, "Invalid DPC trigger %#010x\n", status);
 		goto send_ost;
 	}
 
-	dpc_process_error(edev);
-	pci_aer_raw_clear_status(edev);
+	err_dev = dpc_process_error(err_port);
+	pci_aer_raw_clear_status(err_port);
 
 	/*
 	 * Irrespective of whether the DPC event is triggered by ERR_FATAL
 	 * or ERR_NONFATAL, since the link is already down, use the FATAL
 	 * error recovery path for both cases.
 	 */
-	estate = pcie_do_recovery(edev, pci_channel_io_frozen, dpc_reset_link);
+	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
 
 send_ost:
 
@@ -207,15 +207,16 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 	 * to firmware. If not successful, send _OST(0xF, BDF << 16 | 0x81).
 	 */
 	if (estate == PCI_ERS_RESULT_RECOVERED) {
-		pci_dbg(edev, "DPC port successfully recovered\n");
-		pcie_clear_device_status(edev);
-		acpi_send_edr_status(pdev, edev, EDR_OST_SUCCESS);
+		pci_dbg(err_port, "DPC port successfully recovered\n");
+		pcie_clear_device_status(err_port);
+		acpi_send_edr_status(pdev, err_port, EDR_OST_SUCCESS);
 	} else {
-		pci_dbg(edev, "DPC port recovery failed\n");
-		acpi_send_edr_status(pdev, edev, EDR_OST_FAILED);
+		pci_dbg(err_port, "DPC port recovery failed\n");
+		acpi_send_edr_status(pdev, err_port, EDR_OST_FAILED);
 	}
 
-	pci_dev_put(edev);
+	pci_dev_put(err_port);
+	pci_dev_put(err_dev);
 }
 
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev)
-- 
2.39.3


