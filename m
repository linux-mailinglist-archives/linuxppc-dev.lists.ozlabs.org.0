Return-Path: <linuxppc-dev+bounces-9744-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01285AE844F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:20:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS2V56CmPz30Vf;
	Wed, 25 Jun 2025 23:19:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750857581;
	cv=none; b=KOLqxRz3kxw+k2dw7TbF/vuzmbFd/27WXlUhpM2c1BenLlWa/2fKR78h+vbO8c5eZvBrVSOkwjiq/JnlSUL1hvQT14ufo3IaIyFN8qfA5fvQllqzPHeqaALwtUwe1GVvLpZQPxOzgGHhh4JWzyUNliKECCpnrxW7eaDnEnshmM0nysfVT/Fl54bQIxvD22diTIMiLlPKCaZfhgo6Qv22i6JnmW8WqNOx9/6oiIg9Kv9fIcjR1PwDv7zQvD0t0H+tYcUm624MdaCr5V2Afk9ZC8un4O0DeI6wU0U0/eBR8pYyM6RnoDPs+cAMIhgOqh+68pKYigoAg54L3gXg5vMWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750857581; c=relaxed/relaxed;
	bh=yT6++2TGmOpIUKHGdyhEudX+l9ewF2H6ydYa1C4h+jI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGWypjJ4I4I6dynVvKiQ+l1nzZEiYPiQhTEh35kHabhbkdW1MjTd8eBeZpEIfLfwHkt3GbeSy35W32bmWNX5A2+z0vnDf5fj4CfS9+SGTwwBPWba/w7EUxa7Uf4vB/raFR4YxbPxQakZhrLRgDgTnxtBib6eW38HR9mN/VQxD/GiiJ7CtwANUfl+ycCDlEtBVuEBJi1xf8B4pKMHVuskdhzCdFssS1D97MjZEwRFbwa0EXpq8x03MtTUVdEmsHbpgQoiRto7G+2mRHBU6rC1+aWi7suuzWnOf/rSs7tKbuJKs/N2ozhEgl59sh+TPxnRBRWqcJBfBbC3Jrya5eklUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmvSEIY+; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JmvSEIY+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS2V51yzWz30LS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 23:19:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB698A5261A;
	Wed, 25 Jun 2025 13:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C193CC4CEEA;
	Wed, 25 Jun 2025 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857578;
	bh=pv7jnMJTkJVOWVb/twnbCICvjtCn/HJgKS2K42rWa78=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmvSEIY+7ban/csViJFvTitjdhG8lqD1RrM9Bs5vfSX9RUXW8VcItqnFKYK2IHLEp
	 Oj2lQpsBja99AvsQZszqc5HRTCd6sTT2RtsSsG6njLkXmU7qMY7Vv1lVgBzXyQPbYb
	 mwcqp68DZHG0wv/LITtswgnUm5CJOJrlmJA71Izf1q+m6fso9FWpqVFZFJs+E3/PJL
	 bafB00mS656RTCoymMmH42juG8s5ossf9tDfV3oq8Q1fChuX8RreRxr/WBdOxO1x0w
	 XEs/Im4vy1Epw96JlCjF5ya6mj/Q07IUEwpzgcRddZa4ZUr/RT6TslLGklPWGDJsVe
	 KAxqIq8HM4v0Q==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Christoph Hellwig <hch@lst.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev,
	virtualization@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 6/8] dma-mapping: fail early if physical address is mapped through platform callback
Date: Wed, 25 Jun 2025 16:19:03 +0300
Message-ID: <5fc1f0ca52a85834b3e978c5d6a3171d7dd3c194.1750854543.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750854543.git.leon@kernel.org>
References: <cover.1750854543.git.leon@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

All platforms which implement map_page interface don't support physical
addresses without real struct page. Add condition to check it.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 kernel/dma/mapping.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 709405d46b2b..74efb6909103 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -158,6 +158,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 {
 	const struct dma_map_ops *ops = get_dma_ops(dev);
 	phys_addr_t phys = page_to_phys(page) + offset;
+	bool is_pfn_valid = true;
 	dma_addr_t addr;
 
 	BUG_ON(!valid_dma_direction(dir));
@@ -170,8 +171,20 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
 		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
 	else if (use_dma_iommu(dev))
 		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
-	else
+	else {
+		if (IS_ENABLED(CONFIG_DMA_API_DEBUG))
+			is_pfn_valid = pfn_valid(PHYS_PFN(phys));
+
+		if (unlikely(!is_pfn_valid))
+			return DMA_MAPPING_ERROR;
+
+		/*
+		 * All platforms which implement .map_page() don't support
+		 * non-struct page backed addresses.
+		 */
 		addr = ops->map_page(dev, page, offset, size, dir, attrs);
+	}
+
 	kmsan_handle_dma(phys, size, dir);
 	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
 	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
-- 
2.49.0


