Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C53EC954A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:53:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFhq0hWLzDrDY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:52:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="G7q+ko/V"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFCP0R0LzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:30:56 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id v12so2361394pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 19:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/zBKPGADema8PTabkbpcNdo0O0x3dFv15ClNPcc4ZM=;
 b=G7q+ko/V95socZ8BQ6+93qpdNgcQQRNvxxkU96NEhJYiaYxMH6kh4P88CoazoqNu3v
 WXHoTN2QPBgkjYhckgb/2YMGinRoIPxl7NtQS4cw63mQnvp0KpI1yLdn6AaTowtjSX2M
 tzPOZjJxJuEksFBSgKsKzuKvNeglSywR4hIPgBaZrPebvetR9ERPvBMldoEgJ1lyjPKD
 CLk7RZmpk/y3YTcDD4xv+qxIPWt11nUPIENu81V/nGZw8j1psSP6gBraESh9/b0kvk4D
 a4ENMxUJxczyOPBDuVBAUzxBJdgLy5k0ScrXnj7esbsSkxf1q4TOV+fEPowTyO4ThbtM
 cWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/zBKPGADema8PTabkbpcNdo0O0x3dFv15ClNPcc4ZM=;
 b=JFWhXiMQlGkfd2GICmePqDpBlyGGKmcqeoEVwFFXh/89x3GsXX/Yy5/WRuUfaFlRuY
 E4KZFNZTRzzDHdeIldLsZV8KaCUOrKUH/9/0c8eN35UJ/0lc0b1XaEpJwi4G9sYoaT9t
 qVPYHRJIDUpXYWpEgFrfQzQn8J7ZGn1CBFIaePTxEcxDHvSWUPuZjbKcns5tDPb3vFG0
 aEHDe3DV/vp5nBeTfFGHGKgP2wRVlf+dMTYXYgXlX3p32dFssnJcmt4Im+/gw5+I2RE1
 VY9ekuZton/yNyyvpBU/kDfjR0L8MfJLnNCUhO8zp1367gyhn2gvSLfq2Cuwyol9sPoF
 61Ug==
X-Gm-Message-State: APjAAAWWcZKlk7IIANx7mNte3qu5AlMtk0eLXb5iefyNMgn6fRAjxH6e
 Kk3K1jmRxutb0y6cwCK58o8kzP3jyoo=
X-Google-Smtp-Source: APXvYqzxg40A+FEVU2/K7ooPNe3ipm3IKML8wjI50kC1LoBtksSJ9z2q+EUpOs0SU7wDP+saHZKFjg==
X-Received: by 2002:aa7:9ab8:: with SMTP id x24mr26878209pfi.98.1566268253550; 
 Mon, 19 Aug 2019 19:30:53 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id j15sm17609220pfr.146.2019.08.19.19.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 19:30:53 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] papr/scm: Add bad memory ranges to nvdimm bad ranges
Date: Tue, 20 Aug 2019 08:00:30 +0530
Message-Id: <20190820023030.18232-4-santosh@fossix.org>
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
 arch/powerpc/platforms/pseries/papr_scm.c | 86 ++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index a5ac371a3f06..e38f7febc5d9 100644
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
@@ -364,6 +370,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		dev_info(dev, "Region registered with target node %d and online node %d",
 			 target_nid, online_nid);
 
+	mutex_lock(&papr_ndr_lock);
+	list_add_tail(&p->region_list, &papr_nd_regions);
+	mutex_unlock(&papr_ndr_lock);
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
@@ -371,6 +381,57 @@ err:	nvdimm_bus_unregister(p->bus);
 	return -ENXIO;
 }
 
+static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
+			 void *data)
+{
+	struct machine_check_event *evt = data;
+	struct papr_scm_priv *p;
+	u64 phys_addr, aligned_addr;
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
+	mutex_lock(&papr_ndr_lock);
+	list_for_each_entry(p, &papr_nd_regions, region_list) {
+		struct resource res = p->res;
+
+		if (phys_addr >= res.start && phys_addr <= res.end) {
+			found = true;
+			break;
+		}
+	}
+	mutex_unlock(&papr_ndr_lock);
+
+	if (!found)
+		return NOTIFY_DONE;
+
+	aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
+	if (nvdimm_bus_add_badrange(p->bus, aligned_addr, L1_CACHE_BYTES))
+		return NOTIFY_DONE;
+
+	pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
+		 aligned_addr, aligned_addr + L1_CACHE_BYTES);
+
+	nvdimm_region_notify(p->region, NVDIMM_REVALIDATE_POISON);
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
@@ -456,6 +517,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 		goto err2;
 
 	platform_set_drvdata(pdev, p);
+	mce_register_notifier(&mce_ue_nb);
 
 	return 0;
 
@@ -468,6 +530,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 {
 	struct papr_scm_priv *p = platform_get_drvdata(pdev);
 
+	mutex_lock(&papr_ndr_lock);
+	list_del(&(p->region_list));
+	mutex_unlock(&papr_ndr_lock);
+
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
 	kfree(p);
@@ -490,7 +556,25 @@ static struct platform_driver papr_scm_driver = {
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
2.21.0

