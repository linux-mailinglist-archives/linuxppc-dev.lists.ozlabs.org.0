Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED633FB80D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 19:48:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ctt857dxzF35l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 05:48:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="a7A+dcs4"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CtqP69vXzF6sg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 05:46:04 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id z6so2562555otb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 10:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cT4Ynp7AABnbetkKbYtY9L84HJMiir4x9aUvgO3qIkA=;
 b=a7A+dcs4qLyRwykFz5P8aF/5gHL9KK36xtIfXVr/kBk3uPlOEckoeys38y+nnoealE
 xzZU97hBkbVqSDW3gJxcm8meBZzrkQaKb0fOpplJk89VtBOEN/d/rvjF/p1FfJJqTTXv
 4RFlHCPjmONBQGpTT3WPud0MHuI1arLibsaS9qkCPzQA4NQZsJVxDT/hq2PSgxZUbK6j
 hmavUnr3qxAC5dpB11ue+Kc8RjftT0go7LTB3CRWT06X6W6/Vr35u8YiRNHJv46YGe1d
 7YKSAbhOh/ee5b8uqRA8DDWS3/IOwVUmAGMREeaTodHgoCOvb7Na9VVd6Z5oKT3OMDr8
 TTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cT4Ynp7AABnbetkKbYtY9L84HJMiir4x9aUvgO3qIkA=;
 b=aC1wjHFrhWLQ83uO3GsT+fY2lzyY1hqH2i7rkU3UnPRBrYuAK22+ivu0pgei6zIC1R
 vpvCScv292ZeuxS6DG+kIsLBzxOxFBPXLfFtKg8ed8Ytq6xFCDRIwbFEw72lWpMMc7V8
 nmMiIgIHoSLvHmt7k0oKZkTbXjnF9UAXqEFO7ygxBnRN7U79/jcQpB8Vy23nOtjmwx0Y
 o4/eLYdGw7tkwylEwvzQ20/mOnJsPJfKoNzWdPTth3yzocuF9hdwXWMlwqTSDabdmVbn
 3108IBk8zc0uCsSjqzwpmMRjUbzWEMb8caXqnxvBZeruzSutQl9Y9BybLsLbTESJTKre
 45QQ==
X-Gm-Message-State: APjAAAUVUivi5eMQJYPBheso2yIV6cCKA2Etaij44VP5f4e8Wd2eE1Jk
 IjAsKsY4HOSbgLGXYdOykqyFFyiv5ODuUmp6apFhdA==
X-Google-Smtp-Source: APXvYqyPn+rDZrNle0VfTIMlvvY+/KynBCjFHBDHqyFwY/x5q0B2O33H3JfKZdicH8PxUo9GG3nCazg6kogrLq1IvZ4=
X-Received: by 2002:a05:6830:1af7:: with SMTP id
 c23mr4066831otd.247.1573670761142; 
 Wed, 13 Nov 2019 10:46:01 -0800 (PST)
MIME-Version: 1.0
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113104308.GE6367@quack2.suse.cz>
In-Reply-To: <20191113104308.GE6367@quack2.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 Nov 2019 10:45:49 -0800
Message-ID: <CAPcyv4gJbmf9aRU_5_umiE7GvTWG1D+zkCMNxrU=LYn-n0arNA@mail.gmail.com>
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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

On Wed, Nov 13, 2019 at 2:43 AM Jan Kara <jack@suse.cz> wrote:
>
> On Tue 12-11-19 20:26:56, John Hubbard wrote:
> > Introduce pin_user_pages*() variations of get_user_pages*() calls,
> > and also pin_longterm_pages*() variations.
> >
> > These variants all set FOLL_PIN, which is also introduced, and
> > thoroughly documented.
> >
> > The pin_longterm*() variants also set FOLL_LONGTERM, in addition
> > to FOLL_PIN:
> >
> >     pin_user_pages()
> >     pin_user_pages_remote()
> >     pin_user_pages_fast()
> >
> >     pin_longterm_pages()
> >     pin_longterm_pages_remote()
> >     pin_longterm_pages_fast()
> >
> > All pages that are pinned via the above calls, must be unpinned via
> > put_user_page().
> >
> > The underlying rules are:
> >
> > * These are gup-internal flags, so the call sites should not directly
> > set FOLL_PIN nor FOLL_LONGTERM. That behavior is enforced with
> > assertions, for the new FOLL_PIN flag. However, for the pre-existing
> > FOLL_LONGTERM flag, which has some call sites that still directly
> > set FOLL_LONGTERM, there is no assertion yet.
> >
> > * Call sites that want to indicate that they are going to do DirectIO
> >   ("DIO") or something with similar characteristics, should call a
> >   get_user_pages()-like wrapper call that sets FOLL_PIN. These wrappers
> >   will:
> >         * Start with "pin_user_pages" instead of "get_user_pages". That
> >           makes it easy to find and audit the call sites.
> >         * Set FOLL_PIN
> >
> > * For pages that are received via FOLL_PIN, those pages must be returne=
d
> >   via put_user_page().
> >
> > Thanks to Jan Kara and Vlastimil Babka for explaining the 4 cases
> > in this documentation. (I've reworded it and expanded upon it.)
> >
> > Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>  # Documentation
> > Reviewed-by: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>
> Thanks for the documentation. It looks great!
>
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 83702b2e86c8..4409e84dff51 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -201,6 +201,10 @@ static struct page *follow_page_pte(struct vm_area=
_struct *vma,
> >       spinlock_t *ptl;
> >       pte_t *ptep, pte;
> >
> > +     /* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > +     if (WARN_ON_ONCE((flags & (FOLL_PIN | FOLL_GET)) =3D=3D
> > +                      (FOLL_PIN | FOLL_GET)))
> > +             return ERR_PTR(-EINVAL);
> >  retry:
> >       if (unlikely(pmd_bad(*pmd)))
> >               return no_page_table(vma, flags);
>
> How does FOLL_PIN result in grabbing (at least normal, for now) page refe=
rence?
> I didn't find that anywhere in this patch but it is a prerequisite to
> converting any user to pin_user_pages() interface, right?
>
> > +/**
> > + * pin_user_pages_fast() - pin user pages in memory without taking loc=
ks
> > + *
> > + * Nearly the same as get_user_pages_fast(), except that FOLL_PIN is s=
et. See
> > + * get_user_pages_fast() for documentation on the function arguments, =
because
> > + * the arguments here are identical.
> > + *
> > + * FOLL_PIN means that the pages must be released via put_user_page().=
 Please
> > + * see Documentation/vm/pin_user_pages.rst for further details.
> > + *
> > + * This is intended for Case 1 (DIO) in Documentation/vm/pin_user_page=
s.rst. It
> > + * is NOT intended for Case 2 (RDMA: long-term pins).
> > + */
> > +int pin_user_pages_fast(unsigned long start, int nr_pages,
> > +                     unsigned int gup_flags, struct page **pages)
> > +{
> > +     /* FOLL_GET and FOLL_PIN are mutually exclusive. */
> > +     if (WARN_ON_ONCE(gup_flags & FOLL_GET))
> > +             return -EINVAL;
> > +
> > +     gup_flags |=3D FOLL_PIN;
> > +     return internal_get_user_pages_fast(start, nr_pages, gup_flags, p=
ages);
> > +}
> > +EXPORT_SYMBOL_GPL(pin_user_pages_fast);
>
> I was somewhat wondering about the number of functions you add here. So w=
e
> have:
>
> pin_user_pages()
> pin_user_pages_fast()
> pin_user_pages_remote()
>
> and then longterm variants:
>
> pin_longterm_pages()
> pin_longterm_pages_fast()
> pin_longterm_pages_remote()
>
> and obviously we have gup like:
> get_user_pages()
> get_user_pages_fast()
> get_user_pages_remote()
> ... and some other gup variants ...
>
> I think we really should have pin_* vs get_* variants as they are very
> different in terms of guarantees and after conversion, any use of get_*
> variant in non-mm code should be closely scrutinized. OTOH pin_longterm_*
> don't look *that* useful to me and just using pin_* instead with
> FOLL_LONGTERM flag would look OK to me and somewhat reduce the number of
> functions which is already large enough? What do people think? I don't fe=
el
> too strongly about this but wanted to bring this up.

I'd vote for FOLL_LONGTERM should obviate the need for
{get,pin}_user_pages_longterm(). It's a property that is passed by the
call site, not an internal flag.
