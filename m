Return-Path: <linuxppc-dev+bounces-12225-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EE9B57E45
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 16:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQRYn6JMvz3dVj;
	Tue, 16 Sep 2025 00:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757944957;
	cv=none; b=LaFaoWatRUwkCTgD+X81boBYx6X5Z4+XHCjVnNGt/jrBo2HV9IpHg2MqyTKPMewgTRGbi2aPwVNaIkmSjgKaNWw7lW4BYsGQKMV9rGkYEnRiGH1jXRXf4wew/0bwdSGMx/IibMVGjE9TTWm2NaeLbJ3O68MMXIZbJQg8p9tCv0idw5+ZC7r8txU2GK8CB7pKNb034XvhoXFqveJ9CUS4dlWtfiyOBWQsoyeVDeqnvgU1S6btJN3Vp0GPcC+89+AasGUnhU2kmvCRANhN8UEgBeCRoeF3cZzDE1d7FDo/VzkNxYKIrXzYrNQf0l1FljhlBGN6OJf4T/fJHfBKxxMPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757944957; c=relaxed/relaxed;
	bh=R/FCuXxnATc0uloL+w1ZMr2vUiWwFElxLrMobD5oaME=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=FniUhOuaMn/BpYYVAVyXk0kyKL7LjRYB4Bgdl/NpBRmE12aLEvV4QBBRuZJpaBeEoG3JucHyD44SMTbLLa6Ningfs5BpQHTxOfBbjDLGVmv1yWC1dQcxj/ip664P25vUPpbyjDNbMa337dY9i44nVhH9/qHYpQ6CM4t/fsUfREvANdxw/lbYrWriCeEN406/HRd4Y4reRkBckrDTZeVp4DKxoTiNH1maYlPqpbVaZCr96JSOXs2TrVDGDQ8ersDCCQywrRfCEYpXdTcUJOhtJznFk+TYYEZHTpp1nsHz+KBZvmMtJD+DZwUv+7bLh++iKanO6eYFISXJN89iqHfd3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.54; helo=mailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=176.9.242.54; helo=mailout3.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cQRYm74Dqz3dTx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 00:02:36 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with UTF8SMTPS id 3A5593004431;
	Mon, 15 Sep 2025 16:02:27 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id EE57361248BF;
	Mon, 15 Sep 2025 16:02:26 +0200 (CEST)
X-Mailbox-Line: From 7501bfc5b9920193a25998a3cbcf72c47674ec63 Mon Sep 17 00:00:00 2001
Message-ID: <7501bfc5b9920193a25998a3cbcf72c47674ec63.1757942121.git.lukas@wunner.de>
In-Reply-To: <cover.1757942121.git.lukas@wunner.de>
References: <cover.1757942121.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 15 Sep 2025 15:50:01 +0200
Subject: [PATCH v2 1/4] Documentation: PCI: Sync AER doc with code
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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

The PCIe Advanced Error Reporting driver has evolved over the years but
its documentation hasn't.  Catch up with past code changes:

* The documentation claims that Correctable Errors are logged with
  KERN_INFO severity, but the code uses KERN_WARN.

  It had used KERN_WARN from the beginning with commit 6c2b374d7485
  ("PCI-Express AER implemetation: AER core and aerdriver").  In 2013,
  commit 2cced2d95961 ("aerdrv: Cleanup log output for AER") switched to
  KERN_ERR, until 2020 when it was reverted back to KERN_WARN by commit
  e83e2ca3c395 ("PCI/AER: Log correctable errors as warning, not error").

* An example log message in the documentation uses the term "Uncorrected",
  but the code uses "Uncorrectable" since commit 02a06f5f1a6a ("PCI/AER:
  Use 'Correctable' and 'Uncorrectable' spec terms for errors").

* The example contains the Requester ID "id=0500", which is omitted since
  commit 010caed4ccb6 ("PCI/AER: Decode Error Source Requester ID").

* The example contains the error name "Unsupported Request", which is
  instead reported as "UnsupReq" since commit bd237801fef2 ("PCI/AER:
  Adopt lspci names for AER error decoding").

* The example doesn't prepend "0x" to hex values from the TLP Header Log,
  as introduced by commit f68ea779d98a ("PCI: Add pcie_print_tlp_log() to
  print TLP Header and Prefix Log").

* The documentation refers to a reset_link callback which was removed by
  commit b6cf1a42f916 ("PCI/ERR: Remove service dependency in
  pcie_do_recovery()").

* Commit 579086225502 ("PCI/ERR: Recover from RCiEP AER errors") added
  support to recover Root Complex Integrated Endpoints by applying a
  Function Level Reset, alternatively to the Secondary Bus Reset which is
  applied otherwise.

* On non-fatal errors, a reset was previously never performed.  But the
  AER driver has just been amended to allow drivers to opt in to a reset.

* The documentation claims that a warning message is logged if a driver
  lacks pci_error_handlers.  But the message has been informational
  (logged with KERN_INFO severity) since its introduction with commit
  01daacfb9035 ("PCI/AER: Log which device prevents error recovery").

  The documentation claims that the message is only logged for fatal
  errors, which is incorrect.  Moreover it refers to "section 3", even
  though the documentation no longer contains section numbers since commit
  4e37f055a92e ("Documentation: PCI: convert pcieaer-howto.txt to reST").
  Section 3 is titled "Developer Guide".  That's the same section where
  the reference is located, so it is self-referential and can be dropped.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---
 Documentation/PCI/pcieaer-howto.rst | 81 ++++++++++++++---------------
 1 file changed, 38 insertions(+), 43 deletions(-)

diff --git a/Documentation/PCI/pcieaer-howto.rst b/Documentation/PCI/pcieaer-howto.rst
index 4b71e2f43ca7..d448efe572c8 100644
--- a/Documentation/PCI/pcieaer-howto.rst
+++ b/Documentation/PCI/pcieaer-howto.rst
@@ -70,16 +70,16 @@ AER error output
 ----------------
 
 When a PCIe AER error is captured, an error message will be output to
-console. If it's a correctable error, it is output as an info message.
+console. If it's a correctable error, it is output as a warning message.
 Otherwise, it is printed as an error. So users could choose different
 log level to filter out correctable error messages.
 
 Below shows an example::
 
-  0000:50:00.0: PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, id=0500(Requester ID)
+  0000:50:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Transaction Layer, (Requester ID)
   0000:50:00.0:   device [8086:0329] error status/mask=00100000/00000000
-  0000:50:00.0:    [20] Unsupported Request    (First)
-  0000:50:00.0:   TLP Header: 04000001 00200a03 05010000 00050100
+  0000:50:00.0:    [20] UnsupReq               (First)
+  0000:50:00.0:   TLP Header: 0x04000001 0x00200a03 0x05010000 0x00050100
 
 In the example, 'Requester ID' means the ID of the device that sent
 the error message to the Root Port. Please refer to PCIe specs for other
@@ -152,18 +152,6 @@ the device driver.
 Provide callbacks
 -----------------
 
-callback reset_link to reset PCIe link
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-This callback is used to reset the PCIe physical link when a
-fatal error happens. The Root Port AER service driver provides a
-default reset_link function, but different Upstream Ports might
-have different specifications to reset the PCIe link, so
-Upstream Port drivers may provide their own reset_link functions.
-
-Section 3.2.2.2 provides more detailed info on when to call
-reset_link.
-
 PCI error-recovery callbacks
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -174,8 +162,8 @@ when performing error recovery actions.
 Data struct pci_driver has a pointer, err_handler, to point to
 pci_error_handlers who consists of a couple of callback function
 pointers. The AER driver follows the rules defined in
-pci-error-recovery.rst except PCIe-specific parts (e.g.
-reset_link). Please refer to pci-error-recovery.rst for detailed
+pci-error-recovery.rst except PCIe-specific parts (see
+below). Please refer to pci-error-recovery.rst for detailed
 definitions of the callbacks.
 
 The sections below specify when to call the error callback functions.
@@ -189,10 +177,21 @@ software intervention or any loss of data. These errors do not
 require any recovery actions. The AER driver clears the device's
 correctable error status register accordingly and logs these errors.
 
-Non-correctable (non-fatal and fatal) errors
-~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Uncorrectable (non-fatal and fatal) errors
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-If an error message indicates a non-fatal error, performing link reset
+The AER driver performs a Secondary Bus Reset to recover from
+uncorrectable errors. The reset is applied at the port above
+the originating device: If the originating device is an Endpoint,
+only the Endpoint is reset. If on the other hand the originating
+device has subordinate devices, those are all affected by the
+reset as well.
+
+If the originating device is a Root Complex Integrated Endpoint,
+there's no port above where a Secondary Bus Reset could be applied.
+In this case, the AER driver instead applies a Function Level Reset.
+
+If an error message indicates a non-fatal error, performing a reset
 at upstream is not required. The AER driver calls error_detected(dev,
 pci_channel_io_normal) to all drivers associated within a hierarchy in
 question. For example::
@@ -204,38 +203,34 @@ Downstream Port B and Endpoint.
 
 A driver may return PCI_ERS_RESULT_CAN_RECOVER,
 PCI_ERS_RESULT_DISCONNECT, or PCI_ERS_RESULT_NEED_RESET, depending on
-whether it can recover or the AER driver calls mmio_enabled as next.
+whether it can recover without a reset, considers the device unrecoverable
+or needs a reset for recovery. If all affected drivers agree that they can
+recover without a reset, it is skipped. Should one driver request a reset,
+it overrides all other drivers.
 
 If an error message indicates a fatal error, kernel will broadcast
 error_detected(dev, pci_channel_io_frozen) to all drivers within
-a hierarchy in question. Then, performing link reset at upstream is
-necessary. As different kinds of devices might use different approaches
-to reset link, AER port service driver is required to provide the
-function to reset link via callback parameter of pcie_do_recovery()
-function. If reset_link is not NULL, recovery function will use it
-to reset the link. If error_detected returns PCI_ERS_RESULT_CAN_RECOVER
-and reset_link returns PCI_ERS_RESULT_RECOVERED, the error handling goes
-to mmio_enabled.
+a hierarchy in question. Then, performing a reset at upstream is
+necessary. If error_detected returns PCI_ERS_RESULT_CAN_RECOVER
+to indicate that recovery without a reset is possible, the error
+handling goes to mmio_enabled, but afterwards a reset is still
+performed.
 
-Frequent Asked Questions
-------------------------
+In other words, for non-fatal errors, drivers may opt in to a reset.
+But for fatal errors, they cannot opt out of a reset, based on the
+assumption that the link is unreliable.
+
+Frequently Asked Questions
+--------------------------
 
 Q:
   What happens if a PCIe device driver does not provide an
   error recovery handler (pci_driver->err_handler is equal to NULL)?
 
 A:
-  The devices attached with the driver won't be recovered. If the
-  error is fatal, kernel will print out warning messages. Please refer
-  to section 3 for more information.
-
-Q:
-  What happens if an upstream port service driver does not provide
-  callback reset_link?
-
-A:
-  Fatal error recovery will fail if the errors are reported by the
-  upstream ports who are attached by the service driver.
+  The devices attached with the driver won't be recovered.
+  The kernel will print out informational messages to identify
+  unrecoverable devices.
 
 
 Software error injection
-- 
2.51.0


