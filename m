Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 621731DFAB3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 21:28:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Tth7373wzDqpB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 May 2020 05:28:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=jrdr.linux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SDwq+vPL; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TtfT5S36zDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 05:27:27 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id l15so16242004lje.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4zh7dLGu7lIkgyTn7FvmIN1ENGY6DqOeI+3TT5hxCt0=;
 b=SDwq+vPLA0VttbVnCIyh849cyujPiB4Sr5VE3OMr00ndVG07fQzr9R15FPIx1iqUtW
 P77gdjZKGBER/wOo6ZfKLZ/MnwEYUsOS6LA6V/sWnAI3xblDIvlXaLbXny+B/Ku6NhEC
 PyMTCg7+1GU1lZL8KcMSVdNbebuXR0Nv3iNLHgWmvgfoOqq9fe2DbeGW8rHwd/rLn3Hc
 6p7pWKUCNCOwYj7fdyTkYx7ypzcitzJAhMGkoXfv8S8zUTNoaJQAnuWwIa4TQjSyu8R9
 aULDf1WC3dkaxWC6o9AnAWGp4HZdj6nTR+qk+RmpStevnJIqDgbfmmrMOwbA1RLcLBRk
 fOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4zh7dLGu7lIkgyTn7FvmIN1ENGY6DqOeI+3TT5hxCt0=;
 b=fAFwRVBFoJ6abK3P5BWp/pfCEXlW2owcbPS3MkbPTgp1DHsDcVKTD0AnxNI1v6TqDK
 YJdxkWU93dEy0ZSoIZ85mgn9e7IVJZgmYmO8wa8NjeuMYIMeCIfwnKdmOlYiuLIkMLmZ
 pl7omjY2WcSxVlX7pwVlM6ZK3LhxUMXuCgIo4U1kaOMpO28kzTk81UZpwY98Qo3HE1zo
 5+VKOyspGAl2gCpY3yVPLk74E6Z4GnylChbm01DFHIKHr/VBaQu1nWAkn5vdYSDTISMg
 9SRkf623J/wMJHdSObAlXh3DtW4W3/a8px3FcARaCexg6saRmczmDa1iRD+1xrpmOKy3
 gcZg==
X-Gm-Message-State: AOAM530FPzqXwwFoDqKeRC2uTj2lttGzK+ijJ0g+z69dvXzaPFV+S/Tj
 gQQsa0n5O0n0sWF25peRF6dKERsMsj5ZHDVgiQI=
X-Google-Smtp-Source: ABdhPJx/aePhkdk7Qd1gPorTLl+bFXIeiWFXCUwHcB1sqn3tOPAQvRYi6F02pl0bBHDR2PIWoOrdqQ4l/KajgyWOA64=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr10155778ljj.257.1590262043781; 
 Sat, 23 May 2020 12:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <1590252072-2793-1-git-send-email-jrdr.linux@gmail.com>
 <20200523172519.GA17206@bombadil.infradead.org>
In-Reply-To: <20200523172519.GA17206@bombadil.infradead.org>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Sun, 24 May 2020 01:05:28 +0530
Message-ID: <CAFqt6zZfrdRB5pbHo5nu668yQUaTV9DbV3ZTeFq-UEKjs0X8XQ@mail.gmail.com>
Subject: Re: [linux-next RFC] mm/gup.c: Convert to use
 get_user_pages_fast_only()
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, kvm@vger.kernel.org,
 pbonzini@redhat.com, Linux-MM <linux-mm@kvack.org>,
 Peter Zijlstra <peterz@infradead.org>, kvm-ppc@vger.kernel.org,
 linux-kernel@vger.kernel.org, acme@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 John Hubbard <jhubbard@nvidia.com>, namhyung@kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 23, 2020 at 10:55 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, May 23, 2020 at 10:11:12PM +0530, Souptick Joarder wrote:
> > Renaming the API __get_user_pages_fast() to get_user_pages_
> > fast_only() to align with pin_user_pages_fast_only().
>
> Please don't split a function name across lines.  That messes
> up people who are grepping for the function name in the changelog.

Ok.

>
> > As part of this we will get rid of write parameter.
> > Instead caller will pass FOLL_WRITE to get_user_pages_fast_only().
> > This will not change any existing functionality of the API.
> >
> > All the callers are changed to pass FOLL_WRITE.
> >
> > Updated the documentation of the API.
>
> Everything you have done here is an improvement, and I'd be happy to
> see it go in (after fixing the bug I note below).
>
> But in reading through it, I noticed almost every user ...
>
> > -     if (__get_user_pages_fast(hva, 1, 1, &page) == 1) {
> > +     if (get_user_pages_fast_only(hva, 1, FOLL_WRITE, &page) == 1) {
>
> passes '1' as the second parameter.  So do we want to add:
>
> static inline bool get_user_page_fast_only(unsigned long addr,
>                 unsigned int gup_flags, struct page **pagep)
> {
>         return get_user_pages_fast_only(addr, 1, gup_flags, pagep) == 1;
> }
>
Yes, this can be added. Does get_user_page_fast_only() naming is fine ?


> > @@ -2797,10 +2803,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
> >        * FOLL_FAST_ONLY is required in order to match the API description of
> >        * this routine: no fall back to regular ("slow") GUP.
> >        */
> > -     unsigned int gup_flags = FOLL_GET | FOLL_FAST_ONLY;
> > -
> > -     if (write)
> > -             gup_flags |= FOLL_WRITE;
> > +     gup_flags = FOLL_GET | FOLL_FAST_ONLY;
>
> Er ... gup_flags |=, surely?

Poor mistake.


@@ -1998,7 +1998,7 @@ int gfn_to_page_many_atomic(struct
kvm_memory_slot *slot, gfn_t gfn,
        if (entry < nr_pages)
                return 0;

-       return __get_user_pages_fast(addr, nr_pages, 1, pages);
+       return get_user_pages_fast(addr, nr_pages, FOLL_WRITE, pages);

Also this needs to be corrected.
