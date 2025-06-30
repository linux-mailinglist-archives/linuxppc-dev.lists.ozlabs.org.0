Return-Path: <linuxppc-dev+bounces-9912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB6AEDF49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 15:38:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW6gs60Dvz2yhX;
	Mon, 30 Jun 2025 23:38:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751290729;
	cv=none; b=EL6eXpHRVzTRm/VWhHQgQSe/BqRXxUykMKv8fY8owww9O01ocQ447Z7tMt6phqlvOU+QZigjrrcd/nGyuVuj9/6ESGGdtQDjVZTAQUqDZFDzyKp+V5ebWY1UmO8vftPalPmOpo5MnKgUr6jZK8NBwHjLFrSGpovYidt76rty/8tp7U4Z5COcG6KnrJt2pnm6QpnVLZbuk50g3vN6oZrrmwyhQKHZFGRAfNq8HpMcLUh59cL7xQghkQ/NhhPgGM2OTr1USoeiMdce/1dTmNhqfUKIhBalDf+sgIVMkb1ixqo+fbj/S1q5uhPWoVegAuNkF628iLnrL8DuxsjaATDbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751290729; c=relaxed/relaxed;
	bh=9EB5M+oZCNFUrXucC6vFVumKTSV4tlIG2ltmQJJW9N4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPgOS83f+AGAg2N0BQm9hi8raBjeBm0PGkiYoPIOfFurOYpD3gZrO6WoJNsvSoHIxrxjCSwkza5BTUUebm5mt2hNSoHuAGENM4oKerkcb/SxG/aHsbkGC/HFyAC5Faqo7U6lhr+cZU7MRa9RAdMoqWhg8iUoTdUMvPb0Nni+dxly6ax/AS/nTsb/I1KiNPBKgDFHoe3rnRIxq2qtfq1FN7WjCzqbxcVpW5mlzVtHlI2m4cxadawm/w68FDgCM/932b2MwT2pdhR2n9mlfSZ7mPwNLzDBczsLhs4ISWSZSQ2Y0iaA1c/wQjaZ2oaui1xdFJQT5zNMQ7ZrtKnC60W1ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW6gr02spz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 23:38:46 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id BF34B227A88; Mon, 30 Jun 2025 15:38:39 +0200 (CEST)
Date: Mon, 30 Jun 2025 15:38:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <20250630133839.GA26981@lst.de>
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com> <cover.1750854543.git.leon@kernel.org> <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com> <20250627170213.GL17401@unreal>
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
In-Reply-To: <20250627170213.GL17401@unreal>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
> > Thanks for this rework! I assume that the next step is to add map_phys 
> > callback also to the dma_map_ops and teach various dma-mapping providers 
> > to use it to avoid more phys-to-page-to-phys conversions.
> 
> Probably Christoph will say yes, however I personally don't see any
> benefit in this. Maybe I wrong here, but all existing .map_page()
> implementation platforms don't support p2p anyway. They won't benefit
> from this such conversion.

I think that conversion should eventually happen, and rather sooner than
later.


