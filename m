Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5A247B4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 01:56:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVrY36sLtzDqYP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 09:56:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vaoLxBWi; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVrCb6JnqzDqWn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 09:41:15 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id c12so13862747qtn.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6XknbIlnHZrFH1cHJvFSECrSwbxvSnf/0N8RfyO8KRs=;
 b=vaoLxBWiRU+5xIDIFyWITLohlTqhH1HK12fd4foHfW0R0A2F1x9MUJiMAOe+I2072w
 NFIinxYaay6/Lt///o0+Z7IlWSHgX2sqi4pZdFPnv9ooU+5Qo/nf2tL7tPvJujqafjYO
 SPkgj5IIt+W3BpHBIQaDmyA5VklmPYK0rzj/M5fdO35wT5bydG2T0ebUWlKuQQu1c070
 uTcvk3IEYu9e1JAi+G9C+7RHGYzBegWTylY3pA5EZNxPKXq0KirUjq4LQKhO29X/ilDj
 8jVr6ZEDASC4or+gD0OQwmw7N1cjuSX5Y7WVe1v5ZQrrXV7F37s7E9iCAfVkOYFie6MZ
 DfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6XknbIlnHZrFH1cHJvFSECrSwbxvSnf/0N8RfyO8KRs=;
 b=ZssZGw5/GVLQUjCY0vDpr5xZI/GNEK8jEk3XzG1t51NXWrrUCb83Ej5GglcMjbv/53
 5uW4wCkOsmfW2rv/D0Y9cfu5SQHYGsRuyI6Xaojg1GTnZynLslx52hE1ZYFXFRCam+N2
 NM38ajDV8+7EZkRPKskh/ThO76B2hu+VZI2it5QrOnmPPTVHCYvqEWQXiAKhsq3BfGCi
 vCjgA7W8IUHvy0lb5jVVHXZuZKETktWzO0UyOsE+fwzP8Zp+A6vlndE9KDqQxaSPpHQs
 OXUXftp8zqNh5ZFgsTsdAfKGo4DKCD084tS5dEUQtWvTEdxbXWeu8BMdpGlyqN0n7Zi1
 akwA==
X-Gm-Message-State: AOAM531D+g1XuHTL9a0y47wOijY6767h10YcC4v4xSv19wtZGKtE9ywA
 UCT2cq4ZGTkPyzJa+kc2Y2Y=
X-Google-Smtp-Source: ABdhPJy4nBQGtI9lW7HTYYHGQwVb1/Vq3MOjJhto9jz+uRKvO0Omupjbqy2NNQT+LkFwWrPfjw9/9w==
X-Received: by 2002:ac8:104:: with SMTP id e4mr15875453qtg.47.1597707672302;
 Mon, 17 Aug 2020 16:41:12 -0700 (PDT)
Received: from LeoBras.ibmuc.com ([177.35.193.93])
 by smtp.gmail.com with ESMTPSA id w58sm22342868qth.95.2020.08.17.16.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 16:41:11 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Leonardo Bras <leobras.c@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>, Brian King <brking@linux.vnet.ibm.com>,
 Murilo Fossa Vicentini <muvic@linux.ibm.com>,
 David Dai <zdai@linux.vnet.ibm.com>
Subject: [PATCH v1 05/10] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Mon, 17 Aug 2020 20:40:28 -0300
Message-Id: <20200817234033.442511-6-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200817234033.442511-1-leobras.c@gmail.com>
References: <20200817234033.442511-1-leobras.c@gmail.com>
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
---
 arch/powerpc/platforms/pseries/iommu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 8fe23b7dff3a..39617ce0ec83 100644
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
2.25.4

