Return-Path: <linuxppc-dev+bounces-12546-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2278AB97329
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Sep 2025 20:31:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cWT7t6gknz2xck;
	Wed, 24 Sep 2025 04:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758652266;
	cv=none; b=KYfPR4Oc/OEMXhk49RmGaj9hrSDE3yGxM9R3rPan6lK3hgvcryNiH5TIwBpp3WPopUTIUctJ7XLmAzFAWGAM6xcXIaDLi5CD6JHE3UeP5XOj2KMFk4VJRjXJ1269M3vvLG7v/Ay0B8zXkXcji6BxI0UB9h2hTGp5jJYqQiKCho2hV4lh0yGQg2pAc8xhMcP8FWz6e8zLz02PXmeeu5ke2pTqQrMDH9ubahpv2hGISkMDIs8zKvTu8xns0DuPBYpkqPUXcBEVNEjQDliqPodZ9rEiaJ5rn4tme+c5qo1aNJeVo9joX2NSAPlHXRukRjmoFg7E04PTtrMo4zKiCZBheQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758652266; c=relaxed/relaxed;
	bh=f74v45qTfX4rd0AIVdvbIhhb3jagTfRC+ZZltoOMjTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETWI3UiwbSeIV0AQbh29Unj8+CI9TgXPxp76CA//yDcUqk41r9iezbT4lcNL2jFUgVaCIFqJjfE3GvblE4WX5zSb676bxNGW4HlUdF5urAngXubinqALHgwGLMrowK+mhOQ4P42WjgJipcFM2J3opdlsARXbgZy+esaTaVivgBWlrYXbP9y1U18IPWuuMCEyZmpQhanRZ6R27W1vCyGtVAkk8DKa7ZA6motZO0lVykGcO1CBFuROFIJLhE3b6LAjk6bMKe7rU/evIr6RdxbXBnVgITnAtrfDuOUEBk2dbYMiQg1vktysaYamR67sn6TJg8fV0nSJVdnpCkViRxGYWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S4ZXIaWM; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S4ZXIaWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cWT7p5F1dz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Sep 2025 04:31:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BC3A4393E;
	Tue, 23 Sep 2025 18:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB030C4CEF5;
	Tue, 23 Sep 2025 18:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758652259;
	bh=gxKH7wZVbZJUgsdcRmV6yXRnCWQ9TqZ9bpedLe1yt7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4ZXIaWM41Ablw/mVVeAaJkiSYgUA1XjiTWt5LSH4qwLIacOxMZE3jScnz0xix1Wv
	 SAp5BLuT2R2dCAYXxRdOCtJez17N/cBe9kv8+xOmcpzYoZ/UpcFkDX5GmNuOLJGCFV
	 Bcs4RLVyhjVQyFhRGAbe1bDHxUFJbKgGu/3vW1Mt1BkujhZ/XZn25PIvUn5jT3S9nw
	 YVX4n2lhWFpC/hhBuXD/s3h9/tXRxQArUIgc5V0sUKhDNiOC8ABgtjM7Q3+LQGe+ys
	 cSfhtq2Jd52bcQy4LLrP2uqO++/e9zs0F7UgxrbinfFgheCfADXwZVzyKQ2yU+i53A
	 XGP2nnt2Bp5Ig==
Date: Tue, 23 Sep 2025 12:30:55 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Message-ID: <aNLnXwAJveHIqfz0@kbusch-mbp>
References: <CGME20250909132821eucas1p1051ce9e0270ddbf520e105c913fa8db6@eucas1p1.samsung.com>
 <cover.1757423202.git.leonro@nvidia.com>
 <0db9bce5-40df-4cf5-85ab-f032c67d5c71@samsung.com>
 <20250912090327.GU341237@unreal>
 <aM1_9cS_LGl4GFC5@kbusch-mbp>
 <20250920155352.GH10800@unreal>
 <aM9LH6WSeOPGeleY@kbusch-mbp>
 <20250923170936.GA2614310@nvidia.com>
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
In-Reply-To: <20250923170936.GA2614310@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 23, 2025 at 02:09:36PM -0300, Jason Gunthorpe wrote:
> On Sat, Sep 20, 2025 at 06:47:27PM -0600, Keith Busch wrote:
> > 
> > One other thing to note, this was runing on arm64 platform using smmu
> > configured with 64k pages. If your iommu granule is 4k instead, we
> > wouldn't use the blk_dma_map_direct path.
> 
> I spent some time looking to see if I could guess what this is and
> came up empty. It seems most likely we are leaking a dma mapping
> tracking somehow? The DMA API side is pretty simple here though..

Yeah, nothing stood out to me here either.
 
> Not sure the 64k/4k itself is a cause, but triggering the non-iova
> flow is probably the issue.
> 
> Can you check the output of this debugfs:

I don't have a system in this state at the moment, so we checked
previous logs on machines running older kernels. It's extermely
uncommon, but this error was happening prior to this series, so I don't
think this introduced any new problem here. I'll keeping looking, but I
don't think we'll make much progress if I can't find a more reliable
reproducer.

Thanks!

