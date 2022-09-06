Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A425C5AF5C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 22:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMcJv3vPxz3c3Q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:23:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1rT34Xt;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1rT34Xt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1rT34Xt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U1rT34Xt;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMcJF6mBDz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 06:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662495755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6rfQm3A/tm7Sj95hHoCuXpvQKcgb4WAgDh0q01aC4qg=;
	b=U1rT34XtVUrh0NF8Jjv898YADzbCIC+Hb08Uh1C+CvdQsRecl1AkBLR91CdJjMGrX4LC4+
	pL4bpYs2gA8IyKA/5RXAku+sSkbZEj6JvOw1+cEcRS/uLYBgnYyjJERma5aQW/q0v++5od
	pG2Qb9h7No06oBULPM55mB50NjPoTvc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662495755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6rfQm3A/tm7Sj95hHoCuXpvQKcgb4WAgDh0q01aC4qg=;
	b=U1rT34XtVUrh0NF8Jjv898YADzbCIC+Hb08Uh1C+CvdQsRecl1AkBLR91CdJjMGrX4LC4+
	pL4bpYs2gA8IyKA/5RXAku+sSkbZEj6JvOw1+cEcRS/uLYBgnYyjJERma5aQW/q0v++5od
	pG2Qb9h7No06oBULPM55mB50NjPoTvc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-Ex8MK9W6PyWOP7IuldIZUg-1; Tue, 06 Sep 2022 16:22:34 -0400
X-MC-Unique: Ex8MK9W6PyWOP7IuldIZUg-1
Received: by mail-qv1-f72.google.com with SMTP id c1-20020a0cfb01000000b00495ad218c74so8768334qvp.20
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 13:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6rfQm3A/tm7Sj95hHoCuXpvQKcgb4WAgDh0q01aC4qg=;
        b=G4SuQ63mZbj2iMj/RMjd3FtK6V2g/wgrqAjzn39iwQviJIzUXrM58IgT3LJ51yyuZ7
         FToX/71kYoHr+suoeIgmyYwpJF4aY4U002kkx89tOjBp0B+UtZFWsd0DVzzXa5ufmJdv
         y5Z8JAtWL08Oaew474wlPc/BlxK4Un541rXwlFK8tZCenNoI+p8pP3PmvpqLNLLS1Oy1
         ZSpr+eN2gZvPJ2irW2nPkoG43Aw5/O8D9yuAkFTKUBTDQ88u4e/b44ZzFiUzczUwuwCU
         wGKd24HWSF7vNGsbINZivlG/FyENzkXq271OxF3bOO2yEOlDVm/LQ6VCjA4NZKKOxDJ8
         xwRw==
X-Gm-Message-State: ACgBeo0roE14hBSMKTo0uT8vGYJ/T3K+tkXlcTKkj3D4UxHmy1dYapEK
	iRpA3x+9mCSGtKi/IrEPppMahkUnDh5FR6wcEU72ZibuhGMZTmasnJRAEkABypLJYIpGbew27MP
	i4Debm6h+II2ayZbulKP/0qwb1w==
X-Received: by 2002:ad4:5ccc:0:b0:49a:87e:b21c with SMTP id iu12-20020ad45ccc000000b0049a087eb21cmr58597qvb.28.1662495753500;
        Tue, 06 Sep 2022 13:22:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7HlEu+ZPwHInX004FIRhAcDe0jim1kS8RlEBcZxWCkXVNVfHqCq7f5i8MgInHqpj8yvoLXLQ==
X-Received: by 2002:ad4:5ccc:0:b0:49a:87e:b21c with SMTP id iu12-20020ad45ccc000000b0049a087eb21cmr58555qvb.28.1662495753193;
        Tue, 06 Sep 2022 13:22:33 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id u14-20020a05622a14ce00b00341a807ed21sm2137489qtx.72.2022.09.06.13.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:22:32 -0700 (PDT)
Date: Tue, 6 Sep 2022 16:22:30 -0400
From: Peter Xu <peterx@redhat.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [RFC PATCH RESEND 19/28] mm: disallow do_swap_page to handle
 page faults under VMA lock
Message-ID: <YxesBqZ+L+oeQv5e@xz-m1.local>
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-20-surenb@google.com>
 <YxeiB2la/9fZEzLO@xz-m1.local>
 <CAJuCfpHkjHAAmKAJH=cxhFmwMawUDQJccwKa8k=xXNZZ1knT7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJuCfpHkjHAAmKAJH=cxhFmwMawUDQJccwKa8k=xXNZZ1knT7g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LK
 ML <linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 06, 2022 at 01:08:10PM -0700, Suren Baghdasaryan wrote:
> On Tue, Sep 6, 2022 at 12:39 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Sep 01, 2022 at 10:35:07AM -0700, Suren Baghdasaryan wrote:
> > > Due to the possibility of do_swap_page dropping mmap_lock, abort fault
> > > handling under VMA lock and retry holding mmap_lock. This can be handled
> > > more gracefully in the future.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  mm/memory.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index 9ac9944e8c62..29d2f49f922a 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -3738,6 +3738,11 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >       vm_fault_t ret = 0;
> > >       void *shadow = NULL;
> > >
> > > +     if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> > > +             ret = VM_FAULT_RETRY;
> > > +             goto out;
> > > +     }
> > > +
> >
> > May want to fail early similarly for handle_userfault() too for similar
> > reason.  Thanks,
> 
> I wasn't aware of a similar issue there. Will have a closer look. Thanks!

Sure.

Just in case this would be anything helpful - handle_userfault() will both
assert at the entry (mmap_assert_locked) and will in most cases release
read lock along the way when waiting for page fault resolutions.

And userfaultfd should work on anonymous memory for either missing mode or
write protect mode.

Thanks,

-- 
Peter Xu

