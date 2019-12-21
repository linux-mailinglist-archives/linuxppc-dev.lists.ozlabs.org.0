Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A68AE128611
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 01:36:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fmr45QqfzDqvj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 11:36:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="NxkPIx6g"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fmmz5h0PzDqwT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 11:33:23 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id d7so9641663otf.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVjQ97c8G7umA/g4YaI+/jO3BewDKZctzOnZC5BmFqQ=;
 b=NxkPIx6gPzcP+NXij1w+89bHEi7PYx6RDrVXfOrDIkdh+E7c284gPJ/0Dx2IJRsIft
 qP5T8NtrvpAsFtZJNiMXPf9SGU4N9wr5z+lgDWNxH2MBFYJJfj0GLWFq66F8hA8xMDwM
 ov7u3YL8g33gzLkte/P8S28VjwmfLrsJUJcmEzcKaTtNMXut/ZNsXZe9vfWea/1QjPP6
 N0GRE8v962QNXMp6fYZk5hH7oLV3Lp6tTV/jTFHhgGgHEDEf0U1UN9i75GJoFwyFGEsY
 SYO9o7ANj6kyCM+b6zbGskkaWwyZXrFC+rdJdbREHxNwKiODm9oDVUMAmNYqjYSReePl
 i8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVjQ97c8G7umA/g4YaI+/jO3BewDKZctzOnZC5BmFqQ=;
 b=qWV24cwCCqdKwMe27UsrHe+lMND5fLhr36pmd3xHfM7ACssX04MwzuZuVv6/opz8Sh
 3R8KTJZ+Cwed0rUa09/nVYoKaHqwmhGU+02PBDD2t86h0l4zjNVizPQ55pXlOtLicpXY
 vRRVJGzApGeYITybmBhhdloXePl4svW+SrfKQui/bAvMiV8JezeFVEWebnhL9d0HEQ/U
 ORmQHevoVxHmyn54MfWinkDy8mXbS4M1fidrJsgrotAltL9upe6qGRpI5jtAzfysCS7g
 JiBm6jpwxXs4VMJpvXQocef3YQj27l3vxMvnMdooSsbdyy37EQdCrOUu4pLHZTTBi3v3
 nA2Q==
X-Gm-Message-State: APjAAAXY1D1lp7dTh965JPz5Ot/o1veDgad0oOV4XalzS/XkKRsss4FS
 uO44+HzKbi0FK2Ad8M+zyEfYASV6TBLmYFGWrX+4Hg==
X-Google-Smtp-Source: APXvYqy/KNT1IU+5waxH3mP7tUKkhYZTihNH7vJc1BvBwnbhmpk83oq7GDXye3Q8miizDxXxgCPpRIrHDtOoKRr7C2c=
X-Received: by 2002:a9d:4e99:: with SMTP id v25mr18407223otk.363.1576888401949; 
 Fri, 20 Dec 2019 16:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191220092154.GA10068@quack2.suse.cz>
In-Reply-To: <20191220092154.GA10068@quack2.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 20 Dec 2019 16:33:10 -0800
Message-ID: <CAPcyv4gYnXE-y_aGehazzF-Kej5ibSfqvE2hTnjKJD68bm8ANg@mail.gmail.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michal Hocko <mhocko@suse.com>, KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 20, 2019 at 1:22 AM Jan Kara <jack@suse.cz> wrote:
>
> On Thu 19-12-19 12:30:31, John Hubbard wrote:
> > On 12/19/19 5:26 AM, Leon Romanovsky wrote:
> > > On Mon, Dec 16, 2019 at 02:25:12PM -0800, John Hubbard wrote:
> > > > Hi,
> > > >
> > > > This implements an API naming change (put_user_page*() -->
> > > > unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
> > > > extends that tracking to a few select subsystems. More subsystems will
> > > > be added in follow up work.
> > >
> > > Hi John,
> > >
> > > The patchset generates kernel panics in our IB testing. In our tests, we
> > > allocated single memory block and registered multiple MRs using the single
> > > block.
> > >
> > > The possible bad flow is:
> > >   ib_umem_geti() ->
> > >    pin_user_pages_fast(FOLL_WRITE) ->
> > >     internal_get_user_pages_fast(FOLL_WRITE) ->
> > >      gup_pgd_range() ->
> > >       gup_huge_pd() ->
> > >        gup_hugepte() ->
> > >         try_grab_compound_head() ->
> >
> > Hi Leon,
> >
> > Thanks very much for the detailed report! So we're overflowing...
> >
> > At first look, this seems likely to be hitting a weak point in the
> > GUP_PIN_COUNTING_BIAS-based design, one that I believed could be deferred
> > (there's a writeup in Documentation/core-api/pin_user_page.rst, lines
> > 99-121). Basically it's pretty easy to overflow the page->_refcount
> > with huge pages if the pages have a *lot* of subpages.
> >
> > We can only do about 7 pins on 1GB huge pages that use 4KB subpages.
> > Do you have any idea how many pins (repeated pins on the same page, which
> > it sounds like you have) might be involved in your test case,
> > and the huge page and system page sizes? That would allow calculating
> > if we're likely overflowing for that reason.
> >
> > So, ideas and next steps:
> >
> > 1. Assuming that you *are* hitting this, I think I may have to fall back to
> > implementing the "deferred" part of this design, as part of this series, after
> > all. That means:
> >
> >   For the pin/unpin calls at least, stop treating all pages as if they are
> >   a cluster of PAGE_SIZE pages; instead, retrieve a huge page as one page.
> >   That's not how it works now, and the need to hand back a huge array of
> >   subpages is part of the problem. This affects the callers too, so it's not
> >   a super quick change to make. (I was really hoping not to have to do this
> >   yet.)
>
> Does that mean that you would need to make all GUP users huge page aware?
> Otherwise I don't see how what you suggest would work... And I don't think
> making all GUP users huge page aware is realistic (effort-wise) or even
> wanted (maintenance overhead in all those places).
>
> I believe there might be also a different solution for this: For
> transparent huge pages, we could find a space in 'struct page' of the
> second page in the huge page for proper pin counter and just account pins
> there so we'd have full width of 32-bits for it.

That would require THP accounting for dax pages. It is something that
was probably going to be needed, but this would seem to force the
issue.
