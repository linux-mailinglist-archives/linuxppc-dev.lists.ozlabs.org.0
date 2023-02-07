Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D364F68DEC0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 18:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB8vF5Zvgz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:17:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Y9FmfEJa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Y9FmfEJa;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB8tH6pszz3bZV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 04:16:22 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id j25so10734657wrc.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 09:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7B14u7hbB/VXiWZvddsL6aIZYt39FVX4bLARrPtAv0=;
        b=Y9FmfEJaPUKP01BpBrAbyUYKx/RChLT6yUXZss4TzkZZpnxSibWVx6Ft9DTOKNZSlf
         bbzELRho2ZJluKmjB595UuxnvHVIBSwm694bjmmrYm+OuT1ALInGSP3Qp1NZvBrRXrgB
         lGn6Ds34sf3a038gEV1tz052BldGx7hPZAYSAvCkpHt5Yfw/AadKxqOqu19QdZ1sWaO6
         amTDGpYaHu9W423M6iD5H1vqa+EweqMvK7pUi5qqpAUQmnIUjj/fg3Qh4aoNZaEzpeRO
         JP0tMINwibFX5Il2vdPlZN2ptjO9vYxmwRp7I5p6XZn9gmRoXWpuWbMK/zHk6Xy5MtX/
         nh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7B14u7hbB/VXiWZvddsL6aIZYt39FVX4bLARrPtAv0=;
        b=zTnztaaiZQvMyXtyA927AqTG83k5iCEV/fgDRII0MFdNyJ7ZEAdIIpA6KT0wZY38wS
         BhIpmyLjZUbuxGJ0VHz9OnCRi/0gfhsRrOyOaH4Wvuy7UczSP3pfPs4iXxhsIEsPJzlE
         abps1iAhO5MBYy+8lN7c64WFxfigsYJ1NPkmy8AbkEXORFBebHLvcO1snSMgYTl4uapQ
         mAyeKGxOdF+psOtT3W5C0ppffhZxR8y6zk6s+2NjcQsGf6P41oF6ZYNUxLaCeUXaX5ak
         eEGgkA4UpaP1u/P/U+CcyXUGw4x5QBFvjv6QiB0eO5tal8KKHd52PEibxVDEecmJaJBS
         8Peg==
X-Gm-Message-State: AO0yUKX+padkpNzL6Z3axixfBw4Yg8hfDluG2rugpPO0FNYQkJb6430H
	v9o4xcsjR6mWm4nLsS5b+iukMw==
X-Google-Smtp-Source: AK7set/eY6l3j0tIm+E4Ulj8uu+N4HWCIJbO8QgFYfPq9KRYPC10pX+4fMH8NtYMAoGaEz1vRgHJQw==
X-Received: by 2002:adf:f44b:0:b0:2bf:e4b2:64a8 with SMTP id f11-20020adff44b000000b002bfe4b264a8mr3630125wrp.42.1675790177410;
        Tue, 07 Feb 2023 09:16:17 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:57f3:e3b1:e247:9c58])
        by smtp.gmail.com with ESMTPSA id s16-20020adff810000000b002c3dc4131f5sm9414897wrp.18.2023.02.07.09.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 09:16:16 -0800 (PST)
Date: Tue, 7 Feb 2023 18:16:09 +0100
From: Marco Elver <elver@google.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v3 1/7] kernel/fork: convert vma assignment to a memcpy
Message-ID: <Y+KHWcpxd09prihv@elver.google.com>
References: <20230125233554.153109-1-surenb@google.com>
 <20230125233554.153109-2-surenb@google.com>
 <20230125162159.a66e5ef05fecb405e85ffec9@linux-foundation.org>
 <CAJuCfpG5HyMP3RM1jTJxCnN4WUz4APAcxbkOT48ZtJDXcb3z3w@mail.gmail.com>
 <20230125173449.5472cffc989dfab4b83c491d@linux-foundation.org>
 <20230126172726.GA682281@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126172726.GA682281@paulmck-ThinkPad-P17-Gen-1>
User-Agent: Mutt/2.2.9 (2022-11-12)
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, minchan@google.com, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, Andrew Morton <akpm@linux-fou
 ndation.org>, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 09:27AM -0800, Paul E. McKenney wrote:
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
> > 
> > Perhaps Paul can comment?
> > 
> > I wonder if KCSAN knows how to detect this race, given that it's now in
> > a memcpy.  I assume so.
> 
> I ran an experiment memcpy()ing between a static array and an onstack
> array, and KCSAN did not complain.  But maybe I was setting it up wrong.
> 
> This is what I did:
> 
> 	long myid = (long)arg; /* different value for each task */
> 	static unsigned long z1[10] = { 0 };
> 	unsigned long z2[10];
> 
> 	...
> 
> 	memcpy(z1, z2, ARRAY_SIZE(z1) * sizeof(z1[0]));
> 	for (zi = 0; zi < ARRAY_SIZE(z1); zi++)
> 		z2[zi] += myid;
> 	memcpy(z2, z1, ARRAY_SIZE(z1) * sizeof(z1[0]));
> 
> Adding Marco on CC for his thoughts.

( Sorry for not seeing it earlier - just saw this by chance. )

memcpy() data races will be detected as of (given a relatively recent
Clang compiler):

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7c201739beef

Also beware that the compiler is free to "optimize" things by either
inlining memcpy() (turning an explicit memcpy() into just a bunch of
loads/stores), or outline plain assignments into memcpy() calls. So the
only way to be sure what ends up there is to look at the disassembled
code.

The data_race() was introduced by:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cda099b37d716

It says:
 "vm_area_dup() blindly copies all fields of original VMA to the new one.
  This includes coping vm_area_struct::shared.rb which is normally
  protected by i_mmap_lock. But this is fine because the read value will
  be overwritten on the following __vma_link_file() under proper
  protection. Thus, mark it as an intentional data race and insert a few
  assertions for the fields that should not be modified concurrently."

And as far as I can tell this hasn't changed.

Thanks,
-- Marco
