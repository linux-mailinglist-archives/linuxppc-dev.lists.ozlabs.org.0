Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DDB45131D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Nov 2021 20:46:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtKSx5Ts8z2yb5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 06:46:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256 header.s=fm2 header.b=Ed1fz5Ur;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=A4kmEJ1u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=sent.com (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=zi.yan@sent.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=sent.com header.i=@sent.com header.a=rsa-sha256
 header.s=fm2 header.b=Ed1fz5Ur; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=A4kmEJ1u; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtKSB1PGfz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 06:46:01 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E184A5805B1;
 Mon, 15 Nov 2021 14:37:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 15 Nov 2021 14:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=from
 :to:cc:subject:date:message-id:reply-to:mime-version
 :content-transfer-encoding; s=fm2; bh=orTWr/BdFPg59h4hngLif2VhgL
 B0bl+rFHZpRRyIkS0=; b=Ed1fz5UrkY2HQYKDvFsL0C7TFBad1qpGnzrhTYEF98
 KYuyT3C6YrqBfrBYHy5ug+pBvAyxQ9UGWT2ebj7Q05NFslhNaL7PQda+4qZi8H4j
 UmX2z3ghjiwLir/83wjyS5DiCKwP1f0PVZsqJ5vC97JLFBZGIC9tgqeyvT8nbAoG
 j15IXPObAN8p5piwWNUyljS9qw1IbngUmC5K5eC9j223Q0beaRbwr7U/UnjbjDj9
 T+UoBHPE2Iyd5z++uBPQ2sVHoVFSnMfTfD5G5LUyv0oLN2Qv1oBvNxOJFHP/vJWh
 ZREZtNLZ+aeqDWNSZ325NYGpEDahpCeefqEXz3idyzKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:reply-to:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=orTWr/
 BdFPg59h4hngLif2VhgLB0bl+rFHZpRRyIkS0=; b=A4kmEJ1ugobNUsOlhtU9Ik
 Vb7h5/Y2ujIFuSMek1uU+5yqMBc4Zk8fQgiFUYIrt1EeSXvzeTWMqOZMgwFbg1jX
 H6CFQswsi6GNSyIfemmH4VETAewa4eEpVybaxyQ5Wkeg+Wi5Es0i9W73AqcEbetT
 YncaPU0a3cxLloc4ujX4Xf/vBA1j51tonN1oD+5b0bdDrIoRi1MhmZ0ELSBuM11G
 w4hcEHpAFl5VRHqnSGTA9Mr5R3bLIl8qnelTsIrcnpHryU7BOKQG6DoOR94mOdkH
 zh++T/Fm0ls+BQmlMwPCffSNO3tQmODoFvG9tE6yVnf1U8X/HepwE8u6EipnVZhw
 ==
X-ME-Sender: <xms:C7eSYVXFk7JmR9-1n-lfZNecRv0L2HfJvcd9GZIEJeaEcwTxkcY5cw>
 <xme:C7eSYVl_h7QJsI-RfFnobMcPfT7N8UNLbsLNZuKe76VIpV9nfWCWWOg9Q-kCQlxbs
 seUqVGwX7mU3oTSXA>
X-ME-Received: <xmr:C7eSYRaHhyU-FxOxc_yzKNnpWM8qbnNEeyNn_Bg_on1LJzAk0pJr1s447nOnDYdGZ6B6AweR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddutddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkfforhgggfestdhqredtredttdenucfhrhhomhepkghiucgjrghn
 uceoiihirdihrghnsehsvghnthdrtghomheqnecuggftrfgrthhtvghrnhepteeiiedtje
 fghfefueekjedvueeftddvudelhfetudffiefgfeetheeghfdvgedunecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpeiiihdrhigrnhesshgvnhhtrdgtohhm
X-ME-Proxy: <xmx:C7eSYYW0PZ-OaD6zFoQJg2937ANlsMaGnaz86EkAFahT-usXJa0ssw>
 <xmx:C7eSYfkeVTrkSW9plAacUahXN7oJnoopoWkV6nDN80Fcwuvfih28oQ>
 <xmx:C7eSYVeChEzqCpejz1a6-1nlYfnXpTIZR_hoK4SVdTUqtd3rZdDfow>
 <xmx:DLeSYYgAbbOso3y3JuXIID0BiejBpUjgP3A8s-Tdof442Ed_vIBzYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 14:37:47 -0500 (EST)
From: Zi Yan <zi.yan@sent.com>
To: David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Subject: [RFC PATCH 0/3] Use pageblock_order for cma and alloc_contig_range
 alignment.
Date: Mon, 15 Nov 2021 14:37:21 -0500
Message-Id: <20211115193725.737539-1-zi.yan@sent.com>
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
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Zi Yan <ziy@nvidia.com>

Hi David,

You suggested to make alloc_contig_range() deal with pageblock_order instea=
d of
MAX_ORDER - 1 and get rid of MAX_ORDER - 1 dependency in virtio_mem[1]. This
patchset is my attempt to achieve that. Please take a look and let me know =
if
I am doing it correctly or not.

From what my understanding, cma required alignment of
max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduce=
d,
__free_one_page() does not prevent merging two different pageblocks, when
MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementati=
on
does prevent that. It should be OK to just align cma to pageblock_order.
alloc_contig_range() relies on MIGRATE_CMA to get free pages, so it can use
pageblock_order as alignment too.

In terms of virtio_mem, if I understand correctly, it relies on
alloc_contig_range() to obtain contiguous free pages and offlines them to r=
educe
guest memory size. As the result of alloc_contig_range() alignment change,
virtio_mem should be able to just align PFNs to pageblock_order.

Thanks.


[1] https://lore.kernel.org/linux-mm/28b57903-fae6-47ac-7e1b-a1dd41421349@r=
edhat.com/

Zi Yan (3):
  mm: cma: alloc_contig_range: use pageblock_order as the single
    alignment.
  drivers: virtio_mem: use pageblock size as the minimum virtio_mem
    size.
  arch: powerpc: adjust fadump alignment to be pageblock aligned.

 arch/powerpc/include/asm/fadump-internal.h |  4 +---
 drivers/virtio/virtio_mem.c                |  6 ++----
 include/linux/mmzone.h                     |  5 +----
 kernel/dma/contiguous.c                    |  2 +-
 mm/cma.c                                   |  6 ++----
 mm/page_alloc.c                            | 12 +++++-------
 6 files changed, 12 insertions(+), 23 deletions(-)

--=20
2.33.0

