Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77146A6696
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:35:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3JG1NlCzDqZw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:35:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pOWrbkzG"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tZ38bWzDqbx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:54 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id h195so3942486pfe.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNyDhLpeEod5S1jAQhHbsHI2ntQgU+xK77Nyjzl53KA=;
 b=pOWrbkzGHtKduT9dkf1CWgK0J2EYqLGDORCPwZVsUZqrmhLvZyanOTpGhRdNBas1ZR
 Fb4PGXMzxB7Gjc+KkUZdaZLFaZwL6M/aMiLRV9iJhZ4xX7BBOxtCn1xC93W+Af5Y26Ho
 SnAl0aXAwEGm5GkFncu3XfCEZZ89noXHmcQ4HcqQ+Ffpz6ESgaZMAeLKlc1idCo505to
 Ge6i5VSn+pPmVbn5YUO64jlsdwSOtBJ/VJEcsS9IQYDEWHxxeoeReSplmvJhmqIT62wn
 JEtyBHskCk1kuEZMTUebtXhinbXN/Kmpz6bc2Rk/k2K6OBdM11D2zzR1Mwfgkdn4n8dc
 bWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNyDhLpeEod5S1jAQhHbsHI2ntQgU+xK77Nyjzl53KA=;
 b=A4dT05vWRxuYOIM7X91tUOFxWtpyAwlsDOsLkiB25ikFkU3fDCpnoWZN/yjMqr4Fb0
 AxCEB4iNLu24OpCAu5bpvNAHn8ymLy0caVrjObFpzF8L4Jv4VmMl9zbcJSWdCC3v0ZwR
 O8nxZYJHsxPwpvhfAYjaQzpBZPmsLzNVcEhuq4zeD9QZYLZF6nGzuM6yo7l2tdbe1XQJ
 6N7LkS5pp6YeixVwA7bVgjpGWb5fav8Ncx0n7kJ4+va5mzwZO/KA0AySQoakRK6KVGuU
 mHoU5aevVO8A65zpXKlUMnazcMlolXIM6w/ffhHZwfhv5MFmn+K1RDWtITf3I7sBwAKY
 qHjQ==
X-Gm-Message-State: APjAAAUQQ/rcpz9tWel2ZhoaX48SLdpnlxHdA3yNh5Idlme15PXuXtE1
 6BKrFlhyy/yYZzuhQaqB6cZqGBGA
X-Google-Smtp-Source: APXvYqyvcNKA+pVZmiPHt9EUjxuO/dB0NafoFX97mo/+U0rmp1zKcBk3RVallK5hzeVZGnAC+yeS8g==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr24097574pfr.91.1567505812404; 
 Tue, 03 Sep 2019 03:16:52 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:51 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/14] powernv/eeh: Use generic code to handle hot resets
Date: Tue,  3 Sep 2019 20:15:58 +1000
Message-Id: <20190903101605.2890-8-oohall@gmail.com>
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

When we reset PCI devices managed by a hotplug driver the reset may
generate spurious hotplug events that cause the PCI device we're resetting
to be torn down accidently. This is a problem for EEH (when the driver is
EEH aware) since we want to leave the OS PCI device state intact so that
the device can be re-set without losing any resources (network, disks,
etc) provided by the driver.

Generic PCI code provides the pci_bus_error_reset() function to handle
resetting a PCI Device (or bus) by using the reset method provided by the
hotplug slot driver. We can use this function if the EEH core has
requested a hot reset (common case) without tripping over the hotplug
driver.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
I know that include is a bit gross, but:

a) We're already doing it in pci-ioda.c, and in pseries/pci.
b) It's pci_bus_error_reset() isn't really a function that
   should be provided to non-pci core code.
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 38 ++++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 94e26d56ecd2..6bc24a47e9ef 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -34,6 +34,7 @@
 
 #include "powernv.h"
 #include "pci.h"
+#include "../../../../drivers/pci/pci.h"
 
 static int eeh_event_irq = -EINVAL;
 
@@ -849,7 +850,7 @@ static int __pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
 	int aer = edev ? edev->aer_cap : 0;
 	u32 ctrl;
 
-	pr_debug("%s: Reset PCI bus %04x:%02x with option %d\n",
+	pr_debug("%s: Secondary Reset PCI bus %04x:%02x with option %d\n",
 		 __func__, pci_domain_nr(dev->bus),
 		 dev->bus->number, option);
 
@@ -907,6 +908,10 @@ static int pnv_eeh_bridge_reset(struct pci_dev *pdev, int option)
 	if (!dn || !of_get_property(dn, "ibm,reset-by-firmware", NULL))
 		return __pnv_eeh_bridge_reset(pdev, option);
 
+	pr_debug("%s: FW reset PCI bus %04x:%02x with option %d\n",
+		 __func__, pci_domain_nr(pdev->bus),
+		 pdev->bus->number, option);
+
 	switch (option) {
 	case EEH_RESET_FUNDAMENTAL:
 		scope = OPAL_RESET_PCI_FUNDAMENTAL;
@@ -1125,10 +1130,37 @@ static int pnv_eeh_reset(struct eeh_pe *pe, int option)
 		return -EIO;
 	}
 
-	if (pci_is_root_bus(bus) ||
-	    pci_is_root_bus(bus->parent))
+	if (pci_is_root_bus(bus))
 		return pnv_eeh_root_reset(hose, option);
 
+	/*
+	 * For hot resets try use the generic PCI error recovery reset
+	 * functions. These correctly handles the case where the secondary
+	 * bus is behind a hotplug slot and it will use the slot provided
+	 * reset methods to prevent spurious hotplug events during the reset.
+	 *
+	 * Fundemental resets need to be handled internally to EEH since the
+	 * PCI core doesn't really have a concept of a fundemental reset,
+	 * mainly because there's no standard way to generate one. Only a
+	 * few devices require an FRESET so it should be fine.
+	 */
+	if (option != EEH_RESET_FUNDAMENTAL) {
+		/*
+		 * NB: Skiboot and pnv_eeh_bridge_reset() also no-op the
+		 *     de-assert step. It's like the OPAL reset API was
+		 *     poorly designed or something...
+		 */
+		if (option == EEH_RESET_DEACTIVATE)
+			return 0;
+
+		rc = pci_bus_error_reset(bus->self);
+		if (!rc)
+			return 0;
+	}
+
+	/* otherwise, use the generic bridge reset. this might call into FW */
+	if (pci_is_root_bus(bus->parent))
+		return pnv_eeh_root_reset(hose, option);
 	return pnv_eeh_bridge_reset(bus->self, option);
 }
 
-- 
2.21.0

