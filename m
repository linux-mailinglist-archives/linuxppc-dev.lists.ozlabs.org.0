Return-Path: <linuxppc-dev+bounces-13965-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6BC42C73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 13:05:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3ZPN5PWrz30hN;
	Sat,  8 Nov 2025 23:05:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762603512;
	cv=none; b=jQ5LcTfETwQ9Fa1NLukfBaxXJRirB0tCsbUPEmvDXQ5kX+LPKC8SCbqJjqkxoshCTgrj5LQRY1SwvTe7Q9QJTLiPQahE8BFXKmrM/Ayq0/ncmfoSyIlp0rOKQv7hIMem3gf7u1+0quuciA1GHrE5svpSvhMLJAy0cVk1V62GW00gzbKB2Jh58Osvm0f2KvqzourctbOnqoQibP88jkzQzAfFZT256rV4irsSKDCnfFsnIUIOMkTxmZMWTOYW3yBujFPYqeY8rj4pr1htVRxBacuQXgDesLkvqNCJrstst7rTIK1UiafFxLZaZxiiLnAuCeFahgzkURaJuhPgbeHJTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762603512; c=relaxed/relaxed;
	bh=BPuTDK3wudd7tV1PHDj+w7MkGceOWgYTtNwyx5UVOTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=duRDY1nYjw1K/cOHt/gTdy3L9MfDeVE9OtBhDA9n8IJNUAnjrEqEWW2KwxYs1q8tgejujWh4RxULEYaAdbWHm4EnrZeNw+CkGZsJbvlKVyGUgPAMqeJbJ2gp1wTQ/7iudS5d9QhM4cgUWxSlLo353oJ6l1NXt0fOD1bnUKTK6RO8xdKxvZfhZVHr7X8iu4IXDDoZcdkAxu5dUesdoYH4CxrOmKnWRJmZE4+t9l0VZAyhdsaJksLpuRyCMai6qB/BkqQJGdaNiQuob+qHEFW7oZUXT6JT+M2E4OLJXJlj0GTyIw6C1jO/iPlntvnaxOwalZKO69Juu+WpUa8PPa0QNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pLXV1ojM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pLXV1ojM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3ZPM3KcWz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 23:05:11 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A8Aq568027585;
	Sat, 8 Nov 2025 12:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=BPuTDK
	3wudd7tV1PHDj+w7MkGceOWgYTtNwyx5UVOTs=; b=pLXV1ojMjPhB50eHL75Mjr
	ecbzevYj41eDIWKlRQA7tjWKbrcaZEyr1SpNOVhJYv8u8WbXZZu/Ty1QVeXKJQLO
	52B4JUSFVNPk7os3ZjeXKdikP41I77lEhcHjHlZYfr5vblPovl8uLEv7C+26EMSY
	sX2+OFAtAkdBCI/zwZwNEgW8VnzrPVXzv2ul96AP6gnC0R0IkvcLO4ogjvpKD88W
	c1eIMOndFAMtEe8Cqay77KQO3KeZl3+Im4d+VsUho6ec0IPfmT9QYjfULl3Ay/El
	nJfm7OccMR8+Drt2GQ7Mq/R2cHP7AnboPuTDO7886jge80LzAnwg421JEPi3evUw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m7r921-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:04:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A8C4S4A026050;
	Sat, 8 Nov 2025 12:04:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa3m7r91x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:04:54 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A891kgX025582;
	Sat, 8 Nov 2025 12:04:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5vht79nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Nov 2025 12:04:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A8C4oHo41550204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Nov 2025 12:04:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 29EBE2004E;
	Sat,  8 Nov 2025 12:04:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C90E2004B;
	Sat,  8 Nov 2025 12:04:46 +0000 (GMT)
Received: from [9.39.18.210] (unknown [9.39.18.210])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Nov 2025 12:04:46 +0000 (GMT)
Message-ID: <44d1a4a3-da2d-4cee-b947-a83023a4ceaa@linux.ibm.com>
Date: Sat, 8 Nov 2025 17:34:45 +0530
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
X-Authority-Analysis: v=2.4 cv=MtZfKmae c=1 sm=1 tr=0 ts=690f31e7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Hl_OmnuzmpaPTutlhbAA:9 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: hYfeG4CVYqghkJ34NGed4q1hNWUxDFvs
X-Proofpoint-ORIG-GUID: XTdIfH8OmLfG722bMF6XWJxspuONoxGp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA3OSBTYWx0ZWRfX0q6P98QYlhAa
 vicp2b+NWIWzDosCnt3qcTdZS2QD0FB//Q/mrgo+cmHXUuhgbeLYcPM1BGDdORRPHnl/xgOfbnG
 mO+7IUNOEytcPRnYzDMyJKizowkTlp3tDCAPoqoFt8EdejLajBHWUjcjc7+6kqfnuNbDKIoaYxX
 dnbevZDNO0dtIztOMvpvQkIoC9RJrFM8LKxRU0Y0zH1lFzGjcZL9H4RqfRXnjJMrLqsP6FVBfiQ
 nRcnLv7h4cNsng2A4BcKuPHHAlkwU3qbYJkj8oN98p5RX8XyEV7SeydukfqvJDWFlI6WphI/X/U
 NOYJfyfDEeFhER0U/ihtWC7vJpR4Dk00jZ2kytMroTMYCsmFef82ua8yhd76VO5YIZrQqurTht0
 OhGP1zQnY2QLUevh7IbDNrcCX3YyWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080079
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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


While thinking about this, are there any such system which has vCPUs and
overcommits and still has energy model backing it?

Highly unlikely. So, I am planning to put a warning there and see if any
such usage exists there.

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
> 

We have this pattern in select_task_rq_fair

cpu = smp_processor_id();
new_cpu = prev_cpu;

task is waking up after a while, so likely prev_cpu is marked as paravirt
and in such cases we should return current cpu. if current cpu is paravirt(unlikely),
and prev_cpu is also paravirt, then should return current cpu.
In next sched tick it will be pushed out.

select_idle_sibling(p, prev_cpu, new_cpu); - (new_cpu will remain prev_cpu if wake_affine doesn't change it)
Will have to change the prototype to send current cpu as well.

