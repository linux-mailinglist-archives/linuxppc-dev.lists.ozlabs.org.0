Return-Path: <linuxppc-dev+bounces-11964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F77B4FD08
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 15:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLl6D6r8Xz3dBn;
	Tue,  9 Sep 2025 23:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757424564;
	cv=none; b=T841YOJDdGnoV4NV8k2AtF3jrz17KZ5pwOUu1iL7f9xU2lTCCqKWVN1SQ4VgYWllNoZHzusv7VSR/tY01Q4kpkZW7jD6pJ5JOv9MgFGDdTW45k8oWEjhm3RASojaM+Hi5Lo69bunVV+h6fHj2G4YZp7G4Q3v6qEdUKuE3FWsIQ+Xs/3NXyji7hhddaAIv/3J7J4a7tPqRG1YuxOjAoB3X0IXgK4AvkyC8G4SPc4DTGeq8wAMbkmFbwAW+DcgiaxtJwYvqCH0BpoWsYy1Ezwz+ZFVXT7JlPq0ZHihmAxnXW7Dy4G4gfKnMiOBqdCylRShlrdEixFqTlPqzBr9wu7laA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757424564; c=relaxed/relaxed;
	bh=a5WY4Vqi9EWQquRRNalN/tM7qFg/VUudcPB5gYO/EeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jg6rz5kzJKlxtttxxH6zAtLh7B2jGdXTJmb9o4KBYrHLjfDsjyYsv1pyCG7aGUZBgqQnaApg6oxDB8p1GATBqC00miXNr5JnTmCp3BcbgA586JjFBqA/YoBYzz+2Z8XytmeCSo66VoEz/dNOALNEztdfKUlDY+Lx3nVX8iYidFQKH56zCw9tcDRXhtMQT0Y0rOrnQ4radi4PBo22L80qHMwSelrwGZ8eDyMJ9La1dJxkET7H6u+OqpdhkzUcEkWVo6pieh5+L6PJhpLTiEe5vgu/jPGxa3Cp+iYxA9iHFgwG9O1vn0m9wSbUSwnxs9l1m4SMPzgY+Y3QlIhy+OQkVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jsG+qsUJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jsG+qsUJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLl6D0T4Fz30DX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 23:29:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B15F6022C;
	Tue,  9 Sep 2025 13:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C94C4CEF5;
	Tue,  9 Sep 2025 13:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757424561;
	bh=iTHTFebdJnIM4qjuR28g9oSbyH9qTLhzazcpZ251F1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jsG+qsUJK7ffZ/z3OPchqA7x0yHguyPrENB1hNDceKyevn8Y0UY23vIlJKogKoOAV
	 mdweaZvTaV73xdPNvzuLcSgBCkcKJinDpA+AFFif7FJFzPv/yP0eacNr7loyHWPJQl
	 oDjSg5lytMZ5QZs3srGmQGs2aZnhiieWxGdijxV8InWTHYLEbMLD5nMB8zsJzQ7Y5/
	 n6m5X6Og8JA73w+GsQKGuK+FDZc8VM+Pv/R0ANeQAPkMSUkS/Z7Crlwiferwk3j/aY
	 bciFy1DVrMp5bQJF6IrE2GwiFytJBqVGnuxPc5FU5fznd5ZzC/Ro1XzYA9SknCnnqK
	 nq4YmMAH6+QaA==
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
Subject: [PATCH v6 16/16] nvme-pci: unmap MMIO pages with appropriate interface
Date: Tue,  9 Sep 2025 16:27:44 +0300
Message-ID: <be35a070a883286f0e401f6746334d84a7a42612.1757423202.git.leonro@nvidia.com>
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

Block layer maps MMIO memory through dma_map_phys() interface
with help of DMA_ATTR_MMIO attribute. There is a need to unmap
that memory with the appropriate unmap function, something which
wasn't possible before adding new REQ attribute to block layer in
previous patch.

Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 drivers/nvme/host/pci.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 2c6d9506b1725..f8ecc0e0f576d 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -682,11 +682,15 @@ static void nvme_free_prps(struct request *req)
 {
 	struct nvme_iod *iod = blk_mq_rq_to_pdu(req);
 	struct nvme_queue *nvmeq = req->mq_hctx->driver_data;
+	unsigned int attrs = 0;
 	unsigned int i;
 
+	if (req->cmd_flags & REQ_MMIO)
+		attrs = DMA_ATTR_MMIO;
+
 	for (i = 0; i < iod->nr_dma_vecs; i++)
-		dma_unmap_page(nvmeq->dev->dev, iod->dma_vecs[i].addr,
-				iod->dma_vecs[i].len, rq_dma_dir(req));
+		dma_unmap_phys(nvmeq->dev->dev, iod->dma_vecs[i].addr,
+				iod->dma_vecs[i].len, rq_dma_dir(req), attrs);
 	mempool_free(iod->dma_vecs, nvmeq->dev->dmavec_mempool);
 }
 
@@ -699,15 +703,19 @@ static void nvme_free_sgls(struct request *req)
 	unsigned int sqe_dma_len = le32_to_cpu(iod->cmd.common.dptr.sgl.length);
 	struct nvme_sgl_desc *sg_list = iod->descriptors[0];
 	enum dma_data_direction dir = rq_dma_dir(req);
+	unsigned int attrs = 0;
+
+	if (req->cmd_flags & REQ_MMIO)
+		attrs = DMA_ATTR_MMIO;
 
 	if (iod->nr_descriptors) {
 		unsigned int nr_entries = sqe_dma_len / sizeof(*sg_list), i;
 
 		for (i = 0; i < nr_entries; i++)
-			dma_unmap_page(dma_dev, le64_to_cpu(sg_list[i].addr),
-				le32_to_cpu(sg_list[i].length), dir);
+			dma_unmap_phys(dma_dev, le64_to_cpu(sg_list[i].addr),
+				le32_to_cpu(sg_list[i].length), dir, attrs);
 	} else {
-		dma_unmap_page(dma_dev, sqe_dma_addr, sqe_dma_len, dir);
+		dma_unmap_phys(dma_dev, sqe_dma_addr, sqe_dma_len, dir, attrs);
 	}
 }
 
-- 
2.51.0


