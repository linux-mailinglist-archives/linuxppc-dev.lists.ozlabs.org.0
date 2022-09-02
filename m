Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2815AB7C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 19:47:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK52j0Xm3z304n
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 03:47:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p7yNLbs3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p7yNLbs3;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MK5252MMMz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 03:46:36 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-324ec5a9e97so23242707b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 10:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NSRndixZOPtPP2wASFAk4jDgEuiWo0dI3vnvon4iVQw=;
        b=p7yNLbs3A5QrKhqddelaYGVcTxeyeBxU6V+CfdZl8egFvd/kd/WfV9WhezQZtduD6U
         ojUTPDqjmbVXUP/qOTQPhW1iVshOCe2/Kkhz9tx+/VHsbb3s9z+ix80u0zoMvuDVLsQB
         S/Cxva/vEynV/XJ7yvbf62BupfG2Y2C3SYRhWwecv+MxIs/2Pzdujt1V0m7EMZ54a3/6
         19zervSnL1o4aOPUCovxya1eT+MWmyz2/s9L2sHGaXlBv/pUOAES9XRIbgskqOYZFOnW
         ylq4VF2M8F7Gfv/jH9DNcMnD9repohepfZJtVB3QBDZAJd9V4ggMFUAjBmSpxHZ+g1Yv
         99IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NSRndixZOPtPP2wASFAk4jDgEuiWo0dI3vnvon4iVQw=;
        b=LaRceILj8diuQwS0Ef8GKkVtZsH82DL1gAOhQWOEemcbMTOuPuZzgNQXxN0pMzNb5s
         So8swmAt9dyeIobRGQ0hYnAM3y28YaRPdfsWLlIia1ali+LU+/7fLerTchFGWt/FDJj0
         pEL7MbIaOjuGFicEk+ovszzJD8Lpo3aEkc5rOws+07c7Sxp7wns5jky0KR49Dc1RsMkz
         cfJHUf5lN/sLKfMNHcPcmBMMDWAcdEkk9iUlY+mWvDqFVfiRtgoVP1OfnvkKwKhMYYUx
         wdbzK3TKFyv6jt07zdSh858K8+2UHjobJdCIFd0KdWB05dPUAPAsUb8xaZz+A6r4cxbA
         xg6w==
X-Gm-Message-State: ACgBeo3qt9blpi7vHl9/mIF0vO/bCZ6yJYkuWB5jLUMTeHbzX25neTR+
	OiNypaw3bjPkeCS2s/cmQeHyuSDjaZAmVudqwvPpdA==
X-Google-Smtp-Source: AA6agR6GDF9sHJzcyjUaya7fByUdhkEhzDw6yipl5NEBaRGv8CiuB2xbiyA1Dj0na3Efi1HIFlyduTjOsTurz7MleBc=
X-Received: by 2002:a0d:e7c3:0:b0:344:8cee:c384 with SMTP id
 q186-20020a0de7c3000000b003448ceec384mr7800183ywe.514.1662140791101; Fri, 02
 Sep 2022 10:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-5-surenb@google.com>
 <20220901202409.e2fqegqghlijkzey@moria.home.lan> <YxGhcnKyV7KCiWCJ@linutronix.de>
In-Reply-To: <YxGhcnKyV7KCiWCJ@linutronix.de>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 2 Sep 2022 10:46:20 -0700
Message-ID: <CAJuCfpGsOwe39Hm65VVp0Z-12e2f0wrSjvOQDhQx0XnYpr4Cbw@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 04/28] mm: move mmap_lock assert function definitions
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <linux-kernel@vger
 .kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 1, 2022 at 11:23 PM Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>
> On 2022-09-01 16:24:09 [-0400], Kent Overstreet wrote:
> > > --- a/include/linux/mmap_lock.h
> > > +++ b/include/linux/mmap_lock.h
> > > @@ -60,6 +60,18 @@ static inline void __mmap_lock_trace_released(struct mm_struct *mm, bool write)
> > >
> > >  #endif /* CONFIG_TRACING */
> > >
> > > +static inline void mmap_assert_locked(struct mm_struct *mm)
> > > +{
> > > +   lockdep_assert_held(&mm->mmap_lock);
> > > +   VM_BUG_ON_MM(!rwsem_is_locked(&mm->mmap_lock), mm);
> >
> > These look redundant to me - maybe there's a reason the VM developers want both,
> > but I would drop the VM_BUG_ON() and just keep the lockdep_assert_held(), since
> > that's the standard way to write that assertion.
>
> Exactly. rwsem_is_locked() returns true only if the lock is "locked" not
> necessary by the caller. lockdep_assert_held() checks that the lock is
> locked by the caller - this is the important part.

Ok, if at the end of the day there is a consensus that this redundancy
should be removed then I'll do that in a patch separate from this
series. Please note that in this patch I'm not changing these
functions in any way, just moving them.

>
> Sebastian
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
