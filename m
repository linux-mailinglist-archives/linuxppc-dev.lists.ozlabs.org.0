Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAE0678382
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 18:44:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0yCy0jjjz3cd7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 04:44:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UKgyvnaq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UKgyvnaq;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0yC16f3cz3c6G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 04:43:56 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id x4so14081350ybp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 09:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MbdRXrDm0G4b0pDa706c1R5MiAQkWSslBdaNrC2lB8E=;
        b=UKgyvnaqxpZWuAuXbcWe7aJn7XDOmRlf6QqbtRqmjjqrNsksyykciJsCGgdpFt2CQN
         XaM6W9briujGFL1RejiKuJCKUrqcWGECuEv0OBka8AMNnOltN07JzxO9woC07V5MRuOK
         lIGOuD1tj2+OitLRlkQ9TOXjMyPT3MOwju8jAeSrJY3jOJu7B0x9/0b4Rr46ORcFPUPL
         9m5ShhmVH+bnYWtWaCQ9gf7B6SXzpYPqiyo6wDJ1V+8nI9leCdCm54s2S2l3cLlB1Z/A
         1s3Xgs5ERx34l8e2oApkBnckWM17ROseI1caWCFSAoNsCQy8/3j2aKxxnE8MsD360zHk
         6R6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MbdRXrDm0G4b0pDa706c1R5MiAQkWSslBdaNrC2lB8E=;
        b=jwN8ZFEoAnB0gEpQ2WKYpAy/YC9JBtzx2pQe01K8lrTD3h0EIjsibWlqWn4Q8ORXWN
         7L54y8/VO/b2JyP8VTEy9mPr95vDa/15cz0bemVy6ltfW61z1Gufr2GIWlRlnUz8WP/n
         yLed13Ed7JzG5YkEpVmaPZA4/xtgem45OazFg03bs9TNOO3wNzmbT1qZqaIeN2Bytv77
         MlDr7bgL4TTu7Dl5zPk19NrTQjaQWmcgYQPf5v3Jrtn+sNWtJHRG3J6V7O214DzqtsQa
         NhjFSEpblIEcFIM+3Pb2t7AE3QdeWlvJy3gU4SxsurW/OEDa5WdOU3xS0ozOROfPMGNI
         4IGQ==
X-Gm-Message-State: AFqh2kqwZRYwV5lATbJvcaqQQ3ybMFgcgU/xYPWSfIaZ4JITJRztpXnQ
	6Zs45uZ5xl4QwsZmXiQ0/813mkitiZmMW52mmo2JZQ==
X-Google-Smtp-Source: AMrXdXv3CgHU7SkUBkM9SwlNLny2wsFhjN99Oj3tapcuDlBqTQ5sZwoVRHtRKxpb3b0xJuv4qrd+j5dOi4ahKRGg9aQ=
X-Received: by 2002:a25:a408:0:b0:800:28d4:6936 with SMTP id
 f8-20020a25a408000000b0080028d46936mr1456121ybi.431.1674495833086; Mon, 23
 Jan 2023 09:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz> <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <Y85acuBFkGr03Qd7@dhcp22.suse.cz>
In-Reply-To: <Y85acuBFkGr03Qd7@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 09:43:41 -0800
Message-ID: <CAJuCfpGRcrbnSC3gBnfdnSU32p+5NU=7D=eWLU0F10czPdrm5A@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 1:59 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Fri 20-01-23 08:20:43, Suren Baghdasaryan wrote:
> > On Fri, Jan 20, 2023 at 12:52 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Thu 19-01-23 10:52:03, Suren Baghdasaryan wrote:
> > > > On Thu, Jan 19, 2023 at 4:59 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > multiple VMAs are being freed. To minimize that impact, place VMAs into
> > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > >
> > > > > After some more clarification I can understand how call_rcu might not be
> > > > > super happy about thousands of callbacks to be invoked and I do agree
> > > > > that this is not really optimal.
> > > > >
> > > > > On the other hand I do not like this solution much either.
> > > > > VM_AREA_FREE_LIST_MAX is arbitrary and it won't really help all that
> > > > > much with processes with a huge number of vmas either. It would still be
> > > > > in housands of callbacks to be scheduled without a good reason.
> > > > >
> > > > > Instead, are there any other cases than remove_vma that need this
> > > > > batching? We could easily just link all the vmas into linked list and
> > > > > use a single call_rcu instead, no? This would both simplify the
> > > > > implementation, remove the scaling issue as well and we do not have to
> > > > > argue whether VM_AREA_FREE_LIST_MAX should be epsilon or epsilon + 1.
> > > >
> > > > Yes, I agree the solution is not stellar. I wanted something simple
> > > > but this is probably too simple. OTOH keeping all dead vm_area_structs
> > > > on the list without hooking up a shrinker (additional complexity) does
> > > > not sound too appealing either.
> > >
> > > I suspect you have missed my idea. I do not really want to keep the list
> > > around or any shrinker. It is dead simple. Collect all vmas in
> > > remove_vma and then call_rcu the whole list at once after the whole list
> > > (be it from exit_mmap or remove_mt). See?
> >
> > Yes, I understood your idea but keeping dead objects until the process
> > exits even when the system is low on memory (no shrinkers attached)
> > seems too wasteful. If we do this I would advocate for attaching a
> > shrinker.
>
> I am still not sure we are on the same page here. No, vmas shouldn't lay
> around un ntil the process exit. I am really suggesting queuing only for
> remove_vma paths. You can have a different rcu callback than the one
> used for trivial single vma removal paths.

Oh, I also missed the remove_mt() part and thought you want to drain
the list only in exit_mmap(). I think that's a good option!

>
> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
