Return-Path: <linuxppc-dev+bounces-2904-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25609BE1A1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 10:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xjzlj437zz30Bp;
	Wed,  6 Nov 2024 20:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730883841;
	cv=none; b=nxmjcAZUKqfPQi8vR/820uR2o88A4Ji2eFk0kvzvApaMu04Mxr+P+woLu2VYU4ZOa8fZJX05DtA6JCIY1/Nf8aAbe+sUsAS3HOXksVJe/Yl4+9bYfZGQf+vS462bTObyFkurT8Io296Tzvwf/fdtgFfU2XjYlwI6EKo2ccA8nOKS4d5dTnBV68+DbU7wBTxhGoTEwU6l+G9fTSD/QLkVtx953T+m+v1+dyMNv9eNHSy5ACLDv4ujLrMexqSLyxddPeIZqL3c8qV0cgreDdOo+gfr7WuQDYVqXJ3HWMpc1JUft1P2bKerkFOQlS2MtcjqUOkEO0+b4m8vMnNQUqVRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730883841; c=relaxed/relaxed;
	bh=Z+sxZ++Zk/sXquFko87mDs4djKewv/tiZai6wAuYD2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqxvghjhO753yEiBOtj7KezWUttr3xf0LRxOi2Qhs/fwkFirMpMg1AjdY57jqzKo6BxWF5sV1Q/17g2zwWhTj7RCFzfp61O/3YjjoGIF2O84YYXKlYYKxgYEQOAJeTK2ABajpHqINQhD2vp9emcTkFYoPchvAQJQYfXI8aV1/gtHXxa2gV9ETc/jRyZlcqJIzUpW7RNqm6VSeg99mEtWY516Q8Q/nJaWUWokR+8R28gCRP1ZA7Cx+WsXzvSEqlxWETQFreYzpYUu/pC0FVRT6g37/N0d0jVQ39ModWS045wRaYOW34TE+xbCa5W7OgWPL1BADC3iWaiP8RuMWcFSow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dA+D8MA+; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=dA+D8MA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xjzlf5YWZz2yxj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 20:03:57 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1730883833; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Z+sxZ++Zk/sXquFko87mDs4djKewv/tiZai6wAuYD2I=;
	b=dA+D8MA+u1EivGpXdqXtyxoSMEr7sdEvK2Q91Iw0WLcnsqZBnMtDo+EMXdhtPVduAuG79J2riXn4LwiQkWU2hyGraoQ6RvYa3PKabkN76WXW3iul17I183rhjUOJWm31cYBIg0PMqkyZS15Ne/qV2OQsXiQUodp5sLmo84V5VmM=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WIqmpDn_1730883831 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 06 Nov 2024 17:03:52 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: bhelgaas@google.com,
	mahesh@linux.ibm.com,
	oohall@gmail.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	xueshuai@linux.alibaba.com
Subject: [RFC PATCH v1 2/2] PCI/AER: report fatal errors of RCiEP and EP if link recoverd
Date: Wed,  6 Nov 2024 17:03:39 +0800
Message-ID: <20241106090339.24920-3-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20241106090339.24920-1-xueshuai@linux.alibaba.com>
References: <20241106090339.24920-1-xueshuai@linux.alibaba.com>
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

The AER driver has historically avoided reading the configuration space of an
endpoint or RCiEP that reported a fatal error, considering the link to that
device unreliable. Consequently, when a fatal error occurs, the AER and DPC
drivers do not report specific error types, resulting in logs like:

[  245.281980] pcieport 0000:30:03.0: EDR: EDR event received
[  245.287466] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
[  245.295372] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
[  245.300849] pcieport 0000:30:03.0: AER: broadcast error_detected message
[  245.307540] nvme nvme0: frozen state error detected, reset controller
[  245.722582] nvme 0000:34:00.0: ready 0ms after DPC
[  245.727365] pcieport 0000:30:03.0: AER: broadcast slot_reset message

But, if the link recovered after hot reset, we can safely access AER status of
the error device. In such case, report fatal error which helps to figure out the
error root case.

After this patch, the logs like:

[  414.356755] pcieport 0000:30:03.0: EDR: EDR event received
[  414.362240] pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
[  414.370148] pcieport 0000:30:03.0: DPC: ERR_FATAL detected
[  414.375642] pcieport 0000:30:03.0: AER: broadcast error_detected message
[  414.382335] nvme nvme0: frozen state error detected, reset controller
[  414.645413] pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
[  414.788016] nvme 0000:34:00.0: ready 0ms after DPC
[  414.796975] nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
[  414.807312] nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
[  414.815305] nvme 0000:34:00.0:    [ 4] DLP                    (First)
[  414.821768] pcieport 0000:30:03.0: AER: broadcast slot_reset message

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  1 +
 drivers/pci/pcie/aer.c | 50 ++++++++++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/err.c |  6 +++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0866f79aec54..143f960a813d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -505,6 +505,7 @@ struct aer_err_info {
 };
 
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
+int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 #endif	/* CONFIG_PCIEAER */
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 13b8586924ea..0c1e382ce117 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1252,6 +1252,56 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 	return 1;
 }
 
+/**
+ * aer_get_device_fatal_error_info - read fatal error status from EP or RCiEP
+ * and store it to info
+ * @dev: pointer to the device expected to have a error record
+ * @info: pointer to structure to store the error record
+ *
+ * Return 1 on success, 0 on error.
+ *
+ * Note that @info is reused among all error devices. Clear fields properly.
+ */
+int aer_get_device_fatal_error_info(struct pci_dev *dev, struct aer_err_info *info)
+{
+	int type = pci_pcie_type(dev);
+	int aer = dev->aer_cap;
+	u32 aercc;
+
+	pci_info(dev, "type :%d\n", type);
+
+	/* Must reset in this function */
+	info->status = 0;
+	info->tlp_header_valid = 0;
+	info->severity = AER_FATAL;
+
+	/* The device might not support AER */
+	if (!aer)
+		return 0;
+
+
+	if (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END) {
+		/* Link is healthy for IO reads now */
+		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
+			&info->status);
+		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
+			&info->mask);
+		if (!(info->status & ~info->mask))
+			return 0;
+
+		/* Get First Error Pointer */
+		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
+		info->first_error = PCI_ERR_CAP_FEP(aercc);
+
+		if (info->status & AER_LOG_TLP_MASKS) {
+			info->tlp_header_valid = 1;
+			pcie_read_tlp_log(dev, aer + PCI_ERR_HEADER_LOG, &info->tlp);
+		}
+	}
+
+	return 1;
+}
+
 static inline void aer_process_err_devices(struct aer_err_info *e_info)
 {
 	int i;
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 31090770fffc..a74ae6a55064 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	struct aer_err_info info;
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -223,6 +224,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 			pci_warn(bridge, "subordinate device reset failed\n");
 			goto failed;
 		}
+
+		/* Link recovered, report fatal errors on RCiEP or EP */
+		if (aer_get_device_fatal_error_info(dev, &info))
+			aer_print_error(dev, &info);
 	} else {
 		pci_walk_bridge(bridge, report_normal_detected, &status);
 	}
@@ -259,6 +264,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	if (host->native_aer || pcie_ports_native) {
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
+		pci_aer_clear_fatal_status(dev);
 	}
 
 	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
-- 
2.39.3


