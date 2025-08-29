Return-Path: <linuxppc-dev+bounces-11486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C1B3BB74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 14:35:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCyR01hhdz2yN2;
	Fri, 29 Aug 2025 22:35:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756470924;
	cv=none; b=EKEaaCJ3wybayyDWramoG8K1wgyXA+DzaPGYcz9nXgoIbk/GirWqzhc5u8eOm16ptcuprfiC8g8ZIHEMTYXF/6yueggBZzV3+7bdlTdL1TuytWQXCNBpckrfhADEOItjxUfYjvsvfYd1aO+8vSHfdNvZBfBfd6HaWrK70FW4KFPaHf/xAUIX3pN0uBAZOwnUDxX1TjZjKYvHBNT42c1427aCkpnzSGYKl1iGbA7bjlii38cdxRaJKTBXH71oG4GVS0jvfpYEs3bQ3HC5Ih6RZ35LQ97lDidnABvtNSwIg/o12+R356B9qBlEdSPXSyHbzW20klmUT/FM6zcYOzXcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756470924; c=relaxed/relaxed;
	bh=5zSMrOVSNClOrdiZ1EgFy9NdG3HEevOLe/lENj4ZGeg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oXfQV1x2hj7Fw8l+3A5LF9/VwtpwZczqSkvKBmLEvx2Ah+e9t3wUWlHc24H4XTGNjjOobhcijxXrTgkC5wVqORDz83R+xw+W4JA3QrLIie7HgICATGtSgrJyIW9dvQAs/l7/LRbWTN/T/mpHSDltOxgvJLaubffOa/IkM7DwXA4B1smi/9nnFkOaomacd3a8XNwhs2i2WwFLzT1P46vvZwVF0IlhVe+PBVgNmNMWIbGfgzHGl3tBrcYe9s6zrJ9gYRZC3Fqnk5+HWKq2Mwkzm9MYVjcEdH2lZ5WhN5yjon3UM+KH6RKcawc3GN4ZR0iq3W2nYoczUlO7viCZllToKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mxl8/qU6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mxl8/qU6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCyQz1M5Kz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 22:35:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1499A60054;
	Fri, 29 Aug 2025 12:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DF0C4CEF0;
	Fri, 29 Aug 2025 12:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756470919;
	bh=fPmX8Rp8udx+VwVXpgZe9FXorpOePyV4Ef8DrCTRpmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mxl8/qU6Vvz0COFBLrmB8UJZ9govt1w/+9MvHsezQkHTR5DIoYs7xgXKhzSYkVOm1
	 ZyticaiPv1YXSMvOVriZNEtfWFF/4gFAB5LRbmsuDZl1qYUJ6QJjS6y5kT84iXSP4h
	 c3O0x8clzW4t74drhw57szBCRrci0dZsz7TkMKYvpu6q9eSqR6y+QLN+NF1mWqnv0Y
	 TV+utnoubo+22XzKDO5zQdJ90tzO09TUxr04pRitKlRur46am/LMf882y9Fd21W1eK
	 Oe5n+rwQMv7g1wcRBxrA0L1C89sfgumKn452/Ld/OiWS5hXm6vNk/t7OjLj/in2qzE
	 hQrPqQ39Y1fww==
Date: Fri, 29 Aug 2025 06:35:16 -0600
From: Keith Busch <kbusch@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev, Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>, Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v4 15/16] block-dma: properly take MMIO path
Message-ID: <aLGehMVsTEXrP_R5@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
 <aLBzeMNT3WOrjprC@kbusch-mbp>
 <20250828165427.GB10073@unreal>
 <aLCOqIaoaKUEOdeh@kbusch-mbp>
 <20250828184115.GE7333@nvidia.com>
 <aLCpqI-VQ7KeB6DL@kbusch-mbp>
 <20250828191820.GH7333@nvidia.com>
 <aLDCC4rXcIKF8sRg@kbusch-mbp>
 <20250828234542.GK7333@nvidia.com>
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
In-Reply-To: <20250828234542.GK7333@nvidia.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Aug 28, 2025 at 08:45:42PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 28, 2025 at 02:54:35PM -0600, Keith Busch wrote:
> 
> > In truth though, I hadn't tried p2p metadata before today, and it looks
> > like bio_integrity_map_user() is missing the P2P extraction flags to
> > make that work. Just added this patch below, now I can set p2p or host
> > memory independently for data and integrity payloads:
> 
> I think it is a bit more than that, you have to make sure all the meta
> data is the same, either all p2p or all cpu and then record this
> somehow so the DMA mapping knows what kind it is.

Sure, I can get all that added in for the real patch.
 
> Once that is all done then the above should still be OK, the dma unmap
> of the data can follow Leon's new flag and the dma unmap of the
> integrity can follow however integrity kept track (in the
> bio_integrity_payload perhaps?) ??

We have available bits in the bio_integrity_payload bip_flags, so that
sounds doable. I think we'll need to rearrange some things so we can
reuse the important code for data and metadata mapping/unmapping, but
doesn't look too bad. I'll get started on that.

