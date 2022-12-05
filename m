Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5257A64382E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Dec 2022 23:33:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQyxg0cS5z3bhl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 09:33:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LmerRZV1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LmerRZV1;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQywm39kWz3045
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Dec 2022 09:32:40 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 24AD3B81598;
	Mon,  5 Dec 2022 22:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51E1C433D7;
	Mon,  5 Dec 2022 22:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670279554;
	bh=twc81D3fz7hgH5I0d5mqqU6YSPMlz+/dTZIQZDfy3pY=;
	h=From:To:Cc:Subject:Date:From;
	b=LmerRZV1yaSepemQWm8AsmqLnoTj4/lTY0q34Yb/8YKlo5a8O8Xk1+5bQfheq+sRw
	 DbOyfO088yMPdTdQuZL6bKyMArPbJVC68puDWA6Z+AHF1lGfwl0FYQq/eyV3tsW6AV
	 TQ5yibbN3XqA2dC9Yy4xptxyNfc28Z7VtRy/Yrihy9X03K+szly0SMw6ZKwLoI3BKN
	 xD3HVB6YMlXJ+oszsN3RJRUyq2SJQPQHzjLuw3vMzyZ+clEY5GFuwRpt0QkG2YAG24
	 FicPqbbd2MiV6tOkvUvWeX7eGIdx5sacqW2YKsToy4vt5Kd7ZrARpXafeD9Gfsm3AG
	 ACoDPBW/nfdJA==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>
Subject: [PATCH] cxl: Remove unnecessary cxl_pci_window_alignment()
Date: Mon,  5 Dec 2022 16:32:31 -0600
Message-Id: <20221205223231.1268085-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

cxl_pci_window_alignment() is referenced only via the struct
pci_controller_ops.window_alignment function pointer, and only in the
powerpc implementation of pcibios_window_alignment().

pcibios_window_alignment() defaults to returning 1 if the function pointer
is NULL, which is the same was what cxl_pci_window_alignment() does.

cxl_pci_window_alignment() is unnecessary, so remove it.  No functional
change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/misc/cxl/vphb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/misc/cxl/vphb.c b/drivers/misc/cxl/vphb.c
index 1264253cc07b..6332db8044bd 100644
--- a/drivers/misc/cxl/vphb.c
+++ b/drivers/misc/cxl/vphb.c
@@ -67,12 +67,6 @@ static void cxl_pci_disable_device(struct pci_dev *dev)
 	}
 }
 
-static resource_size_t cxl_pci_window_alignment(struct pci_bus *bus,
-						unsigned long type)
-{
-	return 1;
-}
-
 static void cxl_pci_reset_secondary_bus(struct pci_dev *dev)
 {
 	/* Should we do an AFU reset here ? */
@@ -200,7 +194,6 @@ static struct pci_controller_ops cxl_pci_controller_ops =
 	.enable_device_hook = cxl_pci_enable_device_hook,
 	.disable_device = cxl_pci_disable_device,
 	.release_device = cxl_pci_disable_device,
-	.window_alignment = cxl_pci_window_alignment,
 	.reset_secondary_bus = cxl_pci_reset_secondary_bus,
 	.setup_msi_irqs = cxl_setup_msi_irqs,
 	.teardown_msi_irqs = cxl_teardown_msi_irqs,
-- 
2.25.1

