Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6F8CE89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 10:33:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467jWv07BrzDqpJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 18:32:59 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="hsCkODRS"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467jLx096DzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 18:25:12 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id w2so2327561pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=doBwSsAD5n550j0wAeNEzQq3pHJpgWr3BIC+iue8Opg=;
 b=hsCkODRSbQT24ZvZEC5hhHY54bxANddkq38oYCDDzPGm2r9BErZmuIYf46CXeeolrr
 jeK+DYR9/kqIozk7aaCIFvemMn7NGiLJRennJLM+LafNOMDj/Snfg8hF49dih23vxF8G
 YDOv8dTh39w/amtRDWAQn44HPC3xlk3/VMMTR46zTDIUtUDEVqe5pPmc+KJV/2TVH+dP
 eO5sTVR+kGeyZAb5cd1rhDvS35VFpJIOOVA47Z27y46/RTm7f9dZn0XIfMcqAxOalcK7
 JRb6meOnk3klqryYJ4v7RdByRr6rE5VwypPP6GnAQhpxrI5BAxVRAAVmgidAMbpob6P0
 vrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=doBwSsAD5n550j0wAeNEzQq3pHJpgWr3BIC+iue8Opg=;
 b=lYxZ8gr1/pfriTJGMnfV5LfooXOs+qZZL44sdneB7g4re12Hopum+FnB3SorT6KYN0
 MZjscMoGG0fUsapP+DkkUdyzV6ocuTYuqjqFcrvMboofefO3/o2cswMWFbE4a1HZiGQe
 srZA13xrkU+gCQhHrAE4bZgd1CxwFQz9wSUl2iwC3IPNJ+sVVa8cJMidCnzlbfUhUxyr
 H3JXXeCmMbdnAJTG/MXKZhUiNewetQP5MNjhIeWWkEYvktZ1zZ/+UChYkZEjf6xe32Y2
 JaYDhMRA5QHB5aiJE4HMfAkBZ1YRJoJO6dbBa8QC5XQ53KOkYN6mXgl4t0jK+g/2W8DU
 WPpQ==
X-Gm-Message-State: APjAAAXScVI1RVm04CGmWYRe5vc6v29DcBIpC6kNqOn16IXd3CeVYzVt
 5/GcWbgcFRbrTdRehz44NqFjgnY7tWo=
X-Google-Smtp-Source: APXvYqxmkq2c0pv1FdKwCHHAce2CYmdVDG0My9KxfPvS4tl2QeKg2L+RrKCMr0hiP9R+i+xhrAg88Q==
X-Received: by 2002:a17:90a:9f4a:: with SMTP id
 q10mr6017163pjv.95.1565771110557; 
 Wed, 14 Aug 2019 01:25:10 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.76])
 by smtp.gmail.com with ESMTPSA id y194sm124672463pfg.116.2019.08.14.01.25.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 01:25:10 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] papr/scm: Add bad memory ranges to nvdimm bad ranges
Date: Wed, 14 Aug 2019 13:54:52 +0530
Message-Id: <20190814082452.28013-4-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814082452.28013-1-santosh@fossix.org>
References: <20190814082452.28013-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Chandan Rajendra <chandan@linux.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Subscribe to the MCE notification and add the physical address which
generated a memory error to nvdimm bad range.

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 65 +++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index a5ac371a3f06..4d25c98a9835 100644
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
+	struct list_head list;
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
+	list_add_tail(&p->list, &papr_nd_regions);
+	mutex_unlock(&papr_ndr_lock);
+
 	return 0;
 
 err:	nvdimm_bus_unregister(p->bus);
@@ -371,6 +381,60 @@ err:	nvdimm_bus_unregister(p->bus);
 	return -ENXIO;
 }
 
+static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
+			 void *data)
+{
+	struct machine_check_event *evt = data;
+	struct papr_scm_priv *p;
+	u64 phys_addr;
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
+	list_for_each_entry(p, &papr_nd_regions, list) {
+		struct resource res = p->res;
+		u64 aligned_addr;
+
+		if (res.start > phys_addr)
+			continue;
+
+		if (res.end < phys_addr)
+			continue;
+
+		aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
+		pr_debug("Add memory range (0x%llx -- 0x%llx) as bad range\n",
+			 aligned_addr, aligned_addr + L1_CACHE_BYTES);
+
+		if (nvdimm_bus_add_badrange(p->bus,
+					    aligned_addr, L1_CACHE_BYTES))
+			pr_warn("Failed to add bad range (0x%llx -- 0x%llx)\n",
+				aligned_addr, aligned_addr + L1_CACHE_BYTES);
+
+		nvdimm_region_notify(p->region,
+				     NVDIMM_REVALIDATE_POISON);
+
+		break;
+	}
+	mutex_unlock(&papr_ndr_lock);
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
@@ -456,6 +520,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 		goto err2;
 
 	platform_set_drvdata(pdev, p);
+	mce_register_notifier(&mce_ue_nb);
 
 	return 0;
 
-- 
2.21.0

