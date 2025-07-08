Return-Path: <linuxppc-dev+bounces-10159-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE06AFC9D4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 13:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbznd3qymz3bb2;
	Tue,  8 Jul 2025 21:45:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751975141;
	cv=none; b=UaFvJL9IOOS6TlO7ObmDIRQih6EdU29vb0sHvhbIp330eDwdBq7n7nPgaJPZIeMsQXOAnR1HsAP9vlZ2k04dX1PpiDhLgcr+A9aH+UMHn6OOj3zrgLEa2iSERM7eLeMqmCEsUo4BmDMMkrr3vGlrPgfXmN8p/TbLT/DJfnKsqoDXxI0qWy8yNNLUXitId++VR9uJJZbhRS/MzrfxNJCV63YS5Cye9bf5ZIwv4kXpmetKRanAyzb6o4CV987pqlcUD+EGmgSpMGbKEo/anl4av7JuiYfwxMokZPlvcJY6+wnpVWOvXePUbE6if3/kr4qGYEeu3ThYvJaVnA66PNXkJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751975141; c=relaxed/relaxed;
	bh=1ym+ZPwSAJBlUJTRBRpHOrnxcWfoWCspHKNp3aF96Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=hcy3GhQvCpu8rBp0tsTHcy3EaQq3Bt9UQxtBsku8LPPA6RMcaDVa6nRppAxw8Uf6EmFlrUSDdjbYZ47Tq3UjetJDqJbcqcSYbiKhwif5c4ggSosvzpS/RPkH/qlQYzE3co+6Gq9OGQ41fzXagewjYkoapb9RfXNljdzHwnrNVRGv7+1Ob78LYOGfxYqD+9oEcifibyoI2y0/G+cHeXBMGXGrPf2nmP1Rhw3X+p6JzJ+uAE33I3XEb7YrM2+AExt9t1LfQp8vba3o2mSFSpV6Ek6smvxaQ7HJOTYrVr1HeB/HKvCjXNceOMSMJn6JFHi7pcDg9MYzeH0GkO3u5Rcq8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hTSmuD7o; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=hTSmuD7o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbznY6Xpyz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 21:45:35 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250708114524euoutp01264882b107dbeb1e3e439c20b55340a6~QRBfdr8nT2356523565euoutp01d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 11:45:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250708114524euoutp01264882b107dbeb1e3e439c20b55340a6~QRBfdr8nT2356523565euoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751975124;
	bh=1ym+ZPwSAJBlUJTRBRpHOrnxcWfoWCspHKNp3aF96Zc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=hTSmuD7oMDEzit2qwO94PA3KuPM3t2VfPla+ZeQLlhsNzfaZcuY74yloqGgMlREzO
	 CsGI/sYzA9Yc1mk5B7u3++o5ws1E5d1puriNBi3OjaJXBAd0aHxnL7ewrUPjNlgXd6
	 LV3oL4gOBjFPocvDRFQB7NcOwi5rH+2xd/RpiYis=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250708114523eucas1p2d8771c6a0d017b9bb67a6528e7582617~QRBe5i9Re1494914949eucas1p2S;
	Tue,  8 Jul 2025 11:45:23 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250708114521eusmtip2651e660db53304d0ed855a7d7f6ea665~QRBcy78Hv2034520345eusmtip2O;
	Tue,  8 Jul 2025 11:45:21 +0000 (GMT)
Message-ID: <261f2417-78a9-45b8-bcec-7e36421a243c@samsung.com>
Date: Tue, 8 Jul 2025 13:45:20 +0200
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
In-Reply-To: <20250708110007.GF592765@unreal>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250708114523eucas1p2d8771c6a0d017b9bb67a6528e7582617
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
X-EPHeader: CA
X-CMS-RootMailID: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
	<cover.1750854543.git.leon@kernel.org>
	<35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
	<20250627170213.GL17401@unreal> <20250630133839.GA26981@lst.de>
	<69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
	<20250708110007.GF592765@unreal>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08.07.2025 13:00, Leon Romanovsky wrote:
> On Tue, Jul 08, 2025 at 12:27:09PM +0200, Marek Szyprowski wrote:
>> On 30.06.2025 15:38, Christoph Hellwig wrote:
>>> On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
>>>>> Thanks for this rework! I assume that the next step is to add map_phys
>>>>> callback also to the dma_map_ops and teach various dma-mapping providers
>>>>> to use it to avoid more phys-to-page-to-phys conversions.
>>>> Probably Christoph will say yes, however I personally don't see any
>>>> benefit in this. Maybe I wrong here, but all existing .map_page()
>>>> implementation platforms don't support p2p anyway. They won't benefit
>>>> from this such conversion.
>>> I think that conversion should eventually happen, and rather sooner than
>>> later.
>> Agreed.
>>
>> Applied patches 1-7 to my dma-mapping-next branch. Let me know if one
>> needs a stable branch with it.
> Thanks a lot, I don't think that stable branch is needed. Realistically
> speaking, my VFIO DMA work won't be merged this cycle, We are in -rc5,
> it is complete rewrite from RFC version and touches pci-p2p code (to
> remove dependency on struct page) in addition to VFIO, so it will take
> time.
>
> Regarding, last patch (hmm), it will be great if you can take it.
> We didn't touch anything in hmm.c this cycle and have no plans to send PR.
> It can safely go through your tree.

Okay, then I would like to get an explicit ack from Jérôme for this.

>> Leon, it would be great if You could also prepare an incremental patch
>> adding map_phys callback to the dma_maps_ops, so the individual
>> arch-specific dma-mapping providers can be then converted (or simplified
>> in many cases) too.
> Sure, will do.

Thanks!

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


