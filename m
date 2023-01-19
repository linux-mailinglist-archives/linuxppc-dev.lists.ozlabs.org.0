Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D040674314
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 20:48:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyY8n31NBz3fGX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 06:48:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tRwk9+zu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=tRwk9+zu;
	dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyY7r1YHJz3c6q
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 06:47:51 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 123so3948566ybv.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 11:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P2j6lHak2WNm7vGtRzqgYAFuvxH6JX58ZqrhL7ZQFfg=;
        b=tRwk9+zuhnApnMpCZGGlzVwa+yZTlhQpdZ6D/DvhQoFQpUTQCeM6lA4awAgkKlc6pA
         569vcWotwshb2MJ3asbawGKsmiAf/09j93YtvGPhv8aIXeEodHvuQSIQ5ljSUAkeCXzO
         IqeRDxz6EbgbHh8k87h+XcI+Gi5IBdHJFL4tHPiahQxfVXpu36hpl3PHH/mKcKNvwhOv
         UCU76RUWF05xBZwsRriVr7hQXTTtQJ2FG3IoMxW3Mwj2/MvvT/4EBXFgCKYYlhd3hGTR
         1qkSNLLzjXoHMCy86p9goHtqYEOQIkIXGOFAkld/l51jc9hZeYZmW078//u/yo9FNWkJ
         t4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2j6lHak2WNm7vGtRzqgYAFuvxH6JX58ZqrhL7ZQFfg=;
        b=dUOc7PdFvjuq5yc1gP+2CUpKnDC8D5MAl3JdIkeITJH5HlUvJf35lQZmkGbCqLnvmu
         +ISiJJY8bd2bHExoMYy9MZ2q99km7ZSlovSuYB4W3cbI+P+ietf3itLhyunlRU8ttjp3
         lD2u65KDoJfT4EcI8/nNA5/UJIBV7Ae1JhSds0xk4WcOZrCojbqPcgKaeCiFzaHldNC6
         5CXb2QaS8EkDZJB22lrqN1xwc+Bg6kBmWjN+NgY2EVuWvTsucn+OuzKjhGIHvrHpiHwn
         mmQ2Q8FY+HWB8QwcAsXyU0DP+ARlJNBxJiVxEhMNnLPbSygxSyCHx3llPp/4JSjGEXBj
         Hpxw==
X-Gm-Message-State: AFqh2ko00c87/G8fDEJ/bqg9lHRKYfw5OQ2o/AwtJfqs9QdY4BBNaQgB
	tXqoc/LCNY1V1EFnJPtOl2VJ0DmRZ0CZSphB2QJ/LA==
X-Google-Smtp-Source: AMrXdXtVjG1suljuq7kTbxad3urbLbwnBS0I2yo5AivnT5FA4XZ5/ePVWQvbEfh73NgWws2sOxQOIRQCI7QYYkEgZCg=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr1417330ybe.316.1674157667650; Thu, 19
 Jan 2023 11:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <20230119192002.GX2948950@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20230119192002.GX2948950@paulmck-ThinkPad-P17-Gen-1>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 19 Jan 2023 11:47:36 -0800
Message-ID: <CAJuCfpEoGCs6JgjiWL1ACS8S8TmwM1x5EF7x8D=M9zqnkyqxBA@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, Michal Hocko <mhocko@suse.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsi
 ngularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 19, 2023 at 11:20 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Jan 19, 2023 at 10:52:03AM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > a list and free them in groups using one call_rcu() call per group.
> > >
> > > After some more clarification I can understand how call_rcu might not be
> > > super happy about thousands of callbacks to be invoked and I do agree
> > > that this is not really optimal.
> > >
> > > On the other hand I do not like this solution much either.
> > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > much with processes with a huge number of vmas either. It would still be
> > > in housands of callbacks to be scheduled without a good reason.
> > >
> > > Instead, are there any other cases than remove_vma that need this
> > > batching? We could easily just link all the vmas into linked list and
> > > use a single call_rcu instead, no? This would both simplify the
> > > implementation, remove the scaling issue as well and we do not have to
> > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> >
> > Yes, I agree the solution is not stellar. I wanted something simple
> > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > on the list without hooking up a shrinker (additional complexity) does
> > not sound too appealing either. WDYT about time domain throttling to
> > limit draining the list to say once per second like this:
> >
> > void vm_area_free(struct vm_area_struct *vma)
> > {
> >        struct mm_struct *mm = vma->vm_mm;
> >        bool drain;
> >
> >        free_anon_vma_name(vma);
> >
> >        spin_lock(&mm->vma_free_list.lock);
> >        list_add(&vma->vm_free_list, &mm->vma_free_list.head);
> >        mm->vma_free_list.size++;
> > -       drain = mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
> > +       drain = jiffies > mm->last_drain_tm + HZ;
> >
> >        spin_unlock(&mm->vma_free_list.lock);
> >
> > -       if (drain)
> > +       if (drain) {
> >               drain_free_vmas(mm);
> > +             mm->last_drain_tm = jiffies;
> > +       }
> > }
> >
> > Ultimately we want to prevent very frequent call_rcu() calls, so
> > throttling in the time domain seems appropriate. That's the simplest
> > way I can think of to address your concern about a quick spike in VMA
> > freeing. It does not place any restriction on the list size and we
> > might have excessive dead vm_area_structs if after a large spike there
> > are no vm_area_free() calls but I don't know if that's a real problem,
> > so not sure we should be addressing it at this time. WDYT?
>
> Just to double-check, we really did try the very frequent call_rcu()
> invocations and we really did see a problem, correct?

Correct. More specifically with CONFIG_RCU_NOCB_CPU=y we saw
regressions when a process exits and all its VMAs get destroyed,
causing a flood of call_rcu()'s.

>
> Although it is not perfect, call_rcu() is designed to take a fair amount
> of abuse.  So if we didn't see a real problem, the frequent call_rcu()
> invocations might be a bit simpler.
>
>                                                         Thanx, Paul
