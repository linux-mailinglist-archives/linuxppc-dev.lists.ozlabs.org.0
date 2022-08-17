Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C4E596F4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 15:16:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M77nR1tM3z3cCD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 23:16:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ta7vQAWf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ta7vQAWf;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M77mn0Ctfz305H
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 23:15:35 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-333a4a5d495so119933547b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 06:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=4x9/R2mHqDBSBsINZoYzu53n4+/x9xPXewr5G0XEr34=;
        b=Ta7vQAWfgNwLeo8X+pcdJ6JyCnUcaqj1Ews44KLWjJGhgXZv20jGydY8asVvhmMfNz
         b5Fzq6C/S2NXkgfMPJzpJcfXtNp/XsSJDaSorCNhL1D/nzqkMFU7Du+YXm0LpKulY9IK
         /76nM6mT8xUUP8UaTC1eN5M2TkbrsohpqC0/E8YxXYpbdWBeaceJ/x8g5odhImXtyrc1
         qOyIpz90N1Ejyl+l9w55WOS+8npqTm4TRnzX3bA4a2avvsii63eJWYfy6fWyxSZaHQWM
         Qo0/XLJ6ZGGdQy6n6h+9ZeH4bseaOSQZpSngSXr1oW9GbmtitbnwZya8r8OT9qqDsOW5
         Pddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4x9/R2mHqDBSBsINZoYzu53n4+/x9xPXewr5G0XEr34=;
        b=DJQm6l3frqO8Sjut4VD0L65IT6aLoXk+DC28LHcQGnR+9qo8wCG76T2urh5N5IRt+9
         IyNrun4Fzk+ah67ZXfVblMB9U8AsON/FpKatoyKDpn3V/oN4hligIKVOULg64X38Hp6L
         cyRpEpgMuiCIpS7irV0IWpcnvF9bSJn7l8EMDrzKBgxJkeggII+9wKmNgT6nNv91pHWM
         yZrDalQzHY+dSIFB4NJKl37nOClSxViU5VKeN48EE6kWLCkm3imO/WU/T0rOrVEeFCX4
         sYrkx6PE8rNo1sgsAAxTnK4FXNVdmbC86Eo/TQ8MyO1+e2C0p3WO1voFTuMD8khwQjjZ
         K55Q==
X-Gm-Message-State: ACgBeo06T7oVOvEfHUl5zYHHqAiNpnojjDMcOVEmommWF06TW7D+qJ5c
	6Fw783Y/NIO9S8kydFIlI1CC2s7RjakPaopbAOmbZQ==
X-Google-Smtp-Source: AA6agR4J3cyIT0SWBYaiCeztXduj+LhF+ocuDdNtn7hGLnqyHtxrllFHNLPRhY47QfH++sCFFlwAFNLyvGB5+UaJKNI=
X-Received: by 2002:a5b:c8b:0:b0:688:ebe9:3d05 with SMTP id
 i11-20020a5b0c8b000000b00688ebe93d05mr12303544ybq.553.1660742130329; Wed, 17
 Aug 2022 06:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-12-elver@google.com>
 <YvznKYgRKjDRSMkT@worktop.programming.kicks-ass.net>
In-Reply-To: <YvznKYgRKjDRSMkT@worktop.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Wed, 17 Aug 2022 15:14:54 +0200
Message-ID: <CANpmjNN1vv9oDpm1_c99tQKgWVVtXza++u1xcBVeb5mhx5eUHw@mail.gmail.com>
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

On Wed, 17 Aug 2022 at 15:03, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jul 04, 2022 at 05:05:11PM +0200, Marco Elver wrote:
> > +static bool bp_constraints_is_locked(struct perf_event *bp)
> > +{
> > +     struct mutex *tsk_mtx = get_task_bps_mutex(bp);
> > +
> > +     return percpu_is_write_locked(&bp_cpuinfo_sem) ||
> > +            (tsk_mtx ? mutex_is_locked(tsk_mtx) :
> > +                       percpu_is_read_locked(&bp_cpuinfo_sem));
> > +}
>
> > @@ -426,18 +521,28 @@ static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
> >   */
> >  int dbg_reserve_bp_slot(struct perf_event *bp)
> >  {
> > -     if (mutex_is_locked(&nr_bp_mutex))
> > +     int ret;
> > +
> > +     if (bp_constraints_is_locked(bp))
> >               return -1;
> >
> > -     return __reserve_bp_slot(bp, bp->attr.bp_type);
> > +     /* Locks aren't held; disable lockdep assert checking. */
> > +     lockdep_off();
> > +     ret = __reserve_bp_slot(bp, bp->attr.bp_type);
> > +     lockdep_on();
> > +
> > +     return ret;
> >  }
> >
> >  int dbg_release_bp_slot(struct perf_event *bp)
> >  {
> > -     if (mutex_is_locked(&nr_bp_mutex))
> > +     if (bp_constraints_is_locked(bp))
> >               return -1;
> >
> > +     /* Locks aren't held; disable lockdep assert checking. */
> > +     lockdep_off();
> >       __release_bp_slot(bp, bp->attr.bp_type);
> > +     lockdep_on();
> >
> >       return 0;
> >  }
>
> Urggghhhh... this is horrible crap. That is, the current code is that
> and this makes it worse :/

Heh, yes and when I looked at it I really wanted to see if it can
change. But from what I can tell, when the kernel debugger is being
attached, the kernel does stop everything it does and we need the
horrible thing above to not deadlock. And these dbg_ functions are not
normally used, so I decided to leave it as-is. Suggestions?
