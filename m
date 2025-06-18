Return-Path: <linuxppc-dev+bounces-9502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA7BADF6B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 21:18:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMtnC0BWpz3bcj;
	Thu, 19 Jun 2025 05:18:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750274302;
	cv=none; b=knAqAi9/oBGU5VJpNmW7QugiVBQ3VjfDrJ0SwId5Fcgb6u2uv8PY8haus6ru1FJ8qSP3WsGnntwhFVXtSfhwG29OK392B+2AxWRMUzrlMnQ6zMXMdXG16KYvw0jD5JW2rsjrN2afyUUtYZk4yMRB89x3l/QMrQ+a3PTENfhT6KZwr4QnUU4ID4PFMXi4XpS4nZYHq1JluZSfP+B7h22QlF/Xcluh/cvtKftRHJ0BQiRc4kVIiqVNfaV47eQDqdSPlZvMfvgBojDciis+fgOvfOiAQt7JLm4FkO7W0gfjcoos5NmtROVkfTrwB39u1lCTfOSc0DD3U9ihdKjAAsCrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750274302; c=relaxed/relaxed;
	bh=8hntqsSm7ttpU2p3v9XMZdIXXcuDbNK0+BZVau+dW3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uq7Dwofiu2HbxS4DpZkNYq043LpgDdwSuiK2VffuBQR5JbtsLIS+KSX38Lt6veRK8rMjqSb4zD183jOj0efqOCw3Qs5HQptTWyc4jytK+BXTCyRq/g9HhO8Jf6nnjYhAR7TCMK4/8j80JIu8xxiH8MUPdkIruhOyR20qog73rF5diIQAaOYXxgrZzd7rrAiPbxdYAWBtcwE9UE1RAYqUhaYShFuc/e0hk8XccEdniOyLtK+NbhQM/SINNyxUlBFE2eHqvWF31Jpm5Wt5qfsrEsBdVaqASUmDD5X5VyxpB3UvuecK7B5S8EG3Xl56vOnCZ0eUg4osmQX8GjbyELajXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uxWTjN/+; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=uxWTjN/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMtn82TQwz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 05:18:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8hntqsSm7ttpU2p3v9XMZdIXXcuDbNK0+BZVau+dW3k=; b=uxWTjN/+ZWc+mTjBMRrp/oTsXW
	rnH540ClGs1DNrTnrTu8s8zdw72fa8ksy2E3fwirF0Tkn52OUhXgWXhaCsyhvWsUVTX55kVNy8YQj
	MCSW9Rl6c+qNx/WyXrJZCN7CWw+S26o6oF0PH+Xpc42Km6pTCtbsPIhLeO7f2toarX3K6oeojX+HP
	Wyn/eU55xKr3xiE3iMbBU8LkO4HEak7HXqbLdGOfXrtXYkL/c43HdgXdRHekTOG9H+ihWaRphVSnA
	H53jr1wk84BYDLQEZRUKbRv6gsckr3u0EDiswDQv3XKSdVhnREeXbczHdYwBqXH6OZgi16c/dTDqd
	c+X5pPGw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyIO-00000004eRU-0SVD;
	Wed, 18 Jun 2025 19:18:04 +0000
Date: Wed, 18 Jun 2025 20:18:03 +0100
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
Message-ID: <aFMQ65hUoOoLaXms@casper.infradead.org>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-9-david@redhat.com>
 <AD158968-D369-4884-806A-18AEE2293C8B@nvidia.com>
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
In-Reply-To: <AD158968-D369-4884-806A-18AEE2293C8B@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 03:10:10PM -0400, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> > +	/*
> > +	 * TODO: these pages will not be folios in the future. All
> > +	 * folio dependencies will have to be removed.
> > +	 */
> > +	struct folio *folio = page_folio(page);
> > +
> > +	VM_WARN_ON_ONCE_PAGE(!PageIsolated(page), page);
> > +	folio_lock(folio);
> > +	/* If the page was released by it's owner, there is nothing to do. */
> > +	if (PageMovable(page))
> > +		page_movable_ops(page)->putback_page(page);
> > +	ClearPageIsolated(page);
> > +	folio_unlock(folio);
> > +	folio_put(folio);
> 
> Why not use page version of lock, unlock, and put? Especially you are
> thinking about not using folio for these pages. Just a question,
> I am OK with current patch.

That would reintroduce unnecessary calls to compound_head().

