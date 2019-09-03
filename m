Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0FA66AA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:37:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3Lr4cHvzDqLl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:37:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oxvU46pm"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tc6nlFzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:16:56 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y22so4857169pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7BB87QFbT9h7UGYB/gX+GuvHCmaI5baeXOn/YrM1/xg=;
 b=oxvU46pm4BD1epZn4lwLdDXrk325KYEXNguBBsSYNEmoQVESDkK7iogk8bBs3cZgYV
 W5oXqZrEAqoX8/nJCDt8TKx9s2zdgXC2ozi30gGeUSYJwzN/x29XK675RyEIF5PFelei
 jmOuG/V8PQQkXE1wxAZ/Qh1+qwI/xnhrwwG/EmDMrEwe0oUI4cYR1d3VDVV8LNZDnSY0
 dAXwR9junLnUJGLCTXFNcLS0F/Db9XvLfcyqwBgkNsdrcHStUcdYnaQUxwd8IDWWRojf
 BZEnoy99XPJI0FMAZO9tCaiAYKc3pMzcAgrVQHMcgZ4R/GDaiB08yAJABWTaQLyhWoyu
 lLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7BB87QFbT9h7UGYB/gX+GuvHCmaI5baeXOn/YrM1/xg=;
 b=qvJPefNqp9QaiWM6Qv0zVw84YQS7MFLrgfzIA2NrBDiTG3LUHOo6P3B5JnSWyBuyBo
 ogJWebm+nEM9LDVE8XAdEhI5+mOZ4mHAhITvk1MXYazEE/k8Q3fGVe2VSLqNV+oqNgS6
 TFn7WLQwhAzB95zryr8TBeJtAtmrp3sKDa96A3oNszOU5E0/ZvOGWWmmMFDZtheRSirj
 qxA3Tqx+RkdaWPBquBon+0w0NUWJ0SWP4GqXllxm/bzYb8uhLxoorGrDdAxgWDJl2gm6
 hjW3dSjb7N2ctOeFlY4NyNZNjeENAia8/QiSywuDKe4kPDrHdt+RF50TnXAbrQZnYxcO
 DA3g==
X-Gm-Message-State: APjAAAUF6aJbmb1KjxMs+8bwBl/4lYc61tObtfzzdM7WS2FulhY0XWLM
 0Kj+Wdplw+/o8357bf0ExtvYHKLG
X-Google-Smtp-Source: APXvYqwF4KGxoa3b+9fq8YM0aYDQbSC8h6e2/aKLKP7amlPWj/6ajCVwQKaQtFiRq98WtJVh07evwA==
X-Received: by 2002:aa7:870c:: with SMTP id b12mr639343pfo.122.1567505814463; 
 Tue, 03 Sep 2019 03:16:54 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:54 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 08/14] pci-hotplug/pnv_php: Add a reset_slot() callback
Date: Tue,  3 Sep 2019 20:15:59 +1000
Message-Id: <20190903101605.2890-9-oohall@gmail.com>
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

When performing EEH recovery of devices in a hotplug slot we need to use
the slot driver's ->reset_slot() callback to prevent spurious hotplug
events due to spurious DLActive and PresDet change interrupts. Add a
reset_slot() callback to pnv_php so we can handle recovery of devices
in pnv_php managed slots.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 drivers/pci/hotplug/pnv_php.c | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 6758fd7c382e..b0e243dabf77 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -511,6 +511,37 @@ static int pnv_php_enable(struct pnv_php_slot *php_slot, bool rescan)
 	return 0;
 }
 
+static int pnv_php_reset_slot(struct hotplug_slot *slot, int probe)
+{
+	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
+	struct pci_dev *bridge = php_slot->pdev;
+	uint16_t sts;
+
+	/*
+	 * The CAPI folks want pnv_php to drive OpenCAPI slots
+	 * which don't have a bridge. Only claim to support
+	 * reset_slot() if we have a bridge device (for now...)
+	 */
+	if (probe)
+		return !bridge;
+
+	/* mask our interrupt while resetting the bridge */
+	if (php_slot->irq > 0)
+		disable_irq(php_slot->irq);
+
+	pci_bridge_secondary_bus_reset(bridge);
+
+	/* clear any state changes that happened due to the reset */
+	pcie_capability_read_word(php_slot->pdev, PCI_EXP_SLTSTA, &sts);
+	sts &= (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC);
+	pcie_capability_write_word(php_slot->pdev, PCI_EXP_SLTSTA, sts);
+
+	if (php_slot->irq > 0)
+		enable_irq(php_slot->irq);
+
+	return 0;
+}
+
 static int pnv_php_enable_slot(struct hotplug_slot *slot)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
@@ -548,6 +579,7 @@ static const struct hotplug_slot_ops php_slot_ops = {
 	.set_attention_status	= pnv_php_set_attention_state,
 	.enable_slot		= pnv_php_enable_slot,
 	.disable_slot		= pnv_php_disable_slot,
+	.reset_slot		= pnv_php_reset_slot,
 };
 
 static void pnv_php_release(struct pnv_php_slot *php_slot)
@@ -721,6 +753,12 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 	pcie_capability_read_word(pdev, PCI_EXP_SLTSTA, &sts);
 	sts &= (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC);
 	pcie_capability_write_word(pdev, PCI_EXP_SLTSTA, sts);
+
+	pci_dbg(pdev, "PCI slot [%s]: HP int! DLAct: %d, PresDet: %d\n",
+			php_slot->name,
+			!!(sts & PCI_EXP_SLTSTA_DLLSC),
+			!!(sts & PCI_EXP_SLTSTA_PDC));
+
 	if (sts & PCI_EXP_SLTSTA_DLLSC) {
 		pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lsts);
 		added = !!(lsts & PCI_EXP_LNKSTA_DLLLA);
@@ -735,6 +773,7 @@ static irqreturn_t pnv_php_interrupt(int irq, void *data)
 
 		added = !!(presence == OPAL_PCI_SLOT_PRESENT);
 	} else {
+		pci_dbg(pdev, "PCI slot [%s]: Spurious IRQ?\n", php_slot->name);
 		return IRQ_NONE;
 	}
 
-- 
2.21.0

