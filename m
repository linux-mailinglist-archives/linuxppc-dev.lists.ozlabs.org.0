Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA01F19A68F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 09:50:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sdfd3W6rzDqfG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 18:50:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IMIbwKSq; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sdc45Rz8zDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 18:48:34 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so9274630plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Apr 2020 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEqQZr6e1uxIRSEdnX6pu8FMPq2PqlpCHD9bDNNqNNc=;
 b=IMIbwKSq2BP10agLRC16hopzkww3qY7luqQlOVPNv4VaHpxCvF/PhP1S8OlGOuPLMY
 gljYxJrI5xvlPkOV78vWuowNeMneUVdOJEtIpdMGf76r2elVHXheT+7GeG42DO5BRxmU
 KhQwu57b3iRopYkop1Abe5oc4CirOFwIijmHnStOxjmMTyAeA/fq+giKEBXIpb2RJQiO
 xy/3a/s2lNG2VWiASxo32cNrwXXO6CHD0VL3IC/JzKuktlWQ5iyT3MLgw8P28KTDqjR6
 CKh/UNI2hkaeS7R4ikndriLS0NsFTV0cc4wLYf0pUpRZommXpwVWkKScaTfq62xRaH6x
 gQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IEqQZr6e1uxIRSEdnX6pu8FMPq2PqlpCHD9bDNNqNNc=;
 b=oZcBz3co1z7KPHD/x1jKZStzZYwG3C7L2RWNzHxBcRzfUoOl0nak5bOj7WdhWbHNqe
 wUJJNW3TACl+/781mf17FlH4w1FR9ZrMLVhKwrBTx5cFk4HqLQxCGQUKMQtkFCiaSF09
 MMkla/xvH48Laq9tO9+LOWcpci4Mz9BijspVpHd40yHtBJCyH9n5/vTfZ/sAiNEbtlaX
 qCT1fHs6ej/BgzUh1Qlhhzf6zS3VppupkIvHaQvD/Xc7v3Ce3mUjJLitBMnz1vYloDjd
 K/XqIkrbdK0vREfenu5KD0g1W9PUWLdBR/pJIEx014/rS0x1x9pNm1vctoVYQTFlJqEN
 RIJg==
X-Gm-Message-State: AGi0Pub7mBLlEdpsVGJX/0FIlZGqfSDAC1kr58a06cis8IaVA4Em/Jbo
 v2BJ1YlDhs/cuh7J66pmPCKFMNUTipA=
X-Google-Smtp-Source: APiQypIm7GTplc3JSQOsrcxczsW+x3ScVphYraMbYkQ5hXDXDF3hLvxZuqDmWbqldwhbj5FgeZ2aVQ==
X-Received: by 2002:a17:90a:3702:: with SMTP id
 u2mr3226693pjb.191.1585727311418; 
 Wed, 01 Apr 2020 00:48:31 -0700 (PDT)
Received: from santosiv.in.ibm.com ([2401:4900:3600:d611:49c7:43f3:6124:cd9e])
 by smtp.gmail.com with ESMTPSA id
 ne16sm954008pjb.11.2020.04.01.00.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 00:48:30 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
Date: Wed,  1 Apr 2020 13:17:41 +0530
Message-Id: <20200401074741.1562361-1-santosh@fossix.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subscribe to the MCE notification and add the physical address which
generated a memory error to nvdimm bad range.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---

This patch depends on "powerpc/mce: Add MCE notification chain" [1].

Unlike the previous series[2], the patch adds badblock registration only for
pseries scm driver. Handling badblocks for baremetal (powernv) PMEM will be done
later and if possible get the badblock handling as a common code.

[1] https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
[2] https://lore.kernel.org/linuxppc-dev/20190820023030.18232-1-santosh@fossix.org/

arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 0b4467e378e5..5012cbf4606e 100644
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
@@ -372,6 +378,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	mutex_lock(&papr_ndr_lock);
+	list_add_tail(&p->region_list, &papr_nd_regions);
+	mutex_unlock(&papr_ndr_lock);
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
@@ -379,6 +389,68 @@ err:	nvdimm_bus_unregister(p->bus);
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
+	mutex_unlock(&papr_ndr_lock);
+
+	if (!found)
+		return NOTIFY_DONE;
+
+	papr_scm_add_badblock(p->region, p->bus, phys_addr);
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block mce_ue_nb = {
+	.notifier_call = handle_mce_ue
+};
+
 static int papr_scm_probe(struct platform_device *pdev)
 {
 	struct device_node *dn = pdev->dev.of_node;
@@ -476,6 +548,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 {
 	struct papr_scm_priv *p = platform_get_drvdata(pdev);
 
+	mutex_lock(&papr_ndr_lock);
+	list_del(&(p->region_list));
+	mutex_unlock(&papr_ndr_lock);
+
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 	kfree(p->bus_desc.provider_name);
@@ -498,7 +574,25 @@ static struct platform_driver papr_scm_driver = {
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
2.25.1

