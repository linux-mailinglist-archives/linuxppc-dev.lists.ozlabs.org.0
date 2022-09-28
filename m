Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13E95ED30B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 04:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McgRy3JN4z3c7d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 12:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=r3bKcW8Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=r3bKcW8Y;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McgRH4KTCz2xHM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 12:28:58 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-345528ceb87so117709767b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=Z0+bMELpdKdE8Q7V1g1xJPLf4JnpkgWuSB4HVsFpACw=;
        b=r3bKcW8YDyjLKKVV2T2nu9EK+l6skZKjuSXHqw1h7QSsCWuzjJLZSSPbPLqCkYLzuE
         srxL4E7bdabGQ54uivxtXo6aVslalhWzKnRB3ME9ODMXpkyi1jEarxBh3NdA34ePCygI
         1Lr3QhYYbCrQxYg+RD5l5rVH3u4LZRTUbQOjBHMe6Udu2afMMcUdFBQFGDW0FxigAg8O
         XPKvUjM4Q/CEzJnptfAVyGJG2I2t7f4KgpKYO65hCzHnmx7eNrxdV39FhGX4toQIRrGb
         38ZkEbv55Ye2BtH0b1tKVQ30lEB+ClAg4hKd3nwJkVNLlBsG6At6ipXEoz4LKLfj6HTS
         GbLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Z0+bMELpdKdE8Q7V1g1xJPLf4JnpkgWuSB4HVsFpACw=;
        b=n/W+epZnvGjq3kPTZ72GdW9MGTFJaMJxJSwHRnlSnffRVYohM2CSPprPZhq4F6ZmCp
         npqpvVids90tos9uKgDpr74meS6z1k3XgKstRStemmBYKK6+JFfNmVa9++rHlzk01U8b
         7YZn2lzppcxRZ7cLYHmbxTqWJgmlg6LEC2qTvHkrOGeCq7xnCZtsgjnZFAgV5dhuM57B
         JCGqdONxLLAZeoMHA7XpxaQYpuzsh4LGmItzqFLYO2pt88R8uqYo6Whazv0MWuPa8JVg
         hzah2WS9vb/iprz7Uzdy0JOxO6NDTSSmm/bBIvxAbZKcwffr1ctlE2OzuD4jp27ICCfE
         Vtow==
X-Gm-Message-State: ACrzQf3Xddb20DbA0Kd0X1lgs9Co89HQT2UxOEEOGdjJhm2sU57XuQ3r
	YffQQchighw+bbpGMlqYh+kq7xpT4092JO8uMOiGng==
X-Google-Smtp-Source: AMsMyM7cKmM6s5Wj2EGqGts0HQF0PxKwiB/suSdXFthaiHYdD52M0dUUPdTaFJmVGmtRhNHzLoZ6tTNAnTCaRpIdjiM=
X-Received: by 2002:a0d:ef84:0:b0:352:9e0d:a596 with SMTP id
 y126-20020a0def84000000b003529e0da596mr3923448ywe.347.1664332133583; Tue, 27
 Sep 2022 19:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901205819.emxnnschszqv4ahy@moria.home.lan>
 <CAJuCfpGNcZovncozo+Uxfhjwqh3BtGXsws+4QeT6Zy1mcQRJbQ@mail.gmail.com> <b5db3353-8aae-22d8-9598-eaa5eeb77cfc@suse.cz>
In-Reply-To: <b5db3353-8aae-22d8-9598-eaa5eeb77cfc@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 27 Sep 2022 19:28:42 -0700
Message-ID: <CAJuCfpEcTv5crNumhMTCf2yAJ5+86ph78-B+eyk_N84Ce=nr5w@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 00/28] per-VMA locks proposal
To: Vlastimil Babka <vbabka@suse.cz>
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
Cc: Michel Lespinasse <michel@lespinasse.org>, Joel Fernandes <joelaf@google.com>, Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Peter Xu <peterx@redhat.com>, dhowells@redhat.com, linux-mm <linux-mm@kvack.org>, Jerome Glisse <jglisse@google.com>, Davidlohr Bueso <dave@stgolabs.net>, Minchan Kim <minchan@google.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>, Axel Rasmussen <axelrasmussen@google.com>, kernel-team <kernel-team@android.com>, "Paul E . McKenney" <paulmck@kernel.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, Andy Lutomirski <luto@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, Kent Overstreet <kent.overstreet@linux.dev>, LKML <
 linux-kernel@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 11, 2022 at 2:35 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 9/2/22 01:26, Suren Baghdasaryan wrote:
> > On Thu, Sep 1, 2022 at 1:58 PM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
> >>
> >> On Thu, Sep 01, 2022 at 10:34:48AM -0700, Suren Baghdasaryan wrote:
> >> > Resending to fix the issue with the In-Reply-To tag in the original
> >> > submission at [4].
> >> >
> >> > This is a proof of concept for per-vma locks idea that was discussed
> >> > during SPF [1] discussion at LSF/MM this year [2], which concluded w=
ith
> >> > suggestion that =E2=80=9Ca reader/writer semaphore could be put into=
 the VMA
> >> > itself; that would have the effect of using the VMA as a sort of ran=
ge
> >> > lock. There would still be contention at the VMA level, but it would=
 be an
> >> > improvement.=E2=80=9D This patchset implements this suggested approa=
ch.
> >> >
> >> > When handling page faults we lookup the VMA that contains the faulti=
ng
> >> > page under RCU protection and try to acquire its lock. If that fails=
 we
> >> > fall back to using mmap_lock, similar to how SPF handled this situat=
ion.
> >> >
> >> > One notable way the implementation deviates from the proposal is the=
 way
> >> > VMAs are marked as locked. Because during some of mm updates multipl=
e
> >> > VMAs need to be locked until the end of the update (e.g. vma_merge,
> >> > split_vma, etc). Tracking all the locked VMAs, avoiding recursive lo=
cks
> >> > and other complications would make the code more complex. Therefore =
we
> >> > provide a way to "mark" VMAs as locked and then unmark all locked VM=
As
> >> > all at once. This is done using two sequence numbers - one in the
> >> > vm_area_struct and one in the mm_struct. VMA is considered locked wh=
en
> >> > these sequence numbers are equal. To mark a VMA as locked we set the
> >> > sequence number in vm_area_struct to be equal to the sequence number
> >> > in mm_struct. To unlock all VMAs we increment mm_struct's seq number=
.
> >> > This allows for an efficient way to track locked VMAs and to drop th=
e
> >> > locks on all VMAs at the end of the update.
> >>
> >> I like it - the sequence numbers are a stroke of genuius. For what it'=
s doing
> >> the patchset seems almost small.
> >
> > Thanks for reviewing it!
> >
> >>
> >> Two complaints so far:
> >>  - I don't like the vma_mark_locked() name. To me it says that the cal=
ler
> >>    already took or is taking the lock and this function is just markin=
g that
> >>    we're holding the lock, but it's really taking a different type of =
lock. But
> >>    this function can block, it really is taking a lock, so it should s=
ay that.
> >>
> >>    This is AFAIK a new concept, not sure I'm going to have anything go=
od either,
> >>    but perhaps vma_lock_multiple()?
> >
> > I'm open to name suggestions but vma_lock_multiple() is a bit
> > confusing to me. Will wait for more suggestions.
>
> Well, it does act like a vma_write_lock(), no? So why not that name. The
> checking function for it is even called vma_assert_write_locked().
>
> We just don't provide a single vma_write_unlock(), but a
> vma_mark_unlocked_all(), that could be instead named e.g.
> vma_write_unlock_all().
> But it's called on a mm, so maybe e.g. mm_vma_write_unlock_all()?

Thank you for your suggestions, Vlastimil! vma_write_lock() sounds
good to me. For vma_mark_unlocked_all() replacement, I would prefer
vma_write_unlock_all() which keeps the vma_write_XXX naming pattern to
indicate that these are operating on the same locks. If the fact that
it accepts mm_struct as a parameter is an issue then maybe
vma_write_unlock_mm() ?

>
>
