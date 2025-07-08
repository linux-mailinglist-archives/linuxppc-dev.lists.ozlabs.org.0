Return-Path: <linuxppc-dev+bounces-10157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C778AAFC858
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jul 2025 12:27:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bby3P4Zbyz3bV6;
	Tue,  8 Jul 2025 20:27:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751970449;
	cv=none; b=YO1jjnjRSpnlFh02D+60Fn655UCFWiOEAAoutiqeB7Enfz4AD16CMiIPe2NerKQ/Fc9qB0yLxOTZSNOmSRaYcHSHpVDkYIDU1TMrVx7AC4wKP0HCGoR2WipPRgiKioXjCETrngkwxKWMaV4U2b3p9NfsP6pafizZAiufnXW18XvjqKMOjZzLGRSxEfEU1tp95M3o7fMBwPqYwQhtqDMeKXfIZO3EEwt7NTCeAQ3WvuhpTVApXMBcY9ZAYFlSh4/V667lFXIbyD0WIItXHlHCcuBF7D78eYIhuqhQjhP6wjESy+n/Gchk+tySni0KibR5iytMak4iDbJceeUXNknrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751970449; c=relaxed/relaxed;
	bh=CvHwMYp2XIGbJnf/9QWS8C8NtBZtZV/va6aW8p1Pd0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=MoBbJrv1diD0xeksj/MsxrdX30AXB4bf1ddk37QQnAhTdDODlKExqqKwXb7U0PGlBHo6LDsLbsnKgqgKCrQpjYVREZlUOPC4dwoGAp1g/eM9Kr5C11XhUpNbMwxrclUT9LbaNQLkEC7WSlEgp/uNbjWTJAVlYU3jcybG1o3En8VLg2L909aGTityxlyEhEBNyFhG7HoXGwFlHHeLJxty6ji3GLof6W513Mx+mlZaiPSauQgQLm6KvLEonbIzt4jytsKT2CYJI8OwocLKrGRxeIvwhJbc/K+B4ECpBLeMt5Kv/oz0JQU2xeTEqb35g3hKAnJeKG2GPYYbjHqfI7rlyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=F008LidY; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=F008LidY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bby3L4k1Fz30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 20:27:22 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250708102712euoutp02cbe1f0522ca747d091ba8aa92e4325ce~QP9ON6UTO2034520345euoutp02d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jul 2025 10:27:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250708102712euoutp02cbe1f0522ca747d091ba8aa92e4325ce~QP9ON6UTO2034520345euoutp02d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751970432;
	bh=CvHwMYp2XIGbJnf/9QWS8C8NtBZtZV/va6aW8p1Pd0k=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=F008LidYzvfh2j0RaYHTMgLK3oM6mF0Yc30pV8DYIYJ63cif9vHmCcNRRBaOZXuE5
	 bNk24ajaoAplrZQOsXjt1dEV2BYlfoenSYAE1z/tvVb0mjKVzlBGiCFN/CP6TshfXE
	 SMyPamwp2HmagXjrE5FMphrgU3Cfd7ZXMqQ0EBV8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250708102712eucas1p1199b906d3c40b7ff5066a92aacd7b14c~QP9NsRWhM2715427154eucas1p1l;
	Tue,  8 Jul 2025 10:27:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250708102710eusmtip12ad336592b93f91919ed398faf3d4122~QP9LytFDz1124711247eusmtip1B;
	Tue,  8 Jul 2025 10:27:10 +0000 (GMT)
Message-ID: <69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
Date: Tue, 8 Jul 2025 12:27:09 +0200
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
To: Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Will
	Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
	<jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, Alexander Potapenko
	<glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov
	<dvyukov@google.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu
	Desnoyers <mathieu.desnoyers@efficios.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
	<jglisse@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, iommu@lists.linux.dev,
	virtualization@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, Jason Gunthorpe
	<jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250630133839.GA26981@lst.de>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250708102712eucas1p1199b906d3c40b7ff5066a92aacd7b14c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
X-EPHeader: CA
X-CMS-RootMailID: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
	<cover.1750854543.git.leon@kernel.org>
	<35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
	<20250627170213.GL17401@unreal> <20250630133839.GA26981@lst.de>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.2025 15:38, Christoph Hellwig wrote:
> On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
>>> Thanks for this rework! I assume that the next step is to add map_phys
>>> callback also to the dma_map_ops and teach various dma-mapping providers
>>> to use it to avoid more phys-to-page-to-phys conversions.
>> Probably Christoph will say yes, however I personally don't see any
>> benefit in this. Maybe I wrong here, but all existing .map_page()
>> implementation platforms don't support p2p anyway. They won't benefit
>> from this such conversion.
> I think that conversion should eventually happen, and rather sooner than
> later.

Agreed.

Applied patches 1-7 to my dma-mapping-next branch. Let me know if one 
needs a stable branch with it.

Leon, it would be great if You could also prepare an incremental patch 
adding map_phys callback to the dma_maps_ops, so the individual 
arch-specific dma-mapping providers can be then converted (or simplified 
in many cases) too.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


