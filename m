Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A8F241616
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 07:41:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQhXz1YrWzDqTW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Aug 2020 15:41:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=flukshun@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Eja6zsRv; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQhTt1lBxzDqHP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Aug 2020 15:39:13 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id q9so9204675oth.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 22:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:to:from:in-reply-to
 :cc:references:message-id:user-agent:subject:date;
 bh=PSojxkSQQRnZBOFsoa9NdVoWiqZMj14VnwSRke4uL/o=;
 b=Eja6zsRvsLPDA4AMjmEXye9R2G8ZCMoUDQ5CeCYvn9jsR2vOgmniLI9XKbo5FVvi0P
 QGWx62C/lstMwMvvZs69PcPNWmfLhplW7eQYOhVoe+zAaeSMRpFPeG1++QK9l697kuG+
 QOwe65bCwvyBecz+67x0mP13VuYLs8tc4ftgWzJVDYaEpZDT8KFodcxxkMG3gEQq0wIJ
 8nB4O4Lw4IHLG8Hrj2BZBYEMbbbZuVuB5V9nZRv1J5gkBJ4MRIyNKcxcQT7XmCfbsxUw
 Zvpb/TcurBZGq3e3qDXnC3cctQVop8LkTTfjMHRftyzQm8PvLL30tI330X0cIaA+T7Sh
 fHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding:to
 :from:in-reply-to:cc:references:message-id:user-agent:subject:date;
 bh=PSojxkSQQRnZBOFsoa9NdVoWiqZMj14VnwSRke4uL/o=;
 b=lkfHP3LQbmFVJxFK9mGjVIG5z3EXu8p3OTmauqGOCSnI+X7HwyCJddCHSt7oUQSy6Z
 zpQotBpm1S5U5SZCBrVbOJVVr3u9HHC4/BOoKmB7VbyWyeVYceU3o1sv+v5URSRfJBJh
 TbXO2RN7TA4ZhUivgzX35rAK4NsIF000mH6EXwK9Fs1IXhq4kURoDYF0jow4mq5LdCwm
 54tKP7x9YPNN7KNUKIuu+i1pRlnG6j8bZRNSDY/5SQN0TFQnzS7sa/xTnmMacAAZHryl
 LE00Sg96VH0v47f1wP02ccy//arWu8KRoAL4jY/pGcxHy/JMF5hJ0TwMsuXlbBawEpZE
 Qnew==
X-Gm-Message-State: AOAM530Gc+diT4ZWk/6ovZTXp7yc4LP3B1w0ekEW6HF+ccClC4IPWtDi
 nowll2ZnfkAKjjrlfkhXFPk=
X-Google-Smtp-Source: ABdhPJxqE0vvFcpdqmIhIQ8QNKFzIbXUC9qlTvQNN0LsLTi5cVDYdwg5M6QsxMiewGuIcJ4QfXFWOw==
X-Received: by 2002:a05:6830:1f4a:: with SMTP id
 u10mr3541760oth.313.1597124349719; 
 Mon, 10 Aug 2020 22:39:09 -0700 (PDT)
Received: from localhost ([2600:1700:70:e488:1014:5e2e:fac9:d096])
 by smtp.gmail.com with ESMTPSA id y73sm4112614ooa.25.2020.08.10.22.39.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Aug 2020 22:39:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: Michael Ellerman <mpe@ellerman.id.au>, Nathan Lynch <nathanl@linux.ibm.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
In-Reply-To: <87mu37ylzu.fsf@linux.ibm.com>
References: <20200804032937.7235-1-mdroth@linux.vnet.ibm.com>
 <873652zg8h.fsf@mpe.ellerman.id.au> <20200804161609.6cb2cb71@bahia.lan>
 <87zh79yen7.fsf@mpe.ellerman.id.au> <87mu37ylzu.fsf@linux.ibm.com>
Message-ID: <159712434106.7191.15165087672426328577@sif>
User-Agent: alot/0.7
Subject: Re: [PATCH] powerpc/pseries/hotplug-cpu: increase wait time for vCPU
 death
Date: Tue, 11 Aug 2020 00:39:01 -0500
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
Cc: linuxppc-dev@lists.ozlabs.org, Greg Kurz <groug@kaod.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Cedric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Nathan Lynch (2020-08-07 02:05:09)
> Hi everyone,
> =

> Michael Ellerman <mpe@ellerman.id.au> writes:
> > Greg Kurz <groug@kaod.org> writes:
> >> On Tue, 04 Aug 2020 23:35:10 +1000
> >> Michael Ellerman <mpe@ellerman.id.au> wrote:
> >>> Spinning forever seems like a bad idea, but as has been demonstrated =
at
> >>> least twice now, continuing when we don't know the state of the other
> >>> CPU can lead to straight up crashes.
> >>> =

> >>> So I think I'm persuaded that it's preferable to have the kernel stuck
> >>> spinning rather than oopsing.
> >>> =

> >>
> >> +1
> >>
> >>> I'm 50/50 on whether we should have a cond_resched() in the loop. My
> >>> first instinct is no, if we're stuck here for 20s a stack trace would=
 be
> >>> good. But then we will probably hit that on some big and/or heavily
> >>> loaded machine.
> >>> =

> >>> So possibly we should call cond_resched() but have some custom logic =
in
> >>> the loop to print a warning if we are stuck for more than some
> >>> sufficiently long amount of time.
> >>
> >> How long should that be ?
> >
> > Yeah good question.
> >
> > I guess step one would be seeing how long it can take on the 384 vcpu
> > machine. And we can probably test on some other big machines.
> >
> > Hopefully Nathan can give us some idea of how long he's seen it take on
> > large systems? I know he was concerned about the 20s timeout of the
> > softlockup detector.
> =

> Maybe I'm not quite clear what this is referring to, but I don't think
> stop-self/query-stopped-state latency increases with processor count, at
> least not on PowerVM. And IIRC I was concerned with the earlier patch's
> potential for causing the softlockup watchdog to rightly complain by
> polling the stopped state without ever scheduling away.
> =

> The fact that smp_query_cpu_stopped() kind of collapses the two distinct
> results from the query-cpu-stopped-state RTAS call into one return value
> may make it harder than necessary to reason about the questions around
> cond_resched() and whether to warn.
> =

> Sorry to pull this stunt but I have had some code sitting in a neglected
> branch that I think gets the logic around this right.
> =

> What we should have is a simple C wrapper for the RTAS call that reflects=
 the
> architected inputs and outputs:
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (-- rtas.c --)
> =

> /**
>  * rtas_query_cpu_stopped_state() - Call RTAS query-cpu-stopped-state.
>  * @hwcpu: Identifies the processor thread to be queried.
>  * @status: Pointer to status, valid only on success.
>  *
>  * Determine whether the given processor thread is in the stopped
>  * state.  If successful and @status is non-NULL, the thread's status
>  * is stored to @status.
>  *
>  * Return:
>  * * 0   - Success
>  * * -1  - Hardware error
>  * * -2  - Busy, try again later
>  */
> int rtas_query_cpu_stopped_state(unsigned int hwcpu, unsigned int *status)
> {
>        unsigned int cpu_status;
>        int token;
>        int fwrc;
> =

>        token =3D rtas_token("query-cpu-stopped-state");
> =

>        fwrc =3D rtas_call(token, 1, 2, &cpu_status, hwcpu);
>        if (fwrc !=3D 0)
>                goto out;
> =

>        if (status !=3D NULL)
>                *status =3D cpu_status;
> out:
>        return fwrc;
> }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> =

> And then a utility function that waits for the remote thread to enter
> stopped state, with higher-level logic for rescheduling and warning. The
> fact that smp_query_cpu_stopped() currently does not handle a -2/busy
> status is a bug, fixed below by using rtas_busy_delay(). Note the
> justification for the explicit cond_resched() in the outer loop:
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> (-- rtas.h --)
> =

> /* query-cpu-stopped-state CPU_status */
> #define RTAS_QCSS_STATUS_STOPPED     0
> #define RTAS_QCSS_STATUS_IN_PROGRESS 1
> #define RTAS_QCSS_STATUS_NOT_STOPPED 2
> =

> (-- pseries/hotplug-cpu.c --)
> =

> /**
>  * wait_for_cpu_stopped() - Wait for a cpu to enter RTAS stopped state.
>  */
> static void wait_for_cpu_stopped(unsigned int cpu)
> {
>        unsigned int status;
>        unsigned int hwcpu;
> =

>        hwcpu =3D get_hard_smp_processor_id(cpu);
> =

>        do {
>                int fwrc;
> =

>                /*
>                 * rtas_busy_delay() will yield only if RTAS returns a
>                 * busy status. Since query-cpu-stopped-state can
>                 * yield RTAS_QCSS_STATUS_IN_PROGRESS or
>                 * RTAS_QCSS_STATUS_NOT_STOPPED for an unbounded
>                 * period before the target thread stops, we must take
>                 * care to explicitly reschedule while polling.
>                 */
>                cond_resched();
> =

>                do {
>                        fwrc =3D rtas_query_cpu_stopped_state(hwcpu, &stat=
us);
>                } while (rtas_busy_delay(fwrc));
> =

>                if (fwrc =3D=3D 0)
>                        continue;
> =

>                pr_err_ratelimited("query-cpu-stopped-state for "
>                                   "thread 0x%x returned %d\n",
>                                   hwcpu, fwrc);
>                goto out;
> =

>        } while (status =3D=3D RTAS_QCSS_STATUS_NOT_STOPPED ||
>                 status =3D=3D RTAS_QCSS_STATUS_IN_PROGRESS);
> =

>        if (status !=3D RTAS_QCSS_STATUS_STOPPED) {
>                pr_err_ratelimited("query-cpu-stopped-state yielded unknow=
n "
>                                   "status %d for thread 0x%x\n",
>                                   status, hwcpu);
>        }
> out:
>        return;
> }
> =

> [...]
> =

> static void pseries_cpu_die(unsigned int cpu)
> {
>        wait_for_cpu_stopped(cpu);
>        paca_ptrs[cpu]->cpu_start =3D 0;
> }
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =

> wait_for_cpu_stopped() should be able to accommodate a time-based
> warning if necessary, but speaking as a likely recipient of any bug
> reports that would arise here, I'm not convinced of the need and I
> don't know what a good value would be. It's relatively easy to sample
> the stack of a task that's apparently failing to make progress, plus I
> probably would use 'perf probe' or similar to report the inputs and
> outputs for the RTAS call.

I think if we make the timeout sufficiently high like 2 minutes or so
it wouldn't hurt and if we did seem them it would probably point to an
actual bug. But I don't have a strong feeling either way.

> =

> I'm happy to make this a proper submission after I can clean it up and
> retest it, or Michael R. is welcome to appropriate it, assuming it's
> acceptable.
> =


I've given it a shot with this patch and it seems to be holding up in
testing. If we don't think the ~2 minutes warning message is needed I
can clean it up to post:

https://github.com/mdroth/linux/commit/354b8c97bf0dc1146e36aa72273f5b33fe90=
d09e

I'd likely break the refactoring patches out to a separate patch under
Nathan's name since it fixes a separate bug potentially.
