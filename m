Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FEE42E9B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVy682085z3c9H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 18:08:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=MRNT17nF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=MRNT17nF; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVy4j6w0mz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 18:07:01 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 lk8-20020a17090b33c800b001a0a284fcc2so8719142pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 00:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rt3JOPmFioKJ0U/rpemh1kMtUcFX68vPi53Pp4TMywo=;
 b=MRNT17nF+ICp3T6xpkd1jkdOaCyWUJsJbWdgDvznE+kDh3GEPvAaJtZ2TYKcEP5/e8
 i0tKgG2i1Kf176gLSacgeqkgr3xcwKNIQwUB6fDFyVaWiE2gJoz1Q+s+GwfaJj3nWuGf
 XK0noBdGZ+JiRpuxD2O1QG2++5hR6p0njLvjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rt3JOPmFioKJ0U/rpemh1kMtUcFX68vPi53Pp4TMywo=;
 b=BiiiDZUGn70ZTc6pevUve6zTcObR64WS383SztSkFDqy6j7ucMFg9TwHGeVYLcqScI
 mFGGAgs1sXwycMYQmk5TZ0yVZr3IcUZdAioMVaxUgMQ9nB+MqkPRJAn6z+Jyz753BIqZ
 OvAGE9D4NALdryy2YdeM4IPzmRFN1b43Vw67p2yEosSDFXCwJmY1BTaY6KK4bo3+Idf3
 Ruw12tE6CQB3jIVq7OrjXpZIN8RCqWPcjIEv00ivMW/l9ogg2IJo2UVu8NYq5W0pe2kY
 0DPZCTz/KUHWTsg53Cv5I87JmrvvMgvkcrJsiZ7VXIGZE5kUCgmeZEMuRiOlnl8t4tO1
 8fQQ==
X-Gm-Message-State: AOAM532TRkVhogwvuncZR8E49D1deNUdKQ5W1qYAdPmEQ9ZrJJGeK3MB
 NpFjJipaJATtFjUKfPP77Bm8Gb37qGt/ZQ==
X-Google-Smtp-Source: ABdhPJwfROcdnTwFSLNeGWbanMPt2Tr5hzrPa9SHGQxZmzuL95xXjKfpzt/oSB8QDhZBuzovwOGaKQ==
X-Received: by 2002:a17:90a:1a02:: with SMTP id 2mr11716576pjk.6.1634281618661; 
 Fri, 15 Oct 2021 00:06:58 -0700 (PDT)
Received: from linkitivity.lan ([2001:4479:e300:600:757a:8144:2c27:6de9])
 by smtp.gmail.com with ESMTPSA id e14sm3988417pga.23.2021.10.15.00.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:06:58 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/eeh: Use a goto for recovery failures
Date: Fri, 15 Oct 2021 18:06:28 +1100
Message-Id: <20211015070628.1331635-2-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015070628.1331635-1-dja@axtens.net>
References: <20211015070628.1331635-1-dja@axtens.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>, oohall@gmail.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Oliver O'Halloran <oohall@gmail.com>

The EEH recovery logic in eeh_handle_normal_event() has some pretty strange
flow control. If we remove all the actual recovery logic we're left with
the following skeleton:

	if (result != PCI_ERS_RESULT_DISCONNECT) {
		...
	}

	if (result != PCI_ERS_RESULT_DISCONNECT) {
		...
	}

	if (result == PCI_ERS_RESULT_NONE) {
		...
	}

	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
		...
	}

	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
		...
	}

	if (result == PCI_ERS_RESULT_NEED_RESET) {
		...
	}

	if ((result == PCI_ERS_RESULT_RECOVERED) ||
	    (result == PCI_ERS_RESULT_NONE)) {
		...
		goto out;
	}

	/*
	 * unsuccessful recovery / PCI_ERS_RESULT_DISCONECTED
	 * handling is here.
	 */
	...

	out:
	...

Most of the "if () { ... }" blocks above change "result" to
PCI_ERS_RESULT_DISCONNECTED if an error occurs in that recovery step. This
makes the control flow a bit confusing since it breaks the early-exit
pattern that is generally used in Linux. In any case we end up handling the
error in the final else block so why not just jump there directly? Doing so
also allows us to de-indent a bunch of code.

No functional changes.

Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
[dja: rebase on top of linux-next + my preceeding refactor,
      move clearing the EEH_DEV_NO_HANDLER bit above the first goto so that
      it is always clear in the error handler code as it was before.]
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/kernel/eeh_driver.c | 93 ++++++++++++++++----------------
 1 file changed, 45 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index cb3ac555c944..b8d5805c446a 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -905,18 +905,19 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	}
 #endif /* CONFIG_STACKTRACE */
 
+	eeh_for_each_pe(pe, tmp_pe)
+		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
+			edev->mode &= ~EEH_DEV_NO_HANDLER;
+
 	eeh_pe_update_time_stamp(pe);
 	pe->freeze_count++;
 	if (pe->freeze_count > eeh_max_freezes) {
 		pr_err("EEH: PHB#%x-PE#%x has failed %d times in the last hour and has been permanently disabled.\n",
 		       pe->phb->global_number, pe->addr,
 		       pe->freeze_count);
-		result = PCI_ERS_RESULT_DISCONNECT;
-	}
 
-	eeh_for_each_pe(pe, tmp_pe)
-		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
-			edev->mode &= ~EEH_DEV_NO_HANDLER;
+		goto recover_failed;
+	}
 
 	/* Walk the various device drivers attached to this slot through
 	 * a reset sequence, giving each an opportunity to do what it needs
@@ -928,39 +929,38 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * the error. Override the result if necessary to have partially
 	 * hotplug for this case.
 	 */
-	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		pr_warn("EEH: This PCI device has failed %d times in the last hour and will be permanently disabled after %d failures.\n",
-			pe->freeze_count, eeh_max_freezes);
-		pr_info("EEH: Notify device drivers to shutdown\n");
-		eeh_set_channel_state(pe, pci_channel_io_frozen);
-		eeh_set_irq_state(pe, false);
-		eeh_pe_report("error_detected(IO frozen)", pe,
-			      eeh_report_error, &result);
-		if ((pe->type & EEH_PE_PHB) &&
-		    result != PCI_ERS_RESULT_NONE &&
-		    result != PCI_ERS_RESULT_NEED_RESET)
-			result = PCI_ERS_RESULT_NEED_RESET;
-	}
+	pr_warn("EEH: This PCI device has failed %d times in the last hour and will be permanently disabled after %d failures.\n",
+		pe->freeze_count, eeh_max_freezes);
+	pr_info("EEH: Notify device drivers to shutdown\n");
+	eeh_set_channel_state(pe, pci_channel_io_frozen);
+	eeh_set_irq_state(pe, false);
+	eeh_pe_report("error_detected(IO frozen)", pe,
+		      eeh_report_error, &result);
+	if (result == PCI_ERS_RESULT_DISCONNECT)
+		goto recover_failed;
+
+	/*
+	 * Error logged on a PHB are always fences which need a full
+	 * PHB reset to clear so force that to happen.
+	 */
+	if ((pe->type & EEH_PE_PHB) && result != PCI_ERS_RESULT_NONE)
+		result = PCI_ERS_RESULT_NEED_RESET;
 
 	/* Get the current PCI slot state. This can take a long time,
 	 * sometimes over 300 seconds for certain systems.
 	 */
-	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		rc = eeh_wait_state(pe, MAX_WAIT_FOR_RECOVERY*1000);
-		if (rc < 0 || rc == EEH_STATE_NOT_SUPPORT) {
-			pr_warn("EEH: Permanent failure\n");
-			result = PCI_ERS_RESULT_DISCONNECT;
-		}
+	rc = eeh_wait_state(pe, MAX_WAIT_FOR_RECOVERY * 1000);
+	if (rc < 0 || rc == EEH_STATE_NOT_SUPPORT) {
+		pr_warn("EEH: Permanent failure\n");
+		goto recover_failed;
 	}
 
 	/* Since rtas may enable MMIO when posting the error log,
 	 * don't post the error log until after all dev drivers
 	 * have been informed.
 	 */
-	if (result != PCI_ERS_RESULT_DISCONNECT) {
-		pr_info("EEH: Collect temporary log\n");
-		eeh_slot_error_detail(pe, EEH_LOG_TEMP);
-	}
+	pr_info("EEH: Collect temporary log\n");
+	eeh_slot_error_detail(pe, EEH_LOG_TEMP);
 
 	/* If all device drivers were EEH-unaware, then shut
 	 * down all of the device drivers, and hope they
@@ -970,9 +970,8 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		pr_info("EEH: Reset with hotplug activity\n");
 		rc = eeh_reset_device(pe, bus, NULL, false);
 		if (rc) {
-			pr_warn("%s: Unable to reset, err=%d\n",
-				__func__, rc);
-			result = PCI_ERS_RESULT_DISCONNECT;
+			pr_warn("%s: Unable to reset, err=%d\n", __func__, rc);
+			goto recover_failed;
 		}
 	}
 
@@ -980,10 +979,10 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
 		pr_info("EEH: Enable I/O for affected devices\n");
 		rc = eeh_pci_enable(pe, EEH_OPT_THAW_MMIO);
+		if (rc < 0)
+			goto recover_failed;
 
-		if (rc < 0) {
-			result = PCI_ERS_RESULT_DISCONNECT;
-		} else if (rc) {
+		if (rc) {
 			result = PCI_ERS_RESULT_NEED_RESET;
 		} else {
 			pr_info("EEH: Notify device drivers to resume I/O\n");
@@ -991,15 +990,13 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 				      eeh_report_mmio_enabled, &result);
 		}
 	}
-
-	/* If all devices reported they can proceed, then re-enable DMA */
 	if (result == PCI_ERS_RESULT_CAN_RECOVER) {
 		pr_info("EEH: Enabled DMA for affected devices\n");
 		rc = eeh_pci_enable(pe, EEH_OPT_THAW_DMA);
+		if (rc < 0)
+			goto recover_failed;
 
-		if (rc < 0) {
-			result = PCI_ERS_RESULT_DISCONNECT;
-		} else if (rc) {
+		if (rc) {
 			result = PCI_ERS_RESULT_NEED_RESET;
 		} else {
 			/*
@@ -1017,16 +1014,15 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		pr_info("EEH: Reset without hotplug activity\n");
 		rc = eeh_reset_device(pe, bus, &rmv_data, true);
 		if (rc) {
-			pr_warn("%s: Cannot reset, err=%d\n",
-				__func__, rc);
-			result = PCI_ERS_RESULT_DISCONNECT;
-		} else {
-			result = PCI_ERS_RESULT_NONE;
-			eeh_set_channel_state(pe, pci_channel_io_normal);
-			eeh_set_irq_state(pe, true);
-			eeh_pe_report("slot_reset", pe, eeh_report_reset,
-				      &result);
+			pr_warn("%s: Cannot reset, err=%d\n", __func__, rc);
+			goto recover_failed;
 		}
+
+		result = PCI_ERS_RESULT_NONE;
+		eeh_set_channel_state(pe, pci_channel_io_normal);
+		eeh_set_irq_state(pe, true);
+		eeh_pe_report("slot_reset", pe, eeh_report_reset,
+			      &result);
 	}
 
 	if ((result == PCI_ERS_RESULT_RECOVERED) ||
@@ -1057,6 +1053,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		goto out;
 	}
 
+recover_failed:
 	/*
 	 * About 90% of all real-life EEH failures in the field
 	 * are due to poorly seated PCI cards. Only 10% or so are
-- 
2.25.1

