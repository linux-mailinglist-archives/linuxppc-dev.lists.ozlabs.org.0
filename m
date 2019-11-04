Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 589CEEE9B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 21:35:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476PgP22WrzF46n
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 07:35:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jglisse@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="FVZW2lpb"; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476Pbx1KjNzF3Kn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 07:32:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572899529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0t18qmWA+5595eIOsjZ92rtvApF9YJpqwJyzz983FX4=;
 b=FVZW2lpbqvJiFchSK8aK7TQ9NwyyxRFD1Ign9yZL1JLBHWgbSbWYQ4imG4817IKAuO9etR
 /nl6nKfrBIiWIQbR79GpgQAvTmulbRXrRjjGz9NCRiFgJFzMCFLzoJXRzJ14AfAU1gsA7m
 Y73CzaOudHWDz0takN06dgWR9UrEn80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-Z6X9SXkoPpydpMlPq3lbmg-1; Mon, 04 Nov 2019 15:32:05 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39197477;
 Mon,  4 Nov 2019 20:32:01 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE494600C4;
 Mon,  4 Nov 2019 20:31:54 +0000 (UTC)
Date: Mon, 4 Nov 2019 15:31:53 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104203153.GB7731@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191104173325.GD5134@redhat.com>
 <be9de35c-57e9-75c3-2e86-eae50904bbdf@nvidia.com>
 <20191104191811.GI5134@redhat.com>
 <e9656d47-b4a1-da8a-e8cc-ebcfb8cc06d6@nvidia.com>
 <20191104195248.GA7731@redhat.com>
 <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <25ec4bc0-caaa-2a01-2ae7-2d79663a40e1@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: Z6X9SXkoPpydpMlPq3lbmg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 04, 2019 at 12:09:05PM -0800, John Hubbard wrote:
> Jason, a question for you at the bottom.
>=20
> On 11/4/19 11:52 AM, Jerome Glisse wrote:
> ...
> >> CASE 3: ODP
> >> -----------
> >> RDMA hardware with page faulting support. Here, a well-written driver =
doesn't
> >=20
> > CASE3: Hardware with page fault support
> > ---------------------------------------
> >=20
> > Here, a well-written ....
> >=20
>=20
> Ah, OK. So just drop the first sentence, yes.
>=20
> ...
> >>>>>> +=09 */
> >>>>>> +=09gup_flags |=3D FOLL_REMOTE | FOLL_PIN;
> >>>>>
> >>>>> Wouldn't it be better to not add pin_longterm_pages_remote() until
> >>>>> it can be properly implemented ?
> >>>>>
> >>>>
> >>>> Well, the problem is that I need each call site that requires FOLL_P=
IN
> >>>> to use a proper wrapper. It's the FOLL_PIN that is the focus here, b=
ecause
> >>>> there is a hard, bright rule, which is: if and only if a caller sets
> >>>> FOLL_PIN, then the dma-page tracking happens, and put_user_page() mu=
st
> >>>> be called.
> >>>>
> >>>> So this leaves me with only two reasonable choices:
> >>>>
> >>>> a) Convert the call site as above: pin_longterm_pages_remote(), whic=
h sets
> >>>> FOLL_PIN (the key point!), and leaves the FOLL_LONGTERM situation ex=
actly
> >>>> as it has been so far. When the FOLL_LONGTERM situation is fixed, th=
e call
> >>>> site *might* not need any changes to adopt the working gup.c code.
> >>>>
> >>>> b) Convert the call site to pin_user_pages_remote(), which also sets
> >>>> FOLL_PIN, and also leaves the FOLL_LONGTERM situation exactly as bef=
ore.
> >>>> There would also be a comment at the call site, to the effect of, "t=
his
> >>>> is the wrong call to make: it really requires FOLL_LONGTERM behavior=
".
> >>>>
> >>>> When the FOLL_LONGTERM situation is fixed, the call site will need t=
o be
> >>>> changed to pin_longterm_pages_remote().
> >>>>
> >>>> So you can probably see why I picked (a).
> >>>
> >>> But right now nobody has FOLL_LONGTERM and FOLL_REMOTE. So you should
> >>> never have the need for pin_longterm_pages_remote(). My fear is that
> >>> longterm has implication and it would be better to not drop this impl=
ication
> >>> by adding a wrapper that does not do what the name says.
> >>>
> >>> So do not introduce pin_longterm_pages_remote() until its first user
> >>> happens. This is option c)
> >>>
> >>
> >> Almost forgot, though: there is already another user: Infiniband:
> >>
> >> drivers/infiniband/core/umem_odp.c:646:         npages =3D pin_longter=
m_pages_remote(owning_process, owning_mm,
> >=20
> > odp do not need that, i thought the HMM convertion was already upstream
> > but seems not, in any case odp do not need the longterm case it only
> > so best is to revert that user to gup_fast or something until it get
> > converted to HMM.
> >=20
>=20
> Note for Jason: the (a) or (b) items are talking about the vfio case, whi=
ch is
> one of the two call sites that now use pin_longterm_pages_remote(), and t=
he
> other one is infiniband:
>=20
> drivers/infiniband/core/umem_odp.c:646:         npages =3D pin_longterm_p=
ages_remote(owning_process, owning_mm,
> drivers/vfio/vfio_iommu_type1.c:353:            ret =3D pin_longterm_page=
s_remote(NULL, mm, vaddr, 1,

vfio should be reverted until it can be properly implemented.
The issue is that when you fix the implementation you might
break vfio existing user and thus regress the kernel from user
point of view. So i rather have the change to vfio reverted,
i believe it was not well understood when it got upstream,
between in my 5.4 tree it is still gup_remote not longterm.


> Jerome, Jason: I really don't want to revert the put_page() to put_user_p=
age()=20
> conversions that are already throughout the IB driver--pointless churn, r=
ight?
> I'd rather either delete them in Jason's tree, or go with what I have her=
e
> while waiting for the deletion.
>=20
> Maybe we should just settle on (a) or (b), so that the IB driver ends up =
with
> the wrapper functions? In fact, if it's getting deleted, then I'd prefer =
leaving
> it at (a), since that's simple...
>=20
> Jason should weigh in on how he wants this to go, with respect to branchi=
ng
> and merging, since it sounds like that will conflict with the hmm branch=
=20
> (ha, I'm overdue in reviewing his mmu notifier series, that's what I get =
for
> being late).
>=20
> thanks,
>=20
> John Hubbard
> NVIDIA

