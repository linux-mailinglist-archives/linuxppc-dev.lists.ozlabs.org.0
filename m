Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3E174B51B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 18:27:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWwnA0eS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyJj160RQz3c5j
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 02:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QWwnA0eS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyJh558tFz3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 02:27:01 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367GGbeK029731;
	Fri, 7 Jul 2023 16:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UU3nFC2SRlQKL8TyQXB1iWY55iwOKgXGXzwl3vR9vrs=;
 b=QWwnA0eSBII1HSH8Y38mnhCFMa/6wZzbpALgx0S9UflkU+8Q6Q1QRxb04LMJWvHaWE+1
 Qp5LWf4AMnTh7rHXNR5v0K4ulflAKUOSijpQDA/kud/ECh6qB0y4NYG2R4fO48qLIP4H
 GfKFja/gYT1Vnn3XFbdOVMHxVRwRe4BkSNmvikWNtN4+pODGJu1BgMbEn6EhDmjQ+kgV
 UQKS6R6Kh7xxCGwolvdWefr1SfhB+wEKEBcDj8ZSj6b35iFDiPZHpl0LQhe4KuLXZ8PS
 ThKH/mWjbIXUWk0eIp/S/l1afidWT0mzuLfilWJdKshwF3sg1LxtRKzAAIY5wGrF225K rA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpp38g8p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:26:49 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 367GHNLu002772;
	Fri, 7 Jul 2023 16:26:49 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpp38g8ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:26:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 367EZ9nt014747;
	Fri, 7 Jul 2023 16:26:47 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs6e6mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 16:26:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 367GQkD4787034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 16:26:46 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 437B458050;
	Fri,  7 Jul 2023 16:26:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C993358045;
	Fri,  7 Jul 2023 16:26:39 +0000 (GMT)
Received: from [9.171.16.132] (unknown [9.171.16.132])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 16:26:39 +0000 (GMT)
Message-ID: <26bedea1-e616-1f82-31f5-9aedf16cab04@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2023 21:56:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Content-Language: en-US
To: Tobias Huschle <huschle@linux.ibm.com>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <20230515114601.12737-2-huschle@linux.ibm.com>
 <CAKfTPtC9050oY2EikUTAXTL8pAui3L+Sr4DBS0T-TccGNaA2hw@mail.gmail.com>
 <9021d4d99370162a815928cd6467f4a5@linux.ibm.com>
 <ZKUhPO3xcvCfjWfe@vingu-book>
 <12befe210503469beac9e711d9782675@linux.ibm.com>
 <27520864-3693-324e-717e-6bd628fb75ed@linux.vnet.ibm.com>
 <ede4cdbb5130826405e32a42c4985c6c@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <ede4cdbb5130826405e32a42c4985c6c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zpJQNpyXcr3EOQtvIvU69V_JfuqW2t9r
X-Proofpoint-ORIG-GUID: vrylh_bAzSyjN_QvQo2L3rrI57fl0eyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070149
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, Vincent Guittot <vincent.guittot@linaro.org>, srikar@linux.vnet.ibm.com, peterz@infradead.org, bristot@redhat.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, linuxppc-dev@lists.ozlabs.org, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/7/23 9:29 PM, Tobias Huschle wrote:
> On 2023-07-07 16:33, Shrikanth Hegde wrote:
>> On 7/7/23 1:14 PM, Tobias Huschle wrote:
>>> On 2023-07-05 09:52, Vincent Guittot wrote:
>>>> Le lundi 05 juin 2023 à 10:07:16 (+0200), Tobias Huschle a écrit :
>>>>> On 2023-05-16 15:36, Vincent Guittot wrote:
>>>>> > On Mon, 15 May 2023 at 13:46, Tobias Huschle <huschle@linux.ibm.com>
>>>>> > wrote:
>>>>> > >
>>>>> > > The current load balancer implementation implies that scheduler
>>>>> > > groups,
>>>>> > > within the same domain, all host the same number of CPUs. This is
>>>>> > > reflected in the condition, that a scheduler group, which is load
>>>>> > > balancing and classified as having spare capacity, should pull
>>>>> work
>>>>> > > from the busiest group, if the local group runs less processes
>>>>> than
>>>>> > > the busiest one. This implies that these two groups should run the
>>>>> > > same number of processes, which is problematic if the groups
>>>>> are not
>>>>> > > of the same size.
>>>>> > >
>>>>> > > The assumption that scheduler groups within the same scheduler
>>>>> domain
>>>>> > > host the same number of CPUs appears to be true for non-s390
>>>>> > > architectures. Nevertheless, s390 can have scheduler groups of
>>>>> unequal
>>>>> > > size.
>>>>> > >
>>>>> > > This introduces a performance degredation in the following
>>>>> scenario:
>>>>> > >
>>>>> > > Consider a system with 8 CPUs, 6 CPUs are located on one CPU
>>>>> socket,
>>>>> > > the remaining 2 are located on another socket:
>>>>> > >
>>>>> > > Socket   -----1-----    -2-
>>>>> > > CPU      1 2 3 4 5 6    7 8
>>>>> > >
>>>>> > > Placing some workload ( x = one task ) yields the following
>>>>> > > scenarios:
>>>>> > >
>>>>> > > The first 5 tasks are distributed evenly across the two groups.
>>>>> > >
>>>>> > > Socket   -----1-----    -2-
>>>>> > > CPU      1 2 3 4 5 6    7 8
>>>>> > >          x x x          x x
>>>>> > >
>>>>> > > Adding a 6th task yields the following distribution:
>>>>> > >
>>>>> > > Socket   -----1-----    -2-
>>>>> > > CPU      1 2 3 4 5 6    7 8
>>>>> > > SMT1     x x x          x x
>>>>> > > SMT2                    x
>>>>> >
>>>>> > Your description is a bit confusing for me. What you name CPU above
>>>>> > should be named Core, doesn' it ?
>>>>> >
>>>>> > Could you share with us your scheduler topology ?
>>>>> >
>>>>>
>>>>> You are correct, it should say core instead of CPU.
>>>>>
>>>>> One actual configuration from one of my test machines (lscpu -e):
>>>>>
>>>>
>>>> [...]
>>>>
>>>>>
>>>>> So, 6 cores / 12 CPUs in one group 2 cores / 4 CPUs in the other.
>>>>
>>>> Thaks for the details
>>>>
>>>>>
>>>>> If I run stress-ng with 8 cpu stressors on the original code I get a
>>>>> distribution
>>>>> like this:
>>>>>
>>>>> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>>>>>                 x     x     x     x      x  x  x  x
>>>>>
>>>>> Which means that the two cores in the smaller group are running
>>>>> into SMT
>>>>> while two
>>>>> cores in the larger group are still idle. This is caused by the
>>>>> prefer_sibling path
>>>>> which really wants to see both groups run the same number of tasks.
>>>>
>>>> yes and it considers that there are the same number of CPUs per group
>>>>
>>>>>
>>>>> > >
>>>>> > > The task is added to the 2nd scheduler group, as the scheduler
>>>>> has the
>>>>> > > assumption that scheduler groups are of the same size, so they
>>>>> should
>>>>> > > also host the same number of tasks. This makes CPU 7 run into SMT
>>>>> > > thread, which comes with a performance penalty. This means,
>>>>> that in
>>>>> > > the window of 6-8 tasks, load balancing is done suboptimally,
>>>>> because
>>>>> > > SMT is used although there is no reason to do so as fully idle
>>>>> CPUs
>>>>> > > are still available.
>>>>> > >
>>>>> > > Taking the weight of the scheduler groups into account, ensures
>>>>> that
>>>>> > > a load balancing CPU within a smaller group will not try to pull
>>>>> tasks
>>>>> > > from a bigger group while the bigger group still has idle CPUs
>>>>> > > available.
>>>>> > >
>>>>> > > Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
>>>>> > > ---
>>>>> > >  kernel/sched/fair.c | 3 ++-
>>>>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>> > >
>>>>> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>>>> > > index 48b6f0ca13ac..b1307d7e4065 100644
>>>>> > > --- a/kernel/sched/fair.c
>>>>> > > +++ b/kernel/sched/fair.c
>>>>> > > @@ -10426,7 +10426,8 @@ static struct sched_group
>>>>> > > *find_busiest_group(struct lb_env *env)
>>>>> > >          * group's child domain.
>>>>> > >          */
>>>>> > >         if (sds.prefer_sibling && local->group_type ==
>>>>> > > group_has_spare &&
>>>>> > > -           busiest->sum_nr_running > local->sum_nr_running + 1)
>>>>> > > +           busiest->sum_nr_running * local->group_weight >
>>>>> > > +                       local->sum_nr_running *
>>>>> > > busiest->group_weight + 1)
>>>>
>>>>
>>>> what you want to test here is that moving 1 task from busiest to local
>>>> group
>>>> would help and balance the ratio of tasks per cpu
>>>>
>>>> (busiest->sum_nr_running - 1) / busiest->group_weight >
>>>> (local->sum_nr_running + 1) / local->group_weight
>>>>
>>>> which can be develop into
>>>>
>>>> busiest->sum_nr_running * local->group_weight >= local->sum_nr_running
>>>> * busiest->group_weight + busiest->group_weight + local->group_weight
>>>>
>>>> and you also have to change how we calculate the imbalance which just
>>>> provide the half of the diff of nr_running
>>>>
>>>> by something like
>>>>
>>>> (busiest->sum_nr_running * local->group_weight) -
>>>> (local->sum_nr_running * busiest->group_weight) /
>>>> (busiest->group_weight + local->group_weight)
>>>>
>>>
>>> Ahh right, I had a look at the imbalance part now and your suggestion
>>> works
>>> pretty well. Just had to make some minor adjustments so far.
>>> Nice side effect is, that this allows the load balancer to behave
>>> exactly the
>>> same as before in the cases where local->group_weight ==
>>> busiest->group_weight.
>>> The behavior only changes for the case where the groups are not of equal
>>> size.
>>
>>
>> Not sure if it has been figured/discussed out already, pointing one
>> possible scenario.
>>
>> Taking the formulas:
>> busiest->sum_nr_running * local->group_weight >= local->sum_nr_running
>> * busiest->group_weight + busiest->group_weight + local->group_weight
>> and calulate_imbalance:
>> (busiest->sum_nr_running * local->group_weight) -
>> (local->sum_nr_running * busiest->group_weight) /
>> (busiest->group_weight + local->group_weight)
>>
> 
> I was considering to just use the imbalance as an indicator whether we
> should
> balance or not, i.e. check if the second formula yields a value greater
> than 0.
> Will have to play around with that a bit though.
> 
>>
>> First lets say imbalance was like this. same example as before.
>> sched_group in [busy_cpus/idle_cpus/group_weight]
>> [3/9/12] - local group.
>> [3/1/4] - busy group.
>>
>> 3*12 >= 3*4+12+4 --> true and imbalance would be (3*12-3*4)/(12+4) --
>> 24/16 >> 1 -- lets say 1.
>> we will balance, good.
>>
>> [4/8/12]
>> [2/2/4]
>> There will not be further load balances. good.
>>
>> a new process comes, it would be scheduled on [4/8/120 sched group as
>> that would be idlest.
>> [5/7/12]
>> [2/2/4]
>>
>> Process running on [2/2/4] exits. then in this scenario do you expect
>> the balance to happen again? Since balancing would result into optimal
>> performance.
>> [5/7/12] - busy_group
>> [1/3/4] - local group
>>
>> 5*4 >= 1*12+12+4 --> will not balance.
>>
>> [5/7/12] - local group
>> [1/3/4] - busy group
>> 1*12 >= 5*4 + 12 + 4 --> will not balance.
>>
>> Is this scenario needs to be handled as well?
> 
> So, from an SMT standpoint, we would not need to balance here, both groups
> should not run into SMT. Now, would it be beneficial to balance anyway?
> Now we have:
> [5/7/12] -> 42% busy
> [1/3/4]  -> 25% busy
> 
> If we would now balance and move one task around we would get either
> [6/6/12] -> 50% busy
> [0/4/4]  ->  0% busy
> or
> [4/8/12] -> 33% busy
> [2/2/4]  -> 50% busy
> 
> The first case does probably not make that much sense (unless we have
> workload
> which would benefit from maybe cache locality) and we want everything to
> run
> in one group.
> The second case brings the smaller group right onto the edge of using
> SMT, while
> also creating the possibility (depending on the algorithm we would use),
> that
> now the larger group will attempt to pull work from the smaller group
> again,
> ending up in a back and forth between the two. This is obviously also
> true for
> the first variant.
> 
> Could you maybe elaborate on what you meant by optimal performance?
> 

I assumed it might be optimal to have have both group run more or less 
similar utilization point. 

Now, that i read your description, it makes sense. load balance may not be needed
in this case. Did a few combinations for the check to balance condition. I think 
it holds good. ( Haven't done all the case). Sorry for the noise. 


>>
>>>
>>> I will figure out a solution and send a patch soon which incorporates
>>> these
>>> adjustments plus a more detailed description.
>>>
>>> Thanks for the feedback.
>>>
>>>>> >
>>>>> > This is the prefer_sibling path. Could it be that you should disable
>>>>> > prefer_siling between your sockets for such topology ? the default
>>>>> > path compares the number of idle CPUs when groups has spare capacity
>>>>> >
>>>>> >
>>>>>
>>>>> If I disable prefer_sibling (I played around with it a bit), I run
>>>>> into the
>>>>> problem,
>>>>> that the tasks are distributed s.t. each group has the same amount of
>>>>> idle
>>>>> CPUs, which
>>>>> yields distributions similar to this:
>>>>>
>>>>> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>>>>>     x  x  x     x  x     x     x  x
>>>>>
>>>>> Now both groups have 4 idle CPUs which fulfills the criteria imposed
>>>>> by the
>>>>> load balancer,
>>>>> but the larger group is now running SMT while the smaller one is just
>>>>> idle.
>>>>>
>>>>> So, in this asymmetric setup, both criteria seem to not work in an
>>>>> optimal
>>>>> way. Going for
>>>>> the same number of idle CPUs or alternatively for the same number of
>>>>> running
>>>>> processes
>>>>> both cause a sub-optimal distribution of tasks, leading to
>>>>> unnecessary SMT.
>>>>
>>>> there is the same behavior and assumption here too
>>>>
>>>>
>>>>>
>>>>> It seems also to be possible to address the regular load balancing
>>>>> path by
>>>>> aiming to have the
>>>>> same unused capacity between groups instead of the same number of
>>>>> idle CPUs.
>>>>> This seems to
>>>>> have been considered in the past, but the choice went in favor of the
>>>>> number
>>>>> of idle CPUs.
>>>>
>>>> unused capacity doesn't give the instantaneous state so a group can be
>>>> idle but without
>>>> unused capacity
>>>>
>>>>> Since this decision was actively taken already, I focused on the
>>>>> prefer_sibling path.
>>>>>
>>>>> The question now would be how to address this properly (or if I'm
>>>>> missing
>>>>> something here).
>>>>> As mentioned in the cover letter, this was the most simplistic and
>>>>> least
>>>>> invasive approach
>>>>> I could find, others might be more sophisticated but also have some
>>>>> side-effects.
>>>>>
>>>>> I have a bit of a hard time leaving this one as-is, as it just
>>>>> introduces
>>>>> two additional
>>>>> multiplications with no effect for most architectures. Maybe an
>>>>> architectures specific
>>>>> inline function that the compiler can optimize away if not needed?
>>>>>
>>>>> > >                 goto force_balance;
>>>>> > >
>>>>> > >         if (busiest->group_type != group_overloaded) {
>>>>> > > --
>>>>> > > 2.34.1
>>>>> > >
>>>>>
