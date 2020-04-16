Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 663091ABBBC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 10:53:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492tL032ykzDrJq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 18:53:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PMRUQRm1; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492sjl14ZyzDqwH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 18:25:30 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id 7so787717pjo.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDLYzFyP5Ud03DyAQDeiT+t7DUpASCapmXQkYuDhScg=;
 b=PMRUQRm1WuoXM7LWzRPK78/ZyC9uShamoHtqDJMdgZ+GPwKT4K6rX7TC5KMHhQbG8h
 tMue560nzC9nNtMD2CLFeffPilKfaIfk/3BBsL00L+/m2OOuit12IPxGXAk0uVIDVUQ2
 ZtS3H4xF+0GNQJUdfKS0naEN9DhtRLNhtTxZE+07W5jXqjkxk7bn6utNl9sJy+zrAEC9
 7/Yz5jBt37x2j7sSqiFxDJ2u7sZ+b/bYjcZ2nVNJFpdza0R0X5s8y45jRrc+Hpj5wuQk
 ikHbvGvRlbVFJxbS1CxczrDXEoBQGuV3H5RsfxWkmMAa+qqOfuUhiRM+vgwFD/Ej7Ecq
 BCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDLYzFyP5Ud03DyAQDeiT+t7DUpASCapmXQkYuDhScg=;
 b=sasyTEcJQ99uYLi40LWanUYWCNQwJzZYmkHJJaB3GV8Rme3TYHHqifTMzwiQAz2gwZ
 1ycchZ6HBFofrx82hyVKIOA488+SqZSlmPxcpMqzIKGPfDyqsnU4sJ2P/yAo0N50dDY7
 Os0eqgyPFED2Ajq4WdSspfxMJAkO7sQNiNfPiH26v/0/zvYxqlyPa3TuEARG0Ea52Kch
 1KOyelrL/rcqIV61A+rv+SnXcL7apdiOcD7jVWa+Xa1WLooYWRYTeYruvvafqZ3uxwgl
 tjql1Fqq2K1x9g4qxmbvza098Yt5HzGXwhoxggvKLzhG5ST5MGeekbY7GdVtYTIXmoC1
 1EKw==
X-Gm-Message-State: AGi0PubJMPKaizNUITHnLKZuJaE4Ve7AsI6ssxl8cNsFcjorPvqeglBq
 3cyWtpo1KACf8zrN9AtQPDQdSo/kjcukBA==
X-Google-Smtp-Source: APiQypLKVzfc5DtR6f0W7jbFflm2m1lNle2XKZHDotAQZNxQjndj9xWU4v3MuKSXlgiaKwNbOD9Tug==
X-Received: by 2002:a17:902:db86:: with SMTP id m6mr8341882pld.4.1587025521986; 
 Thu, 16 Apr 2020 01:25:21 -0700 (PDT)
Received: from santosiv.in.ibm.com ([2401:4900:2348:c4cf:97f8:ab74:4c:86fc])
 by smtp.gmail.com with ESMTPSA id w11sm1446902pfq.100.2020.04.16.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 01:25:21 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] papr/scm: Add bad memory ranges to nvdimm bad ranges
Date: Thu, 16 Apr 2020 13:54:55 +0530
Message-Id: <20200416082455.2645740-1-santosh@fossix.org>
X-Mailer: git-send-email 2.25.2
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
Cc: Oliver <oohall@gmail.com>, Santosh Sivaraj <santosh@fossix.org>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subscribe to the MCE notification and add the physical address which
generated a memory error to nvdimm bad range.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 98 ++++++++++++++++++++++-
 1 file changed, 97 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f35592423380..e23fd1399d5b 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -12,6 +12,8 @@
 #include <linux/libnvdimm.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
+#include <linux/nd.h>
+#include <asm/mce.h>
 
 #include <asm/plpar_wrappers.h>
 
@@ -39,8 +41,12 @@ struct papr_scm_priv {
 	struct resource res;
 	struct nd_region *region;
 	struct nd_interleave_set nd_set;
+	struct list_head region_list;
 };
 
+LIST_HEAD(papr_nd_regions);
+DEFINE_MUTEX(papr_ndr_lock);
+
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
@@ -356,6 +362,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	mutex_lock(&papr_ndr_lock);
+	list_add_tail(&p->region_list, &papr_nd_regions);
+	mutex_unlock(&papr_ndr_lock);
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
@@ -363,6 +373,70 @@ err:	nvdimm_bus_unregister(p->bus);
 	return -ENXIO;
 }
 
+void papr_scm_add_badblock(struct nd_region *region, struct nvdimm_bus *bus,
+			   u64 phys_addr)
+{
+	u64 aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
+
+	if (nvdimm_bus_add_badrange(bus, aligned_addr, L1_CACHE_BYTES)) {
+		pr_err("Bad block registration for 0x%llx failed\n", phys_addr);
+		return;
+	}
+
+	pr_debug("Add memory range (0x%llx - 0x%llx) as bad range\n",
+		 aligned_addr, aligned_addr + L1_CACHE_BYTES);
+
+	nvdimm_region_notify(region, NVDIMM_REVALIDATE_POISON);
+}
+
+static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
+			 void *data)
+{
+	struct machine_check_event *evt = data;
+	struct papr_scm_priv *p;
+	u64 phys_addr;
+	bool found = false;
+
+	if (evt->error_type != MCE_ERROR_TYPE_UE)
+		return NOTIFY_DONE;
+
+	if (list_empty(&papr_nd_regions))
+		return NOTIFY_DONE;
+
+	/*
+	 * The physical address obtained here is PAGE_SIZE aligned, so get the
+	 * exact address from the effective address
+	 */
+	phys_addr = evt->u.ue_error.physical_address +
+		(evt->u.ue_error.effective_address & ~PAGE_MASK);
+
+	if (!evt->u.ue_error.physical_address_provided ||
+	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
+		return NOTIFY_DONE;
+
+	/* mce notifier is called from a process context, so mutex is safe */
+	mutex_lock(&papr_ndr_lock);
+	list_for_each_entry(p, &papr_nd_regions, region_list) {
+		struct resource res = p->res;
+
+		if (phys_addr >= res.start && phys_addr <= res.end) {
+			found = true;
+			break;
+		}
+	}
+
+	if (found)
+		papr_scm_add_badblock(p->region, p->bus, phys_addr);
+
+	mutex_unlock(&papr_ndr_lock);
+
+	return found ? NOTIFY_OK : NOTIFY_DONE;
+}
+
+static struct notifier_block mce_ue_nb = {
+	.notifier_call = handle_mce_ue
+};
+
 static int papr_scm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
@@ -460,6 +534,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 {
 	struct papr_scm_priv *p = platform_get_drvdata(pdev);
 
+	mutex_lock(&papr_ndr_lock);
+	list_del(&(p->region_list));
+	mutex_unlock(&papr_ndr_lock);
+
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 	kfree(p->bus_desc.provider_name);
@@ -482,7 +560,25 @@ static struct platform_driver papr_scm_driver = {
 	},
 };
 
-module_platform_driver(papr_scm_driver);
+static int __init papr_scm_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&papr_scm_driver);
+	if (!ret)
+		mce_register_notifier(&mce_ue_nb);
+
+	return ret;
+}
+module_init(papr_scm_init);
+
+static void __exit papr_scm_exit(void)
+{
+	mce_unregister_notifier(&mce_ue_nb);
+	platform_driver_unregister(&papr_scm_driver);
+}
+module_exit(papr_scm_exit);
+
 MODULE_DEVICE_TABLE(of, papr_scm_match);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("IBM Corporation");
-- 
2.25.2

