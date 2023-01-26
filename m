Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A46C67D0C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2lmK1THjz3fF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:00:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=maej8KSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=maej8KSu;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2llQ6k83z2ylk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 02:59:45 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-50aa54cc7c0so1214437b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 07:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hTMIacUXsOFgVZDorjURweaYJVzG88SXdEUO28m037E=;
        b=maej8KSubuLo0kC/imbkyuhKVGYUPkO5lo7PvfreFaYBB/wWUbThZJWtVhikB7munt
         vsqkfm6jy5fZ4p44uAZEneejK6L7P3C/Axbsu+KcKZdJu7D9YpXT33FhTLx0Ra41r+si
         BvZgdPzbr0nDO9QqR1+0/bJHVUoZbLyw2mCDN6leTIcd3linPHwPfrewxM5pTRi+/NTc
         TWLLJoDLkz57lJ/zwkCJgUl/USDPeFJb3rl+RMi2zPQC4WrG9mK5DSslGBaeW2Tna9LK
         BtPbevI+59jqAMudVMMU4R+MGRM208iYekoKsy66R1GeVyuhdjPbQ7MUZZEXvL8iTzJZ
         Lv3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTMIacUXsOFgVZDorjURweaYJVzG88SXdEUO28m037E=;
        b=OC0giGJCjmUOfSrpG9m5b8zJIfm+SPDdt556wKQVu0cWMoso/oyF90Ib7dWwaLKG3F
         uUV1hx99OLlgeFIkreFJOkaPvIQ0zlC/EYhq1kfYwUMvk80y3XeogJfxchx5epflhCKh
         0VKDzb9sQJ2GL7F2+Njj0/waMWE9RFbUBKEUznCI8v0ZMMwfR6ePH/S4yn95B/XRGjuQ
         AOsMW9pVmTYt3GTqdqujCd/ImHxaaHm/HJRUSY+Co9t6TVOHONQvRMlMq80DAdOHCrIT
         18Eekaqpm/dbEEXiwQLu7GX82QI6iCZCG3isNU8S0TsKI5Rk5F1QFDgZ3CB2jG/xzdkr
         2GIQ==
X-Gm-Message-State: AFqh2koujlrB/Z7xI0/KJX2FBStGoFUUTznsL09H8HczH+d4PlzjOnfy
	YmkZa34RHWa8D086wpLulM2zvtfRp39QJMyFWnEZsA==
X-Google-Smtp-Source: AMrXdXv9OwnTaWe8mURHIuJM9v8/JBI+Lw/bROQKmh3ENIZYB9q9o3amxsvnirGBtmokbZnrqmL/saTwQOBg2kdyRyA=
X-Received: by 2002:a81:1b8b:0:b0:4ff:774b:7ffb with SMTP id
 b133-20020a811b8b000000b004ff774b7ffbmr3525975ywb.218.1674748780848; Thu, 26
 Jan 2023 07:59:40 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
 <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
 <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org> <20230126115224.3urhskf35eomk7xl@techsingularity.net>
In-Reply-To: <20230126115224.3urhskf35eomk7xl@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 07:59:26 -0800
Message-ID: <CAJuCfpGr7mLKT6iwJC1aTU0ynh4PUpp3-Mp_eJ+yRn6DfoVcAw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, linuxppc-dev@lis
 ts.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 3:52 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Wed, Jan 25, 2023 at 05:34:49PM -0800, Andrew Morton wrote:
> > On Wed, 25 Jan 2023 16:50:01 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > > On Wed, Jan 25, 2023 at 4:22 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > > >
> > > > On Wed, 25 Jan 2023 15:35:48 -0800 Suren Baghdasaryan <surenb@google.com> wrote:
> > > >
> > > > > Convert vma assignment in vm_area_dup() to a memcpy() to prevent compiler
> > > > > errors when we add a const modifier to vma->vm_flags.
> > > > >
> > > > > ...
> > > > >
> > > > > --- a/kernel/fork.c
> > > > > +++ b/kernel/fork.c
> > > > > @@ -482,7 +482,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
> > > > >                * orig->shared.rb may be modified concurrently, but the clone
> > > > >                * will be reinitialized.
> > > > >                */
> > > > > -             *new = data_race(*orig);
> > > > > +             memcpy(new, orig, sizeof(*new));
> > > >
> > > > The data_race() removal is unchangelogged?
> > >
> > > True. I'll add a note in the changelog about that. Ideally I would
> > > like to preserve it but I could not find a way to do that.
> > >
> >
> > Perhaps Paul can comment?
> >
> > I wonder if KCSAN knows how to detect this race, given that it's now in
> > a memcpy.  I assume so.
>
> data_race() is just wrapping an expression around
> __kcsan_[en|dis]able_current and ensuring the expression is evaluated once
> and returning the correct type. I believe the following should be sufficient.

Thanks for the suggestion, Mel! I'll try that.

>
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 9f7fe3541897..1b30ee568e02 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -472,7 +472,7 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>                  * orig->shared.rb may be modified concurrently, but the clone
>                  * will be reinitialized.
>                  */
> -               *new = data_race(*orig);
> +               data_race(memcpy(new, orig, sizeof(*new)));
>                 INIT_LIST_HEAD(&new->anon_vma_chain);
>                 dup_anon_vma_name(orig, new);
>         }
>
> I don't see how memcpy could automagically figure out whether the memcpy
> is prone to races or not in an arbitrary context.
>
> Assuming using data_race this way is ok then
>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>

Thanks!

>
> --
> Mel Gorman
> SUSE Labs
