Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF4F3CB435
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 10:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GR4D46CZBz3cfw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jul 2021 18:29:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eMigb/+h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eMigb/+h; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GR4BF69Yzz309s
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 18:28:05 +1000 (AEST)
Received: by mail-qt1-x82f.google.com with SMTP id r17so6553818qtp.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jul 2021 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qUrP4QoTCQR8l2iwLnjTudvlnGjF3JRrmtcKOvLOyXM=;
 b=eMigb/+hbnh2dGBnlbD76LJ2Dr7FOwy2oIadfCLKGD0T1aYdJypepfilstJd0n6HNO
 m4ijjKBtHsDVZw87cc4BNpKYGUmPwxfOWZvXgUyvHqdJq40F8lXfxhcK+5r3/Ps98nIf
 hjdMAuBtt0nQpxg93/qRy4OGfDbdC6i0Pi6ADsj7jeJ21hj31i0mJW6c+G7/zFBWe1ml
 oUQbqfUEmmfzPrk3W7lsCaqhHb8KsTagpbU9C9levolQZtWHMoYWwU4r3JBqADLYGqIk
 WQhoncKrzXXL06xcBG8fP7YcYRiCOpf7484KXNMXumJ0G7sbiDSAjlY5gJrSoW7SlOm3
 xD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qUrP4QoTCQR8l2iwLnjTudvlnGjF3JRrmtcKOvLOyXM=;
 b=unSM5qEt/5tKrvI1RY566Gp05ARcOXXuaAoWfRkRQCvlnI/tOUmQEIGyAiNmY0UJXe
 HBjV6M3ixqalis6sctPSOvikf6VR56DlqZVzbbr1aP6KdzXgqkw1QI5kTl8TeOBBJkMY
 5EvFegMogQw9OlnMmkzKPkxF/EJ9k90qeEe4aSxCTM+S94CxLr3evQ9h/Ow+wAdcvyTl
 1+V9A0+HrvUtIQQZhnP81+4KQWjhfvZMhG1TqSsITNlnLHJZnzmCKWllKF09QSWzG0eT
 ZkZd3DPKbzC/x3Ueh7uoTXQyLJ4bAQ81j7HECqeDEDqZLPXooWx6anfQ9x7Z9sA124aO
 d28Q==
X-Gm-Message-State: AOAM532+rYGc3zEahfpk9harIPbN4WszLwNPZPLePlX4z8W6KlkMj0n1
 IbbrqRrL52tys4AAWGGa/Lk=
X-Google-Smtp-Source: ABdhPJyb03w2NRFpPVWrL6j1Ohf0onxKemSXngfKd4TuPTI5bYR42ZcAlOIxPk75FFkLVTLQ3fll6w==
X-Received: by 2002:a05:622a:10d:: with SMTP id
 u13mr3357982qtw.369.1626424083146; 
 Fri, 16 Jul 2021 01:28:03 -0700 (PDT)
Received: from LeoBras.redhat.com ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id q199sm3603540qka.112.2021.07.16.01.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:28:02 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 kernel test robot <lkp@intel.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>
Subject: [PATCH v5 03/11] powerpc/pseries/iommu: Add
 iommu_pseries_alloc_table() helper
Date: Fri, 16 Jul 2021 05:27:48 -0300
Message-Id: <20210716082755.428187-4-leobras.c@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210716082755.428187-1-leobras.c@gmail.com>
References: <20210716082755.428187-1-leobras.c@gmail.com>
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

