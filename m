Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5373EE6C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 08:42:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GphKs0fQVz3dFG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:42:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TgSGn5ik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TgSGn5ik; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GphHD4KHLz30B7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 16:40:24 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id az7so21978424qkb.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 23:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HyJt6PU8F2AZ27Os2Gh9HToURd99LY2BIrsmeAWc9n0=;
 b=TgSGn5ikHZPvrwUAhmwCeQuflxe6hE3G+KqV+lxzLwtbvh4HUm+5puCcWGjI6Ubwik
 WCRK6pHIgiVdMMbNywWhgoOYdMzV1pyLmACPOBcaV5F8WND/tUItXQRjgLbD8/KD68HQ
 yqEzDaYqg/mw9VjTM8uPUJvSnk0GsVsv/B5SeL9q5ybKPtGvD4fElUoBXvAglx+eV9Wg
 rp6kT9VfZKDul6B6Ju/le7xkoPqVRYqEErjpt2iUZFjyBBEzdTHH6Sc4Vv4uKAjUN2gh
 56r0rRFeSl0ZOsacn+/zTs9GyyfMc4Yy4tfNzm9znGBaB4PMaIx/vWOkhtQbYnkmuuvG
 gMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HyJt6PU8F2AZ27Os2Gh9HToURd99LY2BIrsmeAWc9n0=;
 b=I/6aplPZdetoF8INYP4hM8rA46R+BZ/6dP94S6VXmV0JtmwwNYRAWQv1SVAdOAPc8v
 vLVSq/DOpX0TAT6wEXZlheOd1zj39HshgejqtJXE89nc3P3XG1inEaz7QuIOLd8tCTtb
 dPRpRKvSsR06NvSQOmsYBmXy63U92NK1u+i6ZsJNygcyFXrIi9qkn87EOINFyr77dnQC
 GSjxThnWMrg+goBk8zifXn71R/c8/MoMNO/1n493VN69LDVsmUn1NalWX9jYeOu24TN2
 GIT8i8bvp9qulA27f6p68dmclyH4dDgFXwuJtmGou1SnCAAFf5yf0oSMsL9H7hPpRHTS
 IRvA==
X-Gm-Message-State: AOAM530+CF5usABDs77+veGlvJTl7J0XmNLgCpZI8rc+0nzEeiWT7Qkv
 R1eKXN8Gcp4wZzwSKklFFMg=
X-Google-Smtp-Source: ABdhPJza9EQHzkCG6O0aPqADck/TyFB2k9uIKI0sPsY2xebEkNIodhaDjf6s+I0OqV+cwhaNBoAfEw==
X-Received: by 2002:ae9:dc82:: with SMTP id q124mr2230762qkf.288.1629182421814; 
 Mon, 16 Aug 2021 23:40:21 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:431:c7f0:30b2:5c9e:50:88f3:269a])
 by smtp.gmail.com with ESMTPSA id c11sm526938qth.29.2021.08.16.23.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 23:40:21 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Nicolin Chen <nicoleotsuka@gmail.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH v6 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Tue, 17 Aug 2021 03:39:21 -0300
Message-Id: <20210817063929.38701-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817063929.38701-1-leobras.c@gmail.com>
References: <20210817063929.38701-1-leobras.c@gmail.com>
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

Creates a helper to allow allocating a new iommu_table without the need
to reallocate the iommu_group.

This will be helpful for replacing the iommu_table for the new DMA window,
after we remove the old one with iommu_tce_table_put().

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index b1b8d12bab39..33d82865d6e6 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -53,28 +53,31 @@ enum {
 	DDW_EXT_QUERY_OUT_SIZE = 2
 };
 
-static struct iommu_table_group *iommu_pseries_alloc_group(int node)
+static struct iommu_table *iommu_pseries_alloc_table(int node)
 {
-	struct iommu_table_group *table_group;
 	struct iommu_table *tbl;
 
-	table_group = kzalloc_node(sizeof(struct iommu_table_group), GFP_KERNEL,
-			   node);
-	if (!table_group)
-		return NULL;
-
 	tbl = kzalloc_node(sizeof(struct iommu_table), GFP_KERNEL, node);
 	if (!tbl)
-		goto free_group;
+		return NULL;
 
 	INIT_LIST_HEAD_RCU(&tbl->it_group_list);
 	kref_init(&tbl->it_kref);
+	return tbl;
+}
 
-	table_group->tables[0] = tbl;
+static struct iommu_table_group *iommu_pseries_alloc_group(int node)
+{
+	struct iommu_table_group *table_group;
+
+	table_group = kzalloc_node(sizeof(*table_group), GFP_KERNEL, node);
+	if (!table_group)
+		return NULL;
 
-	return table_group;
+	table_group->tables[0] = iommu_pseries_alloc_table(node);
+	if (table_group->tables[0])
+		return table_group;
 
-free_group:
 	kfree(table_group);
 	return NULL;
 }
-- 
2.32.0

