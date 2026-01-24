Return-Path: <linuxppc-dev+bounces-16258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iANUKvF4dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A257CDAC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn1V2yz2z3bkq;
	Sat, 24 Jan 2026 18:46:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769240798;
	cv=none; b=Ij4/s/uhBbHhBxwuEHYkijeQlTGTRjcBXp5xioOiFn/zyP/jZSu3upkwrNZhJ3ALDJhZjvQMMKo4a8IHlYa8zxCcY+nroXeHTafq6Ampr2UWN3Rcad4qkowgbJiQko/gpOju1xZKBHdLqXWt0RLy3ikw+2RbHReXOMjq5/hoiQYedXGBrwBzoXNRLoJbC3tGIBCd0PYqsc6acz2vSq9N4vb+nx1pABRM0CdzqAZlF5qBbHLOgcnipMTihURbHbWxj4JxCPnzU6Y4LBarwEcZwjeZccJOVaQp/ab0U9YoAl4byTfO3UtF0wj1eSyH+v4XpY6GCU0BJOdBOOvjo43++g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769240798; c=relaxed/relaxed;
	bh=Lai+WgHyyBBA7L8Dsr49RmuA+H1xMDngo1aaMmEEBco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GXd99IlwYA3QhmTVx4xzThypH+rF9KdyZlkdoCDNFBHDY+sJQpUw+GDwNRtinUhbBal0RM/08ZsOUz5PRKovemLfSej4e7PUoYe7UIj+H7REcvVSRQVtxs7EQDtytbrpep83w8mKcZhqV3Un6W1l/30kCUfD8JyVILBf4VoJPiohHxN8TzKTjhdOoE6+BIJGLTe22Z4sBcW665HfM2JU+o/4m1Bww3iiwBks+NQKcq2TIAaCy4sRg2VznIOGL+kuYzibG8sGIj81FmclwG2s7Yoxl8+Ok7CbMtFaCFr9k5V6PldEmNJwOL7jXrkUdq44GLkJ65JtKv52Y5G1O7w0zA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iA11u56a; dkim-atps=neutral; spf=pass (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=iA11u56a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.99; helo=out30-99.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn1Q5qsRz308l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:46:34 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769240790; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Lai+WgHyyBBA7L8Dsr49RmuA+H1xMDngo1aaMmEEBco=;
	b=iA11u56axQiynr2GgqED0jOErNQaUqA1YB9I12kE2eZxp+jZKf/Qn7etMpQEYtCdE41sVcsTXnF1BGaqbG8z3LddDlq7El7P+oTp4BSJpGyUyVSp9L+Hs51slBVmv9UHv6XzbGUhYIVq0bCziXVLY1ySX8bDFuXrjpTO4zpmU/I=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WxiIIB1_1769240786 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Jan 2026 15:46:26 +0800
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
Subject: [PATCH v7 3/5] PCI/AER: Report fatal errors of RCiEP and EP if link recoverd
Date: Sat, 24 Jan 2026 15:45:55 +0800
Message-Id: <20260124074557.73961-4-xueshuai@linux.alibaba.com>
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
	TAGGED_FROM(0.00)[bounces-16258-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,alibaba.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 09A257CDAC
X-Rspamd-Action: no action

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
+ vfio-pci 0015:01:00.0: AER: Errors reported prior to reset
+ vfio-pci 0015:01:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Receiver ID)
+ vfio-pci 0015:01:00.0:   device [144d:a80a] error status/mask=00001000/00400000
+ vfio-pci 0015:01:00.0:    [12] TLP                    (First)
+ vfio-pci 0015:01:00.0: AER:   TLP Header: 0x4a004010 0x00000040 0x01000000 0xffffffff
  pcieport 0015:00:00.0: AER: broadcast mmio_enabled message
  pcieport 0015:00:00.0: AER: broadcast resume message
  pcieport 0015:00:00.0: pciehp: Slot(21): Link Down/Up ignored
  pcieport 0015:00:00.0: AER: device recovery successful
  pcieport 0015:00:00.0: EDR: DPC port successfully recovered
  pcieport 0015:00:00.0: EDR: Status for 0015:00:00.0: 0x80

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  4 +++-
 drivers/pci/pcie/aer.c | 32 ++++++++++++++++++++++++++++----
 drivers/pci/pcie/dpc.c |  2 +-
 drivers/pci/pcie/err.c |  5 +++++
 4 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 58640e656897..bd020ba0cef0 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -746,8 +746,10 @@ struct aer_err_info {
 	struct pcie_tlp_log tlp;	/* TLP Header */
 };
 
-int aer_get_device_error_info(struct aer_err_info *info, int i);
+int aer_get_device_error_info(struct aer_err_info *info, int i,
+			      bool link_healthy);
 void aer_print_error(struct aer_err_info *info, int i);
+void aer_report_frozen_error(struct pci_dev *dev);
 
 int pcie_read_tlp_log(struct pci_dev *dev, int where, int where2,
 		      unsigned int tlp_len, bool flit,
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa896803..4c0a2bbe9197 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1384,12 +1384,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
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
@@ -1420,7 +1422,8 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 	} else if (type == PCI_EXP_TYPE_ROOT_PORT ||
 		   type == PCI_EXP_TYPE_RC_EC ||
 		   type == PCI_EXP_TYPE_DOWNSTREAM ||
-		   info->severity == AER_NONFATAL) {
+		   info->severity == AER_NONFATAL ||
+		   (info->severity == AER_FATAL && link_healthy)) {
 
 		/* Link is still healthy for IO reads */
 		pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
@@ -1447,17 +1450,38 @@ int aer_get_device_error_info(struct aer_err_info *info, int i)
 	return 1;
 }
 
+void aer_report_frozen_error(struct pci_dev *dev)
+{
+	struct aer_err_info info;
+	int type = pci_pcie_type(dev);
+
+	if (type != PCI_EXP_TYPE_ENDPOINT && type != PCI_EXP_TYPE_RC_END)
+		return;
+
+	info.error_dev_num = 0;
+	info.severity = AER_FATAL;
+	info.level = KERN_ERR;
+	add_error_device(&info, dev);
+
+	if (aer_get_device_error_info(&info, 0, true)) {
+		pci_err(dev, "Errors reported prior to reset\n");
+		aer_print_error(&info, 0);
+	}
+
+	pci_dev_put(dev); /* pairs with pci_dev_get() in add_error_device() */
+}
+
 static inline void aer_process_err_devices(struct aer_err_info *e_info)
 {
 	int i;
 
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
index bebe4bc111d7..0780ea09478b 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -253,6 +253,11 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 			pci_warn(bridge, "subordinate device reset failed\n");
 			goto failed;
 		}
+
+		/* Link recovered, report fatal errors of RCiEP or EP */
+		if (state == pci_channel_io_frozen)
+			aer_report_frozen_error(dev);
+
 	}
 
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
-- 
2.39.3


