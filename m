Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0B21A196
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 16:00:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2d8w3ntTzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 00:00:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MD4W0hqE; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2d0F4bMRzDr61
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:52:29 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id q17so856150pls.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tBCPaQKbgaj5mmhVTzxiFOuQFesio3uRVovb2bMOWCs=;
 b=MD4W0hqEA9ow2Dmwc+N+vZaESH5cBKlwVZQqq8ANgMktk0WyT9MamtKv7utY4B+XOG
 9IRtFMZ7gZC76EZE8ID0RIvhlAolqQl3ldbvM4vDPKj9pUb0kdWBn5BMFKcmfNyHvZZl
 feooEQ016Y0jWu0ncPKMUygSqf/TImpkFVK3d5iXJN2O2BtsxLWyfCEaB3UK26A4GcMT
 xbNNO/ChNIDyRyRVDL0B9VcdaafNlnQixXcOwSM/dzdqT/kpe93Qcinp6VRVs14yUGfO
 tfjC3UtjvDSLsCbY/AVXIaeRFDIgxSgakJ64rph3qfV6Bwj1CTIJgBBwUiEiwQ20irxv
 g7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tBCPaQKbgaj5mmhVTzxiFOuQFesio3uRVovb2bMOWCs=;
 b=TJ/cyarXpEA35nnWagixCgyKEpY6hykEm7NeHb7usYL08YXFWCVdio4HdD03V7AwSa
 flPrRZwrVq3Jafi1dy+pegShAaC+or3cIAl1XNhzBbX0ZX36R1kTiO3WMcw8FC0g2lYy
 TsXbgpT++w60YOyf2mlqcJKjqKeliumF30tLVxy7ta66HKYwmPXZHzhdGtkJw1ebCh8C
 F/sDFF1cjNNCNslZMdffMfIrWcV75ZVmOjCfJKlE/pNIfBPCJ5JsxlRRZS1jju37WAnq
 +5AmzFLpp1o7JT82njx3RIRWBwS/00DUtq4zxrnGXlCLZ4piYzJ+xF1jjgLDWAtk5a+3
 m2+A==
X-Gm-Message-State: AOAM533P28u+ffSlFTixD+2Te/Kxd0bi1uKFDBws6OvFYJWBKoZBkz0Q
 xxitIoF39zO8Lz7vYpp815B1HkmXYaU=
X-Google-Smtp-Source: ABdhPJxnlPUrSbpDLFVHeU5U5bnpzcdfm8JT12OAtH3BJ/k8WHkMI7ZFb7p7PxpF/9P25yG7NEdNRw==
X-Received: by 2002:a17:90a:6448:: with SMTP id
 y8mr125758pjm.142.1594302746311; 
 Thu, 09 Jul 2020 06:52:26 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([203.223.190.240])
 by smtp.gmail.com with ESMTPSA id k100sm2878813pjb.57.2020.07.09.06.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 06:52:25 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/2] papr/scm: Add bad memory ranges to nvdimm bad ranges
Date: Thu,  9 Jul 2020 19:21:42 +0530
Message-Id: <20200709135142.721504-2-santosh@fossix.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709135142.721504-1-santosh@fossix.org>
References: <20200709135142.721504-1-santosh@fossix.org>
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
Cc: Oliver <oohall@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Santosh Sivaraj <santosh@fossix.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subscribe to the MCE notification and add the physical address which
generated a memory error to nvdimm bad range.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 9c569078a09fd..90729029ca010 100644
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
@@ -766,6 +776,68 @@ err:	nvdimm_bus_unregister(p->bus);
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
+			(evt->u.ue_error.effective_address & ~PAGE_MASK);
+
+	if (!evt->u.ue_error.physical_address_provided ||
+	    !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
+		return NOTIFY_DONE;
+
+	/* mce notifier is called from a process context, so mutex is safe */
+	mutex_lock(&papr_ndr_lock);
+	list_for_each_entry(p, &papr_nd_regions, region_list) {
+		if (phys_addr >= p->res.start && phys_addr <= p->res.end) {
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
@@ -866,6 +938,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 {
 	struct papr_scm_priv *p = platform_get_drvdata(pdev);
 
+	mutex_lock(&papr_ndr_lock);
+	list_del(&p->region_list);
+	mutex_unlock(&papr_ndr_lock);
+
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 	kfree(p->bus_desc.provider_name);
@@ -888,7 +964,25 @@ static struct platform_driver papr_scm_driver = {
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
2.26.2

