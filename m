Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473CD675CEA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 19:43:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz7g00mQjz3fKw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 05:43:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OqxeLPVY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OqxeLPVY;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz7f15hXcz3fGP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 05:42:32 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-5018be4ae8eso22288967b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 10:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8yb9zlv0Fl/IYbvB0WWSWiKf6OADONZOE7K+mXp3Y6I=;
        b=OqxeLPVY+krRPbuAleh+D+kRq9eoi+WL0Zg5tLk44bbMXCJnLKnQkTPFE9zZ13gTLi
         mBKFHB2WR8VOw8TFwSbJU8qQHmF2D93Ce11KWQvbaS0HcMXyvbCe+on43LRjPMtc4xZ1
         vCkWPK81+Uta9ojjKc3K9f5xlmFs7LyMOLiDJD8riY/ChroO5zXDIpIZDTGX0iq+wXjX
         rAciU0bPyVQXYsQ9xMvFLi5tpJhrpjfcZ2LiYJ1fFw4Nya5+RPjUeeJ9GS4rPkenYIZk
         EcZmC4ATyI97rxHsPOnbYUvVNqazmV8mcNLa8DK6m69+95LCWL1M2XqUvs430E3UA3Mu
         MKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yb9zlv0Fl/IYbvB0WWSWiKf6OADONZOE7K+mXp3Y6I=;
        b=GAkB3TZQqRreIFGPC1vweo61hHnaLdHi53aWd6d1d6G8H5c2aoufEPWBepI6WIZmWh
         SZnJFiD2S4Qhe3cN3a5v6VtnPyZ+58E7qCLv2kQs4u6/eb2TEzLDO74otUtktEs6L7tE
         LvFyieKiQFUArkMKGF5Bq65cnK83mUbN4p/fND4dHaIjedXpmeLXJovOQdSH/jKWjXhF
         A2wS0/Wjcx3L4slcZIzdX9TgTG4i9tTnbckCDPoZKzVbVY5wQztMzmSHZIPjabWObnbV
         HnMjFQNzWqQ70ojYPmoPPU1xIn51o8lgom4H6LMDvbixUpPAwYwI5uv+2gNG/dTyqelq
         yGKQ==
X-Gm-Message-State: AFqh2ko4Itmb23f9+gwpiSujkOC+LtYPChZtYkoiI5sXfqFpwu33QEI+
	oSD9/ltSxr2dGwoVeo3amgk19hgL3E6FdVcbSN0/MA==
X-Google-Smtp-Source: AMrXdXvtn4UGZgzxG45YYNgiCF8TyR8V/vYHcCDAw2jaiyhLgI91qbTnWOU4ys0ojd68P8jMZVqiv5UrhWKEYqhpeOs=
X-Received: by 2002:a0d:c0c7:0:b0:502:30d7:5fff with SMTP id
 b190-20020a0dc0c7000000b0050230d75fffmr159281ywd.347.1674240150044; Fri, 20
 Jan 2023 10:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz> <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org> <20230120172140.GL2948950@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20230120172140.GL2948950@paulmck-ThinkPad-P17-Gen-1>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Jan 2023 10:42:18 -0800
Message-ID: <CAJuCfpGjUSJ3ccJVfU=QAmLUKnDGs-sMHLg=EU_sa7pOZnzX4A@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
To: paulmck@kernel.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.co
 m, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 9:21 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Fri, Jan 20, 2023 at 04:49:42PM +0000, Matthew Wilcox wrote:
> > On Fri, Jan 20, 2023 at 08:45:21AM -0800, Suren Baghdasaryan wrote:
> > > On Fri, Jan 20, 2023 at 8:20 AM Suren Baghdasaryan <surenb@google.com> wrote:
> > > >
> > > > On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > > > > > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > > > >
> > > > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > > > >
> > > > > > > After some more clarification I can understand how call_rcu might not be
> > > > > > > super happy about thousands of callbacks to be invoked and I do agree
> > > > > > > that this is not really optimal.
> > > > > > >
> > > > > > > On the other hand I do not like this solution much either.
> > > > > > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > > > > > much with processes with a huge number of vmas either. It would still be
> > > > > > > in housands of callbacks to be scheduled without a good reason.
> > > > > > >
> > > > > > > Instead, are there any other cases than remove_vma that need this
> > > > > > > batching? We could easily just link all the vmas into linked list and
> > > > > > > use a single call_rcu instead, no? This would both simplify the
> > > > > > > implementation, remove the scaling issue as well and we do not have to
> > > > > > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> > > > > >
> > > > > > Yes, I agree the solution is not stellar. I wanted something simple
> > > > > > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > > > > > on the list without hooking up a shrinker (additional complexity) does
> > > > > > not sound too appealing either.
> > > > >
> > > > > I suspect you have missed my idea. I do not really want to keep the list
> > > > > around or any shrinker. It is dead simple. Collect all vmas in
> > > > > remove_vma and then call_rcu the whole list at once after the whole list
> > > > > (be it from exit_mmap or remove_mt). See?
> > > >
> > > > Yes, I understood your idea but keeping dead objects until the process
> > > > exits even when the system is low on memory (no shrinkers attached)
> > > > seems too wasteful. If we do this I would advocate for attaching a
> > > > shrinker.
> > >
> > > Maybe even simpler, since we are hit with this VMA freeing flood
> > > during exit_mmap (when all VMAs are destroyed), we pass a hint to
> > > vm_area_free to batch the destruction and all other cases call
> > > call_rcu()? I don't think there will be other cases of VMA destruction
> > > floods.
> >
> > ... or have two different call_rcu functions; one for munmap() and
> > one for exit.  It'd be nice to use kmem_cache_free_bulk().
>
> Good point, kfree_rcu(p, r) where "r" is the name of the rcu_head
> structure's field, is much more cache-efficient.
>
> The penalty is that there is no callback function to do any cleanup.
> There is just a kfree()/kvfree (bulk version where applicable),
> nothing else.

If Liam's suggestion works then we won't need anything additional. We
will free the vm_area_structs directly on process exit and use
call_rcu() in all other cases. Let's see if Michal knows of any case
which still needs an RCU grace period during exit_mmap.

>
>                                                         Thanx, Paul
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
