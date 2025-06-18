Return-Path: <linuxppc-dev+bounces-9488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A12FADF578
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 20:07:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMsCC6qS3z3c5M;
	Thu, 19 Jun 2025 04:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750270039;
	cv=none; b=Y8usbDCcZWfhhKYsP7I8KSI0PbPEkh81XrL/GeNsogurHQs25G2Sm1/e1IjROAQCZDDZYvoQCvfm0bB4qP8bBXu5aziF3OSYEy6WId7c0t9ExScnkCL26m4BgzoCkwMKyy90UwMmhrBi4a+l+6CUWu2X/eFf5uCSxex8aIqoR4DVfIi1/diH2MO6t/D57sPKAVw71VksQhrDqoO+CmFMBhFf7i8puuFVl2pAgXnwyshwKH6+mYJhH65Q6YMQhgDmWAgPGYNCZj5h9v5SjTWUkzoGQpL8dFxZMz1Ye5jZivQuLb6HARqkJWrU/3r6BoDPnzYYab62hzdck1bNfUx3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750270039; c=relaxed/relaxed;
	bh=J4aHyFboA5TYykyYa0Jlj3sw+Op0fhB4LmjH5FwOZd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vvdj3WrbIG8xvIdM2yEIUcUq0HiUeYb/BwBGgyXUBDzYiLHO9p14zU22bC3n+/2E9gvsX/DDaDjECxwzZ+zaUQRi+rtWqg0Z1K9N17h1nDehH7ZyjOTG3fPTc5ZeKbGJB2B4HWaiNxzFYnoszNh4uXI3f6qN98qujMZMuWaMd1O0xzla/KilX5804/sCdQyZnIcdD4XzvNoyIj4fuhuFe40J9zU5+OjcavDYkrF4D9vF45djrpyiAFBW2SnmCUkQYIq9dy4DUMpGVvq2GGZAoQS9O1sNJK2mlnyBYWw7rVipAt4LyuVLEJ4x/viej6bP0CHMb5HIP0B3V7EPAlvmtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=a6vX8oca; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=a6vX8oca;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMsC86Vchz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:07:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J4aHyFboA5TYykyYa0Jlj3sw+Op0fhB4LmjH5FwOZd4=; b=a6vX8ocaJ2qS7neeTyXhBP7TAr
	68s84eCnuZZugY9yDOtXOq+dInzY5Ri5o1cXxQPO0n8jy33xnrOkeWCEu4QW7VV+U4h64MOtP9fr4
	0TidPl1vB3ZLyUTFgZLx8jesTt4rgniAKKkrD6SzwP6j6ysUVfvFh9sUsWlTCWgvHZVAL7ZIqIaVq
	AsbGHPyCc+UKKfMpxx+/CBEE1jSLbt2G9bE9rKAgdRGaVt2xAqhiarAo33obYqKsLGkEwakZfOz+5
	oyN0+y7fCwzCDk1T59eooIug+hjqFPgBzcAXivpBb2u5dmg9CY76FgERkyiExRHDtkJiXJrLseR5r
	UFeLDxPQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxBa-00000004U8i-3jag;
	Wed, 18 Jun 2025 18:06:58 +0000
Date: Wed, 18 Jun 2025 19:06:58 +0100
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
Subject: Re: [PATCH RFC 04/29] mm/page_alloc: allow for making page types
 sticky until freed
Message-ID: <aFMAQs25hGnAq-hn@casper.infradead.org>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-5-david@redhat.com>
 <D80D504B-20FC-4C2B-98EB-7694E9BAD64C@nvidia.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D80D504B-20FC-4C2B-98EB-7694E9BAD64C@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 02:04:18PM -0400, Zi Yan wrote:
> > Let's allow for not clearing a page type before freeing a page to the
> > buddy.
> >
> > We'll focus on having a type set on the first page of a larger
> > allocation only.
> >
> > With this change, we can reliably identify typed folios even though
> > they might be in the process of getting freed, which will come in handy
> > in migration code (at least in the transition phase).

> > +	if (unlikely(page_has_type(page)))
> > +		page->page_type = UINT_MAX;
> > +
> >  	if (is_check_pages_enabled()) {
> >  		if (free_page_is_bad(page))
> >  			bad++;
> > -- 
> > 2.49.0
> 
> How does this preserve page type? Isn’t page->page_type = UINT_MAX clearing
> page_type?

The point is that the _caller_ used to have to clear the page type.
This patch allows the caller to free the page without clearing
the page type first.

