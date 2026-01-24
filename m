Return-Path: <linuxppc-dev+bounces-16257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ2fJ+14dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16257-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DC17CD9C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn1V0MPdz3bfV;
	Sat, 24 Jan 2026 18:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769240797;
	cv=none; b=O3EMNNK76aFSRkfZ6bBfsmTsysS+J4OIfDRNV/lRpQehHeCGr9K9SMDlrrEGE0ytj4SQEPVFl+B5E5DdcN0DIX7DL4qtU731Cb2Uq3nT4IQxwYxjakV68CrzGYHaupX7D1IyrJPbBSphc0aWTh/5scTawugZDUoNMEWZ3wT1xmwTUHSAl/3V5cXvVTYFPvh14nXeVPsS44LOWX8ya19YSXC7Y8Qh4rcTA4j7bUEJnPPT0pXF3tfMPMtZ9UHU8Vvi2/sCQDw8jzdgbDwZFH0egu1NRRkdpdBYzE+dpxWodglbq3njEqgzW4pH+ESADyyb6CvpjLUbol0n+UVYx46/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769240797; c=relaxed/relaxed;
	bh=Z4gdvlXokQQkApksODv/C5pE+VqLfxiQb8yzNUh4ogA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NzwjYbPwdzdzty6yz88KOLsIJE2KHqL8xIKdAmGdp7xladbqchIc4C8ZPLGmo8TNktK3B81grR73eUQtS4nMplnmBE7GFfL5za27p6cbaU1tj3QLTMHtDQkpGTeWchO60jC6wydrqzQ/VlSwObEncKaC35ZR1wi8xVPA366ch0fRm5Xf4DeW+Ys/hxZf027d6atRroCLtDeDeVsqw2x9cLi2enckGyEew6tey7Dr0FIfsEbWqJUORI3s3dvkvZjDWfW7AhrvmaqsjN7SgyEOuwywc/1idreQWmem54uzcfpceEXxHCfklx4VNnAPeKfFY3Ge56E3wBp5cKtmQqvsRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BFKiCpYY; dkim-atps=neutral; spf=pass (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=BFKiCpYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.101; helo=out30-101.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn1Q1cgfz2yql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:46:32 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769240787; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Z4gdvlXokQQkApksODv/C5pE+VqLfxiQb8yzNUh4ogA=;
	b=BFKiCpYYMxKZiYhOfQOGGeoWoYS5LB4bMGFvoCZEO8PaTP/TTNU/nJuTm0mID6lkTmZE2dy0d0gCdx/WJDmo5bCG8FKGAHG5WYeZ5wrRX23Bl+MdyGCuaswMQmFd+L69GRjxXVBV3vV/k6mcxRrGoAhOitV1Gm7KfyQJbidNIFI=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WxiIIAG_1769240784 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Jan 2026 15:46:25 +0800
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
Subject: [PATCH v7 1/5] PCI/DPC: Clarify naming for error port in DPC Handling
Date: Sat, 24 Jan 2026 15:45:53 +0800
Message-Id: <20260124074557.73961-2-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,linux.alibaba.com,huawei.com,amd.com,wunner.de];
	TAGGED_FROM(0.00)[bounces-16257-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:xueshuai@linux.alibaba.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,alibaba.com:email,linux.alibaba.com:mid,linux.alibaba.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D1DC17CD9C
X-Rspamd-Action: no action

dpc_handler() is registered for error port which recevie DPC interrupt
and acpi_dpc_port_get() locate the port that experienced the containment
event.

Rename edev and pdev to err_port for clear so that later patch will
avoid misused err_port in pcie_do_recovery().

No functional changes intended.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
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


