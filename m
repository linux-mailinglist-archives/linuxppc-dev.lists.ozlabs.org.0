Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C702D2C1DAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 06:45:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgCf634XGzDqSg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 16:45:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=YZcMO95H; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgCcJ4dm6zDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 16:43:25 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AO5WJTD171722; Tue, 24 Nov 2020 00:43:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fJEmXiZC2Ll3yueLXLw6WuHgsucJaOyaptCDRZskbRM=;
 b=YZcMO95Hq2GBsN3HSWyZTd8xiIdcMIVGZvwoRsxaHOWCIqXPVB+Tc0KDsa6xg+4HyjmH
 pVOucz0hk21FWxojnADI3Tq3g2EwZR3Du6hT5MA3qprIS9kr2rIFj/nd84LEWdgmAcHO
 EiIa0X8VtzhtEzM6fyPxUsQgrJSpdFkEx/hlQamnmZCBpQYxzvyxutJpMZ3fuLwOp6jE
 31wzd69q9dkKOwNBBBR6BAI3dngfgME5HzT+Zm19PBSbGLXnZ0yM4IAtRSmkCkJarF6b
 Kqlxximt4DXDVpBoCUi6stgm5RIoc1dDydkvV1YwP1zKQv9vRGegQOF41+PIOXDWdkw3 nQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350rnadeyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 00:43:07 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AO5XPBe178340;
 Tue, 24 Nov 2020 00:43:07 -0500
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 350rnadext-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 00:43:07 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AO5VU0d025276;
 Tue, 24 Nov 2020 05:43:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 34xth89ndf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 05:43:05 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AO5h3Mx48234914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 05:43:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 06F2A11C050;
 Tue, 24 Nov 2020 05:43:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4021411C04A;
 Tue, 24 Nov 2020 05:43:00 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.108.160])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 05:43:00 +0000 (GMT)
Subject: Re: [PATCH 1/3] perf/core: Flush PMU internal buffers for per-CPU
 events
To: Namhyung Kim <namhyung@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
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
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <9657dc9f-e1a9-eb7e-8ac2-a108416d5a10@linux.ibm.com>
Date: Tue, 24 Nov 2020 11:12:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAM9d7cg8kYMyPHQK_rhEiYQaSddqqt93=pLVNKJm8Y6F=if9ow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_01:2020-11-24,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 suspectscore=0 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011240029
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
 Ingo Molnar <mingo@kernel.org>, Gabriel Marin <gmx@google.com>, "Liang,
 Kan" <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/24/20 10:21 AM, Namhyung Kim wrote:
> Hello,
>
> On Mon, Nov 23, 2020 at 8:00 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Namhyung Kim <namhyung@kernel.org> writes:
>>> Hi Peter and Kan,
>>>
>>> (Adding PPC folks)
>>>
>>> On Tue, Nov 17, 2020 at 2:01 PM Namhyung Kim <namhyung@kernel.org> wrote:
>>>> Hello,
>>>>
>>>> On Thu, Nov 12, 2020 at 4:54 AM Liang, Kan <kan.liang@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>> On 11/11/2020 11:25 AM, Peter Zijlstra wrote:
>>>>>> On Mon, Nov 09, 2020 at 09:49:31AM -0500, Liang, Kan wrote:
>>>>>>
>>>>>>> - When the large PEBS was introduced (9c964efa4330), the sched_task() should
>>>>>>> be invoked to flush the PEBS buffer in each context switch. However, The
>>>>>>> perf_sched_events in account_event() is not updated accordingly. The
>>>>>>> perf_event_task_sched_* never be invoked for a pure per-CPU context. Only
>>>>>>> per-task event works.
>>>>>>>      At that time, the perf_pmu_sched_task() is outside of
>>>>>>> perf_event_context_sched_in/out. It means that perf has to double
>>>>>>> perf_pmu_disable() for per-task event.
>>>>>>> - The patch 1 tries to fix broken per-CPU events. The CPU context cannot be
>>>>>>> retrieved from the task->perf_event_ctxp. So it has to be tracked in the
>>>>>>> sched_cb_list. Yes, the code is very similar to the original codes, but it
>>>>>>> is actually the new code for per-CPU events. The optimization for per-task
>>>>>>> events is still kept.
>>>>>>>     For the case, which has both a CPU context and a task context, yes, the
>>>>>>> __perf_pmu_sched_task() in this patch is not invoked. Because the
>>>>>>> sched_task() only need to be invoked once in a context switch. The
>>>>>>> sched_task() will be eventually invoked in the task context.
>>>>>> The thing is; your first two patches rely on PERF_ATTACH_SCHED_CB and
>>>>>> only set that for large pebs. Are you sure the other users (Intel LBR
>>>>>> and PowerPC BHRB) don't need it?
>>>>> I didn't set it for LBR, because the perf_sched_events is always enabled
>>>>> for LBR. But, yes, we should explicitly set the PERF_ATTACH_SCHED_CB
>>>>> for LBR.
>>>>>
>>>>>          if (has_branch_stack(event))
>>>>>                  inc = true;
>>>>>
>>>>>> If they indeed do not require the pmu::sched_task() callback for CPU
>>>>>> events, then I still think the whole perf_sched_cb_{inc,dec}() interface
>>>>> No, LBR requires the pmu::sched_task() callback for CPU events.
>>>>>
>>>>> Now, The LBR registers have to be reset in sched in even for CPU events.
>>>>>
>>>>> To fix the shorter LBR callstack issue for CPU events, we also need to
>>>>> save/restore LBRs in pmu::sched_task().
>>>>> https://lore.kernel.org/lkml/1578495789-95006-4-git-send-email-kan.liang@linux.intel.com/
>>>>>
>>>>>> is confusing at best.
>>>>>>
>>>>>> Can't we do something like this instead?
>>>>>>
>>>>> I think the below patch may have two issues.
>>>>> - PERF_ATTACH_SCHED_CB is required for LBR (maybe PowerPC BHRB as well) now.
>>>>> - We may disable the large PEBS later if not all PEBS events support
>>>>> large PEBS. The PMU need a way to notify the generic code to decrease
>>>>> the nr_sched_task.
>>>> Any updates on this?  I've reviewed and tested Kan's patches
>>>> and they all look good.
>>>>
>>>> Maybe we can talk to PPC folks to confirm the BHRB case?
>>> Can we move this forward?  I saw patch 3/3 also adds PERF_ATTACH_SCHED_CB
>>> for PowerPC too.  But it'd be nice if ppc folks can confirm the change.
>> Sorry I've read the whole thread, but I'm still not entirely sure I
>> understand the question.
> Thanks for your time and sorry about not being clear enough.
>
> We found per-cpu events are not calling pmu::sched_task()
> on context switches.  So PERF_ATTACH_SCHED_CB was
> added to indicate the core logic that it needs to invoke the
> callback.
>
> The patch 3/3 added the flag to PPC (for BHRB) with other
> changes (I think it should be split like in the patch 2/3) and
> want to get ACKs from the PPC folks.

Sorry for delay.

I guess first it will be better to split the ppc change to a separate patch,

secondly, we are missing the changes needed in the power_pmu_bhrb_disable()

where perf_sched_cb_dec() needs the "state" to be included.


Maddy


>
> Thanks,
> Namhyung
