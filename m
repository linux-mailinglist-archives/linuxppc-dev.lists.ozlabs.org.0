Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D636FEAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWydn3th0z3bp2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:35:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RnJznbf6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RnJznbf6; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZg5GVyz30Cy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:27 +1000 (AEST)
Received: by mail-qk1-x72f.google.com with SMTP id i17so5750162qki.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q3DTkzRxiL4cvjvAEnGwxVmcrQ9s6v5oJ6rrdiNfEWQ=;
 b=RnJznbf63Ma9ym79l+9H98O/cUg655H2OJggOoy7WQiIGcwxq2Yl3h4u/Y/0ZavB50
 N6Lzg6cu8My2V4eIo0+NyPnskXtvVAq3KfdI4I2wPicdJ8Bov27ma5TFQJ/lTFkVLbGQ
 bBHXoAdSlP6zKzI4OJzp6/VG75FvRAuz9bRgDFf72/GoZ1wVzR0kF/NmDytAVpHRJGQb
 6n/G5f+10j2UdWEH3FHz7a5s3D8ezvo5rFaU8rVt5ZwgyXEFmthvwtG7NrnLKjdLTdzg
 yCt3UQSArrwYA2+J0CD8JlQ7hDohAjKHHVjz3XfL7UM0euA0zKPfBaxK7byIEJmZ+YHx
 VC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q3DTkzRxiL4cvjvAEnGwxVmcrQ9s6v5oJ6rrdiNfEWQ=;
 b=SvE/8LlxJk/WHbKm+KixIDR7+huWfW1IkZhTZWujB+ddLVYw09rItqUvZt7IQDUjNR
 GfwFEPbYDhNf1sXdXPZtoVPFqEHmx9QeOTJAoqfrTTiX0XgKT5wBN5SCFHPEWcqiGpkf
 ijrXIG0NxQTzCPNVHrHIrgHDIo6RexZb+etfCLr2n86GWYpzg1OiNeDmZdsR/dzIsFJg
 BSXpr8slYTnOcnnNWH9p1aGONF0vLgMq23LWU4F6NFTdnke28l43YGxAdSoOY7vuvLMr
 RyL+jSRyLvTAs6hduIavekMdD3Uisy91NJJ2luaygEbVtK1+b7zZHTGmUVyRo0ps4fJp
 IhIg==
X-Gm-Message-State: AOAM531XGfSDBu2nHHYe058Ls4flA37dDOpBoDb6XRrYD/+7et8BZX9Q
 l4At5F32p3ijXJKxHkBv3k8=
X-Google-Smtp-Source: ABdhPJzx5uw1IBlbOWpal57zPbCJw/qv3p3V4cO+c8CJS35vNku6P5L7vmG8/vypU6T4tjWa9FsHdg==
X-Received: by 2002:a37:7e03:: with SMTP id z3mr6395090qkc.367.1619800345799; 
 Fri, 30 Apr 2021 09:32:25 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:25 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 06/11] powerpc/pseries/iommu: Add ddw_property_create() and
 refactor enable_ddw()
Date: Fri, 30 Apr 2021 13:31:41 -0300
Message-Id: <20210430163145.146984-7-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430163145.146984-1-leobras.c@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
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
---
 arch/powerpc/platforms/pseries/iommu.c | 93 ++++++++++++++++----------
 1 file changed, 57 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 955cf095416c..5a70ecd579b8 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1122,6 +1122,35 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
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
 /* Return largest page shift based on "IO Page Sizes" output of ibm,query-pe-dma-window. */
 static int iommu_get_page_shift(u32 query_page_size)
 {
@@ -1167,11 +1196,11 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	struct ddw_query_response query;
 	struct ddw_create_response create;
 	int page_shift;
+	u64 win_addr;
 	struct device_node *dn;
 	u32 ddw_avail[DDW_APPLICABLE_SIZE];
 	struct direct_window *window;
 	struct property *win64 = NULL;
-	struct dynamic_dma_window_prop *ddwprop;
 	struct failed_ddw_pdn *fpdn;
 	bool default_win_removed = false;
 	bool pmem_present;
@@ -1286,65 +1315,54 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
@@ -1352,6 +1370,9 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	kfree(win64);
 	win64 = NULL;
 
+out_remove_win:
+	remove_ddw(pdn, true);
+
 out_failed:
 	if (default_win_removed)
 		reset_dma_window(dev, pdn);
-- 
2.30.2

