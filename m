Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B61136807
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 08:14:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vDkT4PhJzDqZm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 18:14:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TBlBJMox; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vDSq3qYvzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 18:02:35 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id n59so592347pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 23:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+OWOR0BESbNSATGRkW92g1jpvinTsuW5Pz3F+qKkaU=;
 b=TBlBJMoxNPeVWBT8J7Fdq7qr1OShGi/B5lKOUvy2NAm74u71ZgOvteDrIIY/VBC/rz
 pBjN6Eulnzoo2dmzl0G/FJ9PxTdKJ1dXDvyJoud8VAmlnX2/bYxwiPk6myajnSTCi2JG
 kzgFPDb9HA8op/utLoFZdr9StdXUjOqkofUzWq1kojsxUDwe27Dng39bXiCRu+S0BsIU
 ByGAct0+EFyAuEV4kqb7lriefUBYMH9myKxrrlbHKIj8HK818xp6EnhXvCacAq0T2uH6
 3ywcjWS8aygbLA5D6NIMvcYmJclTUYi0QXfGWnw//16aFLAiasUob5HixNfKRZa9x+es
 c8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+OWOR0BESbNSATGRkW92g1jpvinTsuW5Pz3F+qKkaU=;
 b=RrmwjLaOB+2FAYZqh+hp49cyqK69c4gCed+/fEeV83uJW4nleByzdY6wWNc6OzlUEL
 BAeRc5rvM+4chu2eBFxE4rHMrb0Su3vtyO9wNUmnDnnYVYNooOTc+dl6jswOT+KIkAaC
 yAo/bDXKnpYrHr7LkT9Ox0JeiDTYo0vQc75glFevvNt5BaNwCuqrjXAleq9XwUV1IxWZ
 uDfUMOW1aRd9/TlWwNnBLkczyjCXdWMceC/Yc3mPpyBoFez+syKHTh82zEhucuexiWAI
 /VtxRRZuF0jVIymosHsiee2WgiLrd2fYFnVfeOL1panOoRThbN1hDGhj6xEQMufR8QdO
 bDaw==
X-Gm-Message-State: APjAAAWorziuF13TNERyqQmqSABoUhmTm/o8vysNEZnP9v9WYeVqzADp
 hxIxkD8vRuSB3KL+o2ok7jkZDgqa7UE=
X-Google-Smtp-Source: APXvYqy1//I+M4vMCXWwXxGggNyq8SXRinI6MTcEF3I8V7axJYSJEectoeh0DONokhZlMpuFeJ943g==
X-Received: by 2002:a17:902:7596:: with SMTP id
 j22mr2501521pll.335.1578639752609; 
 Thu, 09 Jan 2020 23:02:32 -0800 (PST)
Received: from localhost.localdomain (ohallo2.lnk.telstra.net.
 [110.142.13.149])
 by smtp.gmail.com with ESMTPSA id n26sm1309791pgd.46.2020.01.09.23.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 23:02:32 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powernv/pci: Move pnv_pci_dma_bus_setup() to pci-ioda.c
Date: Fri, 10 Jan 2020 18:02:07 +1100
Message-Id: <20200110070207.439-6-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200110070207.439-1-oohall@gmail.com>
References: <20200110070207.439-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is only used in pci-ioda.c so move it there and rename it to match.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 22 +++++++++++++++++++++-
 arch/powerpc/platforms/powernv/pci.c      | 20 --------------------
 arch/powerpc/platforms/powernv/pci.h      |  1 -
 3 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index e2a9440..4701621 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -3628,9 +3628,29 @@ static void pnv_pci_ioda_shutdown(struct pci_controller *hose)
 		       OPAL_ASSERT_RESET);
 }
 
+static void pnv_pci_ioda_dma_bus_setup(struct pci_bus *bus)
+{
+	struct pci_controller *hose = bus->sysdata;
+	struct pnv_phb *phb = hose->private_data;
+	struct pnv_ioda_pe *pe;
+
+	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
+		if (!(pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL)))
+			continue;
+
+		if (!pe->pbus)
+			continue;
+
+		if (bus->number == ((pe->rid >> 8) & 0xFF)) {
+			pe->pbus = bus;
+			break;
+		}
+	}
+}
+
 static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
 	.dma_dev_setup		= pnv_pci_ioda_dma_dev_setup,
-	.dma_bus_setup		= pnv_pci_dma_bus_setup,
+	.dma_bus_setup		= pnv_pci_ioda_dma_bus_setup,
 	.iommu_bypass_supported	= pnv_pci_ioda_iommu_bypass_supported,
 	.setup_msi_irqs		= pnv_setup_msi_irqs,
 	.teardown_msi_irqs	= pnv_teardown_msi_irqs,
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 31f1949..a17bc1a1 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -810,26 +810,6 @@ struct iommu_table *pnv_pci_table_alloc(int nid)
 	return tbl;
 }
 
-void pnv_pci_dma_bus_setup(struct pci_bus *bus)
-{
-	struct pci_controller *hose = bus->sysdata;
-	struct pnv_phb *phb = hose->private_data;
-	struct pnv_ioda_pe *pe;
-
-	list_for_each_entry(pe, &phb->ioda.pe_list, list) {
-		if (!(pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL)))
-			continue;
-
-		if (!pe->pbus)
-			continue;
-
-		if (bus->number == ((pe->rid >> 8) & 0xFF)) {
-			pe->pbus = bus;
-			break;
-		}
-	}
-}
-
 struct device_node *pnv_pci_get_phb_node(struct pci_dev *dev)
 {
 	struct pci_controller *hose = pci_bus_to_host(dev->bus);
diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
index 0cdc9ba..d3bbdea 100644
--- a/arch/powerpc/platforms/powernv/pci.h
+++ b/arch/powerpc/platforms/powernv/pci.h
@@ -188,7 +188,6 @@ extern void pnv_npu2_map_lpar(struct pnv_ioda_pe *gpe, unsigned long msr);
 extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
 extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
 
-extern void pnv_pci_dma_bus_setup(struct pci_bus *bus);
 extern int pnv_setup_msi_irqs(struct pci_dev *pdev, int nvec, int type);
 extern void pnv_teardown_msi_irqs(struct pci_dev *pdev);
 extern struct pnv_ioda_pe *pnv_ioda_get_pe(struct pci_dev *dev);
-- 
2.9.5

