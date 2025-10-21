Return-Path: <linuxppc-dev+bounces-13123-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40274BF7D61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 19:13:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crf5r6rxCz304H;
	Wed, 22 Oct 2025 04:13:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761066832;
	cv=none; b=Mntl94DB23vRKPRYZN5HRm8eKGyW8YP34hz88+xwOlESvB0dxQ929y8/P5T3qsm3+72nUZmJ8FXdDwRQgvBhwNDaqqgpdIm6xVpSZ8mM3kobZBtewZZ+wsh3ggb1EcAjxc2ADbW9XDu3REL3LEI2fvK7cIfJw39HTvNR5Mv301w/AY7paS0SHlg+1wCbh/SkzpKUzeHfI4M5dDjrkIY/OVbmkZPtmDMmpgpLYHdclO179bDDVG+n69K7lES2PB6+LSEZuxSasEiROKhVl6YZiZX7/llfZiQuhEK7Q7slBDQfdgZqnZ988uZelDqhGF1PSVeS+dSo/J57LvZECiQ0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761066832; c=relaxed/relaxed;
	bh=T7OF7YinQtdM6zEwx9mf3VJteIbSNxF5xxDOzyp6kaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmybLQHwqguD7mYry42rAIeFE1wjxLu8SxbTC/HLyGFWh9+PKKEFq7Hu8ITaupEZ9xR3B8Tc1+IVMfJKiL8VBh2ymK1QZrN7wMqEhPwz/9VXt7AL4UOtwsITydM2DhTuJvkwBU2T5ge9UlmIDzsUmrdxnCGyeJL22Gfga2Ke7LDgvyWJwdHKA0H5fM2Lut78bd91TdULZ+PR4n15WVAETfy2M8OT/EAp1rZgZSimBXG2Y8LS3UX0D7IWHIKbMICDv0a/xyQfOoskMvwZkZ8dcqGSmGHgB/l3NGFKYd+Bw7f2iNqHnzNHgxltzoNekYb7nUWY7fLB81vdi6BLD3cgqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crf5Z6G4Pz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 04:13:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=T7OF7YinQtdM6zEwx9mf3VJteIbSNxF5xxDOzyp6kaY=; b=2Q1SsXK2pXUN8mCnQvRcx+QhQn
	VHutmMR5Rm8NehoV2QJEip/SnFEKMiY64LR/hUPPumhePnybaugYxUzHfGHyOTx0cLGbotoYVCFO+
	9lyaG/SBzt/6AdyC0IaqifMG/VBu1VMxQL4cnSdmGLEv5ebIL4NZuRX+insIu9cdUJH+b1dnBTRaV
	g/ngxAKGwaWSaDIqSP52BljzzeAD3aihVqBuTjHlzHYldIZjI+8FkMKoKbeVVwYEWZ5Mboqi23dON
	0PhF/1OuVgk3SXof8lmqPChWNgxxrLnkYAEP0sqPbIgJb3IRxOhYKRc9Dv4GF2LUgqx3m6edVBpYg
	uGdt9VGQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFvS-00000000CZQ-0p2N;
	Tue, 21 Oct 2025 17:13:34 +0000
Message-ID: <3ba11b0c-818f-41d5-8885-038c7e0133f5@infradead.org>
Date: Tue, 21 Oct 2025 10:13:33 -0700
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
Subject: Re: [PATCH v1 20/23] mm/kconfig: make BALLOON_COMPACTION depend on
 MIGRATION
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org,
 virtualization@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021150040.498160-1-david@redhat.com>
 <20251021150040.498160-4-david@redhat.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251021150040.498160-4-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/21/25 8:00 AM, David Hildenbrand wrote:
> Migration support for balloon memory depends on MIGRATION not
> COMPACTION. Compaction is simply another user of page migration.
> 
> The last dependency on compaction.c was effectively removed with
> commit 3d388584d599 ("mm: convert "movable" flag in page->mapping to a
> page flag"). Ever since, everything for handling movable_ops page
> migration resides in core migration code.
> 
> So let's change the dependency and adjust the description +
> help text.
> 
> We'll rename BALLOON_COMPACTION separately next.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/Kconfig | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index e47321051d765..3aff4d05a2d8c 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -599,17 +599,14 @@ config MEMORY_BALLOON
>  #
>  # support for memory balloon compaction
>  config BALLOON_COMPACTION
> -	bool "Allow for balloon memory compaction/migration"
> +	bool "Allow for balloon memory migration"
>  	default y
> -	depends on COMPACTION && MEMORY_BALLOON
> -	help
> -	  Memory fragmentation introduced by ballooning might reduce
> -	  significantly the number of 2MB contiguous memory blocks that can be
> -	  used within a guest, thus imposing performance penalties associated
> -	  with the reduced number of transparent huge pages that could be used
> -	  by the guest workload. Allowing the compaction & migration for memory
> -	  pages enlisted as being part of memory balloon devices avoids the
> -	  scenario aforementioned and helps improving memory defragmentation.
> +	depends on MIGRATION && MEMORY_BALLOON
> +	help
> +	  Allow for migration of pages inflated in a memory balloon such that
> +	  they can be allocated from memory areas only available for movable
> +	  allocations (e.g., ZONE_MOVABLE, CMA) and such that they can get

nit:
s/get/be/

> +	  migrated for memory defragmentation purposes by memory compaction.
>  
>  #
>  # support for memory compaction

-- 
~Randy


