Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81948103170
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:12:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmRR0PV4zDqVq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FfrJKDN3"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVg6BPdzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:03 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id q17so12460704pgt.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dnBRSf9cXHdGud8yphVd/WssJZBVV85N2FVMf+ETGog=;
 b=FfrJKDN3nn73H+UqeeUKvDCMwcrkv7T//3lLdYrMjMDCsWlxM0YKi0Epb8znx0VyFA
 cTa8mdn4UY6BfiJ20mOflAvIeLvhydY7jqJqLxgk/FAu5diZjSWZst9D+YpQg9nP7/Y4
 Hmj7Xjuey6EKM/TUymIrCLJ9X57sBqwWPh8yiwXZw6rdgln59ZiWfdECFICfuuGECEuz
 ucYHp2sRNJbwe6fMZxOGFDOAmkOiLkiVJ3xsGE9XqEPvCVIa+y5zvjYKB6Blrs3yQUdU
 uIK8NBtfGwycA5wmzDFYyAv4nU6trXkTRo5Xrlhzw85ihoO3N7sJnEd7Bc+qIbMUe5Zz
 4oVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dnBRSf9cXHdGud8yphVd/WssJZBVV85N2FVMf+ETGog=;
 b=FZFKgJQCf7ZjqaqS4z56efmA+QsfwhVC7sgfg4953gs+BZGdQ6RYEXyRYb++TwHFar
 oPzimqbuYQ0K6C+UuW6Nl2vazIoGdSXgd69cYHRJ4ZmMHYxttEY81yJ+XtKsWfAxlCPa
 mVypS0nXmEs4ggJVpesdwKw/qi3QWj6F7BGa2r16tPOti3OpLU6XlsFPFVDF9U6FWDJq
 3bYkVQTOWThGK8XnSwxYMjJjyg0Ty/GUW+SRmilPZep6dqbLt09VGAIYxRAPEkRN44ou
 zTCIIZmkm+q3pxARtc6D54cGBZfvwIFR/xtRmfmaGPT5U/J1N+cNKJRogZZZEkUj4Cpq
 HBdQ==
X-Gm-Message-State: APjAAAUdqEwHTo5wnA2GIMQGgGYYcYX6f7KOZkflJWYruIkluVEl67VS
 aZmDq69X8wYz0Afs4BYXATZCnpXz
X-Google-Smtp-Source: APXvYqxzp1flpTrFebayIMGeVaGC8hm9WppA4PogoVD8tbl2NO1jxUIULJhUa58duk8VDqSz1wQDxw==
X-Received: by 2002:a65:424a:: with SMTP id d10mr192154pgq.122.1574213401519; 
 Tue, 19 Nov 2019 17:30:01 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:01 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 21/46] powernv/eeh: Rework finding an existing edev in
 probe_pdev()
Date: Wed, 20 Nov 2019 12:28:34 +1100
Message-Id: <20191120012859.23300-22-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120012859.23300-1-oohall@gmail.com>
References: <20191120012859.23300-1-oohall@gmail.com>
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
Cc: alistair@popple.id.au, Oliver O'Halloran <oohall@gmail.com>,
 s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the pnv_eeh_find_edev() helper to look up the eeh_dev for a device
rather than doing it via the pci_dn.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 44 ++++++++++++++------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index 6ba74836a9f8..1cd80b399995 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -374,20 +374,40 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	int ret;
 	int config_addr = (pdev->bus->number << 8) | (pdev->devfn);
 
+	pci_dbg(pdev, "%s: probing\n", __func__);
+
 	/*
-	 * When probing the root bridge, which doesn't have any
-	 * subordinate PCI devices. We don't have OF node for
-	 * the root bridge. So it's not reasonable to continue
-	 * the probing.
+	 * EEH keeps the eeh_dev alive over a recovery pass even when the
+	 * corresponding pci_dev has been torn down. In that case we need
+	 * to find the existing eeh_dev and re-bind the two.
 	 */
-	if (!edev || edev->pe)
-		return NULL;
+	edev = pnv_eeh_find_edev(phb, config_addr);
+	if (edev) {
+		eeh_edev_dbg(edev, "Found existing edev!\n");
+
+		/*
+		 * XXX: eeh_remove_device() clears pdev so we shouldn't hit this
+		 * normally. I've found that screwing around with the pci probe
+		 * path can result in eeh_probe_pdev() being called twice. This
+		 * is harmless at the moment, but it's pretty strange so emit a
+		 * warning to be on the safe side.
+		 */
+		if (WARN_ON(edev->pdev))
+			eeh_edev_dbg(edev, "%s: already bound to a pdev!\n", __func__);
+
+		edev->pdev = pdev;
+
+		/* should we be doing something with REMOVED too? */
+		edev->mode &= EEH_DEV_DISCONNECTED;
+
+		/* update the primary bus if we need to */
+		// XXX: why do we need to do this? is the pci_bus going away? what cleared the flag?
+		if (!(edev->pe->state & EEH_PE_PRI_BUS)) {
+			edev->pe->bus = pdev->bus;
+			if (edev->pe->bus)
+				edev->pe->state |= EEH_PE_PRI_BUS;
+		}
 
-	/* already configured? */
-	if (edev->pdev) {
-		pr_debug("%s: found existing edev for %04x:%02x:%02x.%01x\n",
-			__func__, hose->global_number, config_addr >> 8,
-			PCI_SLOT(config_addr), PCI_FUNC(config_addr));
 		return edev;
 	}
 
@@ -395,8 +415,6 @@ static struct eeh_dev *pnv_eeh_probe_pdev(struct pci_dev *pdev)
 	if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA)
 		return NULL;
 
-	eeh_edev_dbg(edev, "Probing device\n");
-
 	/* Initialize eeh device */
 	edev->class_code = pdev->class;
 	edev->pcix_cap = pci_find_capability(pdev, PCI_CAP_ID_PCIX);
-- 
2.21.0

