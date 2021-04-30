Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C29DB36FE99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWyc95jBkz3c1S
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:33:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=r5wG4ZIp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r5wG4ZIp; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyZS72S8z302V
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:32:16 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id q136so50302070qka.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYO/WSrJUAQuhWN9PmepPjluMGVj7vrr4kT01MiVYuU=;
 b=r5wG4ZIp0DghweYrb7BhTEg3Kw1src5C+ZZBqCXlTWE1bZV7bFSh/xbKn1I6HnSmVZ
 Y6BRnXi613ZhHJDDVj96/JeNtkFJb6utsFpxhCCGvpQB2vOXfWEwzrD6UkyBqb6aqTqC
 Z539mxM8+agShzuMop5DKz1Jh+KRUvJrvvBNomfNzxooHM/5rknJd6Rh7PIgvlxf1NYV
 9iP82LDonuG4dacJwqh4Vya58EnUDAjYUIS/y8r+52Ed5Ra2B/7GXC2vberWnLGvzhTS
 81Cp+Ymq20OoFZR+XRfi/zqTpiZshA8PMnbqT/CMp6oLfN7AwCBQ6K0qLSo9FPrSb4XD
 4COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYO/WSrJUAQuhWN9PmepPjluMGVj7vrr4kT01MiVYuU=;
 b=pQ1VE+jYapY09N6mQq5tnwuTi4umn1S3z+1ImXC0ei2kkR7bmLCv7cBuvDcDFaYzsl
 5LFsX0+l2rg7+murTIPpqxqEDBjNR3+OycZLD+bgFp2Ajx6ipdDQGdHBv8UOQj8rcpsR
 JxTj1JTKS8Mqf9XYHfo0CyB+BllYH8HjKUEqe5AhkTKxPcamy5apUestZ8JWPLpRufF5
 /8/gFhw+9+vgP1OcZR1xrh2R/wSzC8dAdl2KKdOi4HBUjsATgnuiwSNuv2riFjraf7mC
 ezzR8fafhkbVydwSJXaEXlMznfuHAGlORrlB6VvzHj3Zz94OevZ132EgtnDARZpf8c0o
 ULOg==
X-Gm-Message-State: AOAM533h0HZEhlocvmD+Yf0XWYXw+i+vBABlB3O99yF4ZspG2rCI8F98
 yfEKoXpSISn8Pk20SqTGP8s=
X-Google-Smtp-Source: ABdhPJzSO3lpl1iJqvmYeVyf7bcnQVMCcwNDY+IHlHL+v09OKq08YVc22NCUBY8t9ef9gScU0RU2KA==
X-Received: by 2002:a37:492:: with SMTP id 140mr6290975qke.161.1619800334473; 
 Fri, 30 Apr 2021 09:32:14 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([2804:14c:482:7b04::1001])
 by smtp.gmail.com with ESMTPSA id p1sm2624334qtu.89.2021.04.30.09.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 09:32:14 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v4 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Fri, 30 Apr 2021 13:31:38 -0300
Message-Id: <20210430163145.146984-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430163145.146984-1-leobras.c@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
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

