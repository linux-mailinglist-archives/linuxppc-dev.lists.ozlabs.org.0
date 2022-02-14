Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4144B58C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 18:42:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyBPk1Qylz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 04:42:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZrqrOMlG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZrqrOMlG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ZrqrOMlG; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZrqrOMlG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyBP51flNz3bYq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 04:41:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644860514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cosw6xv3oQ315iRMA4qLGgG8Dk1NQk9XlhixQZy/TZU=;
 b=ZrqrOMlGHDval7FWSNNDyohQGNsNzV3JpK+Brl9AWRkguJZKfTA5dkAOEHGfSRdKrTV/+U
 MED7+8fgJiwYTk7SW1/zWKWkDtdNNUmIJ2cH/iez6K6utcry4W9tq8KwrwiUJAQtBuAMWl
 GBMjummDUfhkv0G+qCNA9od7HwgCAfY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644860514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cosw6xv3oQ315iRMA4qLGgG8Dk1NQk9XlhixQZy/TZU=;
 b=ZrqrOMlGHDval7FWSNNDyohQGNsNzV3JpK+Brl9AWRkguJZKfTA5dkAOEHGfSRdKrTV/+U
 MED7+8fgJiwYTk7SW1/zWKWkDtdNNUmIJ2cH/iez6K6utcry4W9tq8KwrwiUJAQtBuAMWl
 GBMjummDUfhkv0G+qCNA9od7HwgCAfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-a7Zmw9YHM-GC7OCHCJrwmQ-1; Mon, 14 Feb 2022 12:41:50 -0500
X-MC-Unique: a7Zmw9YHM-GC7OCHCJrwmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A500C1853024;
 Mon, 14 Feb 2022 17:41:46 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F5A17DE56;
 Mon, 14 Feb 2022 17:41:33 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] mm: enforce pageblock_order < MAX_ORDER
Date: Mon, 14 Feb 2022 18:41:30 +0100
Message-Id: <20220214174132.219303-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 David Hildenbrand <david@redhat.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Having pageblock_order >= MAX_ORDER seems to be able to happen in corner
cases and some parts of the kernel are not prepared for it.

For example, Aneesh has shown [1] that such kernels can be compiled on
ppc64 with 64k base pages by setting FORCE_MAX_ZONEORDER=8, which will run
into a WARN_ON_ONCE(order >= MAX_ORDER) in comapction code right during
boot.

We can get pageblock_order >= MAX_ORDER when the default hugetlb size is
bigger than the maximum allocation granularity of the buddy, in which case
we are no longer talking about huge pages but instead gigantic pages.

Having pageblock_order >= MAX_ORDER can only make alloc_contig_range() of
such gigantic pages more likely to succeed.

Reliable use of gigantic pages either requires boot time allcoation or CMA,
no need to overcomplicate some places in the kernel to optimize for corner
cases that are broken in other areas of the kernel.

Let's enforce pageblock_order < MAX_ORDER and simplify.

Especially patch #1 can be regarded a cleanup before:
	[PATCH v5 0/6] Use pageblock_order for cma and alloc_contig_range
	alignment. [2]

[1] https://lkml.kernel.org/r/87r189a2ks.fsf@linux.ibm.com
[2] https://lkml.kernel.org/r/20220211164135.1803616-1-zi.yan@sent.com

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Minchan Kim <minchan@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-mm@kvack.org

David Hildenbrand (2):
  cma: factor out minimum alignment requirement
  mm: enforce pageblock_order < MAX_ORDER

 arch/powerpc/include/asm/fadump-internal.h |  5 ----
 arch/powerpc/kernel/fadump.c               |  2 +-
 drivers/of/of_reserved_mem.c               |  9 ++----
 drivers/virtio/virtio_mem.c                |  9 ++----
 include/linux/cma.h                        |  8 ++++++
 include/linux/pageblock-flags.h            |  7 +++--
 kernel/dma/contiguous.c                    |  4 +--
 mm/Kconfig                                 |  3 ++
 mm/cma.c                                   | 20 ++++----------
 mm/page_alloc.c                            | 32 ++++++----------------
 10 files changed, 37 insertions(+), 62 deletions(-)


base-commit: 754e0b0e35608ed5206d6a67a791563c631cec07
-- 
2.34.1

