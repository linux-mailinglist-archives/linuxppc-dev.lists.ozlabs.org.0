Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A72722090
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 10:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZR7W4k87z3f7d
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 18:08:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJs4vaCQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJs4vaCQ;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZR6b4JZmz3dsW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Jun 2023 18:07:35 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3557bfQL002583;
	Mon, 5 Jun 2023 08:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=VGFfgmCUNPKnWMgtaYy+cB6Xt5WtNY0IFs9ynRDJG0I=;
 b=JJs4vaCQEBT6Szq6oi5p2Gs+NSubCNy8hT0EfgbLa0cgBnebX+S9IHQLjDLCgGw7q2oW
 GTM6UCoPrNhA+bOGJsHfvM1Olv+FA8n/tUiQdYNR0jifGX9UfcvT7DUrTwOIg5t7dGUf
 QKp8BSyxZMdYXKQ83kkpPdlz+cy3S0TC2v03tY9dx1HipMoY7WtjzblOmkrylL8vGqZc
 9J/DSXUF3Ge4pE1Jsno97OAHE+4IWtMhcBUdBgnxmYw68ZEXZK4SNDtwjLOtzGweu4nA
 RUl03W/V+tXVCg0NCnbuRGjsmD4d39K0NhISGtF336e8X/Hv/vPlXfne6Z7Ehuem1fWT WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1av59q6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 08:07:19 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3557eRRI011929;
	Mon, 5 Jun 2023 08:07:19 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1av59q64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 08:07:19 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3555YOrO013581;
	Mon, 5 Jun 2023 08:07:18 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3qyxqqnwqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Jun 2023 08:07:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35587HFh65798438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Jun 2023 08:07:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728135805F;
	Mon,  5 Jun 2023 08:07:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E846958051;
	Mon,  5 Jun 2023 08:07:16 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Jun 2023 08:07:16 +0000 (GMT)
MIME-Version: 1.0
Date: Mon, 05 Jun 2023 10:07:16 +0200
From: Tobias Huschle <huschle@linux.ibm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
In-Reply-To: <CAKfTPtC9050oY2EikUTAXTL8pAui3L+Sr4DBS0T-TccGNaA2hw@mail.gmail.com>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <20230515114601.12737-2-huschle@linux.ibm.com>
 <CAKfTPtC9050oY2EikUTAXTL8pAui3L+Sr4DBS0T-TccGNaA2hw@mail.gmail.com>
Message-ID: <9021d4d99370162a815928cd6467f4a5@linux.ibm.com>
X-Sender: huschle@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MB30DaVDVCMEslEZRMLGqSesKPedI8F3
X-Proofpoint-ORIG-GUID: JD4odwECYJOqrC5fnWrrh_5QIyYK37dW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-03_08,2023-06-02_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1011 phishscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306050072
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-05-16 15:36, Vincent Guittot wrote:
> On Mon, 15 May 2023 at 13:46, Tobias Huschle <huschle@linux.ibm.com> 
> wrote:
>> 
>> The current load balancer implementation implies that scheduler 
>> groups,
>> within the same domain, all host the same number of CPUs. This is
>> reflected in the condition, that a scheduler group, which is load
>> balancing and classified as having spare capacity, should pull work
>> from the busiest group, if the local group runs less processes than
>> the busiest one. This implies that these two groups should run the
>> same number of processes, which is problematic if the groups are not
>> of the same size.
>> 
>> The assumption that scheduler groups within the same scheduler domain
>> host the same number of CPUs appears to be true for non-s390
>> architectures. Nevertheless, s390 can have scheduler groups of unequal
>> size.
>> 
>> This introduces a performance degredation in the following scenario:
>> 
>> Consider a system with 8 CPUs, 6 CPUs are located on one CPU socket,
>> the remaining 2 are located on another socket:
>> 
>> Socket   -----1-----    -2-
>> CPU      1 2 3 4 5 6    7 8
>> 
>> Placing some workload ( x = one task ) yields the following
>> scenarios:
>> 
>> The first 5 tasks are distributed evenly across the two groups.
>> 
>> Socket   -----1-----    -2-
>> CPU      1 2 3 4 5 6    7 8
>>          x x x          x x
>> 
>> Adding a 6th task yields the following distribution:
>> 
>> Socket   -----1-----    -2-
>> CPU      1 2 3 4 5 6    7 8
>> SMT1     x x x          x x
>> SMT2                    x
> 
> Your description is a bit confusing for me. What you name CPU above
> should be named Core, doesn' it ?
> 
> Could you share with us your scheduler topology ?
> 

You are correct, it should say core instead of CPU.

One actual configuration from one of my test machines (lscpu -e):

CPU NODE DRAWER BOOK SOCKET CORE L1d:L1i:L2 ONLINE CONFIGURED 
POLARIZATION ADDRESS
   0    0      0    0      0    0 0:0:0         yes yes        horizontal 
   0
   1    0      0    0      0    0 1:1:0         yes yes        horizontal 
   1
   2    0      0    0      0    1 2:2:0         yes yes        horizontal 
   2
   3    0      0    0      0    1 3:3:0         yes yes        horizontal 
   3
   4    0      0    0      0    2 4:4:0         yes yes        horizontal 
   4
   5    0      0    0      0    2 5:5:0         yes yes        horizontal 
   5
   6    0      0    0      0    3 6:6:0         yes yes        horizontal 
   6
   7    0      0    0      0    3 7:7:0         yes yes        horizontal 
   7
   8    0      0    0      0    4 8:8:0         yes yes        horizontal 
   8
   9    0      0    0      0    4 9:9:0         yes yes        horizontal 
   9
  10    0      0    0      0    5 10:10:0       yes yes        horizontal 
   10
  11    0      0    0      0    5 11:11:0       yes yes        horizontal 
   11
  12    0      0    0      1    6 12:12:0       yes yes        horizontal 
   12
  13    0      0    0      1    6 13:13:0       yes yes        horizontal 
   13
  14    0      0    0      1    7 14:14:0       yes yes        horizontal 
   14
  15    0      0    0      1    7 15:15:0       yes yes        horizontal 
   15

So, 6 cores / 12 CPUs in one group 2 cores / 4 CPUs in the other.

If I run stress-ng with 8 cpu stressors on the original code I get a 
distribution
like this:

00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
                 x     x     x     x      x  x  x  x

Which means that the two cores in the smaller group are running into SMT 
while two
cores in the larger group are still idle. This is caused by the 
prefer_sibling path
which really wants to see both groups run the same number of tasks.

>> 
>> The task is added to the 2nd scheduler group, as the scheduler has the
>> assumption that scheduler groups are of the same size, so they should
>> also host the same number of tasks. This makes CPU 7 run into SMT
>> thread, which comes with a performance penalty. This means, that in
>> the window of 6-8 tasks, load balancing is done suboptimally, because
>> SMT is used although there is no reason to do so as fully idle CPUs
>> are still available.
>> 
>> Taking the weight of the scheduler groups into account, ensures that
>> a load balancing CPU within a smaller group will not try to pull tasks
>> from a bigger group while the bigger group still has idle CPUs
>> available.
>> 
>> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
>> ---
>>  kernel/sched/fair.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
>> index 48b6f0ca13ac..b1307d7e4065 100644
>> --- a/kernel/sched/fair.c
>> +++ b/kernel/sched/fair.c
>> @@ -10426,7 +10426,8 @@ static struct sched_group 
>> *find_busiest_group(struct lb_env *env)
>>          * group's child domain.
>>          */
>>         if (sds.prefer_sibling && local->group_type == group_has_spare 
>> &&
>> -           busiest->sum_nr_running > local->sum_nr_running + 1)
>> +           busiest->sum_nr_running * local->group_weight >
>> +                       local->sum_nr_running * busiest->group_weight 
>> + 1)
> 
> This is the prefer_sibling path. Could it be that you should disable
> prefer_siling between your sockets for such topology ? the default
> path compares the number of idle CPUs when groups has spare capacity
> 
> 

If I disable prefer_sibling (I played around with it a bit), I run into 
the problem,
that the tasks are distributed s.t. each group has the same amount of 
idle CPUs, which
yields distributions similar to this:

00 01 02 03 04 05 06 07 08 09 10 11  || 12 13 14 15
     x  x  x     x  x     x     x  x

Now both groups have 4 idle CPUs which fulfills the criteria imposed by 
the load balancer,
but the larger group is now running SMT while the smaller one is just 
idle.

So, in this asymmetric setup, both criteria seem to not work in an 
optimal way. Going for
the same number of idle CPUs or alternatively for the same number of 
running processes
both cause a sub-optimal distribution of tasks, leading to unnecessary 
SMT.

It seems also to be possible to address the regular load balancing path 
by aiming to have the
same unused capacity between groups instead of the same number of idle 
CPUs. This seems to
have been considered in the past, but the choice went in favor of the 
number of idle CPUs.
Since this decision was actively taken already, I focused on the 
prefer_sibling path.

The question now would be how to address this properly (or if I'm 
missing something here).
As mentioned in the cover letter, this was the most simplistic and least 
invasive approach
I could find, others might be more sophisticated but also have some 
side-effects.

I have a bit of a hard time leaving this one as-is, as it just 
introduces two additional
multiplications with no effect for most architectures. Maybe an 
architectures specific
inline function that the compiler can optimize away if not needed?

>>                 goto force_balance;
>> 
>>         if (busiest->group_type != group_overloaded) {
>> --
>> 2.34.1
>> 

