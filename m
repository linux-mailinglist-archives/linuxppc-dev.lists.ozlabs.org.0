Return-Path: <linuxppc-dev+bounces-10069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC51AF68A2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 05:22:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXhsX46Mjz2yf3;
	Thu,  3 Jul 2025 13:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751512960;
	cv=none; b=mfC6KmF6hPcMDsWxwyT9UAsc47NDYYwHp7Ajhjcanaq9+UyhTkD690R2GacslmFThICc2ZHvIZdU66I94rCmNoRtuNjCmdkK3bkG9gq0U0piGL7U71pOn0UNZdlGYsWnRmhDgejdyvhjyoMIaJNK400L1q8dYJWq3dwrzvaHtvnaOPq2jOLbQrK8CUnxjnXQ9ku0urbzMnoAAmrCdiUP2XS313E88ZhzSS+LZvAL9Ee1wwstPg/qHWd975WgF04B7ctrkT7V5qrsxzMOGvz4i8dXeYSHqDdC1l2r4t9yjbhaKl3gUmxVw90thA3nPdmAGmLqULUCeNMES73simORpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751512960; c=relaxed/relaxed;
	bh=u3/FURbw0Qjice8ym2SrrqkCxrOCjqZwE+s45rYEO0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJEKkIdvMa3pnFL8A4hC7CrCRL2ltT1eOd42PvHeRyAUrEeFbwWFFQm0f8311sidbLCVxfS8Rhg84tGtABygWD0bB7gNxojqqWTw4r6ty/kbzOnQey3ljqRtogvgovyFmfcCTPZMrnuFKtCrlwpQO97poYBOhTfa/xwPaPbsUjoaDJg/akFTFXo5pCz6mQdPwJy8RQLDIiS8ED/Oj/In4s2yOTQxtoTYIVFZLs5WR4jqilD6PvyWVe+s/PbtWzzoRxKGVmdxm92HimzQCGtdOJ5sQu8+hKlQiFaZCugel690YVYkYAtGpg0qZPkTQnxuEsuboBl1newNuFto1+M8Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ge0DBQe2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ge0DBQe2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXhsW3PsRz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 13:22:38 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso4593603a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jul 2025 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751512956; x=1752117756; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u3/FURbw0Qjice8ym2SrrqkCxrOCjqZwE+s45rYEO0E=;
        b=Ge0DBQe27rf3D5gmKsB5KsmUnRjlh+oNjyfbfzTt1G4DTiXobrPZinAJw98zqo8rWj
         ANerf/k1ckh8mZxIsTqmxEOK66T9t9AeVl6cg5wtb4mLZK/CTdq7pqDJIEQghWaVuLfx
         V8r+hRX15QxAUmp9G77GxvZleBEkfM0I2DIWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751512956; x=1752117756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3/FURbw0Qjice8ym2SrrqkCxrOCjqZwE+s45rYEO0E=;
        b=AF1CscS4v3r752qLdiAXZKDSLLhhxsqYcuj/NmaA2Ruk8/hw9llL39YY1XV5du7mr9
         i19Ix/idnzvJEYrpE5MdNrjieqww1+JGcfFYdpJ0ktpfaA/wC/E1w/1R7nQ2uAV9edOl
         3FaxkZXJF3ZlxThP+nZFeusllH3gIfW7FM0pvrIgnQ79UxyG6X6qs/fO+RJP+Eb2ADJk
         EuApoQ7/MY+SmYMxz8xvYPC8b1GxIUmCv655r5Pcbo9k/zpmYqRq8yOjxfoiyTvEvuhz
         Nnhqy8FEqXhHK8TrlymvTR0jsqIs4ISZ65llZNO9iEfE8pdMr42Ui2txAHZDLoOaDdrS
         laLA==
X-Forwarded-Encrypted: i=1; AJvYcCVXf2GSWLjn5XtRkeP+j3NaTTHpn+xrIYYXNjwvEYiyc5t0/JDvr0fuOst1VP+Er99A+w37j5uzNotgnyc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyM7UW75P6Aiwaz8+Eq5dTku533uCWkIG3P0dI90/P1jbkW9KZQ
	w3P+VBjQLR29/yxeEJO+vfwFIg/wzIuw6ddpAnbA/mDCM45oUgcaqz3we7EXvUjIaQ==
X-Gm-Gg: ASbGnct8xWg5utKSlsSzbPzSJslYFBKf9FmvzMN/pCv5gcPKLFJzk+9KVXVMrs46fLr
	A2KAy7p84et9U9AXrdIm8v67EEqsjbj3gvEHi+FaZLcbAgKmrfgZA76bv0efkFKwS686aWpVGVc
	HPnH0Aty7fY4HY7SkGkKRBlEtptMP4p4P8a7B9zEKWSj43Nijg2vaDVSbk/nZWkD33pv288SfFT
	hNesCU/+2UpzYxoDR+XOYiiLpzw/7SbkfgHHt7zkx4SvejdEzmT3huZlBGwwZPG9b/Q0IsIvEPU
	dtnW4X7VQjYheoCzYS1Jm20jnzUerlkfOhVzYrkdTE8NNNlCrXcbuxjv+i3HXMQaUoubprko3w5
	8
X-Google-Smtp-Source: AGHT+IEAy0Xvd7q1RC5hmp7SawamH/oI/muiFAFExRx9I64wiUZ1PQhrNgi3qS6Dq4f35q/YwfITMQ==
X-Received: by 2002:a17:90b:3946:b0:311:e8cc:4264 with SMTP id 98e67ed59e1d1-31a9d545d21mr2763491a91.12.1751512955991;
        Wed, 02 Jul 2025 20:22:35 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e3f:7c33:158f:349b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31a9cc5204bsm1117959a91.8.2025.07.02.20.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 20:22:35 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:22:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
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
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
 <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
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
In-Reply-To: <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/07/03 11:28), Sergey Senozhatsky wrote:
> > > > > >    static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > > > @@ -1736,6 +1736,13 @@ static int zs_page_migrate(struct page *newpage, struct page *page,
> > > > > >    	unsigned long old_obj, new_obj;
> > > > > >    	unsigned int obj_idx;
> > > > > > +	/*
> > > > > > +	 * TODO: nothing prevents a zspage from getting destroyed while
> > > > > > +	 * isolated: we should disallow that and defer it.
> > > > > > +	 */
> > > > > 
> > > > > Can you elaborate?
> > > > 
> > > > We can only free a zspage in free_zspage() while the page is locked.
> > > > 
> > > > After we isolated a zspage page for migration (under page lock!), we drop
> > >                        ^^ a physical page? (IOW zspage chain page?)
> > > 
> > > > the lock again, to retake the lock when trying to migrate it.
> > > > 
> > > > That means, there is a window where a zspage can be freed although the page
> > > > is isolated for migration.
> > > 
> > > I see, thanks.  Looks somewhat fragile.  Is this a new thing?
> > 
> > No, it's been like that forever. And I was surprised that only zsmalloc
> > behaves that way
> 
> Oh, that makes two of us.

I sort of wonder if zs_page_migrate() VM_BUG_ON_PAGE() removal and
zspage check addition need to be landed outside of this series, as
a zsmalloc fixup.

