Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFE35AA39E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 01:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJcRN5FGnz2yx2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 09:18:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E800dH7P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E800dH7P;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJcQj5q5sz2y6M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 09:17:48 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id y197so857755yby.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 16:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LLe4P0CDKZNu2y/iLQFOmqm2xVCa1+xC0+/2UAKABJs=;
        b=E800dH7PG7qGduh6oSah7WQAwmrsM+wQmDZjjqdBAR60RvrxBZHO23f04n2iXHj6B6
         JP4sBRMEb5m0iPCXbYazGmBCzu7qChwl/ipzAmIhLadRiKX3Y0zySsPNlYd0h+LcoxL8
         5FNxATVqNyLa1BoYf6Cxlq+XP5qZplVJPHSMPHn1kfsbAjFzQxAMb9VoJYRqdqVYgEwr
         U+TKjEqBLNEszFZU9PUc/x9OXZ/4B2ib6Q/EZSxGRaxVsTNJo0XeGgkfBjLjXtDUFglC
         Q2eTqe1FllFFqOAiwsRUf4TETNOa1mHZ6WH7dmCthCaB5IO6/fwVnji8K+vdyqp3MbuZ
         tFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LLe4P0CDKZNu2y/iLQFOmqm2xVCa1+xC0+/2UAKABJs=;
        b=2iotqUcgelyFhdqthrF5NnZ6ZyU43rSmOcHKdZ+VrgSicdy2Yiak5JGDMJbZkPURNb
         xN1uQItx9rPxXxrMxDDpLT39V5panpNNVV8XxfLEWOBcZ6GNTH0P30cjKqwEWGKkR4kC
         Dq+skYO8sEAsxVXdAiLj2mfIOZdpWBuB24MQ/Fd47cXSkRRPqNUckvxKLDCGDb0Askwk
         +GeoABT5541KXRWMFS7dUpS6WRgpQ6Th0xV7ZchVZw9dkFzfhB4n4F7ROZsZOdBlsJLr
         fyeFYI4G9b7ErF2Rsf4TDrrPy3YNKPh4OISKi2g9IssrtnIsINFFz2zmNqkiUvO+YdN4
         B1bg==
X-Gm-Message-State: ACgBeo2dnYBk3a7bmNuefkiDfOWErh6TuZFLFuTiWKRbsuXLVjo22oSh
	sT2VDEp8K5XiFjtui7hR/ddfOpStFK8LRiPNaNk87w==
X-Google-Smtp-Source: AA6agR6jFuUOVZTVV0+XfDd0He4Hrb9XV2PsfvVugkFPyYicaO90qEw/qesq5yP63n03v6KmDubjqCQiaNOXXMGy9zw=
X-Received: by 2002:a05:6902:705:b0:695:b3b9:41bc with SMTP id
 k5-20020a056902070500b00695b3b941bcmr21131741ybt.426.1662074264903; Thu, 01
 Sep 2022 16:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-24-surenb@google.com>
 <20220901202052.xfaeuhmosheml2gz@moria.home.lan>
In-Reply-To: <20220901202052.xfaeuhmosheml2gz@moria.home.lan>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 16:17:33 -0700
Message-ID: <CAJuCfpEJxxm17fFJ1YVkOTBJbP5ce9ey90q_mCk_pkyTdHkrUg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 23/28] x86/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
To: Kent Overstreet <kent.overstreet@linux.dev>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, bigeasy@linutronix.de, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, Johannes
  Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 1, 2022 at 1:21 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Thu, Sep 01, 2022 at 10:35:11AM -0700, Suren Baghdasaryan wrote:
> > Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
> > compiled on this architecture.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  arch/x86/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index f9920f1341c8..ee19de020b27 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -27,6 +27,7 @@ config X86_64
> >       # Options that are inherently 64-bit kernel only:
> >       select ARCH_HAS_GIGANTIC_PAGE
> >       select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
> > +     select ARCH_SUPPORTS_PER_VMA_LOCK
> >       select ARCH_USE_CMPXCHG_LOCKREF
> >       select HAVE_ARCH_SOFT_DIRTY
> >       select MODULES_USE_ELF_RELA
>
> I think you could combine this with the previous path (and similarly on other
> architectures) - they logically go together.

Thanks for the feedback! I see no downside to that, so unless there
are objections I will combine them in the next version.
