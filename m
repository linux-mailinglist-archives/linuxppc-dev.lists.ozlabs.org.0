Return-Path: <linuxppc-dev+bounces-11153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC4EB2CD6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 21:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c60ks2tzsz2yb9;
	Wed, 20 Aug 2025 05:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755633509;
	cv=none; b=QZGv0OUGsPewaqbVY18WwVxMsqWpU+6m9Cwpw0YlZKFN3rDunhZ/EOl37yMLRA15V0wjcm1geZQiVr1SNHqNaImGxqCDWon85Z07CXPUGA+2MlhZOBIlVcYPBARpcHL11QV/bfNOdgb2AgdhfHIwqI82j2ori5w+TmYtZtmbAIRF4mDrypG8zvaHld0rKNUMDrCD0x9cTrPbgpaQZt50RBgjxOb+jT6JWjrUdsCC3+dpRiq+llLnmNWpNL6/ToeO6wSvTJUVeDMFF8sW1SaOSdTIxZDTKmU/GzEn0Yly/yZ7GZQ+/oCo7UNwpI5zWSpZXcfPUsteSYKNdOqpwksrlA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755633509; c=relaxed/relaxed;
	bh=Vouc/RnOn1OR1o/ff5mjM7Yg2TfneybwsfyI/BiiIXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRbLQP8j6gWtA7B9oOx+/alr1LS21WIySzbBOLsdyzfbmGaPDf3SbbF8vW2AL/R9ms8xVgmywtrFz1XmkprYpQzrWLB+9UcJDSCBm3f2O/fnrFKA3NBbeZTgMgQQZOtE0MPOyU4BqbH3r31AAKeunn6m0d3a/5npTbzmFylfhnAGD7yfG6ok0T6ovFU4WrrbAPuRkM+WAF8iUYHrVnYcBYs0wp3an6bw9p7MxmCpJLJd/MSKK8z9iJawiOM+EVNA42+0kOd0ngp2m2OrrjitUuBjv6yMfqhhD4Pm8I0JI95cTB+PVpfPk/H+ie0cxeIlp3adwPJ2N2Cp8vrX/oct1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z3cV0Sxj; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z3cV0Sxj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c60kr54krz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 05:58:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DCD345455;
	Tue, 19 Aug 2025 19:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D9EC4CEF1;
	Tue, 19 Aug 2025 19:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755633506;
	bh=nA9A0H3LrJ78fHP6AI7J40nKWuK6fskQEP9rQ9tJOXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3cV0SxjdjsbyAxLQAHXL9YQoVkd3oE/w0tg8f+/28wYPFIcCuOtf+n31sKJ+LyN1
	 6N7biz9o/yCuPtFBnn8ELyTNlP5RA151eN7wKi8pNSNB92o83ezmb7znz1ImNM7cWr
	 xClDJ2+EAIi/fyYTQNzUsM/2eAKArOgzFRoBwUKtf83SqZF5p6itYTMDZFBizPzyOj
	 cmndtkVjtFJFxZFPGtELV1/fpgrqmBEwX35+EsRatiowr0CXr7OcQuw39qyPoRCSeg
	 uQXDSW9Z/GPeI4IjUnpByoqXUrISGom24QKuNeZMIoK+/Modr6dLR2faOTSocU7qPz
	 FiaHtir3WFZ4Q==
Date: Tue, 19 Aug 2025 13:58:22 -0600
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
Subject: Re: [PATCH v4 16/16] nvme-pci: unmap MMIO pages with appropriate
 interface
Message-ID: <aKTXXv7kE0pGGn_8@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <545fffb8c364f36102919a5a1d57137731409f3c.1755624249.git.leon@kernel.org>
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
In-Reply-To: <545fffb8c364f36102919a5a1d57137731409f3c.1755624249.git.leon@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:37:00PM +0300, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Block layer maps MMIO memory through dma_map_phys() interface
> with help of DMA_ATTR_MMIO attribute. There is a need to unmap
> that memory with the appropriate unmap function, something which
> wasn't possible before adding new REQ attribute to block layer in
> previous patch.

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

