Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23190FAE4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 11:15:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CgTf6LqPzF5JT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:15:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=jack@suse.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.cz
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CgQY6QshzF7cx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:12:21 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 826B9B3ED;
 Wed, 13 Nov 2019 10:12:15 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id CA3AA1E1498; Wed, 13 Nov 2019 11:12:10 +0100 (CET)
Date: Wed, 13 Nov 2019 11:12:10 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
Message-ID: <20191113101210.GD6367@quack2.suse.cz>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
 <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 13-11-19 01:02:02, John Hubbard wrote:
> On 11/13/19 12:22 AM, Daniel Vetter wrote:
> ...
> > > > Why are we doing this? I think things got confused here someplace, as
> > > 
> > > 
> > > Because:
> > > 
> > > a) These need put_page() calls,  and
> > > 
> > > b) there is no put_pages() call, but there is a release_pages() call that
> > > is, arguably, what put_pages() would be.
> > > 
> > > 
> > > > the comment still says:
> > > > 
> > > > /**
> > > >   * put_user_page() - release a gup-pinned page
> > > >   * @page:            pointer to page to be released
> > > >   *
> > > >   * Pages that were pinned via get_user_pages*() must be released via
> > > >   * either put_user_page(), or one of the put_user_pages*() routines
> > > >   * below.
> > > 
> > > 
> > > Ohhh, I missed those comments. They need to all be changed over to
> > > say "pages that were pinned via pin_user_pages*() or
> > > pin_longterm_pages*() must be released via put_user_page*()."
> > > 
> > > The get_user_pages*() pages must still be released via put_page.
> > > 
> > > The churn is due to a fairly significant change in strategy, whis
> > > is: instead of changing all get_user_pages*() sites to call
> > > put_user_page(), change selected sites to call pin_user_pages*() or
> > > pin_longterm_pages*(), plus put_user_page().
> > 
> > Can't we call this unpin_user_page then, for some symmetry? Or is that
> > even more churn?
> > 
> > Looking from afar the naming here seems really confusing.
> 
> 
> That look from afar is valuable, because I'm too close to the problem to see
> how the naming looks. :)
> 
> unpin_user_page() sounds symmetrical. It's true that it would cause more
> churn (which is why I started off with a proposal that avoids changing the
> names of put_user_page*() APIs). But OTOH, the amount of churn is proportional
> to the change in direction here, and it's really only 10 or 20 lines changed,
> in the end.
> 
> So I'm open to changing to that naming. It would be nice to hear what others
> prefer, too...

FWIW I'd find unpin_user_page() also better than put_user_page() as a
counterpart to pin_user_pages().

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
