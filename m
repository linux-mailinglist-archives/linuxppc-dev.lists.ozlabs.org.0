Return-Path: <linuxppc-dev+bounces-12426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 673E2B8A817
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 18:08:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSy991JGtz3cZp;
	Sat, 20 Sep 2025 02:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758298109;
	cv=none; b=EnCRoeViDv+aPsw5OD5h4phsRFeubuk59NewUfVMfbQjHJ+0LPFV8IZMoMGO1n7VnSHtIN9LtK2X2LvOyM8FktU474tQyooyoK4hGPik+coXfZQm1D2oVeduvb2T+/xiACpfc+Tc5eqicEw4/aW9GYktFuq+WAOKbKInblfr8AngvzAq+heBPascUaBxJrf9BbZ7YVg65iPeGIZQRUe1pxJ2RczMb7l0uVini0ylezMeVpTR5hZzi6aohcIXc83Otq+L4y8+m/S4zfg/zrk7OnRNPxybtX8VNHz8tdjAUK83sMDG4IcaSCVNyAf9NnVgd4VZYcGMO09PzE0tRCFUcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758298109; c=relaxed/relaxed;
	bh=93+iChQy8k9w2vSLxjsMF2tpsbL6StUGENS3z0mFMo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D749yYpjazS1jS8wLCNUUbQMPRe7VvlqpSLZu4SqjrtHR+1HAphnO8h7m47fZJVrTGGY4Vtb8XYC8qaW59oBSuy9TUU1ANecXbNPqLN3a7pQPFtj52ObIGog5gpnVXIDNQxMLBnFd6fLwbA7ztNOIraEclAj45RB4o1FLzsw/2hKM/8bOane1gNRq3RIPu+5pt0jYOK/O/jUMSQzSY4+fbcfvy1pAwY/T1Oy4eFMGb8vQm6QPDso4jPRExLuXC6flBe4gWCWS+TMq26SKqIIt6sVZXIpSzYQkgUCn0an1pN40hFmD+bMbYzZXTxPsYgNWXMobU7zw3x4qwZ1sbtztg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gxcwNWOd; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gxcwNWOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSy980mFnz3cYg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 02:08:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 581BF60140;
	Fri, 19 Sep 2025 16:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C8EC4CEF0;
	Fri, 19 Sep 2025 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758298105;
	bh=KR7+2nE82F6C0RiPmuqmiCYxfBNwhzjUQ6Re6K7PmkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxcwNWOdwyYYCt/Mr4IoNw/QjfiG4fCy9ykIixLtIZgzxpvEaTh0ZrsRzbEkVlnG2
	 m8b1wOyRgj64SHlplGanM4IqWdr6Ywznq35IYlrDTPSiuH1HbSJA9OSV6F3cLQ0fmv
	 gIfqZUpL6QTaZY7lchfgfbbV/HzPQ9GlWuIYB09YAq8LPsugW8lRkDPp3pD3pmqfjH
	 MMDTa/BarqpIPeeM6zxgfbm5MTp42dkz6/ahu8QcAFUE+eO/S+U7a/1bN3BopMvk86
	 +JRB492i+MxOTtI0yVlp8MJ781GY30PjuvtN+/6jEMPcnyQy8X2xhocLeJS5gf/FQl
	 TeUW9JwC+yaOg==
Date: Fri, 19 Sep 2025 10:08:21 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	David Hildenbrand <david@redhat.com>, iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>, kasan-dev@googlegroups.com,
	linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v6 00/16] dma-mapping: migrate to physical address-based
 API
Message-ID: <aM1_9cS_LGl4GFC5@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
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
In-Reply-To: <20250912090327.GU341237@unreal>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > >
> > > This series does the core code and modern flows. A followup series
> > > will give the same treatment to the legacy dma_ops implementation.
> > 
> > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > works fine in linux-next.
> 
> Thanks a lot.

Just fyi, when dma debug is enabled, we're seeing this new warning
below. I have not had a chance to look into it yet, so I'm just
reporting the observation.

 DMA-API: nvme 0006:01:00.0: cacheline tracking EEXIST, overlapping mappings aren't supported
 WARNING: kernel/dma/debug.c:598 at add_dma_entry+0x26c/0x328, CPU#1: (udev-worker)/773
 Modules linked in: acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
 CPU: 1 UID: 0 PID: 773 Comm: (udev-worker) Tainted: G            E    N  6.17.0-rc6-next-20250918-debug #6 PREEMPT(none)
 Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
 pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
 pc : add_dma_entry+0x26c/0x328
 lr : add_dma_entry+0x26c/0x328
 sp : ffff80009fe0f460
 x29: ffff80009fe0f470 x28: 0000000000000001 x27: 0000000000000001
 x26: ffff8000835d7f38 x25: ffff8000835d7000 x24: ffff8000835d7e60
 x23: 0000000000000000 x22: 0000000006e2cc00 x21: 0000000000000000
 x20: ffff800082e8f218 x19: ffff0000a908ff80 x18: 00000000ffffffff
 x17: ffff8000801972a0 x16: ffff800080197054 x15: 0000000000000000
 x14: 0000000000000000 x13: 0000000000000004 x12: 0000000000020006
 x11: 0000000030e4ef9f x10: ffff800083443358 x9 : ffff80008019499c
 x8 : 00000000fffeffff x7 : ffff800083443358 x6 : 0000000000000000
 x5 : 00000000000bfff4 x4 : 0000000000000000 x3 : ffff0000bb005ac0
 x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000bb005ac0
 Call trace:
  add_dma_entry+0x26c/0x328 (P)
  debug_dma_map_phys+0xc4/0xf0
  dma_map_phys+0xe0/0x410
  dma_map_page_attrs+0x94/0xf8
  blk_dma_map_direct.isra.0+0x64/0xb8
  blk_rq_dma_map_iter_next+0x6c/0xc8
  nvme_prep_rq+0x894/0xa98
  nvme_queue_rqs+0xb0/0x1a0
  blk_mq_dispatch_queue_requests+0x268/0x3b8
  blk_mq_flush_plug_list+0x90/0x188
  __blk_flush_plug+0x104/0x170
  blk_finish_plug+0x38/0x50
  read_pages+0x1a4/0x3b8
  page_cache_ra_unbounded+0x1a0/0x400
  force_page_cache_ra+0xa8/0xd8
  page_cache_sync_ra+0xa0/0x3f8
  filemap_get_pages+0x104/0x950
  filemap_read+0xf4/0x498
  blkdev_read_iter+0x88/0x180
  vfs_read+0x214/0x310
  ksys_read+0x70/0x110
  __arm64_sys_read+0x20/0x30
  invoke_syscall+0x4c/0x118
  el0_svc_common.constprop.0+0xc4/0xf0
  do_el0_svc+0x24/0x38
  el0_svc+0x1a0/0x340
  el0t_64_sync_handler+0x98/0xe0
  el0t_64_sync+0x17c/0x180
 ---[ end trace 0000000000000000 ]---


