Return-Path: <linuxppc-dev+bounces-6236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CCCA379D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 03:42:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yx6Q11bpSz2yxP;
	Mon, 17 Feb 2025 13:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739760152;
	cv=none; b=jfcn7Su7ZcFf59I80ZRuj3YX2oonPtDow/c1LDvl14DgivnsNf/ThdSGDw30X7aaPLlwe5Uj2BVPRBnT4L8XfHY/OzuEAQkDIX+XwHbe+UQvDBzlFhQCFk2qVRgzLsgkwxRs3VqIXTlMVNscZa6PeHGrofJBqc7TjYaM7OWT5vtcjYnEnK6YIvi5AquAfc97pmQZy7RAPdqOLzT0erqG1QrOCf21YdJOzlzFh+oMruCkIQ/YaMQqoGRBP9fon9mRD2rncia02rTOfzKTQYcIQ2001DVJgK2fHGZ0MRtYFTTbPqYEXymt+WcoavJVHbM6SiE8Hednq6Pqh4riboRiKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739760152; c=relaxed/relaxed;
	bh=EsTzvn9sAqOfuNe2IfnTEyGdjTW3CA2dmeyuPIDjTPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dweUnDrePxjgA3d5+J2Tdh8HnafJ1DccRzns6qxqAnnLGElAKwSmaAs7UHdnam2EoEdOKvLkElf16t8dz2e+RirMY9eSp/aD6R5YUHVL/VFmSA6P09oqzUkz8zMX8KWJKmdv0I5DAPksrG4uQuPx1mErDQHheXrcdhef2Ot0ZuaiLInXZg44/ilZscdLeDSTkzcjP/ETCAKbotH2YZ1nq3je+jd7uXmD3wOZbz1zIxqZRqLDcRVe4Z2MCxSLEL3UNMCgZU0WRVAfO4r1WGv/eNSGxPsXsdzQluS8NDMLgXm7aP3HkX475NjtfAVMa1GGBC8bM+Jscw23HxmUj8YUBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Se8OLfCs; dkim-atps=neutral; spf=pass (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Se8OLfCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yx6Py2s3Vz2yyC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 13:42:29 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1739760146; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EsTzvn9sAqOfuNe2IfnTEyGdjTW3CA2dmeyuPIDjTPY=;
	b=Se8OLfCsA9ECKNcJh8bonZaN9ROtC1xn3OBtaVJ9ucTTKzDcA9KfmZBr6pnLNzhn3ufMZ/dGjaPGlL1oNi3x6LmTZjlVs543IgtaDcECyEti2ksuviood1wfvS/yk68r8tF/G2s+Pbefx6yPx75fR7eWeF7jGI3llB0QnCJwzSI=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WPYBR3X_1739760144 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 17 Feb 2025 10:42:25 +0800
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
	tianruidong@linux.alibaba.com
Subject: [PATCH v4 3/3] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Mon, 17 Feb 2025 10:42:18 +0800
Message-ID: <20250217024218.1681-4-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
References: <20250217024218.1681-1-xueshuai@linux.alibaba.com>
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
index 870d2fbd6ff2..e852fa58b250 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -549,7 +549,8 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
+int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
+			      bool link_healthy);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 508474e17183..bfb67db074f0 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1197,12 +1197,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
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
@@ -1226,7 +1228,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
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
index ea3ea989afa7..2d3dd831b755 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -303,7 +303,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
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


