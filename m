Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA116672645
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:05:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxtwV5kgLz3fDL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 05:05:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mtf8L2D1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mtf8L2D1;
	dkim-atps=neutral
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxtvX2hmwz3bXP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 05:04:55 +1100 (AEDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-4bf16baa865so478676677b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 10:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZmeatwLvsnhfsfO1/vmX5h6tsP0MwkkpxTHRWfYdQM4=;
        b=Mtf8L2D1PhgJlzWzwjotEfjVuKX38JU222q+auWI4G2j0q5YtHekYj771Dhkp2GcsL
         HDhNkGKRpjAR+kjPXD7ERMmqZqi6tMxaQHWTECXnzcywWm8J//b3A6EagHn7DlypEpQ4
         Cpw58T97xq7K+rLqSTF5aaSGBUwZ6tOQyaE+127JgHNle7jNMu0hs4a0nG/uwPZbXmRI
         xT5pUt95Wwx7KFEi+Hay8anthmFFMsA8dAo2cnCBZvoiTur1bsXgUihQ3rAI4pZO/ZWP
         hbf2HdqSN+DbKwD2nFd64CgzevmW3m1IqCuzwC7PQduRR0Dz80K3WPLTv1MB5R1OaZsr
         XF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmeatwLvsnhfsfO1/vmX5h6tsP0MwkkpxTHRWfYdQM4=;
        b=q8LLENO3wwB9yaxWjp2qThUndWj23wgc+HqGiPUZXinzAF1UiuoeopJlaRCD1VOtt+
         MlWXpwkyYH4jKoV0itvyaOCehOXDOq6fsiNEgfX3065RgexZ1VswPjylx+w75pLPHPoo
         ScwHqSmyvCCL/U1TJNw5UeAn2H28vuNC5VUShC4i88PekH15c1kv1FL3hnUjJOOR8psD
         pG3gpEqJaQw5PYtIgMdQfvEYjCIyYAI4mEk9ZF2hXStgqdkBFtJlrlp3/4JxQbKHlN7e
         +S+3X3cc7mPPZq9qJ1Pg9V3vIwPN4J6bMpTc9u20wrObbHos98dvBVBJqePjl1mjttpt
         92lQ==
X-Gm-Message-State: AFqh2krm7Xzi6rzMTs4EO9CZkAEk2QJs3u/ih4lsTLh4snqvf6vMRkT4
	0UA9I6Ql5HJfme4jGMm86y/6Wr48ldO5Ts9sjjFkUQ==
X-Google-Smtp-Source: AMrXdXtMjwBQUdURBBz5ZgKZXjOXMVezYNYkyKU4WLD7CgzuxYNgtvI+JEVCsSBPA66t4nGGBzfjSicrSeLDwN7bPco=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr1031972ywc.132.1674065091255; Wed, 18
 Jan 2023 10:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-40-surenb@google.com>
 <Y8bFdB47JT/luMld@dhcp22.suse.cz> <CAJuCfpHVYW5aBVmT0vwn+j=m=Jo2KhSTzgVtxSEusUZJdzetUA@mail.gmail.com>
 <Y8fApgKJaTs9nrPO@dhcp22.suse.cz>
In-Reply-To: <Y8fApgKJaTs9nrPO@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 10:04:39 -0800
Message-ID: <CAJuCfpERMyQc96Z5Qn9RFK0UD7fNugZE4DujFs4xqFWM8T6EqA@mail.gmail.com>
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

On Wed, Jan 18, 2023 at 1:49 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-01-23 17:19:46, Suren Baghdasaryan wrote:
> > On Tue, Jan 17, 2023 at 7:57 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Mon 09-01-23 12:53:34, Suren Baghdasaryan wrote:
> > > > call_rcu() can take a long time when callback offloading is enabled.
> > > > Its use in the vm_area_free can cause regressions in the exit path when
> > > > multiple VMAs are being freed.
> > >
> > > What kind of regressions.
> > >
> > > > To minimize that impact, place VMAs into
> > > > a list and free them in groups using one call_rcu() call per group.
> > >
> > > Please add some data to justify this additional complexity.
> >
> > Sorry, should have done that in the first place. A 4.3% regression was
> > noticed when running execl test from unixbench suite. spawn test also
> > showed 1.6% regression. Profiling revealed that vma freeing was taking
> > longer due to call_rcu() which is slow when RCU callback offloading is
> > enabled.
>
> Could you be more specific? vma freeing is async with the RCU so how
> come this has resulted in a regression? Is there any heavy
> rcu_synchronize in the exec path? That would be an interesting
> information.

No, there is no heavy rcu_synchronize() or any other additional
synchronous load in the exit path. It's the call_rcu() which can block
the caller if CONFIG_RCU_NOCB_CPU is enabled and there are lots of
other call_rcu()'s going on in parallel. Note that call_rcu() calls
rcu_nocb_try_bypass() if CONFIG_RCU_NOCB_CPU is enabled and profiling
revealed that this function was taking multiple ms (don't recall the
actual number, sorry). Paul's explanation implied that this happens
due to contention on the locks taken in this function. For more
in-depth details I'll have to ask Paul for help :) This code is quite
complex and I don't know all the details of RCU implementation.


> --
> Michal Hocko
> SUSE Labs
