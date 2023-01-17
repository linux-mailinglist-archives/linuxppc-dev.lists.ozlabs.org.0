Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0B066E810
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxLsc0Jb1z3bXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:01:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g/lmjevr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=g/lmjevr;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxLrd6yMnz2xb4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:00:33 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4d0f843c417so326875887b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHXAUt3ny3FCa4wu6g+W377gbUsNdU3WemYAKDbc46U=;
        b=g/lmjevrSe6/UrgH/yDr3jnG/kI4TrUFxc0eorY+CpDT2ykEH+lJRFAz/cWBd/zEdj
         MVdr/Ofoa6aR32CWHTpBkD8bDur2CQiRIheG7w7pM2NI6BvMQxXWQsrg5n0GwUhoL08J
         LdPT7k+/1CqROg1uiCmQdkoqciMYhUqAlsZBX28L2uX9bktKWGFWNUgc85DPZdW+WP11
         Dkf6Qke8sjXQDbRvg/nVqX5qUNT+3VmFFIOLdIi6kJ+r7CbIcHOYMmbdHH3XgDg1gWBk
         ZM2hyaluuxbAIhpC67CkTkctrYeIFXRpdPjxKqPk4hdSGNqOxe0hx+oxT7VE5OnllhSR
         20iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHXAUt3ny3FCa4wu6g+W377gbUsNdU3WemYAKDbc46U=;
        b=lHym/RREPO4W7xA7bjhiL7WtxbtBgsLyW+PSj6w+1BwR0+hr0Sz1U0ggXad2xMpsgu
         sHTvfT1LSV8vQtZYp7GwRBmtSNkqin9kai0vfBvbanFUfsFCaXOFi0rjy1XT+RDGYsqw
         fIHZ4B3qOrjsZZEAL6YRmHwCMNaR8U6SB5qXNh0lRByn4psJ1sXTP2t63R8bNRCo1vkv
         QAts+TRZ3DaKKe53m4jbeoSp2giONds8T/V3L7oSC208TJOvkFnb43TedDlfy+A5fIXy
         laK2k4tbkU3KY2334NHD3mkMUG3zo9VkDryl5Agdz64419DvY4rggaIOXpZf2+MlaYY5
         GgNw==
X-Gm-Message-State: AFqh2kolxPYcAiW16uolKYhm436GTj3Gy5geXYgZDksCLFmrocTmUjmj
	ag7kYeFVY3VtbXten02lNj41iqEjgEzNB+VhS+nYHQ==
X-Google-Smtp-Source: AMrXdXtFBxrPIQwrnVbDPkv8eWbIPzbx4cIqKk4Gu4mHweZyTIBkyAUJF5bv5Cr4H2Zct//6eMLnSU/VFnEJZM2Oblg=
X-Received: by 2002:a81:784c:0:b0:4e1:5013:6da1 with SMTP id
 t73-20020a81784c000000b004e150136da1mr666982ywc.218.1673989230419; Tue, 17
 Jan 2023 13:00:30 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <Y8UxnqPCTLbbD+2F@localhost> <Y8YgomKF189vmgLz@casper.infradead.org>
 <CAJuCfpECJhUu3fvWbBzmAkEA3+1LTkKqJOVadQB_-_mEHME=xg@mail.gmail.com>
 <Y8Y2JErbNQOhL8ee@casper.infradead.org> <CAJuCfpEx6FJpm0Js=cvcHw6mY3izPfoskxseSMyxFAxLX97X_w@mail.gmail.com>
 <Y8bnpqw134CHenz/@casper.infradead.org> <CAJuCfpGKRLshk1oWf1Nz4jhDrMGnkWs7qtWYaj=j_iQwPq0THQ@mail.gmail.com>
 <Y8cFt7GVLTOT5Cdl@dhcp22.suse.cz>
In-Reply-To: <Y8cFt7GVLTOT5Cdl@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 13:00:19 -0800
Message-ID: <CAJuCfpHwmfauZihbexnSq9mEe3Yz0DxT=KwgBX7ATCr2QJp_pA@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundatio
 n.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 12:31 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-01-23 10:28:40, Suren Baghdasaryan wrote:
> [...]
> > > Then yes, that's a starvable lock.  Preventing starvation on the mmap
> > > sem was the original motivation for making rwsems non-starvable, so
> > > changing that behaviour now seems like a bad idea.  For efficiency, I'd
> > > suggest that a waiting writer set the top bit of the counter.  That way,
> > > all new readers will back off without needing to check a second variable
> > > and old readers will know that they *may* need to do the wakeup when
> > > atomic_sub_return_release() is negative.
> > >
> > > (rwsem.c has a more complex bitfield, but I don't think we need to go
> > > that far; the important point is that the waiting writer indicates its
> > > presence in the count field so that readers can modify their behaviour)
> >
> > Got it. Ok, I think we can figure something out to check if there are
> > waiting write-lockers and prevent new readers from taking the lock.
>
> Reinventing locking primitives is a ticket to weird bugs. I would stick
> with the rwsem and deal with performance fallouts after it is clear that
> the core idea is generally acceptable and based on actual real life
> numbers. This whole thing is quite big enough that we do not have to go
> through "is this new synchronization primitive correct and behaving
> reasonably" exercise.

Point taken. That's one of the reasons I kept this patch separate.
I'll drop this last patch from the series for now. One correction
though, this will not be a performance fallout but memory consumption
fallout.

>
> --
> Michal Hocko
> SUSE Labs
