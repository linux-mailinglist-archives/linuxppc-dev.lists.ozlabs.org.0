Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95819EF87
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 05:18:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wbN54sRwzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 13:18:29 +1000 (AEST)
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
 header.s=20161025 header.b=jzk+uOsP; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wb8B2tTGzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 13:08:10 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id v13so5903304pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 20:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhnTgCgFat/OgCQyjIca+hSXOqty4o3E9AcR9xSYxRA=;
 b=jzk+uOsPYYeijca9XBeDkx0ubJgUOrqxvFKVmQsc31DviuV3oqQtg521sqGDQg7mHW
 hKVkQFvr8dY/klsmQ7hYtY9OpIkCRfjN9M1fsqa5CRAB7yu2BLjY2Q8BlGFm1I7YksuN
 GGLUZ0SlqZZsXYLObQdW7mkOljK8xEbvyM/tuRIwSSkz1hrBx3tZLwnKwQpdB5sMFJX0
 zst8EO/zdl+GbuLcBCIv8CpGeQYZtrSQsNi8N5c1ixtUfuTEGLIa42w7FxepH1DCA9Gq
 8G1U5vDVyui9S+w9f+c4YPn8hYIaw8DKsZXN4YnCtheZpzPjLDlp4xeYk8NY5Rhp+cO6
 t08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rhnTgCgFat/OgCQyjIca+hSXOqty4o3E9AcR9xSYxRA=;
 b=kVIXBCcmws6Eo/6Y1mMgyz3Sy/pdmXh4ktzu42X3M2JU3gcorIL9d1HI8w9OcrOVTV
 vWVjIRpDPFHwuR1v3aP7lhXcfW0/lvpxflWBIJtJHorS3FREGdo1p3gmDnKcxf7u5OVN
 Uh9P5NJDVKNsh5kqiTof2PDsgKptySdsu9N59c8UpM6C3GyFs2kz8LOH3BIOAsYqh9jS
 hIjqszpFVkgCzsOodJ0yb5SwBeX6GHDrFtKo3oQtZvwYX2mXkk2XRHzqGw+kQycT5AH1
 A/bFbn3HTbXZD89xegM+A/0PVZOwRrDb2sQKMGzB1QCBSsJPRG74UXXKZOEDAJAk5PwF
 uWlg==
X-Gm-Message-State: AGi0PuYEqHFEdbsNypV7PjZZ2wL58ASy1FDyWBcPzYpG/P63reifBZyB
 zg+eEvX8rwMMLhA+U3Ru8DUplmpy
X-Google-Smtp-Source: APiQypIec6XMustNjt3SepLYl9lSa5g0Sw4ytFdKyD3rQfUwgC4fCuwksYzfO5HJHI5vSGhi7E3KjQ==
X-Received: by 2002:a17:902:b097:: with SMTP id
 p23mr18784731plr.195.1586142488357; 
 Sun, 05 Apr 2020 20:08:08 -0700 (PDT)
Received: from localhost.ibm.com ([220.240.58.168])
 by smtp.gmail.com with ESMTPSA id e187sm10196443pfe.143.2020.04.05.20.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 20:08:07 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] powerpc/powernv/pci: Delete old iommu recursive iommu
 setup
Date: Mon,  6 Apr 2020 13:07:43 +1000
Message-Id: <20200406030745.24595-6-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200406030745.24595-1-oohall@gmail.com>
References: <20200406030745.24595-1-oohall@gmail.com>
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
Cc: aik@ozlabs.ru, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No longer used.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 32 -----------------------
 1 file changed, 32 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 9198b7882b57..8b45b8e561e9 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1550,11 +1550,6 @@ void pnv_pci_sriov_disable(struct pci_dev *pdev)
 
 static void pnv_pci_ioda2_setup_dma_pe(struct pnv_phb *phb,
 				       struct pnv_ioda_pe *pe);
-#ifdef CONFIG_IOMMU_API
-static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
-		struct iommu_table_group *table_group, struct pci_bus *bus);
-
-#endif
 static void pnv_ioda_setup_vf_PE(struct pci_dev *pdev, u16 num_vfs)
 {
 	struct pci_bus        *bus;
@@ -2590,33 +2585,6 @@ static struct iommu_table_group_ops pnv_pci_ioda2_ops = {
 	.release_ownership = pnv_ioda2_release_ownership,
 };
 
-static void pnv_ioda_setup_bus_iommu_group_add_devices(struct pnv_ioda_pe *pe,
-		struct iommu_table_group *table_group,
-		struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		iommu_add_device(table_group, &dev->dev);
-
-		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
-			pnv_ioda_setup_bus_iommu_group_add_devices(pe,
-					table_group, dev->subordinate);
-	}
-}
-
-static void pnv_ioda_setup_bus_iommu_group(struct pnv_ioda_pe *pe,
-		struct iommu_table_group *table_group, struct pci_bus *bus)
-{
-
-	if (pe->flags & PNV_IODA_PE_DEV)
-		iommu_add_device(table_group, &pe->pdev->dev);
-
-	if ((pe->flags & (PNV_IODA_PE_BUS | PNV_IODA_PE_BUS_ALL)) || bus)
-		pnv_ioda_setup_bus_iommu_group_add_devices(pe, table_group,
-				bus);
-}
-
 static unsigned long pnv_ioda_parse_tce_sizes(struct pnv_phb *phb);
 
 static void pnv_pci_ioda_setup_iommu_api(void)
-- 
2.21.1

