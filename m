Return-Path: <linuxppc-dev+bounces-11150-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D49B2CBDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 20:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5yfn0XS6z30PF;
	Wed, 20 Aug 2025 04:24:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755627889;
	cv=none; b=dKxb8DW6QXk3Y6trs/B2oL985lWnaXw+oy6BQRarP2XlmpVQY4yUONGQGpiZ9Ft83uG3NTe9hmrf/4y9QJCbGcsg8pK44Ddmz/nEG3lA1yw6Zl2XJ1YDgq8Ut9Pfrpiusqa8kM2rlZqeiPicp/W4ubf49Je4Y9h6Z7XesjegvFP6nt39t73HCguwIUUAwhkWO/Gyu2xq2VxkaxonUxgjoxKpXG9ydUHU9NjeTiY4x78lPfmisl8IM868qO3HXTKHZTWyVSoAFjn6oh/Dqagf/L9N/i8GObItd2f+7Jnte4/CdRcnuVVMK8+S694GVp5XQH6illt/+IidXn3gdPYxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755627889; c=relaxed/relaxed;
	bh=0Jymx+EA6KESZceDiO0ZcOJChcO4ShLkCuHB0UCXkIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQ67IijxlDG+S065G7rS9Dxz5Y+8vZXUWJAV0PzPhhgA5l9zVo1wiI4UpZjDTekwEJnNdamZFRG+85Ie0KU0RUrRV8t1bgMFnbBtNPZQ19Sm981HaDMp/BezkaHbnAI7s7/UyOTMrisiZ7Ik0adiBm4aom7wU6Iolg7su2yBYQ9qqzxQutageZowgs4CpvLzgqH0w5v783FZbJLhapj7aoYPK3rO60i445qSEHQ94PX6Rb4wUY+twsmxxC+QGATa/gYQficqTMFxenzPPUh070ldW7pBIp5gFffqeNh1BnhRn4tKncrf0PuL40CTM2KR7UNNKTbOl1OHutdm83PehA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EwzZComd; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EwzZComd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5yfm3xC0z2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 04:24:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 340915C655A;
	Tue, 19 Aug 2025 18:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53727C4CEF1;
	Tue, 19 Aug 2025 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755627885;
	bh=SvC+jn4R/dc0Ind2g0hlwOADBQmeZeKp/GI1XBT+Aws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EwzZComdy/Uu53OXhh/BwwXin3VgP9XbYbPukl1+6UUrrmT0/QUgfHPWbl0yeg2IQ
	 anqpbJ7fssVt9ylAxZXZBFI6XmgBFt76Sf9R+5d1q0uCECHn7z6AVgdwiNFmtPzUpZ
	 oIJpPvDGleeIPwFshu0MK91r/Q4vlnE3hv5K/BQn4hYDk2V66e58pXhNfNYLb9ftUC
	 FsprkYGd3dpPDZ4hTpasdYuKUOBt3HQa7ezc4te6CtdhPT3gjHwY76TvaUfRVubpfk
	 /uH6qQQOd5J1UhIfM2bjnt3K6ADP7bZZTesuRvLRHriJ0TMIrB1SG3izjobM9UNSdA
	 OKRS+aPZzKk+g==
Date: Tue, 19 Aug 2025 12:24:42 -0600
From: Keith Busch <kbusch@kernel.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
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
Message-ID: <aKTBariwz1_XsRv0@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
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
In-Reply-To: <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Make sure that CPU is not synced and IOMMU is configured to take
> MMIO path by providing newly introduced DMA_ATTR_MMIO attribute.

We may have a minor patch conflict here with my unmerged dma metadata
series, but not a big deal.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

