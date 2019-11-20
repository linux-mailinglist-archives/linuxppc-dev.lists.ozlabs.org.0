Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8510318B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 03:27:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HmnC5gJjzDqdl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 13:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WUbNOyse"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HlW3296dzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 12:30:23 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id e17so5110903pgd.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 17:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7/w0bF46rDbcv+/KKwGIp00Kx5AnDzDOMctZ4QU+cs=;
 b=WUbNOyseqEvkNtKlAdaZ+HucsuOWT12eYZ0rDrmeT2M2ntysWhPOEiky9EBGLWMy2+
 giIc00hrtfropX+Fea6qd8w7ZAFK+U9oLZ7XBbxQuej+8I6V0mtYgvaKIrRL6O3TZ5XJ
 CFEXhToQrjub27pmz8Th+6YLaslm8acG5F6/izkwUv8SY66DY4sbdc2Xd2F4k6T2gmb3
 b7H5L4ljkTQYSwaNuG4xUUkpuuYM2Ovl9MvBMzvbfjfBQXTT58q1VXdVx7eLhcrFX8SW
 RZhyyHza67FgoKm7u+lK8oW/r4bN+F8KnsXu12Y4VDQFjpOhMLM+5CnEn3/nYl5weFFC
 wVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7/w0bF46rDbcv+/KKwGIp00Kx5AnDzDOMctZ4QU+cs=;
 b=oU0JxOC2vZrby1nfUgxxG/tODbICQzYJPv7C/CQdFTy3j4Zr1AD/CZf8Xyft7OeGwd
 LvdKqPY8vl7YWfOnFiDtF+Py2ysJS7arxsO1sGkYZNyi1mZXDj901Tw+0iPDBs1bxgoq
 lgT2Ue/geDAKuEpEKYO/9alOzlNCPgEmw24TDK4iJNT34LMAHnx53YvF+Umf97g8pGUL
 76Qje3mRuSv6ceq1PU6LKNbaXwTvaDYFEOfqa++iQVpHoQYZ3KiGW/tN/ZZkaAlBcVcy
 ifaGVJdwvDHENS5SBNhZURMkWJ2LWtg1leQ/uP8BlAKZLTy2fEeUZKhEsaDFZFsVK/Wm
 lThg==
X-Gm-Message-State: APjAAAXGjtrEl5cihy4EIoM/JxQH9bR6KbHOWMxda91wjveK96zrzN3j
 1tTK9dXkAWisJNvL7qVQXT8CHRuO
X-Google-Smtp-Source: APXvYqyo8El8QGSWfBwvspwIv9i8LBXSgUkG0Z1NPWmsMmMEEDrjhPeHCymwV1mPyPMoB9yueYMNGg==
X-Received: by 2002:a63:8249:: with SMTP id w70mr205270pgd.54.1574213420587;
 Tue, 19 Nov 2019 17:30:20 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b24sm26662116pfi.148.2019.11.19.17.30.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 17:30:20 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [Very RFC 29/46] powernv/pci: Remove open-coded PE lookup in PELT-V
 setup
Date: Wed, 20 Nov 2019 12:28:42 +1100
Message-Id: <20191120012859.23300-30-oohall@gmail.com>
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

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 32 +++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 1c90feed233d..5bd7c1b058da 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -760,6 +760,11 @@ static int pnv_ioda_set_peltv(struct pnv_phb *phb,
 		}
 	}
 
+	/*
+	 * Walk the bridges up to the root. Along the way mark this PE as
+	 * downstream of the bridge PE(s) so that errors upstream errors
+	 * also cause this PE to be frozen.
+	 */
 	if (pe->flags & (PNV_IODA_PE_BUS_ALL | PNV_IODA_PE_BUS))
 		pdev = pe->pbus->self;
 	else if (pe->flags & PNV_IODA_PE_DEV)
@@ -768,16 +773,27 @@ static int pnv_ioda_set_peltv(struct pnv_phb *phb,
 	else if (pe->flags & PNV_IODA_PE_VF)
 		pdev = pe->parent_dev;
 #endif /* CONFIG_PCI_IOV */
+
 	while (pdev) {
-		struct pci_dn *pdn = pci_get_pdn(pdev);
-		struct pnv_ioda_pe *parent;
+		struct pnv_ioda_pe *parent = pnv_ioda_get_pe(pdev);
 
-		if (pdn && pdn->pe_number != IODA_INVALID_PE) {
-			parent = &phb->ioda.pe_array[pdn->pe_number];
-			ret = pnv_ioda_set_one_peltv(phb, parent, pe, is_add);
-			if (ret)
-				return ret;
-		}
+		/*
+		 * FIXME: This is called from pcibios_setup_bridge(), which is called
+		 * from the bottom (leaf) bridge to the root. This means that this
+		 * doesn't actually setup the PELT-V entries since the PEs for
+		 * the bridges above assigned after this is run for the leaf.
+		 *
+		 * FIXMEFIXME: might not be true since moving PE configuration
+		 * into pcibios_bus_add_device().
+		 */
+		if (!parent)
+			break;
+
+		WARN_ON(!parent || parent->pe_number == IODA_INVALID_PE);
+
+		ret = pnv_ioda_set_one_peltv(phb, parent, pe, is_add);
+		if (ret)
+			return ret;
 
 		pdev = pdev->bus->self;
 	}
-- 
2.21.0

