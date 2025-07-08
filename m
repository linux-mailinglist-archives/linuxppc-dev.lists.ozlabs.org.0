Return-Path: <linuxppc-dev+bounces-10160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BDAFCA14
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 14:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bc0G92bDgz3bcW;
	Tue,  8 Jul 2025 22:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751976417;
	cv=none; b=bo9nX24Rr5y/RO2YqNXuibZzqKtLlB0kO6GHA28CvOuMrGlhOgHdEloqKyNQy+wZwLIoQ81lXXQrgZecGR2sYxU6eF9oJasiX6M0Zxq65O+q2bc50Fs41wNTsnFQvuEFflbxH2tMOnDKIfwEz3CzLcw4WZpx7YP4oRK6KrYWzh35PhyIICfXjLj3p1Rcp/MBVrwRwRmJHXWop/K+FTsFBv0XuWPIC81Vt0dWhGzrkMb0uoGIKTL+Y4XcQMeA6GE/TD+cHcgdsQdNiK2twymozQK/TWqScDDG1cuhsKyn71AAoRyzEO0k+QtSDX5EuHoLw3HniSqeA9znXWcdCrZtzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751976417; c=relaxed/relaxed;
	bh=rViczFoCFQtwcNKraNBrnlXHpBXf2oyXrvi9VNukGlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXxvTBZcAW0cXYBmWuXYi5PWkBrmXqgdME77FoGv8ZmKvHI2MRLRnwWq0robzCJ9ixjtZ+lHp748KpWC9HVsfg33r379wFL9OeItOCgfhKS3akKyGbQ9u5WxDhYi3rvXYyL6HntSNaBnYvZknsoMkg0yrO7pzRY/KYvO8D0dUBJ5GJmpe0p0at2X7b9p/NSMEJ1tkygM+u0ktQbr87FaeGGFFFxFmF6g8d2FxIQp+eSdDJ0h53bGVQ9B4nUCBKIgR2d2+fHkBg3VzpRPOybty86EKz3kPbOfqSbyOk0cc4JLepksF5W8luZ5LC6hJ+DEvd7goocV7gBcXkoPyCS2ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4Ol3iwJ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4Ol3iwJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bc0G8445Qz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 22:06:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F40AF61482;
	Tue,  8 Jul 2025 12:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD93C4CEED;
	Tue,  8 Jul 2025 12:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751976413;
	bh=Kp+7+tPAvccy71FanvJSzbOLd0z4kN89DqWYezw1OYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4Ol3iwJuZ3bPifC90ngIr53J9DwqfI6SbJ5ng6mhsvmmhKJUSP01KISqF+xudx5r
	 OwNqQVnrJ4kgc1lmi+fQdvA0puZRnmrNIscNKhk5x+qQ848zPKeKACjmQZlA8St0fV
	 Wh5vNh7wUnm4qxPx7+pAli1/51YHFmtJSZMusuSZuTl+gmd4JhiDkCdnWCI/H5I1ks
	 daIfLQQN7QeyVcgmSHDG4twzeXB/Ep5gXJRK1YtdaaDN50mReflr3MzMrYthKL7TRa
	 VEK8qO2fuRa1AUaPB9bVOUF38SjH0Q+6EnxeFRNWiQ3OyIyapOpfsk4PRDL5JY2WCt
	 ethkWrczJo/aQ==
Date: Tue, 8 Jul 2025 15:06:47 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
Message-ID: <20250708120647.GG592765@unreal>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
 <cover.1750854543.git.leon@kernel.org>
 <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
 <20250627170213.GL17401@unreal>
 <20250630133839.GA26981@lst.de>
 <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
 <20250708110007.GF592765@unreal>
 <261f2417-78a9-45b8-bcec-7e36421a243c@samsung.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <261f2417-78a9-45b8-bcec-7e36421a243c@samsung.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 08, 2025 at 01:45:20PM +0200, Marek Szyprowski wrote:
> On 08.07.2025 13:00, Leon Romanovsky wrote:
> > On Tue, Jul 08, 2025 at 12:27:09PM +0200, Marek Szyprowski wrote:
> >> On 30.06.2025 15:38, Christoph Hellwig wrote:
> >>> On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
> >>>>> Thanks for this rework! I assume that the next step is to add map_phys
> >>>>> callback also to the dma_map_ops and teach various dma-mapping providers
> >>>>> to use it to avoid more phys-to-page-to-phys conversions.
> >>>> Probably Christoph will say yes, however I personally don't see any
> >>>> benefit in this. Maybe I wrong here, but all existing .map_page()
> >>>> implementation platforms don't support p2p anyway. They won't benefit
> >>>> from this such conversion.
> >>> I think that conversion should eventually happen, and rather sooner than
> >>> later.
> >> Agreed.
> >>
> >> Applied patches 1-7 to my dma-mapping-next branch. Let me know if one
> >> needs a stable branch with it.
> > Thanks a lot, I don't think that stable branch is needed. Realistically
> > speaking, my VFIO DMA work won't be merged this cycle, We are in -rc5,
> > it is complete rewrite from RFC version and touches pci-p2p code (to
> > remove dependency on struct page) in addition to VFIO, so it will take
> > time.
> >
> > Regarding, last patch (hmm), it will be great if you can take it.
> > We didn't touch anything in hmm.c this cycle and have no plans to send PR.
> > It can safely go through your tree.
> 
> Okay, then I would like to get an explicit ack from Jérôme for this.

Jerome is not active in HMM world for a long time already.
HMM tree is managed by us (RDMA) https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git/log/?h=hmm
➜  kernel git:(m/dmabuf-vfio) git log --merges mm/hmm.c
...
Pull HMM updates from Jason Gunthorpe:
...

https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=58ba80c4740212c29a1cf9b48f588e60a7612209
+hmm		git	git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git#hmm

We just never bothered to reflect current situation in MAINTAINERS file.

Thanks

