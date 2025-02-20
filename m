Return-Path: <linuxppc-dev+bounces-6365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C79CA3D768
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 11:53:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yz99V05dQz30T9;
	Thu, 20 Feb 2025 21:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740048829;
	cv=none; b=XYcSbHKWGL6YpdvAgCfTiEFCYsRdtk+2x9iCGJqPWEe0QT8BRcwlBpR5tOxTbzn6a5gKVKYY1HpVFY7Hf2nUjUmhpiQwayG+qgtJvkLXdxg9nIFFvfwrH9ZmmnMd5flhs+oFhM/DCrNBN2iqyVgyOwp3B63auigy711IV8h/YglPlfPDCtAs9oaGztls4EWCEX5qpErkdNTPNS9DwPVs8R8C+bNDngGMXL+w3B3RnvrtQxjEdGYQDej60C/mPsFHBisXkWbbq0OTYBPkpyFU/O6sIXr7LoOjq2G/4Tt+WmTnttY2A/+EC8GBycNh3XK1lALEoO4xWg+SVe0268IPDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740048829; c=relaxed/relaxed;
	bh=uF7znEZ9GRSVtKX2LQujf9rIx7K6OZ00qsFQj5nY6so=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XY7uaO/4lPXmjKGYAlaWC8Yrq/3FS4z8oEDHK6xIIh9boFC0A8G/YOVyfd/NoWrk3a4OTvJ/3NImf9SpxY27ZLgCd12zfOddxKdiC5lKqRGeZ19pwtzTZTz2Ar05ref/1hA6s6UdbH7BQKaMY6q05wSwaeD6iIIpFL5W5sx02UVRQVfvC6CStXR9Y4O3YvWaIejC4DG/ohPuQyPFEMYRkZ0qy1iQ/i/bSaLyZgfBiWcO460lB00crIjqsIsZ+TEQCPbp6nbm8FwdqZw6oqnTFaYE8c/zyE8fe+Qs5hRw91K8E2smfMvuMMLyTSzf+mRarz57U2vzDer+pvClkLsZyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m69fhajh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m69fhajh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yz99S5wp2z2y92
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 21:53:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K9PK2f007835;
	Thu, 20 Feb 2025 10:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uF7znE
	Z9GRSVtKX2LQujf9rIx7K6OZ00qsFQj5nY6so=; b=m69fhajhgtvaLdcfPvJwpW
	1Oaq7Oy9VbSgPt0RqeHuAGAGe1usX3REWLNaQ7pzSyJM89eqiSQD9HAD7HdFpRsZ
	dVj5RG94W7RecF+r2JD0iBe6b3jQdyD1UJLdGI/gZbHMUf6QlJoaGPdEJN4MaCVv
	/yumea6LxU9qTRQF0wr49ieNsYFzpImJRxAPkFnpCjIIjn9KdCecqUMZBqUyapJw
	pdRz7jR1eji/krbOG6IbLcVa45Wy0s0BDk9hHCMeFuuvMlS/pIzx7CqsR6q8c0Ef
	Amqe2QseNXDTCfTT96vDZi1/WVlhmuHlp4qA5yw3+fDOPC4MMZh3vjvyphFZSh3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44x1qy8cdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:53:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51KAUl1l019570;
	Thu, 20 Feb 2025 10:53:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44x1qy8cdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:53:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7jjCq030118;
	Thu, 20 Feb 2025 10:53:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w01x9jjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 10:53:34 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51KArWSB35914356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2025 10:53:32 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C9B320040;
	Thu, 20 Feb 2025 10:53:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 012B420043;
	Thu, 20 Feb 2025 10:53:32 +0000 (GMT)
Received: from [9.171.63.18] (unknown [9.171.63.18])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Feb 2025 10:53:31 +0000 (GMT)
Message-ID: <e2495b3a-81c5-4238-b766-2ab6e892b6bf@linux.ibm.com>
Date: Thu, 20 Feb 2025 11:53:32 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/3] sched/fair: introduce new scheduler group type
 group_parked
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217113252.21796-1-huschle@linux.ibm.com>
 <20250217113252.21796-2-huschle@linux.ibm.com>
 <ee74de65-1b9d-4c40-aa57-52682801260a@linux.ibm.com>
From: Tobias Huschle <huschle@linux.ibm.com>
In-Reply-To: <ee74de65-1b9d-4c40-aa57-52682801260a@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LJQ2-XyjMYZZTqZ72jSpZrkSTDecBFC_
X-Proofpoint-ORIG-GUID: 0MCLTxFzE9ZA4l4lQXYPWz0Vb7wyIHTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 bulkscore=0 mlxlogscore=823 adultscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200078
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 18/02/2025 06:44, Shrikanth Hegde wrote:
[...]
>> @@ -1352,6 +1352,9 @@ bool sched_can_stop_tick(struct rq *rq)
>>       if (rq->cfs.h_nr_queued > 1)
>>           return false;
>> +    if (rq->cfs.nr_running > 0 && arch_cpu_parked(cpu_of(rq)))
>> +        return false;
>> +
> 
> you mean rq->cfs.h_nr_queued or rq->nr_running ?
> 

cfs.h_nr_queued is probably more sensible, will use that.

[...]
>> @@ -11259,6 +11293,8 @@ static inline void calculate_imbalance(struct 
>> lb_env *env, struct sd_lb_stats *s
>>    * avg_load : Only if imbalance is significant enough.
>>    * nr_idle :  dst_cpu is not busy and the number of idle CPUs is quite
>>    *            different in groups.
>> + * nr_task :  balancing can go either way depending on the number of 
>> running tasks
>> + *            per group
>>    */
> 
> This comment on nr_task can be removed as it is not present in the list.
> 

Consider it gone.

[...]
>> @@ -11766,7 +11822,7 @@ static int sched_balance_rq(int this_cpu, 
>> struct rq *this_rq,
>>       ld_moved = 0;
>>       /* Clear this flag as soon as we find a pullable task */
>>       env.flags |= LBF_ALL_PINNED;
>> -    if (busiest->nr_running > 1) {
>> +    if (busiest->nr_running > 1 || arch_cpu_parked(busiest->cpu)) {
> 
> Since there is reliance on active balance if there is single task, it 
> think above isn't needed. Is there any usecase for it?
>

Seems to work without that check. I have no particular use case in mind.

>>           /*
>>            * Attempt to move tasks. If sched_balance_find_src_group 
>> has found
>>            * an imbalance but busiest->nr_running <= 1, the group is
>> @@ -12356,6 +12412,11 @@ static void nohz_balancer_kick(struct rq *rq)
>>       if (time_before(now, nohz.next_balance))
>>           goto out;
>> +    if (!idle_cpu(rq->cpu)) {
>> +        flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
>> +        goto out;
>> +    }
>> +
> 
> This could be agrressive. Note when the code comes here, it is not idle. 
> It would bail out early if it is idle.
> 

It seems like we can do without this one as well.

>>       if (rq->nr_running >= 2) {
>>           flags = NOHZ_STATS_KICK | NOHZ_BALANCE_KICK;
>>           goto out;
>> @@ -12767,6 +12828,9 @@ static int sched_balance_newidle(struct rq 
>> *this_rq, struct rq_flags *rf)
>>       update_misfit_status(NULL, this_rq);
>> +    if (arch_cpu_parked(this_cpu))
>> +        return 0;
>> +
>>       /*
>>        * There is a task waiting to run. No need to search for one.
>>        * Return 0; the task will be enqueued when switching to idle.
>> diff --git a/kernel/sched/syscalls.c b/kernel/sched/syscalls.c
>> index 456d339be98f..7efd76a30be7 100644
>> --- a/kernel/sched/syscalls.c
>> +++ b/kernel/sched/syscalls.c
>> @@ -214,6 +214,9 @@ int idle_cpu(int cpu)
>>           return 0;
>>   #endif
>> +    if (arch_cpu_parked(cpu))
>> +        return 0;
>> +
>>       return 1;
>>   }
> 


