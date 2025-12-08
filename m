Return-Path: <linuxppc-dev+bounces-14681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7360CACC55
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 10:57:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPy8W2c3pz2yMv;
	Mon, 08 Dec 2025 20:57:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765187867;
	cv=none; b=DBiw5cM0qDmq9WyKlBXamf16HH3gm8lB1wYy8ATCjpw/pcBs+EGPpYr7BHW+lkNPammJRGWeNLpcVdp4OF/G9TrpO1h5HrRj8/Q63fsK2WJahvzk3S5gIY035AXULndc8DcpPDd324M8IbXqC5nsclKarlh0toqiXVD2kuXJ7SVRjXhYxfYEIVkukmq1PqUjCCuxwafYimWE0QOVPS5DCFpzlKJDYq0QQVEGLCTv47B9ePcWwkT5T86b6D89OHxdaq6MtykJh4R5CLGOkiM1WQxmTNB7Ia67h0HH7avfNPokESJEK/CiS0N/4S/dz5mHRiynOsPPfZMNAPhX/qxTdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765187867; c=relaxed/relaxed;
	bh=e8gSf3h0yZLLEA+Y7q2m/Qnm2Mcd5IlBgOUoBnnh3BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=olPZ2a8B5PDPSuJP21ZVunpdRvLWYgA+1jXeK1c9myjEY0Eo5xgHSFyvXq6zUcWjwM8U4TV/r4Mc4J8gn4I+TIKpv06IkCeDNOA+JcZGOagu679RpRrO36GP0ifbLt+EjNimgWX4YVOxeVzchDBOn1wGR4pvex6cOj5BZ/6Fmef66eWVSFy2Z8IfOrqEzIcJcz8eFriZ0qAGC4oK9Ypyit0zK3DjV+9N4GwCY+b0ogeUGVI5YjesuL9xCHN+Wa3VoP/bkh0mqcQXfqsSsx+7Sx8Au34Ct6cweHm8zmjJwoOzID2TPUpBM9qyeeKC5wiFqSeL5t2+iQVR8tcwyD++oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nD1UosxM; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nD1UosxM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPy8V3wGPz2yKr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 20:57:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B87jUPa032400;
	Mon, 8 Dec 2025 09:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=e8gSf3
	h0yZLLEA+Y7q2m/Qnm2Mcd5IlBgOUoBnnh3BY=; b=nD1UosxMyMIDRLICGxXz/Q
	Li2XejDitg/Yw1JiHEZElddP3zOw1++3XS+F2I7mpSd26OuAEd5K5ZZS1RxAVcVX
	XqqGyCNL263skftiyhLxZ56veUrTqU6rO8uWq1T6bI1FbLKB8+0yxwOdBBmgdD4b
	x6Ri0o9yrRQptezdb6cAqXdnMrHvkYeQYGypko1tm9b5wQaaev50GvlAAoCukLI/
	+GFQenwm6JmdTc588iXwhebQhjnXX85sOfH4X7n3oPeFhniklr6FZkQkjAE0V5qN
	xCwVnTM8DfL4X2433hUmaVwm1m0qB0FS91j/D0SzM3ma3mlrUZauwTbNkLGqT0NA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc6174rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 09:57:12 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B89g3MB004526;
	Mon, 8 Dec 2025 09:57:12 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc6174rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 09:57:11 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B85shct030340;
	Mon, 8 Dec 2025 09:57:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4avxtrw4nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 09:57:10 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B89v6GA31129878
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 09:57:06 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5B4C2004E;
	Mon,  8 Dec 2025 09:57:06 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8419420040;
	Mon,  8 Dec 2025 09:57:02 +0000 (GMT)
Received: from [9.39.16.154] (unknown [9.39.16.154])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  8 Dec 2025 09:57:02 +0000 (GMT)
Message-ID: <ec2e5cc1-958d-43aa-bc74-65640b5b8f78@linux.ibm.com>
Date: Mon, 8 Dec 2025 15:27:01 +0530
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
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <2f7877bd-afb4-45c1-a370-d22c2f2955f4@amd.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <2f7877bd-afb4-45c1-a370-d22c2f2955f4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfX0icqSO87blrj
 lYb3q4JeF4DFJqkOjPsHjfoEthsSagrksEyhj0CNYHupNW6ISBbjU/81W0IcJ0l7OY1GMp0rE2A
 8LJJnZ/FwBNtlIdBUgNXd9kemozMKhuKy1xk3VVeYEkDw9rbKsFs/2mJ7qC82SGT+2xfslXeWE1
 Iv4bc5gmvLC3YYJU3C9C/Che/e4ZGod3D+7pdzqsQdUvZLMGRJ1TZ2JrGIu8+3xLu2qSyv/qmzJ
 O4ASX+yJ0DrmRH9GSxuPwbSVS+6pMBxb6Y05hZzY4o1wE3/+tIKnkS5vhz1GABoefAK9ysaoyku
 ApXm5qnRu4GTiyw3EZlOwRhoOwIZ7PF+d7rQdZLT1aYlQ0oyRxD6Ffdz9EVvL3vq3t7xQRqcEOv
 utmRlVPgbQKuJPnLS1qus5oodf8ZEQ==
X-Proofpoint-GUID: to2gGRRXEKMKX0Y-neO1xVvQdQB-TeP8
X-Proofpoint-ORIG-GUID: pnREqzafuQzNjWucyatpOEnOxvRrQFgr
X-Authority-Analysis: v=2.4 cv=O/U0fR9W c=1 sm=1 tr=0 ts=6936a0f8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=AHzFJHSdYHYT1VwR3hAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Prateek.

Thank you very much for going throguh the series.

On 12/8/25 10:17 AM, K Prateek Nayak wrote:
> On 11/19/2025 6:14 PM, Shrikanth Hegde wrote:
>> Detailed problem statement and some of the implementation choices were
>> discussed earlier[1].
>>
>> [1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
>>
>> This is likely the version which would be used for LPC2025 discussion on
>> this topic. Feel free to provide your suggestion and hoping for a solution
>> that works for different architectures and it's use cases.
>>
>> All the existing alternatives such as cpu hotplug, creating isolated
>> partitions etc break the user affinity. Since number of CPUs to use change
>> depending on the steal time, it is not driven by User. Hence it would be
>> wrong to break the affinity. This series allows if the task is pinned
>> only paravirt CPUs, it will continue running there.
> 
> If maintaining task affinity is the only problem that cpusets don't
> offer, attached below is a very naive prototype that seems to work in
> my case without hitting any obvious splats so far.
> 
> Idea is to keep task affinity untouched, but remove the CPUs from
> the sched domains.
> 
> That way, all the balancing, and wakeups will steer away from these
> CPUs automatically but once the CPUs are put back, the balancing will
> automatically move tasks back.
> 
> I tested this with a bunch of spinners and with partitions and both
> seem to work as expected. For real world VM based testing, I pinned 2
> 6C/12C VMs to a 8C/16T LLC with 1:1 pinning - 2 virtual cores from
> either VMs pin to same set of physical cores.
> 
> Running 8 groups of perf bench sched messaging on each VM at the same
> time gives the following numbers for total runtime:
> 
> All CPUs available in the VM:      88.775s & 91.002s  (2 cores overlap)
> Only 4 cores available in the VM:  67.365s & 73.015s  (No cores overlap)
> 
> Note: The unavailable mask didn't change in my runs. I've noticed a
> bit of delay before the load balancer moves the tasks to the CPU
> going from unavailable to available - your mileage may vary depending

Depends on the scale of systems. I have seen it unfolding is slower
compared to folding on large systems.

> on the frequency of mask updates.
> 

What do you mean "The unavailable mask didn't change in my runs" ?
If so, how did it take effect?

> Following is the diff on top of tip/master:
> 
> (Very raw PoC; Only fair tasks are considered for now to push away)
> 

I skimmed through it. It is very close to the current approach.

Advantage:
Happens immediately instead of waiting for tick.
Current approach too can move all the tasks at one tick.
the concern could be latency being high and races around the list.

Disadvantages:

Causes a sched domain rebuild. Which is known to be expensive on large systems.
But since steal time changes are not very aggressive at this point, this overhead
maybe ok.

Keeping the interface in cpuset maybe tricky. there could multiple cpusets, and different versions
complications too. Specially you can have cpusets in nested fashion. And all of this is
not user driven. i think cpuset is inherently user driven.

Impementation looks more complicated to me atleast at this point.

Current poc needs to enhanced to make arch specific triggers. That is doable.

> diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
> index 2ddb256187b5..7c1cfdd7ffea 100644
> --- a/include/linux/cpuset.h
> +++ b/include/linux/cpuset.h
> @@ -174,6 +174,10 @@ static inline void set_mems_allowed(nodemask_t nodemask)
>   }
>   
>   extern bool cpuset_node_allowed(struct cgroup *cgroup, int nid);
> +
> +void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask);
> +const struct cpumask *cpuset_unavailable_mask(void);
> +bool cpuset_cpu_unavailable(int cpu);
>   #else /* !CONFIG_CPUSETS */
>   
>   static inline bool cpusets_enabled(void) { return false; }
> diff --git a/kernel/cgroup/cpuset-internal.h b/kernel/cgroup/cpuset-internal.h
> index 337608f408ce..170aba16141e 100644
> --- a/kernel/cgroup/cpuset-internal.h
> +++ b/kernel/cgroup/cpuset-internal.h
> @@ -59,6 +59,7 @@ typedef enum {
>   	FILE_EXCLUSIVE_CPULIST,
>   	FILE_EFFECTIVE_XCPULIST,
>   	FILE_ISOLATED_CPULIST,
> +	FILE_UNAVAILABLE_CPULIST,
>   	FILE_CPU_EXCLUSIVE,
>   	FILE_MEM_EXCLUSIVE,
>   	FILE_MEM_HARDWALL,
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 4aaad07b0bd1..22d38f2299c4 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -87,6 +87,19 @@ static cpumask_var_t	isolated_cpus;
>   static cpumask_var_t	boot_hk_cpus;
>   static bool		have_boot_isolcpus;
>   
> +/*
> + * CPUs that may be unavailable to run tasks as a result of physical
> + * constraints (vCPU being preempted, pCPU handling interrupt storm).
> + *
> + * Unlike isolated_cpus, the unavailable_cpus are simply excluded from
> + * HK_TYPE_DOMAIN but leave the tasks affinity untouched. These CPUs
> + * should be avoided unless the task has specifically asked to be run
> + * only on these CPUs.
> + */
> +static cpumask_var_t	unavailable_cpus;
> +static cpumask_var_t	available_tmp_mask;	/* For intermediate operations. */
> +static bool 		cpu_turned_unavailable;
> +

This unavailable name is not probably right. When system boots, there is available_cpu
and that is fixed and not expected to change. It can confuse users.

>   /* List of remote partition root children */
>   static struct list_head remote_children;
>   
> @@ -844,6 +857,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   		}
>   		cpumask_and(doms[0], top_cpuset.effective_cpus,
>   			    housekeeping_cpumask(HK_TYPE_DOMAIN));
> +		cpumask_andnot(doms[0], doms[0], unavailable_cpus);
>   
>   		goto done;
>   	}
> @@ -960,11 +974,13 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   			 * The top cpuset may contain some boot time isolated
>   			 * CPUs that need to be excluded from the sched domain.
>   			 */
> -			if (csa[i] == &top_cpuset)
> +			if (csa[i] == &top_cpuset) {
>   				cpumask_and(doms[i], csa[i]->effective_cpus,
>   					    housekeeping_cpumask(HK_TYPE_DOMAIN));
> -			else
> -				cpumask_copy(doms[i], csa[i]->effective_cpus);
> +				cpumask_andnot(doms[i], doms[i], unavailable_cpus);
> +			 } else {
> +				cpumask_andnot(doms[i], csa[i]->effective_cpus, unavailable_cpus);
> +			 }
>   			if (dattr)
>   				dattr[i] = SD_ATTR_INIT;
>   		}
> @@ -985,6 +1001,7 @@ static int generate_sched_domains(cpumask_var_t **domains,
>   				}
>   				cpumask_or(dp, dp, csa[j]->effective_cpus);
>   				cpumask_and(dp, dp, housekeeping_cpumask(HK_TYPE_DOMAIN));
> +				cpumask_andnot(dp, dp, unavailable_cpus);
>   				if (dattr)
>   					update_domain_attr_tree(dattr + nslot, csa[j]);
>   			}
> @@ -1418,6 +1435,17 @@ bool cpuset_cpu_is_isolated(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(cpuset_cpu_is_isolated);
>   
> +/* Get the set of CPUs marked unavailable. */
> +const struct cpumask *cpuset_unavailable_mask(void)
> +{
> +	return unavailable_cpus;
> +}
> +
> +bool cpuset_cpu_unavailable(int cpu)
> +{
> +	return  cpumask_test_cpu(cpu, unavailable_cpus);
> +}
> +
>   /**
>    * rm_siblings_excl_cpus - Remove exclusive CPUs that are used by sibling cpusets
>    * @parent: Parent cpuset containing all siblings
> @@ -2612,6 +2640,53 @@ static int update_exclusive_cpumask(struct cpuset *cs, struct cpuset *trialcs,
>   	return 0;
>   }
>   
> +/**
> + * update_exclusive_cpumask - update the exclusive_cpus mask of a cpuset
> + * @cs: the cpuset to consider
> + * @trialcs: trial cpuset
> + * @buf: buffer of cpu numbers written to this cpuset
> + *
> + * The tasks' cpumask will be updated if cs is a valid partition root.
> + */
> +static int update_unavailable_cpumask(const char *buf)
> +{
> +	cpumask_var_t tmp;
> +	int retval;
> +
> +	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
> +		return -ENOMEM;
> +
> +	retval = cpulist_parse(buf, tmp);
> +	if (retval < 0)
> +		goto out;
> +
> +	/* Nothing to do if the CPUs didn't change */
> +	if (cpumask_equal(tmp, unavailable_cpus))
> +		goto out;
> +
> +	/* Save the CPUs that went unavailable to push task out. */
> +	if (cpumask_andnot(available_tmp_mask, tmp, unavailable_cpus))
> +		cpu_turned_unavailable = true;
> +
> +	cpumask_copy(unavailable_cpus, tmp);
> +	cpuset_force_rebuild();

I think this rebuilding sched domains could add quite overhead.

> +out:
> +	free_cpumask_var(tmp);
> +	return retval;
> +}
> +
> +static void cpuset_notify_unavailable_cpus(void)
> +{
> +	/*
> +	 * Prevent being preempted by the stopper if the local CPU
> +	 * turned unavailable.
> +	 */
> +	guard(preempt)();
> +
> +	sched_fair_notify_unavaialable_cpus(available_tmp_mask);
> +	cpu_turned_unavailable = false;
> +}
> +
>   /*
>    * Migrate memory region from one set of nodes to another.  This is
>    * performed asynchronously as it can be called from process migration path
> @@ -3302,11 +3377,16 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>   				    char *buf, size_t nbytes, loff_t off)
>   {
>   	struct cpuset *cs = css_cs(of_css(of));
> +	int file_type = of_cft(of)->private;
>   	struct cpuset *trialcs;
>   	int retval = -ENODEV;
>   
> -	/* root is read-only */
> -	if (cs == &top_cpuset)
> +	/* root is read-only; except for unavailable mask */
> +	if (file_type != FILE_UNAVAILABLE_CPULIST && cs == &top_cpuset)
> +		return -EACCES;
> +
> +	/* unavailable mask can be only set on root. */
> +	if (file_type == FILE_UNAVAILABLE_CPULIST && cs != &top_cpuset)
>   		return -EACCES;
>   
>   	buf = strstrip(buf);
> @@ -3330,6 +3410,9 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>   	case FILE_MEMLIST:
>   		retval = update_nodemask(cs, trialcs, buf);
>   		break;
> +	case FILE_UNAVAILABLE_CPULIST:
> +		retval = update_unavailable_cpumask(buf);
> +		break;
>   	default:
>   		retval = -EINVAL;
>   		break;
> @@ -3338,6 +3421,8 @@ ssize_t cpuset_write_resmask(struct kernfs_open_file *of,
>   	free_cpuset(trialcs);
>   	if (force_sd_rebuild)
>   		rebuild_sched_domains_locked();
> +	if (cpu_turned_unavailable)
> +		cpuset_notify_unavailable_cpus();
>   out_unlock:
>   	cpuset_full_unlock();
>   	if (of_cft(of)->private == FILE_MEMLIST)
> @@ -3386,6 +3471,9 @@ int cpuset_common_seq_show(struct seq_file *sf, void *v)
>   	case FILE_ISOLATED_CPULIST:
>   		seq_printf(sf, "%*pbl\n", cpumask_pr_args(isolated_cpus));
>   		break;
> +	case FILE_UNAVAILABLE_CPULIST:
> +		seq_printf(sf, "%*pbl\n", cpumask_pr_args(unavailable_cpus));
> +		break;
>   	default:
>   		ret = -EINVAL;
>   	}
> @@ -3524,6 +3612,15 @@ static struct cftype dfl_files[] = {
>   		.flags = CFTYPE_ONLY_ON_ROOT,
>   	},
>   
> +	{
> +		.name = "cpus.unavailable",
> +		.seq_show = cpuset_common_seq_show,
> +		.write = cpuset_write_resmask,
> +		.max_write_len = (100U + 6 * NR_CPUS),
> +		.private = FILE_UNAVAILABLE_CPULIST,
> +		.flags = CFTYPE_ONLY_ON_ROOT,
> +	},
> +
>   	{ }	/* terminate */
>   };
>   
> @@ -3814,6 +3911,8 @@ int __init cpuset_init(void)
>   	BUG_ON(!alloc_cpumask_var(&top_cpuset.exclusive_cpus, GFP_KERNEL));
>   	BUG_ON(!zalloc_cpumask_var(&subpartitions_cpus, GFP_KERNEL));
>   	BUG_ON(!zalloc_cpumask_var(&isolated_cpus, GFP_KERNEL));
> +	BUG_ON(!zalloc_cpumask_var(&unavailable_cpus, GFP_KERNEL));
> +	BUG_ON(!zalloc_cpumask_var(&available_tmp_mask, GFP_KERNEL));
>   
>   	cpumask_setall(top_cpuset.cpus_allowed);
>   	nodes_setall(top_cpuset.mems_allowed);
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index ee7dfbf01792..13d0d9587aca 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2396,7 +2396,7 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>   
>   	/* Non kernel threads are not allowed during either online or offline. */
>   	if (!(p->flags & PF_KTHREAD))
> -		return cpu_active(cpu);
> +		return (cpu_active(cpu) && !cpuset_cpu_unavailable(cpu));
>   
>   	/* KTHREAD_IS_PER_CPU is always allowed. */
>   	if (kthread_is_per_cpu(p))
> @@ -3451,6 +3451,26 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>   			goto out;
>   		}
>   
> +		/*
> +		 * Only user threads can be forced out of
> +		 * unavaialable CPUs.
> +		 */
> +		if (p->flags & PF_KTHREAD)
> +			goto rude;
> +
> +		/* Any unavailable CPUs that can run the task? */
> +		for_each_cpu(dest_cpu, cpuset_unavailable_mask()) {
> +			if (!task_allowed_on_cpu(p, dest_cpu))
> +				continue;
> +
> +			/* Can we hoist this up to goto rude? */
> +			if (is_migration_disabled(p))
> +				continue;
> +
> +			if (cpu_active(dest_cpu))
> +				goto out;
> +		}
> +rude:
>   		/* No more Mr. Nice Guy. */
>   		switch (state) {
>   		case cpuset:
> @@ -3766,7 +3786,7 @@ bool call_function_single_prep_ipi(int cpu)
>    * via sched_ttwu_wakeup() for activation so the wakee incurs the cost
>    * of the wakeup instead of the waker.
>    */
> -static void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
> +void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags)
>   {
>   	struct rq *rq = cpu_rq(cpu);
>   
> @@ -5365,7 +5385,9 @@ void sched_exec(void)
>   	int dest_cpu;
>   
>   	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> -		dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
> +		int wake_flags = WF_EXEC;
> +
> +		dest_cpu = select_task_rq(p, task_cpu(p), &wake_flags);

Whats this logic?

>   		if (dest_cpu == smp_processor_id())
>   			return;
>   
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index da46c3164537..e502cccdae64 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -12094,6 +12094,61 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
>   	return ld_moved;
>   }
>   
> +static int unavailable_balance_cpu_stop(void *data)
> +{
> +	struct task_struct *p, *tmp;
> +	struct rq *rq = data;
> +	int this_cpu = cpu_of(rq);
> +
> +	guard(rq_lock_irq)(rq);
> +
> +	list_for_each_entry_safe(p, tmp, &rq->cfs_tasks, se.group_node) {
> +		int target_cpu;
> +
> +		/*
> +		 * Bail out if a concurrent change to unavailable_mask turned
> +		 * this CPU available.
> +		 */
> +		rq->unavailable_balance = cpumask_test_cpu(this_cpu, cpuset_unavailable_mask());
> +		if (!rq->unavailable_balance)
> +			break;
> +
> +		/* XXX: Does not deal with migration disabled tasks. */
> +		target_cpu = cpumask_first_andnot(p->cpus_ptr, cpuset_unavailable_mask());

This can cause it to go first CPU always and then load balancer to move it later on.
First should check the nodemask the current cpu is on to avoid NUMA costs.

> +		if ((unsigned int)target_cpu < nr_cpumask_bits) {
> +			deactivate_task(rq, p, 0);
> +			set_task_cpu(p, target_cpu);
> +
> +			/*
> +			 * Switch to move_queued_task() later.
> +			 * For PoC send an IPI and be done with it.
> +			 */
> +			__ttwu_queue_wakelist(p, target_cpu, 0);
> +		}
> +	}
> +
> +	rq->unavailable_balance = 0;
> +
> +	return 0;
> +}
> +
> +void sched_fair_notify_unavaialable_cpus(struct cpumask *unavailable_mask)
> +{
> +	int cpu, this_cpu = smp_processor_id();
> +
> +	for_each_cpu_wrap(cpu, unavailable_mask, this_cpu + 1) {
> +		struct rq *rq = cpu_rq(cpu);
> +
> +		/* Balance in progress. Tasks will be pushed out. */
> +		if (rq->unavailable_balance)
> +			return;
> +

Need to run stopper, if there is active current task. otherise that work
can be done here itself.

> +		stop_one_cpu_nowait(cpu, unavailable_balance_cpu_stop,
> +				    rq, &rq->unavailable_balance_work);
> +		rq->unavailable_balance = 1;
> +	}
> +}
> +
>   static inline unsigned long
>   get_sd_balance_interval(struct sched_domain *sd, int cpu_busy)
>   {
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index cb80666addec..c21ffb128734 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1221,6 +1221,10 @@ struct rq {
>   	int			push_cpu;
>   	struct cpu_stop_work	active_balance_work;
>   
> +	/* For pushing out taks from unavailable CPUs. */
> +	struct cpu_stop_work	unavailable_balance_work;
> +	int			unavailable_balance;
> +
>   	/* CPU of this runqueue: */
>   	int			cpu;
>   	int			online;
> @@ -2413,6 +2417,8 @@ extern const u32		sched_prio_to_wmult[40];
>   
>   #define RETRY_TASK		((void *)-1UL)
>   
> +void __ttwu_queue_wakelist(struct task_struct *p, int cpu, int wake_flags);
> +
>   struct affinity_context {
>   	const struct cpumask	*new_mask;
>   	struct cpumask		*user_mask;
> 
> base-commit: 5e8f8a25efb277ac6f61f553f0c533ff1402bd7c


