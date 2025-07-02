Return-Path: <linuxppc-dev+bounces-10029-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67DAF1153
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jul 2025 12:10:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXFyz51Qnz30LS;
	Wed,  2 Jul 2025 20:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751451051;
	cv=none; b=ksIjFJ+ISG4sRsgaZC2mqfWOmC4e9A2B7R7VEwaAilx7V7zy3Q56gmP45o3PhUlfrCAGL7VxThXE22p9+TQ6Dsy3pPkbyrnkCCFQE4BmiSyNCKDmeuZjqBum9b8lLhKpEtcI6lo7/MESuzgahG/5S85dtbc0IoBXeEIEvTRsw080lwdaKr6KB7ePo9EO4F+As+K+ER6zhGuvN+ldBD9X1VTdORGZMp5MbaP8xSqzRcX2EA25Rh4/+cHiM4ZB4+E4cGWxEuKmYJOf5kfREoNu2Dpp+QQR8GH+4bV8eGfI/O5QfuQt3GFriDqf4rBkY5n8CaYw128/YYdCJD1IG0Palg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751451051; c=relaxed/relaxed;
	bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZh//cBIrpsWXp+MrsT7EKcGk4w2wlTFZcFFlvJrJHGPv05/xqA7Q0MrUWNAgYwWBu6iZLmW6R63CEswnU7Aggvwhv4TQb+Nkw1oXLEH2evGFU1x9kB81CmuscS2kBfvZoCbbZKas9sG4GHyjYsvEPCUbnT1m1/iUN4CEBWDGDIgHiLJrL6lyjUWzhAMXb08A/4ZOXK408DEpx46EuZWklW/VZvy3wq3Y4jZsTDN/Ug/nK6RHDTs9jE0+DqYq4xExs0sBlYvzeSor2O/tWQWzMkyhXufh0qxcFl5Oi5OdY8QlJrn0ypnbZxNgi1y03QseTJ1oOZDJrrY3lTvAFOUXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DDT5u4rE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DDT5u4rE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXFyy0Qh9z30FR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jul 2025 20:10:48 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234b9dfb842so38924285ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751451047; x=1752055847; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=DDT5u4rEHetTm4NO4oJ0Rt2G2zGRO52LveXQeOjXCa3r61Xcqy5VoDEanFV9sjBDKg
         ypsCeeztA1LJ+0Ej9cO56PkM1nckBUlHIyCJsrfGHwJ3fj37ZAY11hVlT/sLH3j3jnm+
         T+sA7NERya4ijJjduFjcuwvJI8V3YgpOHdVjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451047; x=1752055847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ld1XwWyA21yaiRgsO+RmuHJahSek4BWAE0bK6K3RNA8=;
        b=ej6lydJhSNHy6Egfv1HA1xUTuq9JuXRaXvUITwjYzSKO0VfNY7aw5P5n5BaTxt9trF
         J0TN3jYmJvzZrM5RJkQgo0obGKh0ox/GquJPtYXIIklayNSSvbodGhrJWCnuNnMR3Zc5
         wn3f+u18H3rCvsLCLy5MJcozrPMFxakej/p1D3cKlSxB8ozezR2XIb2rVbvbrv5Hr81/
         sEoaPyI3cXPudsni9b/xH7eaOFICqbIAA6lJCA9p9ENm7/NpJ5qAsHNSB5H/HwlxrpQU
         mbHX2T26QTuIwqOIIvaKXE7Uj87VtSRYcn4JtMFXxc1qEBUCtkm3yIbVKr43GISpZiDL
         kvPA==
X-Forwarded-Encrypted: i=1; AJvYcCWOiGzusYWEzNuoWJGh97Q/fzrWFIitO/S1cr5rJXL4CeAwNGmpIwV8v5mWGEFkeiYDSsVk3HxcfbMcnTQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRt7Ew/Kj2sDI0yCOlSyebZh3rol7J+NHRxXsxzUUEYD5buqMw
	vrao9rhO5Cass3C78VW8Lbs3B14zlGOeF1dq+uSGTf/sIc1BdqbrwQM2SahDxyxO6g==
X-Gm-Gg: ASbGncusVIdxHojGq+cHz4460yHtCj1E0M6DBCgWg9RzjEPpNKv9f8Db/erUEQuxL+N
	kxsbzc9WH40bq8JUeBSGiyL4+Wrxg8KCxw7PJz0tGZ9lBY+DpjoAHd+HAlIHfbEbmaHkM8fRsS2
	S9ItQ/951E9UHtFtcu5qwfX0rzygJD0NG90MqhxODSf4Vdz4EpVB0U+YxXWZK5wZK3CgiuUCX2j
	Fwe6IG+JDGD08p0c3Ut0Ow5CBLPcRcKvFNHnLSrkkt0U6uBUspMILVf4LoiG5sdaauoKzMUZC8Z
	sXAEnjbMpDC4VOBDZtT6aoBq4/phINSEnwXvZ6AJSrse7xDjhAyAzg8Lj50Z3OOcbwH6f+RjxcP
	0
X-Google-Smtp-Source: AGHT+IFD0I3P0mnZDdceuRH9XAJvvYKmYNHVDtVURKEkoHBc3BGVYVJeT3uh933j6Dzbu2Zpclzgcw==
X-Received: by 2002:a17:90a:d64e:b0:312:18e:d930 with SMTP id 98e67ed59e1d1-31a90bd4c31mr3078996a91.19.1751451046749;
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8825:8cdb:cb6b:8e71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5383eb6sm19125723a91.10.2025.07.02.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:10:46 -0700 (PDT)
Date: Wed, 2 Jul 2025 19:10:34 +0900
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
Message-ID: <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
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
In-Reply-To: <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/07/02 10:25), David Hildenbrand wrote:
> On 02.07.25 10:11, Sergey Senozhatsky wrote:
> > On (25/06/30 14:59), David Hildenbrand wrote:
> > [..]
> > >   static int zs_page_migrate(struct page *newpage, struct page *page,
> > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > >   	unsigned long old_obj, new_obj;
> > >   	unsigned int obj_idx;
> > > +	/*
> > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > +	 * isolated: we should disallow that and defer it.
> > > +	 */
> > 
> > Can you elaborate?
> 
> We can only free a zspage in free_zspage() while the page is locked.
> 
> After we isolated a zspage page for migration (under page lock!), we drop
                      ^^ a physical page? (IOW zspage chain page?)

> the lock again, to retake the lock when trying to migrate it.
> 
> That means, there is a window where a zspage can be freed although the page
> is isolated for migration.

I see, thanks.  Looks somewhat fragile.  Is this a new thing?

> While we currently keep that working (as far as I can see), in the future we
> want to remove that support from the core.

Maybe comment can more explicitly distinguish zspage isolation and
physical page (zspage chain) isolation?  zspages can get isolated
for compaction (defragmentation), for instance, which is a different
form of isolation.

> So what probably needs to be done is, checking in free_zspage(), whether the
> page is isolated. If isolated, defer freeing to the putback/migration call.

Perhaps.

