Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F241F8B59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 01:35:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lW6Z57gfzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 09:35:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--gthelen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=31rpmxgckdnu7k85c5e7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--gthelen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=LMhTh5pw; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lW4d5DZdzDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 09:33:46 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id n8so12644977qtk.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jun 2020 16:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=M2MXt5Il/BsNFktk3okT7g4F0dfmoWdEqcRIPAnRbcE=;
 b=LMhTh5pw/U9JHefpcHbqjU28o+dW5UwGRfLxdZj6h3yircs/tFdPEwuAoVMPym+D2H
 2nVqctN8LfoUOBk5YighPEV/mCNAC/m1YboG1mSI/PygF7GX0KUSlKJZXLr7d5Tx3yvg
 rPniKBWfxAa1MuqfBiLu0AOyIGV43+aLyM7wlNDJxTUtDoIkWQrIYz0K0CD+3ow7LZKx
 ks66+s3dqpIfp8aQCS6H65e7HRt1TqTPDkCz/fqCYsiVgND1dwI88KpYeeUMtEx3pJ0m
 o8PimNT5CPRZ+qmIpnUfpSd5RG9yRGgZxYxUaZlPQEL0FXkeR3v/oexeUJ1GF1dJMCFQ
 90Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=M2MXt5Il/BsNFktk3okT7g4F0dfmoWdEqcRIPAnRbcE=;
 b=eyuaMVOD7q7IPdbZnfgWZgn9HU8csk+yAHgCodWJnVq9DPM5kyNMsD953aa6bQIf7p
 ghPdPuDHFCwoP9za8acLN3+llPfttI6Q9sSgtCRS6pOcb6anUaQ8T9d+IH0rx2O0hO6g
 rAdU8808lssfXbfmjPJDvCDVnaL+zJBOi5sHcweq9eVuDQQFsDYGOJSwNpwj/DzpCpSO
 HFlhnywVtFvPdAAaMFBazK84pUQHTotSOyy/69Ta6umCdN7ETnnXffwJXKhzVrBgKX2p
 nn+t8Dz5+uqdqj4WriDD0Fqt7jmkbwqL/a6/3z+Vk0f7ROdincLIMw8bUbwKBD4qPQ3f
 LRYw==
X-Gm-Message-State: AOAM531XD0BOOLi6tSwICs/aa9HH2PcbPD2iDo9gn2/fZstzCBfQNZUp
 +43H/InMtxolDz1Je2B/4t+i4ghAiQFb
X-Google-Smtp-Source: ABdhPJwcegGqbyBBA1s0w1TiQ5GxpX+dkThjZc32fm5s8iotpcYRgj8qDbwc/HlMdycgbTnpx3KF/RxHIkCj
X-Received: by 2002:a0c:ee41:: with SMTP id m1mr21625569qvs.95.1592177622244; 
 Sun, 14 Jun 2020 16:33:42 -0700 (PDT)
Date: Sun, 14 Jun 2020 16:32:35 -0700
In-Reply-To: <37af499e-2b8b-7e78-ed4b-0aaf711fcb38@csgroup.eu>
Message-Id: <20200614233235.121432-1-gthelen@google.com>
Mime-Version: 1.0
References: <37af499e-2b8b-7e78-ed4b-0aaf711fcb38@csgroup.eu>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v2] powerpc/powernv/pci: use ifdef to avoid dead code
From: Greg Thelen <gthelen@google.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, "Oliver O'Halloran" <oohall@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Greg Thelen <gthelen@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE
configuration") removed a couple pnv_ioda_setup_bus_dma() calls.  The
only remaining calls are behind CONFIG_IOMMU_API.  Thus builds without
CONFIG_IOMMU_API see:
  arch/powerpc/platforms/powernv/pci-ioda.c:1888:13: error: 'pnv_ioda_setup_bus_dma' defined but not used

Move pnv_ioda_setup_bus_dma() under CONFIG_IOMMU_API to avoid dead code.

Fixes: dc3d8f85bb57 ("powerpc/powernv/pci: Re-work bus PE configuration")
Signed-off-by: Greg Thelen <gthelen@google.com>
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 73a63efcf855..743d840712da 100644
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
@@ -2501,6 +2488,19 @@ static long pnv_pci_ioda2_unset_window(struct iommu_table_group *table_group,
 #endif
 
 #ifdef CONFIG_IOMMU_API
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
 unsigned long pnv_pci_ioda2_get_table_size(__u32 page_shift,
 		__u64 window_size, __u32 levels)
 {
-- 
2.27.0.290.gba653c62da-goog

