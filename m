Return-Path: <linuxppc-dev+bounces-13495-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6157DC198BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 11:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxN6c5l6rz3bfN;
	Wed, 29 Oct 2025 21:00:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761732056;
	cv=none; b=WeBOW3m/AqePFtGgyBGjmguYkWuV8gnAB0dFfPHWYf25hcVzhLW4VcfCbbNCKXqQ8gyj2qN6Itua90jKS7D/reH41nx8eyEGgYk6HLCTaLp2EDG2HqQ0c3drN804lUjgckF/rPmiiSw0qbbAUiIAVs9uGXuxe+6HoF3ygC8x+3Ito21GLGzGiJ3ff7QNLViN2bxr6XZFKmiy0M7F4T8ouaMLdkJznP+/3gVNAls5FOoI3casMXsF4stwLYK6/P6o5KEOSHevv5ur91+dYvQDwjnftro9pZBLi6/CPcUfkDf3Yo0QJA2dyVaTp6KTiYMpTToogccQ22+OvuaqvpI1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761732056; c=relaxed/relaxed;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=TThqoU0TL4lPN0wKblJS9pW8eMm/LewlbKCUvprXqSaXSBppzGF46qzUWlvPy2yKVWHwTBGh/BWT3mfcLJDgQzr87gIscXJPaRrBDqmtqyn+tZj/2eF0PMiY8VyhcoQBQ5NO6aXHbJ4PZNNKo8VD71R4wgw1faRPtmzcvOZNcamDZY2shH8M7JeqQBMQ0rRGIN/RdRYw4KnpnYu/++Bn7HEgA/nlVgWhQ/GS6Bi03iM56iKr+wPuA+XoeuxKKqoc4byVwRvxO7TtvuV/xMHfAoeaPYJfcJdAvk9bPyJhhJ2hgu7qs8f2ZTSDlY7VIt00M+xUxdJa4ku3sH1IKfxboQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Q8nA+g0P; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=Q8nA+g0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxN6X4z3nz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 21:00:50 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027;
	Wed, 29 Oct 2025 10:00:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251029100039euoutp022901308f3eab82458d8910c81b526532~y7fTFrdGq2797727977euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761732039;
	bh=Lz0Rir68dfVLNeA+kqLkIpgtVfATL7Zz4GqfoJVdUA8=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=Q8nA+g0P0Lp8yYsVx23P8MkKmaRp5d92Nf+2imBS2NlZqa8/5ThIee3tXBOiLNt99
	 PjQedQ0JFXgKyV+emfETcayFtfRKIpSeQMZ0pgMqy9Wn3IoNaAw6sZ7VjxwGv7ehjb
	 3V9ekRK8wOTbOvttHwAsGVylPABrI1wC7ZTCqE2c=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618~y7fRb9PRk1129911299eucas1p2W;
	Wed, 29 Oct 2025 10:00:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251029100034eusmtip1f745a429892e79db9ec765d9fa07cdc8~y7fOJa_AZ2915029150eusmtip1F;
	Wed, 29 Oct 2025 10:00:34 +0000 (GMT)
Message-ID: <5e6eb6f0-fbbb-4359-9c40-075b25231e0d@samsung.com>
Date: Wed, 29 Oct 2025 11:00:33 +0100
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
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251029100038eucas1p2fe4a84df0bc07dc1cd96f49b4f740618
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
X-EPHeader: CA
X-CMS-RootMailID: 20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d
References: <CGME20251015091313eucas1p2426ae40b579d7f3b4f29b46e0e788c0d@eucas1p2.samsung.com>
	<20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15.10.2025 11:12, Leon Romanovsky wrote:
> This series is a combination of previous two steps [1, 2] to reduce
> number of accesses to struct page in the code "below" DMA layer.
>
> In this series, the DMA .map_page/.map_resource/.unmap_page/.unmap_resource
> callbacks are converted to newly introduced .map_phys/.unmap_phys interfaces.
>
> Thanks
>
> [1] https://lore.kernel.org/all/cover.1758203802.git.leon@kernel.org
> [2] https://lore.kernel.org/all/cover.1759071169.git.leon@kernel.org

Applied to dma-mapping-for-next branch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


