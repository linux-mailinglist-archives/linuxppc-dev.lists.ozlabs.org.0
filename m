Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEADD22917E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:02:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRHR2sB6zDqWt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZvtHHsdG; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBR9W5Fv7zDqvP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:57:35 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id m16so484025pls.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 23:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ErldX1NwviUCI0Ulhy3AQukqvvEFapOXU0i3IsVVs6w=;
 b=ZvtHHsdG6OSkQWPE3i6+x2l7GnD+I1JEilUdOG+vD8oPfLY6DIRaZBUkyE8vWw3grS
 /iILjwJJqP7zm7LjLgRZGMgtahqrk+3kaJWcoSGexSLf0nbQgdZfR2RZwMVa1SkMks5f
 86c6pW/HJeWjVZ+XvmaD8/SyjVSf+sCg9pYwU79CTK7kFxhEaIM4Hve+Q99KFDiq69n/
 tvYetzcqVhRD0nEf7+oG9HmvukoqVymqLFjLSo1dg4CSWSKeD7tVVHzNa8vhlQjm2jCJ
 35vJIVlk/0Ixg2qHoliaaauOsEmK0/bJVmvblbHO/cnTUieWSiMc78C5reLA4lGMX6V4
 0hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ErldX1NwviUCI0Ulhy3AQukqvvEFapOXU0i3IsVVs6w=;
 b=rLg+GNEyfCc4YYp7U3+Y4908KyR/31HF48dXjKBYWuSTclLzzE+lpZJz96sDSsjcPC
 bacGxBucqM/J6LMzu/SyhGSMEqSxIjtssjg5o0whIgckXEQMzmXOTR72U7hVD7Ca3Oc+
 AA9QNWgSBWsolzC76t7QWDS1rkZEcBEvXLLY8D4utqf/FrE4Qh17ppjwy9RBT1XQ9Dgd
 CT4/trYgMEGFEWrNyQhVyupm4Vx8dUSlH3FtAc2KKjaeEkZ8iK2rt2RnKInyaFuy5dai
 kdbI7QA9eYv6fqaAmESgjYShlUMpKnnI/mULflWYYkzmyrBIJpScbf/v7q6Y7bxsyrd8
 XlXw==
X-Gm-Message-State: AOAM5322AQRKflMsSCmYZ/UNj3h+T9nAD3MmDhQwD8POg/zB+80BrFOF
 f/L+RHsdO0CySBn5+Aaa/7bJa7raFLU=
X-Google-Smtp-Source: ABdhPJz/LT6cbxuEeLe+ixYAAzz9SvU+TFUyj8y5OBqyUGEN/C8CnvNfZJSy4d1kScz8LFYqQR3GHQ==
X-Received: by 2002:a17:90a:a106:: with SMTP id
 s6mr8513856pjp.53.1595401049805; 
 Tue, 21 Jul 2020 23:57:29 -0700 (PDT)
Received: from localhost.ibm.com (203-219-159-24.tpgi.com.au. [203.219.159.24])
 by smtp.gmail.com with ESMTPSA id c14sm22645104pfj.82.2020.07.21.23.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:57:29 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/16] powerpc/powernv/pci: Always tear down DMA windows on
 PE release
Date: Wed, 22 Jul 2020 16:57:01 +1000
Message-Id: <20200722065715.1432738-2-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200722065715.1432738-1-oohall@gmail.com>
References: <20200722065715.1432738-1-oohall@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
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
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
v2: no change
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

