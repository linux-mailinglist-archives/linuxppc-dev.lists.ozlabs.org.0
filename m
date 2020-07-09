Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A33219A56
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:00:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2T9t1w8BzDrCC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 18:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=O5g8/c/k; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2T6T27l1zDqmT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 17:57:20 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id m22so622467pgv.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 00:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46panI7i1WY6h65MGJTspwRECDAL99B1Xc9dYUTsE7s=;
 b=O5g8/c/kuRnrP0YwU7UeOl0BUKBPrfIJSR6pN0RxQjgW3nMMK+vvq9Trtw9Tg4y0p1
 3v0twgLfOmmpLnAPYbgir6gGNYQcGTb9kJJoGJkHrEJ60JERNiwWjb9MzlyiQpZbkOUu
 +eS3YvLTj/2KjikhzHSFxXTrlDJq3VQ5j0kawQdvQJeaVgfMfzyZ+icKGg4wGAoy+NBx
 ucvp5iX/XV1K7D2hVGld7Xyc5ELlZ2KV8Wt6UWg47IQKQAcugSt2BQYvOWWi41NG5Qi5
 2yvv4s2TrnD06q33XXGuszsWfJ/L9oHB/fi76/AtzMV5MupnddP2IgTWWouoQYny5wej
 GcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46panI7i1WY6h65MGJTspwRECDAL99B1Xc9dYUTsE7s=;
 b=s8a+0iwvNKxAXLNZM4DKdIkZm56Ov1JUrMAbgQ+Vd62NEPZEPyFVHLGIbMORT8cAJw
 +RQ6gpUW+35ULaYKX0gWTe61VDroekGkO8bM9mFkOBvJgd2RtUz8jBHqgg5huzzmEJsg
 0WC9jHw5sMop1x9MKHyrGUg5IT/NfNGRjYjd+wbAr20oKRWVETxs6H/kYQxvi6Pb7ouN
 23VqKFr5tXvDIPewmgukqPg26v9cYPfJTQ4jU5o9lsTyyqjuWfejwyU04UU8bpHCTj/1
 DXhQKiXGMTM9a18vXGCH4inEf6l9UAjLrdiGEFDTlc+5I6/nLpk0rzSlMTHQbU3WeWH+
 fIcw==
X-Gm-Message-State: AOAM530ZYsanGavepOfLY/LjqLGkewBdqSHEBvfwh8N+leeRsm06gN5A
 6ZnMf3WKztySltk0AYV0rdjA4lII/Jt6gw==
X-Google-Smtp-Source: ABdhPJzlAfgCrOWAJ1v06XWsYKIuvgfhV4o5Py0eK5JJZq7ePtSniR02RPM3WWFOlIQivTRaS6DXGg==
X-Received: by 2002:a62:6d03:: with SMTP id i3mr50507368pfc.6.1594281437991;
 Thu, 09 Jul 2020 00:57:17 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id l22sm1635744pjq.20.2020.07.09.00.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 00:57:17 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH RESEND 2/2] papr/scm: Add bad memory ranges to nvdimm bad
 ranges
Date: Thu,  9 Jul 2020 13:26:35 +0530
Message-Id: <20200709075635.643740-2-santosh@fossix.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709075635.643740-1-santosh@fossix.org>
References: <20200709075635.643740-1-santosh@fossix.org>
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Oliver <oohall@gmail.com>,
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
index 9c569078a09fd..5ebb1c797795d 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -13,9 +13,11 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/seq_buf.h>
+#include <linux/nd.h>
 
 #include <asm/plpar_wrappers.h>
 #include <asm/papr_pdsm.h>
+#include <asm/mce.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -80,6 +82,7 @@ struct papr_scm_priv {
 	struct resource res;
 	struct nd_region *region;
 	struct nd_interleave_set nd_set;
+	struct list_head region_list;
 
 	/* Protect dimm health data from concurrent read/writes */
 	struct mutex health_mutex;
@@ -91,6 +94,9 @@ struct papr_scm_priv {
 	u64 health_bitmap;
 };
 
+LIST_HEAD(papr_nd_regions);
+DEFINE_MUTEX(papr_ndr_lock);
+
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
@@ -759,6 +765,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	mutex_lock(&papr_ndr_lock);
+	list_add_tail(&p->region_list, &papr_nd_regions);
+	mutex_unlock(&papr_ndr_lock);
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
@@ -766,6 +776,70 @@ err:	nvdimm_bus_unregister(p->bus);
 	return -ENXIO;
 }
 
+static void papr_scm_add_badblock(struct nd_region *region,
+				  struct nvdimm_bus *bus, u64 phys_addr)
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
@@ -866,6 +940,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 {
 	struct papr_scm_priv *p = platform_get_drvdata(pdev);
 
+	mutex_lock(&papr_ndr_lock);
+	list_del(&(p->region_list));
+	mutex_unlock(&papr_ndr_lock);
+
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 	kfree(p->bus_desc.provider_name);
@@ -888,7 +966,25 @@ static struct platform_driver papr_scm_driver = {
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
+return ret;
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
2.26.2

