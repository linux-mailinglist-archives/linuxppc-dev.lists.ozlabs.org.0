Return-Path: <linuxppc-dev+bounces-11473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3392DB3B4B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 09:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCr6t6zCPz2yrX;
	Fri, 29 Aug 2025 17:51:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ee9:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756453862;
	cv=none; b=D18QpSf1blRJnBdestRukiOW0djdJrHsStnL+KpScigNiXze6aMSvwooQqtnUGgc5DHSGNn2oOA2kraqcaU/60PF2fYKuPm4v3TWU9Tb+rrMrLZXdEYJyzSaj8W6u3BhfR7L4F2zttMWpzcnnT/dU7OcT1nBod7piHuin8o5W47vku8oFGxsGBP2OHSI75KxYzsxmDmWuFaLAK/m+hbQV05u9jR5BP5a6blmnwHeCcm9fAg65RTEz90hTHcLajO9Eo9WZP0HZEqkz1BXKK9rZeBo3xny+wrUDKEb4kk14OQy+LA3FO0pkipEroqcPRg11rr6zjKqa4biCBbZi8Ds1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756453862; c=relaxed/relaxed;
	bh=hkuZ2RSc9QbA1//5RNqOYhOKPAdH1Wyoe7zn1aw01eA=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=n63xC8j0kACQytWVmaVQI4U1HZ4DB9iJs2Sku1HEuk/u12TRk9u6SzKbiix0j2mxLq4Ilo4q/Ef9ZYvESJWhuU76vLHtbwzLpHyBHpC3XySTgCU59FHmRfPRUHvWndlwnsmIb9eaaWjMbJe1Jw08LyAd7AVXi/FW0b2MwZnRxCwFCMPGL724p70w9L/Kpv0AZQ2SjJJ52Ngt1IkRtHqkT5i2xh07khws+1WYxc9Ne4+ygSZv5Eo1X32Rru3YI09oHNZZuPi9lRYFgI0E1hKa4uWyTOqFtkwvQ5kMr9IT0GQwp19upMYNNmKrpdlSxMXASY1xV2EmbA/O5lmhSL5T9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cCr6t2fn0z2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 17:51:02 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with UTF8SMTPS id E76592C1E673;
	Fri, 29 Aug 2025 09:50:59 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id BB388600AD9B;
	Fri, 29 Aug 2025 09:50:59 +0200 (CEST)
X-Mailbox-Line: From 3d6f5aa8634bd4d13f28b7ec6b1b8d8d474e3c69 Mon Sep 17 00:00:00 2001
Message-ID: <3d6f5aa8634bd4d13f28b7ec6b1b8d8d474e3c69.1756451884.git.lukas@wunner.de>
In-Reply-To: <cover.1756451884.git.lukas@wunner.de>
References: <cover.1756451884.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Fri, 29 Aug 2025 09:25:04 +0200
Subject: [PATCH 4/4] PCI/ERR: Tidy documentation's PCIe nomenclature
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
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

Commit 11502feab423 ("Documentation: PCI: Tidy AER documentation")
replaced the terms "PCI-E", "PCI-Express" and "PCI Express" with "PCIe"
in the AER documentation.

Do the same in the documentation on PCI error recovery.  While at it,
add a missing period and a missing blank.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/PCI/pci-error-recovery.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index c88c304b2103..500d4e9b2143 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -13,7 +13,7 @@ PCI Error Recovery
 Many PCI bus controllers are able to detect a variety of hardware
 PCI errors on the bus, such as parity errors on the data and address
 buses, as well as SERR and PERR errors.  Some of the more advanced
-chipsets are able to deal with these errors; these include PCI-E chipsets,
+chipsets are able to deal with these errors; these include PCIe chipsets,
 and the PCI-host bridges found on IBM Power4, Power5 and Power6-based
 pSeries boxes. A typical action taken is to disconnect the affected device,
 halting all I/O to it.  The goal of a disconnection is to avoid system
@@ -206,7 +206,7 @@ reset or some such, but not restart operations. This callback is made if
 all drivers on a segment agree that they can try to recover and if no automatic
 link reset was performed by the HW. If the platform can't just re-enable IOs
 without a slot reset or a link reset, it will not call this callback, and
-instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
+instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset).
 
 .. note::
 
@@ -258,14 +258,14 @@ The driver should return one of the following result codes:
 
 The next step taken depends on the results returned by the drivers.
 If all drivers returned PCI_ERS_RESULT_RECOVERED, then the platform
-proceeds to either STEP3 (Link Reset) or to STEP 5 (Resume Operations).
+proceeds to either STEP 3 (Link Reset) or to STEP 5 (Resume Operations).
 
 If any driver returned PCI_ERS_RESULT_NEED_RESET, then the platform
 proceeds to STEP 4 (Slot Reset)
 
 STEP 3: Link Reset
 ------------------
-The platform resets the link.  This is a PCI-Express specific step
+The platform resets the link.  This is a PCIe specific step
 and is done whenever a fatal error has been detected that can be
 "solved" by resetting the link.
 
@@ -287,13 +287,13 @@ that is equivalent to what it would be after a fresh system
 power-on followed by power-on BIOS/system firmware initialization.
 Soft reset is also known as hot-reset.
 
-Powerpc fundamental reset is supported by PCI Express cards only
+Powerpc fundamental reset is supported by PCIe cards only
 and results in device's state machines, hardware logic, port states and
 configuration registers to initialize to their default conditions.
 
 For most PCI devices, a soft reset will be sufficient for recovery.
 Optional fundamental reset is provided to support a limited number
-of PCI Express devices for which a soft reset is not sufficient
+of PCIe devices for which a soft reset is not sufficient
 for recovery.
 
 If the platform supports PCI hotplug, then the reset might be
@@ -337,7 +337,7 @@ Result codes:
 	- PCI_ERS_RESULT_DISCONNECT
 	  Same as above.
 
-Drivers for PCI Express cards that require a fundamental reset must
+Drivers for PCIe cards that require a fundamental reset must
 set the needs_freset bit in the pci_dev structure in their probe function.
 For example, the QLogic qla2xxx driver sets the needs_freset bit for certain
 PCI card types::
-- 
2.47.2


