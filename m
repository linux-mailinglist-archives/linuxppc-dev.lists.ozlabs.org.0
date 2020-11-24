Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278A2C2C47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:07:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgTSD43vzzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 03:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=kan.liang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgTPr6z05zDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 03:05:19 +1100 (AEDT)
IronPort-SDR: FBXtb+dCGzr/nTaR9qjJdZV8oAoRg//rldfWtuwAWaHJNNZopE5h2zi01VqtM9x3pyUCPuAFB1
 6XjNCXlq+bWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="172125779"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="172125779"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2020 08:04:34 -0800
IronPort-SDR: dR6Afh+0k969CnASivGz+bcxXD3+QPNz5isrulKW7S3uubWuy+7+34W1iwvcvYG3phuMDnuEvX
 Wy4bGlFLy5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; d="scan'208";a="536520375"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2020 08:04:33 -0800
Received: from [10.254.70.76] (kliang2-MOBL.ccr.corp.intel.com [10.254.70.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 788AD580565;
 Tue, 24 Nov 2020 08:04:32 -0800 (PST)
Subject: Re: [PATCH 1/3] perf/core: Flush PMU internal buffers for per-CPU
 events
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Namhyung Kim <namhyung@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
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
 <9657dc9f-e1a9-eb7e-8ac2-a108416d5a10@linux.ibm.com>
From: "Liang, Kan" <kan.liang@linux.intel.com>
Message-ID: <ba4d80fa-82e5-d3fd-c772-deb12e286de3@linux.intel.com>
Date: Tue, 24 Nov 2020 11:04:31 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9657dc9f-e1a9-eb7e-8ac2-a108416d5a10@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Stephane Eranian <eranian@google.com>, Paul Mackerras <paulus@samba.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Ingo Molnar <mingo@kernel.org>, Gabriel Marin <gmx@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/24/2020 12:42 AM, Madhavan Srinivasan wrote:
> 
> On 11/24/20 10:21 AM, Namhyung Kim wrote:
>> Hello,
>>
>> On Mon, Nov 23, 2020 at 8:00 PM Michael Ellerman <mpe@ellerman.id.au> 
>> wrote:
>>> Namhyung Kim <namhyung@kernel.org> writes:
>>>> Hi Peter and Kan,
>>>>
>>>> (Adding PPC folks)
>>>>
>>>> On Tue, Nov 17, 2020 at 2:01 PM Namhyung Kim <namhyung@kernel.org> 
>>>> wrote:
>>>>> Hello,
>>>>>
>>>>> On Thu, Nov 12, 2020 at 4:54 AM Liang, Kan 
>>>>> <kan.liang@linux.intel.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 11/11/2020 11:25 AM, Peter Zijlstra wrote:
>>>>>>> On Mon, Nov 09, 2020 at 09:49:31AM -0500, Liang, Kan wrote:
>>>>>>>
>>>>>>>> - When the large PEBS was introduced (9c964efa4330), the 
>>>>>>>> sched_task() should
>>>>>>>> be invoked to flush the PEBS buffer in each context switch. 
>>>>>>>> However, The
>>>>>>>> perf_sched_events in account_event() is not updated accordingly. 
>>>>>>>> The
>>>>>>>> perf_event_task_sched_* never be invoked for a pure per-CPU 
>>>>>>>> context. Only
>>>>>>>> per-task event works.
>>>>>>>>      At that time, the perf_pmu_sched_task() is outside of
>>>>>>>> perf_event_context_sched_in/out. It means that perf has to double
>>>>>>>> perf_pmu_disable() for per-task event.
>>>>>>>> - The patch 1 tries to fix broken per-CPU events. The CPU 
>>>>>>>> context cannot be
>>>>>>>> retrieved from the task->perf_event_ctxp. So it has to be 
>>>>>>>> tracked in the
>>>>>>>> sched_cb_list. Yes, the code is very similar to the original 
>>>>>>>> codes, but it
>>>>>>>> is actually the new code for per-CPU events. The optimization 
>>>>>>>> for per-task
>>>>>>>> events is still kept.
>>>>>>>>     For the case, which has both a CPU context and a task 
>>>>>>>> context, yes, the
>>>>>>>> __perf_pmu_sched_task() in this patch is not invoked. Because the
>>>>>>>> sched_task() only need to be invoked once in a context switch. The
>>>>>>>> sched_task() will be eventually invoked in the task context.
>>>>>>> The thing is; your first two patches rely on PERF_ATTACH_SCHED_CB 
>>>>>>> and
>>>>>>> only set that for large pebs. Are you sure the other users (Intel 
>>>>>>> LBR
>>>>>>> and PowerPC BHRB) don't need it?
>>>>>> I didn't set it for LBR, because the perf_sched_events is always 
>>>>>> enabled
>>>>>> for LBR. But, yes, we should explicitly set the PERF_ATTACH_SCHED_CB
>>>>>> for LBR.
>>>>>>
>>>>>>          if (has_branch_stack(event))
>>>>>>                  inc = true;
>>>>>>
>>>>>>> If they indeed do not require the pmu::sched_task() callback for CPU
>>>>>>> events, then I still think the whole perf_sched_cb_{inc,dec}() 
>>>>>>> interface
>>>>>> No, LBR requires the pmu::sched_task() callback for CPU events.
>>>>>>
>>>>>> Now, The LBR registers have to be reset in sched in even for CPU 
>>>>>> events.
>>>>>>
>>>>>> To fix the shorter LBR callstack issue for CPU events, we also 
>>>>>> need to
>>>>>> save/restore LBRs in pmu::sched_task().
>>>>>> https://lore.kernel.org/lkml/1578495789-95006-4-git-send-email-kan.liang@linux.intel.com/ 
>>>>>>
>>>>>>
>>>>>>> is confusing at best.
>>>>>>>
>>>>>>> Can't we do something like this instead?
>>>>>>>
>>>>>> I think the below patch may have two issues.
>>>>>> - PERF_ATTACH_SCHED_CB is required for LBR (maybe PowerPC BHRB as 
>>>>>> well) now.
>>>>>> - We may disable the large PEBS later if not all PEBS events support
>>>>>> large PEBS. The PMU need a way to notify the generic code to decrease
>>>>>> the nr_sched_task.
>>>>> Any updates on this?  I've reviewed and tested Kan's patches
>>>>> and they all look good.
>>>>>
>>>>> Maybe we can talk to PPC folks to confirm the BHRB case?
>>>> Can we move this forward?  I saw patch 3/3 also adds 
>>>> PERF_ATTACH_SCHED_CB
>>>> for PowerPC too.  But it'd be nice if ppc folks can confirm the change.
>>> Sorry I've read the whole thread, but I'm still not entirely sure I
>>> understand the question.
>> Thanks for your time and sorry about not being clear enough.
>>
>> We found per-cpu events are not calling pmu::sched_task()
>> on context switches.  So PERF_ATTACH_SCHED_CB was
>> added to indicate the core logic that it needs to invoke the
>> callback.
>>
>> The patch 3/3 added the flag to PPC (for BHRB) with other
>> changes (I think it should be split like in the patch 2/3) and
>> want to get ACKs from the PPC folks.
> 
> Sorry for delay.
> 
> I guess first it will be better to split the ppc change to a separate 
> patch,

Both PPC and X86 invokes the perf_sched_cb_inc() directly. The patch 
changes the parameters of the perf_sched_cb_inc(). I think we have to 
update the PPC and X86 codes together. Otherwise, there will be a 
compile error, if someone may only applies the change for the 
perf_sched_cb_inc() but forget to applies the changes in PPC or X86 
specific codes.

> 
> secondly, we are missing the changes needed in the power_pmu_bhrb_disable()
> 
> where perf_sched_cb_dec() needs the "state" to be included.
> 

Ah, right. The below patch should fix the issue.

diff --git a/arch/powerpc/perf/core-book3s.c 
b/arch/powerpc/perf/core-book3s.c
index bced502f64a1..6756d1602a67 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -391,13 +391,18 @@ static void power_pmu_bhrb_enable(struct 
perf_event *event)
  static void power_pmu_bhrb_disable(struct perf_event *event)
  {
  	struct cpu_hw_events *cpuhw = this_cpu_ptr(&cpu_hw_events);
+	int state = PERF_SCHED_CB_SW_IN;

  	if (!ppmu->bhrb_nr)
  		return;

  	WARN_ON_ONCE(!cpuhw->bhrb_users);
  	cpuhw->bhrb_users--;
-	perf_sched_cb_dec(event->ctx->pmu);
+
+	if (!(event->attach_state & PERF_ATTACH_TASK))
+		state |= PERF_SCHED_CB_CPU;
+
+	perf_sched_cb_dec(event->ctx->pmu, state);

  	if (!cpuhw->disabled && !cpuhw->bhrb_users) {
  		/* BHRB cannot be turned off when other



Thanks,
Kan
