Return-Path: <linuxppc-dev+bounces-12032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521FB535BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 16:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN0Xp2t1Nz2yGx;
	Fri, 12 Sep 2025 00:38:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757601498;
	cv=none; b=Z3LS9MvRvpcN4FL+1tO0TDrLonPXCAryezmqesRine3Hr1aSpg7fasS1oOkKDHx8gW1X+PBM1JCm4GP9BlwchXgKyoFfXJFZIt4aaOwmav90eCch6VjOgihrvBBuvXabaAbcv96mm0apVT0Bg6JffgWvVzDxMfc1adPJwQmEJfO/4mucevXFfbTnvS5Z4bMg4u9inlgHxLKYpulAyb3H8cw6w0sKBtfyWcT/bpNrx0MgCCrx71W76Nl1CxABdEALuh4eXQTVt+O6z78QYsqYgFGO0w+UX/5UOCBvTPq9M52oS3qIE4TjhKnZx2llrDV7c3VRiDATsaeRywThY0SeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757601498; c=relaxed/relaxed;
	bh=8E4za3cgBD/qHg6HrhjRiAOm8JdBVvYrIkWytWTR8TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jlEjWcOKuVsPsDzEoRnGnCIehD+fSghjGYvzw0EJEQRJLo/TE70GILBDnv5fXjAe20NXdg/rT8xQTRM7mVYag4HNIgw0IBLCQMdRhzsZtn0DNa+XmKPFvaKjehLUFC29LEHObrhDNhJwWUd4KobnOFZfSXyWaj4LoKgcVyXvXCIy3+DKnKKWsJpRy97gRJSysugI2Ae7b1a2WQMdVIy89YyI2pX2axH69SAkvYK/jOyC2ATIwJdnU4ntU2VEVnNHNr0gRTmxnI3Cn3+SDh3kV6hulMRcubHLDY/nb/7LHqc1MlZKu06B6L+W5oyYy9Rv2WldmZNr6xrQnhLx09aXXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ljlHC1A9; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ljlHC1A9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN0Xn3GpXz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 00:38:16 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B8i1JG003804;
	Thu, 11 Sep 2025 14:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=8E4za3
	cgBD/qHg6HrhjRiAOm8JdBVvYrIkWytWTR8TU=; b=ljlHC1A9iKAWpeFkl/sboT
	qKJ7fvcGeGN7VpcnRXr8Cj4y+4ZmRJbvKcs6Z2dfpaBlLpvIhEiyFRhiaW2dOyoQ
	g/rBmIq4MvLkmWTZsgQKlANAnq+2frzxnHEhUMz7bb0MPM9sfO7/P2jojeyolhpg
	J43QmAORl6cDMQHuKZbvklgNiKyaRMbRFk1UhpjHYT5uQAxNMEMLiJkwbJfYjloW
	Xjcnq0QKpUl93bdHLUpTyLxIDxa2o5A6/IBKRamlQVPGujDOKFVELRL5lhA+49gy
	aRxcWE9P4zXPxay6nDajht9wzA/HHs8AmuU1Dxkzx8BexAWf0AGM/+Rve1gDB7AA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyda4kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:38:02 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58BEPWZm003808;
	Thu, 11 Sep 2025 14:38:01 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xyda4kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:38:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDgOSL010604;
	Thu, 11 Sep 2025 14:38:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn673b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 14:38:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58BEbuob52167128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Sep 2025 14:37:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BFF820040;
	Thu, 11 Sep 2025 14:37:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 300F52004B;
	Thu, 11 Sep 2025 14:37:48 +0000 (GMT)
Received: from [9.61.95.215] (unknown [9.61.95.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Sep 2025 14:37:47 +0000 (GMT)
Message-ID: <b751b212-c4a5-4e7e-ad0f-df8cd3de19f7@linux.ibm.com>
Date: Thu, 11 Sep 2025 20:07:46 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 03/10] sched: Static key to check paravirt cpu push
To: Yury Norov <yury.norov@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-4-sshegde@linux.ibm.com> <aMIrgI9J4fuXntRz@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aMIrgI9J4fuXntRz@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4-s6qgzZ4_xAyJU5GDYQ-xHSct33ia7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX77wIAqGq1zVd
 Z32/B5q/79s9DCEy1gVTVkPmFkssIw54e57ttoLUy0hvUX7dKnnpGzAtOg9Wodk9ObOVPVwe2hO
 xQH6GKODcQjyr8dumwMZMELDeSrzmwA0ivCtaa12X/BkAgE/kTbScTLnZQBarGvu9aHZucyNMig
 SYWT9LbbwAFzrQQmPicOHZxOh5aSKS1xy6f/53r2nJAQ3P16Z5NCAMRBGYO+6PLcUVNirLchm/h
 y7bIAWtbX2EAyzI3CyH886xBwpJ9KnmlqJmx/zQuPetUtwIOrpreunBZpErrfI6OvWEOWbocrOw
 38CR9SyVCTqw9A7EtxEtQCIIpJyzQhFsTmLxoZjDsj+D9HVLUvVSawrWBy2OHk3WHiDU5J5OS08
 vhtxBee+
X-Proofpoint-GUID: Yt9om58zlIVtqpVI4MU_7ppkAEDadAp1
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68c2deca cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=RFDGOpT60TssK192s-MA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/11/25 7:23 AM, Yury Norov wrote:
> On Wed, Sep 10, 2025 at 11:12:03PM +0530, Shrikanth Hegde wrote:
>> CPUs are marked paravirt when there is contention for underlying
>> physical CPU.
>>
>> The push mechanism and check for paravirt CPUs are in sched tick
>> and wakeup. It should be close to no-op when there is no need for it.
>> Achieve that using static key.
>>
>> Architecture needs to enable this key when it decides there are
>> paravirt CPUs. Disable it when there are no paravirt CPUs.
> 

Hi Yury, Thanks for looking into this series.

> Testing a bit is quite close to a no-op, isn't it? Have you measured
> the performance impact that would advocate the static key? Please
> share some numbers then. I believe I asked you about it on the previous
> round.

The reasons I thought to keep are:

1. In load balance there is cpumask_and which does a loop.
Might be better to avoid it when it is not necessary.

2. Since __cpu_paravirt_mask is going to in one of the memory node in large NUMA systems
(likely on boot cpu node), access to it from other nodes might take time and costly when
it is not in cache. one could say same for static key too. but cpumask can be large when
NR_CPUS=8192 or so.


In most of the cases hackbench,schbench didn't show much difference.

> 
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   kernel/sched/core.c  |  1 +
>>   kernel/sched/sched.h | 17 +++++++++++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 0f1e36bb5779..b8a84e4691c8 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -10967,4 +10967,5 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
>>   #ifdef CONFIG_PARAVIRT
>>   struct cpumask __cpu_paravirt_mask __read_mostly;
>>   EXPORT_SYMBOL(__cpu_paravirt_mask);
>> +DEFINE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
>>   #endif
>> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
>> index b5367c514c14..8f9991453d36 100644
>> --- a/kernel/sched/sched.h
>> +++ b/kernel/sched/sched.h
>> @@ -3880,4 +3880,21 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx);
>>   
>>   #include "ext.h"
>>   
>> +#ifdef CONFIG_PARAVIRT
>> +DECLARE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
>> +
>> +static inline bool is_cpu_paravirt(int cpu)
>> +{
>> +	if (static_branch_unlikely(&cpu_paravirt_push_tasks))
>> +		return cpu_paravirt(cpu);
>> +
>> +	return false;
>> +}
> 
> So is_cpu_paravirt and cpu_paravirt are exactly the same in terms of
> functionality. If you really believe that static branch benefits the
> performance, it should go straight to the cpu_paravirt().
> 
>> +#else	/* !CONFIG_PARAVIRT */
>> +static inline bool is_cpu_paravirt(int cpu)
>> +{
>> +	return false;
>> +}
>> +#endif	/* !CONFIG_PARAVIRT */
>> +
>>   #endif /* _KERNEL_SCHED_SCHED_H */
>> -- 
>> 2.47.3


