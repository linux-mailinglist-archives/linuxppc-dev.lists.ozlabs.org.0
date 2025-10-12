Return-Path: <linuxppc-dev+bounces-12782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D758BBD02BD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Oct 2025 15:30:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cl1Yw2kcmz3cdV;
	Mon, 13 Oct 2025 00:30:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ef0:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760275812;
	cv=none; b=QAD5RlGabVKWNkfRXeguwmVrXOJbRByMe+SNMZ5fMZxBBKvciPTJnMsf0gIiihwsVOubazke42gE5Ini1R7TEdFrbDAl8shrZ0fxbQYu5XygoJEDuGGmvPj8zDSAMmV3NGbOPkE2pKw14xWmoYm8C+LA3nwhekAMSiAKkUMtd+UA/fU6T4pn93zhfhZutDe4B/pROdd/OBEcJzYJraeOxvdZ0uukUINF8N4ATtHm0U05DK86VOPJfTWlf2FMYz/JQOAgOGfvc+ogR0JB43UcOEWzjAwBMjohb2gEEHLTVVHlDGrMA7mcxEJTR4aR0+/y9UDSAO/xPivVIzravZZAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760275812; c=relaxed/relaxed;
	bh=UhiyT7eS42m2/I8sdGfHfbHZ0uHKLnWNHnlF3y5EDMY=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=lZwe42jKoum15+FgMdabgAKdobJJ6DatrhFxT1vrevLINrjWg3wONsEshw68B3orVyA6IzHk3OgJF8pZBviR3kkfTaYKbMs1vVS9pVhnPZYTUuB0988VboRHeOntQee73QZQsrfi8NTS1vbEwIN3HypwJnVN8FQRpAOtgWZ8KygHANwW4KdIXyqzSDxD96e41F071dfUL60vt371zD4TzK7w4Fjl+uSNxZEB/C7sfEO3Zks4T7le4UvMOHujOGLVjdJsiYtGoGct2OMchRBV3Q0ztU8HulmZbQw7KfIGHi0gVoaTJMDABYs0cMOX6JGTINIeRTvDFm9D0fw+S1q9yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ef0:0; helo=bmailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ef0:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cl1Yv4hCkz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 00:30:11 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id F1551200803C;
	Sun, 12 Oct 2025 15:30:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D512D4A12; Sun, 12 Oct 2025 15:30:06 +0200 (CEST)
Message-Id: <070a03221dbec25f478d36d7bc76e0da81985c5d.1760274044.git.lukas@wunner.de>
In-Reply-To: <cover.1760274044.git.lukas@wunner.de>
References: <cover.1760274044.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 12 Oct 2025 15:25:01 +0200
Subject: [PATCH 1/2] PCI: Ensure error recoverability at all times
To: Bjorn Helgaas <helgaas@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Alek Du <alek.du@intel.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
    Giovanni Cabiddu <giovanni.cabiddu@intel.com>, qat-linux@intel.com, Dave Jiang <dave.jiang@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
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
Tested-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Proof that removing the check in pci_restore_state() makes no
difference for the PCI core:

* The only relevant invocations of pci_restore_state() are in
  drivers/pci/pci-driver.c
* One invocation is in pci_restore_standard_config(), which is
  always called conditionally on "if (pci_dev->state_saved)".
  So the check at the beginning of pci_restore_state() which
  this patch removes is an unnecessary duplication.
* Another invocation is in pci_pm_default_resume_early(), which
  is called from pci_pm_resume_noirq(), pci_pm_restore_noirq()
  and pci_pm_runtime_resume().  Those functions are only called
  after prior calls to pci_pm_suspend_noirq(), pci_pm_freeze_noirq(),
  and pci_pm_runtime_suspend(), respectively.  And all of them
  call pci_save_state().  So the "if (!dev->state_saved)" check
  in pci_restore_state() never evaluates to true.
* A third invocation is in pci_pm_thaw_noirq().  It is only called
  after a prior call to pci_pm_freeze_noirq(), which invokes
  pci_save_state().  So likewise the "if (!dev->state_saved)" check
  in pci_restore_state() never evaluates to true.

 drivers/pci/bus.c   | 7 +++++++
 drivers/pci/pci.c   | 3 ---
 drivers/pci/probe.c | 2 --
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/bus.c b/drivers/pci/bus.c
index f26aec6..4318568 100644
--- a/drivers/pci/bus.c
+++ b/drivers/pci/bus.c
@@ -358,6 +358,13 @@ void pci_bus_add_device(struct pci_dev *dev)
 	pci_bridge_d3_update(dev);
 
 	/*
+	 * Save config space for error recoverability.  Clear state_saved
+	 * to detect whether drivers invoked pci_save_state() on suspend.
+	 */
+	pci_save_state(dev);
+	dev->state_saved = false;
+
+	/*
 	 * If the PCI device is associated with a pwrctrl device with a
 	 * power supply, create a device link between the PCI device and
 	 * pwrctrl device.  This ensures that pwrctrl drivers are probed
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b14dd06..2f0da5d 100644
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
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index c83e75a..c7c7a3d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2747,8 +2747,6 @@ void pci_device_add(struct pci_dev *dev, struct pci_bus *bus)
 
 	pci_reassigndev_resource_alignment(dev);
 
-	dev->state_saved = false;
-
 	pci_init_capabilities(dev);
 
 	/*
-- 
2.51.0


