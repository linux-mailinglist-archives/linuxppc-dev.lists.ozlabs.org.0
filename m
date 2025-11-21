Return-Path: <linuxppc-dev+bounces-14416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FD7C7B17C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 18:36:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCj7t4T1Nz304h;
	Sat, 22 Nov 2025 04:36:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763746602;
	cv=none; b=jpbaRayBKu1pLDhbDPt84bpcSK7AJKbDyTB1EUsCKiaeZsRVRAUlyAkIy+5+Ml7VqRIroNrbRhatDkQOK/q8dBTqNgXy3zXtnnCCgv4C70xCS5OZIuVrXbuyZ7c7aRzGoDkajiCg/FIXLeDyCbuWa5dGuuYMQIxokA+9pf6pc60Io7xF3U3yzy5wSqWt1gy0jzw1YcSMMB7qd7eI7pcj5yXhbl3/ZZPbvtW4qSJSFYyls9yC7Wti5HYxkYzoV/Z0J9wfXd+JsjfDBxJ5T3n84jxIE/8RRaRLwILqJzxtF3KQ7H9malKR/Jymh/HfpenLedUIMsqnByGF/Ld0tIo4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763746602; c=relaxed/relaxed;
	bh=EbQzIOhV6mMQ5zBrM8rhkB75lprblBKcJWP571nWg98=;
	h=Message-Id:From:Date:Subject:To:Cc; b=EvmFJRxv9aXjt/c/r7DC7cU0DItMTq4bcoetWAUvenwGPFmsUNpCV0Um4NrvoZAYJrERmPRzltGtZWNqAxf2OIzVSvIFtXd5jcRxRilr2xBY7sQ+GzUmPMDXxka/rsbij/NN8zzAibF6HiQqSmfqcp2UMzBpsj+7Q33MP9Ysz9FN0bSOs16LpwvcG8iLWNeSAt5OzWlm9ATBY07A3Ez37v5F3LeiRk0UvfeIea/zd0KnmLS3bqWZwy9aVDeEMmybJjKRq8bkcjN21ZUarMafIXaXvxTnWOTlshj9bXSfpO1ytIXY0IWcSBb2WqbZQicBKCG4zuOlDb4j0SQLqvZo6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 309 seconds by postgrey-1.37 at boromir; Sat, 22 Nov 2025 04:36:41 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCj7s3Wyfz302V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 04:36:41 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E711E2C06AB8;
	Fri, 21 Nov 2025 18:31:16 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id E0DFE1BE8B; Fri, 21 Nov 2025 18:31:16 +0100 (CET)
Message-Id: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Fri, 21 Nov 2025 18:31:17 +0100
Subject: [PATCH] Documentation: PCI: Amend error recovery doc with
 pci_save_state() rules
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Farhan Ali <alifm@linux.ibm.com>, Benjamin Block <bblock@linux.ibm.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, Linas Vepstas <linasvepstas@gmail.com>, linux-doc@vger.kernel.org
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

After recovering from a PCI error through reset, affected devices are in
D0_uninitialized state and need to be brought into D0_active state by
re-initializing their Config Space registers (PCIe r7.0 sec 5.3.1.1).

To facilitate that, the PCI core provides pci_restore_state() and
pci_save_state() helpers.  Document rules governing their usage.

As Bjorn notes, so far no file in "Documentation/ includes anything about
the idea of a driver using pci_save_state() to capture the state it wants
to restore after an error", even though it is a common pattern in drivers.
So that's obviously a gap that should be closed.

Reported-by: Bjorn Helgaas <helgaas@kernel.org>
Closes: https://lore.kernel.org/r/20251113161556.GA2284238@bhelgaas/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/PCI/pci-error-recovery.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 5df481a..43bc4e3 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -326,6 +326,21 @@ be recovered, there is nothing more that can be done;  the platform
 will typically report a "permanent failure" in such a case.  The
 device will be considered "dead" in this case.
 
+Drivers typically need to call pci_restore_state() after reset to
+re-initialize the device's config space registers and thereby
+bring it from D0\ :sub:`uninitialized` into D0\ :sub:`active` state
+(PCIe r7.0 sec 5.3.1.1).  The PCI core invokes pci_save_state()
+on enumeration after initializing config space to ensure that a
+saved state is available for subsequent error recovery.
+Drivers which modify config space on probe may need to invoke
+pci_save_state() afterwards to record those changes for later
+error recovery.  When going into system suspend, pci_save_state()
+is called for every PCI device and that state will be restored
+not only on resume, but also on any subsequent error recovery.
+In the unlikely event that the saved state recorded on suspend
+is unsuitable for error recovery, drivers should call
+pci_save_state() on resume.
+
 Drivers for multi-function cards will need to coordinate among
 themselves as to which driver instance will perform any "one-shot"
 or global device initialization. For example, the Symbios sym53cxx2
-- 
2.51.0


