Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F38A6689
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:28:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N37v73LhzDqCl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:28:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="relOnnJ2"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tM5c5KzDqc2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:43 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id u72so4690397pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=icWrNJc1r61CPJA3GssblHEkeSqyLXym6XcU+K4q7OU=;
 b=relOnnJ294WHmDocfnvdbS/FhuJNuImXMJW8zB6MtLdMzk5756yjSxYejZ5CaLW5Ad
 NTcJTXueOat+gZkHtR2hGP/M++avWcWpv0F2r10BUIHQ5lT2mR2BrsRM+Poz8KO5w6QR
 CvY87p2B2XEsyBQbFAybSxEARQsc2L09cYOuLzorokx9XAO1gJA9jS63+HqvlrMX/0zA
 kInelUmZzmvS0o4N/OUI44br+nuV51X03dRfh6B8+dvD50/Ff3WjphGkh42lReAg/4Uo
 V/HnRSda+0vc+BsDfeQfyHJIkXnqX0zCf3cjpulbPJG+EtJeO+xW6Cwurm7U5NR1Hy5i
 fpEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=icWrNJc1r61CPJA3GssblHEkeSqyLXym6XcU+K4q7OU=;
 b=cctqKbCNoN4O/8kEJoqk3jpRHtxlvgvGgHQ/twLasi43+XDKEY2pNydteKClq3op5+
 XsM8a/rvBflzkDKtmkHASZXOwtZY/uRYU019L9XaU0SkIpq3glY9Wt+DqFd+9V7lRsDm
 bnnqjxzLkXuGw2bchLWZgjgGkWfqRWxY7RhxDQWCQi8cqoeOy2uEa+HodqbrbCC6fUVy
 FWP9zBXsahR+cCQpeNa+IEjV1MPJA6HXPoHH2B+E223df+nLuqf05W0973aP6fiOznyw
 zoCoZr0HPD9jACX8+wBHfMBJVljQUnS8Y2Rtk++FgwCiL+B45DSJHGTtAZLcV6Zx7D78
 OHwQ==
X-Gm-Message-State: APjAAAV9Jb7eiqglqQEW1n4e5tgFzV7nkCVUUdwmMS/Yl7rmdPP0MBVW
 MQ7uoFIWUhWo461GxcC/efr2rTRb
X-Google-Smtp-Source: APXvYqzsxYk2EnHn6E+yYWwZ0o6+GbJAqIM2YS6tIIEekxma5HuZV/jngDgTtDyY5BHI9JMEEI/S+g==
X-Received: by 2002:a65:654d:: with SMTP id a13mr29088915pgw.196.1567505800823; 
 Tue, 03 Sep 2019 03:16:40 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:40 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/14] powerpc/eeh: Check slot presence state in
 eeh_handle_normal_event()
Date: Tue,  3 Sep 2019 20:15:55 +1000
Message-Id: <20190903101605.2890-5-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903101605.2890-1-oohall@gmail.com>
References: <20190903101605.2890-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a device is surprise removed while undergoing IO we will probably
get an EEH PE freeze due to MMIO timeouts and other errors. When a freeze
is detected we send a recovery event to the EEH worker thread which will
notify drivers, and perform recovery as needed.

In the event of a hot-remove we don't want recovery to occur since there
isn't a device to recover. The recovery process is fairly long due to
the number of wait states (required by PCIe) which causes problems when
devices are removed and replaced (e.g. hot swapping of U.2 NVMe drives).

To determine if we need to skip the recovery process we can use the
get_adapter_state() operation of the hotplug_slot to determine if the
slot contains a device or not, and if the slot is empty we can skip
recovery entirely.

One thing to note is that the slot being EEH frozen does not prevent the
hotplug driver from working. We don't have the EEH recovery thread
remove any of the devices since it's assumed that the hotplug driver
will handle tearing down the slot state.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_driver.c | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 18a69fac4d80..52ce7584af43 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -27,6 +27,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pci_hotplug.h>
 #include <asm/eeh.h>
 #include <asm/eeh_event.h>
 #include <asm/ppc-pci.h>
@@ -769,6 +770,46 @@ static void eeh_pe_cleanup(struct eeh_pe *pe)
 	}
 }
 
+/**
+ * eeh_check_slot_presence - Check if a device is still present in a slot
+ * @pdev: pci_dev to check
+ *
+ * This function may return a false positive if we can't determine the slot's
+ * presence state. This might happen for for PCIe slots if the PE containing
+ * the upstream bridge is also frozen, or the bridge is part of the same PE
+ * as the device.
+ *
+ * This shouldn't happen often, but you might see it if you hotplug a PCIe
+ * switch.
+ */
+static bool eeh_slot_presence_check(struct pci_dev *pdev)
+{
+	const struct hotplug_slot_ops *ops;
+	struct pci_slot *slot;
+	u8 state;
+	int rc;
+
+	if (!pdev)
+		return false;
+
+	if (pdev->error_state == pci_channel_io_perm_failure)
+		return false;
+
+	slot = pdev->slot;
+	if (!slot || !slot->hotplug)
+		return true;
+
+	ops = slot->hotplug->ops;
+	if (!ops || !ops->get_adapter_status)
+		return true;
+
+	rc = ops->get_adapter_status(slot->hotplug, &state);
+	if (rc)
+		return true;
+
+	return !!state;
+}
+
 /**
  * eeh_handle_normal_event - Handle EEH events on a specific PE
  * @pe: EEH PE - which should not be used after we return, as it may
@@ -799,6 +840,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	enum pci_ers_result result = PCI_ERS_RESULT_NONE;
 	struct eeh_rmv_data rmv_data =
 		{LIST_HEAD_INIT(rmv_data.removed_vf_list), 0};
+	int devices = 0;
 
 	bus = eeh_pe_bus_get(pe);
 	if (!bus) {
@@ -807,6 +849,23 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		return;
 	}
 
+	/*
+	 * When devices are hot-removed we might get an EEH due to
+	 * a driver attempting to touch the MMIO space of a removed
+	 * device. In this case we don't have a device to recover
+	 * so suppress the event if we can't find any present devices.
+	 *
+	 * The hotplug driver should take care of tearing down the
+	 * device itself.
+	 */
+	eeh_for_each_pe(pe, tmp_pe)
+		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
+			if (eeh_slot_presence_check(edev->pdev))
+				devices++;
+
+	if (!devices)
+		goto out; /* nothing to recover */
+
 	eeh_pe_update_time_stamp(pe);
 	pe->freeze_count++;
 	if (pe->freeze_count > eeh_max_freezes) {
@@ -997,6 +1056,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 		}
 	}
 
+out:
 	/*
 	 * Clean up any PEs without devices. While marked as EEH_PE_RECOVERYING
 	 * we don't want to modify the PE tree structure so we do it here.
-- 
2.21.0

