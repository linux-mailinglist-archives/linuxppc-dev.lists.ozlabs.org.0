Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C768DED3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 18:24:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB9491k8Nz3cfd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:24:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pb3qC/ed;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Pb3qC/ed;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB93D2nhkz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 04:24:07 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5249a65045aso172281627b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 09:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wY8hb5nZUT6CPxT6UQHAOP5yFiXCDsuAFz5p/YAvGLQ=;
        b=Pb3qC/edCu+Hdhuxvh6TBPGYHOaJFiLiiDb92+b3hsAKrktXMLCjByGYCVYHnQpMrj
         weicCOrRJIJoIT6fer6g9jNEjcE8p19ac7zlLhBMuS5AhytpqFS8HzhZ/Quvq35yemQu
         nuGjWp9herknCbGRi2jNeP/G8KwHMt0KF4T7nfE9ebWsqlxoytJdJVJd+YK2wTxfst3s
         YiDRQyHlXxz+RrDlsjNEE0kGtlMAPp2GdWOwLpSfkltZjREr7SfLW3bSDuh37mNkpJiJ
         rK3K2dACeciOJshRN89HTZcg8bk7zWUxYnolBW6KWfy2DbTd7tlzhtqHN6vc6V+htiaY
         lbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wY8hb5nZUT6CPxT6UQHAOP5yFiXCDsuAFz5p/YAvGLQ=;
        b=M5AEfhRcwHeUfrbM4upaIjK0YX2N9/If1YmVR08yfThVtaAFBZ6JGzyevmVE6wY+Bg
         ZLlY1yU9vIAnu3Fq/6iRGLDzRATAi6o5kMFiWlroaGXC7QynG2ytldnpq3t9ah9S6orR
         TiQANifPK1HNospnnx5ZA4YTHjvcROb8+iPfBUHN1rLSm97GQleiUgn32N8TZctkYES4
         OzKmYtxgqF0SexWhbzm9Sl3FXgUpCnEgFKXHVKTdsBVr0aHkJVVyq58NvbJiHpOd3vkr
         +h83o/tD/y1iAUYaoxH37B3sMrKWT8Ys1VdaTdJ32MUDk/n95L6qbqVjb/5oqW4j//kX
         7NhA==
X-Gm-Message-State: AO0yUKUaqGqdxnt0U+WcIXtftg6t8XLksd2MiyFV64uefIuA3iAw0MON
	PrmMcivDEPotF7vtul1ys6kC5RWbh/Izst2UhrGDSQ==
X-Google-Smtp-Source: AK7set9W8Y0rg7QI82Y3A8eB+oY+UN01O2yggY3Hc3Pg8a19h2sKqu2GnTC09gqwgFsaHf2qGIPVjJ6VaMAwBgtLg2U=
X-Received: by 2002:a0d:e808:0:b0:527:b484:aa14 with SMTP id
 r8-20020a0de808000000b00527b484aa14mr456067ywe.263.1675790643441; Tue, 07 Feb
 2023 09:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
 <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
 <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
 <20230126172726.GA682281@paulmck-ThinkPad-P17-Gen-1> <Y+KHWcpxd09prihv@elver.google.com>
In-Reply-To: <Y+KHWcpxd09prihv@elver.google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 7 Feb 2023 09:23:52 -0800
Message-ID: <CAJuCfpHY07stD9T12oqcz2ELJf42ExP-Du3ZdT84CcOk5VVi-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
To: Marco Elver <elver@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, "Paul E. McKenney" <paulmck@kernel.org>, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-fo
 undation.org>, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 7, 2023 at 9:16 AM Marco Elver <elver@google.com> wrote:
>
> On Thu, Jan 26, 2023 at 09:27AM -0800, Paul E. McKenney wrote:
> > On Wed, Jan 25, 2023 at 05:34:49PM -0800, Andrew Morton wrote:
> > > On Wed, 25 Jan 2023 16:50:01 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > >
> > > > On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > >
> > > > > On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > > > >
> > > > > > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > > > > > errors when we add a const modifier to vma->vm_flags.
> > > > > >
> > > > > > ...
> > > > > >
> > > > > > --- a/kernel/fork.c
> > > > > > +++ b/kernel/fork.c
> > > > > > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > > > > >                * orig->shared.rb may be modified concurrently, but the clone
> > > > > >                * will be reinitialized.
> > > > > >                */
> > > > > > -             *new = data_race(*orig);
> > > > > > +             memcpy(new, orig, sizeof(*new));
> > > > >
> > > > > The data_race() removal is unchangelogged?
> > > >
> > > > True. I'll add a note in the changelog about that. Ideally I would
> > > > like to preserve it but I could not find a way to do that.
> > >
> > > Perhaps Paul can comment?
> > >
> > > I wonder if KCSAN knows how to detect this race, given that it's now in
> > > a memcpy.  I assume so.
> >
> > I ran an experiment memcpy()ing between a static array and an onstack
> > array, and KCSAN did not complain.  But maybe I was setting it up wrong.
> >
> > This is what I did:
> >
> >       long myid = (long)arg; /* different value for each task */
> >       static unsigned long z1[10] = { 0 };
> >       unsigned long z2[10];
> >
> >       ...
> >
> >       memcpy(z1, z2, ARRAY_SIZE(z1) * sizeof(z1[0]));
> >       for (zi = 0; zi < ARRAY_SIZE(z1); zi++)
> >               z2[zi] += myid;
> >       memcpy(z2, z1, ARRAY_SIZE(z1) * sizeof(z1[0]));
> >
> > Adding Marco on CC for his thoughts.
>
> ( Sorry for not seeing it earlier - just saw this by chance. )
>
> memcpy() data races will be detected as of (given a relatively recent
> Clang compiler):
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7c201739beef
>
> Also beware that the compiler is free to "optimize" things by either
> inlining memcpy() (turning an explicit memcpy() into just a bunch of
> loads/stores), or outline plain assignments into memcpy() calls. So the
> only way to be sure what ends up there is to look at the disassembled
> code.
>
> The data_race() was introduced by:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cda099b37d716
>
> It says:
>  "vm_area_dup() blindly copies all fields of original VMA to the new one.
>   This includes coping vm_area_struct::shared.rb which is normally
>   protected by i_mmap_lock. But this is fine because the read value will
>   be overwritten on the following __vma_link_file() under proper
>   protection. Thus, mark it as an intentional data race and insert a few
>   assertions for the fields that should not be modified concurrently."
>
> And as far as I can tell this hasn't changed.

Thanks for the feedback, Marco!
So, IIUC Mel's proposal to use data_race(memcpy(new, orig,
sizeof(*new))); is fine in this case, right?
Thanks,
Suren.

>
> Thanks,
> -- Marco
