Return-Path: <linuxppc-dev+bounces-12871-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5540DBDC2B9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 04:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmb2r30htz3cb1;
	Wed, 15 Oct 2025 13:42:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760496132;
	cv=none; b=kw7npMjI3anDayAnVFRMsq2LcvRHMV9RPhu071InXtnGU2iX7Wp1ijB6I2l8c77GTYpJVn+G9JBsDg49amxDOHJ4s/0VwW2PhOyYr8Acr5Uor0L3+xcALzW3J5oDsSPjylVcWe1ZPSQ5fzdqK/4olGq36KQD1aIm1HLIeq7+y5M9BmwL/OZZ5WfR6Bwj8mUwzDVI1sjTbiPWWMnn9wJyoBWgHsEWCLsBTbAm+4TBtjgMPjg9ZzgF1KhR6rmFrxAuPUXEH8F1hvG/8x0bDutmFicUP+N+oS9jv6aB24KiWiHg7F2lEGV5nJK2p6V63rgeh7kmI1St6gTry3V74qg+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760496132; c=relaxed/relaxed;
	bh=QXJAUGDYWc0L7efEoBkhFUMBAgY1wDEDmp5dyuIIeqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LG2mHi5E19i/wvBjvIzunu6B3vdst27ywhmQ+R51trpgPT6wyqTOxZft1wvrkYrKda4I68w9EetoSR2ZuWCkN5r95ZcfWbX0s90xyGf/6LTRD3esqTPS8hOLFHmQjPBxEMrPKUERycB1r6YuWRzEGIdCGVkmkPUlo1Oy6IxIwHdT3++cOTmhMIpdvfY27GwYLHHMMP6WbkVGqEfzqspn85hgjHzsxCbm+uH6eMs/p8y+GhyhOCY+btcmieB40aXfDNsQLhmO1rlC7IaKzd4vDyfZ0g9G+46JYBtBPDzwsfyRaWkrTSVVdvgkWSZKEx9B5rmkhOpGfZ36T1jfVMdduQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aiX5J0Gv; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=aiX5J0Gv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmb2n1Vzsz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 13:42:07 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760496123; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=QXJAUGDYWc0L7efEoBkhFUMBAgY1wDEDmp5dyuIIeqY=;
	b=aiX5J0GvE6w6VgMAf5XcaKO5eL712Lik/TdyT8WOpqkM+N6EcHgStE6le7i26PUB2VhS+Vnmg3Jwi8a8BEGjvdUMo5z5L94cxmwcpaRtxmUOh5Ltgnf9N3RxYdOSd2ZAThxxhRbhixjbC7piTcpF7LGpfjHX7UQmO2b83eHx7YQ=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqEYD4b_1760496121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:42:02 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com,
	tianruidong@linux.alibaba.com,
	lukas@wunner.de
Subject: [PATCH v6 1/5] PCI/DPC: Clarify naming for error port in DPC Handling
Date: Wed, 15 Oct 2025 10:41:55 +0800
Message-Id: <20251015024159.56414-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

dpc_handler() is registered for error port which recevie DPC interrupt
and acpi_dpc_port_get() locate the port that experienced the containment
event.

Rename edev and pdev to err_port for clear so that later patch will
avoid misused err_port in pcie_do_recovery().

No functional changes intended.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/pci/pcie/dpc.c | 10 +++++-----
 drivers/pci/pcie/edr.c | 34 +++++++++++++++++-----------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index fc18349614d7..bff29726c6a5 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -361,21 +361,21 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
 
 static irqreturn_t dpc_handler(int irq, void *context)
 {
-	struct pci_dev *pdev = context;
+	struct pci_dev *err_port = context;
 
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
+	dpc_process_error(err_port);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
-	pcie_do_recovery(pdev, pci_channel_io_frozen, dpc_reset_link);
+	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
index e86298dbbcff..521fca2f40cb 100644
--- a/drivers/pci/pcie/edr.c
+++ b/drivers/pci/pcie/edr.c
@@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
 
 static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 {
-	struct pci_dev *pdev = data, *edev;
+	struct pci_dev *pdev = data, *err_port;
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
+	dpc_process_error(err_port);
+	pci_aer_raw_clear_status(err_port);
 
 	/*
 	 * Irrespective of whether the DPC event is triggered by ERR_FATAL
 	 * or ERR_NONFATAL, since the link is already down, use the FATAL
 	 * error recovery path for both cases.
 	 */
-	estate = pcie_do_recovery(edev, pci_channel_io_frozen, dpc_reset_link);
+	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
 
 send_ost:
 
@@ -207,15 +207,15 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
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
 }
 
 void pci_acpi_add_edr_notifier(struct pci_dev *pdev)
-- 
2.39.3


