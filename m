Return-Path: <linuxppc-dev+bounces-14337-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 574CEC6D96C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 10:07:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFxj2kRbz3blF;
	Wed, 19 Nov 2025 20:07:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763543273;
	cv=none; b=RgZEGCOPyMOVt6Q15+28rR5WX8LD0bfDwiNExGX/lwW27m+G8hYz7CTPBsh6A41g9Bzz3kQuCyMP0H/9fkv6v1CrsxxWhiX47dTCvsVBO0VSrCR9gjY8BgTpFDv9tuQld95nbn/tSs6tZwTUuVnNmmQEo2qVdSZL5vxY0EbrUyKdJbZ/bBU2zF9WeElq0G6ilMTmgDjjFdy/XSQsFcVk5padWw25Qdfn9uHs6JPJ4+K3Go2JY2Il99d3x0ETrHJ2pGcJJCCiCcqQ7nGf+Mi5nI1oJOGw+eOuUDdNglYKQ6SIocJk34f6tmt/iaURQ357JVDmw3cUq6GQSgUeGRY/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763543273; c=relaxed/relaxed;
	bh=VTyoeTJNRR7RmzEtsbI2mTijtBj0yFAuqpFwZdGnU/s=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Fbsz9uk1+reVAHTli89YfgJGvWsm0/B11CFuNa2pXNNLLlN+sh3GoUPeBfBrTGf4hB9WpGEt91zVdGheZA3xhIJfJJxlP7MSRZdHzb1oi1k+QQWlRZasvDEntpCu8SKw5aOBXi3MTqvEwXiXRWrD90KtRhhWn0X/lKcncyrIycelUbBgyVmOXD/6FeueYe57V3pN8FzWxzU3DoI4l3vENf2r1w13iuHSSbDMfB5599aRI8Gj9yypgdSql+WKvsXKRs+YYAef5ZgMcJxIzctmCeOEughfP6KBz03WAavcg/vOrGPl/r2iLHtm7gqFFrwsZdWQDLndPAml2UA46bdIJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBFxh4rbjz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 20:07:52 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 3CFA62C02046;
	Wed, 19 Nov 2025 10:07:50 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 139EAD673; Wed, 19 Nov 2025 10:07:50 +0100 (CET)
Message-ID: <9e34ce61c5404e99ffdd29205122c6fb334b38aa.1763483367.git.lukas@wunner.de>
In-Reply-To: <cover.1763483367.git.lukas@wunner.de>
References: <cover.1763483367.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 19 Nov 2025 09:50:03 +0100
Subject: [PATCH v2 3/3] PCI/ERR: Ensure error recoverability at all times
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
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

When the PCI core gained power management support in 2002, it introduced
pci_save_state() and pci_restore_state() helpers to restore Config Space
after a D3hot or D3cold transition, which implies a Soft or Fundamental
Reset (PCIe r7.0 sec 5.8):

  https://git.kernel.org/tglx/history/c/a5287abe398b

In 2006, EEH and AER were introduced to recover from errors by performing
a reset.  Because errors can occur at any time, drivers began calling
pci_save_state() on probe to ensure recoverability.

In 2009, recoverability was foiled by commit c82f63e411f1 ("PCI: check
saved state before restore"):  It amended pci_restore_state() to bail out
if the "state_saved" flag has been cleared.  The flag is cleared by
pci_restore_state() itself, hence a saved state is now allowed to be
restored only once and is then invalidated.  That doesn't seem to make
sense because the saved state should be good enough to be reused.

Soon after, drivers began to work around this behavior by calling
pci_save_state() immediately after pci_restore_state(), see e.g. commit
b94f2d775a71 ("igb: call pci_save_state after pci_restore_state").
Hilariously, two drivers even set the "saved_state" flag to true before
invoking pci_restore_state(), see ipr_reset_restore_cfg_space() and
e1000_io_slot_reset().

Despite these workarounds, recoverability at all times is not guaranteed:
E.g. when a PCIe port goes through a runtime suspend and resume cycle,
the "saved_state" flag is cleared by:

  pci_pm_runtime_resume()
    pci_pm_default_resume_early()
      pci_restore_state()

... and hence on a subsequent AER event, the port's Config Space cannot be
restored.  Riana reports a recovery failure of a GPU-integrated PCIe
switch and has root-caused it to the behavior of pci_restore_state().
Another workaround would be necessary, namely calling pci_save_state() in
pcie_port_device_runtime_resume().

The motivation of commit c82f63e411f1 was to prevent restoring state if
pci_save_state() hasn't been called before.  But that can be achieved by
saving state already on device addition, after Config Space has been
initialized.  A desirable side effect is that devices become recoverable
even if no driver gets bound.  This renders the commit unnecessary, so
revert it.

Reported-by: Riana Tauro <riana.tauro@intel.com> # off-list
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Tested-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
---
 drivers/pci/bus.c | 3 +++
 drivers/pci/pci.c | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index f26aec6ff588..9daf13ed3714 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -357,6 +357,9 @@ void pci_bus_add_device(struct pci_dev *dev)
 	pci_proc_attach_device(dev);
 	pci_bridge_d3_update(dev);
 
+	/* Save config space for error recoverability */
+	pci_save_state(dev);
+
 	/*
 	 * If the PCI device is associated with a pwrctrl device with a
 	 * power supply, create a device link between the PCI device and
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b14dd064006c..2f0da5dbbba4 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1855,9 +1855,6 @@ static void pci_restore_rebar_state(struct pci_dev *pdev)
  */
 void pci_restore_state(struct pci_dev *dev)
 {
-	if (!dev->state_saved)
-		return;
-
 	pci_restore_pcie_state(dev);
 	pci_restore_pasid_state(dev);
 	pci_restore_pri_state(dev);
-- 
2.51.0


