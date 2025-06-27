Return-Path: <linuxppc-dev+bounces-9848-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6077AEB949
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jun 2025 15:53:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bTH8H5qnGz2yNG;
	Fri, 27 Jun 2025 23:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751032415;
	cv=none; b=O26C7d2FqzQ+2qunmX7sJWSellhzzqahQw0lC1roj6IwXzdoHosTf6PZ7xlGiwPMad+lnQM8mkB2TVJUQkGY7LiEJgUKL3EgsG1sXOqnHmxPWOr4HHaY0aUxQAFVcUbqo1s3Cexy5/U6HI6weChuLAAKu8FqsRI72IwX1nqb4e3kMWcHe1kBrORbyBPfQ0PKWeoULH5XumDl2nXW7M+7rjblgqJrp2yB8JXtN6T/PzT4qyM0kNXv8aRNr7O3Q58c6v4EXslKBNzydU9qgZHf3ChLoP4JXDIRdUJtRMPvUR44WwrXNANw7jE44GVuFhY7DOgXwFJf7UvRhNti2Is49w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751032415; c=relaxed/relaxed;
	bh=XkLT3H6zpZxdqKr2mL/WBFZuhTWHNBcRcJJv1Mo/N0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=fas/e6v1t1fWY9n+Q5FaratVuh/WbrOC/9j2ww7XNMxYfu/IhO8XfslG1rGSX6HSWxuAunyaHXCNb54dRumoKIQX8+wnbUeYy0oR0v2O5+/kY2YTNiSg0UOeHOuYooyNFe+nLUZykKCpLVrTJ29pKmG6v9Vtn3PI7GcB2+mxcQwTqHap17LDNg53R4qoMV6sYD5XEs1whao7wcVwEgKn6FLLoWGOFIY9bl0lL6+W6qaJkf1K1d/5QVRd6x671mmVhoGrkXuzUNBUqsQt+0Lc/8Rs9SnyjTbRUBKniyIMFZkjiDr+j/2qFP2iebSoOaKZy8mnKETkyrUfzglW4y6MDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WhvmDKIT; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WhvmDKIT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 546 seconds by postgrey-1.37 at boromir; Fri, 27 Jun 2025 23:53:31 AEST
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bTH8C3yX2z2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 23:53:30 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250627134412euoutp02c06948a820e87256ec4a6abc6de62b68~M6jFZ9GUW2277422774euoutp02_
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 13:44:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250627134412euoutp02c06948a820e87256ec4a6abc6de62b68~M6jFZ9GUW2277422774euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751031852;
	bh=XkLT3H6zpZxdqKr2mL/WBFZuhTWHNBcRcJJv1Mo/N0Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WhvmDKITyLEkhw3MRTwTgoaWKOjFTMjKnV8wJOos+T/cXs8qV0a45KyYKjjHHphNR
	 ejlC6A7c/3G9ZGM0g5x9rtRdfSUOXwvaNPvqe2cEjseVkiFdxFjJMEeYZdJBH545i+
	 hY7QPcy7sQUOkaipwLKySn5wWBeenoGfWxQTqISc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250627134412eucas1p153bc3e4a1c0897bca604e6864667b66d~M6jEutC8v1155611556eucas1p1O;
	Fri, 27 Jun 2025 13:44:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250627134410eusmtip109d5d74275daabf2f21b42eb7440b88b~M6jDFXzcn2675526755eusmtip1I;
	Fri, 27 Jun 2025 13:44:10 +0000 (GMT)
Message-ID: <35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
Date: Fri, 27 Jun 2025 15:44:10 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
To: Leon Romanovsky <leon@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, Joerg
	Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S.
	Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Potapenko <glider@google.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux.dev, virtualization@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <cover.1750854543.git.leon@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250627134412eucas1p153bc3e4a1c0897bca604e6864667b66d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
X-EPHeader: CA
X-CMS-RootMailID: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
	<cover.1750854543.git.leon@kernel.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 25.06.2025 15:18, Leon Romanovsky wrote:
> This series refactors the DMA mapping to use physical addresses
> as the primary interface instead of page+offset parameters. This
> change aligns the DMA API with the underlying hardware reality where
> DMA operations work with physical addresses, not page structures.
>
> The series consists of 8 patches that progressively convert the DMA
> mapping infrastructure from page-based to physical address-based APIs:
>
> The series maintains backward compatibility by keeping the old
> page-based API as wrapper functions around the new physical
> address-based implementations.

Thanks for this rework! I assume that the next step is to add map_phys 
callback also to the dma_map_ops and teach various dma-mapping providers 
to use it to avoid more phys-to-page-to-phys conversions.

I only wonder if this newly introduced dma_map_phys()/dma_unmap_phys() 
API is also suitable for the recently discussed PCI P2P DMA? While 
adding a new API maybe we should take this into account? My main concern 
is the lack of the source phys addr passed to the dma_unmap_phys() 
function and I'm aware that this might complicate a bit code conversion 
from old dma_map/unmap_page() API.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


