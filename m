Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4192D214CD0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 15:44:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B090m34wKzDqCY
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Jul 2020 23:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FOJyYqI9; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B08qQ4L0TzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Jul 2020 23:36:17 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id g75so36365984wme.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jul 2020 06:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G/HK8/erG9I4rq5yhhbSUFv8OZkG+FjMTH+w9fqHGVc=;
 b=FOJyYqI9J3PVYxpWrk0tff1/Q8zIl0DYIKzLmfY+ovjhf/mf1BsjIs1EbQjesjzmrZ
 EI7BCbrRRMrZRXDFtD+KLJp9CF8E5fYNem5OZYTHZpNeZtO8j8uG5A2DA+9BggPjMfoW
 fuLjGRNSt0IM+1G19z/IX4XVu3zQ8hN6e7I09WDm8MfvZELbYrOkd40XC7Hfit2zrtFC
 /epdbzeeVo4mGdyIZ1vacJDUR2GT57AVjprL2WE8hzVFMuJLhZ45W3ft23vB0fQFgBu3
 ulqD2IhnyEtLISASYaYKeyHviTieSK3an9uyppLkqfGwKdQhE11x1oAQwMtPcQFQCDV2
 keGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G/HK8/erG9I4rq5yhhbSUFv8OZkG+FjMTH+w9fqHGVc=;
 b=YvViG63LNwGnWx/wFp/50l0DvqTNZAZWJ1mQ7MpKJS0Sk6n7ArefoFROkdtrOvmfnt
 +RYXNvx2TBuzUSD+WCwBKzMRSsUTb+DL5mnZ1/C6C2EZwNXqQfJLMGIrYlBbEidtQYxN
 gxny2MBHQ2ChDHjXF1PyOpIJOCh/7kFKypO35pz0MGV5oOdBRM5MLF13UraYU4StJxOw
 xCq6Qv4neTmKVI+Nm6zs/TUf7I78AKid6dER6toGFXNicbPIOsz2ZTgm8nWW+5BGdt49
 sx/+czIHna5kkiXa9vxa9W+Ub2NxTvJSqIju58F6FFjS1uh1HXfVtGqBkYCJ7k+t+QKr
 RDBg==
X-Gm-Message-State: AOAM530azv2eHQJg3wn6Ka72Y84MJyp7Ej61FKZNQqgr20CvrQGf72dW
 vNthJ2TVHy/jYQXHVvpqPs2Xn/r/GfU=
X-Google-Smtp-Source: ABdhPJzdG4VDY0oEx3wgJUF69lWNFLJQBe1eH/ODWIJnMiaR0Ff7IPE6DV4iKYlS7DEylBbjcS2wmw==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr2837267wmj.73.1593956172950;
 Sun, 05 Jul 2020 06:36:12 -0700 (PDT)
Received: from localhost.ibm.com ([202.168.17.49])
 by smtp.gmail.com with ESMTPSA id m9sm19457903wml.45.2020.07.05.06.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jul 2020 06:36:12 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/powernv: Move pnv_ioda_setup_bus_dma under
 CONFIG_IOMMU_API
Date: Sun,  5 Jul 2020 23:35:57 +1000
Message-Id: <20200705133557.443607-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200705133557.443607-1-oohall@gmail.com>
References: <20200705133557.443607-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pnv_ioda_setup_bus_dma() is only used when a passed through PE is
returned to the host. If the kernel is built without IOMMU support
this is dead code. Move it under the #ifdef with the rest of the
IOMMU API support.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index c2d46d28114b..31c3e6d58c41 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1885,19 +1885,6 @@ static bool pnv_pci_ioda_iommu_bypass_supported(struct pci_dev *pdev,
 	return false;
 }
 
-static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
-{
-	struct pci_dev *dev;
-
-	list_for_each_entry(dev, &bus->devices, bus_list) {
-		set_iommu_table_base(&dev->dev, pe->table_group.tables[0]);
-		dev->dev.archdata.dma_offset = pe->tce_bypass_base;
-
-		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
-			pnv_ioda_setup_bus_dma(pe, dev->subordinate);
-	}
-}
-
 static inline __be64 __iomem *pnv_ioda_get_inval_reg(struct pnv_phb *phb,
 						     bool real_mode)
 {
@@ -2547,6 +2534,19 @@ static long pnv_pci_ioda2_create_table_userspace(
 	return ret;
 }
 
+static void pnv_ioda_setup_bus_dma(struct pnv_ioda_pe *pe, struct pci_bus *bus)
+{
+	struct pci_dev *dev;
+
+	list_for_each_entry(dev, &bus->devices, bus_list) {
+		set_iommu_table_base(&dev->dev, pe->table_group.tables[0]);
+		dev->dev.archdata.dma_offset = pe->tce_bypass_base;
+
+		if ((pe->flags & PNV_IODA_PE_BUS_ALL) && dev->subordinate)
+			pnv_ioda_setup_bus_dma(pe, dev->subordinate);
+	}
+}
+
 static void pnv_ioda2_take_ownership(struct iommu_table_group *table_group)
 {
 	struct pnv_ioda_pe *pe = container_of(table_group, struct pnv_ioda_pe,
-- 
2.26.2

