Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D129FAFF6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 12:46:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CjVq5g9HzF719
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 22:46:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ffwll.ch header.i=@ffwll.ch header.b="C0Dbe7TC"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CjRY4FCNzF1Rg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 22:43:20 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id i12so1991829wro.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 03:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NWmx5zlrVzI636UV5zn7jwNNYyPpT2kzazOSeqZFCPQ=;
 b=C0Dbe7TCduZqSim4I/9b7E74bGQO34GH/iKoO+dE+3EHLfWv1lLPGbvorBCoaRGMDb
 48v7HTSQHP1LaVgvLNGy/yOxyJTlvTeKuq2CZR/Q7GIgmnQIbkvYhHi8TV/Ec+0WSA8P
 awH+k+k5IQBNK5RO6uqKbJl7dFmz19ED4sy2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=NWmx5zlrVzI636UV5zn7jwNNYyPpT2kzazOSeqZFCPQ=;
 b=aM8fV1qyLoryrhF9ETL1HvpNiZAAyAx4HnHBSh7QZedSD79PI56cu0QcItuk8RaP6Q
 137FfAzwUlW9RdB1po8chltJBSesu1FvUrxXPTs+nF3RnHYuV72uOJyaZWEs7FrB37wM
 PGVfbeDiZlwt/iMx9mFfl+0OGJeSf/YmwpuEYE8sUwVMHjUEab0I5BjYpqmBFWoJjRJ0
 VEM+MrMH1yWiSnmanlFxsB4+x9AIgghlsUlGGaAEWLW+1MyYfKXxFv+F2+ekO81UVmiD
 YF6uuLA1S82TGvTpRwXcfZhBNkh0Enpsg4gwSSok2v1wihkGGmWdZOSSSqJ0g0EwAtf9
 x4LA==
X-Gm-Message-State: APjAAAWxbFFmisc57QoveL0Zdsqv4lC+zYJ7SUoZ/TtixR7V26MuZY0n
 yZifcp61QIe3ojrYaV1wN4ZQBA==
X-Google-Smtp-Source: APXvYqw4ALVmGTh9KFISsJCvLVpFEzXuyu2WMWEkcAdM7khXUlUWKA93QR1nKFP8k/o5YdLFIE0ItA==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr2625324wrt.219.1573645394576; 
 Wed, 13 Nov 2019 03:43:14 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id w4sm2544060wrs.1.2019.11.13.03.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2019 03:43:13 -0800 (PST)
Date: Wed, 13 Nov 2019 12:43:11 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
Message-ID: <20191113114311.GP23790@phenom.ffwll.local>
Mail-Followup-To: Jan Kara <jack@suse.cz>,
 John Hubbard <jhubbard@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Alex Williamson <alex.williamson@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Chinner <david@fromorbit.com>, David Airlie <airlied@linux.ie>,
 "David S . Miller" <davem@davemloft.net>,
 Ira Weiny <ira.weiny@intel.com>, Jens Axboe <axboe@kernel.dk>,
 Jonathan Corbet <corbet@lwn.net>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, Shuah Khan <shuah@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, bpf <bpf@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, kvm@vger.kernel.org,
 linux-block@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 linux-rdma@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 netdev <netdev@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
 <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
 <7b671bf9-4d94-f2cc-8453-863acd5a1115@nvidia.com>
 <20191113101210.GD6367@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113101210.GD6367@quack2.suse.cz>
X-Operating-System: Linux phenom 5.2.0-3-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
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
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
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

On Wed, Nov 13, 2019 at 11:12:10AM +0100, Jan Kara wrote:
> On Wed 13-11-19 01:02:02, John Hubbard wrote:
> > On 11/13/19 12:22 AM, Daniel Vetter wrote:
> > ...
> > > > > Why are we doing this? I think things got confused here someplace, as
> > > > 
> > > > 
> > > > Because:
> > > > 
> > > > a) These need put_page() calls,  and
> > > > 
> > > > b) there is no put_pages() call, but there is a release_pages() call that
> > > > is, arguably, what put_pages() would be.
> > > > 
> > > > 
> > > > > the comment still says:
> > > > > 
> > > > > /**
> > > > >   * put_user_page() - release a gup-pinned page
> > > > >   * @page:            pointer to page to be released
> > > > >   *
> > > > >   * Pages that were pinned via get_user_pages*() must be released via
> > > > >   * either put_user_page(), or one of the put_user_pages*() routines
> > > > >   * below.
> > > > 
> > > > 
> > > > Ohhh, I missed those comments. They need to all be changed over to
> > > > say "pages that were pinned via pin_user_pages*() or
> > > > pin_longterm_pages*() must be released via put_user_page*()."
> > > > 
> > > > The get_user_pages*() pages must still be released via put_page.
> > > > 
> > > > The churn is due to a fairly significant change in strategy, whis
> > > > is: instead of changing all get_user_pages*() sites to call
> > > > put_user_page(), change selected sites to call pin_user_pages*() or
> > > > pin_longterm_pages*(), plus put_user_page().
> > > 
> > > Can't we call this unpin_user_page then, for some symmetry? Or is that
> > > even more churn?
> > > 
> > > Looking from afar the naming here seems really confusing.
> > 
> > 
> > That look from afar is valuable, because I'm too close to the problem to see
> > how the naming looks. :)
> > 
> > unpin_user_page() sounds symmetrical. It's true that it would cause more
> > churn (which is why I started off with a proposal that avoids changing the
> > names of put_user_page*() APIs). But OTOH, the amount of churn is proportional
> > to the change in direction here, and it's really only 10 or 20 lines changed,
> > in the end.
> > 
> > So I'm open to changing to that naming. It would be nice to hear what others
> > prefer, too...
> 
> FWIW I'd find unpin_user_page() also better than put_user_page() as a
> counterpart to pin_user_pages().

One more point from afar on pin/unpin: We use that a lot in graphics for
permanently pinned graphics buffer objects. Which really only should be
used for scanout. So at least graphics folks should have an appropriate
mindset and try to make sure we don't overuse this stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
