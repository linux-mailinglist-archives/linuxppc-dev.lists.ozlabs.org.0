Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FD24C0B1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 05:32:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3NRT50lqz3cTj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:32:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=moTacVGx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Os0hmMfz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=moTacVGx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Os0hmMfz; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3NQ242sRz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 15:30:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42B94580055;
 Tue, 22 Feb 2022 23:30:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 22 Feb 2022 23:30:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=ETC2AAf47GJ+iGkmCj4k43U6GvDQMOzkmXEXAA
 ZFQiE=; b=moTacVGxwQE7c3T9nkxC0XjeIrAoEmvXOQC6Eo3J/3XXfZ26exoKAT
 /QsARQD9yWNIh3jhTbxVulurxuo/F6T30nnZylLM6Dohzj7dnHCSbD4BmmS4zRio
 yR8K4wAJb76Rstdbh1K6WwR4ZE80ibQLj7S0hmS24CPmlcDOUP/MDVVxy1uJkQjA
 BahzsRtK5VLT8eeGTx9Ni+YN+fzMloOa1Vz4jSxEq542dW5ZKPZNB3kT7JVK0+Sl
 BFfBUVn4ESU+tSGh+uQbnlW12UyImkmR30R8Yri7sBxl9/TvLjQmpu+1G1XtQLi9
 taOqjBQzYJmbwvBTR2VcnlETcaOgGKiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
 :sender:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=ETC2AAf47GJ+iGkmCj4k43U6GvDQM
 OzkmXEXAAZFQiE=; b=Os0hmMfzfgNY/B8oGtvV6Jd9ITb3gcMUIKPpKDNXNoU2N
 Cyt23PLwW1ebDpqR9nZ9SshDsT8+3kJXAhllhWPX7d5WRbw1sEy4rKaf/6yuG9SN
 hEcbE+u8GPX/+GWlQa8r7oqN2KAb1S9BdtunW6oAW9NL0T8tz93HGOS8m8zK+Yul
 +cB/OGwzOFvytXnMOhFPyKiLJR/bLQigqfq1UBlWTLah2QmxGA/sH3ypL1HpOkAS
 oJvGmAYN3487umX+YXwjj9xU65Ke57gK03Fa7LOhV+JY1dzmpEetKK1cjzZ/Xv7/
 yhfjSKAXsN4wsyKJEq8NeTVivVednNXUVTEIyD3Qw==
X-ME-Sender: <xms:dLgVYsCpZZWNlf23WFuQPTHx2zdIcIxL0CRuIvWs3Usv9F4RmTiu_A>
 <xme:dLgVYujiwTdRsCBGPK6Mbs1axfLEP3WwlBGFFljGXBj3dIRQrilhVL7b8JtH4jLnr
 CQP5HewyF0xMHDBcA>
X-ME-Received: <xmr:dLgVYvlkqkTJ_Em9cN0jQ66_ZDW5tetVG1hkFpxi-2yhi0DxzzL8HwXZ_iRW5SiTGbowahMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgdejtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofhrggfgsedtqhertdertddtnecuhfhrohhmpegkihcujggrnhcu
 oeiiihdrhigrnhesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeetieeitdejgf
 fhfeeukeejvdeufedtvddulefhteduffeigfefteehgefhvdegudenucffohhmrghinhep
 khgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepiihirdihrghnsehsvghnthdrtghomh
X-ME-Proxy: <xmx:dLgVYiwgtJsC4TTp-NgRiUs4LlTbG2OEF9FvT_y7h4N_dEBfqlnuhw>
 <xmx:dLgVYhT_bC3TztO9W9pyWxBtw8SRE7X240RoPGvzrOO6zUfTkhE9Gw>
 <xmx:dLgVYtYv60Pf2HZz4ovPownyKi1ix78bnmjL1YPXDmVr4DXSS2_U6A>
 <xmx:dbgVYqhDWi2mKIPAZo2N-TZw9MeRB7_ZPObODmzTAaQ0kglhZtI2xQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 23:30:43 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [PATCH v6 0/5] Use pageblock_order for cma and alloc_contig_range
 alignment.
Date: Tue, 22 Feb 2022 23:30:32 -0500
Message-Id: <20220223043037.715205-1-zi.yan@sent.com>
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
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Mike Rapoport <rppt@kernel.org>, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Hi all,

This patchset tries to remove the MAX_ORDER-1 alignment requirement for CMA
and alloc_contig_range(). It prepares for my upcoming changes to make
MAX_ORDER adjustable at boot time[1]. It is on top of mmotm-2022-02-14-17-4=
6.

Changelog
=3D=3D=3D
V6
---
1. Resolved compilation error/warning reported by kernel test robot.
2. Tried to solve the coding concerns from Christophe Leroy.
3. Shortened lengthy lines (pointed out by Christoph Hellwig).

V5
---
1. Moved isolation address alignment handling in start_isolate_page_range().
2. Rewrote and simplified how alloc_contig_range() works at pageblock
   granularity (Patch 3). Only two pageblock migratetypes need to be saved =
and
   restored. start_isolate_page_range() might need to migrate pages in this
   version, but it prevents the caller from worrying about
   max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) alignment after the page ran=
ge
   is isolated.

V4
---
1. Dropped two irrelevant patches on non-lru compound page handling, as
   it is not supported upstream.
2. Renamed migratetype_has_fallback() to migratetype_is_mergeable().
3. Always check whether two pageblocks can be merged in
   __free_one_page() when order is >=3D pageblock_order, as the case (not
   mergeable pageblocks are isolated, CMA, and HIGHATOMIC) becomes more com=
mon.
3. Moving has_unmovable_pages() is now a separate patch.
4. Removed MAX_ORDER-1 alignment requirement in the comment in virtio_mem c=
ode.

Description
=3D=3D=3D

The MAX_ORDER - 1 alignment requirement comes from that alloc_contig_range()
isolates pageblocks to remove free memory from buddy allocator but isolating
only a subset of pageblocks within a page spanning across multiple pagebloc=
ks
causes free page accounting issues. Isolated page might not be put into the
right free list, since the code assumes the migratetype of the first pagebl=
ock
as the whole free page migratetype. This is based on the discussion at [2].

To remove the requirement, this patchset:
1. isolates pages at pageblock granularity instead of
   max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages);
2. splits free pages across the specified range or migrates in-use pages
   across the specified range then splits the freed page to avoid free page
   accounting issues (it happens when multiple pageblocks within a single p=
age
   have different migratetypes);
3. only checks unmovable pages within the range instead of MAX_ORDER - 1 al=
igned
   range during isolation to avoid alloc_contig_range() failure when pagebl=
ocks
   within a MAX_ORDER - 1 aligned range are allocated separately.
4. returns pages not in the range as it did before.

One optimization might come later:
1. make MIGRATE_ISOLATE a separate bit to be able to restore the original
   migratetypes when isolation fails in the middle of the range.

Feel free to give comments and suggestions. Thanks.

[1] https://lore.kernel.org/linux-mm/20210805190253.2795604-1-zi.yan@sent.c=
om/
[2] https://lore.kernel.org/linux-mm/d19fb078-cb9b-f60f-e310-fdeea1b947d2@r=
edhat.com/

Zi Yan (5):
  mm: page_isolation: move has_unmovable_pages() to mm/page_isolation.c
  mm: page_isolation: check specified range for unmovable pages
  mm: make alloc_contig_range work at pageblock granularity
  mm: cma: use pageblock_order as the single alignment
  drivers: virtio_mem: use pageblock size as the minimum virtio_mem
    size.

 drivers/virtio/virtio_mem.c    |   6 +-
 include/linux/cma.h            |   4 +-
 include/linux/mmzone.h         |   5 +-
 include/linux/page-isolation.h |  14 +-
 mm/internal.h                  |   6 +
 mm/memory_hotplug.c            |   3 +-
 mm/page_alloc.c                | 246 +++++++--------------------
 mm/page_isolation.c            | 296 +++++++++++++++++++++++++++++++--
 8 files changed, 367 insertions(+), 213 deletions(-)

--=20
2.34.1

