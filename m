Return-Path: <linuxppc-dev+bounces-3864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1453C9E8D2C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 09:19:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6FCB6myjz2yVv;
	Mon,  9 Dec 2024 19:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733732374;
	cv=none; b=N16zwNnh8WlpDjGGxIAYn60QpVjm2cfyS6x2bTc2MTb7fN+q9qpgnY6wNtgE0bqpbvNGRQkyG5XToIfY0nfYxgtnc+/ekWBl4sg4ucroxAC7cBYdjxUn+EjVKwece8O3EdTYa9yxUAQ5PRQH7vuNFXfdHwyS8ln/8AsP0qfx8BrHu0nVoA49SS4YMfVQ+wIIo8XEkcyD/YQ/v4e10mB2fuDEgNbGAbvNi6ds90CJ6tsy0oftlvifZQwEzD95CXlXeRrhfyMpSw0487FgRcwMUJG4ljsgHYqP2djD6KdSLZNH9G/BE+rY55T5eCP9zhOUa7GoD64w+PRafeeFXu5R3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733732374; c=relaxed/relaxed;
	bh=Y9uud5ruM6O8JA3vLeQfAAwPVqwN8jw+GdGTqPpU5WM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RYjWZh6pIVrMyYJXlXVXyQEISKJMqcejpj0SDAGrT5dAhmQAZldeGSCvVsA3CV+w+qbCfHDUrhx2iEhmmDCD2+nndpGuf4SKu6+jpsR6HIfQKF/eke/Whlc7QmaXE2lrMObwRSUwowX4sgriDtHJvQyD36W03UlI+RMHU9x299rGu32dHnCPOH5Rkiq44j/aR38OF9IcftZOslK2MPHvP6OaJZp1cTifUh7tkxD0PmrehKKMayw2Lj0ZAky13PhOk7KJfH/14ppGOQys8GekFaajCPXvtK9IKW9F+AtwCsEUQfvXRVxxI8LK5UOeojnRRkgA3qjafTsfhh5wU47A0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M5sIhcDm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M5sIhcDm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6FCB00Dfz2yVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Dec 2024 19:19:33 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8NOkvp000529;
	Mon, 9 Dec 2024 08:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Y9uud5
	ruM6O8JA3vLeQfAAwPVqwN8jw+GdGTqPpU5WM=; b=M5sIhcDm/3G/epDf6wT9aq
	tGk8dGfw4IOXZl02YhiMQtsX+oPNEjDZgf/pLL8lJMWJ2xylzERcKcY7tEK6SZ4+
	GfrtygejRQB5aTRR2Eh0vdcy/BWp086JYTeJfIQjomAEzNv5Rqo9A0c4au+z/L6a
	UTdv8PpSBVs2Pfb8OoojMyZG7wD6QjjjL6PnxYMyJy0ab1uDJaOcWuk8YJ1IvQaC
	QOe15gA8hXTgITfV/GeMWJsOx5rqJ1kw7XuAg6b6/wOGt1JmEwgFB/6LQQ0l5+ko
	OevbkDt0+1qOcyQtoQoZUtJPN4YK9Fet92OHpRy/K9PfOAWOsYmNpIs6BxA0s1Rg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv8g5nd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:18:51 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B98IpFs016096;
	Mon, 9 Dec 2024 08:18:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv8g5na-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:18:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B957Cju032734;
	Mon, 9 Dec 2024 08:18:50 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0ps5wgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 08:18:50 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B98Imqk65733056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 08:18:48 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C9D62004D;
	Mon,  9 Dec 2024 08:18:48 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ED04720043;
	Mon,  9 Dec 2024 08:18:47 +0000 (GMT)
Received: from [9.171.77.252] (unknown [9.171.77.252])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  9 Dec 2024 08:18:47 +0000 (GMT)
Message-ID: <5e3c0502-1a28-483c-a831-6d1f814501da@linux.ibm.com>
Date: Mon, 9 Dec 2024 09:18:51 +0100
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
From: Tobias Huschle <huschle@linux.ibm.com>
Subject: Re: [RFC PATCH 2/2] s390/topology: Add initial implementation for
 selection of parked CPUs
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20241204112149.25872-1-huschle@linux.ibm.com>
 <20241204112149.25872-3-huschle@linux.ibm.com>
 <1f7ad21c-372f-4d7d-b3dc-9a2fb194b704@linux.ibm.com>
In-Reply-To: <1f7ad21c-372f-4d7d-b3dc-9a2fb194b704@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G6Dqr1a2rHeB_Qv23cJ9bs_o2oSpnxIl
X-Proofpoint-ORIG-GUID: aL5EcZ04MHp423ywKXRbgg7LWNalNb6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090061
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 05/12/2024 19:12, Shrikanth Hegde wrote:
> 
> 
> On 12/4/24 16:51, Tobias Huschle wrote:
>> In this simplified example, vertical low CPUs are parked generally.
>> This will later be adjusted by making the parked state dependent
>> on the overall utilization on the underlying hypervisor.
>>
>> Vertical lows are always bound to the highest CPU IDs. This implies that
>> the three types of vertically polarized CPUs are always clustered by ID.
>> This has the following implications:
>> - There can be scheduler domains consisting of only vertical highs
>> - There can be scheduler domains consisting of only vertical lows
>>
> 
> A sched domain can have combination of these two as well. Is that not 
> possible on s390?

A combination is possible. It depends on the algorithm of the hypervisor 
how many of those mixed groups might be possible.

> 
>> Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
>> ---
>>   arch/s390/include/asm/topology.h | 3 +++
>>   arch/s390/kernel/topology.c      | 5 +++++
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/ 
>> topology.h
>> index cef06bffad80..e86afeccde35 100644
>> --- a/arch/s390/include/asm/topology.h
>> +++ b/arch/s390/include/asm/topology.h
>> @@ -99,6 +99,9 @@ static inline int numa_node_id(void)
>>   #endif /* CONFIG_NUMA */
>> +#define arch_cpu_parked cpu_parked
>> +int cpu_parked(int cpu);
>> +
>>   #include <asm-generic/topology.h>
>>   #endif /* _ASM_S390_TOPOLOGY_H */
>> diff --git a/arch/s390/kernel/topology.c b/arch/s390/kernel/topology.c
>> index 4f9c301a705b..1032b65da574 100644
>> --- a/arch/s390/kernel/topology.c
>> +++ b/arch/s390/kernel/topology.c
>> @@ -299,6 +299,11 @@ void store_topology(struct sysinfo_15_1_x *info)
>>       stsi(info, 15, 1, topology_mnest_limit());
>>   }
>> +int cpu_parked(int cpu)
>> +{
>> +    return smp_cpu_get_polarization(cpu) == POLARIZATION_VL;
>> +}
> 
> Curious to know how this smp_cpu_get_polarization gets updated at 
> runtime? is it done by add_cpus_to_mask?

The polarization itself can get updated by the underlying hypervisor, 
which passes that information on to the Linux kernel.

A future implementation will not rely on the polarization as the main 
criterion but take more data points into account to allow a correct 
adaption to the load of the system.

Only using polarization would deny us the opportunity to overconsume on 
our entitlement if the machine has enough spare capacity. This patch 
just wants to be a tiny example on how this could be used.

> 
>> +
>>   static void __arch_update_dedicated_flag(void *arg)
>>   {
>>       if (topology_cpu_dedicated(smp_processor_id()))


