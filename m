Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C5874A307
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:20:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psC8RYW6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxjwg3zcJz3c5S
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 03:20:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psC8RYW6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxjvl4ykWz3brp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 03:20:03 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366HGguZ018549;
	Thu, 6 Jul 2023 17:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=fpbgZAypLVutubvEgDeOpjatjldLvtjIaN/4OpbK9+I=;
 b=psC8RYW6ioXS1IY7+GSiRTzwM3nOZ/ZrFdflPoKjzUJRK1Bz2Z3eHo2eIs4o4DYCIlW+
 /4ViQc9okqDerplACGpEj2MDqSQqAyduVsxRP1WRt7SQhRiGkDlUkoxYn+YusNIA8Wr/
 mM8yBMem/Jnef+/p7DaTDhgMH23Nw0JK2sNKxnwcvUwCdBk713uqsX0dgBLMJqDSmviX
 aFeqvCqeraYwx0q+3nh9XBnJvA94lOjkeUQFE34jQzbnOe7OzVy3j7ln2NkITy+eAnMq
 Wjq9x04vKCqSCPD0XqeVb9ybm2XSbMn/nl9e2DcAJDmDj02tjFrhVtzkMgS2S/GeVmV5 hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp1v8030r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 17:19:45 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 366HGw13019423;
	Thu, 6 Jul 2023 17:19:45 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp1v80302-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 17:19:45 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 366Gdw4x017203;
	Thu, 6 Jul 2023 17:19:43 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3rjbs61pd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 17:19:43 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 366HJh8f60555728
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 17:19:43 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B5A65805A;
	Thu,  6 Jul 2023 17:19:43 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5358858060;
	Thu,  6 Jul 2023 17:19:37 +0000 (GMT)
Received: from [9.171.87.7] (unknown [9.171.87.7])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 17:19:36 +0000 (GMT)
Message-ID: <de856969-5d78-f771-96ff-4afce3a6e776@linux.vnet.ibm.com>
Date: Thu, 6 Jul 2023 22:49:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC 1/1] sched/fair: Consider asymmetric scheduler groups in
 load balancer
Content-Language: en-US
To: Tobias Huschle <huschle@linux.ibm.com>
References: <20230515114601.12737-1-huschle@linux.ibm.com>
 <20230515114601.12737-2-huschle@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <20230515114601.12737-2-huschle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uLZjPBL35LtqkYbUlwG2RmZkr_hMskng
X-Proofpoint-ORIG-GUID: tD11YAvJDu0KgpgeKfpmzGAsLInLz6vi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060154
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, shrikanth hegde <sshegde@linux.vnet.ibm.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/15/23 5:16 PM, Tobias Huschle wrote:
> The current load balancer implementation implies that scheduler groups,
> within the same domain, all host the same number of CPUs. This is
> reflected in the condition, that a scheduler group, which is load
> balancing and classified as having spare capacity, should pull work
> from the busiest group, if the local group runs less processes than
> the busiest one. This implies that these two groups should run the
> same number of processes, which is problematic if the groups are not 
> of the same size.
> 
> The assumption that scheduler groups within the same scheduler domain
> host the same number of CPUs appears to be true for non-s390 
> architectures. Nevertheless, s390 can have scheduler groups of unequal 
> size.
> 
> This introduces a performance degredation in the following scenario:
> 
> Consider a system with 8 CPUs, 6 CPUs are located on one CPU socket,
> the remaining 2 are located on another socket:
> 
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
> 
> Placing some workload ( x = one task ) yields the following
> scenarios:
> 
> The first 5 tasks are distributed evenly across the two groups.
> 
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
>          x x x          x x
> 
> Adding a 6th task yields the following distribution:
> 
> Socket   -----1-----    -2-
> CPU      1 2 3 4 5 6    7 8
> SMT1     x x x          x x
> SMT2                    x
> 
> The task is added to the 2nd scheduler group, as the scheduler has the
> assumption that scheduler groups are of the same size, so they should
> also host the same number of tasks. This makes CPU 7 run into SMT 
> thread, which comes with a performance penalty. This means, that in 
> the window of 6-8 tasks, load balancing is done suboptimally, because 
> SMT is used although there is no reason to do so as fully idle CPUs 
> are still available.
> 
> Taking the weight of the scheduler groups into account, ensures that
> a load balancing CPU within a smaller group will not try to pull tasks
> from a bigger group while the bigger group still has idle CPUs
> available.
> 
> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
> ---
>  kernel/sched/fair.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 48b6f0ca13ac..b1307d7e4065 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10426,7 +10426,8 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
>  	 * group's child domain.
>  	 */
>  	if (sds.prefer_sibling && local->group_type == group_has_spare &&
> -	    busiest->sum_nr_running > local->sum_nr_running + 1)
> +	    busiest->sum_nr_running * local->group_weight >
> +			local->sum_nr_running * busiest->group_weight + 1)
>  		goto force_balance;
> 


I assume its SMT2 here. sched group is enclosed in [busy_cpus/idle_cpus/weight] 

Lets take an example:  we will begin the with the said imbalance.
[3/9/12] -- local group 
[3/1/4] -- busy group. 
we will evaluate 3*12 > (4*(3+1)) is true and proceeds further to balance. 
but calculate_imbalance will lead to zero as the imbalance no? in case of prefer sibling 
case it find the difference of sum_nr_running of the two groups. It will be 3-3 = 0

this would need modifications to calculate_imbalance. 
Maybe something like this will help? NOT TESTED AT ALL. 

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a80a73909dc2..e027d4086edc 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10296,7 +10296,9 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
                        return;
                }

-               if (busiest->group_weight == 1 || sds->prefer_sibling) {
+               if (busiest->group_weight == 1 ||
+                       (sds->prefer_sibling &&
+                        busiest->group_weight == local->group_weight)) {
                        unsigned int nr_diff = busiest->sum_nr_running;
                        /*
                         * When prefer sibling, evenly spread running tasks on
@@ -10305,6 +10307,11 @@ static inline void calculate_imbalance(struct lb_env *env, struct sd_lb_stats *s
                        env->migration_type = migrate_task;
                        lsub_positive(&nr_diff, local->sum_nr_running);
                        env->imbalance = nr_diff;
+               }
+               if (sds->prefer_sibling &&
+                   busiest->group_weight != local->group_weight) {
+                       env->migration_type = migrate_task;
+                       env->imbalance = 1;
                } else {


---------------------------------------------------------------------------------------------------
On a tangential dimension.


Since prefer_siblings make inherent assumption that all groups have equal weight, 
it will cause  complications when group_weights are different. I think that becomes very
tricky when there are more than two groups. Depending on which cpu is doing 
load_balance there can be unnecessary migrations. 


Currently even in NUMA this can be similar case right? There will be unequal number of CPU's right? 
If we fix that case and remove prefer siblings in your arch, will that work? 

Maybe something like this? NOT TESTED AT ALL.


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index a80a73909dc2..fc6377f48ced 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10514,6 +10514,7 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
                        goto out_balanced;
 
                if (busiest->group_weight > 1 &&
+                   busiest->group_weight == local->group_weight &&
                    local->idle_cpus <= (busiest->idle_cpus + 1))
                        /*
                         * If the busiest group is not overloaded
@@ -10526,6 +10527,11 @@ static struct sched_group *find_busiest_group(struct lb_env *env)
                         */
                        goto out_balanced;
 
+               if ((busiest->group_weight != local->group_weight) &&
+                     (local->idle_cpus * busiest->group_weight <=
+                              local->group_weight * (busiest->idle_cpus + 1)))
+                       goto out_balanced;
+
                if (busiest->sum_h_nr_running == 1)
                        /*
                         * busiest doesn't have any tasks waiting to run





>  	if (busiest->group_type != group_overloaded) {
