Return-Path: <linuxppc-dev+bounces-13068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EFDBF26B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 18:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cr17G4CZDz304h;
	Tue, 21 Oct 2025 03:27:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760977674;
	cv=none; b=ndvRgWPgnMczZza1Oa9nvU49tRItX4ZoQMYhv7vb/0AEgxhq/61xwpszIj9ZpDIWu3Sm18NOiMO0oghhwI9+IoeyYnXhNtZCZ84RkTpEhBS6lcFsEAdTVXpU8Lvg5tLxmCn9POSblF5apLsPzsnhbiDGVEIuhM76h+/bkf4m09CN4u93gG2NbbOfey9qrDu1NJXrXTl60ybGXDnDzmPGhcTyaRu6/9SkYx9rCxhourxHtzCzUNtF+LhuBxb8gHNqI1zM/zfhOh1W0qtn3vTLKZQWu0bu9jW3otf+BMzmd/MCQ+2+ycI63HOoWX+gzptUe9sRm/sSiR1NXHtLb7MjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760977674; c=relaxed/relaxed;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=EKzavQ6r67vj0DnlpdCbfOwlECKNoAOz2evdMDzBDgt15WDuHZCaFgDVTkzJHObYfJ8/82GbPZpn+Y1hZLaWzpqEs1xgj6HTiktDITywr4bOVp5NdGJNkZ9HBSZ3dRkggr4T3Tars/HtUXSGMatLtnK/XBteN85TXQDV96lZO1u8R4Rv8Qn1NncIVUNSarzv9WWYbydFlJ/IOhdG1UrP9mAXKQmANRieXIK+2F4EBpAdFONKVEHgNFO51e8GXQP4L+zLdJmy5TpViUYamyP7rexNfRQbMbSkABhbM8gxsbznErBzA4yojsD0gGIRS5BpEzOYCaedMYcj9FJCf8DIBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KX6ZcktJ; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KX6ZcktJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cr17C0t7nz2yw7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 03:27:48 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e;
	Mon, 20 Oct 2025 16:27:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251020162737euoutp01a7ea5ea3a3593576d6931ec88825e51e~wP9lezYs81013510135euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760977657;
	bh=e1+m70MIpIyLz0CgkjVmG+Zs9EMNilUICX9qZOez4wM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=KX6ZcktJJB15hpYlnrrgQKN5QMQizY7xdPAAhwp/El6wk7EM1ZJ6O6Pj837PofyJ0
	 migBg+i6L8vxe8bZ5F9hMcPUSOwsRbNZdnHxT7YLQRx589Age6y9jtnUV7j+rxCbcf
	 lscFl8Zw2Bwk6HlnV8xYW2UgmAXjN9fs/Wr5RS2Y=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6~wP9lIhm7s0044200442eucas1p1L;
	Mon, 20 Oct 2025 16:27:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251020162733eusmtip2068f969d861135995e1cd515194afc64~wP9hxNWHW2552125521eusmtip2Y;
	Mon, 20 Oct 2025 16:27:33 +0000 (GMT)
Message-ID: <4a47088d-6542-45f2-917b-c91f7dd1eb1a@samsung.com>
Date: Mon, 20 Oct 2025 18:27:32 +0200
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
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/14] Remove DMA map_page/map_resource and their
 unmap callbacks
To: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Russell King <linux@armlinux.org.uk>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Richard Henderson
	<richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Geoff Levand <geoff@infradead.org>, "David S.
 Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Thomas
	Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
	Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, Magnus Lindholm <linmag7@gmail.com>, Jason
	Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251020162736eucas1p1ef138572570fd17f7ba8cf6e6bc78ba6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dear All,

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.

I would like to have some acks from respective arch maintainers before 
applying this patchset.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


