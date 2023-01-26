Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1267D67D34F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 18:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2nt56mQrz3fFd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 04:35:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=obJHkyKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=obJHkyKE;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2nsC1Cwmz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 04:34:54 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id b1so2857347ybn.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 09:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9xMycIWfnUiEotnezQAVhJSgjXTaz5NeZUJ91/GQmTM=;
        b=obJHkyKEdKn578ecqm7AMdXZhvglvx3pL04eLSGQrJfs++BRodH8v5oI6wTwIQ8kAQ
         8AL+7rOXagkiEuHVe/GgQA2neXF89EAn+dqILrOKi8+7NcrRNoWvmp3w1huJ+Y9qePHC
         hMJTuGNYAZj7y7S0rjdl7oSKKieeDxruyu4B0t+mFIOAheqLj6xuqJm7YHtTtKKWNMdm
         FZBZ21fvFGGUrqkh9euHwPJOxY0CU9hx5yUoaWMVrbiwLG3uHXqN9wJd7Uh+VYO4RaA7
         hzfH/Bgr5o3XMEZqREy+pw2//wwJ31NIh3utvE+q0/nY4R7OdlUVB71y7k0/Yxez0kh1
         DeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xMycIWfnUiEotnezQAVhJSgjXTaz5NeZUJ91/GQmTM=;
        b=kx1fkiUVTTO6e62RRxzgI7PPOee2K29IJYu+daMcAFKWvzEQZgMB47BxiLa7Tx1xJV
         oTmi7+WnNGMkSw+ZIVggxG1GlkwOHjPk5TPXlgr7ttgSeQL5utPZmQPaDAXkDn4gITaC
         2KAnLBl4NFzjJiXyh8aZnsRHGggkr42k+QfQQdOt6WlIduNhalPFFuUZ60U1VrrQMZ4i
         fBTbN5e3rBtanUrFiGXmAvq3zjgc5Ucb91td0O4GGBcFiQtebaog6/or0OhjnP1ayB62
         rwbbTT6OHD61bOHKiJHSjxn0ZSf/sDtgP+b9PEFIAzFZMFzO0o6unsE14qKtn2OprBJN
         7v7g==
X-Gm-Message-State: AO0yUKVSnCriRSnnL3KyabZdn+ZESlFfdSKLzfC/331HSTDX9o9sc/iD
	B39luUcH/Nq4kI4s+J2cu+avEWP60hccqFbNLRyQUA==
X-Google-Smtp-Source: AK7set/VuWkYiW3ghjj83YQK/NAbeLBosLL9HfBpsEETKwrAvN0l7/CtP3vwkiphVG1dJGxO4zxlOEPhH2xE/Lcwl+s=
X-Received: by 2002:a25:5209:0:b0:80b:5988:2045 with SMTP id
 g9-20020a255209000000b0080b59882045mr1119372ybb.59.1674754491393; Thu, 26 Jan
 2023 09:34:51 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-7-surenb@google.com>
 <20230126154740.j3a3lu4x557c56yi@techsingularity.net> <CAJuCfpHP6hQAWZr2exZEXOzLbMNU_c9qNNc7pa2NYAhYLe=EKQ@mail.gmail.com>
 <20230126173245.cf3jcfw5s2a77s5v@techsingularity.net>
In-Reply-To: <20230126173245.cf3jcfw5s2a77s5v@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 09:34:35 -0800
Message-ID: <CAJuCfpGq6eqUWkptFn4FjRgPtYjCyc-CK1n3DADvEHnWd1t1Sw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mm: introduce mod_vm_flags_nolock and use it in untrack_pfn
To: Mel Gorman <mgorman@techsingularity.net>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 9:32 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Thu, Jan 26, 2023 at 08:18:31AM -0800, Suren Baghdasaryan wrote:
> > On Thu, Jan 26, 2023 at 7:47 AM Mel Gorman <mgorman@techsingularity.net> wrote:
> > >
> > > On Wed, Jan 25, 2023 at 03:35:53PM -0800, Suren Baghdasaryan wrote:
> > > > In cases when VMA flags are modified after VMA was isolated and mmap_lock
> > > > was downgraded, flags modifications would result in an assertion because
> > > > mmap write lock is not held.
> > >
> > > Add note that it's also used during exit when the locking of the VMAs
> > > becomes irrelevant (mm users is 0, should be no VMA modifications taking
> > > place other than zap).
> >
> > Ack.
> >
> > >
> > > The typical naming pattern when a caller either knows it holds the necessary
> > > lock or knows it does not matter is __mod_vm_flags()
> >
> > Ok. It sounds less explicit but plenty of examples, so I'm fine with
> > such rename. Will apply in the next version.
> >
>
> It might be a personal thing. nolock to me is ambigious because it might
> mean "lock is already held", "no lock is necessary" or "no lock is acquired"
> where as *for me*, calling foo vs __foo *usually* means "direct callers of
> __foo take care of the locking, memory ordering, per-cpu pinning details etc"
> depending on the context. Of course, this convention is not universally true.
>
> > > > Pass a hint to untrack_pfn to conditionally use mod_vm_flags_nolock for
> > > > flags modification and to avoid assertion.
> > > >
> > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > >
> > > Patch itself looks ok. It strays close to being "conditional locking"
> > > though which might attract some complaints.
> >
> > The description seems to accurately describe what's done here but I'm
> > open to better suggestions.
>
> I don't have alternative suggestions but if someone else reads the patch and
> says "this is conditional locking", you can at least claim that someone
> else considered "conditional locking" and didn't think it was a major
> problem in this specific patch.

Perfect. Thanks!

>
> --
> Mel Gorman
> SUSE Labs
