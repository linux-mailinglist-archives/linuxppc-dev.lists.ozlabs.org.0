Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 419922C3AB2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 09:14:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgtvm2l6szDqcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 19:14:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgtsf1LKrzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 19:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=O8z1GklQ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CgtsY1DkGz9s0b;
 Wed, 25 Nov 2020 19:12:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606291941;
 bh=MkLk/nwJ58DfXoaI4w1ykli0O5C4KGioSAd70M9vhcM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O8z1GklQYS+BFRrXpCb7vCEGKtfYXRnzjqgjQSQzy9NeMqjmUdSgVOXJy7ZkI8cu9
 XPZiKZuIM38JsXjbsCYd/sO7l/SWUG1Q9yqgVl5oWI0ajWUDXuiVfU0UtyUUWBSyqw
 Kx0rI9kNHDcc1mgtgbMJS/2Ko8YwcU+ElIruL2OoDYFjiDM7ND+XBgzWbVOIL4M179
 CwzEc2E4FQwac2J/84eldEOhgvW4pgW1d00jg4EJIBkNMZtmXViyDU6101eLcRR5iI
 gJrdI49inRUanyb7EzpvzcOsk5LrNx1rYuZd/kpxAeMkT9yoJ+t3Y47dYy1wzGsQMd
 ejKRGZhDs/y9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH 1/3] perf/core: Flush PMU internal buffers for per-CPU
 events
In-Reply-To: <CAM9d7cg8kYMyPHQK_rhEiYQaSddqqt93=pLVNKJm8Y6F=if9ow@mail.gmail.com>
References: <20201106212935.28943-1-kan.liang@linux.intel.com>
 <20201109095235.GC2594@hirez.programming.kicks-ass.net>
 <20201109110405.GN2651@hirez.programming.kicks-ass.net>
 <0a1db246-c34a-22a3-160c-3e0c0a38119d@linux.intel.com>
 <20201111162509.GW2611@hirez.programming.kicks-ass.net>
 <2dc483f6-7b29-c42b-13a4-4c549d720aa2@linux.intel.com>
 <CAM9d7cjwFp9JBqs1Ga9n1ojbez9chZLvmOgFv1EE4KDhAa9ryA@mail.gmail.com>
 <CAM9d7chbQE=zkqYsNFMv+uWEYWdXcGD=fNYT_R2ondwR5zVvaQ@mail.gmail.com>
 <87a6v81gou.fsf@mpe.ellerman.id.au>
 <CAM9d7cg8kYMyPHQK_rhEiYQaSddqqt93=pLVNKJm8Y6F=if9ow@mail.gmail.com>
Date: Wed, 25 Nov 2020 19:12:13 +1100
Message-ID: <87lfepzwgy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Namhyung Kim <namhyung@kernel.org> writes:
> Hello,
>
> On Mon, Nov 23, 2020 at 8:00 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Namhyung Kim <namhyung@kernel.org> writes:
>> > Hi Peter and Kan,
>> >
>> > (Adding PPC folks)
>> >
>> > On Tue, Nov 17, 2020 at 2:01 PM Namhyung Kim <namhyung@kernel.org> wrote:
>> >>
>> >> Hello,
>> >>
>> >> On Thu, Nov 12, 2020 at 4:54 AM Liang, Kan <kan.liang@linux.intel.com> wrote:
>> >> >
>> >> >
>> >> >
>> >> > On 11/11/2020 11:25 AM, Peter Zijlstra wrote:
>> >> > > On Mon, Nov 09, 2020 at 09:49:31AM -0500, Liang, Kan wrote:
>> >> > >
>> >> > >> - When the large PEBS was introduced (9c964efa4330), the sched_task() should
>> >> > >> be invoked to flush the PEBS buffer in each context switch. However, The
>> >> > >> perf_sched_events in account_event() is not updated accordingly. The
>> >> > >> perf_event_task_sched_* never be invoked for a pure per-CPU context. Only
>> >> > >> per-task event works.
>> >> > >>     At that time, the perf_pmu_sched_task() is outside of
>> >> > >> perf_event_context_sched_in/out. It means that perf has to double
>> >> > >> perf_pmu_disable() for per-task event.
>> >> > >
>> >> > >> - The patch 1 tries to fix broken per-CPU events. The CPU context cannot be
>> >> > >> retrieved from the task->perf_event_ctxp. So it has to be tracked in the
>> >> > >> sched_cb_list. Yes, the code is very similar to the original codes, but it
>> >> > >> is actually the new code for per-CPU events. The optimization for per-task
>> >> > >> events is still kept.
>> >> > >>    For the case, which has both a CPU context and a task context, yes, the
>> >> > >> __perf_pmu_sched_task() in this patch is not invoked. Because the
>> >> > >> sched_task() only need to be invoked once in a context switch. The
>> >> > >> sched_task() will be eventually invoked in the task context.
>> >> > >
>> >> > > The thing is; your first two patches rely on PERF_ATTACH_SCHED_CB and
>> >> > > only set that for large pebs. Are you sure the other users (Intel LBR
>> >> > > and PowerPC BHRB) don't need it?
>> >> >
>> >> > I didn't set it for LBR, because the perf_sched_events is always enabled
>> >> > for LBR. But, yes, we should explicitly set the PERF_ATTACH_SCHED_CB
>> >> > for LBR.
>> >> >
>> >> >         if (has_branch_stack(event))
>> >> >                 inc = true;
>> >> >
>> >> > >
>> >> > > If they indeed do not require the pmu::sched_task() callback for CPU
>> >> > > events, then I still think the whole perf_sched_cb_{inc,dec}() interface
>> >> >
>> >> > No, LBR requires the pmu::sched_task() callback for CPU events.
>> >> >
>> >> > Now, The LBR registers have to be reset in sched in even for CPU events.
>> >> >
>> >> > To fix the shorter LBR callstack issue for CPU events, we also need to
>> >> > save/restore LBRs in pmu::sched_task().
>> >> > https://lore.kernel.org/lkml/1578495789-95006-4-git-send-email-kan.liang@linux.intel.com/
>> >> >
>> >> > > is confusing at best.
>> >> > >
>> >> > > Can't we do something like this instead?
>> >> > >
>> >> > I think the below patch may have two issues.
>> >> > - PERF_ATTACH_SCHED_CB is required for LBR (maybe PowerPC BHRB as well) now.
>> >> > - We may disable the large PEBS later if not all PEBS events support
>> >> > large PEBS. The PMU need a way to notify the generic code to decrease
>> >> > the nr_sched_task.
>> >>
>> >> Any updates on this?  I've reviewed and tested Kan's patches
>> >> and they all look good.
>> >>
>> >> Maybe we can talk to PPC folks to confirm the BHRB case?
>> >
>> > Can we move this forward?  I saw patch 3/3 also adds PERF_ATTACH_SCHED_CB
>> > for PowerPC too.  But it'd be nice if ppc folks can confirm the change.
>>
>> Sorry I've read the whole thread, but I'm still not entirely sure I
>> understand the question.
>
> Thanks for your time and sorry about not being clear enough.
>
> We found per-cpu events are not calling pmu::sched_task()
> on context switches.  So PERF_ATTACH_SCHED_CB was
> added to indicate the core logic that it needs to invoke the
> callback.

OK. TBH I've never thought of using branch stack with a per-cpu event,
but I guess you can do it.

I think the same logic applies as LBR, we need to read the BHRB entries
in the context of the task that they were recorded for.

> The patch 3/3 added the flag to PPC (for BHRB) with other
> changes (I think it should be split like in the patch 2/3) and
> want to get ACKs from the PPC folks.

If you post a new version with Maddy's comments addressed then he or I
can ack it.

cheers
