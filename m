Return-Path: <linuxppc-dev+bounces-10068-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C596AF67F0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 04:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXggJ6QXZz2yPd;
	Thu,  3 Jul 2025 12:28:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751509724;
	cv=none; b=AuAfggMmaOJuyarpQtC+ujzCesFvDK7f9KqEWHxzFwi155iPWoixWJpuiqBiim8NPjGe/NjQxvrmnBWTl6wReMCqHLvlM8He3fd+zgepmaEU8y/aIi0wjUKDXvTCZHNA08gD7sxOLQfPbyeZgcvRR6339bkDCoMdaTewx9m3zIPm0RWxxY25Rcm9xsL1nj3/9eQaCtg+MbI9tHyvkcnvGUdc/oronEqZFDPGMg183ClIBxXZYuxdZa1y0jXcQUL7/6O9gf5sQWeFVqP836e6x8LQTgFR0VdEdR/tHVbzc42psmnD1M2UWwrDZIFbrxc63vQRYEoYmyhaAFk11caAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751509724; c=relaxed/relaxed;
	bh=t2nTXIo+CvpirZ9A1QVaQpQOlJd4MreiW9qDAdilxYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wk8JZ/1LGwpclRjlcXmejnHzBaSs4GL9wjDp/GFoF8OYgRUqEfst6Y6D5PlCak6cDKaYt6FTf7G4fr48eyslqfOApEkgP11pXRGFUzObv7uqrIJrL5YNq/AjlQ5g2iVhv/J6fKvlhr5949r5a9IahG0tYZIqCKK2A4kM8OKCpsBCnhDtCPxerNXziECGOTTAPUW6GuNMap7dZr83Sf6sT4kDyUZCevefZhcefVUo4mkeHaceQYv0VIm14bGkFhafvoOoDroJ2TPou3hVn6TgfCohl1PQy5D99jEUs1DxkcH6MKnAqei0yLCcM0+uywlHQ+Dk+LTe6GBSLP6nPAG5ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZQCdsJN3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZQCdsJN3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXggD1gnjz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 12:28:38 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6139608b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 19:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751509717; x=1752114517; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t2nTXIo+CvpirZ9A1QVaQpQOlJd4MreiW9qDAdilxYI=;
        b=ZQCdsJN3exC3c34U3g3fwCYvUTfxOrNQIMOkvq6KdsKZj1HNWHA8tVA63MM36BEnl4
         f13xh32QE0BDOj38TdzrxaNLZF7G72OK/BSr+HWD/BdbXik5OnsVQ0Bi9E3ESk43LO34
         1jtiO4wLxLEy2DVMMhoRUBqKXLg44dglQV9Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751509717; x=1752114517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t2nTXIo+CvpirZ9A1QVaQpQOlJd4MreiW9qDAdilxYI=;
        b=u/slypFE51unbTOlXV5911pCSvMn9IdrTlhN/0WGoMDgw7jYjR+jNiaN4lXWZlkrvQ
         zxnQnT31QZLNnUgWsIZNRDAh2hkgGwajZBFj6PSUxQiWoNgYfw5E2rwGQ5JjcMxs3B5r
         QEBbOAhBmXCNFQSjPL23GRHG6HvKWQmwpChd+lnpMa8uHDPdOycSPMz1f3SATK0OV8lZ
         PLLr7Ybk9bqjfrl/0ve2Xi3alUwvAOg8MnxP5uCYQktcF+5NfBhXFLCxAQj7XpnfIqVT
         PVHs+dCtfzID9BaQWPFkpcPDP41Fj+8/9lsF9Cnb1gFgjMmKGF8+JJWa0IqH1P4UOT/w
         vYTw==
X-Forwarded-Encrypted: i=1; AJvYcCXE9UZ6aWieovqZtyEKvXgnXrlSsP24W1EjX9xLk2ZIsIVpigUrA1lGTtVtyknFz3LSOqAfPIMNsjMraM4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy8Rp+HgKJwvRBiFR/cSG4vHCfCvCpLuFKAG7jEV0dKqw6nuuLP
	NRYZlq0YbniPXKrUp0wx5FizRj3t4hViA0KRKjnO4OskKVWtHite4/6JvHqFH6jnmw==
X-Gm-Gg: ASbGncv+YSbF7B26hCrueK0j8ZtDUiYC5HM3/ZMDjViAquuP1iVOlx269N+is4vD1Us
	pLlvoK6bruAhhhDQkbMZyb304DijESG8ICUokoYOmx5x0K2IGMCgE/iU9pV0+f27rkme8Fvgm+4
	XS0dEuRlyqOpsQQ5I83PwhVuO3RJLr/AFQDRK1gkSyw2N75U2ZfzauNo/xUdNaPbWk63nERCbc4
	c/USzoypMqq3hg/GnhNyi+nExYlqW5pCwPke/d2FMpwLZ8MEKEhQQBPMjynnbeA5Le+nDhFquyV
	hH+QRIHXpz51woLeJ5VrWlueEx0ZNgfBajbUjpE3V3kGLlrlcMR6qGC38lz4d4K3JA==
X-Google-Smtp-Source: AGHT+IF0mvA6yS/npwsiNYiL0/8VVavPM/4qMbTse5ZctfFIAIwQSgruKczXUi/oxdeocj+35zKyHA==
X-Received: by 2002:a05:6a00:3d11:b0:748:de24:1ade with SMTP id d2e1a72fcca58-74c9980d533mr2410295b3a.7.1751509716701;
        Wed, 02 Jul 2025 19:28:36 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e3f:7c33:158f:349b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541d23fsm15895056b3a.59.2025.07.02.19.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:28:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 11:28:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
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
In-Reply-To: <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/07/02 12:55), David Hildenbrand wrote:
> On 02.07.25 12:10, Sergey Senozhatsky wrote:
> > On (25/07/02 10:25), David Hildenbrand wrote:
> > > On 02.07.25 10:11, Sergey Senozhatsky wrote:
> > > > On (25/06/30 14:59), David Hildenbrand wrote:
> > > > [..]
> > > > >    static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > >    	unsigned long old_obj, new_obj;
> > > > >    	unsigned int obj_idx;
> > > > > +	/*
> > > > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > > > +	 * isolated: we should disallow that and defer it.
> > > > > +	 */
> > > > 
> > > > Can you elaborate?
> > > 
> > > We can only free a zspage in free_zspage() while the page is locked.
> > > 
> > > After we isolated a zspage page for migration (under page lock!), we drop
> >                        ^^ a physical page? (IOW zspage chain page?)
> > 
> > > the lock again, to retake the lock when trying to migrate it.
> > > 
> > > That means, there is a window where a zspage can be freed although the page
> > > is isolated for migration.
> > 
> > I see, thanks.  Looks somewhat fragile.  Is this a new thing?
> 
> No, it's been like that forever. And I was surprised that only zsmalloc
> behaves that way

Oh, that makes two of us.

> > > While we currently keep that working (as far as I can see), in the future we
> > > want to remove that support from the core.
> > 
> > Maybe comment can more explicitly distinguish zspage isolation and
> > physical page (zspage chain) isolation?  zspages can get isolated
> > for compaction (defragmentation), for instance, which is a different
> > form of isolation.
> 
> Well, it's confusing, as we have MM compaction (-> migration) and apparently
> zs_compact.

True.

> I'll try to clarify that we are talking about isolation for page migration
> purposes.

Thanks.

