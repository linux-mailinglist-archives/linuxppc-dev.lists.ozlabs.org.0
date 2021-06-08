Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4EF39F220
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 11:17:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzl4B3ggjz3d5w
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 19:16:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=stUgf4ZU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=stUgf4ZU; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzl155G0kz3byM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 19:14:17 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15D1F61208;
 Tue,  8 Jun 2021 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623143655;
 bh=ABj3dtzcvKeBeFBwlP7EY29yWmF1bk7z4ehtK6n5siY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=stUgf4ZUN/ZjSy3cddYB2cZIaHTQz0UInwhnxlWhOMvCMB3022bIGbC4rI3NrqrM1
 QmLL+dj7le7GZlEIRctc2Holu8sBQ4hBKr4bteOorCCiBykhRXnFqCe5zGJPpsRhNx
 aZ7Yk9zICQGNTe5pituUg0Ba4N2fsfS9qPtf7uH2YMSxoOUzntozTcXnNItAhSKlTD
 U9/aWrwxnhFl721/M+eLG5WZnWTlaajb4bQOcN5cBlcR7fTMpFaJkpCQNR2hBfCift
 xxQCcQDtiZxWODdp0mQ7waEcvJVWzGCOEhvz4CYn53e9Gj8n8Rw/qWs1u1YIGfcTO7
 QsagSKZFkKehA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 7/9] docs: remove description of DISCONTIGMEM
Date: Tue,  8 Jun 2021 12:13:14 +0300
Message-Id: <20210608091316.3622-8-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608091316.3622-1-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Remove description of DISCONTIGMEM from the "Memory Models" document and
update VM sysctl description so that it won't mention DISCONIGMEM.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 12 +++----
 Documentation/vm/memory-model.rst       | 45 ++-----------------------
 2 files changed, 8 insertions(+), 49 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 586cd4b86428..ddbd71d592e0 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -936,12 +936,12 @@ allocations, THP and hugetlbfs pages.
 
 To make it sensible with respect to the watermark_scale_factor
 parameter, the unit is in fractions of 10,000. The default value of
-15,000 on !DISCONTIGMEM configurations means that up to 150% of the high
-watermark will be reclaimed in the event of a pageblock being mixed due
-to fragmentation. The level of reclaim is determined by the number of
-fragmentation events that occurred in the recent past. If this value is
-smaller than a pageblock then a pageblocks worth of pages will be reclaimed
-(e.g.  2MB on 64-bit x86). A boost factor of 0 will disable the feature.
+15,000 means that up to 150% of the high watermark will be reclaimed in the
+event of a pageblock being mixed due to fragmentation. The level of reclaim
+is determined by the number of fragmentation events that occurred in the
+recent past. If this value is smaller than a pageblock then a pageblocks
+worth of pages will be reclaimed (e.g.  2MB on 64-bit x86). A boost factor
+of 0 will disable the feature.
 
 
 watermark_scale_factor
diff --git a/Documentation/vm/memory-model.rst b/Documentation/vm/memory-model.rst
index ce398a7dc6cd..30e8fbed6914 100644
--- a/Documentation/vm/memory-model.rst
+++ b/Documentation/vm/memory-model.rst
@@ -14,15 +14,11 @@ for the CPU. Then there could be several contiguous ranges at
 completely distinct addresses. And, don't forget about NUMA, where
 different memory banks are attached to different CPUs.
 
-Linux abstracts this diversity using one of the three memory models:
-FLATMEM, DISCONTIGMEM and SPARSEMEM. Each architecture defines what
+Linux abstracts this diversity using one of the two memory models:
+FLATMEM and SPARSEMEM. Each architecture defines what
 memory models it supports, what the default memory model is and
 whether it is possible to manually override that default.
 
-.. note::
-   At time of this writing, DISCONTIGMEM is considered deprecated,
-   although it is still in use by several architectures.
-
 All the memory models track the status of physical page frames using
 struct page arranged in one or more arrays.
 
@@ -63,43 +59,6 @@ straightforward: `PFN - ARCH_PFN_OFFSET` is an index to the
 The `ARCH_PFN_OFFSET` defines the first page frame number for
 systems with physical memory starting at address different from 0.
 
-DISCONTIGMEM
-============
-
-The DISCONTIGMEM model treats the physical memory as a collection of
-`nodes` similarly to how Linux NUMA support does. For each node Linux
-constructs an independent memory management subsystem represented by
-`struct pglist_data` (or `pg_data_t` for short). Among other
-things, `pg_data_t` holds the `node_mem_map` array that maps
-physical pages belonging to that node. The `node_start_pfn` field of
-`pg_data_t` is the number of the first page frame belonging to that
-node.
-
-The architecture setup code should call :c:func:`free_area_init_node` for
-each node in the system to initialize the `pg_data_t` object and its
-`node_mem_map`.
-
-Every `node_mem_map` behaves exactly as FLATMEM's `mem_map` -
-every physical page frame in a node has a `struct page` entry in the
-`node_mem_map` array. When DISCONTIGMEM is enabled, a portion of the
-`flags` field of the `struct page` encodes the node number of the
-node hosting that page.
-
-The conversion between a PFN and the `struct page` in the
-DISCONTIGMEM model became slightly more complex as it has to determine
-which node hosts the physical page and which `pg_data_t` object
-holds the `struct page`.
-
-Architectures that support DISCONTIGMEM provide :c:func:`pfn_to_nid`
-to convert PFN to the node number. The opposite conversion helper
-:c:func:`page_to_nid` is generic as it uses the node number encoded in
-page->flags.
-
-Once the node number is known, the PFN can be used to index
-appropriate `node_mem_map` array to access the `struct page` and
-the offset of the `struct page` from the `node_mem_map` plus
-`node_start_pfn` is the PFN of that page.
-
 SPARSEMEM
 =========
 
-- 
2.28.0

