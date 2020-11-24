Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 452812C1D26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 05:53:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgBVQ3q0GzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 15:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.196;
 helo=mail-lj1-f196.google.com; envelope-from=namhyung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgBSP5NwyzDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 15:51:31 +1100 (AEDT)
Received: by mail-lj1-f196.google.com with SMTP id f24so7663820ljk.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Nov 2020 20:51:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=602FIqwWhz6vUm0jx2ZcCsqu08FcjrdaJmn8EM3RSdc=;
 b=LYfSHIcJIhJ3dDp9kBMpDoYCyELJEQHz0QWBd6CCOZ9wDJSSj+b/9Q0gDg7yvQDBs5
 uW+Mq9atPxd2mI2vb7jv8BvAQXfP1MZuAClrfUBrzn39DIYEyoOAP4O4e1gcguogTBYN
 CsgO/qbP+wbrrFYqqkn+L0diHoApSje4SiGAMiTHxZczzY8f1f3tkTslDkMQr64iy4Rs
 1o+3Ag+ILWU296foecBxluBlgQ0KT9DRNiS1Pvraty5PbdFRPKFhiRwvjHGJmJjTPfeX
 VE3cSASN/E/B6vi/2senpef+Ye3PW42uiTfryHwiEi9hHdovdM0ijB2VvB71V/dRF+nT
 cd0A==
X-Gm-Message-State: AOAM5322j/DQ80JA3C9q7JHIG6kMdOq3vBhuf/TPRdmc79i+7WUgsPcg
 613iiSUZ9CiKYUkyfMzR4HHUYhJJ8h9pCS1kAQQ=
X-Google-Smtp-Source: ABdhPJwVYcigqhxUrHcfAiaRJMrRQ6F3yiXnsu1oThwXA9XYiYd015v8VeunzeWChVKXDpC2Ow4uH0jAZl+C2PVsd94=
X-Received: by 2002:a2e:84c7:: with SMTP id q7mr1051112ljh.415.1606193487259; 
 Mon, 23 Nov 2020 20:51:27 -0800 (PST)
MIME-Version: 1.0
References: <20201106212935.28943-1-kan.liang@linux.intel.com>
 <20201109095235.GC2594@hirez.programming.kicks-ass.net>
 <20201109110405.GN2651@hirez.programming.kicks-ass.net>
 <0a1db246-c34a-22a3-160c-3e0c0a38119d@linux.intel.com>
 <20201111162509.GW2611@hirez.programming.kicks-ass.net>
 <2dc483f6-7b29-c42b-13a4-4c549d720aa2@linux.intel.com>
 <CAM9d7cjwFp9JBqs1Ga9n1ojbez9chZLvmOgFv1EE4KDhAa9ryA@mail.gmail.com>
 <CAM9d7chbQE=zkqYsNFMv+uWEYWdXcGD=fNYT_R2ondwR5zVvaQ@mail.gmail.com>
 <87a6v81gou.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6v81gou.fsf@mpe.ellerman.id.au>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 24 Nov 2020 13:51:15 +0900
Message-ID: <CAM9d7cg8kYMyPHQK_rhEiYQaSddqqt93=pLVNKJm8Y6F=if9ow@mail.gmail.com>
Subject: Re: [PATCH 1/3] perf/core: Flush PMU internal buffers for per-CPU
 events
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Ian Rogers <irogers@google.com>, Andi Kleen <ak@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>, Paul Mackerras <paulus@samba.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Ingo Molnar <mingo@kernel.org>, Gabriel Marin <gmx@google.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Nov 23, 2020 at 8:00 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Namhyung Kim <namhyung@kernel.org> writes:
> > Hi Peter and Kan,
> >
> > (Adding PPC folks)
> >
> > On Tue, Nov 17, 2020 at 2:01 PM Namhyung Kim <namhyung@kernel.org> wrote:
> >>
> >> Hello,
> >>
> >> On Thu, Nov 12, 2020 at 4:54 AM Liang, Kan <kan.liang@linux.intel.com> wrote:
> >> >
> >> >
> >> >
> >> > On 11/11/2020 11:25 AM, Peter Zijlstra wrote:
> >> > > On Mon, Nov 09, 2020 at 09:49:31AM -0500, Liang, Kan wrote:
> >> > >
> >> > >> - When the large PEBS was introduced (9c964efa4330), the sched_task() should
> >> > >> be invoked to flush the PEBS buffer in each context switch. However, The
> >> > >> perf_sched_events in account_event() is not updated accordingly. The
> >> > >> perf_event_task_sched_* never be invoked for a pure per-CPU context. Only
> >> > >> per-task event works.
> >> > >>     At that time, the perf_pmu_sched_task() is outside of
> >> > >> perf_event_context_sched_in/out. It means that perf has to double
> >> > >> perf_pmu_disable() for per-task event.
> >> > >
> >> > >> - The patch 1 tries to fix broken per-CPU events. The CPU context cannot be
> >> > >> retrieved from the task->perf_event_ctxp. So it has to be tracked in the
> >> > >> sched_cb_list. Yes, the code is very similar to the original codes, but it
> >> > >> is actually the new code for per-CPU events. The optimization for per-task
> >> > >> events is still kept.
> >> > >>    For the case, which has both a CPU context and a task context, yes, the
> >> > >> __perf_pmu_sched_task() in this patch is not invoked. Because the
> >> > >> sched_task() only need to be invoked once in a context switch. The
> >> > >> sched_task() will be eventually invoked in the task context.
> >> > >
> >> > > The thing is; your first two patches rely on PERF_ATTACH_SCHED_CB and
> >> > > only set that for large pebs. Are you sure the other users (Intel LBR
> >> > > and PowerPC BHRB) don't need it?
> >> >
> >> > I didn't set it for LBR, because the perf_sched_events is always enabled
> >> > for LBR. But, yes, we should explicitly set the PERF_ATTACH_SCHED_CB
> >> > for LBR.
> >> >
> >> >         if (has_branch_stack(event))
> >> >                 inc = true;
> >> >
> >> > >
> >> > > If they indeed do not require the pmu::sched_task() callback for CPU
> >> > > events, then I still think the whole perf_sched_cb_{inc,dec}() interface
> >> >
> >> > No, LBR requires the pmu::sched_task() callback for CPU events.
> >> >
> >> > Now, The LBR registers have to be reset in sched in even for CPU events.
> >> >
> >> > To fix the shorter LBR callstack issue for CPU events, we also need to
> >> > save/restore LBRs in pmu::sched_task().
> >> > https://lore.kernel.org/lkml/1578495789-95006-4-git-send-email-kan.liang@linux.intel.com/
> >> >
> >> > > is confusing at best.
> >> > >
> >> > > Can't we do something like this instead?
> >> > >
> >> > I think the below patch may have two issues.
> >> > - PERF_ATTACH_SCHED_CB is required for LBR (maybe PowerPC BHRB as well) now.
> >> > - We may disable the large PEBS later if not all PEBS events support
> >> > large PEBS. The PMU need a way to notify the generic code to decrease
> >> > the nr_sched_task.
> >>
> >> Any updates on this?  I've reviewed and tested Kan's patches
> >> and they all look good.
> >>
> >> Maybe we can talk to PPC folks to confirm the BHRB case?
> >
> > Can we move this forward?  I saw patch 3/3 also adds PERF_ATTACH_SCHED_CB
> > for PowerPC too.  But it'd be nice if ppc folks can confirm the change.
>
> Sorry I've read the whole thread, but I'm still not entirely sure I
> understand the question.

Thanks for your time and sorry about not being clear enough.

We found per-cpu events are not calling pmu::sched_task()
on context switches.  So PERF_ATTACH_SCHED_CB was
added to indicate the core logic that it needs to invoke the
callback.

The patch 3/3 added the flag to PPC (for BHRB) with other
changes (I think it should be split like in the patch 2/3) and
want to get ACKs from the PPC folks.

Thanks,
Namhyung
