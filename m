Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F2485B0A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 22:49:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JTjnR5HHhz3bTT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 08:49:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=uXAApkQx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=HvGpC6u6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=uXAApkQx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=HvGpC6u6; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JTjlw6DnBz2xXW
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 08:48:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F36858050E;
 Wed,  5 Jan 2022 16:48:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 05 Jan 2022 16:48:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding; s=fm2; bh=XuWtzwLjwrz+Pbdt4BURzbEzIj
 SMHmc6+71DP0kr+2E=; b=uXAApkQxB/AHFvFh1fVn4pkg+KKcnsaui9GQg+9dH2
 SFYnWmEe/ldaxJywT/GwaCyzOGCO7m3X3o7M2ae4OZ5FwshRwxYqmF2HHcYSBN+l
 9cN0zSWwU+iJgj48GoYpZARjxLtIxBz/MEaf4nXDalkH9VxbNETon9AOq2B6V5Yn
 R8ua7i82K3DpMMPVPOF/w6LsKrCuyc6TjyNOvKROMMETe9xzLO5cC3Ffps0owCmH
 QYsGLqdUmE4xmYJmg2PhMyrjcINl8V8GMjpIKvOphS/M1lNkpn6mljULn5plg5Iq
 noSas0MQqxTl2XI75bT9fLaUwmm2bgOM6d0/rSYCDrow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:reply-to:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=XuWtzw
 Ljwrz+Pbdt4BURzbEzIjSMHmc6+71DP0kr+2E=; b=HvGpC6u6DuKlQgEP1Gev3q
 Rgt0hQDTeg3WsXqtwHcudSdbaKQu8JDpLAweDlFjaFqFA7lBZ/9bDgR795dTixy1
 f7V42zwWZwyXcowz+luRUA+bGINa/MWHjF86ilacqzjFnEC+fuqbVISuOs6o3llr
 KHjupyMVFFsCrGDqF96lDXqj2pt/0rnU+UBL3KtG+8VkyeP4l1hjavc8D11hjFy8
 zY+IhJp6cdJJxerPIaHnBgnoxlLPg5S12HwGq8A/So6NCYMGFgywYRAJ56G4DFsE
 zMSvfMWf6lZgS8RlKZvtuQs77mBhI1iFNJO38LfEOHPApe271dGpBTxzAZKPzi8g
 ==
X-ME-Sender: <xms:JhLWYVKXz0XA-qpUi52ORQJ3b_vlMtwapPHJBVHKj_u8hnWMqZtHDw>
 <xme:JhLWYRI25R7Exx_bhZKo2mRzyd3q9dVvcisZIUCr31t90YK1E4xvbWaGsmUPpj_de
 BJetflZTamAnZXawQ>
X-ME-Received: <xmr:JhLWYduJJIK6sAiI5lQNR2rS0BCbdvheZt-9dhfIDkum0PZ9kGFM9vJpYTRMPYLLxXF9xtHR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudefjedgieekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkfforhgggfestdhqredtredttdenucfhrhhomhepkghiucgjrghn
 uceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepteeiiedtje
 fghfefueekjedvueeftddvudelhfetudffiefgfeetheeghfdvgedunecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpeiiihdrhigrnhesshgvnhhtrdgtohhm
X-ME-Proxy: <xmx:JhLWYWbgMIL6YDHpejS7gaz3xF3GYtJHhXnUYyFsNUqmiljYKpIE3Q>
 <xmx:JhLWYcbztubtuPOSHETmw9gpNOrWQHFUkEEHVSpmQ4TOAFs0hRhHMw>
 <xmx:JhLWYaBLWIq4Yx8-4V6VLWCHmTnK9L_CQAWAl-5CipObOrjm1hOrNA>
 <xmx:JxLWYYT6deCytecTH9xSlMQ4YWXiP-dvNcZMaqJzj3Q7ESFepFN1pw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Jan 2022 16:48:21 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v3 0/8] Use pageblock_order for cma and alloc_contig_range
 alignment.
Date: Wed,  5 Jan 2022 16:47:48 -0500
Message-Id: <20220105214756.91065-1-zi.yan@sent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: Mel Gorman <mgorman@techsingularity.net>, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Hi all,

This patchset tries to remove the MAX_ORDER - 1 alignment requirement for C=
MA
and alloc_contig_range(). It prepares for my upcoming changes to make MAX_O=
RDER
adjustable at boot time[1]. It is on top of mmotm-2021-12-29-20-07.

The MAX_ORDER - 1 alignment requirement comes from that alloc_contig_range()
isolates pageblocks to remove free memory from buddy allocator but isolating
only a subset of pageblocks within a page spanning across multiple pagebloc=
ks
causes free page accounting issues. Isolated page might not be put into the
right free list, since the code assumes the migratetype of the first pagebl=
ock
as the whole free page migratetype. This is based on the discussion at [2].

To remove the requirement, this patchset:
1. still isolates pageblocks at MAX_ORDER - 1 granularity;
2. but saves the pageblock migratetypes outside the specified range of
   alloc_contig_range() and restores them after all pages within the range
   become free after __alloc_contig_migrate_range();
3. only checks unmovable pages within the range instead of MAX_ORDER - 1 al=
igned
   range during isolation to avoid alloc_contig_range() failure when pagebl=
ocks
   within a MAX_ORDER - 1 aligned range are allocated separately.
3. splits free pages spanning multiple pageblocks at the beginning and the =
end
   of the range and puts the split pages to the right migratetype free lists
   based on the pageblock migratetypes;
4. returns pages not in the range as it did before.

Isolation needs to be done at MAX_ORDER - 1 granularity, because otherwise
either 1) it is needed to detect to-be-isolated page size (free, PageHuge, =
THP,
or other PageCompound) to make sure all pageblocks belonging to a single pa=
ge
are isolated together and later restore pageblock migratetypes outside the
range, or 2) assuming isolation happens at pageblock granularity, a free pa=
ge
with multi-migratetype pageblocks can seen in free page path and needs
to be split and freed at pageblock granularity.

One optimization might come later:
1. make MIGRATE_ISOLATE a separate bit to avoid saving and restoring existi=
ng
   migratetypes before and after isolation respectively.

Feel free to give comments and suggestions. Thanks.


[1] https://lore.kernel.org/linux-mm/20210805190253.2795604-1-zi.yan@sent.c=
om/
[2] https://lore.kernel.org/linux-mm/d19fb078-cb9b-f60f-e310-fdeea1b947d2@r=
edhat.com/

Zi Yan (8):
  mm: page_alloc: avoid merging non-fallbackable pageblocks with others.
  mm: compaction: handle non-lru compound pages properly in
    isolate_migratepages_block().
  mm: migrate: allocate the right size of non hugetlb or THP compound
    pages.
  mm: make alloc_contig_range work at pageblock granularity
  mm: page_isolation: check specified range for unmovable pages during
    isolation.
  mm: cma: use pageblock_order as the single alignment
  drivers: virtio_mem: use pageblock size as the minimum virtio_mem
    size.
  arch: powerpc: adjust fadump alignment to be pageblock aligned.

 arch/powerpc/include/asm/fadump-internal.h |   4 +-
 drivers/virtio/virtio_mem.c                |   3 +-
 include/linux/mmzone.h                     |  11 +-
 include/linux/page-isolation.h             |   3 +-
 kernel/dma/contiguous.c                    |   2 +-
 mm/cma.c                                   |   6 +-
 mm/compaction.c                            |  10 +-
 mm/memory_hotplug.c                        |  12 +-
 mm/migrate.c                               |  11 +-
 mm/page_alloc.c                            | 328 +++++++++++----------
 mm/page_isolation.c                        | 148 +++++++++-
 11 files changed, 353 insertions(+), 185 deletions(-)

--=20
2.34.1

