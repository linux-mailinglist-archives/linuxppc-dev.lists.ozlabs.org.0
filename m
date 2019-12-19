Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D17C126F67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2019 22:09:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f4JB459YzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2019 08:09:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="I0eeHPXE"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f4GH23RczDq99
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 08:07:48 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id n15so6262296qtp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2019 13:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=b1m6ooTcPBF03IyS8tXbQFWmui5q38MZyl7sgcWDrVc=;
 b=I0eeHPXEKyhR6F3+w0uZp8nZL74lZ+A5yJ1jcW4KB5MO7vY9ONwJPcIUEGlT8SbUeO
 LH81YaW3GC7SMUuObdRRRlnGzTOYLS475Sg1mUPvLmi4JlCQaPrNqV+lDtlEr4ByHobI
 ZOHWHIxyfXKwjF07HIG3BbuRvW3BGN4Y76jyGe62WEFR0v3gEx92h1yDdyRSLYhNDwBJ
 tpCIZrQ8KxYH2/vN+ZSvjy5imMLbf+TFj3Y+cP0N+OLWwhHVLOxCMvkJX7OZ7EDojcBc
 GAxbNt0FBcreyN8pFhlQHApx98BWQ2R7K6v8eS90taP+fCjutUcn9h1snaULI5tTj6Dz
 Afvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b1m6ooTcPBF03IyS8tXbQFWmui5q38MZyl7sgcWDrVc=;
 b=gxcCrFQVYPlcm4+35249eQKdLJJN6aazwwl0sQHLeJIEzCktPMfqJKGD6NBYxD+vtT
 FRIEFkeMob+IYcFT66rTBwinJKCx6k1hkz4HqhgblJ+yW2jWlHvJQ8bGcAsyenVwfYJt
 tU9MRvYp8tLhu6DBcc4hc96/iT0rGilZLbEK/bl94kaQjKm+eNhMGMH+1fwQb9owLUD0
 10x4uLZntoAeJebbiqWxL1MK7OLXGpYh0EJ/YKNN8njDmiAIkBbHk7rEZ2/zEHtnNc5s
 35bmbyU3s/G+S18IcL6hvamlN40SBtPxtnnCmwocn4BL/KJr7RP5hH2hXQ1EqEKhfEZd
 hX1Q==
X-Gm-Message-State: APjAAAUnYSkTWOzdx06fUJZLOxsfaVPOBHIHA2O4z01LcUScKuV7ORyq
 a3b80VKiQduyIuk5dMrGEbWMPg==
X-Google-Smtp-Source: APXvYqxVnwIXGsi0o/bO9dZGQ7XuTOfFwgCWi/4t790OZPxPymgdPJt3SfFmZqkv2903tXMsYUoGBQ==
X-Received: by 2002:ac8:2d30:: with SMTP id n45mr8586782qta.203.1576789665577; 
 Thu, 19 Dec 2019 13:07:45 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id m20sm2085982qkk.15.2019.12.19.13.07.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 19 Dec 2019 13:07:44 -0800 (PST)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1ii31L-0007mU-Uf; Thu, 19 Dec 2019 17:07:43 -0400
Date: Thu, 19 Dec 2019 17:07:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
Message-ID: <20191219210743.GN17227@ziepe.ca>
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Maor Gottlieb <maorg@mellanox.com>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Vlastimil Babka <vbabka@suse.cz>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 19, 2019 at 12:30:31PM -0800, John Hubbard wrote:
> On 12/19/19 5:26 AM, Leon Romanovsky wrote:
> > On Mon, Dec 16, 2019 at 02:25:12PM -0800, John Hubbard wrote:
> > > Hi,
> > > 
> > > This implements an API naming change (put_user_page*() -->
> > > unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
> > > extends that tracking to a few select subsystems. More subsystems will
> > > be added in follow up work.
> > 
> > Hi John,
> > 
> > The patchset generates kernel panics in our IB testing. In our tests, we
> > allocated single memory block and registered multiple MRs using the single
> > block.
> > 
> > The possible bad flow is:
> >   ib_umem_geti() ->
> >    pin_user_pages_fast(FOLL_WRITE) ->
> >     internal_get_user_pages_fast(FOLL_WRITE) ->
> >      gup_pgd_range() ->
> >       gup_huge_pd() ->
> >        gup_hugepte() ->
> >         try_grab_compound_head() ->
> 
> Hi Leon,
> 
> Thanks very much for the detailed report! So we're overflowing...
> 
> At first look, this seems likely to be hitting a weak point in the
> GUP_PIN_COUNTING_BIAS-based design, one that I believed could be deferred
> (there's a writeup in Documentation/core-api/pin_user_page.rst, lines
> 99-121). Basically it's pretty easy to overflow the page->_refcount
> with huge pages if the pages have a *lot* of subpages.
> 
> We can only do about 7 pins on 1GB huge pages that use 4KB subpages.

Considering that establishing these pins is entirely under user
control, we can't have a limit here.

If the number of allowed pins are exhausted then the
pin_user_pages_fast() must fail back to the user.

> 3. It would be nice if I could reproduce this. I have a two-node mlx5 Infiniband
> test setup, but I have done only the tiniest bit of user space IB coding, so
> if you have any test programs that aren't too hard to deal with that could
> possibly hit this, or be tweaked to hit it, I'd be grateful. Keeping in mind
> that I'm not an advanced IB programmer. At all. :)

Clone this:

https://github.com/linux-rdma/rdma-core.git

Install all the required deps to build it (notably cython), see the README.md

$ ./build.sh
$ build/bin/run_tests.py 

If you get things that far I think Leon can get a reproduction for you

Jason
