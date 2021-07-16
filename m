Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F803CB43C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 10:31:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR4Fh4Dh7z3dXj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 18:31:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F47I+pSI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::730;
 helo=mail-qk1-x730.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F47I+pSI; dkim-atps=neutral
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR4BP3bmwz304V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 18:28:13 +1000 (AEST)
Received: by mail-qk1-x730.google.com with SMTP id z9so7942948qkg.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q3MWaBkJkI/LG2CLm3+hKfTqsS47m2bSDcUOtnrjbLU=;
 b=F47I+pSI8DPqJpIrY1ea+ThigQs9fPTsgceq3/noNS7ww11cf4ut6aklzmgpZo9qPz
 b2e9ygfrkt1rW4G6uJ9c4dJe0RTrLdhQfIIjadgJ8M3EiL9E/aynfgHmxJww2iYOC/3e
 qu7F2kqxCDf1S+qYvsw2lmqWs7h1lPPLy0DWPr9f1c7hoV56qaMEriVQLYWArSpzwWY+
 oB8iyp19J+mNjg3D+XLNASXLdhBkS06CvUS4Hd5GDbcZGNAZrFzH5HPO1kTgDO9h2dFr
 MVtJfU5pER8jwUfrn0lHCOzdqF0/3WIW8wSnKL/U2U5ktl/PTIaKlI5sVSs4XX1EwB/S
 xWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3MWaBkJkI/LG2CLm3+hKfTqsS47m2bSDcUOtnrjbLU=;
 b=ieitiliaWsGbNDE4HtoPHEsXqN1XmlCfgPqUZHcUmzjzyT3qNZvKRp0qAM6634rhGO
 fqXnCsZb9MHR1Stn5JLS3pY0LIEkbFy4wpYHlsHGtGuIa+slJl6IThCSv7khSOl9t9DA
 YTwE5/ZpzfpJQiw2/dAgBSuNgnMnrebKrKgrqc0fPJTU/tAv7vVGebbsDk8xh0Epdxta
 X5INurW0LZX/pUwyxC/QRDena2UWk8y+UTFYDG0RcA2CiJ6Z6o4WyCZlDEUdGZZc1mWg
 CaTyahl/TGgCqBpMtiZ5vRoclkUszRnkVgZU8XrMI5Vmr7ENwN01ScLA5t56jPgyVCiJ
 fkpQ==
X-Gm-Message-State: AOAM531LhbvgbUOb8s7XtEEUn5cqwIA5ELoypxw3cl96ROyko96o9wTl
 mVq3zfet4DkdGt+9xLztCVE=
X-Google-Smtp-Source: ABdhPJwVaIM7R8GPsSHNDRt56EjMgcK6iZfocQh2Uu2sz9QqKH2d93xXbpM1l1B9nPGJ0MlE22GHSg==
X-Received: by 2002:a37:65ce:: with SMTP id z197mr8599675qkb.144.1626424090959; 
 Fri, 16 Jul 2021 01:28:10 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id q199sm3603540qka.112.2021.07.16.01.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:28:10 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 kernel test robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 06/11] powerpc/pseries/iommu: Add ddw_property_create() and
 refactor enable_ddw()
Date: Fri, 16 Jul 2021 05:27:51 -0300
Message-Id: <20210716082755.428187-7-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716082755.428187-1-leobras.c@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
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

Code used to create a ddw property that was previously scattered in
enable_ddw() is now gathered in ddw_property_create(), which deals with
allocation and filling the property, letting it ready for
of_property_add(), which now occurs in sequence.

This created an opportunity to reorganize the second part of enable_ddw():

Without this patch enable_ddw() does, in order:
kzalloc() property & members, create_ddw(), fill ddwprop inside property,
ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
of_add_property(), and list_add().

With this patch enable_ddw() does, in order:
create_ddw(), ddw_property_create(), of_add_property(),
ddw_list_new_entry(), do tce_setrange_multi_pSeriesLP_walk in all memory,
and list_add().

This change requires of_remove_property() in case anything fails after
of_add_property(), but we get to do tce_setrange_multi_pSeriesLP_walk
in all memory, which looks the most expensive operation, only if
everything else succeeds.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 93 ++++++++++++++++----------
 1 file changed, 57 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index b34b473bbdc1..7ca79a04fa52 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1153,6 +1153,35 @@ static int iommu_get_page_shift(u32 query_page_size)
 	return 0;
 }
 
+static struct property *ddw_property_create(const char *propname, u32 liobn, u64 dma_addr,
+					    u32 page_shift, u32 window_shift)
+{
+	struct dynamic_dma_window_prop *ddwprop;
+	struct property *win64;
+
+	win64 = kzalloc(sizeof(*win64), GFP_KERNEL);
+	if (!win64)
+		return NULL;
+
+	win64->name = kstrdup(propname, GFP_KERNEL);
+	ddwprop = kzalloc(sizeof(*ddwprop), GFP_KERNEL);
+	win64->value = ddwprop;
+	win64->length = sizeof(*ddwprop);
+	if (!win64->name || !win64->value) {
+		kfree(win64->name);
+		kfree(win64->value);
+		kfree(win64);
+		return NULL;
+	}
+
+	ddwprop->liobn = cpu_to_be32(liobn);
+	ddwprop->dma_base = cpu_to_be64(dma_addr);
+	ddwprop->tce_shift = cpu_to_be32(page_shift);
+	ddwprop->window_shift = cpu_to_be32(window_shift);
+
+	return win64;
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1171,12 +1200,12 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
+	u64 win_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
 	struct property *win64;
 	bool ddw_enabled = false;
-	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
 	bool pmem_present;
@@ -1293,72 +1322,64 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 			1ULL << page_shift);
 		goto out_failed;
 	}
-	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
-	if (!win64) {
-		dev_info(&dev->dev,
-			"couldn't allocate property for 64bit dma window\n");
-		goto out_failed;
-	}
-	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
-	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
-	win64->length = sizeof(*ddwprop);
-	if (!win64->name || !win64->value) {
-		dev_info(&dev->dev,
-			"couldn't allocate property name and value\n");
-		goto out_free_prop;
-	}
 
 	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
 	if (ret != 0)
-		goto out_free_prop;
-
-	ddwprop->liobn = cpu_to_be32(create.liobn);
-	ddwprop->dma_base = cpu_to_be64(((u64)create.addr_hi << 32) |
-			create.addr_lo);
-	ddwprop->tce_shift = cpu_to_be32(page_shift);
-	ddwprop->window_shift = cpu_to_be32(len);
+		goto out_failed;
 
 	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
 		  create.liobn, dn);
 
-	window = ddw_list_new_entry(pdn, ddwprop);
+	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
+	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
+				    page_shift, len);
+	if (!win64) {
+		dev_info(&dev->dev,
+			 "couldn't allocate property, property name, or value\n");
+		goto out_remove_win;
+	}
+
+	ret = of_add_property(pdn, win64);
+	if (ret) {
+		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
+			pdn, ret);
+		goto out_free_prop;
+	}
+
+	window = ddw_list_new_entry(pdn, win64->value);
 	if (!window)
-		goto out_clear_window;
+		goto out_del_prop;
 
 	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 			win64->value, tce_setrange_multi_pSeriesLP_walk);
 	if (ret) {
 		dev_info(&dev->dev, "failed to map direct window for %pOF: %d\n",
 			 dn, ret);
-		goto out_free_window;
-	}
-
-	ret = of_add_property(pdn, win64);
-	if (ret) {
-		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
-			 pdn, ret);
-		goto out_free_window;
+		goto out_del_list;
 	}
 
 	spin_lock(&direct_window_list_lock);
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.archdata.dma_offset = win_addr;
 	ddw_enabled = true;
 	goto out_unlock;
 
-out_free_window:
+out_del_list:
 	kfree(window);
 
-out_clear_window:
-	remove_ddw(pdn, true);
+out_del_prop:
+	of_remove_property(pdn, win64);
 
 out_free_prop:
 	kfree(win64->name);
 	kfree(win64->value);
 	kfree(win64);
 
+out_remove_win:
+	remove_ddw(pdn, true);
+
 out_failed:
 	if (default_win_removed)
 		reset_dma_window(dev, pdn);
-- 
2.32.0

