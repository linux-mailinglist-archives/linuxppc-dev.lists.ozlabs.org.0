Return-Path: <linuxppc-dev+bounces-12304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E39B7D90C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 14:30:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRTWK5Cymz3cZ2;
	Wed, 17 Sep 2025 16:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758090845;
	cv=none; b=OEMr6442lOfwatCkbeiSQ8rm292ckVbfCjYCUs3zQRosHWWwHe47AyNGvFAd8OXxKVyCngcbQUblu5k+Y/rINLDAK2cnDuWzP6LTZH/CGMH9ZYk9bhG3ir4D0EaC3EKTXIk6TMvMQmtPl6PDcTevsVBZfhUE0l+i9rSUQ7Bm8gkE+csNtIS/om0odTrop17bMRx+vnmM/slr0nfr3dYh3NOFsmMhL5/gL6y3X/DY2LRg5+AZeqijO4JoEhF6VleCPp2HbZJ2rCtJWS5vhLpAYBtLHM5UWTGqK2uE/wh/GTvwWVfhP0y2hta7X0a/GMvMZ2/JJBnXCxBdHLtqflTGHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758090845; c=relaxed/relaxed;
	bh=Emk4LUrexpA6A1Qi+VgIagLLTTIpl1Z6BSUpE7Nvp4M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DVKGpUlfZncSePdp6BC9ZEuSVqYprS2KUp7pJ8N1p34PXqJDiqODgW/yn2uWzh+QdJrAVyM3E3xseAYT1ttqaXbpklCAlEZ0PrtZ8jjbSItIRx2s/HSPcK6jT9o1/t4RHvhs/u4shJz8h3vpI9Mqq/ytOaedGGrQKCuefdIGCoGnTcz7/rlyvuzRX0IEFxKSyccIp61EfNgiEIQC83GsL8HXjCaVoUVU/WAsff4SuaaFmO34WGbv0u9l+tkw3wcmV+6ea/RLW6i0UGVBiDgP+DduTp927h/nj+fDDzJPR9Pe7hse5oRfNOqehZsHqvkAQEUN8mx2Do4YmCvdJPvsXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bxrPljdf; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bxrPljdf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cRTWH5MPMz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 16:34:02 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1758090838; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Emk4LUrexpA6A1Qi+VgIagLLTTIpl1Z6BSUpE7Nvp4M=;
	b=bxrPljdfEvhe2jUE9ajji9Lkoica/dUkqGJDzbYFLN86iei+zkaCpwtvheEKf9UoRhxGwDbsskt/AZY75x2BbZrRAsSKrCJR0laS3/D1c/253l3WzPO9GZXrd8UteVMMv1k5NOmsEsJf8VAMDMfvzXBtTQwhKziZAKFMdrenVAM=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WoBL8KZ_1758090836 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 17 Sep 2025 14:33:56 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: bhelgaas@google.com,
	mahesh@linux.ibm.com,
	mani@kernel.org,
	Jonathan.Cameron@huawei.com,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 3/3] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Wed, 17 Sep 2025 14:33:52 +0800
Message-Id: <20250917063352.19429-4-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250917063352.19429-1-xueshuai@linux.alibaba.com>
References: <20250917063352.19429-1-xueshuai@linux.alibaba.com>
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
 drivers/pci/pci.h      |  3 ++-
 drivers/pci/pcie/aer.c | 11 +++++++----
 drivers/pci/pcie/dpc.c |  2 +-
 drivers/pci/pcie/err.c | 11 +++++++++++
 4 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index de2f07cefa72..b8d364545e7d 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -629,7 +629,8 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct aer_err_info *info, int i);
+int aer_get_device_error_info(struct aer_err_info *info, int i,
+			      bool link_healthy);
 void aer_print_error(struct aer_err_info *info, int i);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d716..157ad7fb44a0 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1351,12 +1351,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
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
@@ -1387,7 +1389,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
 		   type == PCI_EXP_TYPE_RC_EC ||
 		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-		   info->severity == AER_NONFATAL) {
+		   info->severity == AER_NONFATAL ||
+		   (info->severity == AER_FATAL && link_healthy)) {
 
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
@@ -1420,11 +1423,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 
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
index de6381c690f5..744d77ee7271 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -196,6 +196,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	struct pci_dev *bridge;
 	pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
 	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
+	struct aer_err_info info;
 
 	/*
 	 * If the error was detected by a Root Port, Downstream Port, RCEC,
@@ -223,6 +224,15 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 			pci_warn(bridge, "subordinate device reset failed\n");
 			goto failed;
 		}
+
+		info.dev[0] = dev;
+		info.level = KERN_ERR;
+		info.severity = AER_FATAL;
+		/* Link recovered, report fatal errors of RCiEP or EP */
+		if ((type == PCI_EXP_TYPE_ENDPOINT ||
+		     type == PCI_EXP_TYPE_RC_END) &&
+		    aer_get_device_error_info(&info, 0, true))
+			aer_print_error(&info, 0);
 	} else {
 		pci_walk_bridge(bridge, report_normal_detected, &status);
 	}
@@ -259,6 +269,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	if (host->native_aer || pcie_ports_native) {
 		pcie_clear_device_status(dev);
 		pci_aer_clear_nonfatal_status(dev);
+		pci_aer_clear_fatal_status(dev);
 	}
 
 	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
-- 
2.39.3


