Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE235128610
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 01:34:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47fmp26WggzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2019 11:34:18 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.b="vxEhprSq"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47fmm24TtJzDqtZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2019 11:32:27 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id b18so14062353otp.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2019 16:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7w4UD7OpHop1e3Pz2ddMBPnhs3gOWoGc1gZLtDq0vk=;
 b=vxEhprSqaQNYHFQ4H7dcX/E/mSO1yt4IUVMZ4sAhLDFH4ZGUKPILIYVqnfnOi8vncn
 TkMivZIMeBGXnc2DZxbo8rhaadDmZ0J8YlsyjunZpHnqoJnITQdI9o+0sVlYw4wIwgNg
 hVrkgdMe4LV+bJ1UOTvAeTPb7daNE36o1jVBQU5BvO3ZoVIoBadMJDXjLnRiZsHYGooC
 TNPa9bH1kbJLrQnHkt24kZfMiD+6hcL+ePqBCPpBSGancvjEQx8QdtGwVjyhNWrmhcl4
 X37OrtjEVw+33y61x0Kg++5hk4Jka/RWupbXhqGSK3ZcyRVBMCG0sfPDxatqX5Z1NvKS
 I51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7w4UD7OpHop1e3Pz2ddMBPnhs3gOWoGc1gZLtDq0vk=;
 b=frQX4r8zfU+eSXgPZVSaPLk63hwC9wCWfSq3twFi8hUHF8GY/zHJryC6EfQTveMoOQ
 pX9s+tsaQ9lGGcN+ymeaVXTi8J53BPdw1TBjnphyG1o6B/tfPuO/lj03eLjVfj6iunDQ
 bpMQYdQd4MtKw8QGnSwIfOyUOVNKQkSr6jmJ1darKpzi0e6cA9i2OWk/0omtvKEnq6E7
 4k6eo2HadhapK8B6uDuG2dnM8lCA05wA3uQMd2xQQR9eV91EP0nzNouwRU3kCgfT41y7
 DZsb5sXHHOUyPQvF5u2Zdck+IKvEKsgS9pg7jZS9IsDk3+FcG7LvnSc8KMUM2eb+EuYz
 FjcQ==
X-Gm-Message-State: APjAAAV6vTo4tz48lvJSa83oBvNQb1MQyUw3wNf+APSmgklg8sefv4+U
 rRZJVTXws469zow20MCvkIyz5pO9R2vOP4liCuQbqw==
X-Google-Smtp-Source: APXvYqz/XCcCPtPTpD6diyokGu99CSTPorQgAyb2cALnDUt6lAGgGTah0l7Kj7pZCHJSAA7gXN8KcX+bngnSk0tk1h8=
X-Received: by 2002:a9d:7852:: with SMTP id c18mr12814325otm.247.1576888344708; 
 Fri, 20 Dec 2019 16:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20191216222537.491123-1-jhubbard@nvidia.com>
 <20191219132607.GA410823@unreal>
 <a4849322-8e17-119e-a664-80d9f95d850b@nvidia.com>
 <20191219210743.GN17227@ziepe.ca>
 <42a3e5c1-6301-db0b-5d09-212edf5ecf2a@nvidia.com>
 <20191220133423.GA13506@ziepe.ca>
In-Reply-To: <20191220133423.GA13506@ziepe.ca>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 20 Dec 2019 16:32:13 -0800
Message-ID: <CAPcyv4hX9TsTMjsv2hnbEM-TpkC9abtWGSVskr9nPwpR8c5E1Q@mail.gmail.com>
Subject: Re: [PATCH v11 00/25] mm/gup: track dma-pinned pages: FOLL_PIN
To: Jason Gunthorpe <jgg@ziepe.ca>
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Maor Gottlieb <maorg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
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

On Fri, Dec 20, 2019 at 5:34 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Thu, Dec 19, 2019 at 01:13:54PM -0800, John Hubbard wrote:
> > On 12/19/19 1:07 PM, Jason Gunthorpe wrote:
> > > On Thu, Dec 19, 2019 at 12:30:31PM -0800, John Hubbard wrote:
> > > > On 12/19/19 5:26 AM, Leon Romanovsky wrote:
> > > > > On Mon, Dec 16, 2019 at 02:25:12PM -0800, John Hubbard wrote:
> > > > > > Hi,
> > > > > >
> > > > > > This implements an API naming change (put_user_page*() -->
> > > > > > unpin_user_page*()), and also implements tracking of FOLL_PIN pages. It
> > > > > > extends that tracking to a few select subsystems. More subsystems will
> > > > > > be added in follow up work.
> > > > >
> > > > > Hi John,
> > > > >
> > > > > The patchset generates kernel panics in our IB testing. In our tests, we
> > > > > allocated single memory block and registered multiple MRs using the single
> > > > > block.
> > > > >
> > > > > The possible bad flow is:
> > > > >    ib_umem_geti() ->
> > > > >     pin_user_pages_fast(FOLL_WRITE) ->
> > > > >      internal_get_user_pages_fast(FOLL_WRITE) ->
> > > > >       gup_pgd_range() ->
> > > > >        gup_huge_pd() ->
> > > > >         gup_hugepte() ->
> > > > >          try_grab_compound_head() ->
> > > >
> > > > Hi Leon,
> > > >
> > > > Thanks very much for the detailed report! So we're overflowing...
> > > >
> > > > At first look, this seems likely to be hitting a weak point in the
> > > > GUP_PIN_COUNTING_BIAS-based design, one that I believed could be deferred
> > > > (there's a writeup in Documentation/core-api/pin_user_page.rst, lines
> > > > 99-121). Basically it's pretty easy to overflow the page->_refcount
> > > > with huge pages if the pages have a *lot* of subpages.
> > > >
> > > > We can only do about 7 pins on 1GB huge pages that use 4KB subpages.
> > >
> > > Considering that establishing these pins is entirely under user
> > > control, we can't have a limit here.
> >
> > There's already a limit, it's just a much larger one. :) What does "no limit"
> > really mean, numerically, to you in this case?
>
> I guess I mean 'hidden limit' - hitting the limit and failing would
> be managable.
>
> I think 7 is probably too low though, but we are not using 1GB huge
> pages, only 2M..

What about RDMA to 1GB-hugetlbfs and 1GB-device-dax mappings?
