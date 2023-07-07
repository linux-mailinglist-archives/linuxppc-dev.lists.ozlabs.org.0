Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EEE874B31A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 16:34:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+4vWnjF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QyGBY0gXLz3cBG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jul 2023 00:34:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+4vWnjF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QyG9g2Wtfz30fL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jul 2023 00:33:59 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 367EMRrQ011692;
	Fri, 7 Jul 2023 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+h69f4EjpCXMPQsjfXmi+MajyQ8uint8SFc0+QUY2nU=;
 b=X+4vWnjF3Zk1i3w+J6J3V+TN82tJWTBxA3uBLvdHEkWYQh9p536CDTJ5c15ILwZJIE38
 Gokhh2b+XUiF9lcT4vuckQpVYfWkkAzhtUVyIPdMKX2VuC8y7PwRUYcjQyL0YP2kLzaV
 BeAVeb0dUOCOpT+CzPP76AQgPtB4Cp3iY6DXbldIaGipm7l4zqe9Wr0BiUAnz4iHsGVm
 7o6cW5AwGYwTu+lzY1U5m0OIs83yaPQCRpLEPEXyyKo/72drQzH3NvXnIyDLVxa0JAwq
 BiV0cS9ELP84KQB9jxgap4apXfJH16qw0QLSTyFAaBI6RuFQ0bRDjn1+t6qQS8INgjqy Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpmdp095m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:33:48 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 367EOKmL018561;
	Fri, 7 Jul 2023 14:33:48 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rpmdp091t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:33:48 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 367ARgvI014742;
	Fri, 7 Jul 2023 14:33:45 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([9.208.129.120])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs6dt56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jul 2023 14:33:45 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 367EXiJu55116158
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Jul 2023 14:33:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B3E158050;
	Fri,  7 Jul 2023 14:33:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE3B358045;
	Fri,  7 Jul 2023 14:33:37 +0000 (GMT)
Received: from [9.171.16.132] (unknown [9.171.16.132])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Jul 2023 14:33:37 +0000 (GMT)
Message-ID: <27520864-3693-324e-717e-6bd628fb75ed@linux.vnet.ibm.com>
Date: Fri, 7 Jul 2023 20:03:35 +0530
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
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <12befe210503469beac9e711d9782675@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qi0hI_Bu7W-f-QNkY6ByvcWguMHRPDQd
X-Proofpoint-ORIG-GUID: EcU9vge5MgG05dS5AKBD3htIMNUskalD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_10,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307070134
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



On 7/7/23 1:14 PM, Tobias Huschle wrote:
> On 2023-07-05 09:52, Vincent Guittot wrote:
>> Le lundi 05 juin 2023 à 10:07:16 (+0200), Tobias Huschle a écrit :
>>> On 2023-05-16 15:36, Vincent Guittot wrote:
>>> > On Mon, 15 May 2023 at 13:46, Tobias Huschle <huschle@linux.ibm.com>
>>> > wrote:
>>> > >
>>> > > The current load balancer implementation implies that scheduler
>>> > > groups,
>>> > > within the same domain, all host the same number of CPUs. This is
>>> > > reflected in the condition, that a scheduler group, which is load
>>> > > balancing and classified as having spare capacity, should pull work
>>> > > from the busiest group, if the local group runs less processes than
>>> > > the busiest one. This implies that these two groups should run the
>>> > > same number of processes, which is problematic if the groups are not
>>> > > of the same size.
>>> > >
>>> > > The assumption that scheduler groups within the same scheduler
>>> domain
>>> > > host the same number of CPUs appears to be true for non-s390
>>> > > architectures. Nevertheless, s390 can have scheduler groups of
>>> unequal
>>> > > size.
>>> > >
>>> > > This introduces a performance degredation in the following scenario:
>>> > >
>>> > > Consider a system with 8 CPUs, 6 CPUs are located on one CPU socket,
>>> > > the remaining 2 are located on another socket:
>>> > >
>>> > > Socket   -----1-----    -2-
>>> > > CPU      1 2 3 4 5 6    7 8
>>> > >
>>> > > Placing some workload ( x = one task ) yields the following
>>> > > scenarios:
>>> > >
>>> > > The first 5 tasks are distributed evenly across the two groups.
>>> > >
>>> > > Socket   -----1-----    -2-
>>> > > CPU      1 2 3 4 5 6    7 8
>>> > >          x x x          x x
>>> > >
>>> > > Adding a 6th task yields the following distribution:
>>> > >
>>> > > Socket   -----1-----    -2-
>>> > > CPU      1 2 3 4 5 6    7 8
>>> > > SMT1     x x x          x x
>>> > > SMT2                    x
>>> >
>>> > Your description is a bit confusing for me. What you name CPU above
>>> > should be named Core, doesn' it ?
>>> >
>>> > Could you share with us your scheduler topology ?
>>> >
>>>
>>> You are correct, it should say core instead of CPU.
>>>
>>> One actual configuration from one of my test machines (lscpu -e):
>>>
>>
>> [...]
>>
>>>
>>> So, 6 cores / 12 CPUs in one group 2 cores / 4 CPUs in the other.
>>
>> Thaks for the details
>>
>>>
>>> If I run stress-ng with 8 cpu stressors on the original code I get a
>>> distribution
>>> like this:
>>>
>>> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>>>                 x     x     x     x      x  x  x  x
>>>
>>> Which means that the two cores in the smaller group are running into SMT
>>> while two
>>> cores in the larger group are still idle. This is caused by the
>>> prefer_sibling path
>>> which really wants to see both groups run the same number of tasks.
>>
>> yes and it considers that there are the same number of CPUs per group
>>
>>>
>>> > >
>>> > > The task is added to the 2nd scheduler group, as the scheduler
>>> has the
>>> > > assumption that scheduler groups are of the same size, so they
>>> should
>>> > > also host the same number of tasks. This makes CPU 7 run into SMT
>>> > > thread, which comes with a performance penalty. This means, that in
>>> > > the window of 6-8 tasks, load balancing is done suboptimally,
>>> because
>>> > > SMT is used although there is no reason to do so as fully idle CPUs
>>> > > are still available.
>>> > >
>>> > > Taking the weight of the scheduler groups into account, ensures that
>>> > > a load balancing CPU within a smaller group will not try to pull
>>> tasks
>>> > > from a bigger group while the bigger group still has idle CPUs
>>> > > available.
>>> > >
>>> > > Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
>>> > > ---
>>> > >  kernel/sched/fair.c | 3 ++-
>>> > >  1 file changed, 2 insertions(+), 1 deletion(-)
>>> > >
>>> > > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>>> > > index 48b6f0ca13ac..b1307d7e4065 100644
>>> > > --- a/kernel/sched/fair.c
>>> > > +++ b/kernel/sched/fair.c
>>> > > @@ -10426,7 +10426,8 @@ static struct sched_group
>>> > > *find_busiest_group(struct lb_env *env)
>>> > >          * group's child domain.
>>> > >          */
>>> > >         if (sds.prefer_sibling && local->group_type ==
>>> > > group_has_spare &&
>>> > > -           busiest->sum_nr_running > local->sum_nr_running + 1)
>>> > > +           busiest->sum_nr_running * local->group_weight >
>>> > > +                       local->sum_nr_running *
>>> > > busiest->group_weight + 1)
>>
>>
>> what you want to test here is that moving 1 task from busiest to local
>> group
>> would help and balance the ratio of tasks per cpu
>>
>> (busiest->sum_nr_running - 1) / busiest->group_weight >
>> (local->sum_nr_running + 1) / local->group_weight
>>
>> which can be develop into
>>
>> busiest->sum_nr_running * local->group_weight >= local->sum_nr_running
>> * busiest->group_weight + busiest->group_weight + local->group_weight
>>
>> and you also have to change how we calculate the imbalance which just
>> provide the half of the diff of nr_running
>>
>> by something like
>>
>> (busiest->sum_nr_running * local->group_weight) -
>> (local->sum_nr_running * busiest->group_weight) /
>> (busiest->group_weight + local->group_weight)
>>
> 
> Ahh right, I had a look at the imbalance part now and your suggestion works
> pretty well. Just had to make some minor adjustments so far.
> Nice side effect is, that this allows the load balancer to behave
> exactly the
> same as before in the cases where local->group_weight ==
> busiest->group_weight.
> The behavior only changes for the case where the groups are not of equal
> size.


Not sure if it has been figured/discussed out already, pointing one possible scenario. 

Taking the formulas:
busiest->sum_nr_running * local->group_weight >= local->sum_nr_running * busiest->group_weight + busiest->group_weight + local->group_weight
and calulate_imbalance:
(busiest->sum_nr_running * local->group_weight) - (local->sum_nr_running * busiest->group_weight) / (busiest->group_weight + local->group_weight)


First lets say imbalance was like this. same example as before. sched_group in [busy_cpus/idle_cpus/group_weight]
[3/9/12] - local group.
[3/1/4] - busy group.

3*12 >= 3*4+12+4 --> true and imbalance would be (3*12-3*4)/(12+4) -- 24/16 >> 1 -- lets say 1. 
we will balance, good.

[4/8/12] 
[2/2/4] 
There will not be further load balances. good.

a new process comes, it would be scheduled on [4/8/120 sched group as that would be idlest. 
[5/7/12] 
[2/2/4] 

Process running on [2/2/4] exits. then in this scenario do you expect the balance to happen again? Since balancing would result into optimal performance.
[5/7/12] - busy_group
[1/3/4] - local group

5*4 >= 1*12+12+4 --> will not balance. 

[5/7/12] - local group
[1/3/4] - busy group 
1*12 >= 5*4 + 12 + 4 --> will not balance. 

Is this scenario needs to be handled as well?

> 
> I will figure out a solution and send a patch soon which incorporates these
> adjustments plus a more detailed description.
> 
> Thanks for the feedback.
> 
>>> >
>>> > This is the prefer_sibling path. Could it be that you should disable
>>> > prefer_siling between your sockets for such topology ? the default
>>> > path compares the number of idle CPUs when groups has spare capacity
>>> >
>>> >
>>>
>>> If I disable prefer_sibling (I played around with it a bit), I run
>>> into the
>>> problem,
>>> that the tasks are distributed s.t. each group has the same amount of
>>> idle
>>> CPUs, which
>>> yields distributions similar to this:
>>>
>>> 00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
>>>     x  x  x     x  x     x     x  x
>>>
>>> Now both groups have 4 idle CPUs which fulfills the criteria imposed
>>> by the
>>> load balancer,
>>> but the larger group is now running SMT while the smaller one is just
>>> idle.
>>>
>>> So, in this asymmetric setup, both criteria seem to not work in an
>>> optimal
>>> way. Going for
>>> the same number of idle CPUs or alternatively for the same number of
>>> running
>>> processes
>>> both cause a sub-optimal distribution of tasks, leading to
>>> unnecessary SMT.
>>
>> there is the same behavior and assumption here too
>>
>>
>>>
>>> It seems also to be possible to address the regular load balancing
>>> path by
>>> aiming to have the
>>> same unused capacity between groups instead of the same number of
>>> idle CPUs.
>>> This seems to
>>> have been considered in the past, but the choice went in favor of the
>>> number
>>> of idle CPUs.
>>
>> unused capacity doesn't give the instantaneous state so a group can be
>> idle but without
>> unused capacity
>>
>>> Since this decision was actively taken already, I focused on the
>>> prefer_sibling path.
>>>
>>> The question now would be how to address this properly (or if I'm
>>> missing
>>> something here).
>>> As mentioned in the cover letter, this was the most simplistic and least
>>> invasive approach
>>> I could find, others might be more sophisticated but also have some
>>> side-effects.
>>>
>>> I have a bit of a hard time leaving this one as-is, as it just
>>> introduces
>>> two additional
>>> multiplications with no effect for most architectures. Maybe an
>>> architectures specific
>>> inline function that the compiler can optimize away if not needed?
>>>
>>> > >                 goto force_balance;
>>> > >
>>> > >         if (busiest->group_type != group_overloaded) {
>>> > > --
>>> > > 2.34.1
>>> > >
>>>
