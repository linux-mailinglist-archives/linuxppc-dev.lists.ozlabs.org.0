Return-Path: <linuxppc-dev+bounces-10574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBCB1A1B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 14:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwbnv31Vcz3bh6;
	Mon,  4 Aug 2025 22:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754311411;
	cv=none; b=L2m/F6VsKYzk1jV4FTgKxqSWBKwG3PRbbZwT7KZbd7aES6AY/H1C3rWXKM6FBFGOChygWvzRp7+zef2yrj04pYRQ5gkECE7MHHBA9ICCOA33heq0pA1TDcyFcmJeh/PEB40aWCjoOXZvOF3Hb+TbbuKHC8mBRHa0fEp22kczbOR4vYUf1fXN8aHUccZrdzC+QabV9oMSc4WAzonMlREhzatl5yAeJKXba14+J0relnGEyX39nq0oBkkKbQMhN4NWROYh34IG5oZeI0MgIxFr/z37THsbSS+4nlSIp9ftLc0QoTWHQNXtKhc1XIS2KC1mPREdNwa6k8DgOSvSDKmj+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754311411; c=relaxed/relaxed;
	bh=f/3vSq9381IaXbqW9OZrKrqA9rxmKdWI6yV8YceURS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFX5k6OFinkh86QCtt1Y4PF0tTO05b7udyTpubO9LuOwHWY8iuw4lgdEpzYbF+gVxHkCUYCSVOdj6WRMQ80rWDOWuepfg1RK+0KPsWEOnLGXUwNGYGF/lHxwHQWoXoaR/4bJrZ4OXjj04NmR991UbxYO+9gzCK0TvEib4rbipkUXcmIjdE1YYcyXCasfVoPOSBIP9YH6TOreu72z+/bos+watSlv5mnMDl3GeXwGCd6jfWtvsuvDmIG/qvMJ6GIeygC5O4jTQUYlxFV/fHWiYakk8xA40gHQa++vBaLiLlD8F4ft3SM394JczVPo75gB/lhGvsLzn/ijUfQ4CMOgzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mACwCJwn; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mACwCJwn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwbnt50WWz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 22:43:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 28A9644938;
	Mon,  4 Aug 2025 12:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96668C4CEF8;
	Mon,  4 Aug 2025 12:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754311409;
	bh=B6ggJVOQfTYMCOE/nJsgZM614saTj7Qtn55LwfqKBMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mACwCJwnciJCEbZnCrkOPhfxhxsK8nNGbFRTcuF/UprHjNhigkEBz4Qjo6q3nOYnE
	 NNEuUiRwpxiJJ+5+lJPFbBh1pz1NHdaolrAAyyFd/BDEth7WPdBMjVzrlmdIaxA3Qb
	 2RsWBm5LtpycB6Eoe6pJbVmXbTVoQjyF0BJrKzZPE5F7UARnqwUUZNfC3023xQAdCk
	 GMv+SVJ7lY8MSINtMTSQNgemwlQgadSRLsUt+7E2s6eroO/rhcn1uAVTTMaXvcyAt7
	 AFjFAFTQV2Ju8uDUJFNXpQWgxbDaQrFpkFb9ltCXITe4mMxj1t62jvARy38KRhJWAk
	 x4Lll22SY+E5Q==
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
Subject: [PATCH v1 01/16] dma-mapping: introduce new DMA attribute to indicate MMIO memory
Date: Mon,  4 Aug 2025 15:42:35 +0300
Message-ID: <f749c597980592ecc7aeb5ecca974c8dfb76f834.1754292567.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1754292567.git.leon@kernel.org>
References: <cover.1754292567.git.leon@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Leon Romanovsky <leonro@nvidia.com>

This patch introduces the DMA_ATTR_MMIO attribute to mark DMA buffers
that reside in memory-mapped I/O (MMIO) regions, such as device BARs
exposed through the host bridge, which are accessible for peer-to-peer
(P2P) DMA.

This attribute is especially useful for exporting device memory to other
devices for DMA without CPU involvement, and avoids unnecessary or
potentially detrimental CPU cache maintenance calls.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 Documentation/core-api/dma-attributes.rst |  7 +++++++
 include/linux/dma-mapping.h               | 14 ++++++++++++++
 include/trace/events/dma.h                |  3 ++-
 rust/kernel/dma.rs                        |  3 +++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
index 1887d92e8e926..91acd2684e506 100644
--- a/Documentation/core-api/dma-attributes.rst
+++ b/Documentation/core-api/dma-attributes.rst
@@ -130,3 +130,10 @@ accesses to DMA buffers in both privileged "supervisor" and unprivileged
 subsystem that the buffer is fully accessible at the elevated privilege
 level (and ideally inaccessible or at least read-only at the
 lesser-privileged levels).
+
+DMA_ATTR_MMIO
+-------------
+
+This attribute is especially useful for exporting device memory to other
+devices for DMA without CPU involvement, and avoids unnecessary or
+potentially detrimental CPU cache maintenance calls.
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 55c03e5fe8cb3..afc89835c7457 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -58,6 +58,20 @@
  */
 #define DMA_ATTR_PRIVILEGED		(1UL << 9)
 
+/*
+ * DMA_ATTR_MMIO - Indicates memory-mapped I/O (MMIO) region for DMA mapping
+ *
+ * This attribute is used for MMIO memory regions that are exposed through
+ * the host bridge and are accessible for peer-to-peer (P2P) DMA. Memory
+ * marked with this attribute is not system RAM and may represent device
+ * BAR windows or peer-exposed memory.
+ *
+ * Typical usage is for mapping hardware memory BARs or exporting device
+ * memory to other devices for DMA without involving main system RAM.
+ * The attribute guarantees no CPU cache maintenance calls will be made.
+ */
+#define DMA_ATTR_MMIO		(1UL << 10)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
diff --git a/include/trace/events/dma.h b/include/trace/events/dma.h
index d8ddc27b6a7c8..ee90d6f1dcf35 100644
--- a/include/trace/events/dma.h
+++ b/include/trace/events/dma.h
@@ -31,7 +31,8 @@ TRACE_DEFINE_ENUM(DMA_NONE);
 		{ DMA_ATTR_FORCE_CONTIGUOUS, "FORCE_CONTIGUOUS" }, \
 		{ DMA_ATTR_ALLOC_SINGLE_PAGES, "ALLOC_SINGLE_PAGES" }, \
 		{ DMA_ATTR_NO_WARN, "NO_WARN" }, \
-		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" })
+		{ DMA_ATTR_PRIVILEGED, "PRIVILEGED" }, \
+		{ DMA_ATTR_MMIO, "MMIO" })
 
 DECLARE_EVENT_CLASS(dma_map,
 	TP_PROTO(struct device *dev, phys_addr_t phys_addr, dma_addr_t dma_addr,
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 2bc8ab51ec280..61d9eed7a786e 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -242,6 +242,9 @@ pub mod attrs {
     /// Indicates that the buffer is fully accessible at an elevated privilege level (and
     /// ideally inaccessible or at least read-only at lesser-privileged levels).
     pub const DMA_ATTR_PRIVILEGED: Attrs = Attrs(bindings::DMA_ATTR_PRIVILEGED);
+
+    /// Indicates that the buffer is MMIO memory.
+    pub const DMA_ATTR_MMIO: Attrs = Attrs(bindings::DMA_ATTR_MMIO);
 }
 
 /// An abstraction of the `dma_alloc_coherent` API.
-- 
2.50.1


