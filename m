Return-Path: <linuxppc-dev+bounces-11961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F829B4FD01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 15:30:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLl5z5frzz3d4H;
	Tue,  9 Sep 2025 23:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757424551;
	cv=none; b=Xf3okOO+l3nCZO+hXX7s0AfgwLhN7JohpNrtNY55blRnCFLWXlpdXFQ2AXpYEAwZUJhhU2nUncIsQfM5Y7F9kA8OHvu0oxFcIIBCmV1/hqJ9ndFlCXNSPAYmO8+XkjvMAthEEV9TGpdjJbeh61bslBfHsTkzN1CzAv+GP8SIcQ4WRpkfOrKvgAnbCB2+gvUubGguKzpkqySN+a49Bw8xcQyyxIMxECNhdyUUZ0Fa/0XBKR/w+CEnkqedHjRtQU8BNrcbvOv8Dypq499YNVFeVrZFrC+eH4498KGYF4wxBFsShceJ+5GRucfdDNNiI58Lw51YFkrVqeTNhVM1OZD1Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757424551; c=relaxed/relaxed;
	bh=wthMQG/5mxISW1GKlke+e7Nh6K6PI26zWXKnxv2AL9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWVgYu+5Ln9Rih7CkI+hd6BRAk6Rc5fJLrb2LqqELJJdnkNZvwrfXkN6uOMGo8rQE3PE1p2oMhaBtrWvHAnahh/KOUPIwxEwyauTayYSuae14juqpB87il5Q+qgOPMpmRaNG+citCcYz+paCjiRogCzgnfoXtxK6dEkgxdm891H3DGjztnoh0LcNq3UThUE4rCmWMWUo5pwEQSKZgb77iOVTMrIeVsPzT8O2205ouNxxMdXK8g7NwTj86Aar2ngPjkBX26JKybpnTdlyMDmWDNqjxN9Xr5/8LEy/tEG9K95ZmC/16uW4mmfKIu4b+c60v5sSlALSabz6aTkBUzNfPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHwsQe9p; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nHwsQe9p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLl5z1WW5z3d4D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 23:29:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FDB94411F;
	Tue,  9 Sep 2025 13:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74DAC4CEF4;
	Tue,  9 Sep 2025 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757424549;
	bh=jQ3T/brRUziOQrtl/kGVlBSfi2tE0bxT371ZOGgDim4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHwsQe9pTWoBdpjmDo2+n+5/JjBFwg/dIJmlZq+/ndbthLybHRer7dXzwBpSuEQ7i
	 WpgZESFOSYk0vymXIf70Ka4LsYpVS5vQw8F7smlUhzgUae5YWqaRUFJM4IwK3XdPU8
	 nQd69kJNsmstJsXKlBgipLCGMWJfYYqJE2rU2FkxR/cKCJArJmyICbqTFiX7qT52P6
	 bFJt/DsWpz8Ho6ieuoZtZR1VMlsPp35ivfkfFmrDlxi+gYH4TXCDlS/zFwml2ISjyT
	 4kyTMDiyaDIt3S9mhvAvhapMGPAO3w0XKnS9A0uiBpYOSAAbYn+JofRb8t5SlIv8X4
	 Nu/sGhPGyBQ1g==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v6 14/16] block-dma: migrate to dma_map_phys instead of map_page
Date: Tue,  9 Sep 2025 16:27:42 +0300
Message-ID: <0efc4a06258eb1cbedcee642263d8ba24c5e97e6.1757423202.git.leonro@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1757423202.git.leonro@nvidia.com>
References: <cover.1757423202.git.leonro@nvidia.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

After introduction of dma_map_phys(), there is no need to convert
from physical address to struct page in order to map page. So let's
use it directly.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 block/blk-mq-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
index ad283017caef2..37e2142be4f7d 100644
--- a/block/blk-mq-dma.c
+++ b/block/blk-mq-dma.c
@@ -87,8 +87,8 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
 static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
 		struct blk_dma_iter *iter, struct phys_vec *vec)
 {
-	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
-			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
+	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
+			rq_dma_dir(req), 0);
 	if (dma_mapping_error(dma_dev, iter->addr)) {
 		iter->status = BLK_STS_RESOURCE;
 		return false;
-- 
2.51.0


