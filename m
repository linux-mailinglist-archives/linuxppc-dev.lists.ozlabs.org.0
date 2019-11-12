Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E845F9D73
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 23:47:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNDb5WyDzF5mQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:47:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Jq7Ptqpe"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CN7p0xXmzF18B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 09:43:28 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id y194so16447845oie.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 14:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SwaaHNLQ6Cwcgbew071VEYLmiCBwwXoXuuoAi+2uA2o=;
 b=Jq7Ptqpebw7UGAIdEQ/unEBsB7QbaXVZNTWXCanS5nvK3elyglZtGcUaQ89X7Thh8h
 IAM86ORfnzN6917rhUVFsUy3UD57DPR+XlrbhhZ/NXNnmHMPvg4XpzzSKBe4NqErKRUy
 bZxd+tm9M+MwB7qsXrtdhh4D3/L98cHAZWd0Ns8kuwxv1QWg3yEpu0lT5cnjJPtGKrYR
 anyG20BRg0b0DeF7mLr0STZrxT4BCOm+zZEBDW3gpHBI3V/JOgKkFou2F3URCWxql04L
 MQNOT/7KMRt8tV9Ump9WAqJ7q3xqWRAJd3iDm6wl8QcfVduDF9h8k23QxQ9DnzN60j3u
 /xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SwaaHNLQ6Cwcgbew071VEYLmiCBwwXoXuuoAi+2uA2o=;
 b=JsdwfvoSmfBjmW18AsCWA7K2SZhi68Rbck/c1BX2XEz2x1sohciSUHEJ5n5DSChbZu
 jwOLTj1TRmgNfXMCUw6uBwlTTJ6rZMTXHOPZWAbDVqaEEWy3InmSf3omjejH3d+Sb0pP
 pc9Op8gGR/6vLTUrOud7b6/OFVjgp+c4VnoxdiJdP1q3D1D0CqCzB6+biQ6AXXpjFCdK
 VlFIhUhOD70yTvGWFu0rg5+GE1C+iTtNClQXk3EZsHtwDOQXN99/wYQRND6AxHpHC7Et
 a2ywH6mhwu1C8GsO3yRyy63Z1JrF+T72HMikD/UQHf0yMEea6MLf1zQeM3WWnnXkk29j
 EnFA==
X-Gm-Message-State: APjAAAU1Oo5HR82jmX8zZsLSVmCfvq1gwdCXT9A6ngvUaYA0KM787ebE
 EbAI0aB3BRErd9qmHEBqfMOOWh79lMIvcRKaq0G/7Q==
X-Google-Smtp-Source: APXvYqxLBopeTTnZkVho8CVk6N+hGkn5uHiE62zpra+sAfITZV3BdLQKTEc55Ljq6ZrLX2Tr24PR9eCQkyGplH1DN48=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr135827oih.0.1573598604957;
 Tue, 12 Nov 2019 14:43:24 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
In-Reply-To: <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 14:43:14 -0800
Message-ID: <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
Subject: Re: [PATCH v3 08/23] vfio,
 mm: fix get_user_pages_remote() and FOLL_LONGTERM
To: John Hubbard <jhubbard@nvidia.com>
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 2:24 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 1:57 PM, Dan Williams wrote:
> ...
> >> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >> index d864277ea16f..017689b7c32b 100644
> >> --- a/drivers/vfio/vfio_iommu_type1.c
> >> +++ b/drivers/vfio/vfio_iommu_type1.c
> >> @@ -348,24 +348,20 @@ static int vaddr_get_pfn(struct mm_struct *mm, unsigned long vaddr,
> >>                 flags |= FOLL_WRITE;
> >>
> >>         down_read(&mm->mmap_sem);
> >> -       if (mm == current->mm) {
> >> -               ret = get_user_pages(vaddr, 1, flags | FOLL_LONGTERM, page,
> >> -                                    vmas);
> >> -       } else {
> >> -               ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags, page,
> >> -                                           vmas, NULL);
> >> -               /*
> >> -                * The lifetime of a vaddr_get_pfn() page pin is
> >> -                * userspace-controlled. In the fs-dax case this could
> >> -                * lead to indefinite stalls in filesystem operations.
> >> -                * Disallow attempts to pin fs-dax pages via this
> >> -                * interface.
> >> -                */
> >> -               if (ret > 0 && vma_is_fsdax(vmas[0])) {
> >> -                       ret = -EOPNOTSUPP;
> >> -                       put_page(page[0]);
> >> -               }
> >> +       ret = get_user_pages_remote(NULL, mm, vaddr, 1, flags | FOLL_LONGTERM,
> >> +                                   page, vmas, NULL);
> >
> > Hmm, what's the point of passing FOLL_LONGTERM to
> > get_user_pages_remote() if get_user_pages_remote() is not going to
> > check the vma? I think we got to this code state because the
>
> FOLL_LONGTERM is short-lived in this location, because patch 23
> ("mm/gup: remove support for gup(FOLL_LONGTERM)") removes it, after
> callers are changed over to pin_longterm_pages*().
>
> So FOLL_LONGTERM is not doing much now, but it is basically a marker for
> "change gup(FOLL_LONGTERM) to pin_longterm_pages()", and patch 18
> actually makes that change.
>
> And then pin_longterm_pages*() is, in turn, a way to mark all the
> places that need file system and/or user space interactions (layout
> leases, etc), as per "Case 2: RDMA" in the new
> Documentation/vm/pin_user_pages.rst.

Ah, sorry. This was the first time I had looked at this series and
jumped in without reading the background.

Your patch as is looks ok, I assume you've removed the FOLL_LONGTERM
warning in get_user_pages_remote in another patch?

>
> > get_user_pages() vs get_user_pages_remote() split predated the
> > introduction of FOLL_LONGTERM.
>
> Yes. And I do want clean this up as I go, so we don't end up with
> stale concepts lingering in gup.c...
>
> >
> > I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
> > vma_is_fsdax()) check and that would also remove the need for
> > __gup_longterm_locked.
> >
>
> Good idea, but there is still the call to check_and_migrate_cma_pages(),
> inside __gup_longterm_locked().  So it's a little more involved and
> we can't trivially delete __gup_longterm_locked() yet, right?

[ add Aneesh ]

Yes, you're right. I had overlooked that had snuck in there. That to
me similarly needs to be pushed down into the core with its own FOLL
flag, or it needs to be an explicit fixup that each caller does after
get_user_pages. The fact that migration silently happens as a side
effect of gup is too magical for my taste.
