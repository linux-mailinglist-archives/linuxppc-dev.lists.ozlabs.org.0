Return-Path: <linuxppc-dev+bounces-12035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C426CB5385F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 17:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cN2J95Ztbz2yGx;
	Fri, 12 Sep 2025 01:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757606249;
	cv=none; b=OL2BPGSEv3KgeUsdJ/QzJCYYeymadhfrO2fcAX0VEUyqKYF1kZi0ckHusCm1RB8FA4xdTH0Tns7u9nXplX4TeD0m/vXp5KHaiC2Ll5zxsjRShTUZA2ZDcVHW5TRdasLHEwqVZByt49tui8I6oeCNCOt2WeVu9AGqnjJu/MI1wMqiEMw4i5WCdIsP46Mw0EwU1+b5cckTJWdrZzhaGm1rfBn0kDTX5vCdgKbbOUw2HALtOovbAGyGl/R0Cr4RNyFpBdTqXPOyt8FF4VAR4gDvWLt9LCLsBV/bRru3pXMxnTQ4GcAEmzYMRzs4FP3D2QqaDYkf19J0YB75+LDLvMUVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757606249; c=relaxed/relaxed;
	bh=hR/2y17EnbK2MMU7nd0ZkeNZdUrDyWTrnM4xm/omK2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjjNyh49PV7bnMxTcoqFtZpB/H9e5ktLVGSikK/Lp9ol3DWYB/+T9vH5lnryN0zmGZbHV63v/9IIsv7poI3a+uJEVkWiA2J4QAMg3KtLBmSGNjNnp7sea42MtK3MQw0jebPR5TTST3J/Iqbd6IL0vtfda6FUBOngAzapdi8l6LHUTlE/vJP1xYWX/Dg2m/6H2R5uD+ndb+GDk8XWGHXj90R6/1sceZGu9iuQP5q+0YQ5ahVpGwJLqKitBK5HaYy9lPA8JtOnqQM1JfqF8Z6V5FJHdfGqReABd/r/tCXTxjk3vUGEZeY9kQT0nmbYDUh3raL3b4HytEtxtUNMmVjQYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5vvQM8N; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s5vvQM8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cN2J82v4wz2xnn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 01:57:27 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BCnHjk028671;
	Thu, 11 Sep 2025 15:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=hR/2y1
	7EnbK2MMU7nd0ZkeNZdUrDyWTrnM4xm/omK2Q=; b=s5vvQM8Nx3oU1NguNkfFsH
	H+8S5mqyTk+KEDU7K+uK5YIMgKibg4IwEnqnTtGcPnfsNY1Qo8Mz71GCxre8kg43
	8/2FD/7BaOhW5xqnEzKeWG2mrprz/jP5mGTk4NmpFWyjkGZADrMrR3Byhf77JJXo
	QNL0lc93wdXqwOiO6NTgSquRm/IKviywy2XMFZL8O3JGmwYKYHq0rgokMXpM7w+v
	jqbpYfSunlpw7fYQksyrGs3d1xu4fKjKNE+/n9RYAjYatnViTieQFO49DsA0UavW
	vEDJR83zKdG+zcXeGUQgav8HtDoncd3BGkcVXoMzau7KodVyN58Vr8FTILjXmeHQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xydajk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 15:57:12 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58BFo1u8018580;
	Thu, 11 Sep 2025 15:57:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490xydajjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 15:57:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58BENWIL001188;
	Thu, 11 Sep 2025 15:57:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 491203p9rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Sep 2025 15:57:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58BFv7oN49217970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Sep 2025 15:57:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08BFC20040;
	Thu, 11 Sep 2025 15:57:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80B5120043;
	Thu, 11 Sep 2025 15:56:58 +0000 (GMT)
Received: from [9.61.95.215] (unknown [9.61.95.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Sep 2025 15:56:58 +0000 (GMT)
Message-ID: <e3826a8d-98cc-4497-85ce-5d92e0556cea@linux.ibm.com>
Date: Thu, 11 Sep 2025 21:26:56 +0530
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
Subject: Re: [RFC PATCH v3 05/10] sched/fair: Don't consider paravirt CPUs for
 wakeup and load balance
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
        jgross@suse.com, pbonzini@redhat.com, seanjc@google.com,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-6-sshegde@linux.ibm.com>
 <d0aa1a34-2097-405c-b431-907fd973ad96@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <d0aa1a34-2097-405c-b431-907fd973ad96@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: EoQsnxEWE1fI354CANC2daJRZduOKjwS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDIzNSBTYWx0ZWRfX40KWbzuYW4yb
 HAkT/MkP3dT8oVyRGsBmRbDj8DxlBiVmoppZy4vOpQlrlkaNFcagd7duMX8LekGfxPqeiWxbPCG
 0jdB9Uq2b28bszHS69d9zU/QCuccRH25xJW8jgMJFfQUUnr9eA5TJVGmR6B+V3cZ3ubgN5ztd4A
 DkCgZoDxs0+/luDXoaIXiBJGs2VAxUneyqzv0jRWEBsYMZAyuofYeEukbYDT0/r42fqNiLgt8Jr
 2n1GIHqgt3XMBKNrPB01/0UoAgMYt+YiAveDpD018CWULDfRrayT1JPThOu4R1VAt7eDdUQRxfD
 XhYXBPPE5H16s5a9vZQQx/oFEav6qSbZXNZ9cOM3BhC2McMszLw5IX5stZzgm/WAhZR9If2yIpC
 SGIfN9Dr
X-Proofpoint-GUID: snWUdQdLKZTGcpGH5mLV10L87_zdZ_yv
X-Authority-Analysis: v=2.4 cv=F59XdrhN c=1 sm=1 tr=0 ts=68c2f158 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=ex1m0Fpx1afbAyXWguEA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_02,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060235
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/11/25 10:53 AM, K Prateek Nayak wrote:
> Hello Shrikanth,
> 
> On 9/10/2025 11:12 PM, Shrikanth Hegde wrote:
>> @@ -8563,7 +8563,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>>   		if (!is_rd_overutilized(this_rq()->rd)) {
>>   			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
>>   			if (new_cpu >= 0)
>> -				return new_cpu;
>> +				goto check_new_cpu;
> 
> Should this fallback to the overutilized path if the most energy
> efficient CPU is found to be paravirtualized or should
> find_energy_efficient_cpu() be made aware of it?
> 
>>   			new_cpu = prev_cpu;
>>   		}
>>   
>> @@ -8605,7 +8605,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>>   	}
>>   	rcu_read_unlock();
>>   
>> -	return new_cpu;
>> +	/* If newly found or prev_cpu is a paravirt cpu, use current cpu */
>> +check_new_cpu:
>> +	if (is_cpu_paravirt(new_cpu))
>> +		return cpu;
>> +	else
> 
> nit. redundant else.
> 

Do you mean "is_cpu_paravirt(new_cpu) ? cpu; new_cpu"

This needs to return cpu instead of true/false. maybe i not seeing the obvious.

>> +		return new_cpu;
>>   }
>>   
>>   /*
>> @@ -11734,6 +11739,12 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>>   
>>   	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
>>   
>> +#ifdef CONFIG_PARAVIRT
>> +	/* Don't spread load to paravirt CPUs */
>> +	if (static_branch_unlikely(&cpu_paravirt_push_tasks))
>> +		cpumask_andnot(cpus, cpus, cpu_paravirt_mask);
>> +#endif
> 
> Can something similar be also be done in select_idle_sibling() and
> sched_balance_find_dst_cpu() for wakeup path?

That's a good suggestion. don't make a choice which is a paravirt CPU.
Will explore.

> 
>> +
>>   	schedstat_inc(sd->lb_count[idle]);
>>   
>>   redo:


