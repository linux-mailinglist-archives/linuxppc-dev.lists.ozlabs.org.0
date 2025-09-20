Return-Path: <linuxppc-dev+bounces-12483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF739B8CC48
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 17:54:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTYp13jXbz2ysc;
	Sun, 21 Sep 2025 01:54:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758383641;
	cv=none; b=WrLJDHxzRvBElSOdTppTr14mqFsVu4Kx+ugWvYMtX6CZK9/bEKilAzhW1zgR/TtsCEAjNC7cz7yIqsTqfBolXvAiA8vOl9NA0kUTci7oXcsHLHOj0DYC1HR8QYEdoDMPxau5eVLtEhixGdKXW2dDxLirOXYOOTL0+0VxGDiaXJuEg6wrdxkkNFkiHLpNr5clcG1BnzPLMh3Id12gt6oD8mf9VJUTsYQYENXEizTlCBNSXgpfMqIY/AzdmxWsEjtuiAbaD5UQAtcxu+jJjZjHzIGbGhHoqChEsJl4SY6nIxInJARzf1YicIcEMxP65EYSJETmsAKMzxY9Q3q23FIqXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758383641; c=relaxed/relaxed;
	bh=06Hpa/1OvoT0TpifdUKNOv9vBuePkD3RG427WbWRUJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPjylkTaj4NpVqfAIH/zUZtZbeYUhOh5E9Yg7TANo24vJ9W4T9UKqMIX2UhmDtb7smTA8mczHD1vGFuIxPIuhf9qqA3ia/dHFZZNanK39bcn9/VjcS4DEh38Z8Ok/jJN7ncmq/z88dCnGlzXqboFPifcq5esW78xVdOLE7zZxVFOOqdEDCqWhXx/PJpHMVDeiAwIiNs2NA6Q2JyLZVmEQe+n5qg6cuGZmcT7L0M3mqt/nTPK72tQJagjiN7ZILzQYwluozVEqmOUiYx1xGwUO87v2UdSXuL/TwEapytRpfi0wsOoUWULVyDEzIxf1uKajQJvbIHHAY/FvdyT94FUFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbW+7cTt; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbW+7cTt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTYp03Dzxz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 01:54:00 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48CFD6014D;
	Sat, 20 Sep 2025 15:53:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60277C4CEEB;
	Sat, 20 Sep 2025 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758383637;
	bh=74lAPVg94TJI1UJYgpgsOH2UQdl5PvTbgBIsxqD4zKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qbW+7cTtf3ZC80yzIDcC6P8YiS7RGpwlDTYrGzG6j13dnssuecjvDInjgO1NGXAWT
	 hwAQh0KbTGofBujeWDAzo8uyHyjnB4klpbdUcdr3KuR2vqLH1ociavVauQR6s6LM4C
	 wtVOvrFkt2iXYZs5fqCArx+bz0wZR2AOL0I2MwUCesz5LxbYvHr8I0E7tiQwcKX2mh
	 /6u8BUT9rHwxjmbaoEZQ7oL93zaaJmT1SbIoB4zqQPQjKbmP8WBwznCmHZDgor62TB
	 Nrccq2E0zXdIiG+Jydr5UoWaXp7Rok6i3H1DFwLNWMk9eGO4TL+3lE8Pzt1MNtveO6
	 UwT9ZhNinKNOQ==
Date: Sat, 20 Sep 2025 18:53:52 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Keith Busch <kbusch@kernel.org>
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
Message-ID: <20250920155352.GH10800@unreal>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
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
In-Reply-To: <aM1_9cS_LGl4GFC5@kbusch-mbp>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 19, 2025 at 10:08:21AM -0600, Keith Busch wrote:
> On Fri, Sep 12, 2025 at 12:03:27PM +0300, Leon Romanovsky wrote:
> > On Fri, Sep 12, 2025 at 12:25:38AM +0200, Marek Szyprowski wrote:
> > > >
> > > > This series does the core code and modern flows. A followup series
> > > > will give the same treatment to the legacy dma_ops implementation.
> > > 
> > > Applied patches 1-13 into dma-mapping-for-next branch. Let's check if it 
> > > works fine in linux-next.
> > 
> > Thanks a lot.
> 
> Just fyi, when dma debug is enabled, we're seeing this new warning
> below. I have not had a chance to look into it yet, so I'm just
> reporting the observation.

Did you apply all patches or only Marek's branch?
I don't get this warning when I run my NVMe tests on current dmabuf-vfio branch.

Thanks

> 
>  DMA-API: nvme 0006:01:00.0: cacheline tracking EEXIST, overlapping mappings aren't supported
>  WARNING: kernel/dma/debug.c:598 at add_dma_entry+0x26c/0x328, CPU#1: (udev-worker)/773
>  Modules linked in: acpi_power_meter(E) loop(E) efivarfs(E) autofs4(E)
>  CPU: 1 UID: 0 PID: 773 Comm: (udev-worker) Tainted: G            E    N  6.17.0-rc6-next-20250918-debug #6 PREEMPT(none)
>  Tainted: [E]=UNSIGNED_MODULE, [N]=TEST
>  pstate: 63400009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
>  pc : add_dma_entry+0x26c/0x328
>  lr : add_dma_entry+0x26c/0x328
>  sp : ffff80009fe0f460
>  x29: ffff80009fe0f470 x28: 0000000000000001 x27: 0000000000000001
>  x26: ffff8000835d7f38 x25: ffff8000835d7000 x24: ffff8000835d7e60
>  x23: 0000000000000000 x22: 0000000006e2cc00 x21: 0000000000000000
>  x20: ffff800082e8f218 x19: ffff0000a908ff80 x18: 00000000ffffffff
>  x17: ffff8000801972a0 x16: ffff800080197054 x15: 0000000000000000
>  x14: 0000000000000000 x13: 0000000000000004 x12: 0000000000020006
>  x11: 0000000030e4ef9f x10: ffff800083443358 x9 : ffff80008019499c
>  x8 : 00000000fffeffff x7 : ffff800083443358 x6 : 0000000000000000
>  x5 : 00000000000bfff4 x4 : 0000000000000000 x3 : ffff0000bb005ac0
>  x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000bb005ac0
>  Call trace:
>   add_dma_entry+0x26c/0x328 (P)
>   debug_dma_map_phys+0xc4/0xf0
>   dma_map_phys+0xe0/0x410
>   dma_map_page_attrs+0x94/0xf8
>   blk_dma_map_direct.isra.0+0x64/0xb8
>   blk_rq_dma_map_iter_next+0x6c/0xc8
>   nvme_prep_rq+0x894/0xa98
>   nvme_queue_rqs+0xb0/0x1a0
>   blk_mq_dispatch_queue_requests+0x268/0x3b8
>   blk_mq_flush_plug_list+0x90/0x188
>   __blk_flush_plug+0x104/0x170
>   blk_finish_plug+0x38/0x50
>   read_pages+0x1a4/0x3b8
>   page_cache_ra_unbounded+0x1a0/0x400
>   force_page_cache_ra+0xa8/0xd8
>   page_cache_sync_ra+0xa0/0x3f8
>   filemap_get_pages+0x104/0x950
>   filemap_read+0xf4/0x498
>   blkdev_read_iter+0x88/0x180
>   vfs_read+0x214/0x310
>   ksys_read+0x70/0x110
>   __arm64_sys_read+0x20/0x30
>   invoke_syscall+0x4c/0x118
>   el0_svc_common.constprop.0+0xc4/0xf0
>   do_el0_svc+0x24/0x38
>   el0_svc+0x1a0/0x340
>   el0t_64_sync_handler+0x98/0xe0
>   el0t_64_sync+0x17c/0x180
>  ---[ end trace 0000000000000000 ]---
> 
> 

