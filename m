Return-Path: <linuxppc-dev+bounces-12227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6537B57E91
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:15:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQRr94Fnsz3dWx;
	Tue, 16 Sep 2025 00:15:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:3000::53df:4ee9:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757945705;
	cv=none; b=a+9UeYc895+n2GZsV/0SnJdOhEqTGZnxAZGQFuPcd4tJmoumj6NGhRcHkLuH613xsCKCEmaDTanUQ1cKhuhX9UyukZC5AYGFY5oJUqyj1RjIcadZBI7lpGl0KdvWyE7hc+rI9FWvfvzfv7qL/YZEfP+Mw+MxHQLvSFZXi3ELpTImIEKttr6TXnK5cKLdMCacstxXl1pjmbGn2MTBTm//1HkzRMz+CR1N2khabhiOO6hJFAWJnTuQG3ifERYfRxxl4LYG+HqSEVSJGxkYrjA/ENXjVKViKmWF7GgO9OyRjpXqsS+8Q41YIC3yEXdS4qv0Whkx+3xszLYuUTf3BVSUAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757945705; c=relaxed/relaxed;
	bh=o4zseTWzGkWQ6i3AqEI/vRoIuuRBrla4g4QpBwvy7Qk=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=lBd4dm7OD6aFw86kIMiPFfMYjbMGas2G6DL2TxX5ZvTc6Fg0gwEuXY0IvbjLQGGXWw7dDYFpqcPKxY/xT6uQTNMBaDJ48HYqu3nzOT47ZXxmcIrEZb6HkMiBzoEShcTu0Fxt+nUtJdMP/Z8/YgIoQek5iyg3fPaabBroIubf4kDQxkRFYV9wEdByxKOieHq5UgBp0sKbaPzNfdtrTHRDY8nCPLFURDkGCe2k6bzl5RbFkwJx6K4CeVXYCT7zavOMbNEYN6TN/V1lTgTkwzwoMrm/DzocHgNDHLltI2HRT2ldqIPCdRw0Tzl6BVNsJHglu4C6huhGcIKmFIYkTTpiXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:3000::53df:4ee9:0; helo=mailout2.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [IPv6:2a01:37:3000::53df:4ee9:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cQRr85PQdz3dW1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:15:04 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with UTF8SMTPS id 314CF2C1E4C1;
	Mon, 15 Sep 2025 16:15:02 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id 12834600B5BC;
	Mon, 15 Sep 2025 16:15:02 +0200 (CEST)
X-Mailbox-Line: From 61d8eeadb20ee71c3a852f44c863bfe0209c454d Mon Sep 17 00:00:00 2001
Message-ID: <61d8eeadb20ee71c3a852f44c863bfe0209c454d.1757942121.git.lukas@wunner.de>
In-Reply-To: <cover.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 15 Sep 2025 15:50:03 +0200
Subject: [PATCH v2 3/4] Documentation: PCI: Amend error recovery doc with
 DPC/AER specifics
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

Amend the documentation on PCI error recovery with specifics about
Downstream Port Containment and Advanced Error Reporting:

* Explain that with DPC, devices are inaccessible upon an error (similar
  to EEH on powerpc) and do not become accessible until the link is
  re-enabled.

* Explain that with AER, although devices may already be accessible in the
  ->error_detected() callback, accesses should be deferred to the
  ->mmio_enabled() callback for compatibility with EEH on powerpc and with
  s390.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 Documentation/PCI/pci-error-recovery.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index d5c661baa87f..9e1e2f2a13fa 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -122,6 +122,10 @@ A PCI bus error is detected by the PCI hardware.  On powerpc, the slot
 is isolated, in that all I/O is blocked: all reads return 0xffffffff,
 all writes are ignored.
 
+Similarly, on platforms supporting Downstream Port Containment
+(PCIe r7.0 sec 6.2.11), the link to the sub-hierarchy with the
+faulting device is disabled. Any device in the sub-hierarchy
+becomes inaccessible.
 
 STEP 1: Notification
 --------------------
@@ -204,6 +208,24 @@ link reset was performed by the HW. If the platform can't just re-enable IOs
 without a slot reset or a link reset, it will not call this callback, and
 instead will have gone directly to STEP 3 (Link Reset) or STEP 4 (Slot Reset)
 
+.. note::
+
+   On platforms supporting Advanced Error Reporting (PCIe r7.0 sec 6.2),
+   the faulting device may already be accessible in STEP 1 (Notification).
+   Drivers should nevertheless defer accesses to STEP 2 (MMIO Enabled)
+   to be compatible with EEH on powerpc and with s390 (where devices are
+   inaccessible until STEP 2).
+
+   On platforms supporting Downstream Port Containment, the link to the
+   sub-hierarchy with the faulting device is re-enabled in STEP 3 (Link
+   Reset). Hence devices in the sub-hierarchy are inaccessible until
+   STEP 4 (Slot Reset).
+
+   For errors such as Surprise Down (PCIe r7.0 sec 6.2.7), the device
+   may not even be accessible in STEP 4 (Slot Reset). Drivers can detect
+   accessibility by checking whether reads from the device return all 1's
+   (PCI_POSSIBLE_ERROR()).
+
 .. note::
 
    The following is proposed; no platform implements this yet:
-- 
2.51.0


