Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D55A42E9AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 09:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVy5P17mwz3c5v
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 18:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ojxto+Qy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ojxto+Qy; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVy4j69Q4z2yPM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 18:06:59 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id o133so7598912pfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 00:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QAED6J0HE8As0y1hRwIfafx0zMwJK9PPhb8z/iBN9hk=;
 b=ojxto+QyXOUksiQM5BwMwvAO+Xhlj7Sfi2qBiz5rEjRdtjdlJlz3l4ws0BZqYJZ2ZT
 Rz7B9GFavcsP6JJ1r0RT17eRJF03cmYbhjG7c6mJTHHqRnu28OGUtcBJBAgO32h2FEhX
 g3t28TWbuK/Oc/C01ENuFa90SCfYrwYTPTp4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QAED6J0HE8As0y1hRwIfafx0zMwJK9PPhb8z/iBN9hk=;
 b=qHb35i2AKXkbm13Fix8+snhCHHE5y41UwF1w5vpceSDysKOIvyNv3egdoe8vyrWYD6
 /DgV+TAShcgheKRk2sly+/pWiWq0fe0RJj30dvKQyIs8Kyv/+FTOdpWsgkRdFCfV9v5x
 suu1dsCviQz3Zoa7/fJhQwAutALGUfF0aX3TT2lnoch1r2ceMoUt2+JmN3LI/lr6ljV1
 gzp/34YpPviZbvib64tTnk2Lp+/gYriAGrqYUIremT1tCCMxIXOW01p6UFkeFyGFZF/6
 if1wOaZIfHjlRoI1JpC/7z7cHBjhqam911/nkKsKK7WnXxVwnOTEn59BWQ7HfVemggn3
 oxqw==
X-Gm-Message-State: AOAM532vudDlq7yg8uUk9JAG0v1GNtyAVtHc7oksscbSfeZJD7Ty+ub2
 RhqE5cCcMQEIiRVkl5+4PziY6mMc9GY=
X-Google-Smtp-Source: ABdhPJyH0B6cEGxGt9nD6VBOgzy+tggYEphqrcOj6twBUY2zSnm6h7qgewDAcIoC7Oa8+zy1G/qNuA==
X-Received: by 2002:aa7:8d09:0:b0:44b:fd25:dd8a with SMTP id
 j9-20020aa78d09000000b0044bfd25dd8amr10199819pfe.41.1634281616140; 
 Fri, 15 Oct 2021 00:06:56 -0700 (PDT)
Received: from linkitivity.lan ([2001:4479:e300:600:757a:8144:2c27:6de9])
 by smtp.gmail.com with ESMTPSA id e14sm3988417pga.23.2021.10.15.00.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:06:55 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] eeh: Small refactor of eeh_handle_normal_event
Date: Fri, 15 Oct 2021 18:06:27 +1100
Message-Id: <20211015070628.1331635-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: oohall@gmail.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The control flow of eeh_handle_normal_event is a bit tricky.

Break out one of the error handling paths - rather than be in
an else block, we'll make it part of the regular body of the
function and put a 'goto out;' in the true limb of the if.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---

This doesn't really make things that much simpler to comprehend
by itself but it makes the next patch a bit cleaner.
---
 arch/powerpc/kernel/eeh_driver.c | 69 ++++++++++++++++----------------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 3eff6a4888e7..cb3ac555c944 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -1054,45 +1054,46 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		}
 
 		pr_info("EEH: Recovery successful.\n");
-	} else  {
-		/*
-		 * About 90% of all real-life EEH failures in the field
-		 * are due to poorly seated PCI cards. Only 10% or so are
-		 * due to actual, failed cards.
-		 */
-		pr_err("EEH: Unable to recover from failure from PHB#%x-PE#%x.\n"
-		       "Please try reseating or replacing it\n",
-			pe->phb->global_number, pe->addr);
+		goto out;
+	}
 
-		eeh_slot_error_detail(pe, EEH_LOG_PERM);
+	/*
+	 * About 90% of all real-life EEH failures in the field
+	 * are due to poorly seated PCI cards. Only 10% or so are
+	 * due to actual, failed cards.
+	 */
+	pr_err("EEH: Unable to recover from failure from PHB#%x-PE#%x.\n"
+		"Please try reseating or replacing it\n",
+		pe->phb->global_number, pe->addr);
 
-		/* Notify all devices that they're about to go down. */
-		eeh_set_channel_state(pe, pci_channel_io_perm_failure);
-		eeh_set_irq_state(pe, false);
-		eeh_pe_report("error_detected(permanent failure)", pe,
-			      eeh_report_failure, NULL);
+	eeh_slot_error_detail(pe, EEH_LOG_PERM);
 
-		/* Mark the PE to be removed permanently */
-		eeh_pe_state_mark(pe, EEH_PE_REMOVED);
+	/* Notify all devices that they're about to go down. */
+	eeh_set_channel_state(pe, pci_channel_io_perm_failure);
+	eeh_set_irq_state(pe, false);
+	eeh_pe_report("error_detected(permanent failure)", pe,
+		      eeh_report_failure, NULL);
 
-		/*
-		 * Shut down the device drivers for good. We mark
-		 * all removed devices correctly to avoid access
-		 * the their PCI config any more.
-		 */
-		if (pe->type & EEH_PE_VF) {
-			eeh_pe_dev_traverse(pe, eeh_rmv_device, NULL);
-			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
-		} else {
-			eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
-			eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
+	/* Mark the PE to be removed permanently */
+	eeh_pe_state_mark(pe, EEH_PE_REMOVED);
 
-			pci_lock_rescan_remove();
-			pci_hp_remove_devices(bus);
-			pci_unlock_rescan_remove();
-			/* The passed PE should no longer be used */
-			return;
-		}
+	/*
+	 * Shut down the device drivers for good. We mark
+	 * all removed devices correctly to avoid access
+	 * the their PCI config any more.
+	 */
+	if (pe->type & EEH_PE_VF) {
+		eeh_pe_dev_traverse(pe, eeh_rmv_device, NULL);
+		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
+	} else {
+		eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
+		eeh_pe_dev_mode_mark(pe, EEH_DEV_REMOVED);
+
+		pci_lock_rescan_remove();
+		pci_hp_remove_devices(bus);
+		pci_unlock_rescan_remove();
+		/* The passed PE should no longer be used */
+		return;
 	}
 
 out:
-- 
2.25.1

