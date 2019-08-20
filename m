Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D99954AB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:54:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFkg2tNbzDqY3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:54:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="AgBOS3TM"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFCN0HTMzDqcy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:30:54 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m12so1921064plt.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 19:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OJQ1JtMDNV5nsiORd0r0n+pnVyqaZzwyevr5Q3dpk9c=;
 b=AgBOS3TM72SW5SpcpxjRhYoUxz8mE4LQe67bOlYZniZQT7lgKQnnb3Bm8J1wk5N5ne
 X1gxHv2SEDrnFNCixLJJixtE4yM/RG0A7KUGFJEftCzue1Zw0aOvxmOvioih5cD21ZlT
 ODFUGMq4K7tKgoypSFamDFqZiG18Qs9ATgG4NyphvUVQi5OlqFqpMqrmVulDgIU7KkNv
 GrPHt939xXSiUmUBZ+jpKMtklycqij3bKfalvCe2WOZaMb9+3/+L33RX+ItL4D+Pio+/
 JbjWdedw1BOXm2QoNBfHcmeoVb2VpetM2TCWaNmT2rRfnEh+lt1t2BuvfIt259kzdwu1
 z4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OJQ1JtMDNV5nsiORd0r0n+pnVyqaZzwyevr5Q3dpk9c=;
 b=P5R3d+ql9+efFNdPiekq8Ip7GI5hJBS45o3y1Axu4/aYyz9tTRbR8/0ywN1DKVZ7Ez
 Hwsmb2XZJSqUAi58hTRwS9jgfhmTTpPGMMRa7aeCOQWvhrQcU/PdG9i4x8IqPzULvjfA
 tVraCwDJSlTuNhUlrfRttf4d38FYZHfW4VrLeUml4jNSum+OG9OhNcQAmao9q2D/wiXZ
 y8NaXq5Msrz3uSiyxM2RuPvr5JJNbx8Vdca1EriGbvefGZ74+YfLo1QJZ2ZC2qcMpN7m
 ZtNzqLu5hdUWHe9lGo6qSm8iWqFK8z+I7ueog/6FLEns6azPenf0abbnZ2GGHtn9azHG
 hw+w==
X-Gm-Message-State: APjAAAVEwsja9URJBm9AfcGf70j0gGCYSnvsvcpqZxpw9jY5BUALeK9M
 4HvqOBsKJ+RsP0odZ2OPecW/RkLkxcg=
X-Google-Smtp-Source: APXvYqwsbFnmzgBIiwT+TKGBoKUJJYnN/NEfgfNYlsuxKbb2JAh9S4eEmu3pcgN5jh37RHgnoEzHCg==
X-Received: by 2002:a17:902:4ac2:: with SMTP id
 q2mr24247995plh.30.1566268251151; 
 Mon, 19 Aug 2019 19:30:51 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id j15sm17609220pfr.146.2019.08.19.19.30.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 19:30:50 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] of_pmem: Add memory ranges which took a mce to bad range
Date: Tue, 20 Aug 2019 08:00:29 +0530
Message-Id: <20190820023030.18232-3-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820023030.18232-1-santosh@fossix.org>
References: <20190820023030.18232-1-santosh@fossix.org>
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
Cc: Chandan Rajendra <chandan@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subscribe to the MCE notification and add the physical address which
generated a memory error to nvdimm bad range.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 drivers/nvdimm/of_pmem.c | 151 +++++++++++++++++++++++++++++++++------
 1 file changed, 131 insertions(+), 20 deletions(-)

diff --git a/drivers/nvdimm/of_pmem.c b/drivers/nvdimm/of_pmem.c
index a0c8dcfa0bf9..155e56862fdf 100644
--- a/drivers/nvdimm/of_pmem.c
+++ b/drivers/nvdimm/of_pmem.c
@@ -8,6 +8,9 @@
 #include <linux/module.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/nd.h>
+#include <asm/mce.h>
 
 static const struct attribute_group *region_attr_groups[] = {
 	&nd_region_attribute_group,
@@ -25,11 +28,77 @@ struct of_pmem_private {
 	struct nvdimm_bus *bus;
 };
 
+struct of_pmem_region {
+	struct of_pmem_private *priv;
+	struct nd_region_desc *region_desc;
+	struct nd_region *region;
+	struct list_head region_list;
+};
+
+LIST_HEAD(pmem_regions);
+DEFINE_MUTEX(pmem_region_lock);
+
+static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
+			 void *data)
+{
+	struct machine_check_event *evt = data;
+	struct of_pmem_region *pmem_region;
+	u64 aligned_addr, phys_addr;
+	bool found = false;
+
+	if (evt->error_type != MCE_ERROR_TYPE_UE)
+		return NOTIFY_DONE;
+
+	if (list_empty(&pmem_regions))
+		return NOTIFY_DONE;
+
+	phys_addr = evt->u.ue_error.physical_address +
+		(evt->u.ue_error.effective_address & ~PAGE_MASK);
+
+	if (!evt->u.ue_error.physical_address_provided ||
+	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
+		return NOTIFY_DONE;
+
+	mutex_lock(&pmem_region_lock);
+	list_for_each_entry(pmem_region, &pmem_regions, region_list) {
+		struct resource *res = pmem_region->region_desc->res;
+
+		if (phys_addr >= res->start && phys_addr <= res->end) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&pmem_region_lock);
+
+	if (!found)
+		return NOTIFY_DONE;
+
+	aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
+
+	if (nvdimm_bus_add_badrange(pmem_region->priv->bus, aligned_addr,
+				    L1_CACHE_BYTES))
+		return NOTIFY_DONE;
+
+	pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
+		 aligned_addr, aligned_addr + L1_CACHE_BYTES);
+
+
+	nvdimm_region_notify(pmem_region->region, NVDIMM_REVALIDATE_POISON);
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block mce_ue_nb = {
+	.notifier_call = handle_mce_ue
+};
+
 static int of_pmem_region_probe(struct platform_device *pdev)
 {
 	struct of_pmem_private *priv;
 	struct device_node *np;
 	struct nvdimm_bus *bus;
+	struct of_pmem_region *pmem_region;
+	struct nd_region_desc *ndr_desc;
 	bool is_volatile;
 	int i;
 
@@ -58,32 +127,49 @@ static int of_pmem_region_probe(struct platform_device *pdev)
 			is_volatile ? "volatile" : "non-volatile",  np);
 
 	for (i = 0; i < pdev->num_resources; i++) {
-		struct nd_region_desc ndr_desc;
 		struct nd_region *region;
 
-		/*
-		 * NB: libnvdimm copies the data from ndr_desc into it's own
-		 * structures so passing a stack pointer is fine.
-		 */
-		memset(&ndr_desc, 0, sizeof(ndr_desc));
-		ndr_desc.attr_groups = region_attr_groups;
-		ndr_desc.numa_node = dev_to_node(&pdev->dev);
-		ndr_desc.target_node = ndr_desc.numa_node;
-		ndr_desc.res = &pdev->resource[i];
-		ndr_desc.of_node = np;
-		set_bit(ND_REGION_PAGEMAP, &ndr_desc.flags);
+		ndr_desc = kzalloc(sizeof(struct nd_region_desc), GFP_KERNEL);
+		if (!ndr_desc) {
+			nvdimm_bus_unregister(priv->bus);
+			kfree(priv);
+			return -ENOMEM;
+		}
+
+		ndr_desc->attr_groups = region_attr_groups;
+		ndr_desc->numa_node = dev_to_node(&pdev->dev);
+		ndr_desc->target_node = ndr_desc->numa_node;
+		ndr_desc->res = &pdev->resource[i];
+		ndr_desc->of_node = np;
+		set_bit(ND_REGION_PAGEMAP, &ndr_desc->flags);
 
 		if (is_volatile)
-			region = nvdimm_volatile_region_create(bus, &ndr_desc);
+			region = nvdimm_volatile_region_create(bus, ndr_desc);
 		else
-			region = nvdimm_pmem_region_create(bus, &ndr_desc);
+			region = nvdimm_pmem_region_create(bus, ndr_desc);
 
-		if (!region)
+		if (!region) {
 			dev_warn(&pdev->dev, "Unable to register region %pR from %pOF\n",
-					ndr_desc.res, np);
-		else
-			dev_dbg(&pdev->dev, "Registered region %pR from %pOF\n",
-					ndr_desc.res, np);
+					ndr_desc->res, np);
+			continue;
+		}
+
+		dev_dbg(&pdev->dev, "Registered region %pR from %pOF\n",
+			ndr_desc->res, np);
+
+		pmem_region = kzalloc(sizeof(struct of_pmem_region),
+				      GFP_KERNEL);
+		if (!pmem_region)
+			continue;
+
+		pmem_region->region_desc = ndr_desc;
+		pmem_region->region = region;
+		pmem_region->priv = priv;
+
+		/* Save regions registered for use by the notification code */
+		mutex_lock(&pmem_region_lock);
+		list_add_tail(&pmem_region->region_list, &pmem_regions);
+		mutex_unlock(&pmem_region_lock);
 	}
 
 	return 0;
@@ -92,6 +178,13 @@ static int of_pmem_region_probe(struct platform_device *pdev)
 static int of_pmem_region_remove(struct platform_device *pdev)
 {
 	struct of_pmem_private *priv = platform_get_drvdata(pdev);
+	struct of_pmem_region *r, *t;
+
+	list_for_each_entry_safe(r, t, &pmem_regions, region_list) {
+		list_del(&(r->region_list));
+		kfree(r->region_desc);
+		kfree(r);
+	}
 
 	nvdimm_bus_unregister(priv->bus);
 	kfree(priv);
@@ -113,7 +206,25 @@ static struct platform_driver of_pmem_region_driver = {
 	},
 };
 
-module_platform_driver(of_pmem_region_driver);
+static int __init of_pmem_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&of_pmem_region_driver);
+	if (!ret)
+		mce_register_notifier(&mce_ue_nb);
+
+	return ret;
+}
+module_init(of_pmem_init);
+
+static void __exit of_pmem_exit(void)
+{
+	mce_unregister_notifier(&mce_ue_nb);
+	platform_driver_unregister(&of_pmem_region_driver);
+}
+module_exit(of_pmem_exit);
+
 MODULE_DEVICE_TABLE(of, of_pmem_region_match);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("IBM Corporation");
-- 
2.21.0

