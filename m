Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16421A66B4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N3RL47yhzDqjM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 20:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MLHhfcpq"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N2tj2BwTzDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 20:17:01 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id q21so5454160pfn.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vWF7Y9ZizAHSa3ZtOg2E2ccF/TTT1ikuIOmayF/x5Tc=;
 b=MLHhfcpqaOT/06d7q47z/2i6+pyv+xP3MQbnbEDRpCZl0NCJAaMvV0GlfDK1yNxs+L
 SEUjpQXrDmCGqJ/T+uZ6QsMrk4MHdSap9z01THqtpTqfLBXm0+wy39pG+u3/5DJ8Y0uO
 ztQbMvTh2ilyPojrKvbmPLuXdYzGTaHUDMfAgk3CZCh8AotLU91UnEXUdmY4NRRkod4i
 gxs6AeZSvGF5L4rjfHgwyCwlCngPa68StGTj9h7HJ+vuXNlz5VaQcrGnyE3yXDjB84Sb
 zA0KNk4dLZkMihFF0U70CIY7Q/bawQFGo1I9Px+afx/OFQ9U5DGPgsKtSSSNiSybduSP
 degw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vWF7Y9ZizAHSa3ZtOg2E2ccF/TTT1ikuIOmayF/x5Tc=;
 b=C0PfFNoOkfPcC0BaVgu1Dd3x0J2sstGJOuPS6NcSgSAW1AIt+pzJVTYLPo4MIDnxIL
 f5uv6p06YWEUCLjbd/L0pjwGIckghOahS/TxdHjpC5fLm7JcHN+bZqJy6xbQKNUs9O5Q
 L3aSqxQDVJ07daAaxCUM19R31wzYxMETuPgdWIIA+W5nSg3gOGcsjAp8sNCGixyPxr1G
 wpE+Irtn3NlqQUJaO6kVxHXP4ZbgXJFA5SEFIfguvDozZo5gdQ69ra1UoILwfeVRBrKo
 qjjM8kHliyktsK+12QYpiaAIbrf6bahpeBgWAh2J+XCT9iG7AZA/nfZ4J5n3aODepJLU
 PeMA==
X-Gm-Message-State: APjAAAWEE6DEj799av8dz2AUB8/xYu+6YzIWErHWrrHH68Ou+pHq9IE+
 UHeakMMYclwUkcGBZ0xaSP1ITDhr
X-Google-Smtp-Source: APXvYqzn+ao6enIwmcg6aNxJeoeZzJSc9n9rrzzPK5Ys06FWxqG8M3AvL86woBqXYTf+ElHeTGlafw==
X-Received: by 2002:a17:90a:ff08:: with SMTP id
 ce8mr7548182pjb.123.1567505818659; 
 Tue, 03 Sep 2019 03:16:58 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id e24sm19676701pgk.21.2019.09.03.03.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 03:16:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 10/14] pci-hotplug/pnv_php: Add attention indicator support
Date: Tue,  3 Sep 2019 20:16:01 +1000
Message-Id: <20190903101605.2890-11-oohall@gmail.com>
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

pnv_php is generally used with PCIe bridges which provide a native
interface for setting the attention and power indicator LEDs. Wire up
those interfaces even if firmware does not have support for them (yet...)

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 drivers/pci/hotplug/pnv_php.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
index 6fdf8b74cb0a..d7b2b47bc33e 100644
--- a/drivers/pci/hotplug/pnv_php.c
+++ b/drivers/pci/hotplug/pnv_php.c
@@ -419,9 +419,21 @@ static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
 static int pnv_php_set_attention_state(struct hotplug_slot *slot, u8 state)
 {
 	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
+	struct pci_dev *bridge = php_slot->pdev;
+	u16 new, mask;
 
-	/* FIXME: Make it real once firmware supports it */
 	php_slot->attention_state = state;
+	if (!bridge)
+		return 0;
+
+	mask = PCI_EXP_SLTCTL_AIC;
+
+	if (state)
+		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
+	else
+		new = PCI_EXP_SLTCTL_ATTN_IND_OFF;
+
+	pcie_capability_clear_and_set_word(bridge, PCI_EXP_SLTCTL, mask, new);
 
 	return 0;
 }
-- 
2.21.0

