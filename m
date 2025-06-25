Return-Path: <linuxppc-dev+bounces-9739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F99AE843D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:19:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS2Th25qDz307K;
	Wed, 25 Jun 2025 23:19:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750857560;
	cv=none; b=HuUBAGVQam83JywEoqI1YCKF91NZn4zH50YjXcOGfnLIhc04h4XETur7j9w79dAjFHH5zI33YAjkRmzC3Q35gDJOiSNmUlvWzrZc5wXoYEo4evWHVKQsVot5sO+0vy7E0F/bFmNIm/HSSI1S/nM1XD2g10Ai4UxwodqQjqiMfeB6FDO3E3wF8F8SPEF9e/V7N7makImixI6znahTkCtpxZF8ZTrIDygLRKqV/p9yp9NI0iH0zj2M5inYarlAXDw17rpsOhuqDG9LA8wIXG1e39nEzNYL0ZVpptmznN5/5Gfq3H+JH8VMNt8LwwmXJUStSEmhcg0kK5domlFJrhXixA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750857560; c=relaxed/relaxed;
	bh=CP2stCY7T0xSEqK1gjrxM6I4ViVfNBXb5kLK+aDHiy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lvw6tdNOIz/cyNzre5008unL3GZOfV0fV7O3R6mzl7nYyB1sIJMYK37RvmW/HAizpk+HuT6umOgyBbMx+uLBbzNNa1PQi8rSnzxsXjJZK3V5SJpGUtpF4CYhe2GXrht5cQ4qCRwBjOMthWCa1JBxrahZj/O/9+kgu8+7kV59nJKQWIYo1t0A1eKrgNSPg1g+xw65jF/nqQU7LrtgH56Y0nIXCKoKnbQMq5K/KayJHcYKq/e6CAc2C3+AYPhy50uF2oBwoyCWl2gc5B1HdGGmC0fpdU8f7ReoAI9dSMQtQZw/cN8X83OvH19qN34TY/Yn+IttEi6QxwkcWdPKmb0bnQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l10zw3Wd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=l10zw3Wd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bS2Tg2y7bz306l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 23:19:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1C12A5260A;
	Wed, 25 Jun 2025 13:19:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CB0C4CEEF;
	Wed, 25 Jun 2025 13:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750857554;
	bh=x2+9WyiMKk51YbdrrEHH1emdFd89rPiPsvikAZYGQgc=;
	h=From:To:Cc:Subject:Date:From;
	b=l10zw3WdyXEdS9RctXGPVEXxHMOvYtV9GQIdtQEmyQsrO4jkjVzkws3Uvq5/54YKC
	 BWk+L1U7dSr6RPgo1R4HkxtMaD51XQsZVWhcz3kfQaIPgtBG+dHPqgSCNm460cQH3m
	 2hGxhgaSoUU5/cunK9skYGzD0OOpw8n+4wvZBCbCPoNtqZknn8v0E+BKl0w+MyvZYa
	 XMNB3afOwqLGCPStz6Wmqck3EA/fUOYHSMz7BKlUnJa//u0/py1Po/qzjyplclhZcq
	 ZrSyz77b7diqxCv/D8r8QvFup7HF/YiJcjJW6vAfghZqn5Tq1J4odLTaEzz4PJKE6n
	 pcKtlnV78DPoA==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>,
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
Subject: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Date: Wed, 25 Jun 2025 16:18:57 +0300
Message-ID: <cover.1750854543.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
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

This series refactors the DMA mapping to use physical addresses
as the primary interface instead of page+offset parameters. This
change aligns the DMA API with the underlying hardware reality where
DMA operations work with physical addresses, not page structures.

The series consists of 8 patches that progressively convert the DMA
mapping infrastructure from page-based to physical address-based APIs:

The series maintains backward compatibility by keeping the old
page-based API as wrapper functions around the new physical
address-based implementations.

Thanks

Leon Romanovsky (8):
  dma-debug: refactor to use physical addresses for page mapping
  dma-mapping: rename trace_dma_*map_page to trace_dma_*map_phys
  iommu/dma: rename iommu_dma_*map_page to iommu_dma_*map_phys
  dma-mapping: convert dma_direct_*map_page to be phys_addr_t based
  kmsan: convert kmsan_handle_dma to use physical addresses
  dma-mapping: fail early if physical address is mapped through platform
    callback
  dma-mapping: export new dma_*map_phys() interface
  mm/hmm: migrate to physical address-based DMA mapping API

 Documentation/core-api/dma-api.rst |  4 +-
 arch/powerpc/kernel/dma-iommu.c    |  4 +-
 drivers/iommu/dma-iommu.c          | 14 +++----
 drivers/virtio/virtio_ring.c       |  4 +-
 include/linux/dma-map-ops.h        |  8 ++--
 include/linux/dma-mapping.h        | 13 ++++++
 include/linux/iommu-dma.h          |  7 ++--
 include/linux/kmsan.h              | 12 +++---
 include/trace/events/dma.h         |  4 +-
 kernel/dma/debug.c                 | 28 ++++++++-----
 kernel/dma/debug.h                 | 16 ++++---
 kernel/dma/direct.c                |  6 +--
 kernel/dma/direct.h                | 13 +++---
 kernel/dma/mapping.c               | 67 +++++++++++++++++++++---------
 kernel/dma/ops_helpers.c           |  6 +--
 mm/hmm.c                           |  8 ++--
 mm/kmsan/hooks.c                   | 36 ++++++++++++----
 tools/virtio/linux/kmsan.h         |  2 +-
 18 files changed, 159 insertions(+), 93 deletions(-)

-- 
2.49.0


