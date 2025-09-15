Return-Path: <linuxppc-dev+bounces-12228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CE2B57EA6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:17:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQRvR6ZbBz3dXB;
	Tue, 16 Sep 2025 00:17:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.233
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757945875;
	cv=none; b=HnWoqUNzi5OiRmvgXuSzahnIH4rfUPzIRkMgE7YllqOYxusKnDI/YF9EDhO0hwdhBozxk927sPCqOCEr7+J/ta4Rc2XuYN9K0abFZoG/PzwMJfHZ88PstMUUCrIa+WhMBCu+QIeZgq3GqI4a4OEELeV+6LdILotn8suV57BUUTgr0D5re8Dtns4YCnQUKI/VXqqeKMnrV3D9AjyqYEL9iXLMT18txkJ7Jj7iZeO8T08T0q/cAAA4KQY99rXItiGe2s5N9/R6fSaphRrrYssWl2J2K2cnyBHrqjQcPC7UIHVMxITqEwEnGlf42zn89TFXxNQBBjuEKiZO5+Qq7EfROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757945875; c=relaxed/relaxed;
	bh=i3qpx4X7rH9IU/+QcUsZEtf3/FZG4EK4tU/MYI9bSZM=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=RgALlcRprUnSl700DInH5K4SDAxIyIJBhCBA340/C1m3Yq1omffTzAu+QJ7K+JXShy6G71ZyTAb9Z8stFVsEFFPe3IUZBXMngXf2LZDpZlrzSlAdvxSdFXJE72p0pfJ4FcvXh2tXXS7uD3HaUvWDIvU5WizVpM77p4vsqGJSj1qL8YSgMW/ic0ItmhqKaAbz6c0kzvr849DOwrl6bCyHl1c6/cSLqSR4fIap7z/trw91s43A+ZO7Y9yTd/Hy8JfJo2mh2byU3rssIzKLshINprwufrRtz2zIFaWadrQjcXa5qmrVbk54a9EPMkX6l9OpW9xDMnA7acZae6HyB5WpmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.233; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=83.223.78.233; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1605 seconds by postgrey-1.37 at boromir; Tue, 16 Sep 2025 00:17:55 AEST
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cQRvR06pqz3dWc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:17:54 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with UTF8SMTPS id B90DD2C1E4C1;
	Mon, 15 Sep 2025 16:17:52 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id 8D379600B5BC;
	Mon, 15 Sep 2025 16:17:52 +0200 (CEST)
X-Mailbox-Line: From db56b7ef12043f709a04ce67c1d1e102ab5f4e19 Mon Sep 17 00:00:00 2001
Message-ID: <db56b7ef12043f709a04ce67c1d1e102ab5f4e19.1757942121.git.lukas@wunner.de>
In-Reply-To: <cover.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 15 Sep 2025 15:50:04 +0200
Subject: [PATCH v2 4/4] Documentation: PCI: Tidy error recovery doc's PCIe
 nomenclature
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
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 Documentation/PCI/pci-error-recovery.rst | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 9e1e2f2a13fa..5df481ac6193 100644
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
 
@@ -259,14 +259,14 @@ The driver should return one of the following result codes:
 
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
 
@@ -288,13 +288,13 @@ that is equivalent to what it would be after a fresh system
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
@@ -338,7 +338,7 @@ Result codes:
 	- PCI_ERS_RESULT_DISCONNECT
 	  Same as above.
 
-Drivers for PCI Express cards that require a fundamental reset must
+Drivers for PCIe cards that require a fundamental reset must
 set the needs_freset bit in the pci_dev structure in their probe function.
 For example, the QLogic qla2xxx driver sets the needs_freset bit for certain
 PCI card types::
-- 
2.51.0


