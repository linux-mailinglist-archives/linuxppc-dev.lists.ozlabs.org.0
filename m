Return-Path: <linuxppc-dev+bounces-9494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684E9ADF60D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 20:39:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMswL0lnpz3c6n;
	Thu, 19 Jun 2025 04:39:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750271970;
	cv=none; b=bC5a1kN/bhjMhOa0117WxWBLMhPPbL+s9m94W+GbfrHyP9j8lm1PD6p7fMpv00Qs2/kvHQejj5h060JALZTSLoGGJ9ts11bVnOKZN4d7RH91znd4E3/kDU3MwOzE1B3FX7SWywnK9WIYJr/egbegTEfROKfYeafSoszjcRlizfrUq1o2yET9h1EMiubvr3leabNfqPQYHi9fRfQEa51XflCu/3VP54CibPDORZbvtgZgzbEsleqn9nArMzG8S3v9+6sRITW96r0f4o2Q+qu23NNY7S3HkMbSWMludU0IdOinBOwLqNQZX0sBGVbgSxJtKQyPGEOq2BCB5DLwWlNDIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750271970; c=relaxed/relaxed;
	bh=v5tYhFD1j+yv3Iu8PpEhj2ETO0QbZsDAEopsQ/A9bAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owB/CH0IwqKOGmX1negfNInR2TtJKajGFnE/GXUp0zjnmgT8eZ/6Vr13aN9jgmkLS88TFESJG0SdpiS/7fUs0d4PrseeWbvHC7CDoh+73K7cGZTGSD+5w+/h9JUhgWmRBDLOCNRr+z0hq7SyNkVCRnQ3F3bRI6aC5dt7tZQm86X+wERgK2WEVz2U5OyIuo7V/F6zcLV9VmdHYD1gt4nbulyCip4GkMuRZkDZss+oCVPdb2pdXTsKFT0gN4Er/Ra6YKQy7weMhAkqHMCGYTSbVOK/FAIVSRFIJ2x1PpZQK+I9kfhsfwFhqT8WcFPuZlE3BaqVfnvEoNJUvIJDR0YH6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DsxNna+m; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DsxNna+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMswJ41zRz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 04:39:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=v5tYhFD1j+yv3Iu8PpEhj2ETO0QbZsDAEopsQ/A9bAk=; b=DsxNna+mqd14Y1R+bYWGnLXAQZ
	KD6LPHyGeHF0KI/3kpZdMUU/dhkMhaL8WEah3c3V+49Ysvqs6Bu1vdm9Vpq/S7pzTkPI7eJtMEYxU
	uBoRjKpFcj6CN3GQQtP1DGIdK3sIxGUq5tAbQdEdFNW6f1UST3AvhDLuU1qvMN21EAerKLDVmvRmF
	Bz18Agad3kUCnPAoloNaQzMvUnGOBL6wdnqo4xVUjT0N58jBE6K3YMI7r0d/dCaUiT95wlFWeD+R/
	7Mj3cTV1CtHQkWAw/n5cxdS/2TVEKUTcA+WwGRREV4fUaL5WvVYXbK9HuC1rY3t6P+y7zHGbMhwx9
	5BjmFRZw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxgn-00000004Z0Q-0yr0;
	Wed, 18 Jun 2025 18:39:13 +0000
Date: Wed, 18 Jun 2025 19:39:13 +0100
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
Subject: Re: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to
 isolate_movable_ops_page()
Message-ID: <aFMH0TmoPylhkSjZ@casper.infradead.org>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-8-david@redhat.com>
 <9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
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
In-Reply-To: <9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 02:14:15PM -0400, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> 
> > ... and start moving back to per-page things that will absolutely not be
> > folio things in the future. Add documentation and a comment that the
> > remaining folio stuff (lock, refcount) will have to be reworked as well.
> >
> > While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
> > it gracefully (relevant with further changes), and convert a
> > WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
> 
> The reason is that there is no upstream code, which use movable_ops for
> folios? Is there any fundamental reason preventing movable_ops from
> being used on folios?

folios either belong to a filesystem or they are anonymous memory, and
so either the filesystem knows how to migrate them (through its a_ops)
or the migration code knows how to handle anon folios directly.

