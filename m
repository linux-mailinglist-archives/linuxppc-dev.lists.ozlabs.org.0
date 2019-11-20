Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D363A1031BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:46:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HnBH0phrzDqfY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fdqRRbTj"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlWT4v0zzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:45 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id z188so12497889pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2W/QR/Smo6jQ4F9EcWrKCs3+mqduBVzkzvnyfsxrQ0=;
 b=fdqRRbTj8f+8legWESR8F0B1rb/cSFCI6nYwrxDis19I+Th+xPEQEL3+UPvQRdOdNu
 P8v6iTqv19sj+XcvTVEZhIuqH1pDgxyFQGlYddJ7mLsswcDEceAnTYwf75Md/ShGF3zU
 Fsh9I/m1skmLzrl7A5fR4qUiBekN6WyaktttyBJToUgk/hFdmRZh01m+4AwqubNHhp1T
 WgULk+wM4h1rWl6zKI31AmBxXspBw6kKROuJ8GwJpah3bVgZvk5mrza4J/OJXGMC5ZAN
 dStKhNHgW8FIYQ9RUe4eG5+uhhO9opXTKn9uL/7Dgo+IrDxCpdfSt4/jJIX4TuK3Q990
 fVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2W/QR/Smo6jQ4F9EcWrKCs3+mqduBVzkzvnyfsxrQ0=;
 b=FlzqsYyUWpHqzocfYA1eVp8L4bueGD9CDQu2U3KIR38MfVsIzYraVddGnJo8ENUpEB
 2wvKccHTei3xFI9I6lbaDu4f7mzi/Twx8g8qUHmgPAfnm+sQE3tEeqYR6lu4uHmfgYo/
 5B3XFxJetG9EpzMoM1XGs1OLiS7MEhvVG66xKd8dBZVocIp0GzrUM/iBrYgZfcgLcnJK
 vHNRJuZhSlNuPbKlz14T604lcwXnTS7QiiloK6PMkOdQjhNi/KGFWYBMMIInSZ0njhqL
 GwmMiBQOkSpTmGQLFaALtffUJw+pNlqYdPF7OeElgLB1lKKvZUC7boFD7bWc52GMuSSl
 ZISw==
X-Gm-Message-State: APjAAAV4dT3wokZABOjnj09gY+dFOEDSY1EV2Qx9I/DIBhncgyLGuusG
 v6nIwvNUIM9nkZKozDf9Aa9H/Yvx
X-Google-Smtp-Source: APXvYqzolYufg6Sxkix+XFCr5JDADxr/69Hf3NB1hn8oC3B1LEv6Bas/eWXot/i+EH04fYATM5ap7w==
X-Received: by 2002:a62:1841:: with SMTP id 62mr755427pfy.108.1574213442598;
 Tue, 19 Nov 2019 17:30:42 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:42 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 38/46] powerpc/pci-hotplug: Scan the whole bus when using
 PCI_PROBE_NORMAL
Date: Wed, 20 Nov 2019 12:28:51 +1100
Message-Id: <20191120012859.23300-39-oohall@gmail.com>
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

Currently when using the normal (i.e not building pci_dev's from the DT
node) probe method we only scan the devfn corresponding to the first child
of the bridge's DT node. This doesn't make much sense to me, but it seems
to have worked so far. At a guess it seems to work because in a PCIe
environment the first downstream child will be at devfn 00.0.

In any case it's completely broken when no pci_dn is available. Remove
the PCI_DN checking and scan each of the device number that might be on
the downstream bus.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
I'm not sure we should be using pci_scan_slot() directly here. Maybe
there's some insane legacy reason for it.
---
 arch/powerpc/kernel/pci-hotplug.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
index d6a67f814983..85299c769768 100644
--- a/arch/powerpc/kernel/pci-hotplug.c
+++ b/arch/powerpc/kernel/pci-hotplug.c
@@ -123,17 +123,10 @@ void pci_hp_add_devices(struct pci_bus *bus)
 	if (mode == PCI_PROBE_DEVTREE) {
 		/* use ofdt-based probe */
 		of_rescan_bus(dn, bus);
-	} else if (mode == PCI_PROBE_NORMAL &&
-		   dn->child && PCI_DN(dn->child)) {
-		/*
-		 * Use legacy probe. In the partial hotplug case, we
-		 * probably have grandchildren devices unplugged. So
-		 * we don't check the return value from pci_scan_slot() in
-		 * order for fully rescan all the way down to pick them up.
-		 * They can have been removed during partial hotplug.
-		 */
-		slotno = PCI_SLOT(PCI_DN(dn->child)->devfn);
-		pci_scan_slot(bus, PCI_DEVFN(slotno, 0));
+	} else if (mode == PCI_PROBE_NORMAL) {
+		for (slotno = 0; slotno < 255; slotno += 8)
+			pci_scan_slot(bus, slotno);
+
 		max = bus->busn_res.start;
 		/*
 		 * Scan bridges that are already configured. We don't touch
-- 
2.21.0

