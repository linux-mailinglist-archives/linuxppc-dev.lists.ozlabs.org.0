Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0DF5AF572
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 22:09:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMc0X6tjwz3c4j
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:09:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m8rk4SWG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=m8rk4SWG;
	dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMbzv307Mz2xHM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 06:08:26 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e7so6540051ilc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 13:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=xXYqmgNj8Tmj+x9M5f+04P5dGXCMQoJ15NQDTyzFADc=;
        b=m8rk4SWGAohfkoYbpdwdbzCtTDUzSXWWGs5XiL42MbO9eUE0KkcAYJtigCpi9ZiVNM
         XRpBlpbqZwXmwRi9Nu33ABMaIniF1jEHqbW4ibZa4VuMko12DcRlsp/s+LV6WxLiKUuc
         DlfoAjSQiq7WPBBE1H0eJXzkvrbAVqNEfHSySVRwxI4xwPffNFz/azZDxOMKUNiN3Ouc
         7vutba0HCoTD9TjCbtMYQAiBlFuUgL4kHcRgMCO70oFgb/HnnUnaLa2Z+vFBz7EwfT/e
         UjoQCVppiPyeulYLjD59K/Xfz+Ua8hohlBdVSzf0piAJ4TW92nmjmGtCKP2RKU2CH0AC
         U7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=xXYqmgNj8Tmj+x9M5f+04P5dGXCMQoJ15NQDTyzFADc=;
        b=DVbE+KyGuVJSM+II0x3OTWEBX1phj6g8+V1J4ZTFbk81NwMDF0WgXgmY8kuDN019yS
         eAO6YVZSe7zEyyOi3mC+dhgStoSDxzt64v2bib5Ef4I/g6e0zEXYpX3Q9+Xq2rjNanfR
         1izwDXQY31p+5kSx+xwSFTkyFGUdiSCXqyECArHJXJkiNQ/okLZcSulmmaCUBrqqjHpp
         SNEnloQogvABP/gIyPhznxxCKQP8GWhROIdjFIMkHpyxPpbTAO2ixZ0rraf1X0HsKt8r
         O73/qoiVV/JL2rQRpuz1YXuHBGFDpYkFCTKWJugVQIPybqm5Yg+T+xV3FWG10cuEMWV3
         5LQA==
X-Gm-Message-State: ACgBeo3ic7Va+TjDrSpZ0wwveMfZ7AtTKGykIACGSIE3GWO9oJ/KDu9l
	nzcqTNFzwloGE0KXV5E5NU1LenL8WBnbFRRHZex6bw==
X-Google-Smtp-Source: AA6agR4kK/DxJZ/QWl7YVW2Lx89QOwSRT/InEkv6rZ+riJpikx1NlRv2IBjPMwhu7ALyb9V69oOBORt1uVJaIEcSenM=
X-Received: by 2002:a92:ca0f:0:b0:2ee:5577:e447 with SMTP id
 j15-20020a92ca0f000000b002ee5577e447mr103285ils.215.1662494902370; Tue, 06
 Sep 2022 13:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-20-surenb@google.com>
 <YxeiB2la/9fZEzLO@xz-m1.local>
In-Reply-To: <YxeiB2la/9fZEzLO@xz-m1.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 6 Sep 2022 13:08:10 -0700
Message-ID: <CAJuCfpHkjHAAmKAJH=cxhFmwMawUDQJccwKa8k=xXNZZ1knT7g@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 19/28] mm: disallow do_swap_page to handle page
 faults under VMA lock
To: Peter Xu <peterx@redhat.com>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LK
 ML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 6, 2022 at 12:39 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Sep 01, 2022 at 10:35:07AM -0700, Suren Baghdasaryan wrote:
> > Due to the possibility of do_swap_page dropping mmap_lock, abort fault
> > handling under VMA lock and retry holding mmap_lock. This can be handled
> > more gracefully in the future.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/memory.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 9ac9944e8c62..29d2f49f922a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> >       vm_fault_t ret = 0;
> >       void *shadow = NULL;
> >
> > +     if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> > +             ret = VM_FAULT_RETRY;
> > +             goto out;
> > +     }
> > +
>
> May want to fail early similarly for handle_userfault() too for similar
> reason.  Thanks,

I wasn't aware of a similar issue there. Will have a closer look. Thanks!

>
> --
> Peter Xu
>
