Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE6846F736
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 00:06:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J98lr59QQz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 10:06:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=Kc7pBU31;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=iKm2mq+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=Kc7pBU31; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=iKm2mq+z; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J98kM4NBSz3053
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:04:42 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id EE8A6580231;
 Thu,  9 Dec 2021 18:04:36 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Dec 2021 18:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding; s=fm2; bh=NSbPeTFmC3VX/ha0W/GXZKCwx7
 d2S9q3uKceYNqXMuU=; b=Kc7pBU31o8EbMxFXphV9zG6IiT+0lU3sHlVTVDJUhN
 838c2vFfjgqO41QJ4mrUwBwF0dYW1pR04fr+sFab8ANkVOEBeq2FrG+3B/SpYjXc
 vrs1yru1XjUF9VtzoCsmTc3YlMaOwP8pd7F8iFWHglZ7uZxIjm7q8dj6KDtaBgYF
 6MYK/MJS8gRNHY8rDq07wKmdQMAP/SRTwYMb2LI5hOCLQZ9iOWw6Or4uXI6recCV
 LkphAh+xx7La0uSVlm03JtVOBKs7YjYo19BDsSEWLLr97ZA3YjXYQYYqGlFRfxcb
 MEKRwha4KpDNRD/fP1U8WBn2UybgF6xuBrCIkCPankfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:reply-to:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NSbPeT
 FmC3VX/ha0W/GXZKCwx7d2S9q3uKceYNqXMuU=; b=iKm2mq+zRARqu6Az24pOud
 6cYie2iC8A2n77TsKaeKbYjyVdUFbvHGVRB/sy5b38R1fHtkxGTXQ58tgWsW2eOV
 NBnoRR1sxESACauibFV6K5D7ass+nLZGPdOpPXsoQ5h9kTesYKp94ZOCLsUC0mmK
 d08HILFUYVE/ExBdrNYAMmNBMN0Mgxvrq0XNr0POOzMZWS0Ht8TDrsw+yMCLqzUK
 daaeGy+yClJcboe60hfEOdDkm8gZ5lxHRVomoOXs7SbGtQx3cP6sqGc+wXFXjv/z
 dv064kjkv+5kpRPO4hqP9Yu+SKqDSwKQaPKzrvNeGJo1qFCu2hv91xKoxEirtbLw
 ==
X-ME-Sender: <xms:hIuyYW7KJ2VGvmwWyftbYGKwWK5HJvCSFmJcGjK5tF1EAOU1NiOcxw>
 <xme:hIuyYf4gLhuzV8STMC4PJkvPi2eNA8vecJ4xHCQIisM3hcF3m2zeF1UyvMQdYjLBg
 Z0szHSqPdFTpxRSUQ>
X-ME-Received: <xmr:hIuyYVeY0KnyI8D_rgHPH8k1jJQ-_Cj2aDK-HWDCitfV9QvSilgzQcaWfMxPKP3kae2Tu-lh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggrnhcu
 oeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeetieeitdejgf
 fhfeeukeejvdeufedtvddulefhteduffeigfefteehgefhvdegudenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:hIuyYTJzxt05EzsOOhpkGX-Qdg3ntRF66l4AebHbDrJ0S27qmDccxQ>
 <xmx:hIuyYaK8WYPLDvA2xw1NU47aotgeBqzt0NNUNsSTBpe9FRmeXlZTSw>
 <xmx:hIuyYUx57W7-ctHGwgaG8T3SVd_sb9nShRzXsMRaaOGHnxLfxB8kmA>
 <xmx:hIuyYcD79eHf97d9tBbwlV2NsHtpEe_KPv6XHDW2Z65FuIIXa_dDcg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Dec 2021 18:04:35 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH v2 0/7] Use pageblock_order for cma and alloc_contig_range
 alignment.
Date: Thu,  9 Dec 2021 18:04:07 -0500
Message-Id: <20211209230414.2766515-1-zi.yan@sent.com>
X-Mailer: git-send-email 2.33.0
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
adjustable at boot time[1].

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
3. splits free pages spanning multiple pageblocks at the beginning and the =
end
   of the range and puts the split pages to the right migratetype free lists
   based on the pageblock migratetypes;
4. returns pages not in the range as it did before this patch.

Isolation needs to happen at MAX_ORDER - 1 granularity, because otherwise
1) extra code is needed to detect pages (free, PageHuge, THP, or PageCompou=
nd)
to make sure all pageblocks belonging to a single page are isolated togethe=
r=20
and later pageblocks outside the range need to have their migratetypes rest=
ored;
or 2) extra logic will need to be added during page free time to split a fr=
ee
page with multi-migratetype pageblocks.

Two optimizations might come later:
1. only check unmovable pages within the range instead of MAX_ORDER - 1 ali=
gned
   range during isolation to increase successful rate of alloc_contig_range=
().
2. make MIGRATE_ISOLATE a separate bit to avoid saving and restoring existi=
ng
   migratetypes before and after isolation respectively.

Feel free to give comments and suggestions. Thanks.


[1] https://lore.kernel.org/linux-mm/20210805190253.2795604-1-zi.yan@sent.c=
om/
[2] https://lore.kernel.org/linux-mm/d19fb078-cb9b-f60f-e310-fdeea1b947d2@r=
edhat.com/


Zi Yan (7):
  mm: page_alloc: avoid merging non-fallbackable pageblocks with others.
  mm: compaction: handle non-lru compound pages properly in
    isolate_migratepages_block().
  mm: migrate: allocate the right size of non hugetlb or THP compound
    pages.
  mm: make alloc_contig_range work at pageblock granularity
  mm: cma: use pageblock_order as the single alignment
  drivers: virtio_mem: use pageblock size as the minimum virtio_mem
    size.
  arch: powerpc: adjust fadump alignment to be pageblock aligned.

 arch/powerpc/include/asm/fadump-internal.h |   4 +-
 drivers/virtio/virtio_mem.c                |   6 +-
 include/linux/mmzone.h                     |  11 +-
 kernel/dma/contiguous.c                    |   2 +-
 mm/cma.c                                   |   6 +-
 mm/compaction.c                            |  10 +-
 mm/migrate.c                               |   8 +-
 mm/page_alloc.c                            | 203 +++++++++++++++++----
 8 files changed, 196 insertions(+), 54 deletions(-)

--=20
2.33.0

