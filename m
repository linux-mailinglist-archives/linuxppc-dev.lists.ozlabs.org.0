Return-Path: <linuxppc-dev+bounces-10907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F732B24029
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 07:25:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1xf10ZcWz30T8;
	Wed, 13 Aug 2025 15:25:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5fcc:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755062713;
	cv=none; b=lavVDpU1tl/cGYJnXJlBz7ITksCEhtVfO8niDJFqutP98ENtPVHWf4MVfbRAYoO0m702XFBsnsiYCtKGs5m0A2W0sxQZ3DQafm+kRVPreNaYJGoHFsaS+166qGy5uz1HkLWzwygSMni16gu/CLVI1kvdB87F/ukutwDfk3w1Tzl6eV/LFVA5dI1QSU2JoJT8GljAFoAe1zN5x/54pTdzVeWFtKCy+twHwS7BnFDlb7CvK5wkjvhdytROGTmCUOM2kBSoJAMN4Gp8AnOE7yW988XbBGncSlsIBL3roGrqvxjWrAekdxkCrqs1WagSpHJCpvtf8ZTXf6/nyJTleXXFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755062713; c=relaxed/relaxed;
	bh=43HVlArcQJDYrzgIdlPe+/wjUSxmtD4nr1rqEE3J5+I=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=hpewX+k2hrtKv/uZOt0s6HIuNtS8Vgyb7OuiEVd8ozqT5NfxJhJalhNUvljKjUIhlHb8i0ATRvLrMQ5a7ZUqkLe+pHEEhJ0+VPAV66VpYGyHhGXZ9F67x/TlZBRRNUWNnZyOy2upb31SWFU7yETHP58Wgcs7kBQNC9grGcdjDKiF0PyfnMmmW/OwTWu/g4rc/Svr02YQKyNT2I62KtLL0ji0cvVmXOLOr2a5whtTMDKALJGdYAS4FfgrgvXhnV2fe9cEs1W2EJZbh8l3smgYkfSMy4BvHDXcX7GDGrD5u40uLh1+JfuqDgz98IF1aExxtgkIrXiSPe/SsCZmmBkphQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 809 seconds by postgrey-1.37 at boromir; Wed, 13 Aug 2025 15:25:12 AEST
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1xf03FvXz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 15:25:12 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with UTF8SMTPS id D07FC18C4A;
	Wed, 13 Aug 2025 07:25:09 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id A23F36000EA5;
	Wed, 13 Aug 2025 07:25:09 +0200 (CEST)
X-Mailbox-Line: From 28fd805043bb57af390168d05abb30898cf4fc58 Mon Sep 17 00:00:00 2001
Message-ID: <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
In-Reply-To: <cover.1755008151.git.lukas@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Wed, 13 Aug 2025 07:11:01 +0200
Subject: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, "Sean C. Dardis" <sean.c.dardis@intel.com>, Terry Bowman <terry.bowman@amd.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
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

When Advanced Error Reporting was introduced in September 2006 by commit
6c2b374d7485 ("PCI-Express AER implemetation: AER core and aerdriver"), it
sought to adhere to the recovery flow and callbacks specified in
Documentation/PCI/pci-error-recovery.rst.

That document had been added in January 2006, when Enhanced Error Handling
(EEH) was introduced for PowerPC with commit 065c6359071c ("[PATCH] PCI
Error Recovery: documentation").

However the AER driver deviates from the document in that it never
performs a Secondary Bus Reset on Non-Fatal Errors, but always on Fatal
Errors.  By contrast, EEH allows drivers to opt in or out of a Bus Reset
regardless of error severity, by returning PCI_ERS_RESULT_NEED_RESET or
PCI_ERS_RESULT_CAN_RECOVER from their ->error_detected() callback.  If all
drivers agree that they can recover without a Bus Reset, EEH skips it.
Should one of them request a Bus Reset, it overrides all other drivers.

This inconsistency between EEH and AER seems problematic because drivers
need to be aware of and cope with it.

The file Documentation/PCI/pcieaer-howto.rst hints at a rationale for
always performing a Bus Reset on Fatal Errors:  "Fatal errors [...] cause
the link to be unreliable.  [...] This [reset_link] callback is used to
reset the PCIe physical link when a fatal error happens.  If an error
message indicates a fatal error, [...] performing link reset at upstream
is necessary."

There's no such rationale provided for never performing a Bus Reset on
Non-Fatal Errors.

The "xe" driver has a need to attempt a reset of local units on graphics
cards upon a Non-Fatal Error.  If that is insufficient for recovery, the
driver wants to opt in to a Bus Reset.

Accommodate such use cases and align AER more closely with EEH by
performing a Bus Reset in pcie_do_recovery() if drivers request it and the
faulting device's channel_state is pci_channel_io_normal.  The AER driver
sets this channel_state for Non-Fatal Errors.  For Fatal Errors, it uses
pci_channel_io_frozen.

This limits the deviation from Documentation/PCI/pci-error-recovery.rst
and EEH to the unconditional Bus Reset on Fatal Errors.

pcie_do_recovery() is also invoked by the Downstream Port Containment and
Error Disconnect Recover drivers.  They both set the channel_state to
pci_channel_io_frozen, hence pcie_do_recovery() continues to always invoke
the ->reset_subordinates() callback in their case.  That is necessary
because the callback brings the link back up at the containing Downstream
Port.

There are two behavioral changes resulting from this commit:

First, if channel_state is pci_channel_io_normal and one of the affected
drivers returns PCI_ERS_RESULT_NEED_RESET from its ->error_detected()
callback, a Bus Reset will now be performed.  There are drivers doing this
and although it would be possible to avoid a behavioral change by letting
them return PCI_ERS_RESULT_CAN_RECOVER instead, the impression I got from
examination of all drivers is that they actually expect or want a Bus
Reset (cxl_error_detected() is a case in point).  In any case, if they can
cope with a Bus Reset on Fatal Errors, they shouldn't have issues with a
Bus Reset on Non-Fatal Errors.

Second, if channel_state is pci_channel_io_frozen and all affected drivers
return PCI_ERS_RESULT_CAN_RECOVER from ->error_detected(), their
->mmio_enabled() callback is now invoked prior to performing a Bus Reset,
instead of afterwards.  This actually makes sense:  For example,
drivers/scsi/sym53c8xx_2/sym_glue.c dumps debug registers in its
->mmio_enabled() callback.  Doing so after reset right now captures the
post-reset state instead of the faulting state, which is useless.

There is only one other driver which implements ->mmio_enabled() and
returns PCI_ERS_RESULT_CAN_RECOVER from ->error_detected() for
channel_state pci_channel_io_frozen, drivers/scsi/ipr.c (IBM Power RAID).
It appears to only be used on EEH platforms.  So the second behavioral
change is limited to these two drivers.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/pci/pcie/err.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index de6381c690f5..e795e5ae6b03 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -217,15 +217,10 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL);
 
 	pci_dbg(bridge, "broadcast error_detected message\n");
-	if (state == pci_channel_io_frozen) {
+	if (state == pci_channel_io_frozen)
 		pci_walk_bridge(bridge, report_frozen_detected, &status);
-		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
-			pci_warn(bridge, "subordinate device reset failed\n");
-			goto failed;
-		}
-	} else {
+	else
 		pci_walk_bridge(bridge, report_normal_detected, &status);
-	}
 
 	if (status == PCI_ERS_RESULT_CAN_RECOVER) {
 		status = PCI_ERS_RESULT_RECOVERED;
@@ -233,6 +228,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 		pci_walk_bridge(bridge, report_mmio_enabled, &status);
 	}
 
+	if (status == PCI_ERS_RESULT_NEED_RESET ||
+	    state == pci_channel_io_frozen) {
+		if (reset_subordinates(bridge) != PCI_ERS_RESULT_RECOVERED) {
+			pci_warn(bridge, "subordinate device reset failed\n");
+			goto failed;
+		}
+	}
+
 	if (status == PCI_ERS_RESULT_NEED_RESET) {
 		/*
 		 * TODO: Should call platform-specific
-- 
2.47.2


