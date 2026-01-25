Return-Path: <linuxppc-dev+bounces-16285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ay7YMAnkdWksJgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 10:36:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C228011F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jan 2026 10:36:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dzRPH6mG2z2yGM;
	Sun, 25 Jan 2026 20:36:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769333763;
	cv=none; b=mVG57aupWejySni42eYyoeYArOeI8k9E+wgrr1E6HOjh/BhW1NXGwSW/u//kgFceDHI8+FJ/ExQ3VyVXqz0VkkzGs3Jp+ofq3hLO0QQMCgvVzNmSsbhSWOvklHYec09YYXEK5/303leT7q9UUg2oV27aEjnP500Vq5kzCAZ1qW1qvrEDG8bmE7tbgXGMvrCVVMaGc8O4GmJiUAfqW3uKatH6bq1cHLWFYG2zIn+7WchDQUCGxsRQgq73KKbr6ynCz/37dt2jxg2l8rLNt0K8YzIDq8EVcxq+nAkrI6QY2gCX7FUUngNLkyMTP7gMi1HfW+dt8NPuIL6S07fOnmCD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769333763; c=relaxed/relaxed;
	bh=KVrhJQVa6iNn4A7swj5nUvqUYjfAnLqt/vu43RKw6wY=;
	h=Message-Id:From:Date:Subject:To:Cc; b=IIIantfk5NMHHLt6GA481+w9QySSfQGde8xvVGBXZy7xl9AAds/NsY+SY4auNQGeoP9ThkClfNb4q9/AUJ3pSE34BKZQgdQCI8Y/daFoXAEUEEosR1xNDBSbl++4olxGk83uvI1tZ+ltAZqbZIp2tmMrkRIAJfzH5/HMCQ+jesKujSx2ZnbJ2yZ+TLdB/FyRkWLmIjP69khgn7TuaL6uHAJNIcYKv2Dc7QdcCpIbql3yYjPrhpe/rX4AhF64LcyEfAQJdGoqx/cjMzpeF7J+9Ixv1bmtpRGYCcqLpQc8x9LhsxWsACKNjxrm01zWxRjB5L9cc9bs8IsShNiIeOP1lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 600 seconds by postgrey-1.37 at boromir; Sun, 25 Jan 2026 20:36:01 AEDT
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dzRPF4dYsz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jan 2026 20:36:01 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 511A52007F87;
	Sun, 25 Jan 2026 10:25:41 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2FE622FE8B; Sun, 25 Jan 2026 10:25:41 +0100 (CET)
Message-Id: <3011c2ed30c11f858e35e29939add754adea7478.1769332702.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 25 Jan 2026 10:25:51 +0100
Subject: [PATCH] PCI/AER: Clear stale errors on reporting agents upon probe
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Terry Bowman <terry.bowman@amd.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, linux-pci@vger.kernel.org, Shuai Xue <xueshuai@linux.alibaba.com>, tianruidong@linux.alibaba.com, Keith Busch <kbusch@kernel.org>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:terry.bowman@amd.com,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:linux-pci@vger.kernel.org,m:xueshuai@linux.alibaba.com,m:tianruidong@linux.alibaba.com,m:kbusch@kernel.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16285-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[amd.com,linux.intel.com,vger.kernel.org,linux.alibaba.com,kernel.org,linux.ibm.com,gmail.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linuxppc-dev@lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.679];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid,wunner.de:email,intel.com:email]
X-Rspamd-Queue-Id: D3C228011F
X-Rspamd-Action: no action

Correctable and Uncorrectable Error Status Registers on reporting agents
are cleared upon PCI device enumeration in pci_aer_init() to flush past
events.  They're cleared again when an error is handled by the AER driver.

If an agent reports a new error after pci_aer_init() and before the AER
driver has probed on the corresponding Root Port or Root Complex Event
Collector, that error is not handled by the AER driver:  It clears the
Root Error Status Register on probe, but neglects to re-clear the
Correctable and Uncorrectable Error Status Registers on reporting agents.

The error will eventually be reported when another error occurs.  Which
is irritating because to an end user it appears as if the earlier error
has just happened.

Amend the AER driver to clear stale errors on reporting agents upon probe.

Skip reporting agents which have not invoked pci_aer_init() yet to avoid
using an uninitialized pdev->aer_cap.  They're recognizable by the error
bits in the Device Control register still being clear.

Reporting agents may execute pci_aer_init() after the AER driver has
probed, particularly when devices are hotplugged or removed/rescanned via
sysfs.  For this reason, it continues to be necessary that pci_aer_init()
clears Correctable and Uncorrectable Error Status Registers.

Reported-by: Lucas Van <lucas.van@intel.com> # off-list
Tested-by: Lucas Van <lucas.van@intel.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/pci/pcie/aer.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e0bcaa8..4299c55 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1608,6 +1608,20 @@ static void aer_disable_irq(struct pci_dev *pdev)
 	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
 }
 
+static int clear_status_iter(struct pci_dev *dev, void *data)
+{
+	u16 devctl;
+
+	/* Skip if pci_enable_pcie_error_reporting() hasn't been called yet */
+	pcie_capability_read_word(dev, PCI_EXP_DEVCTL, &devctl);
+	if (!(devctl & PCI_EXP_AER_FLAGS))
+		return 0;
+
+	pci_aer_clear_status(dev);
+	pcie_clear_device_status(dev);
+	return 0;
+}
+
 /**
  * aer_enable_rootport - enable Root Port's interrupts when receiving messages
  * @rpc: pointer to a Root Port data structure
@@ -1629,9 +1643,19 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
 	pcie_capability_clear_word(pdev, PCI_EXP_RTCTL,
 				   SYSTEM_ERROR_INTR_ON_MESG_MASK);
 
-	/* Clear error status */
+	/* Clear error status of this Root Port or RCEC */
 	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
 	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, reg32);
+
+	/* Clear error status of agents reporting to this Root Port or RCEC */
+	if (reg32 & AER_ERR_STATUS_MASK) {
+		if (pci_pcie_type(pdev) == PCI_EXP_TYPE_RC_EC)
+			pcie_walk_rcec(pdev, clear_status_iter, NULL);
+		else if (pdev->subordinate)
+			pci_walk_bus(pdev->subordinate, clear_status_iter,
+				     NULL);
+	}
+
 	pci_read_config_dword(pdev, aer + PCI_ERR_COR_STATUS, &reg32);
 	pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS, reg32);
 	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
-- 
2.51.0


