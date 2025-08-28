Return-Path: <linuxppc-dev+bounces-11432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 764DCB3A413
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 17:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCQ6k2lzyz2ym0;
	Fri, 29 Aug 2025 01:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756394366;
	cv=none; b=gZiBiRUc410+6Ye0F0qSNKObW0a0uRZ/9WMAaEgvfDqlGhn4BeH8cx4ub+TObeFQJY6k2e5VLb631Q5CN5y1qByrM44mECXv/taqQOk5c9qXWD+oO97f4axNzxRMu9SsznJRANsoU6fZ54BkgSa2n5TH/dOlUS8xa8ifiVXsgOYWe8q7qzT2rcB5nawu2FcuEP+1wIiSoHVIDrkj93iMGp0AvDM47bjlar+7rekhDScfHbU+zZr//kbNDOpvIbBCtSkzrqpJ+eOG75OnP/kRbkuRFmE/AldE9juMMu/qkjQups/RIlpoc6Z/OU9uLINRlowlZaoE8Hnahsthymo3+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756394366; c=relaxed/relaxed;
	bh=+Wz4elI208IK+JSajFW9ZYSY4sJyfxAIN3oV4QuXWNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8JnZAebDriHLBF7t0zJzE5IKSJj8lMMOKPmMdmh3bdgMCDMJqaILv1KFa3JGTwVx1bRAmBW3bXjZP1l7bXW+gVuonQhPy/vYw/GU7/3LMABJa4F/jVkcl1Y3gLNBHWrp3sfiksLldaaaBpdRtzz2jQCATp+P3DomYmp40ImfMMWaGchIXUSYYr0AAlsuDhU/7NxYaW/e5AOyTaInQyV/z8PcMZ8sO2qq9g0x0mxp24NuhEe27hIZADJnnX8CginOr989uHAUOO8M3GFJOwLA1JwMhnM3kN6LMbEUjG1wUoJA3veOPp6MU/f5GszBSOutsLZg1tPlx6HTnKnA6w1Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fiz/IFX/; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Fiz/IFX/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kbusch@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCQ6j5lTjz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 01:19:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EB99404AA;
	Thu, 28 Aug 2025 15:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D216BC4CEEB;
	Thu, 28 Aug 2025 15:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756394363;
	bh=nTKrcpDsshWT34MR4DBCaPN8mPA7gJtcVOPD1NWA+qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fiz/IFX/cbprksFrwcYLPDvY3Zj3oM+9xj/s3otiwCFW0WEBrDAgB6JRjK+IdqZnC
	 OFN4Z0AL7m05VQmwPYApcrLewjZzB+NKCYXZOIU9ibwe7/P/cr26ecTqFmQEgaS6pv
	 89DgMHR/jfK9TG7bugNXs7ta3ON2u0FFPpRcZMhF8LuBBzR8fYiYNcrkRaeoqL84Pa
	 vG8dcgdTqIBhIwwgWFEaigYJZlxM0LDruE+7Hf8BMGaT2uPwEeDcL2AHvfnUbMmlQ1
	 qic40gUjOmMG1Ib24qu6/1eYpqYTDcYO5/R+Bonh5umwbDCeb4/lCZ33BnqzYEikCq
	 EOso5xuGJTjTg==
Date: Thu, 28 Aug 2025 09:19:20 -0600
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
Message-ID: <aLBzeMNT3WOrjprC@kbusch-mbp>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 19, 2025 at 08:36:59PM +0300, Leon Romanovsky wrote:
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 09b99d52fd36..283058bcb5b1 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -387,6 +387,7 @@ enum req_flag_bits {
>  	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
>  	__REQ_ATOMIC,		/* for atomic write operations */
>  	__REQ_P2PDMA,		/* contains P2P DMA pages */
> +	__REQ_MMIO,		/* contains MMIO memory */
>  	/*
>  	 * Command specific flags, keep last:
>  	 */
> @@ -420,6 +421,7 @@ enum req_flag_bits {
>  #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
>  #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
>  #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
> +#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)

Now that my integrity metadata DMA series is staged, I don't think we
can use REQ flags like this because data and metadata may have different
mapping types. I think we should add a flags field to the dma_iova_state
instead.

