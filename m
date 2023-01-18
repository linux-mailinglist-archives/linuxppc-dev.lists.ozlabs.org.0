Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7286727DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 20:07:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxwHT51yRz3fPY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 06:07:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ejwY3+LK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ejwY3+LK;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxw8j29JCz3fJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 06:01:24 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-4e9adf3673aso145331347b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8DSKYHJgJYKJvmPul/jqy2wXXzLUlUgLi7Tkf9YlXU=;
        b=ejwY3+LKtxm5x3E+GJzfTUchB7m+L1YRon9Aa8Q50Ti4tQZzVZ6M7ddAXR8QuYX2/+
         QbFt7G90bRjsGKuh+F1lDNIo0H7p5+Ztjzb+JsV1kzQB8MPN72CITN8khcfMdZzVCClr
         0rfR86j8uR9XfP3lcG3CmwEZq8gGCNYy4GMw9BXNuo+B0XfUKFLgpaKByDGEKF5m5ob0
         nAirCQpTYQiGnADXyL4rHN55X+6T7+KDx4Lknv/dk8Nf1obhK0VCQYfoZive5NaouN9J
         rWZ8CpiuCsm5NmaCNzdlzyweXpQ+VQ7Pr9lxoMOtqkqySGFLw02OuYspEMabUBJR88+S
         njvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8DSKYHJgJYKJvmPul/jqy2wXXzLUlUgLi7Tkf9YlXU=;
        b=PHGrc/YBf3jZbvkDOuVDLnEq0laB9R8MN6wAKIYYFMFa2QuVWBiHOu+vOWDto5G4xP
         0Yc2JsC6lz5OqX1E+6UHDfeDandBYxdKgoYKyCS+y9v4VfPS4wa4fxyZVKnR3PPo0XO7
         QAf6v7pxL6rKvmtRt/qeO5qXTqVUnZxdLUCrZe8rDOgNLyZ/YTQ4SKF7oYRFOkpptZiw
         KtsSID8AjEs7D4SRcTuqvW5B5n2XtNsyJjYAUYPl3bgib6ddaRA5F8U9YTlcPsHdXCEv
         D6UykyLttxkMZTpVBIRCAsUrTfmZ8erya5zl3/A+E7BieW1Q20MRQQgDrCY+agXqxhIZ
         +zzQ==
X-Gm-Message-State: AFqh2kp6O1P6O9LV9hs4eS6I+pF414A8znAfYl4Ro0IeVZXmOKJBE2V3
	wXA8xyRFf3/q0P2ck3MDWjqgrM2T5HGs0RG9AbxaIw==
X-Google-Smtp-Source: AMrXdXubzcxtFjj0yWcsl/wowi8G0fcdGwos3LuYoWDDm/OjCNfgTh+Wjt7geFYZ2EGxVPVcRjYpoDeL03CkmRv1g5o=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr1053073ywc.132.1674068480621; Wed, 18
 Jan 2023 11:01:20 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8bFdB47JT/luMld@dhcp22.suse.cz> <CAJuCfpHVYW5aBVmT0vwn+j=m=Jo2KhSTzgVtxSEusUZJdzetUA@mail.gmail.com>
 <Y8fApgKJaTs9nrPO@dhcp22.suse.cz> <CAJuCfpERMyQc96Z5Qn9RFK0UD7fNugZE4DujFs4xqFWM8T6EqA@mail.gmail.com>
 <20230118183447.GG2948950@paulmck-ThinkPad-P17-Gen-1>
In-Reply-To: <20230118183447.GG2948950@paulmck-ThinkPad-P17-Gen-1>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 11:01:08 -0800
Message-ID: <CAJuCfpHZuKq45FL1gs+=rx5s2AOaZ9TPC1bdAWjYzfkrOABTOw@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 10:34 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Wed, Jan 18, 2023 at 10:04:39AM -0800, Suren Baghdasaryan wrote:
> > On Wed, Jan 18, 2023 at 1:49 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Tue 17-01-23 17:19:46, Suren Baghdasaryan wrote:
> > > > On Tue, Jan 17, 2023 at 7:57 AM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > > > multiple VMAs are being freed.
> > > > >
> > > > > What kind of regressions.
> > > > >
> > > > > > To minimize that impact, place VMAs into
> > > > > > a list and free them in groups using one call_rcu() call per group.
> > > > >
> > > > > Please add some data to justify this additional complexity.
> > > >
> > > > Sorry, should have done that in the first place. A 4.3% regression was
> > > > noticed when running execl test from unixbench suite. spawn test also
> > > > showed 1.6% regression. Profiling revealed that vma freeing was taking
> > > > longer due to call_rcu() which is slow when RCU callback offloading is
> > > > enabled.
> > >
> > > Could you be more specific? vma freeing is async with the RCU so how
> > > come this has resulted in a regression? Is there any heavy
> > > rcu_synchronize in the exec path? That would be an interesting
> > > information.
> >
> > No, there is no heavy rcu_synchronize() or any other additional
> > synchronous load in the exit path. It's the call_rcu() which can block
> > the caller if CONFIG_RCU_NOCB_CPU is enabled and there are lots of
> > other call_rcu()'s going on in parallel. Note that call_rcu() calls
> > rcu_nocb_try_bypass() if CONFIG_RCU_NOCB_CPU is enabled and profiling
> > revealed that this function was taking multiple ms (don't recall the
> > actual number, sorry). Paul's explanation implied that this happens
> > due to contention on the locks taken in this function. For more
> > in-depth details I'll have to ask Paul for help :) This code is quite
> > complex and I don't know all the details of RCU implementation.
>
> There are a couple of possibilities here.
>
> First, if I am remembering correctly, the time between the call_rcu()
> and invocation of the corresponding callback was taking multiple seconds,
> but that was because the kernel was built with CONFIG_LAZY_RCU=y in
> order to save power by batching RCU work over multiple call_rcu()
> invocations.  If this is causing a problem for a given call site, the
> shiny new call_rcu_hurry() can be used instead.  Doing this gets back
> to the old-school non-laziness, but can of course consume more power.

That would not be the case because CONFIG_LAZY_RCU was not an option
at the time I was profiling this issue.
Laxy RCU would be a great option to replace this patch but
unfortunately it's not the default behavior, so I would still have to
implement this batching in case lazy RCU is not enabled.

>
> Second, there is a much shorter one-jiffy delay between the call_rcu()
> and the invocation of the corresponding callback in kernels built with
> either CONFIG_NO_HZ_FULL=y (but only on CPUs mentioned in the nohz_full
> or rcu_nocbs kernel boot parameters) or CONFIG_RCU_NOCB_CPU=y (but only
> on CPUs mentioned in the rcu_nocbs kernel boot parameters).  The purpose
> of this delay is to avoid lock contention, and so this delay is incurred
> only on CPUs that are queuing callbacks at a rate exceeding 16K/second.
> This is reduced to a per-jiffy limit, so on a HZ=1000 system, a CPU
> invoking call_rcu() at least 16 times within a given jiffy will incur
> the added delay.  The reason for this delay is the use of a separate
> ->nocb_bypass list.  As Suren says, this bypass list is used to reduce
> lock contention on the main ->cblist.  This is not needed in old-school
> kernels built without either CONFIG_NO_HZ_FULL=y or CONFIG_RCU_NOCB_CPU=y
> (including most datacenter kernels) because in that case the callbacks
> enqueued by call_rcu() are touched only by the corresponding CPU, so
> that there is no need for locks.

I believe this is the reason in my profiled case.

>
> Third, if you are instead seeing multiple milliseconds of CPU consumed by
> call_rcu() in the common case (for example, without the aid of interrupts,
> NMIs, or SMIs), please do let me know.  That sounds to me like a bug.

I don't think I've seen such a case.
Thanks for clarifications, Paul!

>
> Or have I lost track of some other slow case?
>
>                                                         Thanx, Paul
