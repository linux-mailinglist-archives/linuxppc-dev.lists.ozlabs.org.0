Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB37247B5D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 02:03:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrhl5398zDqZX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 10:03:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iM/ie5bQ; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCv1KznzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:31 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id s16so13839881qtn.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aYwMn+0oPilAHK+vV8/rmnjg2+X7jRFYWM75PHJu/Cg=;
 b=iM/ie5bQNp09TXUXMEblPrgy6XtY+CU+Evf0UQLYSiFZITZ6TKHjMJ1ElgzvbVo+bs
 p0oL2AQB2yrAOo+iebAYzgZ7lKHcAZmtbd/4K+hhmyxrIA3bzA4FphD3m0tb9cWxK/Gx
 rVUFBqZ1iNa65Nagde2OYI+BlaiIj5lFhZeSilwkbuFO1gkstdII9382SPKnrny7k0vZ
 uAZcSkze+Ibn1dt6SCKbP9P0vQ6oXG7L/DYoUz/159qR7P9FFpvMkJt8dG6hVay8Dmlo
 0jVxzLNDhHSQHP6CjUKO6CtTCvHbqnMS3FmYaDB3ZGMzqy+CzXzwjpAdoP5DASCaJdJg
 19pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aYwMn+0oPilAHK+vV8/rmnjg2+X7jRFYWM75PHJu/Cg=;
 b=uOQUCsXoE2M5wBikFCabbSMcDvDeI2UPwySMJUooTSx3Z3eJfGmCgvEE8Guqk7TjoW
 epqaFVAh8J/7tgKb+oNyk6mvJLa3cCY80IkKigVjsNXBy+iimJrEFA2LT0u7dwHZDV3n
 QrWVGfyN4ALTZv+HfL/yh1sC2xrlF9XzLrNccLQJwo1DNS3mJzcCJ6OLsMRb00qkdgbK
 A/JYlN4bsjYsfUl7uIEgBUXLjKdkNilRX6I3MZ1sZUD5fFgFdb3SkkEaSstrKKAkWq43
 R/vn6/ZBOz6l80sWSvXXw7Ds877yUc1fpnuP/e2hFfe8HolE/NT6zEnOjCLlKJHkqPHj
 e11Q==
X-Gm-Message-State: AOAM530jVjARIIAnhUdveh2q1kv1TJ4ql0fs5+zlBxrJMM7p43OQNNBf
 VFGiy3weIAmG739lyQnsQSc=
X-Google-Smtp-Source: ABdhPJzAToPHAUILBdDyMBpP7yC+IL/H8MSyYZRln1pxKeyrurCyCMNR3PlrI0vpc9oNICZk53raPg==
X-Received: by 2002:ac8:5143:: with SMTP id h3mr15375864qtn.229.1597707686875; 
 Mon, 17 Aug 2020 16:41:26 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:26 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 08/10] powerpc/pseries/iommu: Add ddw_property_create() and
 refactor enable_ddw()
Date: Mon, 17 Aug 2020 20:40:31 -0300
Message-Id: <20200817234033.442511-9-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817234033.442511-1-leobras.c@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
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
ddw_list_add(), do tce_setrange_multi_pSeriesLP_walk in all memory,
of_add_property().

With this patch enable_ddw() does, in order:
create_ddw(), ddw_property_create(), of_add_property(), ddw_list_add(),
do tce_setrange_multi_pSeriesLP_walk in all memory.

This change requires of_remove_property() in case anything fails after
of_add_property(), but we get to do tce_setrange_multi_pSeriesLP_walk
in all memory, which looks the most expensive operation, only if
everything else succeeds.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 97 +++++++++++++++-----------
 1 file changed, 57 insertions(+), 40 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 4031127c9537..3a1ef02ad9d5 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1123,6 +1123,31 @@ static void reset_dma_window(struct pci_dev *dev, struct device_node *par_dn)
 			 ret);
 }
 
+static int ddw_property_create(struct property **ddw_win, const char *propname,
+			       u32 liobn, u64 dma_addr, u32 page_shift, u32 window_shift)
+{
+	struct dynamic_dma_window_prop *ddwprop;
+	struct property *win64;
+
+	*ddw_win = win64 = kzalloc(sizeof(*win64), GFP_KERNEL);
+	if (!win64)
+		return -ENOMEM;
+
+	win64->name = kstrdup(propname, GFP_KERNEL);
+	ddwprop = kzalloc(sizeof(*ddwprop), GFP_KERNEL);
+	win64->value = ddwprop;
+	win64->length = sizeof(*ddwprop);
+	if (!win64->name || !win64->value)
+		return -ENOMEM;
+
+	ddwprop->liobn = cpu_to_be32(liobn);
+	ddwprop->dma_base = cpu_to_be64(dma_addr);
+	ddwprop->tce_shift = cpu_to_be32(page_shift);
+	ddwprop->window_shift = cpu_to_be32(window_shift);
+
+	return 0;
+}
+
 /*
  * If the PE supports dynamic dma windows, and there is space for a table
  * that can map all pages in a linear offset, then setup such a table,
@@ -1140,12 +1165,11 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
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
 
@@ -1244,38 +1268,34 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_failed;
 	}
 	len = order_base_2(max_addr);
-	win64 = kzalloc(sizeof(struct property), GFP_KERNEL);
-	if (!win64) {
-		dev_info(&dev->dev,
-			"couldn't allocate property for 64bit dma window\n");
+
+	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
+	if (ret != 0)
 		goto out_failed;
-	}
-	win64->name = kstrdup(DIRECT64_PROPNAME, GFP_KERNEL);
-	win64->value = ddwprop = kmalloc(sizeof(*ddwprop), GFP_KERNEL);
-	win64->length = sizeof(*ddwprop);
-	if (!win64->name || !win64->value) {
+
+	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
+		create.liobn, dn);
+
+	win_addr = ((u64)create.addr_hi << 32) | create.addr_lo;
+	ret = ddw_property_create(&win64, DIRECT64_PROPNAME, create.liobn, win_addr,
+				  page_shift, len);
+	if (ret) {
 		dev_info(&dev->dev,
-			"couldn't allocate property name and value\n");
+			 "couldn't allocate property, property name, or value\n");
 		goto out_free_prop;
 	}
 
-	ret = create_ddw(dev, ddw_avail, &create, page_shift, len);
-	if (ret != 0)
+	ret = of_add_property(pdn, win64);
+	if (ret) {
+		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
+			pdn, ret);
 		goto out_free_prop;
-
-	ddwprop->liobn = cpu_to_be32(create.liobn);
-	ddwprop->dma_base = cpu_to_be64(((u64)create.addr_hi << 32) |
-			create.addr_lo);
-	ddwprop->tce_shift = cpu_to_be32(page_shift);
-	ddwprop->window_shift = cpu_to_be32(len);
-
-	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
-		  create.liobn, dn);
+	}
 
 	/* Add new window to existing DDW list */
-	window = ddw_list_add(pdn, ddwprop);
+	window = ddw_list_add(pdn, win64->value);
 	if (!window)
-		goto out_clear_window;
+		goto out_prop_del;
 
 	ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
 			win64->value, tce_setrange_multi_pSeriesLP_walk);
@@ -1285,14 +1305,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_free_window;
 	}
 
-	ret = of_add_property(pdn, win64);
-	if (ret) {
-		dev_err(&dev->dev, "unable to add dma window property for %pOF: %d",
-			 pdn, ret);
-		goto out_free_window;
-	}
-
-	dev->dev.archdata.dma_offset = be64_to_cpu(ddwprop->dma_base);
+	dev->dev.archdata.dma_offset = win_addr;
 	goto out_unlock;
 
 out_free_window:
@@ -1302,14 +1315,18 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 
 	kfree(window);
 
-out_clear_window:
-	remove_ddw(pdn, true);
+out_prop_del:
+	of_remove_property(pdn, win64);
 
 out_free_prop:
-	kfree(win64->name);
-	kfree(win64->value);
-	kfree(win64);
-	win64 = NULL;
+	if (win64) {
+		kfree(win64->name);
+		kfree(win64->value);
+		kfree(win64);
+		win64 = NULL;
+	}
+
+	remove_ddw(pdn, true);
 
 out_failed:
 	if (default_win_removed)
-- 
2.25.4

