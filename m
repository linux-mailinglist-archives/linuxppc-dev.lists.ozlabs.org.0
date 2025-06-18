Return-Path: <linuxppc-dev+bounces-9510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1CADF761
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 22:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMvp94TQYz30VM;
	Thu, 19 Jun 2025 06:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750277057;
	cv=none; b=BfEjuE+ioNFQfByqBRrFX3yvq7r4TnfmPDbvOntQGtwNGLG5Jiw41ZzXG5u3toWI4sMUTEUECyVCevCHrzGgQpDP6gPZr/ckdvgfm9NCTMwbjcSjGLzAutangUs+uM+Y5GZZbkUWxYnzIbnE7VbpZHlSZmm/1pS4VmYRrf//EcwBVnC7yLAB4cLhTlX0KK5uBW+2fQxOyhyURZJknPrrDn2rsmxUul/qtmUO/1W9f+DWUkI1kk7rECkU5W2rC/4Q8OU26ctJiWfoUZUugQBxhhNnMV08+u7TJ+Z+EIGlCIofjsABqOcrE+evbFLxbkylXKzV5hhlwNnBCrE/4pSOaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750277057; c=relaxed/relaxed;
	bh=r+yILtYkX3FnYrUMXwUjtoYSq4aCkMrSL4SJ7/KGbLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+mFWhc/FI/WMg3JOYOzSCfYIvh6sI8lnRGAFG6lYg7pi2WLokMcuu9bFFF3g2bPtTTsoLht5cye0SwhqAxTktqcVYTmsqEaySOCDqjnQVU4j1Wqlv5csv5U3MPt6WTaw42q5yd9yDurMje5owpPRcvckdwfMQ8ooinTS99MjiEbH2qJuW6Xt3IQoN3zcQHzqRNDFreBlDGy3HOYVyAiag1hF7VI4mbQdlMOL07L+lB5DkD7TQO2kWZOZDWc/mhthdthmFzB32NbbfaeDaJsgtDHZrsAb/Z+kG81GJaP9EpUWQseYd9PKtTkdhsxKqMXYbAiHAbEYzbOH2z+dHIhOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ieseRAba; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ieseRAba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMvp81C66z30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 06:04:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r+yILtYkX3FnYrUMXwUjtoYSq4aCkMrSL4SJ7/KGbLA=; b=ieseRAbaE2EB/gg0UrA4lAg0ya
	OMIrk68qActWNIrlU4+o3MUxlOdzs0sAzy8pvh0C+/FzDPucczlLfYPfD00o24KCkCuH+FFOkwmhp
	R1YimiUoY/XcQ89JvDBIwxhHk6PC6vuXgeyDcRBuG+/scNqdcGd/AmB3MCUJEVczHYhsFH/HtCuBD
	QUWwg5HM3SO54YGjy9XPxlOrywxz6rlNYI4GbAr78NL3JYgieExT9cy4hxQWUtJGM3OQ5TZX+EmC6
	ynJh94nA0G2clxmoy3o2IEFglpHpJc0flDhE2COS7zRIswWNpdaBNi0IJZT6aqdC3OgNSoC27mXmb
	kXWvpJxQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRz0r-00000004xfj-0q6I;
	Wed, 18 Jun 2025 20:04:01 +0000
Date: Wed, 18 Jun 2025 21:04:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Minchan Kim <minchan@kernel.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 08/29] mm/migrate: rename putback_movable_folio() to
 putback_movable_ops_page()
Message-ID: <aFMbsdPYhcL8fyOo@casper.infradead.org>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-9-david@redhat.com>
 <AD158968-D369-4884-806A-18AEE2293C8B@nvidia.com>
 <aFMQ65hUoOoLaXms@casper.infradead.org>
 <DABB8764-8656-44A8-B252-0240F53BC0E3@nvidia.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DABB8764-8656-44A8-B252-0240F53BC0E3@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 03:25:46PM -0400, Zi Yan wrote:
> On 18 Jun 2025, at 15:18, Matthew Wilcox wrote:
> >> Why not use page version of lock, unlock, and put? Especially you are
> >> thinking about not using folio for these pages. Just a question,
> >> I am OK with current patch.
> >
> > That would reintroduce unnecessary calls to compound_head().
> 
> Got it. But here page is not folio, so it cannot be a compound page.
> Then, we will need page versions without compound_head() for
> non compound pages. Could that happen in the future when only folio
> can be compound and page is only order-0?

I think the assumption that we'll only see compound pages as part of
folios is untrue.  For example, slabs will still allocate multiple
pages (though slabs aren't migratable at this point).  The sketch at
https://kernelnewbies.org/MatthewWilcox/Memdescs supports "misc pages"
with an order stored in bits 12-17 of the memdesc.  I don't know
how useful that will turn out to be; maybe we'll never implement that.

