Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F3FAC0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 09:25:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cd3G4hmdzF5Cy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 19:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ffwll.ch
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=daniel.vetter@ffwll.ch; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ffwll.ch header.i=@ffwll.ch header.b="A+5ZDAwm"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cd0K4NQMzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 19:22:53 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id s71so988518oih.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 00:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9ayY6gCXrrA3VgRAyrp2bK0EyrP0ektptyzgRBWzw5I=;
 b=A+5ZDAwm0sisXEXV26bplYhx0LMI9tSEqcz5XKqugaaiNBsieQDhWSu2ezHIxsk3ok
 PapqJ40EqXbuXexGXvb3dctMfbGHjaFuYDAai4pvCrk3ttwW8fkWJFMlnWK5Sh3WDfzP
 au9tTKQUHDCal3qSVw21r18Mu3ZTlLggTEjdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9ayY6gCXrrA3VgRAyrp2bK0EyrP0ektptyzgRBWzw5I=;
 b=egHULKZnk2zDw/acpSxxqdpc0HpH8eOiF++gN3DIx/WcAgrLC87UnaTM45QgacinCs
 +NmJxBhFPAf1AZrMseZB0yldxvh5DXc6yaxNAraqjJyzyeTHBxo8l/eHM1qv5n9mvpQb
 N6BUxcXWY3H3xIDOPB+8R6Jz1xHRoiaiA7pbEQ9gQY6JIy39GMk6u6vvmJRAlFSOySGg
 Zg2p+DoH60+l3ggB2dECLmf+UKrEHXJN5J9dGBJ7DfSbh++YfyrRLk62GcLjGXbx7LfE
 JwoKxoi4NhNUzQRYCczdYVqP/+3BPXZHG5aJot2VOHhZb6QoZ8PlUnNqv5S0FhKOkHTd
 KUcg==
X-Gm-Message-State: APjAAAWmWquhynVlm0EN6kLNl+pc2PGSq5Hl5qWctle/Hl45k3HNW0Mu
 Xl61YW7VRzyQAhE03Pok3QyiIYB0QgYhBepEG0Qw4Q==
X-Google-Smtp-Source: APXvYqxfSdLpxppf1Yvj8Pnz7e2iZsxyqjYKBICjfkF8MEX8zkGbqRRzZo57EW2FfCAXfyKFCc6JsAljOesoFoCv0a8=
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr1806257oie.132.1573633368138; 
 Wed, 13 Nov 2019 00:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
 <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
In-Reply-To: <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 13 Nov 2019 09:22:36 +0100
Message-ID: <CAKMK7uHvk+ti00mCCF2006U003w1dofFg9nSfmZ4bS2Z2pEDNQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
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
 kvm@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf <bpf@vger.kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev <netdev@vger.kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2019 at 10:10 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 12:38 PM, Jason Gunthorpe wrote:
> > On Mon, Nov 11, 2019 at 04:06:37PM -0800, John Hubbard wrote:
> >> Hi,
> >>
> >> The cover letter is long, so the more important stuff is first:
> >>
> >> * Jason, if you or someone could look at the the VFIO cleanup (patch 8)
> >>   and conversion to FOLL_PIN (patch 18), to make sure it's use of
> >>   remote and longterm gup matches what we discussed during the review
> >>   of v2, I'd appreciate it.
> >>
> >> * Also for Jason and IB: as noted below, in patch 11, I am (too?) boldly
> >>   converting from put_user_pages() to release_pages().
> >
> > Why are we doing this? I think things got confused here someplace, as
>
>
> Because:
>
> a) These need put_page() calls,  and
>
> b) there is no put_pages() call, but there is a release_pages() call that
> is, arguably, what put_pages() would be.
>
>
> > the comment still says:
> >
> > /**
> >  * put_user_page() - release a gup-pinned page
> >  * @page:            pointer to page to be released
> >  *
> >  * Pages that were pinned via get_user_pages*() must be released via
> >  * either put_user_page(), or one of the put_user_pages*() routines
> >  * below.
>
>
> Ohhh, I missed those comments. They need to all be changed over to
> say "pages that were pinned via pin_user_pages*() or
> pin_longterm_pages*() must be released via put_user_page*()."
>
> The get_user_pages*() pages must still be released via put_page.
>
> The churn is due to a fairly significant change in strategy, whis
> is: instead of changing all get_user_pages*() sites to call
> put_user_page(), change selected sites to call pin_user_pages*() or
> pin_longterm_pages*(), plus put_user_page().

Can't we call this unpin_user_page then, for some symmetry? Or is that
even more churn?

Looking from afar the naming here seems really confusing.
-Daniel

> That allows incrementally converting the kernel over to using the
> new pin APIs, without taking on the huge risk of a big one-shot
> conversion.
>
> So, I've ended up with one place that actually needs to get reverted
> back to get_user_pages(), and that's the IB ODP code.
>
> >
> > I feel like if put_user_pages() is not the correct way to undo
> > get_user_pages() then it needs to be deleted.
> >
>
> Yes, you're right. I'll fix the put_user_page comments() as described.
>
>
> thanks,
>
> John Hubbard
> NVIDIA



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
