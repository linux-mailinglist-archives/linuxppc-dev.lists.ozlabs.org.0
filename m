Return-Path: <linuxppc-dev+bounces-11444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D72B3AC10
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 22:54:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCYYd15VRz2yMh;
	Fri, 29 Aug 2025 06:54:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756414485;
	cv=none; b=nKglbfG20LYpCACYDJlamPPL9kRifT4kEn7Ss5GAtgkT+QXNw8cn4mJVoh7aVsZWd1qVyAxyA04Yqw24/RaLk2Qa9xR4ktW5BhCehxkfrlXH6z1DXgAJi+yXzD123nbFZNZIFsWamMidEpZtWg+9ap8Act9tqPTre51w06VgSj85JTZGOk6kKsK99YtGyzTseu1fVlPUrDTLiyqiJ/OAJjgOar7MBYHh/x8IYx+hou3gOAxhzzWW5Ep9N3DwbGHz/VAtNs+2rc816IxpAQ4CUURqpnnz2FGLzdXngJGD76Xk38F33hsHm/5ogAk3HGCPFxHVrUPJqRaFM7HHGmGwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756414485; c=relaxed/relaxed;
	bh=ywvGPIy8PHl9G1ugzrJfF+cpNToiG/QPV9W1oXZBkHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LddjqGnewPUURqaNcGtnCdvPLcmCTPjqlaQ/d/NbNrMPDE4xH2p7BAuZPP+jSV/OdI4k1YVmL9i7hJ0sVoyBMMWQ5tPV2iKj523duKd0DuhVpr3CG6dxFy4xhM7LsxbViqA6N+9phnFJC3aA3Y4N79xfIJAa9YDIBvwT+rra5gis9QLYxf617qFU36NA2auwLktQaRuF6vacwhsAWU4ZD0TsrIu67kt9hH+Vno3JyvHWqsS0adIn7ZpwbI8FFQC68LbOHeWGGSR9fY1xanM48vTiCucf8TYvuGuGQdf3y/EeTiSA8wqERLnJRBB9Cj28IYp3Y059kX/rYBlFzyeV7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sCjN9TPm; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sCjN9TPm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCYYc2Lxnz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 06:54:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CBC0C60139;
	Thu, 28 Aug 2025 20:54:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF632C4CEEB;
	Thu, 28 Aug 2025 20:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756414481;
	bh=G+6sPUUIFuKNkRdpDGh7oyzJRLExx6mM3Rr0TsrNav4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCjN9TPmsmkv2CErZmw7eY4jhfo/PPQcCij3sdHoAaturic23UjSbV5/eD841QBrO
	 q5lqa5UXldETsQDMVxoOfW90mr401cd2aNU4qwzO6IO/5MHaurrX5r01OojjZShQEf
	 15Kqtld44h3aDOleBeJLOpcwjkQTTYAEhyrx8SC3goTrfnxyjVjHpigzIsE/EQK5r7
	 FqO3qkArHFFA2cKutZwYB5+zz+dbLtckQEfa3MaBKs+Sg/PNA0jXRALMJBXOlqNLWJ
	 BYklmKx3JSZ1NevsWbUBFS2Jp771ITiW6KubcU3EOHWT7p/JyrZiu2Mj04cW80QHY7
	 3fGPgcRndIPdQ==
Date: Thu, 28 Aug 2025 14:54:35 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <aLDCC4rXcIKF8sRg@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
 <aLCpqI-VQ7KeB6DL@kbusch-mbp>
 <20250828191820.GH7333@nvidia.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828191820.GH7333@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 04:18:20PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 28, 2025 at 01:10:32PM -0600, Keith Busch wrote:
> > 
> > Data and metadata are mapped as separate operations. They're just
> > different parts of one blk-mq request.
> 
> In that case the new bit leon proposes should only be used for the
> unmap of the data pages and the metadata unmap should always be
> unmapped as CPU?

The common path uses host allocated memory to attach integrity metadata,
but that isn't the only path. A user can attach their own metadata with
nvme passthrough or the recent io_uring application metadata, and that
could have been allocated from anywhere.

In truth though, I hadn't tried p2p metadata before today, and it looks
like bio_integrity_map_user() is missing the P2P extraction flags to
make that work. Just added this patch below, now I can set p2p or host
memory independently for data and integrity payloads:

---
diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index 6b077ca937f6b..cf45603e378d5 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -265,6 +265,7 @@ int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
 	unsigned int align = blk_lim_dma_alignment_and_pad(&q->limits);
 	struct page *stack_pages[UIO_FASTIOV], **pages = stack_pages;
 	struct bio_vec stack_vec[UIO_FASTIOV], *bvec = stack_vec;
+	iov_iter_extraction_t extraction_flags = 0;
 	size_t offset, bytes = iter->count;
 	unsigned int nr_bvecs;
 	int ret, nr_vecs;
@@ -286,7 +287,12 @@ int bio_integrity_map_user(struct bio *bio, struct iov_iter *iter)
 	}
 
 	copy = !iov_iter_is_aligned(iter, align, align);
-	ret = iov_iter_extract_pages(iter, &pages, bytes, nr_vecs, 0, &offset);
+
+	if (blk_queue_pci_p2pdma(q))
+		extraction_flags |= ITER_ALLOW_P2PDMA;
+
+	ret = iov_iter_extract_pages(iter, &pages, bytes, nr_vecs,
+					extraction_flags, &offset);
 	if (unlikely(ret < 0))
 		goto free_bvec;
 
--

