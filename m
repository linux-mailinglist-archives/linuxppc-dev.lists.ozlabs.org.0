Return-Path: <linuxppc-dev+bounces-567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE07960161
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 08:14:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtHLh0nC4z2xBk;
	Tue, 27 Aug 2024 16:14:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724739260;
	cv=none; b=cPpmfJRqJrGd0qtsi69W4QxApAXilzOQ0zgnfX+iPSZim26WH4qUI0vZog4qiG+/PX++xahUzEd54qyufTehz6jq6xZM8CJS90QDqjYOhC9JfDQWlYecKD3w/6+NiLHFM2aEmWZ9HKMyZ2sRxCfKS1JNfItq98hHoT2Y3RVtShODCtWpG2JlUwH7MoPKhhl+NZ7xQ7ZD3wndeSCYMG6iSLuw9SjqJfdV8LEdWb8JG/bx8JBOoeKSnjjDNMzG4sM1CFf63+dDbKyGNydFXsxqwIqJi8gDjn3JzyF9RxU0tIkjTAIEC0aJ8KfEQp4AKruC+hzYq0Pf0JgPfh116uOg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724739260; c=relaxed/relaxed;
	bh=JGBPzwwTMl6pXnnc2RUMDho4EM+9AVo3LmnnmIv7I3k=;
	h=Received:DKIM-Filter:DKIM-Signature:Received:Received:Received:
	 Received:X-AuditID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:Content-Language:From:In-Reply-To:
	 Content-Transfer-Encoding:X-Brightmail-Tracker:
	 X-Brightmail-Tracker:X-CMS-MailID:X-Msg-Generator:Content-Type:
	 X-RootMTR:X-EPHeader:CMS-TYPE:X-CMS-RootMailID:References; b=bL4JJFKC/xiUroHGD5lVZ/CesQGXBVEphAt5ogPV/VELayeOGrptuwt/4O3jfiucLfMr5v52lMeLanRO63/siwQf6Xt3k7Es+HAZXBNUGbl3EpMkg0kHng78jEgaaOyj8hvyJrVvAalz8b0FTZnEdgH777Rzwf5OoNCW1jW6yGTK1P3g4oxbycCUpc12xwNfAUs7IGaa05Tj9eGF1gMrh5S/RhIZBpd2CL5uZculphSBSj9q6VziwYkRIXnjmAWtWzI0aUxsRhAsgX6jpmxgF+RKyyAHQVnJWbfWhgiD5XBf2/MdMBxvGVBbw4pIJQ7F6BrknHddevgmi9i8gcho6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mHqx3AXm; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=mHqx3AXm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtHLf1p98z2x9j
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 16:14:17 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20240827061406euoutp02ad22dde4ea61c71748916cacb06904d4~vgTTl606-2342823428euoutp02M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 06:14:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20240827061406euoutp02ad22dde4ea61c71748916cacb06904d4~vgTTl606-2342823428euoutp02M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1724739246;
	bh=JGBPzwwTMl6pXnnc2RUMDho4EM+9AVo3LmnnmIv7I3k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=mHqx3AXmR2mIUtQ9WjjabfpY2xrhoQU/7MecKbTfEvjK3mQIdKtVKEf6uik9zITe8
	 8VIXmbTbrtN/69XhuF2w5MKnILtsphBnCmK3TumkW/txKn7gzaZya+3GhrFL2P1GiW
	 FI4W3QEUNxT5yfwKwQ9Tm/oi7aWezV4M4IEk0nhE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20240827061406eucas1p12f82331796c1d72101fea0e1f0baf0c5~vgTTaA3F63269032690eucas1p1K;
	Tue, 27 Aug 2024 06:14:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id F1.CC.09875.EAE6DC66; Tue, 27
	Aug 2024 07:14:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20240827061405eucas1p207b3791fd974434c679bff883f51effa~vgTS7uKAB0163501635eucas1p28;
	Tue, 27 Aug 2024 06:14:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20240827061405eusmtrp182bebb49ba4a59113c6566d3fb4a2357~vgTS7BiNx0342903429eusmtrp1U;
	Tue, 27 Aug 2024 06:14:05 +0000 (GMT)
X-AuditID: cbfec7f4-11bff70000002693-33-66cd6eae29cc
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id DB.85.08810.DAE6DC66; Tue, 27
	Aug 2024 07:14:05 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20240827061404eusmtip205fbe8a87c3e2236ab0266e253940898~vgTRXpx6c1464414644eusmtip2H;
	Tue, 27 Aug 2024 06:14:04 +0000 (GMT)
Message-ID: <f206f46c-0e2a-47a3-84b3-30bb53499f75@samsung.com>
Date: Tue, 27 Aug 2024 08:14:03 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by
 zone_dma_limit
To: Baruch Siach <baruch@tkos.co.il>
Cc: Christoph Hellwig <hch@lst.de>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	=?UTF-8?B?UGV0ciBUZXNhxZnDrWs=?= <petr@tesarici.cz>, Ramon Fried
	<ramon@neureality.ai>, Elad Nachman <enachman@marvell.com>,
	linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <87mskyva7o.fsf@tarshish>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNKsWRmVeSWpSXmKPExsWy7djP87rr8s6mGfxdzmax4tobFov3y3oY
	LR4v2sZusXL1USaLX18sLDY9vsZqcXnXHDaLTw/+M1tMWNjMbPH7+z9Wi4VznrNa9L1cw2px
	8MMTVouWO6YOfB5r5q1h9Ni0qpPNY/OSeo8Xm2cyepyfsZDRY/fNBjaPyQsvMnvM+vmPxWPv
	3u2MHnMbbjF5fN4kF8AdxWWTkpqTWZZapG+XwJWx7cQKtoJj9hXzth1lbGDcatrFyMEhIWAi
	sfBzVRcjF4eQwApGib6rs1khnC+MEi3rbjFDOJ8ZJQ5On8bYxcgJ1nF20Rd2iMRyRomnZ3+y
	QTgfGSXmbJvJDFLFK2An8fxRDyuIzSKgKvFhzmeouKDEyZlPWEBsUQF5ifu3ZrCD2MICARJT
	nm1iA7FFBFQk/j/fBmYzC1xjltg8wwbCFpe49WQ+E4jNJmAo0fW2iw3kB04BNYmOW7YQJfIS
	zVtng10tIbCbU+JP9xsmiKtdJNbevM0OYQtLvDq+BcqWkTg9uYcFoqGdUWLB7/tMEM4ERomG
	57egfraWuHPuF9g2ZgFNifW79CHCjhLL575gggQkn8SNt4IQR/BJTNo2nRkizCvR0SYEUa0m
	Mev4Ori1By9cYp7AqDQLKVRmIflyFpJ3ZiHsXcDIsopRPLW0ODc9tdgoL7Vcrzgxt7g0L10v
	OT93EyMw/Z3+d/zLDsblrz7qHWJk4mA8xCjBwawkwit3+WSaEG9KYmVValF+fFFpTmrxIUZp
	DhYlcV7VFPlUIYH0xJLU7NTUgtQimCwTB6dUA9MmVl/2Le0ZNqXH2CwPum1rkUt7kBh3fOlx
	nYBFDCbR/2+z3fX8Em0gru0tJfuEz4vTufvdhJjo6gcNHYohKlFtlmuETaPeRLHcFn0kMvlI
	+LStk4++PjhThkun/vw3TnNzm8K/n1dbxQX97xfwCb8R5rh/UWhkW6nZZb6n9cJcWksTYqZZ
	OTr/F6otOuuwf9uUK9q8tRNmLNsgkjx/2v0gu/CUdXJvghgLPJpl3zs8e3CuZsqjMxukbgQx
	LTugmbnvjel57bwWoUeq22xb8ua/ecvYZTixRfmQ6Mob0ZOEg2OT5uhdU0yZ2rflo+j6+f2y
	AT9OXE3mE3s3N/zlu25O0xn5fatuL/KcWFmapMRSnJFoqMVcVJwIAEd30sTuAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsVy+t/xe7pr886mGZzdq2Sx4tobFov3y3oY
	LR4v2sZusXL1USaLX18sLDY9vsZqcXnXHDaLTw/+M1tMWNjMbPH7+z9Wi4VznrNa9L1cw2px
	8MMTVouWO6YOfB5r5q1h9Ni0qpPNY/OSeo8Xm2cyepyfsZDRY/fNBjaPyQsvMnvM+vmPxWPv
	3u2MHnMbbjF5fN4kF8AdpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtlZKqkb2eT
	kpqTWZZapG+XoJex7cQKtoJj9hXzth1lbGDcatrFyMkhIWAicXbRF/YuRi4OIYGljBLv9k9j
	g0jISJyc1sAKYQtL/LnWxQZR9J5RYmbzLUaQBK+AncTzRz1gRSwCqhIf5nxmhogLSpyc+YQF
	xBYVkJe4f2sGO4gtLOAncf/tVrAFIgIqEv+fbwMbyixwjVmi9ed5qA1LmSTerVoCNpVZQFzi
	1pP5TCA2m4ChRNdbkDM4ODgF1CQ6btlClJhJdG3tYoSw5SWat85mnsAoNAvJHbOQTJqFpGUW
	kpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmN+27Gfm3cwznv1Ue8QIxMH4yFGCQ5m
	JRFeucsn04R4UxIrq1KL8uOLSnNSiw8xmgIDYyKzlGhyPjDp5JXEG5oZmBqamFkamFqaGSuJ
	83oWdCQKCaQnlqRmp6YWpBbB9DFxcEo1MG1mfbI+sf0Hg6CQPMPOGfPyPzvO5LNy29oiX7X8
	/LwdWzjF7sw8Pt+48v2NV/0bVRQafs/5N/3ki/JEZrW5mxS8Fr3e/f426+ZfRcdcZ7yQmZts
	4DXvwtuXoYUZewz1eowq/Coe31Fjvyq6NemY86EZa7oeFEX88Lgi8DpngsluHVfGjKNLD7P3
	dJtu3zj7QyVHgfrdhbfkb7f7eN/MNb50oeZVlorZMb9NZ5V1NPoYa3kt3nq7f7s9L9Mqfsdb
	PiYr8wzhq6oqWk+/TIuvy9dRLtmUKpAb4XGX6bES4+VX+348jE6VWju7ma9x5QmGbaWfmq3+
	C87uiliVaLQ0qCkv6Kng5Pt1Ewo+ntiuKK3EUpyRaKjFXFScCADv/Nm7ggMAAA==
X-CMS-MailID: 20240827061405eucas1p207b3791fd974434c679bff883f51effa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1
References: <cover.1723359916.git.baruch@tkos.co.il>
	<CGME20240811070951eucas1p1dc5315e0d710db13ce28fa0a977c7bc1@eucas1p1.samsung.com>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
	<53d988b1-bdce-422a-ae4e-158f305ad703@samsung.com> <87mskyva7o.fsf@tarshish>

On 27.08.2024 06:52, Baruch Siach wrote:
> Hi Marek,
>
> Thanks for your report.
>
> On Mon, Aug 26 2024, Marek Szyprowski wrote:
>> On 11.08.2024 09:09, Baruch Siach wrote:
>>> From: Catalin Marinas <catalin.marinas@arm.com>
>>>
>>> Hardware DMA limit might not be power of 2. When RAM range starts above
>>> 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
>>> can not encode this limit.
>>>
>>> Use plain address for DMA zone limit.
>>>
>>> Since DMA zone can now potentially span beyond 4GB physical limit of
>>> DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
>>>
>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>> Co-developed-by: Baruch Siach <baruch@tkos.co.il>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>> This patch landed recently in linux-next as commit ba0fb44aed47
>> ("dma-mapping: replace zone_dma_bits by zone_dma_limit"). During my
>> tests I found that it introduces the following warning on ARM64/Rockchip
>> based Odroid M1 board (arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts):
> Does this warning go away if you revert both 3be9b846896d and ba0fb44aed47?

Yes, linux-next with above mentioned commits reverted works fine.


> Upstream rockchip DTs have no dma-ranges property. Is that the case for
> your platform as well?
>
> Can you share kernel report of DMA zones and swiotlb? On my platform I get:
>
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000800000000-0x000000083fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   [mem 0x0000000840000000-0x0000000fffffffff]
> ...
> [    0.000000] software IO TLB: area num 8.
> [    0.000000] software IO TLB: mapped [mem 0x000000083be38000-0x000000083fe38000] (64MB)
>
> What do you get at your end?

On ba0fb44aed47 I got:

[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 
0x0000000000200000-0x00000001ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x1ff7a0600-0x1ff7a2fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000200000-0x00000001ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x00000000083fffff]
[    0.000000]   node   0: [mem 0x0000000009400000-0x00000000efffffff]
[    0.000000]   node   0: [mem 0x00000001f0000000-0x00000001ffffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000200000-0x00000001ffffffff]
[    0.000000] On node 0, zone DMA: 512 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 4096 pages in unavailable ranges
[    0.000000] cma: Reserved 96 MiB at 0x00000001f0000000 on node -1

...

[    0.000000] software IO TLB: SWIOTLB bounce buffer size adjusted to 3MB
[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 
0x00000001fac00000-0x00000001fb000000] (4MB)

On the fa3c109a6d30 (parent commit of the $subject) I got:

[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 
0x0000000000200000-0x00000001ffffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x1ff7a0600-0x1ff7a2fff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000200000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x00000001ffffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x00000000083fffff]
[    0.000000]   node   0: [mem 0x0000000009400000-0x00000000efffffff]
[    0.000000]   node   0: [mem 0x00000001f0000000-0x00000001ffffffff]
[    0.000000] Initmem setup node 0 [mem 
0x0000000000200000-0x00000001ffffffff]
[    0.000000] On node 0, zone DMA: 512 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 4096 pages in unavailable ranges
[    0.000000] cma: Reserved 96 MiB at 0x00000000ea000000 on node -1

...

[    0.000000] software IO TLB: area num 4.
[    0.000000] software IO TLB: mapped [mem 
0x00000000e6000000-0x00000000ea000000] (64MB)

It looks that for some reasons $subject patch changes the default zone 
and swiotlb configuration.

>> ------------[ cut here ]------------
>> dwmmc_rockchip fe2b0000.mmc: swiotlb addr 0x00000001faf00000+4096
>> overflow (mask ffffffff, bus limit 0).
>> WARNING: CPU: 3 PID: 1 at kernel/dma/swiotlb.c:1594 swiotlb_map+0x2f0/0x308
>> Modules linked in:
>> CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4+ #15278
>> Hardware name: Hardkernel ODROID-M1 (DT)
>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : swiotlb_map+0x2f0/0x308
>> lr : swiotlb_map+0x2f0/0x308
>> ...
>> Call trace:
>>    swiotlb_map+0x2f0/0x308
>>    dma_direct_map_sg+0x9c/0x2e4
>>    __dma_map_sg_attrs+0x28/0x94
>>    dma_map_sg_attrs+0x10/0x24
>>    dw_mci_pre_dma_transfer+0xb8/0xf4
>>    dw_mci_pre_req+0x50/0x68
>>    mmc_blk_mq_issue_rq+0x3e0/0x964
>>    mmc_mq_queue_rq+0x118/0x2b4
>>    blk_mq_dispatch_rq_list+0x21c/0x714
>>    __blk_mq_sched_dispatch_requests+0x490/0x58c
>>    blk_mq_sched_dispatch_requests+0x30/0x6c
>>    blk_mq_run_hw_queue+0x284/0x40c
>>    blk_mq_flush_plug_list.part.0+0x190/0x974
>>    blk_mq_flush_plug_list+0x1c/0x2c
>>    __blk_flush_plug+0xe4/0x140
>>    blk_finish_plug+0x38/0x4c
>>    __ext4_get_inode_loc+0x22c/0x654
>>    __ext4_get_inode_loc_noinmem+0x40/0xa8
>>    __ext4_iget+0x154/0xcc0
>>    ext4_get_journal_inode+0x30/0x110
>>    ext4_load_and_init_journal+0x9c/0xaf0
>>    ext4_fill_super+0x1fec/0x2d90
>>    get_tree_bdev+0x140/0x1d8
>>    ext4_get_tree+0x18/0x24
>>    vfs_get_tree+0x28/0xe8
>>    path_mount+0x3e8/0xb7c
>>    init_mount+0x68/0xac
>>    do_mount_root+0x108/0x1dc
>>    mount_root_generic+0x100/0x330
>>    mount_root+0x160/0x2d0
>>    initrd_load+0x1f0/0x2a0
>>    prepare_namespace+0x4c/0x29c
>>    kernel_init_freeable+0x4b4/0x50c
>>    kernel_init+0x20/0x1d8
>>    ret_from_fork+0x10/0x20
>> irq event stamp: 1305682
>> hardirqs last  enabled at (1305681): [<ffff8000800e332c>]
>> console_unlock+0x124/0x130
>> hardirqs last disabled at (1305682): [<ffff80008124e684>] el1_dbg+0x24/0x8c
>> softirqs last  enabled at (1305678): [<ffff80008005be1c>]
>> handle_softirqs+0x4cc/0x4e4
>> softirqs last disabled at (1305665): [<ffff8000800105b0>]
>> __do_softirq+0x14/0x20
>> ---[ end trace 0000000000000000 ]---
>>
>> This "bus limit 0" seems to be a bit suspicious to me as well as the
>> fact that swiotlb is used for the MMC DMA. I will investigate this
>> further tomorrow. The board boots fine though.
> Looking at the code I guess that bus_dma_limit set to 0 means no bus
> limit. But dma_mask for your device indicates 32-bit device limit. This
> can't work with address above 4GB. For some reason DMA code tries to
> allocate from higher address. This is most likely the reason
> dma_capable() returns false.

Indeed this looks like a source of the problem:

[    3.123618] Synopsys Designware Multimedia Card Interface Driver
[    3.139653] dwmmc_rockchip fe2b0000.mmc: IDMAC supports 32-bit 
address mode.
[    3.147739] dwmmc_rockchip fe2b0000.mmc: Using internal DMA controller.
[    3.161659] dwmmc_rockchip fe2b0000.mmc: Version ID is 270a
[    3.168455] dwmmc_rockchip fe2b0000.mmc: DW MMC controller at irq 
56,32 bit host data width,256 deep fifo
[    3.182651] dwmmc_rockchip fe2b0000.mmc: Got CD GPIO

...

[   11.009258] ------------[ cut here ]------------
[   11.014762] dwmmc_rockchip fe2b0000.mmc: swiotlb addr 
0x00000001faf00000+4096 overflow (mask ffffffff, bus limit 0).


> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


