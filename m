Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 037101A2657
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 17:52:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48y81P1hNgzDqld
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 01:52:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=gBMMD0VV; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48y7hk0h45zDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 01:38:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=zXlIsbDM28OKmK+7j6iTmvR4wjllvC+TzshTZOZR7TU=; b=gBMMD0VVRRKgOhHzpjDt/lZU1Y
 u9BILt8VLhw0sO34uaQF8z0/PQuXdH0k8rq6aufu410mYc/h3uYsHE3q9jGtAR4M+g6usA+9c6hXK
 qRLaLBonqPUOIZaYwx8mMo+2EsEG9nTiAccNRbs6mfHNotxOLNwE+DlKy1V2XzHirfFfsMPOVzUym
 kj+8W0aL1LC5SGUCy/9LavI/NBI3tZTJ8tgBbvnAEsg8PZoPaY6ZqgBKJJoDlEFMhPCgeRUq/t2tJ
 UNV8tw5S5/pX84WeHyxnsmLcEBTrdKEA6VvzmozcQ0Sa3ZoJrnu5VhBf+PUP8I8OdfHleFuFcY7pQ
 OYfbsiKQ==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCm9-0006Y5-CG; Wed, 08 Apr 2020 15:38:07 +0000
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
 <20200408151203.GN20730@hirez.programming.kicks-ass.net>
 <20200408151519.GQ21484@bombadil.infradead.org>
 <20200408153602.GA28081@lst.de>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ce1cb560-2670-c79d-48eb-e4dd423aecb0@infradead.org>
Date: Wed, 8 Apr 2020 08:37:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408153602.GA28081@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hyperv@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/8/20 8:36 AM, Christoph Hellwig wrote:
> On Wed, Apr 08, 2020 at 08:15:19AM -0700, Matthew Wilcox wrote:
>>>>>  config ZSMALLOC_PGTABLE_MAPPING
>>>>>  	bool "Use page table mapping to access object in zsmalloc"
>>>>> -	depends on ZSMALLOC
>>>>> +	depends on ZSMALLOC=y
>>>>
>>>> It's a bool so this shouldn't matter... not needed.
>>>
>>> My mm/Kconfig has:
>>>
>>> config ZSMALLOC
>>> 	tristate "Memory allocator for compressed pages"
>>> 	depends on MMU
>>>
>>> which I think means it can be modular, no?
>>
>> Randy means that ZSMALLOC_PGTABLE_MAPPING is a bool, so I think hch's patch
>> is wrong ... if ZSMALLOC is 'm' then ZSMALLOC_PGTABLE_MAPPING would become
>> 'n' instead of 'y'.
> 
> In Linus' tree you can select PGTABLE_MAPPING=y with ZSMALLOC=m,
> and that fits my understanding of the kbuild language.  With this
> patch I can't anymore.
> 

Makes sense. thanks.

-- 
~Randy

