Return-Path: <linuxppc-dev+bounces-3123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7B59C599F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XnnwP36Lpz2yZZ;
	Wed, 13 Nov 2024 00:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731419685;
	cv=none; b=gRxuvzYYE6MGNUprdGIBra57mUVQc5I+F7LCpAC8pC3kaaBkafG5K5DjvrcZGbDTq7PaQQb7obqIOVLdmQTTwCwv6kcQtTb7gBwCWGwk6KMFwg+Cv2l+ZIxO7yddZhmbFjUB+QdBbBTH3SjF5QKwvzZrkRFCgZ77SkdbskvKDlNarFBFkcdbZ4h6OxoIEsldYRlyZNykilWLVglxsu7J8oJDPKGMRbieWKVgn9Vjm5vI5P9Z6iBdwuuiYWbrws1VTu417Rke1Lqc584dRF0EWitKZvmC7mQeOKqe/xuIPxHhBhhbzq9FPwYcQvO1jTzaAjWc80hbrzIeKPgYneCKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731419685; c=relaxed/relaxed;
	bh=K02M0+ohd9UnlMuguwvVktzF9shDp2869hEDS2YpyM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K+F6FIajgx8M/fvrYacwTSDJORLBAsNzmL4bvjBbV6O9s0LPe6Sb0O9BBqC8A7ouLb4DvQnCEcglJEQ4V6elB61sDq1A5V7+XnYX3UJ0xJivAnFe+0kVK0UoBKZTX4TovjtQreFohrm/+OnWfdvbXrLHRbPi3REWHym1FHxtwZxij2VPYjjObsSmNKgoFo0bMuMdxVmFJeTr0VQXoVRlp5G0LbLKVLsinYJLtz+e/JjQCk+hjxxZKrUrwkvLt8n6o1WzpHc4poqsrXBCw/SumoBgpvTYs6mVIF3fkHGDgPqKgug6BswVB6/HAVuNmpUte+sjBuo+7Vky1HWW1j7+6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cyTsRAPi; dkim-atps=neutral; spf=pass (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=cyTsRAPi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XnnwL6f9qz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:54:38 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1731419674; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=K02M0+ohd9UnlMuguwvVktzF9shDp2869hEDS2YpyM8=;
	b=cyTsRAPixCmgctitVwGxWhSModxy+6zIBtB4+uJw7PN242dFFUESCtwF3KejSWDfXVnVdrwZqLmxtxmsdGDSCHIsCV4XmtbmwC5IdUsvS+hEom853BWrnG1WCNF+ZHTdorY2GI7ojeoWFifKSnqb2EkTX9Z+VcCpIsdbuk5eHRc=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WJHmH-y_1731419672 cluster:ay36)
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
Subject: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Tue, 12 Nov 2024 21:54:19 +0800
Message-ID: <20241112135419.59491-3-xueshuai@linux.alibaba.com>
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

The AER driver has historically avoided reading the configuration space of
an endpoint or RCiEP that reported a fatal error, considering the link to
that device unreliable. Consequently, when a fatal error occurs, the AER
and DPC drivers do not report specific error types, resulting in logs like:

  pcieport 0000:30:03.0: EDR: EDR event received
  pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
  pcieport 0000:30:03.0: DPC: ERR_FATAL detected
  pcieport 0000:30:03.0: AER: broadcast error_detected message
  nvme nvme0: frozen state error detected, reset controller
  nvme 0000:34:00.0: ready 0ms after DPC
  pcieport 0000:30:03.0: AER: broadcast slot_reset message

AER status registers are sticky and Write-1-to-clear. If the link recovered
after hot reset, we can still safely access AER status of the error device.
In such case, report fatal errors which helps to figure out the error root
case.

After this patch, the logs like:

  pcieport 0000:30:03.0: EDR: EDR event received
  pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
  pcieport 0000:30:03.0: DPC: ERR_FATAL detected
  pcieport 0000:30:03.0: AER: broadcast error_detected message
  nvme nvme0: frozen state error detected, reset controller
  pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
  nvme 0000:34:00.0: ready 0ms after DPC
  nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
  nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
  nvme 0000:34:00.0:    [ 4] DLP                    (First)
  pcieport 0000:30:03.0: AER: broadcast slot_reset message

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  3 ++-
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c |  2 +-
 drivers/pci/pcie/err.c |  9 +++++++++
 4 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0866f79aec54..6f827c313639 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -504,7 +504,8 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
+int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
+			      bool link_healthy);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 #endif	/* CONFIG_PCIEAER */
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 13b8586924ea..97ec1c17b6f4 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
  * aer_get_device_error_info - read error status from dev and store it to info
  * @dev: pointer to the device expected to have a error record
  * @info: pointer to structure to store the error record
+ * @link_healthy: link is healthy or not
  *
  * Return 1 on success, 0 on error.
  *
  * Note that @info is reused among all error devices. Clear fields properly.
  */
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
+int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
+			      bool link_healthy)
 {
 	int type = pci_pcie_type(dev);
 	int aer = dev->aer_cap;
@@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
 		   type == PCI_EXP_TYPE_RC_EC ||
 		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-		   info->severity == AER_NONFATAL) {
+		   info->severity == AER_NONFATAL ||
+		   (info->severity == AER_FATAL && link_healthy)) {
 
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
@@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 
 	/* Report all before handle them, not to lost records by reset etc. */
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
+		if (aer_get_device_error_info(e_info->dev[i], e_info, false))
 			aer_print_error(e_info->dev[i], e_info);
 	}
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
+		if (aer_get_device_error_info(e_info->dev[i], e_info, false))
 			handle_error_source(e_info->dev[i], e_info);
 	}
 }
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index 62a68cde4364..b3f157a00405 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -304,7 +304,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
 		dpc_process_rp_pio_error(pdev);
 	else if (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_UNCOR &&
 		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
-		 aer_get_device_error_info(pdev, &info)) {
+		 aer_get_device_error_info(pdev, &info, false)) {
 		aer_print_error(pdev, &info);
 		pci_aer_clear_nonfatal_status(pdev);
 		pci_aer_clear_fatal_status(pdev);
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffc..462577b8d75a 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	struct aer_err_info info;
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -223,6 +224,13 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 			pci_warn(bridge, "subordinate device reset failed\n");
 			goto failed;
 		}
+
+		info.severity = AER_FATAL;
+		/* Link recovered, report fatal errors of RCiEP or EP */
+		if ((type == PCI_EXP_TYPE_ENDPOINT ||
+		     type == PCI_EXP_TYPE_RC_END) &&
+		    aer_get_device_error_info(dev, &info, true))
+			aer_print_error(dev, &info);
 	} else {
 		pci_walk_bridge(bridge, report_normal_detected, &status);
 	}
@@ -259,6 +267,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	if (host->native_aer || pcie_ports_native) {
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
+		pci_aer_clear_fatal_status(dev);
 	}
 
 	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
-- 
2.39.3


