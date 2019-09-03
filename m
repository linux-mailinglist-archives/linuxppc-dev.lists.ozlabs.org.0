Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF5A66B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:44:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3Tv4kXyzDq9j
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:44:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="W0gwVS/B"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tl5KXqzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:17:03 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y22so4857330pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I00wDD/LIg61EwSKWX4EoZQWKAlTLND9gzcu1ZWR0hc=;
 b=W0gwVS/BYObQMD9cymImic6i4HRFLRqR0hkr5y4YOkzQ318flN7bWFxRQNQmHVMcqf
 G0DIkGQgbsxYWUDpZvzKIrVrUvrF1GnCwFOZoqb3fdgY5m1QCdFL3bOmjIPUrbWlMRZV
 Jfldnbh6/aHS+mzd4jHvV36t5/TsgVX6cZRqverJTi4ZRs17nhtQvMOr63GFIbbO4Gdf
 CuK16d4XalaSgpN1fom3f8+hTqV5BPNBeX1D/BSC40demvwIejKE7Lvs5vsHDVPFckkO
 oKOtId8iG0802/Wa4yQVEBYTjgeT4+UXRNy98gIipJOOhjwi2GHtlQDJ0oToLafu6BA+
 GwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I00wDD/LIg61EwSKWX4EoZQWKAlTLND9gzcu1ZWR0hc=;
 b=G4keujYKBB1QO9Ue4y2KIBQS/92077yAC8wN2nJq8L1BdGXhEISECd0dzSkPMqzCim
 lW8hELJvVc6+OfShVcHoIUCLZ85j5Fbxu9mGTUf8qr+7KY0WZgjYjF48XenU7Kornt57
 NcbdRWcSs6b5RrKx8qpk3Cvw4nEAvk/oNT/SD+oe26Un2iNHjc8XS7oijds8nSK3ynGv
 ApZQFh8VecnjgIt5jHWRL9Iug73kVwSZW8ZIga512czsg3tIvYhFm4OfzpnRgRTC2xhK
 /SYXTD1QI6JJ946+meyYucXdDDxiCIW9BS7R+N8Jrx7K4puLLoLrkS9ViNlENYI/oeQD
 ud0w==
X-Gm-Message-State: APjAAAXyMsN/+Ji2cIKnn6o5LKj/jeFG6rX8L+iKSKVUsWZ6c3I91RPo
 4aEIytpqrfE2cpUjuFlvxi73KSNB
X-Google-Smtp-Source: APXvYqypcKWXZ9xFvQtIQnE7M89u0HDtNO+6FXCieFLgJEfHv5pb3TixPJfqRxisPZliXQH8ZdDyfw==
X-Received: by 2002:a62:8246:: with SMTP id w67mr40468261pfd.226.1567505820752; 
 Tue, 03 Sep 2019 03:17:00 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:17:00 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 11/14] powerpc/eeh: Set attention indicator while recovering
Date: Tue,  3 Sep 2019 20:16:02 +1000
Message-Id: <20190903101605.2890-12-oohall@gmail.com>
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

I am the RAS team. Hear me roar.

Roar.

On a more serious note, being able to locate failed devices can be helpful.
Set the attention indicator if the slot supports it once we've determined
the device is present and only clear it if the device is fully recovered.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_driver.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_driver.c
index 0d34cc12c529..80bd157fcb45 100644
--- a/arch/powerpc/kernel/eeh_driver.c
+++ b/arch/powerpc/kernel/eeh_driver.c
@@ -803,6 +803,10 @@ static bool eeh_slot_presence_check(struct pci_dev *pdev)
 	if (!ops || !ops->get_adapter_status)
 		return true;
 
+	/* set the attention indicator while we've got the slot ops */
+	if (ops->set_attention_status)
+		ops->set_attention_status(slot->hotplug, 1);
+
 	rc = ops->get_adapter_status(slot->hotplug, &state);
 	if (rc)
 		return true;
@@ -810,6 +814,28 @@ static bool eeh_slot_presence_check(struct pci_dev *pdev)
 	return !!state;
 }
 
+static void eeh_clear_slot_attention(struct pci_dev *pdev)
+{
+	const struct hotplug_slot_ops *ops;
+	struct pci_slot *slot;
+
+	if (!pdev)
+		return;
+
+	if (pdev->error_state == pci_channel_io_perm_failure)
+		return;
+
+	slot = pdev->slot;
+	if (!slot || !slot->hotplug)
+		return;
+
+	ops = slot->hotplug->ops;
+	if (!ops || !ops->set_attention_status)
+		return;
+
+	ops->set_attention_status(slot->hotplug, 0);
+}
+
 /**
  * eeh_handle_normal_event - Handle EEH events on a specific PE
  * @pe: EEH PE - which should not be used after we return, as it may
@@ -1098,6 +1124,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
 	 * we don't want to modify the PE tree structure so we do it here.
 	 */
 	eeh_pe_cleanup(pe);
+
+	/* clear the slot attention LED for all recovered devices */
+	eeh_for_each_pe(pe, tmp_pe)
+		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
+			eeh_clear_slot_attention(edev->pdev);
+
 	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
 }
 
-- 
2.21.0

