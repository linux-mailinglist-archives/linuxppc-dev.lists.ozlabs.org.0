Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA51206CAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:37:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sD3k75hxzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bXgvbwzE; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sCmf1ym7zDqVH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 16:24:49 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id g13so846487qtv.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IeFAcmlPcFBcL391CclzBcYNZ0kQLKelbZVf7iyXvbQ=;
 b=bXgvbwzErNnmUR/gkVDFaUZUc5XjS262NZ0VGDMNQ+SbagcfH8Ax4pUrOVqJrrk8qf
 a36EPVt0pmNbcxo0TVbFBFj65HbbQOwA9towtA4H99YYcwAk/q2cO39sN4L/ZjB6Vo++
 hpkA1AK+yaRjFmMCe6i7JqBLDsyygG1EDhYv37rS8vUP5cnE+PD7y6HRC3wy0vBmkozb
 1iZYlHPtMBCni9V841A0MefnIEXWWhB+8bKO+T9yX4OEUspOpNdF3uGes1kIPF/etmvs
 s85IQB04JVaN16wOeHsQ7jB7XYW90NAHGfhu/3q/PVVLLX3gvTgOHC/xoTCxB1G9MAG8
 DSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IeFAcmlPcFBcL391CclzBcYNZ0kQLKelbZVf7iyXvbQ=;
 b=RfCsmyrZJvovsXm38/kd9jQk5rMZKbYmeiAnYoIKpNtcSOFkZdnNpu3u0noakpaB1I
 nSX67ikR/PCmJQtYGP4SJy0FBN5zaKZbj9TvxcKrcvbFxprRBbtC5Ir47JnEsDWA49Rm
 IDIJmyVx68XAoGrySBLDF00bef5Bd2uE6JAwJPxCf1opkDnlWsAAGArcKFX4y86cPq62
 C3oN9cp3zM2Q22k6RiMn1C+rHqH2ycM0YODHvhllcVKExACRrKlefw+31dgYi59V8nBW
 4v60LeTGYvsiMJm04WC9JA1aAMQrVfjjVBxt9QvZ95EJIl3G6lulE7lqNzbDvHbq/o3J
 oy9Q==
X-Gm-Message-State: AOAM530FzzlXADgfXpOST/jKCwM250peaQBhLMRWcRlWP9+ylbHnbmaC
 TEBC6+Yo8ShUNAkxt1wetlg=
X-Google-Smtp-Source: ABdhPJzx2OQdVTNaGxL2nQJh7sRK2WoX08r1vEI6T415SLqFmTjUWi/FkyUAeMt1OIxexMFzviiSxA==
X-Received: by 2002:ac8:33f8:: with SMTP id d53mr24168464qtb.80.1592979885652; 
 Tue, 23 Jun 2020 23:24:45 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-148-1.dynamic.desktop.com.br.
 [179.125.148.1])
 by smtp.gmail.com with ESMTPSA id n2sm2489727qtp.45.2020.06.23.23.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 23:24:45 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>
Subject: [PATCH v2 6/6] powerpc/pseries/iommu: Avoid errors when DDW starts at
 0x00
Date: Wed, 24 Jun 2020 03:24:11 -0300
Message-Id: <20200624062411.367796-7-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200624062411.367796-1-leobras.c@gmail.com>
References: <20200624062411.367796-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of today, enable_ddw() will return a non-null DMA address if the
created DDW maps the whole partition. If the address is valid,
iommu_bypass_supported_pSeriesLP() will consider iommu bypass enabled.

This can cause some trouble if the DDW happens to start at 0x00.

Instead if checking if the address is non-null, check directly if
the DDW maps the whole partition, so it can bypass iommu.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 2d217cda4075..967634a379b0 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1078,7 +1078,8 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
  *
  * returns the dma offset for use by the direct mapped DMA code.
  */
-static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
+static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn,
+		      bool *maps_partition)
 {
 	int len, ret;
 	struct ddw_query_response query;
@@ -1237,9 +1238,9 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	/* Only returns the dma_addr if DDW maps the whole partition */
 	if (len == order_base_2(max_addr))
-		dma_addr = be64_to_cpu(ddwprop->dma_base);
+		*maps_partition = true;
+	dma_addr = be64_to_cpu(ddwprop->dma_base);
 	goto out_unlock;
 
 out_free_window:
@@ -1324,6 +1325,7 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 {
 	struct device_node *dn = pci_device_to_OF_node(pdev), *pdn;
 	const __be32 *dma_window = NULL;
+	bool ret = false;
 
 	/* only attempt to use a new window if 64-bit DMA is requested */
 	if (dma_mask < DMA_BIT_MASK(64))
@@ -1344,13 +1346,10 @@ static bool iommu_bypass_supported_pSeriesLP(struct pci_dev *pdev, u64 dma_mask)
 			break;
 	}
 
-	if (pdn && PCI_DN(pdn)) {
-		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn);
-		if (pdev->dev.archdata.dma_offset)
-			return true;
-	}
+	if (pdn && PCI_DN(pdn))
+		pdev->dev.archdata.dma_offset = enable_ddw(pdev, pdn, &ret);
 
-	return false;
+	return ret;
 }
 
 static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
-- 
2.25.4

