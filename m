Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A45A463A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 11:39:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGQPw3Mh1z3bqY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 19:39:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dx6bRQ4J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dx6bRQ4J;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGQPL46S0z2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 19:39:02 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-33dce2d4bc8so181047807b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GBvqua5cjMzjDQ/XgF9SZ1D4y+QsnVuyrt4amhV4btE=;
        b=dx6bRQ4JN/hF+3326YxFT0DmQuGRpE34IYiS96EVX69SRQeKSaYPwt5CrXJyN5/6Jy
         LU4sCb/nzEwY7rPM8KQoAIxIfvdbcNm2n40rDMqVfcTJScYRUNc6PFux701CkDOaVS3I
         p/4Hy2JiSHOOSzChWW0xl4APo4fnylJHJ9WrJKbGlSalEnDMAaddVjR/x9qZqTHorbQN
         oIVFtRs/0W/3z2F+EVui2fGdIizOdKUhrhCdwiHSyBf99GrsKuJ0tvJe2EHzoC0aQ+mz
         vJQY/hFbVFBQcwbB98qVRudkPkSpWvK3LFGhdzSkhwWir2jt11UNBByAnC4HQL4DbNqN
         Q4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GBvqua5cjMzjDQ/XgF9SZ1D4y+QsnVuyrt4amhV4btE=;
        b=5gzRyjMMU8ygWdzM0VxLZRmh3rZTjMme0PBArxEV46CXEFSsK8S6fzu10RfcJrKkY7
         jsqw6cGanOxHWTvIdQQEdHpP1+cKFLICVOqfgnPytBXQ0TSJ16TUhJaqmVXXaqA/TELE
         x0Q5xM3zSm0iVReR23havuZfHgGzaNlAg1xKkXTP9OsDHNYme/r4pdiurqcqpHCc4G6N
         ShdTlIqJJc2VWQokxpNKvh5dLn0OyNi1e90nYDaLMJB4mKB4bek0fQ71fe39uqg8xlSx
         0fnGt8hgK8IHvjyh8JteuG5HCRXTBQVHxvPmP8iyOhDr+HzXwoROGOaJvH3L9X8VSwf3
         WDPA==
X-Gm-Message-State: ACgBeo0n1diD8BMtg2twYqJSZg+o9y+4VoMF/ka1csHZfeOy8gKETGrO
	uD1gbIv7FMvcdpK+TNLKGBssvWNrS3ZC6oSM5YBj6A==
X-Google-Smtp-Source: AA6agR6q7ad6sf4kgVlbFbNc5qY39/VlvvSlRemTzNOIPH7rueyubBC/OTF7pi8jTZlObaVAtjHrYIlq/M8iqBqxOiw=
X-Received: by 2002:a81:4e04:0:b0:33d:c7dc:9e2b with SMTP id
 c4-20020a814e04000000b0033dc7dc9e2bmr8959772ywb.4.1661765938626; Mon, 29 Aug
 2022 02:38:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-12-elver@google.com>
 <YvznKYgRKjDRSMkT@worktop.programming.kicks-ass.net> <CANpmjNN1vv9oDpm1_c99tQKgWVVtXza++u1xcBVeb5mhx5eUHw@mail.gmail.com>
 <Ywx7CmbG+f+wg04z@hirez.programming.kicks-ass.net>
In-Reply-To: <Ywx7CmbG+f+wg04z@hirez.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Mon, 29 Aug 2022 11:38:22 +0200
Message-ID: <CANpmjNPFnV2novubKKVmC7zJ8qi72QuRY6bWBEi5jrO_kkRBag@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] perf/hw_breakpoint: Reduce contention with large
 number of tasks
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Aug 2022 at 10:38, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Aug 17, 2022 at 03:14:54PM +0200, Marco Elver wrote:
> > On Wed, 17 Aug 2022 at 15:03, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Mon, Jul 04, 2022 at 05:05:11PM +0200, Marco Elver wrote:
> > > > +static bool bp_constraints_is_locked(struct perf_event *bp)
> > > > +{
> > > > +     struct mutex *tsk_mtx = get_task_bps_mutex(bp);
> > > > +
> > > > +     return percpu_is_write_locked(&bp_cpuinfo_sem) ||
> > > > +            (tsk_mtx ? mutex_is_locked(tsk_mtx) :
> > > > +                       percpu_is_read_locked(&bp_cpuinfo_sem));
> > > > +}
> > >
> > > > @@ -426,18 +521,28 @@ static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
> > > >   */
> > > >  int dbg_reserve_bp_slot(struct perf_event *bp)
> > > >  {
> > > > -     if (mutex_is_locked(&nr_bp_mutex))
> > > > +     int ret;
> > > > +
> > > > +     if (bp_constraints_is_locked(bp))
> > > >               return -1;
> > > >
> > > > -     return __reserve_bp_slot(bp, bp->attr.bp_type);
> > > > +     /* Locks aren't held; disable lockdep assert checking. */
> > > > +     lockdep_off();
> > > > +     ret = __reserve_bp_slot(bp, bp->attr.bp_type);
> > > > +     lockdep_on();
> > > > +
> > > > +     return ret;
> > > >  }
> > > >
> > > >  int dbg_release_bp_slot(struct perf_event *bp)
> > > >  {
> > > > -     if (mutex_is_locked(&nr_bp_mutex))
> > > > +     if (bp_constraints_is_locked(bp))
> > > >               return -1;
> > > >
> > > > +     /* Locks aren't held; disable lockdep assert checking. */
> > > > +     lockdep_off();
> > > >       __release_bp_slot(bp, bp->attr.bp_type);
> > > > +     lockdep_on();
> > > >
> > > >       return 0;
> > > >  }
> > >
> > > Urggghhhh... this is horrible crap. That is, the current code is that
> > > and this makes it worse :/
> >
> > Heh, yes and when I looked at it I really wanted to see if it can
> > change. But from what I can tell, when the kernel debugger is being
> > attached, the kernel does stop everything it does and we need the
> > horrible thing above to not deadlock. And these dbg_ functions are not
> > normally used, so I decided to leave it as-is. Suggestions?
>
> What context is this ran in? NMI should already have lockdep disabled.

kgdb can enter via kgdb_nmicall*() but also via
kgdb_handle_exception(), which isn't for NMI.
