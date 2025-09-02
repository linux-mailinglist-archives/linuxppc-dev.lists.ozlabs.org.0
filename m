Return-Path: <linuxppc-dev+bounces-11632-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 501CBB407BD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 16:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGTDS3jMNz30VZ;
	Wed,  3 Sep 2025 00:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756824600;
	cv=none; b=nmqN6Nelwv5G+8MjxBhv+mTxeswIRLUTe5G0VYAYy0WhgZXLWoglXnzUh5tFcBKWPWPneFCrPGuPwDFL/5H13cGPRAeixrdIss6mLRuFnosQjfoGkkx7pe6SNGH7UMbm8kdXfSOtrmgoPDv5zbSFSfBgCpKIgOzjlVd3eIipHqNt/LXUxtrPOFI4a9QGNpHcnA0lJ7RXjtZU5G/tWazBsF2e/uSu2np9bzjE5UDNxt8KRZJvY1bARTa9ApVOK1vpvZ2WEbPtpZYxpbD66fV6ewG2Nw26o4dBuqCQAnTE4Y34eeKzby0g2V7bMOvqaI/aRxM3yzqkLG2cIV2cHac7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756824600; c=relaxed/relaxed;
	bh=P+KXvB+QEcDzAMb/9fx1ro7jFsDuULFhvrraHykz/N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcA17ttMDcyLdOfaM5U5LQmhYNR6WIsav3Zuvk15rC7zDIrNbQuFA567a0mFqNfRMYSA92WoF0uHqeLWG0goRDjl3LboNh3bkNjj4OY7d9H+dLyA7ZZXE7xF/+l5bzUPY0Sr+B6s3WDyBE0c4PnbHhS73z0raUR1N5Jyt+7zfQBFv19LfTyHs+e7vom+QScqSbdV8GrUCERNEz/KZPeW+15aBnyEAqMOmwKm2K5YzaPAZNbLfEGc7iL+fEGDWdOAPiya+C3atE7x23lhuFadb1JTdIDsCjpf3OJjwvxsNwYIeeWxqrcjsBKD9gm6Vy/3bBz2bHJfu4nR87lPcdgshA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eiIBn3T8; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eiIBn3T8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGTDR5H0jz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 00:49:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E282C6021C;
	Tue,  2 Sep 2025 14:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E4CC4CEED;
	Tue,  2 Sep 2025 14:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756824597;
	bh=/+yFJK+B9QWHuc4E4Qjbxe4FKpOF4Mx7ckvNMqksRwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eiIBn3T8WJVWsk3+I+fWd3PcxI0MCgzuCoUFUQ6X0tpaWBWbgKoyqfqOHBiWDIDiz
	 8p2HzbdfWqrQ60dofPqEdpLkK9IHTbg+v0SJZIYuCE/Og1VxxZlScreKdr1eSpD3sv
	 /lx+bgPY7bT+Oe8q5/ipZoWvP5MZL/8U72Kogd0uDRyxsAmDtlwDjYXaLUb/vJvMBs
	 v49CTWymtxxZQxWHK2HkfHOmNrocouCJRvv5qbRPaGPjvko9idbzbdGVkH62OwjqKI
	 vcrbLiVodBbFcdGUzIrgeZ2fajxcWR0pq3lieMm1b99+a2xYHhXEQceE1aYKlKJK7C
	 vmv2Md05FkfjQ==
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
Subject: [PATCH v5 10/16] xen: swiotlb: Open code map_resource callback
Date: Tue,  2 Sep 2025 17:48:47 +0300
Message-ID: <7e3225a24df41b483d60d87450b610b399bc15ca.1756822782.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756822782.git.leon@kernel.org>
References: <cover.1756822782.git.leon@kernel.org>
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

General dma_direct_map_resource() is going to be removed
in next patch, so simply open-code it in xen driver.

Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/xen/swiotlb-xen.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index da1a7d3d377c..dd7747a2de87 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -392,6 +392,25 @@ xen_swiotlb_sync_sg_for_device(struct device *dev, struct scatterlist *sgl,
 	}
 }
 
+static dma_addr_t xen_swiotlb_direct_map_resource(struct device *dev,
+						  phys_addr_t paddr,
+						  size_t size,
+						  enum dma_data_direction dir,
+						  unsigned long attrs)
+{
+	dma_addr_t dma_addr = paddr;
+
+	if (unlikely(!dma_capable(dev, dma_addr, size, false))) {
+		dev_err_once(dev,
+			     "DMA addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
+			     &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);
+		WARN_ON_ONCE(1);
+		return DMA_MAPPING_ERROR;
+	}
+
+	return dma_addr;
+}
+
 /*
  * Return whether the given device DMA address mask can be supported
  * properly.  For example, if your device can only drive the low 24-bits
@@ -426,5 +445,5 @@ const struct dma_map_ops xen_swiotlb_dma_ops = {
 	.alloc_pages_op = dma_common_alloc_pages,
 	.free_pages = dma_common_free_pages,
 	.max_mapping_size = swiotlb_max_mapping_size,
-	.map_resource = dma_direct_map_resource,
+	.map_resource = xen_swiotlb_direct_map_resource,
 };
-- 
2.50.1


