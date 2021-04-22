Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB99B367AA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 09:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpTz4d12z3cFp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 17:10:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jUULwv6s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jUULwv6s; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpRS4K6Pz3bTC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 17:08:20 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id u8so33045425qtq.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ijXkh5bc5eEQEAPTsHyC4GzIBhozaiyqx/uWR9aUj2Q=;
 b=jUULwv6sWz6Zkys3P6Wn8srjX65o/R+FGjJ9gVnAxHajP75zVpsQlVdJ5ys7H4fIsV
 viroDkq72TSmyHBFpoV6WN9jxo3FTP7C6hl1Mo9U/X3QBhndnbM1d+WE0JorWTB2WE13
 zWLK4BsXcQTdKw2FC9zw1hPtjjp61IAYVf6LbXR1JV2coNHb9XFZrkkvPjjAZ/9dq3hU
 ZXN/2cdiCwrYKACSQ0KnwMMmPCxGz5IwRQpeOfXBbJnjQNqetVqyf3cpk3s3CnnO8RZc
 wKdQJPISZ6Ht21rEBVmm9D51Kx8eA/wTPsPrdH8GFQImawz0EanM/yu9hrb/IMFEMEYq
 DUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ijXkh5bc5eEQEAPTsHyC4GzIBhozaiyqx/uWR9aUj2Q=;
 b=CYrxAGpZwnefm0/d3AywcWg4cSxJGnAGMuJ+3mU6fxNhuU4DdFXIszeTXauLqAf3AJ
 kpitv/dIeAzWHsiYkLh8o1IeIMva05eNS4QmOsGTo1L6qtvSAoyR0/SF0e6lj6krrq/1
 CVik8XIrJPsPNGi94Ox4zaXwA1aTF+wMSCr1R8ETg+iyEqMwgLh4La0ieIQaNNt4XMfW
 smX2MYETt/GeSonFuYG/NGuwc3kiqvnovEUMRKFCB1pI7aYQXyUckWrCmWTqnFVqFJ4a
 4uq5b//+wcX4gXDVzO6nQw9NpsN9UOVLN5gU8j9zaK0+DGgQf/GvE13xk0UvCD2ymO/S
 Qq7Q==
X-Gm-Message-State: AOAM533iCR+ELbiWDYiK1maaWWE+cDGocRkc13WlyUP2M7NGYM6SGc4c
 jeNSFAP2X43MU5p5WC1qmvY=
X-Google-Smtp-Source: ABdhPJyY3oyj/kkUxMhC8t2SaqN7XMp8wRvulCzFRmh6biO3CezC8nU62gZAIOGM09bNXDTeiABKVg==
X-Received: by 2002:ac8:5a0b:: with SMTP id n11mr1721655qta.381.1619075297815; 
 Thu, 22 Apr 2021 00:08:17 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com.com
 ([177.35.200.187])
 by smtp.gmail.com with ESMTPSA id w67sm1658329qkc.79.2021.04.22.00.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 00:08:17 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Leonardo Bras <leobras.c@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [PATCH v3 04/11] powerpc/pseries/iommu: Add ddw_list_new_entry()
 helper
Date: Thu, 22 Apr 2021 04:07:16 -0300
Message-Id: <20210422070721.463912-5-leobras.c@gmail.com>
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

There are two functions creating direct_window_list entries in a
similar way, so create a ddw_list_new_entry() to avoid duplicity and
simplify those functions.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/platforms/pseries/iommu.c | 32 +++++++++++++++++---------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index d02359ca1f9f..6f14894d2d04 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -870,6 +870,21 @@ static u64 find_existing_ddw(struct device_node *pdn, int *window_shift)
 	return dma_addr;
 }
 
+static struct direct_window *ddw_list_new_entry(struct device_node *pdn,
+						const struct dynamic_dma_window_prop *dma64)
+{
+	struct direct_window *window;
+
+	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	if (!window)
+		return NULL;
+
+	window->device = pdn;
+	window->prop = dma64;
+
+	return window;
+}
+
 static int find_existing_ddw_windows(void)
 {
 	int len;
@@ -882,18 +897,15 @@ static int find_existing_ddw_windows(void)
 
 	for_each_node_with_property(pdn, DIRECT64_PROPNAME) {
 		direct64 = of_get_property(pdn, DIRECT64_PROPNAME, &len);
-		if (!direct64)
-			continue;
-
-		window = kzalloc(sizeof(*window), GFP_KERNEL);
-		if (!window || len < sizeof(struct dynamic_dma_window_prop)) {
-			kfree(window);
+		if (!direct64 || len < sizeof(*direct64)) {
 			remove_ddw(pdn, true);
 			continue;
 		}
 
-		window->device = pdn;
-		window->prop = direct64;
+		window = ddw_list_new_entry(pdn, direct64);
+		if (!window)
+			break;
+
 		spin_lock(&direct_window_list_lock);
 		list_add(&window->list, &direct_window_list);
 		spin_unlock(&direct_window_list_lock);
@@ -1303,7 +1315,7 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 	dev_dbg(&dev->dev, "created tce table LIOBN 0x%x for %pOF\n",
 		  create.liobn, dn);
 
-	window = kzalloc(sizeof(*window), GFP_KERNEL);
+	window = ddw_list_new_entry(pdn, ddwprop);
 	if (!window)
 		goto out_clear_window;
 
@@ -1322,8 +1334,6 @@ static u64 enable_ddw(struct pci_dev *dev, struct device_node *pdn)
 		goto out_free_window;
 	}
 
-	window->device = pdn;
-	window->prop = ddwprop;
 	spin_lock(&direct_window_list_lock);
 	list_add(&window->list, &direct_window_list);
 	spin_unlock(&direct_window_list_lock);
-- 
2.30.2

