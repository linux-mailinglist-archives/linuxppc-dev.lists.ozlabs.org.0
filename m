Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36527581D31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 03:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsxCY0yVBz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=acyN2D9y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.120; helo=smtp-relay-canonical-0.canonical.com; envelope-from=kai.heng.feng@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=acyN2D9y;
	dkim-atps=neutral
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsxBv19FSz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 11:33:57 +1000 (AEST)
Received: from localhost.localdomain (unknown [10.101.196.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 1508E3F395;
	Wed, 27 Jul 2022 01:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1658885634;
	bh=J7Mo7gRC9aUnXUlERL8fcZBWoJb2JAks8HFFUOO/0qw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=acyN2D9yFbUZ/Di08hQd138lFj++ds1vlYZ+Yl49z3HG+jdfU29MdKH+i3syPYvvW
	 jMeejKm069QBpOOIQ88GvibA3gP6GHjBSbeugvUV/j2Y8a8luyT9yyff0Rn0zoRIrj
	 k/P1Lf5C8n17MNcgSuBZB6LdaY/w/VkDLMOfM+7r35laPtNsvYRghH8L+CtTZBiMpK
	 3a1iWObZEdTXFhfrKpzFhEPgGEe6bBPREQ5qp+pro2mnXsJwB/bx62SUGi3kbvfk0x
	 C0kwAiwb2i3KXtB/ON81AQhdcguRpPJWR5GVC3/Yod9zWEfMTiSsMITi+TN4n0LLPM
	 KXrElqQEzq+SQ==
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: bhelgaas@google.com
Subject: [PATCH 2/3] PCI/AER: Disable AER service on suspend when IRQ is shared with PME
Date: Wed, 27 Jul 2022 09:32:51 +0800
Message-Id: <20220727013255.269815-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220727013255.269815-1-kai.heng.feng@canonical.com>
References: <20220727013255.269815-1-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCIe service that shares IRQ with PME may cause spurious wakeup on
system suspend.

PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
(D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
much here to disable AER during system suspend.

This is very similar to previous attempts to suspend AER and DPC [1],
but with a different reason.

[1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=216295

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/pci/pcie/aer.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 7952e5efd6cf3..60cc373754af2 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1372,6 +1372,26 @@ static int aer_probe(struct pcie_device *dev)
 	return 0;
 }
 
+static int aer_suspend(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	if (dev->shared_pme_irq)
+		aer_disable_rootport(rpc);
+
+	return 0;
+}
+
+static int aer_resume(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	if (dev->shared_pme_irq)
+		aer_enable_rootport(rpc);
+
+	return 0;
+}
+
 /**
  * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
  * @dev: pointer to Root Port, RCEC, or RCiEP
@@ -1441,8 +1461,9 @@ static struct pcie_port_service_driver aerdriver = {
 	.name		= "aer",
 	.port_type	= PCIE_ANY_PORT,
 	.service	= PCIE_PORT_SERVICE_AER,
-
 	.probe		= aer_probe,
+	.suspend	= aer_suspend,
+	.resume		= aer_resume,
 	.remove		= aer_remove,
 };
 
-- 
2.36.1

