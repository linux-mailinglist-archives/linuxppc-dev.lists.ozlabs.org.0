Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22310315C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:02:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmCn53PNzDqVb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YjLYXelV"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlVS0nrJzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:29:52 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id e3so12983176plt.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Qgd3iBwjQ5b1xC0272zPH1Z5gSBUqzpnZ8DX/S2A8Y=;
 b=YjLYXelV7ueRm47J+6++KatuUyWMg9uCfWnHYKiyV0sIrHVhhivZSNtAQq6JbKy41U
 vFcuXbziO3JVDQymvnToRhFTCzO7iqGNXJ9FFSO1Kaosnx9tSR6sYPHviMApfwD0zuFX
 c2UIRXzrA2o1sfY2ECwxNJ/yYyMpDiQPffq4vzQBA06kFUVy4euL1lMXGMREfqOU5S5O
 F5ohMaUv1ecPe0snsljobtZg4TUMc7T/gH3NCT9UP/BRrskF0A8oKI6RNZahr8NavrZo
 y06lAS6WBD2Dz+Txb+Pej+vQVB5Ez8hJHeJ5F0LP80UppyJVy+baG/05953Xi1VaJZt6
 VvTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Qgd3iBwjQ5b1xC0272zPH1Z5gSBUqzpnZ8DX/S2A8Y=;
 b=tCa1PZK+LXQHXpyHjn2XB/2/Uf71A/CIvdsbiLQi2EwGwxGZHSUzmeGTEN3ZC9m4WW
 Lxf21302GKLPvxm4fdVQYBu0iBfDrHp5zqclWaQyxa0Az77lTEXQyyKhiIGEj0VohXI7
 vFpHO26g2jCB1nYNajRN8VKHTGT4wykrZkvPQDxt8bl8mcLodUTfB/AFBSBEcoBt3jeC
 kTGDsPXgjVThm6/IB6D/XMveTQqfiuv6PKcXmC/GhhbzGVm7dh2o54r2b5jF8Obyghf3
 aWvHbsW6gHRNAbTpu1aqsptT0Zsi/qEZUmrEgmE8tDnthkCFt2kHcMl4ZMyVjbnZ6f5o
 Idkw==
X-Gm-Message-State: APjAAAVEG0Bhd22YJsDdEfFZHKYeWVfVe0PRZGPEox4pOe0qkJDyMfU1
 ArNJkeFLiYLlqO0bCLjU+3mXXJtg
X-Google-Smtp-Source: APXvYqzNpkBb0PKn9Y2rISTzJMrPyni9GZwviYmamWYrGAR38yKjacOKKQs/1LuKe31U4TVyBy3pSw==
X-Received: by 2002:a17:90b:281:: with SMTP id az1mr685192pjb.27.1574213390202; 
 Tue, 19 Nov 2019 17:29:50 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:29:49 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 16/46] powernv/eeh: Use eeh_edev_warn() rather than
 open-coding a BDFN print
Date: Wed, 20 Nov 2019 12:28:29 +1100
Message-Id: <20191120012859.23300-17-oohall@gmail.com>
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

Neaten things up a bit and remove a pci_dn use.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/eeh-powernv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index aaccb3768393..f58fe6bda46e 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -1001,10 +1001,8 @@ static void pnv_eeh_wait_for_pending(struct eeh_dev *edev, const char *type,
 		msleep((1 << i) * 100);
 	}
 
-	pr_warn("%s: Pending transaction while issuing %sFLR to %04x:%02x:%02x.%01x\n",
-		__func__, type,
-		pdn->phb->global_number, pdn->busno,
-		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
+	eeh_edev_warn(edev, "%s: Pending transaction while issuing %sFLR\n",
+		__func__, type);
 }
 
 static int pnv_eeh_do_flr(struct eeh_dev *edev, int option)
-- 
2.21.0

