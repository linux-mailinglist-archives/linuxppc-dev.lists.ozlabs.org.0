Return-Path: <linuxppc-dev+bounces-12044-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7EDB53E9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 00:23:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNBsn4Xx0z2yD5;
	Fri, 12 Sep 2025 08:23:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757629421;
	cv=none; b=lbkYu/sWYNrpWess3f614fZfNyY7iZ9ES0YwX0Zi73YgAIi22I2zaNiTukJeavVxL0+18d4O58FZabFDVGbv3FES6LB0C9SSeBvb+N8cFMJoHqqhVUnVhog2oHQZ6Tfk1wrH5pwm6Ko9behMvSuXIQwnPcKeM4F0EDuUl9ZNK0gG+zNzsVd98eUcC5EWPc8zTfmUcXQJEtPNFp3UIRE0OKzXVBq+sVpMBsW46KyrgKfeObeSgh80ZyK8rp6dIOmZg44s0KpPGeIFEdGubUy9jW8d1iy/JAEWpvGQl0PfRglHI1WDbdCvRHeYHacVdftCbOkz4bJikWSSIxTtllGqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757629421; c=relaxed/relaxed;
	bh=9atdt/om7OmffbDgov9WTxIsiO59X0BmEMtINP1uP9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=aTMqFw1M1ClWN+nRFHATRBjMtnSdlsgSUN9bXsOhDdMMHA4UMuQFj0ofVOyjbVv73L3mlC0qqEtkT+ElzZk7XRi/lbXkOoFF8glBH5iGpwsdhfkK7AiRMVmmUTOozIh15gwucJ0IBfP4Vqu5GEm/0msmKMsNIBgGtih89RMdSMotb9Yx6YTvK0O6GDiIfH6aXkisZBzg24yzwaKByWrIPVV7RVj1tla8yx49pImVZaj10VY14dNTvE9VtXiF6j1xTpK/vJ8KBs7QoEM9izc0y008yush94oQ0Pi2MET9ItQWHwY44P6nWqsAWnxtlemz3TI46DiFNWOFPzZlESe92w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oYf4Wl/v; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=oYf4Wl/v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNBsj63Sgz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 08:23:35 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250911222322euoutp011634560d57af0d6769ea82508ee6c7b3~kWqER7Qs81513015130euoutp01K;
	Thu, 11 Sep 2025 22:23:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250911222322euoutp011634560d57af0d6769ea82508ee6c7b3~kWqER7Qs81513015130euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757629402;
	bh=9atdt/om7OmffbDgov9WTxIsiO59X0BmEMtINP1uP9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=oYf4Wl/vK4mtCwLnlaPuk0Vbqm1kIIG4/GofumuhdavmIiBHyUZQRceOU6BgMduk5
	 UPpbMvZbaMJvAX41rCofkjz8fUum8Xd7cFaLczcWfrjE46zM7Gw77+bY+gxYbnaXwW
	 jL8zkycMTQXVpPJyDpmR0+MuvHwC/4FUakNYU3YU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250911222321eucas1p114043a72e011e2fff92df33a2133b21e~kWqDhtt8p0600006000eucas1p18;
	Thu, 11 Sep 2025 22:23:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250911222317eusmtip2aabd06b78078a7146730dff557f2cb71~kWqAG3AB-1019110191eusmtip2F;
	Thu, 11 Sep 2025 22:23:17 +0000 (GMT)
Message-ID: <5ffc63e9-19bd-4e12-92fc-57fe12d10f4f@samsung.com>
Date: Fri, 12 Sep 2025 00:23:17 +0200
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
Subject: Re: [PATCH v6 03/16] dma-debug: refactor to use physical addresses
 for page mapping
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Abdiel Janulgue
	<abdiel.janulgue@gmail.com>, Alexander Potapenko <glider@google.com>, Alex
	Gaynor <alex.gaynor@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>, David
	Hildenbrand <david@redhat.com>, iommu@lists.linux.dev, Jason Wang
	<jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
	<joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Juergen Gross
	<jgross@suse.com>, kasan-dev@googlegroups.com, Keith Busch
	<kbusch@kernel.org>, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250910052618.GH341237@unreal>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250911222321eucas1p114043a72e011e2fff92df33a2133b21e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4
X-EPHeader: CA
X-CMS-RootMailID: 20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4
References: <cover.1757423202.git.leonro@nvidia.com>
	<56d1a6769b68dfcbf8b26a75a7329aeb8e3c3b6a.1757423202.git.leonro@nvidia.com>
	<20250909193748.GG341237@unreal>
	<CGME20250910052628eucas1p160daa0dadb6f81d7831d8047628aa9d4@eucas1p1.samsung.com>
	<20250910052618.GH341237@unreal>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10.09.2025 07:26, Leon Romanovsky wrote:
> On Tue, Sep 09, 2025 at 10:37:48PM +0300, Leon Romanovsky wrote:
>> On Tue, Sep 09, 2025 at 04:27:31PM +0300, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>> <...>
>>
>>>   include/linux/page-flags.h         |  1 +
>> <...>
>>
>>> --- a/include/linux/page-flags.h
>>> +++ b/include/linux/page-flags.h
>>> @@ -614,6 +614,7 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>>>    * available at this point.
>>>    */
>>>   #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
>>> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>> This was a not so great idea to add PhysHighMem() because of "else"
>> below which unfolds to maze of macros and automatically generated
>> functions with "static inline int Page##uname ..." signature.
>>
>>>   #define folio_test_highmem(__f)	is_highmem_idx(folio_zonenum(__f))
>>>   #else
>>>   PAGEFLAG_FALSE(HighMem, highmem)
> After sleeping over it, the following hunk will help:
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index dfbc4ba86bba2..2a1f346178024 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -614,11 +614,11 @@ FOLIO_FLAG(dropbehind, FOLIO_HEAD_PAGE)
>    * available at this point.
>    */
>   #define PageHighMem(__p) is_highmem_idx(page_zonenum(__p))
> -#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>   #define folio_test_highmem(__f)        is_highmem_idx(folio_zonenum(__f))
>   #else
>   PAGEFLAG_FALSE(HighMem, highmem)
>   #endif
> +#define PhysHighMem(__p) (PageHighMem(phys_to_page(__p)))
>
>   /* Does kmap_local_folio() only allow access to one page of the folio? */
>   #ifdef CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP

Okay, I will add this fixup while applying the patches.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


