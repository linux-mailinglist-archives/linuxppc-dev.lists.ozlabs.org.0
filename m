Return-Path: <linuxppc-dev+bounces-10909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77141B24046
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 07:37:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1xwS0vskz30T8;
	Wed, 13 Aug 2025 15:37:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ee9:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755063464;
	cv=none; b=OH4bNMWstYeTfqwT8OYPn56SqLs71MC/tTh4xTkPLl1mKT3TsrG5rauzvmpzjz3IZmJFN5EVQdkxlTEoMmrJPbarGg24k79OaU/8Yxni8riXPo6ldevNKvl+oIqlmLdKZ3EpVJBeIQgYGw/4aHSiAD7I7KlcG5rtqmtlXAd1H81swctZE5xAWW6jb2bIahbiEnA8oRYMwseUmxye+sVmX3ogkudmovg/Rdnk6YHsCbI1OJaT0hzLiHZQsUVKGfNTK/c0B0zOgU9kIJTwyqr1J66G4CN2Q40rpHcBfhSJBYWuCNPVc5Qsufl1R8Mr8kTxTx2MaN3pKA93tftTNH+u5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755063464; c=relaxed/relaxed;
	bh=fEjdbhqOpVpE2yLfuedAY0DhJxP+sH/WAyH2zOUoJ6Q=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=gMUC09Kgxsc/JkozFvSRBffB8WnIg8Q8x7D2SbCyJEYW5zh2UtMfUnjS84edQ1o3JMD4TSvbyTpu7AK5uioXL2uJuM9b/oTyxEW24+aNigjbBowdjVmsZzmtVelPULaZDRZltWM70s8NM7FLqONRBM7H0OpEJFWyMln9CNz9zwKCSFG/EGQCAf6U4W2MKjdFeV1QFEoMs81SP+7mcHQEcwXGs4WHFeoW+x3itSkgzu9PhD4w3RM26xLCBo6awAJiExNAXTeOwVuwTQdsyBxwFkgf0zSubdqKSRefS6TdSvjBgFLJMiSvgPczRGK60Yyxt6ovHzYPjQ9iLxMfU8HIbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1xwR3MTxz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 15:37:43 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with UTF8SMTPS id DF6522C1E4C7;
	Wed, 13 Aug 2025 07:37:40 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id AD9EC6029EED;
	Wed, 13 Aug 2025 07:37:40 +0200 (CEST)
X-Mailbox-Line: From ec212d4d4f5c65d29349df33acdc9768ff8279d1 Mon Sep 17 00:00:00 2001
Message-ID: <ec212d4d4f5c65d29349df33acdc9768ff8279d1.1755008151.git.lukas@wunner.de>
In-Reply-To: <cover.1755008151.git.lukas@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 13 Aug 2025 07:11:03 +0200
Subject: [PATCH 3/5] PCI/ERR: Notify drivers on failure to recover
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
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

According to Documentation/PCI/pci-error-recovery.rst, the following shall
occur on failure to recover from a PCIe Uncorrectable Error:

  STEP 6: Permanent Failure
  -------------------------
  A "permanent failure" has occurred, and the platform cannot recover
  the device.  The platform will call error_detected() with a
  pci_channel_state_t value of pci_channel_io_perm_failure.

  The device driver should, at this point, assume the worst. It should
  cancel all pending I/O, refuse all new I/O, returning -EIO to
  higher layers. The device driver should then clean up all of its
  memory and remove itself from kernel operations, much as it would
  during system shutdown.

Sathya notes that AER does not call error_detected() on failure and thus
deviates from the document (as well as EEH, for which the document was
originally added).

Most drivers do nothing on permanent failure, but the SCSI drivers and a
number of Ethernet drivers do take advantage of the notification to flush
queues and give up resources.

Amend AER to notify such drivers and align with the documentation and EEH.

Link: https://lore.kernel.org/r/f496fc0f-64d7-46a4-8562-dba74e31a956@linux.intel.com/
Suggested-by: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/pci/pcie/err.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 21d554359fb1..930bb60fb761 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -110,7 +110,19 @@ static int report_normal_detected(struct pci_dev *dev, void *data)
 
 static int report_perm_failure_detected(struct pci_dev *dev, void *data)
 {
+	struct pci_driver *pdrv;
+	const struct pci_error_handlers *err_handler;
+
+	device_lock(&dev->dev);
+	pdrv = dev->driver;
+	if (!pdrv || !pdrv->err_handler || !pdrv->err_handler->error_detected)
+		goto out;
+
+	err_handler = pdrv->err_handler;
+	err_handler->error_detected(dev, pci_channel_io_perm_failure);
+out:
 	pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
+	device_unlock(&dev->dev);
 	return 0;
 }
 
-- 
2.47.2


