Return-Path: <linuxppc-dev+bounces-16255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LdyMuN4dGnU5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16255-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:43 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCC7CD80
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jan 2026 08:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyn1S6nVmz309y;
	Sat, 24 Jan 2026 18:46:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769240796;
	cv=none; b=bmH/W1JSq0TXFD0Brf4ZGUsb1eiUcU0VLfTAl3G9PpqlZ9odIeNthqx6KY/26JwRj9BQo7Ay3JBSbfdxp3GfLeN//xbBL5qrIPYMnukqzO0EnTKz6qDP70E4xfAbFUdcZnDgwDZv1HSkcR9XKrYo6jog5/NmHrknSAS5HbTNuRZRVOyygkbXRqkAN6TKyQ5oAmVFxk0fZvv5vIr2uV+v1ElNI4VGs3Iq+1iT3Bii6UICh839ZORT9pt14p8SECoDQ1jlkrIY2fdN8ikpZTawuvjfwvYX+6ST2ayaZqbYjvFAbP2jvPRdyqpxF3uJ3R1kaeTp7ijwvz3DA7g1Xyyltg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769240796; c=relaxed/relaxed;
	bh=gdJzXK+D/+LAbE0E0SHsIWq9BjPFdGgwrb0qI4bTG8Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVVN0tDO4QL0evn03NlFY1B71bwxAZh7UiCBJvVBFPlNMHGdHmwUMzPpC79oC5B/Y6k7hXRTbQa/Q0HPM4kgRtYwbf8jAMLVwBgnrR/pkWEDKei5u76+Rq6w1FoY3OSZr7XKJlyegH0h2Ev8sdSLxidp+rg6QoLj0O1hqhaql6u7QTWlbo4NZQQhA36U5Xtj1YDwHo+NeLZ0nT+cwXA3A0kuJ3mzq5Jx+vtELyOnWBVgqDBjU4zVC8diBqjbbgdlIx69UGwaiF3hL3t2WKbHhU16SUbyNUrCuLGJD7fVccMzjLEwx7Et60jP2pz9qrHVTmA5BYgTm6gfjNx3i0alqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=foPzKMw5; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=foPzKMw5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyn1Q1SFJz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 18:46:33 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769240787; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=gdJzXK+D/+LAbE0E0SHsIWq9BjPFdGgwrb0qI4bTG8Y=;
	b=foPzKMw5L9SCOiOzta9UsreanKDkzmWfemuORyVe5EKPt9ZviIe51yvejbbWf4lAe1ip5mxaUHo4RwsGVX3/PxboyPmVYYh6HpuEkjg2406JNNWUK0XH5WemmBFpqAq/QbFN9k8AHea9lmc7YVx2+bq7kiXtGW2vWGZRDLSProw=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WxiIIAV_1769240785 cluster:ay36)
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
Subject: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected the error
Date: Sat, 24 Jan 2026 15:45:54 +0800
Message-Id: <20260124074557.73961-3-xueshuai@linux.alibaba.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,linux.alibaba.com,huawei.com,amd.com,wunner.de];
	TAGGED_FROM(0.00)[bounces-16255-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:xueshuai@linux.alibaba.com,m:Jonathan.Cameron@huawei.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linux.alibaba.com:mid,linux.alibaba.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,alibaba.com:email]
X-Rspamd-Queue-Id: D5BCC7CD80
X-Rspamd-Action: no action

The current implementation of pcie_do_recovery() assumes that the
recovery process is executed for the device that detected the error.
However, the DPC driver currently passes the error port that experienced
the DPC event to pcie_do_recovery().

Use the SOURCE ID register to correctly identify the device that
detected the error. When passing the error device, the
pcie_do_recovery() will find the upstream bridge and walk bridges
potentially AER affected. And subsequent commits will be able to
accurately access AER status of the error device.

Should not observe any functional changes.

Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pci.h      |  2 +-
 drivers/pci/pcie/dpc.c | 25 +++++++++++++++++++++----
 drivers/pci/pcie/edr.c |  7 ++++---
 3 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0e67014aa001..58640e656897 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -771,7 +771,7 @@ struct rcec_ea {
 void pci_save_dpc_state(struct pci_dev *dev);
 void pci_restore_dpc_state(struct pci_dev *dev);
 void pci_dpc_init(struct pci_dev *pdev);
-void dpc_process_error(struct pci_dev *pdev);
+struct pci_dev *dpc_process_error(struct pci_dev *pdev);
 pci_ers_result_t dpc_reset_link(struct pci_dev *pdev);
 bool pci_dpc_recovered(struct pci_dev *pdev);
 unsigned int dpc_tlp_log_len(struct pci_dev *dev);
diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
index bff29726c6a5..f6069f621683 100644
--- a/drivers/pci/pcie/dpc.c
+++ b/drivers/pci/pcie/dpc.c
@@ -260,10 +260,20 @@ static int dpc_get_aer_uncorrect_severity(struct pci_dev *dev,
 	return 1;
 }
 
-void dpc_process_error(struct pci_dev *pdev)
+/**
+ * dpc_process_error - handle the DPC error status
+ * @pdev: the port that experienced the containment event
+ *
+ * Return: the device that detected the error.
+ *
+ * NOTE: The device reference count is increased, the caller must decrement
+ * the reference count by calling pci_dev_put().
+ */
+struct pci_dev *dpc_process_error(struct pci_dev *pdev)
 {
 	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
 	struct aer_err_info info = {};
+	struct pci_dev *err_dev;
 
 	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
 
@@ -279,6 +289,7 @@ void dpc_process_error(struct pci_dev *pdev)
 			pci_aer_clear_nonfatal_status(pdev);
 			pci_aer_clear_fatal_status(pdev);
 		}
+		err_dev = pci_dev_get(pdev);
 		break;
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
@@ -290,6 +301,8 @@ void dpc_process_error(struct pci_dev *pdev)
 				"ERR_FATAL" : "ERR_NONFATAL",
 			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
 			 PCI_SLOT(source), PCI_FUNC(source));
+		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
+					    PCI_BUS_NUM(source), source & 0xff);
 		break;
 	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
 		ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
@@ -304,8 +317,11 @@ void dpc_process_error(struct pci_dev *pdev)
 		if (ext_reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_RP_PIO &&
 		    pdev->dpc_rp_extensions)
 			dpc_process_rp_pio_error(pdev);
+		err_dev = pci_dev_get(pdev);
 		break;
 	}
+
+	return err_dev;
 }
 
 static void pci_clear_surpdn_errors(struct pci_dev *pdev)
@@ -361,7 +377,7 @@ static bool dpc_is_surprise_removal(struct pci_dev *pdev)
 
 static irqreturn_t dpc_handler(int irq, void *context)
 {
-	struct pci_dev *err_port = context;
+	struct pci_dev *err_port = context, *err_dev;
 
 	/*
 	 * According to PCIe r6.0 sec 6.7.6, errors are an expected side effect
@@ -372,10 +388,11 @@ static irqreturn_t dpc_handler(int irq, void *context)
 		return IRQ_HANDLED;
 	}
 
-	dpc_process_error(err_port);
+	err_dev = dpc_process_error(err_port);
 
 	/* We configure DPC so it only triggers on ERR_FATAL */
-	pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
+	pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
+	pci_dev_put(err_dev);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/pci/pcie/edr.c b/drivers/pci/pcie/edr.c
index 521fca2f40cb..b6e9d652297e 100644
--- a/drivers/pci/pcie/edr.c
+++ b/drivers/pci/pcie/edr.c
@@ -150,7 +150,7 @@ static int acpi_send_edr_status(struct pci_dev *pdev, struct pci_dev *edev,
 
 static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 {
-	struct pci_dev *pdev = data, *err_port;
+	struct pci_dev *pdev = data, *err_port, *err_dev;
 	pci_ers_result_t estate = PCI_ERS_RESULT_DISCONNECT;
 	u16 status;
 
@@ -190,7 +190,7 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 		goto send_ost;
 	}
 
-	dpc_process_error(err_port);
+	err_dev = dpc_process_error(err_port);
 	pci_aer_raw_clear_status(err_port);
 
 	/*
@@ -198,7 +198,8 @@ static void edr_handle_event(acpi_handle handle, u32 event, void *data)
 	 * or ERR_NONFATAL, since the link is already down, use the FATAL
 	 * error recovery path for both cases.
 	 */
-	estate = pcie_do_recovery(err_port, pci_channel_io_frozen, dpc_reset_link);
+	estate = pcie_do_recovery(err_dev, pci_channel_io_frozen, dpc_reset_link);
+	pci_dev_put(err_dev);
 
 send_ost:
 
-- 
2.39.3


