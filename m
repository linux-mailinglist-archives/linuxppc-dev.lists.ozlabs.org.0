Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D207821AEC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 07:35:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B31wk0z6tzDrKj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 15:35:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pNsN0uDh; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B31g70bJLzDrJJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 15:24:02 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so4565619wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 22:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lXRkeeomSnzWlNhk3einnwRSg9A1CKmlCnbKBOgIgwM=;
 b=pNsN0uDhC+raq+la47g5VqHvkO3ld2f8gn4frtfqyVqkriD0Ay5xGgEbUFZ7aK7lN2
 2RQlXDClGyaMEVdHRXkeNks9fesfCM/8ibVNrPwneXhbuADNZ+nEPFFaKnGHvImCgbFF
 CmtlVgaj34CINHudfM1bzNU6BqVz6+uyJoTyFrg6pLHG+8xqp0wdsKHuZMYw0WQ8DnQG
 vreybVwzRVfNmOjA+quYxSKDdM1Ylwd7fZGymC/yUpMvMSOyy9LUDvlrl7VKdnRSVIdC
 lpk4tevMO3LvRPjfCdftMH28npwUuD53SIHudCM+wkHNgQxm8+GTOJkM2Tx4LAI6FpVt
 3OnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lXRkeeomSnzWlNhk3einnwRSg9A1CKmlCnbKBOgIgwM=;
 b=sb/QfXrd1jm4e/EV8IisxiE3Q4sTCmeGqzgvLXlpZYZDkoHnXOFRvl1ce86LmYT8bd
 OIv/AwlF1TZ08E8UVrA6kFQpet3YrJw2JEFDBcoLNPQ8BlKauxoyp1vwL3FurQpmpcFY
 7o7RE/YkJpVfajNhkE9/wbEcvEOi6euPVVq4dMxjpHiV8w/3tKDWvnKl93srRQUQ4Roe
 5Nho6A3uq+vzIDZSyWBWxDIFA5pJTRzv0dgI2ooFaAAHipQyNAEQ255LdwTdHAKDl3OR
 EY8Yo2oKg3ew5vqudix8vq/SSGEG1e+g33cwLXiYjfR5AAxGTDjt15nq72ESwssiZLUP
 BohQ==
X-Gm-Message-State: AOAM532HMwRttUohmnxxCLnU0Pbjk5/+THqfkcYJaQj25+Qblaj80MlA
 VrVMco5UqxJyDG9peVRHtZFThEwAan4=
X-Google-Smtp-Source: ABdhPJxrAvvWG4O+myh9rpk909e9iMpf5/aYTalAyL1vsIueL/AY23V2t7szzqLwDp4InjBPbG63Iw==
X-Received: by 2002:a05:6000:1283:: with SMTP id
 f3mr67157708wrx.106.1594358639288; 
 Thu, 09 Jul 2020 22:23:59 -0700 (PDT)
Received: from 192-168-1-18.tpgi.com.au ([220.240.245.68])
 by smtp.gmail.com with ESMTPSA id 92sm9090941wrr.96.2020.07.09.22.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 22:23:58 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/15] powerpc/powernv/pci: Always tear down DMA windows on PE
 release
Date: Fri, 10 Jul 2020 15:23:27 +1000
Message-Id: <20200710052340.737567-3-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200710052340.737567-1-oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
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

Currently we have these two functions:

	pnv_pci_ioda2_release_dma_pe(), and
	pnv_pci_ioda2_release_pe_dma()

The first is used when tearing down VF PEs and the other is used for normal
devices. There's very little difference between the two though. The latter
(non-VF) will skip a call to pnv_pci_ioda2_unset_window() unless
CONFIG_IOMMU_API=y is set. There's no real point in doing this so fold the
two together.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 30 +++--------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 687919db0347..bfb40607aa0e 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1422,26 +1422,7 @@ static int pnv_pci_vf_assign_m64(struct pci_dev *pdev, u16 num_vfs)
 	return -EBUSY;
 }
 
-static long pnv_pci_ioda2_unset_window(struct iommu_table_group *table_group,
-		int num);
-
-static void pnv_pci_ioda2_release_dma_pe(struct pci_dev *dev, struct pnv_ioda_pe *pe)
-{
-	struct iommu_table    *tbl;
-	int64_t               rc;
-
-	tbl = pe->table_group.tables[0];
-	rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
-	if (rc)
-		pe_warn(pe, "OPAL error %lld release DMA window\n", rc);
-
-	pnv_pci_ioda2_set_bypass(pe, false);
-	if (pe->table_group.group) {
-		iommu_group_put(pe->table_group.group);
-		BUG_ON(pe->table_group.group);
-	}
-	iommu_tce_table_put(tbl);
-}
+static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe);
 
 static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 {
@@ -1455,11 +1436,12 @@ static void pnv_ioda_release_vf_PE(struct pci_dev *pdev)
 	if (!pdev->is_physfn)
 		return;
 
+	/* FIXME: Use pnv_ioda_release_pe()? */
 	list_for_each_entry_safe(pe, pe_n, &phb->ioda.pe_list, list) {
 		if (pe->parent_dev != pdev)
 			continue;
 
-		pnv_pci_ioda2_release_dma_pe(pdev, pe);
+		pnv_pci_ioda2_release_pe_dma(pe);
 
 		/* Remove from list */
 		mutex_lock(&phb->ioda.pe_list_mutex);
@@ -2429,7 +2411,6 @@ static long pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe)
 	return 0;
 }
 
-#if defined(CONFIG_IOMMU_API) || defined(CONFIG_PCI_IOV)
 static long pnv_pci_ioda2_unset_window(struct iommu_table_group *table_group,
 		int num)
 {
@@ -2453,7 +2434,6 @@ static long pnv_pci_ioda2_unset_window(struct iommu_table_group *table_group,
 
 	return ret;
 }
-#endif
 
 #ifdef CONFIG_IOMMU_API
 unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
@@ -3334,18 +3314,14 @@ static void pnv_pci_ioda2_release_pe_dma(struct pnv_ioda_pe *pe)
 {
 	struct iommu_table *tbl = pe->table_group.tables[0];
 	unsigned int weight = pnv_pci_ioda_pe_dma_weight(pe);
-#ifdef CONFIG_IOMMU_API
 	int64_t rc;
-#endif
 
 	if (!weight)
 		return;
 
-#ifdef CONFIG_IOMMU_API
 	rc = pnv_pci_ioda2_unset_window(&pe->table_group, 0);
 	if (rc)
 		pe_warn(pe, "OPAL error %lld release DMA window\n", rc);
-#endif
 
 	pnv_pci_ioda2_set_bypass(pe, false);
 	if (pe->table_group.group) {
-- 
2.26.2

