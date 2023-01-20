Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60955675B08
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:18:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5nQ1bPbz3fJt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:18:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Sr1dLPym;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Sr1dLPym;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5mV2J9Bz2yw6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:18:01 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4ff1fa82bbbso35470527b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Npkik/bsBJT0k1KE6YTUYiQllKRxNUJ2F3qqLyW5WrU=;
        b=Sr1dLPymrIvYBGAmoThyqiqqD5ocsi35buZBFr9hs7vTfAgxiHzqszuY12+CvtOfKu
         RJozfuGS24MHU6L9FOm9qbs+5eNGaCPaqITAVOLQslx4X+R9mY3nN2LalRXUVDbxy8Qt
         J0dvh7x5wJbEWiEnHQ0ITZKNuMN2D/TgYFGRPWf+q3EXoZpFDqfnQ+Mkat/aDVHQKqpB
         cqxocq04+BBfQ0/ds8KL+yA5/1PUe2g+ppo5H30MJafeEtK8f7/S2hO7gwVKY83Duzzu
         YNYro9pYQlzwKdPyPpEqyu60+5EMY6rQU4naHlm8+dyKKFtmt29OruHUXTQcgMIcHHtZ
         IoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Npkik/bsBJT0k1KE6YTUYiQllKRxNUJ2F3qqLyW5WrU=;
        b=wOawwmj8cc2DW8arPMY3FUV+yuSc3VHKCJICu3XQrbaitdcYJga+wqFJu1ZISrfhKG
         fsSSyG5XReiXiJZFwJax2iKkFzCe7PjYgk7qjOZ2zqGFmx6D72pE7AdDkQevl+ULH6Bk
         i+99tpFh9DVxmx4T1nm7bFsNvpmOb8PF5zCsgY+qyR7HJWsGIRszN4kfjsNnA4MakdFW
         KVEiUDDimPvIOAiFS/YQreqyHjHIkcOa8UcN5E+/1cPrxPiVHvnhNicElGaNvjQM+gym
         UnGQOW+JHTFGwMTwXEKTgDfxnbwCHg+c9IZyaw1Lpt1iPPLfDweAhieBucBPRZBlLSDF
         Iajw==
X-Gm-Message-State: AFqh2kpfuISEGZZ6B/QRfsPIZ5Hpz5JceTgpDH/BhseC3xhkTCfc9KiE
	QSvdQh0avmubsCpdEPVVp5PjN7zBsdaKJPHnT0bIOw==
X-Google-Smtp-Source: AMrXdXv6gnQX0OoKozB0/sGre8TJXsUy1C/jK2O3QAelgSf12NvRgViAwg71ot7Dw3BX9FmmaJQOxKyffqTOfBzTcKs=
X-Received: by 2002:a81:1b8b:0:b0:4ff:774b:7ffb with SMTP id
 b133-20020a811b8b000000b004ff774b7ffbmr406683ywb.218.1674235078155; Fri, 20
 Jan 2023 09:17:58 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz> <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org> <20230120170815.yuylbs27r6xcjpq5@revolver>
In-Reply-To: <20230120170815.yuylbs27r6xcjpq5@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 20 Jan 2023 09:17:46 -0800
Message-ID: <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, akpm@linux-foundation.org, 
	michel@lespinasse.org, jglisse@google.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, peterz@infradead.org, 
	ldufour@linux.ibm.com, laurent.dufour@fr.ibm.com, paulmck@kernel.org, 
	luto@kernel.org, songliubraving@fb.com, peterx@redhat.com, david@redhat.com, 
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de, 
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com, lstoakes@gmail.com, 
	peterjung1337@gmail.com, rientjes@google.com, axelrasmussen@google.com, 
	joelaf@google.com, minchan@google.com, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, 
	hughlynch@google.com, leewalsh@google.com, posk@google.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 9:08 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>
> * Matthew Wilcox <willy@infradead.org> [230120 11:50]:
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
> Do we even need a call_rcu on exit?  At the point of freeing the VMAs we
> have set the MMF_OOM_SKIP bit and unmapped the vmas under the read lock.
> Once we have obtained the write lock again, I think it's safe to say we
> can just go ahead and free the VMAs directly.

I think that would be still racy if the page fault handler found that
VMA under read-RCU protection but did not lock it yet (no locks are
held yet). If it's preempted, the VMA can be freed and destroyed from
under it without RCU grace period.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
