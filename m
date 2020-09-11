Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5322666E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 19:34:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp2tt6W1RzDrQ9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 03:34:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c7a0s/Pg; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp2PW36lnzDqsp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 03:12:31 +1000 (AEST)
Received: by mail-qk1-x741.google.com with SMTP id q63so9791064qkf.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 10:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shfKO2FG9d5ahnlk4//07u62jXq/fOaSmlpn8ouFUCQ=;
 b=c7a0s/PgQQ4CMZzul/Frz+ithoWWTIpnydqOAcI3dnqaGue6LNJm6T/AEaSjyzO20p
 A9vERT4jA+7qHwApW5C3My4MdrP9rrSpUlvJSS0jCp2uetRuI9cqTwKV7w3q6J8eSJRt
 LkGhWDRuLaUfrUyP0DSK5J9+eegvNRbclKUrzEL4P34H+xAwHKIejEqeRGiUa+grioX3
 QbqET+Jgjb7UyGjelF+xm6xw4qWybtz6BleL1gtU5F0bnB/SoJQ4Sb0wCSOsyJGLZ3y9
 mH3jexm6Zdpbsa2GmReVDZHfWO6l8RQMW3kRdeaN1xUATV05WlKvnUtnxO5dlInSE4Qh
 l2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shfKO2FG9d5ahnlk4//07u62jXq/fOaSmlpn8ouFUCQ=;
 b=Ns0MwgN5GfkaX2XElSZ+bJEyl8injMZ5So7Yd4cTd1UHiqZATqG+wZVnQy3OHr4h6n
 JP0Wirpb6ha/+h8Oe0aK/00en7Q9/s3z6YoT/WFb6z+3Teahm8lsatTvrQEiZlo6vdfm
 U1f0ZDRgsnb8zhqHOyo61okcPdXV3f5sYe84URgg9h8Xr0K5U01qjlw+wSPBJnAc0H1d
 tcOA1bcrpLwHb3zsnRxa6a2UfPvv2SvuVaP0VB3KQM3taPl+rW77kewPW9HmDJYSOGaA
 QuXeulT5vJ1ANs6ZYWcBZXO3vV6/ZsJFOUpVW1i/tjHYoOnvuEsJ5XXm8+IcU9rU1cVg
 fHFw==
X-Gm-Message-State: AOAM531D6D3Eu4ojADfwDGNfT36EIvXc3hFQ1KZqXK58yz+XunSLfkzY
 Ce/SzUXrdUkSuhyT4bsVQW8=
X-Google-Smtp-Source: ABdhPJzM13dVx+EGEh0GHIBPGz+IWDdyketW0/Ra8ym50c3sxqD4ocM+G9zOovpnFHgbHxHEVyvSEQ==
X-Received: by 2002:a37:a881:: with SMTP id r123mr2305114qke.335.1599844349299; 
 Fri, 11 Sep 2020 10:12:29 -0700 (PDT)
Received: from LeoBras.ibmuc.com (179-125-254-96.dynamic.desktop.com.br.
 [179.125.254.96])
 by smtp.gmail.com with ESMTPSA id l5sm3533330qtc.28.2020.09.11.10.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 10:12:28 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v2 09/14] powerpc/pseries/iommu: Add ddw_property_create() and
 refactor enable_ddw()
Date: Fri, 11 Sep 2020 14:07:34 -0300
Message-Id: <20200911170738.82818-10-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200911170738.82818-1-leobras.c@gmail.com>
References: <20200911170738.82818-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 

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
---
 arch/powerpc/platforms/pseries/iommu.c | 106 +++++++++++++++----------
 1 file changed, 63 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index bba8584a8f9d..510ccb0521af 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -177,7 +177,7 @@ static int tce_build_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
 		if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
 			ret = (int)rc;
 			tce_free_pSeriesLP(liobn, tcenum_start, tceshift,
-			                   (npages_start - (npages + 1)));
+					   (npages_start - (npages + 1)));
 			break;
 		}
 
@@ -215,7 +215,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	if ((npages == 1) || !firmware_has_feature(FW_FEATURE_PUT_TCE_IND)) {
 		return tce_build_pSeriesLP(tbl->it_index, tcenum,
 					   tceshift, npages, uaddr,
-		                           direction, attrs);
+					   direction, attrs);
 	}
 
 	local_irq_save(flags);	/* to protect tcep and the page behind it */
@@ -269,7 +269,7 @@ static int tce_buildmulti_pSeriesLP(struct iommu_table *tbl, long tcenum,
 	if (unlikely(rc == H_NOT_ENOUGH_RESOURCES)) {
 		ret = (int)rc;
 		tce_freemulti_pSeriesLP(tbl, tcenum_start,
-		                        (npages_start - (npages + limit)));
+					(npages_start - (npages + limit)));
 		return ret;
 	}
 
@@ -1121,6 +1121,35 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 			 ret);
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
+		kfree(win64);
+		kfree(win64->name);
+		kfree(win64->value);
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
@@ -1138,12 +1167,11 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
-	u64 max_addr;
+	u64 max_addr, win_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
-	struct property *win64;
-	struct dynamic_dma_window_prop *ddwprop;
+	struct property *win64 = NULL;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
 
@@ -1245,72 +1273,64 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_failed;
 	}
 	len = order_base_2(max_addr);
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
-		  create.liobn, dn);
+		create.liobn, dn);
 
-	window = ddw_list_new_entry(pdn, ddwprop);
+	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
+	win64 = ddw_property_create(DIRECT64_PROPNAME, create.liobn, win_addr,
+				    page_shift, len);
+	if (!win64) {
+		dev_info(&dev->dev,
+			 "couldn't allocate property, property name, or value\n");
+		goto out_win_del;
+	}
+
+	ret = of_add_property(pdn, win64);
+	if (ret) {
+		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
+			pdn, ret);
+		goto out_prop_free;
+	}
+
+	window = ddw_list_new_entry(pdn, win64->value);
 	if (!window)
-		goto out_clear_window;
+		goto out_prop_del;
 
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
+		goto out_list_del;
 	}
 
 	spin_lock(&direct_window_list_lock);
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
 
-	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.archdata.dma_offset = win_addr;
 	goto out_unlock;
 
-out_free_window:
+out_list_del:
 	kfree(window);
 
-out_clear_window:
-	remove_ddw(pdn, true);
+out_prop_del:
+	of_remove_property(pdn, win64);
 
-out_free_prop:
+out_prop_free:
 	kfree(win64->name);
 	kfree(win64->value);
 	kfree(win64);
 	win64 = NULL;
 
+out_win_del:
+	remove_ddw(pdn, true);
+
 out_failed:
 	if (default_win_removed)
 		reset_dma_window(dev, pdn);
-- 
2.25.4

