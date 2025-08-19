Return-Path: <linuxppc-dev+bounces-11148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C1FB2CBC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 20:20:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5yYf111cz305n;
	Wed, 20 Aug 2025 04:20:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755627622;
	cv=none; b=YYZSAN0k/StIYz2CXNyRUKZx49+xDY0zP27QJ5Ss+AjvGBOi99XmlqCSKl9uV7kx5xpxdFkYxhRWjykayledOsukmRp09zCjta0B9rAQapKtYxci3ZIawO72E1+MWIcalpowv1l7H1rzieJKPWsIVNHKcCXmIAXFCReQtmS5rVYAHLwhmFGxr1wVuB0f0D6fH3YApAvVZq8O+9lo1YiGBBLjor9U5yaC6tbJsxfKBED+CpP+GZNsZbArKlk5AlhyUdieDjCtmQfcoppohI2qDwhFLERCkvvFkaTru7PtgbAc5QhjrG8ER5iBOAC66mBR0qUkq1YORjN/4lZX68Vm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755627622; c=relaxed/relaxed;
	bh=jxMRJz5w5n4PxTFk/2BTZWr0cMwftnWj3iBsc1w/fNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYKJIjzv4AXzaCc5zJkRbGBmf8gG7BVIGUS9bO4bOO0C3dK5xrIYZHMX+IVZynfIWagGYDZammlE9s9asXOOMAzhOdvJWtzgAs2aBU2HSVWFKt10mDpSwIyk0kKZ8PI+bqq5ef7W5B2ER4oFjTGCfCFhkMfsIHWSes+OBV0BR/fqnWzxAS1G9EfhyAlLnGEyptGsxosNWaJ9qvXKvsIy5Fc4beoe+Pl2z++eZ2NUBOIIxUufU3OLrypa0Rzcs9fI4Z0gJh8FJiralrq90NhVDj+q9ol94VoGqcqA8+lkckpRsa1Gq9BRPVamfcl68z0UKqpbz0T38btBPqIfr6JTHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXjytkUF; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jXjytkUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5yYd40zdz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 04:20:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C14C74588D;
	Tue, 19 Aug 2025 18:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0BDC4CEF1;
	Tue, 19 Aug 2025 18:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755627608;
	bh=vJQ95/awDQN15gMxlaXB+Tcfic806+eL4EX36Buoiiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXjytkUFHZiUoUGI84YdHLEqkOvvneMczP1tcgM6yHssC3PZa14NlekO8OwnhQkoH
	 1tKFJyNzeoXibR5866EB9AlD853dT6hX/BHgsXNW4sH7pbBGpZs3bWwj08oPN1sJoj
	 hWrw/W8bx/Ed7fmJOvpwVh//YcUPC4H4piBW1ARVWVGtVpPRrRKbwDEj6sLZPN6zpp
	 WYxb2QFL4WZg9ljpPs9MR4UmpIcWbSmNlEaUUOSNEz9VaSvb+A8MMAVV0hqzSSr9AT
	 hd29ClRf6ZWgUwXusfUehQO9rXf61PDcTKf5hXEkAaN2POaxHzJVqre4wL9NW9YYur
	 pp6mAS1uKCUqA==
Date: Tue, 19 Aug 2025 12:20:04 -0600
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
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
Message-ID: <aKTAVOBp0u6ZSC4w@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
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
In-Reply-To: <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:58PM +0300, Leon Romanovsky wrote:
>  static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
>  		struct blk_dma_iter *iter, struct phys_vec *vec)
>  {
> -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> +			rq_dma_dir(req), 0);

Looks good.

Reviewed-by: Keith Busch <kbusch@kernel.org>

Just a random thought when I had to double back to check what the "0"
means: many dma_ api's have a default macro without an "attrs" argument,
then an _attrs() version for when you need it. Not sure if you want to
strictly follow that pattern, but merely a suggestion.

