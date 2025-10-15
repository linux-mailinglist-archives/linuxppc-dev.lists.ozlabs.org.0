Return-Path: <linuxppc-dev+bounces-12875-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C5BDC2D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 04:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmb2t2Wqbz3cj3;
	Wed, 15 Oct 2025 13:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760496134;
	cv=none; b=hDyu6sXr22aNtj1fdEZJCnPLwJ2k2Vddrj91oC7yzmJ2j0A6iwBp70jo+KRAzMF6RAlKSZ+7x5s2CR/lOHmmX1F2KLN0u3V6AcxUzrD5CBLSkWNbeRRbyH0aYqlTN45gvWVobVYy8xeoTIQk2c8mPaAYACJS0QDWdZqCYW9vOt7HIBL1aa6VF5h0QwCAUPVsc9r/rrus2f8MQ4C6D4F+7V1PQq4AZ7IbELwIlhDiN0J7NpjEBpsECBQH2n8JD5m6InLn3+7CshqC+NJ360l1uup8hoUxQaS4VTwdGH5eiWCim8nsSoA0dqF2dFuQK/XEPvxEzrUcC1ZhR2zadrjZLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760496134; c=relaxed/relaxed;
	bh=dYRTCsecZgOZe4YT1CnRQjDKcgxee9MQp0sCUsi3x6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hSaU810DWTd0NLVdVRErOp8x/cS8wxFb5GcnhN6g9w2aLHUxAPKz1hA5cgCJZeP0iIyc4NdmVrNHDSOd8qTVKkxZxW76lKTfiTF9y/eHqoCAeqbi52m85sNexi9Jv3F5EbP2dOkwGTXHlpQwIvp7gfn/O7eHCjYx+NBgaOvbCqBrQygWUEikfpRJFMUp5IYDGoCGa/qceYiyCKCywd+K8tD+6VhsVM+tbcbwBlFkO0nIaOPSmEJorYXtvv7oekufRaNskBJ+7YrKVdSZgHO1WfawynjlS0nSKx9GMwge0H0mHr+pvoKHZRAeLckrfrAQztXoSCT27r6DmMWvfsQWgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=G+JW9PZX; dkim-atps=neutral; spf=pass (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=G+JW9PZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.100; helo=out30-100.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmb2n4bnPz3cZR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 13:42:09 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760496124; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=dYRTCsecZgOZe4YT1CnRQjDKcgxee9MQp0sCUsi3x6Y=;
	b=G+JW9PZXmU1jHR4f99p4TaSzY/LZ34a+Hmv/9FBu5CrvoAF0371+OSYvbv5nmDZjeZiffNDRp7eLu9fV3S7M1tMZPx+VqvIGNlzkcldpVSdKZSNvJ/V7pkmNF/I6KAXdmzVNHNHzwwa7C/+6k+YRieekwuQCipwTDX/+j2IIS1E=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqEYD6y_1760496123 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:42:03 +0800
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
Subject: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Wed, 15 Oct 2025 10:41:57 +0800
Message-Id: <20251015024159.56414-4-xueshuai@linux.alibaba.com>
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

The AER driver has historically avoided reading the configuration space of
an endpoint or RCiEP that reported a fatal error, considering the link to
that device unreliable. Consequently, when a fatal error occurs, the AER
and DPC drivers do not report specific error types, resulting in logs like:

  pcieport 0015:00:00.0: EDR: EDR event received
  pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
  pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
  pcieport 0015:00:00.0: AER: broadcast error_detected message
  pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
  pcieport 0015:00:00.0: AER: broadcast resume message
  pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
  pcieport 0015:00:00.0: AER: device recovery successful
  pcieport 0015:00:00.0: EDR: DPC port successfully recovered
  pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80

AER status registers are sticky and Write-1-to-clear. If the link recovered
after hot reset, we can still safely access AER status and TLP header of the
error device. In such case, report fatal errors which helps to figure out the
error root case.

After this patch, the logs like:

  pcieport 0015:00:00.0: EDR: EDR event received
  pcieport 0015:00:00.0: EDR: Reported EDR dev: 0015:00:00.0
  pcieport 0015:00:00.0: DPC: containment event, status:0x200d, ERR_FATAL received from 0015:01:00.0
  pcieport 0015:00:00.0: AER: broadcast error_detected message
  vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
  pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
  vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
  vfio-pci 0015:01:00.0:    [12] TLP                    (First)
  vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
  pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
  pcieport 0015:00:00.0: AER: broadcast resume message
  pcieport 0015:00:00.0: AER: device recovery successful
  pcieport 0015:00:00.0: EDR: DPC port successfully recovered
  pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  4 +++-
 drivers/pci/pcie/aer.c | 18 +++++++++++-------
 drivers/pci/pcie/dpc.c |  2 +-
 drivers/pci/pcie/err.c | 11 +++++++++++
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 6b0c55bed15b..3eccef2d25a3 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -739,8 +739,10 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct aer_err_info *info, int i);
+int aer_get_device_error_info(struct aer_err_info *info, int i,
+			      bool link_healthy);
 void aer_print_error(struct aer_err_info *info, int i);
+int aer_add_error_device(struct aer_err_info *e_info, struct pci_dev *dev);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, bool flit,
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 0b5ed4722ac3..aaea9902cbb7 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -978,7 +978,7 @@ EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
  * @e_info: pointer to error info
  * @dev: pointer to pci_dev to be added
  */
-static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
+int aer_add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
 {
 	int i = e_info->error_dev_num;
 
@@ -1068,7 +1068,7 @@ static int find_device_iter(struct pci_dev *dev, void *data)
 
 	if (is_error_source(dev, e_info)) {
 		/* List this device */
-		if (add_error_device(e_info, dev)) {
+		if (aer_add_error_device(e_info, dev)) {
 			/* We cannot handle more... Stop iteration */
 			pci_err(dev, "Exceeded max supported (%d) devices with errors logged\n",
 				AER_MAX_MULTI_ERR_DEVICES);
@@ -1382,12 +1382,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
  * aer_get_device_error_info - read error status from dev and store it to info
  * @info: pointer to structure to store the error record
  * @i: index into info->dev[]
+ * @link_healthy: link is healthy or not
  *
  * Return: 1 on success, 0 on error.
  *
  * Note that @info is reused among all error devices. Clear fields properly.
  */
-int aer_get_device_error_info(struct aer_err_info *info, int i)
+int aer_get_device_error_info(struct aer_err_info *info, int i,
+			      bool link_healthy)
 {
 	struct pci_dev *dev;
 	int type, aer;
@@ -1415,10 +1417,12 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 			&info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
+		info->level = KERN_WARNING;
 	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
 		   type == PCI_EXP_TYPE_RC_EC ||
 		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-		   info->severity == AER_NONFATAL) {
+		   info->severity == AER_NONFATAL ||
+		   (info->severity == AER_FATAL && link_healthy)) {
 
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
@@ -1427,7 +1431,7 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 			&info->mask);
 		if (!(info->status & ~info->mask))
 			return 0;
-
+		info->level = KERN_ERR;
 		/* Get First Error Pointer */
 		pci_read_config_dword(dev, aer + PCI_ERR_CAP, &aercc);
 		info->first_error = PCI_ERR_CAP_FEP(aercc);
@@ -1451,11 +1455,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 
 	/* Report all before handling them, to not lose records by reset etc. */
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info, i))
+		if (aer_get_device_error_info(e_info, i, false))
 			aer_print_error(e_info, i);
 	}
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info, i))
+		if (aer_get_device_error_info(e_info, i, false))
 			handle_error_source(e_info->dev[i], e_info);
 	}
 }
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index f6069f621683..21c4e8371279 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -284,7 +284,7 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
 		pci_warn(pdev, "containment event, status:%#06x: unmasked uncorrectable error detected\n",
 			 status);
 		if (dpc_get_aer_uncorrect_severity(pdev, &info) &&
-		    aer_get_device_error_info(&info, 0)) {
+		    aer_get_device_error_info(&info, 0, false)) {
 			aer_print_error(&info, 0);
 			pci_aer_clear_nonfatal_status(pdev);
 			pci_aer_clear_fatal_status(pdev);
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index bebe4bc111d7..4e65eac809d1 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -215,6 +215,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	struct aer_err_info info;
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 			pci_warn(bridge, "subordinate device reset failed\n");
 			goto failed;
 		}
+
+		/* Link recovered, report fatal errors of RCiEP or EP */
+		if (state == pci_channel_io_frozen &&
+		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
+			aer_add_error_device(&info, dev);
+			info.severity = AER_FATAL;
+			if (aer_get_device_error_info(&info, 0, true))
+				aer_print_error(&info, 0);
+			pci_dev_put(dev);
+		}
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-- 
2.39.3


