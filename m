Return-Path: <linuxppc-dev+bounces-1350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1112978AE9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 23:55:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X57Qk6DwLz2ysX;
	Sat, 14 Sep 2024 07:55:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726264526;
	cv=none; b=oB+YbfynS20n5t3ZqdDggI/We/gBfl3ORL+IgkL8PsUmlq1aVKi+TMUtoLQPcdsHBigvjMxTKm4TKydV5A0DS8o6Ndf6B6OxItms11o7JVtiYcBH2dOZh3OVM94Qo6UwZpGcp6N1KO2t6D4IU6ZOwIiNYDnp5QyM4zq3qlrGiLYabXaF/8dzID6yEgjcGSRlA3DzZ8N4THocZQEB4bZT0Wdode3XksK3g+HFd7nJQ0pPqkkPo4+nuw6HlcwC/XGvwxjly3/N90fwGqeWAERm3uQM9YxRaEJsaI1iTazB0gFL+bZpknfFseMGWAT0otLE+USx2HgDqeEzsxSW3REUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726264526; c=relaxed/relaxed;
	bh=pYcOiVSFtM6gAUc1DuIBW9ANECfcrc43mQXwHg/pSfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFeVSsNULoGTZ8LHjBCipxu67uFruND1rbsPolAp1aXIIBVQlYVmLAJfEEGQcnvvACqE3SZqG9aWaH89Ino0AAALMVlJqWqrCl4rYzSMbLowKy27+xpxFSW0z1DEwOfcjMLhL/mM8wCQ0dK25JdroCDKXQy6TzaU544/0agz9VRhmS4ZMHjocyn4XeFChIGq3aRAWY/J0+ttD2BVrfWWwrjxuw0yuhAsrdP3WTvtLgjA54OLKRum7wxiY5izViS9x+NfjCe6MXT++hRRWi8c0QdeMRTae3MkCMu2x7nympInQXtg+usFH/VFcqPnZFSR9lhUQpCoB2k/W3YANxggAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BftAYHJv; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=BftAYHJv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X57Qh6c2Wz2ynL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pYcOiVSFtM6gAUc1DuIBW9ANECfcrc43mQXwHg/pSfc=; b=BftAYHJvgSREGkU7w+OrOJ9pNl
	l5QOEIvyUe0WReLuZVt+hsrsrsGdc7P9VrJN2u7GJDVsyZxaN2ANANJDephGlR1Nnfg2TKalfM7/o
	IFN2mXqLRjEM4HS6WB8JVjVI6U+VDt+AyItBtOUZc4tpXtDNsKGkRhEo4SAcrpwy4nKJ/BzKUL3L4
	oJwTH5wPCpm4CFi3OUFyTE3VGU5IOWXoE4cdhKjkyMiIVxufCwC5J6+jz/eHYJ3jEnV3OAJV8fACB
	KjzfCS9qsu8m7590IaTeefwPOVOkbtU0fsOWV8k39vRqByFMlVqLcq8VbHgE5Jljv1YpJJZ1RB11T
	6Zs++nPg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1spEG0-0000000H1xl-29kX;
	Fri, 13 Sep 2024 21:55:12 +0000
Date: Fri, 13 Sep 2024 22:55:12 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
Message-ID: <ZuS0wKBUTSWvD_FZ@casper.infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>

On Fri, Sep 13, 2024 at 09:33:51PM +0000, Mina Almasry wrote:
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
> 
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
> 
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

It would be better to include a direct link to the GCC bugzilla.

> We try to access offset 40 in the pointer returned by this function:
> 
> static inline unsigned long _compound_head(const struct page *page)
> {
>         unsigned long head = READ_ONCE(page->compound_head);
> 
>         if (unlikely(head & 1))
>                 return head - 1;
>         return (unsigned long)page_fixed_fake_head(page);
> }
> 
> The GCC 14 (but not 11) compiler optimizes this by doing:
> 
> ld page + 39
> 
> Rather than:
> 
> ld (page - 1) + 40
> 
> And causing an unaligned load. Get around this by issuing a READ_ONCE as
> we convert the page to netmem.  That disables the compiler optimizing the
> load in this way.
> 
> Cc: Simon Horman <horms@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: David Miller <davem@davemloft.net>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Networking <netdev@vger.kernel.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> 
> Suggested-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> 
> ---
> 
> v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina@google.com/
> 
> - Work around this issue as we convert the page to netmem, instead of
>   a generic change that affects compound_head().
> ---
>  net/core/page_pool.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index a813d30d2135..74ea491d0ab2 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
>  {
>  	int i, bulk_len = 0;
>  	bool allow_direct;
> +	netmem_ref netmem;
> +	struct page *page;
>  	bool in_softirq;
>  
>  	allow_direct = page_pool_napi_local(pool);
>  
>  	for (i = 0; i < count; i++) {
> -		netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
> +		page = virt_to_head_page(data[i]);
> +
> +		/* GCC 14 powerpc compiler will optimize reads into the
> +		 * resulting netmem_ref into unaligned reads as it sees address
> +		 * arithmetic in _compound_head() call that the page has come
> +		 * from.
> +		 *
> +		 * The READ_ONCE here gets around that by breaking the
> +		 * optimization chain between the address arithmetic and later
> +		 * indexing.
> +		 */
> +		netmem = page_to_netmem(READ_ONCE(page));
>  
>  		/* It is not the last user for the page frag case */
>  		if (!page_pool_is_last_ref(netmem))
> -- 
> 2.46.0.662.g92d0881bb0-goog
> 

