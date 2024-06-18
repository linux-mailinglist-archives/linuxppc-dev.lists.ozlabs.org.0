Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2663890DDC9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 22:51:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V1HaqRJP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3f6k6gvFz30Sq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 06:51:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=V1HaqRJP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3f5H406dz2ysf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 06:49:55 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D51061B6F;
	Tue, 18 Jun 2024 20:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049C7C32786;
	Tue, 18 Jun 2024 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718743794;
	bh=JHzSKxuAUt5sskKJDUz7UVvUr/rjQm56XYg7g79WgHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1HaqRJPzz0zJSG/rrBID1OFWnkvPyXQUHG+2hFSO5FynGak2I85FGd3Iw+wsZPTK
	 rTgSR9XE2n4Uft8hL0UMAfhPVKYDZkcaVAIcBRM0W1sEzYD8FZ3Bo+lZF2RRGn4L4F
	 /xC2B7x5WEaF22/wfFgIhMXWxjiRWxCfjH7iVJDFiENoWSRCrMbkshsxk1QBnJHq8u
	 1Gt+UxrkNlyAulGCl0fTJ1BL+L+bPpzfNrO0xq8iJC3hEP1Z1ddHLUukq9IrXB+G8c
	 2YiEdaYr1dvxeaLJIVU1fUXSicM3+dJ1o/084SxMmFybN3tLXBfvV2ae5tSRfq7Axn
	 9FcmsnYLNW7Xg==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [PATCH v9 1/2] PCI/AER: Disable AER service on suspend
Date: Tue, 18 Jun 2024 15:49:45 -0500
Message-Id: <20240618204946.1271042-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618204946.1271042-1-helgaas@kernel.org>
References: <20240618204946.1271042-1-helgaas@kernel.org>
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
Cc: Hannes Reinecke <hare@suse.com>, Chaitanya Kulkarni <kch@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Oliver O'Halloran <oohall@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Keith Busch <kbusch@kernel.org>, Thomas Crider <gloriouseggroll@gmail.com>, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, regressions@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

If the link is powered off during suspend, electrical noise may cause
errors that are logged via AER.  If the AER interrupt is enabled and shares
an IRQ with PME, that causes a spurious wakeup during suspend.

Disable the AER interrupt during suspend to prevent this.  Clear error
status before re-enabling IRQ interrupts during resume so we don't get an
interrupt for errors that occurred during the suspend/resume process.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=209149
Link: https://bugzilla.kernel.org/show_bug.cgi?id=216295
Link: https://bugzilla.kernel.org/show_bug.cgi?id=218090
Link: https://lore.kernel.org/r/20240416043225.1462548-2-kai.heng.feng@canonical.com
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
[bhelgaas: drop pci_ancestor_pr3_present() etc, commit log]
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/pcie/aer.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index ac6293c24976..13b8586924ea 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1497,6 +1497,22 @@ static int aer_probe(struct pcie_device *dev)
 	return 0;
 }
 
+static int aer_suspend(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	aer_disable_rootport(rpc);
+	return 0;
+}
+
+static int aer_resume(struct pcie_device *dev)
+{
+	struct aer_rpc *rpc = get_service_data(dev);
+
+	aer_enable_rootport(rpc);
+	return 0;
+}
+
 /**
  * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
  * @dev: pointer to Root Port, RCEC, or RCiEP
@@ -1561,6 +1577,8 @@ static struct pcie_port_service_driver aerdriver = {
 	.service	= PCIE_PORT_SERVICE_AER,
 
 	.probe		= aer_probe,
+	.suspend	= aer_suspend,
+	.resume		= aer_resume,
 	.remove		= aer_remove,
 };
 
-- 
2.34.1

