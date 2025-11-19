Return-Path: <linuxppc-dev+bounces-14336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F75C6D8A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 09:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBFlR62z6z3bkT;
	Wed, 19 Nov 2025 19:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763542739;
	cv=none; b=EDYGp6bdUZQXD9KJ/Xr1hkiWppO2kWl8SN/Z7iULBNL2wjSgVbbLrTSLWzxhZSqECPCp1Qz4rhQ07i499gNSYaLabCJvM+xzI0nnNnymOP5HKh+lqCEZhCVfdl92i8BmrSraiXHr243pMY7+1UmP1FYmyhdq2MxMEOrbkjyPouxWoWCcZNY8boMzPvog+UB7hKbwyxI0683gAwW7BZ5qbhA1lebU2QXAtBusKYyWSuszGqsgeTWly0W1zV0Y3swa9BtO8YQO9mJb1XSIHZ6/UZWMNrbWSGkXfpJooHxF280ia3TS3Dk+/Qn9YPUbYDa8OLwcCHQI9R9/cmQtwkaUVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763542739; c=relaxed/relaxed;
	bh=zK7/rmTdFkRcU6KQrm7q6Fs+RNfxaad8fq4tcrwHTmk=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=FdCj64MSroU7/xvndgc2MK5XatZQmRkkd5DdwRqQ+eydd2DTJkXdF03sXLuu8A29GZBQ+Gpenho9xNLZmjbkg05HATIc76JKAoQ2CV9nXqPTG6d19qedby7sSY1U6cMekMU0eBo5gTT5hg75KFqSa+XitHGsqSSSw1BgMFEdxbeSQQDjodT7Wv23uuMDZuMaK4Cct/wH3bIiu1o15RSwwX/h/vA/ZGIqggqbeB2IjQNnTtDz3s7S5NbLFevXpgVOsJJQa6dloWElTljJIJFORvooVm1dlRikTKRhSizgoy3XdG6L0RIejWcdHya13GjbIYfbirLnIIJJfHVPkk4kKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 479 seconds by postgrey-1.37 at boromir; Wed, 19 Nov 2025 19:58:59 AEDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBFlR0Vc9z3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 19:58:59 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 5F1E02C000B0;
	Wed, 19 Nov 2025 09:58:56 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 36BA4D5EC; Wed, 19 Nov 2025 09:58:56 +0100 (CET)
Message-ID: <094f2aad64418710daf0940112abe5a0afdc6bce.1763483367.git.lukas@wunner.de>
In-Reply-To: <cover.1763483367.git.lukas@wunner.de>
References: <cover.1763483367.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 19 Nov 2025 09:50:01 +0100
Subject: [PATCH v2 1/3] PCI/PM: Reinstate clearing state_saved in legacy and
 !pm codepaths
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

When a PCI device is suspended, it is normally the PCI core's job to save
Config Space and put the device into a low power state.  However drivers
are allowed to assume these responsibilities.  When they do, the PCI core
can tell by looking at the state_saved flag in struct pci_dev:  The flag
is cleared before commencing the suspend sequence and it is set when
pci_save_state() is called.  If the PCI core finds the flag set late in
the suspend sequence, it refrains from calling pci_save_state() itself.

But there are two corner cases where the PCI core neglects to clear the
flag before commencing the suspend sequence:

* If a driver has legacy PCI PM callbacks, pci_legacy_suspend() neglects
  to clear the flag.  The (stale) flag is subsequently queried by
  pci_legacy_suspend() itself and pci_legacy_suspend_late().

* If a device has no driver or its driver has no PCI PM callbacks,
  pci_pm_freeze() neglects to clear the flag.  The (stale) flag is
  subsequently queried by pci_pm_freeze_noirq().

The flag may be set prior to suspend if the device went through error
recovery:  Drivers commonly invoke pci_restore_state() + pci_save_state()
to restore Config Space after reset.

The flag may also be set if drivers call pci_save_state() on probe to
allow for recovery from subsequent errors.

The result is that pci_legacy_suspend_late() and pci_pm_freeze_noirq()
don't call pci_save_state() and so the state that will be restored on
resume is the one recorded on last error recovery or on probe, not the one
that the device had on suspend.  If the two states happen to be identical,
there's no problem.

Reinstate clearing the flag in pci_legacy_suspend() and pci_pm_freeze().
The two functions used to do that until commit 4b77b0a2ba27 ("PCI: Clear
saved_state after the state has been restored") deemed it unnecessary
because it assumed that it's sufficient to clear the flag on resume in
pci_restore_state().  The commit seemingly did not take into account that
pci_save_state() and pci_restore_state() are not only used by power
management code, but also for error recovery.

Devices without driver or whose driver has no PCI PM callbacks may be in
runtime suspend when pci_pm_freeze() is called.  Their state has already
been saved, so don't clear the flag to skip a pointless pci_save_state()
in pci_pm_freeze_noirq().

None of the drivers with legacy PCI PM callbacks seem to use runtime PM,
so clear the flag unconditionally in their case.

Fixes: 4b77b0a2ba27 ("PCI: Clear saved_state after the state has been restored")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
Cc: stable@vger.kernel.org # v2.6.32+
---
 drivers/pci/pci-driver.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 302d61783f6c..327b21c48614 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -629,6 +629,8 @@ static int pci_legacy_suspend(struct device *dev, pm_message_t state)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_dev->state_saved = false;
+
 	if (drv && drv->suspend) {
 		pci_power_t prev = pci_dev->current_state;
 		int error;
@@ -1036,6 +1038,8 @@ static int pci_pm_freeze(struct device *dev)
 
 	if (!pm) {
 		pci_pm_default_suspend(pci_dev);
+		if (!pm_runtime_suspended(dev))
+			pci_dev->state_saved = false;
 		return 0;
 	}
 
-- 
2.51.0


