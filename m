Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 916B3367AA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:10:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpTW3T6Wz3c97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:10:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kWxMvTk4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kWxMvTk4; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpRN0nQZz30H3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:08:15 +1000 (AEST)
Received: by mail-qv1-xf2d.google.com with SMTP id d1so9962109qvy.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYO/WSrJUAQuhWN9PmepPjluMGVj7vrr4kT01MiVYuU=;
 b=kWxMvTk4s6xV02bgiiwW4Vt9R1l9ULpEn1AJ/KlPj6EDJPaBl+d/RsYEJ3tAhzPohH
 DMWRlrW7uST8omMQG5kCdpym7Sun2ZVVH4zV0DbXHqtLEKBl7X47iyhv5g/lw/V8BGwD
 sHn07B/9vH2tR5EatcpiXZngF3wPTfWobyNJhOikyt6s5KHXZKhGNyFGgytCUh/DGfZe
 LCNm3jPwvtKkBSNcnc/nZxG7E4F0vGLEmgAhNc0pJAIGC/mjNZLwnirpGiS9y93OsXEH
 FwSWPSlcOZewRFFMDY4QI20hxsKApRpYc3ysxuUpy1bohfXTiR7poAuJfLN5oa3aNrRm
 M/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYO/WSrJUAQuhWN9PmepPjluMGVj7vrr4kT01MiVYuU=;
 b=lgD2p/pKF9yPaFgWIeL5gfGadsaZKBHdyGbRB64uUvYVKebYwQoLyB64OsUGCglolo
 jyzxZKszs9zhQRRVvQiQqt0fonau236prrOcfz3n18MwFkDb69vSTYDN2JhHNoYIWEaG
 7fV38TWSWluQQ1EtbG+tCqmsDaiJtDixCDyJ/1+jU7jOvTTQK643hgvvKMyLOP7+VWvF
 eGBR1994k1uy1Rzj7aegtSw8vjGSaQWX8+bZXSc24ZTYh38zvITKPnx9N1Fqc82knGyg
 yJncjWQEYD+23l1YzmtkhRCfOK43o/+NmNwKa5Va8yJyjHn+dzHzVO5gySOaCl+7mgo1
 7Gmg==
X-Gm-Message-State: AOAM532PGPvEGqP8iAGEynRzdDVJAE45u4J+cA5yZmX0brrjX0FSq+X7
 OhUfnnSdxXBL8oxN4zY6yCA=
X-Google-Smtp-Source: ABdhPJzlCrT7uAANQ2LSFJPELAJ9m8CfM2/wnmanAuGDDIoGU4hN9JCP/l2I1Fyid5sfe+06ZXVleg==
X-Received: by 2002:a0c:fb43:: with SMTP id b3mr1837220qvq.42.1619075293159;
 Thu, 22 Apr 2021 00:08:13 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id w67sm1658329qkc.79.2021.04.22.00.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:08:12 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v3 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Thu, 22 Apr 2021 04:07:15 -0300
Message-Id: <20210422070721.463912-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210422070721.463912-1-leobras.c@gmail.com>
References: <20210422070721.463912-1-leobras.c@gmail.com>
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
---
 arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 796ab356341c..d02359ca1f9f 100644
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
2.30.2

