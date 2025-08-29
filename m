Return-Path: <linuxppc-dev+bounces-11469-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4553EB3B472
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 09:36:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCqpF0z00z2ykc;
	Fri, 29 Aug 2025 17:36:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5fcc:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756452997;
	cv=none; b=oXG87f5NOcrCBcp4jnoPgEUI+Zq4FeZ5daStdBPnkvC0AABMK4uDLmBjdHIeznemIJNJvULa4tOE8Vj/cMUXVRr09tDTk+BsiJk5MxZwHQ1ek2r8m2T4MxrsuGBKCIj7WyMFMsULWbU+L3ApaURQ3XM3C2Gdil9Ae3mSgFP8n/tZK+pX6IQOxIDFjwx+T1dX5oM3UptvuR82IPkLkd5VJuWj0wFWG9rAHK4E1yigtQ4HjWc8z/YzTZlTVCQXH9hjb6FF98E/GXeC+sKyAJMRtXWmnFCEy8505WSmB4IOscGjJcswuQbLFuvmFCHx07DudE32u4EEvHjmYSqPpxG6og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756452997; c=relaxed/relaxed;
	bh=sezJA/w16HmB8jZo7XguVF77gJBm6/QSxnNkxgyWqlc=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:MIME-Version:
	 Content-Type:To:Cc; b=IdQMcJIbTcPALLFBW7XsQRSXJ1+Z8ceCiFQyJhNDJiTe++wOOy6PFOZupy9iniFJ24NpHq9fvSWF7OR/rQbmWFM4QmYmrXCQNg+B9noMmORyHnGBMTMJsOTIyHuh9RoNFhP7b90Lg7hYHRgOAq61RLA6GoondueVYXxnHcpGbymG4ezj2P/IpsZ/82gRrF07VIc+zLg0/YyGqlLFb/K46zmGXFx47NURfbMgb5k0xM0HJGCYd455Naj18cvHhKIavZcgmxIgtVHQYF/tN6TdJtWeIEaFY/UlcnnPtf6x5ID2peMrO/UhDi4oeBsSZfxOKdNLubInk9bjSJ2oZp9Jcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org) smtp.mailfrom=wunner.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wunner.de (client-ip=2a01:37:1000::53df:5fcc:0; helo=mailout1.hostsharing.net; envelope-from=lukas@wunner.de; receiver=lists.ozlabs.org)
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cCqpD3TnKz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 17:36:36 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with UTF8SMTPS id 34ED318C54;
	Fri, 29 Aug 2025 09:36:34 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with UTF8SMTPSA id 15276600AD9B;
	Fri, 29 Aug 2025 09:36:34 +0200 (CEST)
X-Mailbox-Line: From e18c1152facddc659e107353d67529d5a82a4133 Mon Sep 17 00:00:00 2001
Message-ID: <e18c1152facddc659e107353d67529d5a82a4133.1756451884.git.lukas@wunner.de>
In-Reply-To: <cover.1756451884.git.lukas@wunner.de>
References: <cover.1756451884.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Fri, 29 Aug 2025 09:25:02 +0200
Subject: [PATCH 2/4] PCI/ERR: Sync documentation with code
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
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Terry Bowman <terry.bowman@amd.com>, Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Linas Vepstas <linasvepstas@gmail.com>, "Mahesh J Salgaonkar" <mahesh@linux.ibm.com>, "Oliver OHalloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, Brian Norris <briannorris@chromium.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Amend the documentation on PCI error recovery to fix minor inaccuracies
vis-à-vis the actual code:

* The documentation claims that a missing ->resume() or ->mmio_enabled()
  callback always leads to recovery through reset.  But none of the
  implementations do this (pcie_do_recovery(), eeh_handle_normal_event(),
  zpci_event_do_error_state_clear()).

  Drop the claim to align the documentation with the code.

* The documentation does not list PCI_ERS_RESULT_RECOVERED as a valid
  return value from ->error_detected().  But none of the implementations
  forbid this and some drivers are returning it, e.g.:
  drivers/bus/mhi/host/pci_generic.c
  drivers/infiniband/hw/hfi1/pcie.c

  Further down in the documentation it is implied that the return value is
  in fact allowed:
  "The platform will call the resume() callback on all affected device
  drivers if all drivers on the segment have returned
  PCI_ERS_RESULT_RECOVERED from one of the 3 previous callbacks."

  The "3 previous callbacks" being ->error_detected(), ->mmio_enabled()
  and ->slot_reset().

  Add it to the valid return values for consistency.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/PCI/pci-error-recovery.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/PCI/pci-error-recovery.rst b/Documentation/PCI/pci-error-recovery.rst
index 42e1e78353f3..d5c661baa87f 100644
--- a/Documentation/PCI/pci-error-recovery.rst
+++ b/Documentation/PCI/pci-error-recovery.rst
@@ -108,8 +108,8 @@ A driver does not have to implement all of these callbacks; however,
 if it implements any, it must implement error_detected(). If a callback
 is not implemented, the corresponding feature is considered unsupported.
 For example, if mmio_enabled() and resume() aren't there, then it
-is assumed that the driver is not doing any direct recovery and requires
-a slot reset.  Typically a driver will want to know about
+is assumed that the driver does not need these callbacks
+for recovery.  Typically a driver will want to know about
 a slot_reset().
 
 The actual steps taken by a platform to recover from a PCI error
@@ -141,6 +141,9 @@ shouldn't do any new IOs. Called in task context. This is sort of a
 All drivers participating in this system must implement this call.
 The driver must return one of the following result codes:
 
+  - PCI_ERS_RESULT_RECOVERED
+      Driver returns this if it thinks the device is usable despite
+      the error and does not need further intervention.
   - PCI_ERS_RESULT_CAN_RECOVER
       Driver returns this if it thinks it might be able to recover
       the HW by just banging IOs or if it wants to be given
-- 
2.47.2


