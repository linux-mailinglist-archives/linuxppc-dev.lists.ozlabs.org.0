Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70345696A3A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 17:48:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGRwz216xz3cfl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 03:48:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p2TLRP1L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=p2TLRP1L;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGRw01NmZz3c6V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 03:47:43 +1100 (AEDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-501c3a414acso214446477b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 08:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ayL3I3lSJXQSr5Jm+VXTau51rl41gfRsh35PsMQ4l4=;
        b=p2TLRP1LQYRQFLiyDUgbiLevDu32jCQ1L/y8KHXKpM3qk3yQMC/KRusxiAUo/2I5FR
         akQzZTLXnxb+P1qBmss9iIWLDGKg0C359syK073euM8tuN5Sl/8WYF11lclUeYyAUpMT
         hAGRMYI/iF5fhJver2jb4sWSYvtAFyiBKJIPjFvWpjnoUJwPU0kqPytUKfvSHAYHbAg2
         M09YNljijJZij+Yr4ZSoVYpX0jHEwLPIiBY9qadnh3wJ0BvnRF1uG1ci8Ku87aTVb1aO
         81XWgOzFKio+DbidG2VtE3NpZSUFQFw5KG2e47GfYfbWHge6uJXUOgMZ4f80jBrT9T8b
         1Jfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ayL3I3lSJXQSr5Jm+VXTau51rl41gfRsh35PsMQ4l4=;
        b=VWLfFjM63kKWyw8ocN+5fng3P6UhHIzxSkOu2SmBj1Knn0XCz3jyDm1v1WOPIbvojM
         FOq+izLd7RglYsCT+DU7f6/2NxTkazbOaw72spqJZEA0x8HeJu+N+yGmLCLq37/o3n3T
         Xp5/SdOKUMjnvLEF5mj6R81fpZPIRYlHgd3v250338thFiZF7kMs+7bDufPYaD3mUmhB
         tGdX1sPb9VclF+3IsgRE5cFKQiKPl3HGvjgSIs2x/YDP4v8k8twCy4KQWY0040D9QzrW
         sl2+sOsxeM6wEKZfU0Leqaz6BsXYMBCOQbSOeD1yGdlgnkW7ZDaoA8jJF7wzZgBPQNl3
         REXQ==
X-Gm-Message-State: AO0yUKUoRzT0Kmlvr2db0eK4hXLnh1eK+dPMMzkBTvWjkWI/OLMvbfiQ
	bpHNy933aeTP9w6TksOYJIFiKsp0BYKJhOhQC9JDog==
X-Google-Smtp-Source: AK7set/mxOKdHn92cBwjyApj3R28pXKEhuPBGovIRR6cczvfLCLR3WjxmhojkFsLR3cVOKM9zEYVw0ts4tZUpyJ11zo=
X-Received: by 2002:a0d:f5c4:0:b0:52e:c93a:bb36 with SMTP id
 e187-20020a0df5c4000000b0052ec93abb36mr319927ywf.277.1676393257997; Tue, 14
 Feb 2023 08:47:37 -0800 (PST)
MIME-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com> <20230127145138.8cc44bf00ebf289dffec0975@linux-foundation.org>
 <Y9Rdmy5h2F1z5yR3@casper.infradead.org> <CAJuCfpEq2F4EwWAeP6nLqS9m9XLpUss8n=35ZTgYgtiAJyvsxQ@mail.gmail.com>
In-Reply-To: <CAJuCfpEq2F4EwWAeP6nLqS9m9XLpUss8n=35ZTgYgtiAJyvsxQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 14 Feb 2023 08:47:26 -0800
Message-ID: <CAJuCfpG8Lq9xOce4yaNm1XzdAxVWTJYA85zjDbcpJ5MxxHr+4g@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] Per-VMA locks
To: Matthew Wilcox <willy@infradead.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, mgorman@techsingularity.net,
  rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 27, 2023 at 4:00 PM Suren Baghdasaryan <surenb@google.com> wrot=
e:
>
> On Fri, Jan 27, 2023 at 3:26 PM Matthew Wilcox <willy@infradead.org> wrot=
e:
> >
> > On Fri, Jan 27, 2023 at 02:51:38PM -0800, Andrew Morton wrote:
> > > On Fri, 27 Jan 2023 11:40:37 -0800 Suren Baghdasaryan <surenb@google.=
com> wrote:
> > >
> > > > Per-vma locks idea that was discussed during SPF [1] discussion at =
LSF/MM
> > > > last year [2], which concluded with suggestion that =E2=80=9Ca read=
er/writer
> > > > semaphore could be put into the VMA itself; that would have the eff=
ect of
> > > > using the VMA as a sort of range lock. There would still be content=
ion at
> > > > the VMA level, but it would be an improvement.=E2=80=9D This patchs=
et implements
> > > > this suggested approach.
> > >
> > > I think I'll await reviewer/tester input for a while.

Over the last two weeks I did not receive any feedback on the mailing
list but off-list a couple of people reported positive results in
their tests and Punit reported a regression on his NUMA machine when
running pft-threads workload. I found the source of that regression
and have two small fixes which were confirmed to improve the
performance (hopefully Punit will share the results here).
I'm planning to post v3 sometime this week. If anyone has additional
feedback, please let me know soon so that I can address it in the v3.
Thanks,
Suren.


>
> Sure, I don't expect the review to be very quick considering the
> complexity, however I would appreciate any testing that can be done.
>
> > >
> > > > The patchset implements per-VMA locking only for anonymous pages wh=
ich
> > > > are not in swap and avoids userfaultfs as their implementation is m=
ore
> > > > complex. Additional support for file-back page faults, swapped and =
user
> > > > pages can be added incrementally.
> > >
> > > This is a significant risk.  How can we be confident that these as ye=
t
> > > unimplemented parts are implementable and that the result will be goo=
d?
> >
> > They don't need to be implementable for this patchset to be evaluated
> > on its own terms.  This patchset improves scalability for anon pages
> > without making file/swap/uffd pages worse (or if it does, I haven't
> > seen the benchmarks to prove it).
>
> Making it work for all kinds of page faults would require much more
> time. So, this incremental approach, when we tackle the mmap_lock
> scalability problem part-by-part seems more doable. Even with
> anonymous-only support, the patch shows considerable improvements.
> Therefore I would argue that the patch is viable even if it does not
> support the above-mentioned cases.
>
> >
> > That said, I'm confident that I have a good handle on how to make
> > file-backed page faults work under RCU.
>
> Looking forward to collaborating on that!
> Thanks,
> Suren.
