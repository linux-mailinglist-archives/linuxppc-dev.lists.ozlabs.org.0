Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0E8FFFC2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 11:41:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A3jzZKXi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwbnS74hYz3cRK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 19:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A3jzZKXi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735; helo=mail-qk1-x735.google.com; envelope-from=nphamcs@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vwbmk0n2Wz30VN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 19:41:08 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-794ab0f7214so94303685a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2024 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717753264; x=1718358064; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/oSqpRfe691rKkuHYiQBq4OSn10B5HpGWWM65PH/D8=;
        b=A3jzZKXitCwXHlvML3ZOWQGm4ULYPo5QJM0u/qOBBhvGGxRAGRUmjyD+BewRUSWCaY
         h8mwsD5aEuBrEn1ZENJXJXUqUGLaCs8hQj5u94+bvYqWboq3aAv6226hWU1DJPbcPTsX
         /rQMrYcC7rcgm8RrU59hMov67J+paqocZfW3LH15IuRcyCkDb4fNiI297NDclxdDQ6IB
         Cs1Icl3vle7mKSs7t0F6jksCDE1p2/GwW7on/Z/x6O5pY6o0adPvlT4s+cT7OFx/VNUZ
         iTnfd/XEF8iMedVBSCJunw3lfll04iCN4wwgxhiYcu6UicPpntjGjT/U4/a7zAAQDMvD
         cBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717753264; x=1718358064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/oSqpRfe691rKkuHYiQBq4OSn10B5HpGWWM65PH/D8=;
        b=tG35YOOo1QRACZdtMMlAAyM/IlH9WP4Ok6iYOTTbVvEdiCMiJ1YfJDtdGwAnAXKDi4
         rT/pyYLOdBDZGozzQsKTuCAyXMtSxaN37tT5BW4OSReAzc7yMxnDwaHrJERblblwokuC
         aEmGuCqCv/I1Z4B9ytMbefdB2ytFX3SkVDjagOJfBknns34mWil9dp553AeSeIPba/0p
         LbCPatFdBzXerXwEwzK+CTmLYjrPlQci4THJW+4PvRQ1YTilc1UJ/CdUOAsZV+Tl7yHs
         SiLPVM2FcqVkolA5ihcRWMFOctmUY5irqFwDDOih3Ry1wAYyz1aWEcey/2fudlgX8Kai
         rCSg==
X-Forwarded-Encrypted: i=1; AJvYcCW+qWAlwCYRzZ8JySeTJLCweQ73/IGer+f/v41QGjsYuZ1fvWrG62XX8ZNnyNAwvuQq7yOe+QN2Rme2QJq8nq63Szd8u1uSpTuRz4r8lQ==
X-Gm-Message-State: AOJu0Yw4SotMoCLThZn2lVuGbTjI4N9T1rjUgZG14IBXisE+5Sj+1o1K
	nucIlY9iejbVUKFmYcp/8874mlBZH6Ae9NLgNaapwfIAhksRxovMl9q5KOlhf5P9YQZy8h7yhJN
	HUH/AGB23/e2smeiLzDKOj8oUucg=
X-Google-Smtp-Source: AGHT+IHn0b6EwReH7VI6F17pOZO2Pe20rM3RuA+jzTt8WWs3Xl1Tg5kPGQ/pBjjGZKYKADka1oStpZieFokTq4hFc6k=
X-Received: by 2002:a05:6214:534a:b0:6b0:5933:3a8a with SMTP id
 6a1803df08f44-6b059b851a8mr20938446d6.15.1717753263959; Fri, 07 Jun 2024
 02:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJD7tkb=5GJ9SNUwDsu1Zy3Tus4rjsNo60Hg9N7=gGth409Diw@mail.gmail.com>
 <CAOUHufb6zXr14Wm3T-4-OJh7iAq+vzDKwVYfHLhMMt96SpiZXg@mail.gmail.com>
 <CAJD7tkZ+QY55GTzW9A7ZCm=rxAEfrW76cWXf8o5nwiKSXp8z=w@mail.gmail.com>
 <20240604231019.18e2f373@yea> <CAJD7tkYq5u7B+0UH2XKpeWJnUxoO2kJ1_XZ2JOgYpyNEVR7u0g@mail.gmail.com>
 <20240606010431.2b33318c@yea> <CAJD7tkbhWYzx=6YmzAh0F+cK-_Bn8mPOH7gMbQS7YVXmaFSgFg@mail.gmail.com>
 <e68bcc6a-25b1-42aa-83b3-5d457b254cbe@linux.dev> <20240606043156.GC11718@google.com>
 <6335c05d-9493-4b03-85a7-f2dd91db9451@linux.dev> <20240606054334.GD11718@google.com>
In-Reply-To: <20240606054334.GD11718@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 7 Jun 2024 10:40:52 +0100
Message-ID: <CAKEwX=OAEzKW9zO9pn41V71A8Ua2dJjD3DY6RsDMNdSd-4ts5w@mail.gmail.com>
Subject: Re: kswapd0: page allocation failure: order:0, mode:0x820(GFP_ATOMIC),
 nodemask=(null),cpuset=/,mems_allowed=0 (Kernel v6.5.9, 32bit ppc)
To: Sergey Senozhatsky <senozhatsky@chromium.org>
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, Yu Zhao <yuzhao@google.com>, Minchan Kim <minchan@kernel.org>, linux-kernel@vger.kernel.org, Yosry Ahmed <yosryahmed@google.com>, linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>, Chengming Zhou <chengming.zhou@linux.dev>, linuxppc-dev@lists.ozlabs.org, "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 6, 2024 at 6:43=E2=80=AFAM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/06/06 12:46), Chengming Zhou wrote:
> > >> Agree, I think we should try to improve locking scalability of zsmal=
loc.
> > >> I have some thoughts to share, no code or test data yet:
> > >>
> > >> 1. First, we can change the pool global lock to per-class lock, whic=
h
> > >>    is more fine-grained.
> > >
> > > Commit c0547d0b6a4b6 "zsmalloc: consolidate zs_pool's migrate_lock
> > > and size_class's locks" [1] claimed no significant difference
> > > between class->lock and pool->lock.
> >
> > Ok, I haven't looked into the history much, that seems preparation of t=
rying
> > to introduce reclaim in the zsmalloc? Not sure. But now with the reclai=
m code
> > in zsmalloc has gone, should we change back to the per-class lock? Whic=
h is
>
> Well, the point that commit made was that Nhat (and Johannes?) were
> unable to detect any impact of pool->lock on a variety of cases.  So
> we went on with code simplification.

Yeah, we benchmarked it before zsmalloc writeback was introduced (the
patch to remove class lock was a prep patch of the series). We weren't
able to detect any regression at the time with just using a global
pool lock.

>
> > obviously more fine-grained than the pool lock. Actually, I have just d=
one it,
> > will test to get some data later.
>
> Thanks, we'll need data on this.  I'm happy to take the patch, but
> jumping back and forth between class->lock and pool->lock merely
> "for obvious reasons" is not what I'm extremely excited about.

FWIW, I do think it'd be nice if we can make the locking more granular
- the pool lock now is essentially a global lock, and we're just
getting around that by replicating the (z)pools themselves.

Personally, I'm not super convinced about class locks. We're
essentially relying on the post-compression size of the data to
load-balance the queries - I can imagine a scenario where a workload
has a concentrated distribution of post-compression data (i.e its
pages are compressed to similar-ish sizes), and we're once again
contending for a (few) lock(s) again.

That said, I'll let the data tell the story :) We don't need a perfect
solution, just a good enough solution for now.
