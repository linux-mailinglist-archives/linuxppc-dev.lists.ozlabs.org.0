Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0DF9DFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 00:17:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CNtr0M0GzF5rq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 10:17:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="xlO/3o/F"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CNrP62MZzF5KP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:15:12 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id i185so9300oif.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 15:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ahg4ogj/xxSIi3Tz2dndpoesa0PkRLQ36VHrjNwVguE=;
 b=xlO/3o/FAhmPzmX5yHbU6ZNuHn4V9nHbloPGHpZqsb+DPkTsTeMinCTT3P2xrA0A3t
 XjX5crvs+XLSDSgcai6PZWx41nUjrksNl4jkRdGfTQpb6e1yLtFehh/VkrzYDg6mpqa6
 nIua0PamDKkJ2o4Dp1t2Oe3HiXMlIx7Jxg8UopWGV46jcBHLtzfhKxYanb2GfMvC3xgc
 V252jaKpAjhpDskcu/pPNVnV9ekVH+4FC/dXONxMnvQ71JXMw8m5ltg2SL6haNirS3nS
 2zfdpmAUDtoGxjGX0JdEV3chYwlXK5G60EaIDM8oX92yL7sroQqX5o/Sf8CBMjZV3ums
 ZwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ahg4ogj/xxSIi3Tz2dndpoesa0PkRLQ36VHrjNwVguE=;
 b=mWy2yjrMz40Flhh5Ivm9FyCTH6WKzbcfuhcOZIP7feyGM43oecKTkPT3bX1UuuYGpp
 AJYd7KbwbskZMLHhUnXsGwt6HBcjuh1oTSghyRKqopJxbXIznSj+5scAqii1E2enESRd
 sHyXdUgG8Z+jaIOccEU1F5hRfLxVmQSqU0IhNXd/zU+oBsH2EDznEzkFN0h9524x5ilP
 JLsS9+RT7IJ7XXQdWYcquAmJRtUoLKPyQ59mWpaXVcBIf0e2dyQZTIzeFYzyJk7iSrQw
 CNRXs3sLT5xhfG3S2JNgHs+lWIIj/qws6AnqVDhqfxMa0MmcWm5QgA7M5e86gvvcTbxC
 /ALg==
X-Gm-Message-State: APjAAAUzOarA3MiFRnr1oZjMh5oTRfUF6O/X9ziwJ0t4KmvnNgz36SWr
 r+MnsE4AvGLwwD0qNwkV8LfUHA2693SJ7P6p/GTswQ==
X-Google-Smtp-Source: APXvYqw0y1/AL1ibfnKpdRZPCFvNtcNTDnagWkblsIboSxBlSGgp0qhR7HkhIvJGPGFUg8U4pz3vKkN+eKromPrOJOY=
X-Received: by 2002:aca:ad52:: with SMTP id w79mr178668oie.149.1573600509804; 
 Tue, 12 Nov 2019 15:15:09 -0800 (PST)
MIME-Version: 1.0
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
 <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
 <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
In-Reply-To: <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Nov 2019 15:14:58 -0800
Message-ID: <CAPcyv4gUe__09cnAh3jeFogJH=sGm9U+8axRq_kCASkdbLfNbQ@mail.gmail.com>
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

On Tue, Nov 12, 2019 at 3:08 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 11/12/19 2:43 PM, Dan Williams wrote:
> ...
> > Ah, sorry. This was the first time I had looked at this series and
> > jumped in without reading the background.
> >
> > Your patch as is looks ok, I assume you've removed the FOLL_LONGTERM
> > warning in get_user_pages_remote in another patch?
> >
>
> Actually, I haven't gone quite that far. Actually this patch is the last
> change to that function. Therefore, at the end of this patchset,
> get_user_pages_remote() ends up with this check in it which
> is a less-restrictive version of the warning:
>
>         /*
>          * Current FOLL_LONGTERM behavior is incompatible with
>          * FAULT_FLAG_ALLOW_RETRY because of the FS DAX check requirement on
>          * vmas. However, this only comes up if locked is set, and there are
>          * callers that do request FOLL_LONGTERM, but do not set locked. So,
>          * allow what we can.
>          */
>         if (gup_flags & FOLL_LONGTERM) {
>                 if (WARN_ON_ONCE(locked))
>                         return -EINVAL;
>         }
>
> Is that OK, or did you want to go further (possibly in a follow-up
> patchset, as I'm hoping to get this one in soon)?

That looks ok. Something to maybe push down into the core in a future
cleanup, but not something that needs to be done now.

> ...
> >>> I think check_vma_flags() should do the ((FOLL_LONGTERM | FOLL_GET) &&
> >>> vma_is_fsdax()) check and that would also remove the need for
> >>> __gup_longterm_locked.
> >>>
> >>
> >> Good idea, but there is still the call to check_and_migrate_cma_pages(),
> >> inside __gup_longterm_locked().  So it's a little more involved and
> >> we can't trivially delete __gup_longterm_locked() yet, right?
> >
> > [ add Aneesh ]
> >
> > Yes, you're right. I had overlooked that had snuck in there. That to
> > me similarly needs to be pushed down into the core with its own FOLL
> > flag, or it needs to be an explicit fixup that each caller does after
> > get_user_pages. The fact that migration silently happens as a side
> > effect of gup is too magical for my taste.
> >
>
> Yes. It's an intrusive side effect that is surprising, and not in a
> "happy surprise" way. :) .   Fixing up the CMA pages by splitting that
> functionality into separate function calls sounds like an improvement
> worth exploring.

Right, future work.
