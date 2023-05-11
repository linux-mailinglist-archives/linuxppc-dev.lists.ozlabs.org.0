Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BE36FF327
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 15:38:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHCf303yrz3fck
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 23:38:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Op+/4p5X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.121; helo=smtp-relay-canonical-1.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Op+/4p5X;
	dkim-atps=neutral
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHCcK5swTz3fN5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 23:37:05 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id C05FB42AAC;
	Thu, 11 May 2023 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1683812222;
	bh=zDeq6WNnFmu62W80v5qru7iSzFHVe3swEok2WPL7q1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Op+/4p5XNiVRgzrInZ35cUK7sV9g5PdUo+tUJn2Cy7s5aUHYgWL9uDO319te0nmoj
	 EcPooBKj5jewAQX8jEZiSYwfGoVFHTK7xsP8t/axXbzqU/HZLV9eHEqVYFcP0b5CFp
	 +jVUKdHag1dNLok5PUtgz9LvjpjAaeM+438n7RaJJgk9guU1+6PGIJp+v7gmC8xkVo
	 iBFOXSkZi2TvNP+l/vzd1mr+xNA+iNwrMbgzi10FN+yvkbKSBDBMUz0932HoHSTp5n
	 AQBAqKon2YXQ9Cv3FPxIrEOdTHJdSEVYbUHD35b/mbRKnTF/ItdI+TrONcN8RcA/aC
	 PdPCRyoBlMV6g==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH v5 2/3] PCI/AER: Disable AER interrupt on suspend
Date: Thu, 11 May 2023 21:36:08 +0800
Message-Id: <20230511133610.99759-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511133610.99759-1-kai.heng.feng@canonical.com>
References: <20230511133610.99759-1-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, linux-pci@vger.kernel.org, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCIe service that shares IRQ with PME may cause spurious wakeup on
system suspend.

This is very similar to previous attempts to suspend AER and DPC [1],
but this time disabling AER IRQ is to prevent immediate PME wakeup when
AER shares the same IRQ line with PME.

It's okay to disable AER because PCIe Base Spec 5.0, section 5.2 "Link
State Power Management" states that TLP and DLLP transmission is
disabled for a Link in L2/L3 Ready (D3hot), L2 (D3cold with aux power)
and L3 (D3cold), hence we don't lose much here to disable AER IRQ during
system suspend.

[1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v5:
 - Wording.

v4:
v3:
 - No change.

v2:
 - Only disable AER IRQ.
 - No more check on PME IRQ#.
 - Use helper.

 drivers/pci/pcie/aer.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 1420e1f27105..9c07fdbeb52d 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1356,6 +1356,26 @@ static int aer_probe(struct pcie_device *dev)
 	return 0;
 }
 
+static int aer_suspend(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+	struct pci_dev *pdev = rpc->rpd;
+
+	aer_disable_irq(pdev);
+
+	return 0;
+}
+
+static int aer_resume(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+	struct pci_dev *pdev = rpc->rpd;
+
+	aer_enable_irq(pdev);
+
+	return 0;
+}
+
 /**
  * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
  * @dev: pointer to Root Port, RCEC, or RCiEP
@@ -1420,6 +1440,8 @@ static struct pcie_port_service_driver aerdriver = {
 	.service	= PCIE_PORT_SERVICE_AER,
 
 	.probe		= aer_probe,
+	.suspend	= aer_suspend,
+	.resume		= aer_resume,
 	.remove		= aer_remove,
 };
 
-- 
2.34.1

