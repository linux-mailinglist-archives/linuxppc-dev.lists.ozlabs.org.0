Return-Path: <linuxppc-dev+bounces-14856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6A8CCA504
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 06:23:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWzbw4v6gz2xqm;
	Thu, 18 Dec 2025 16:23:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766035436;
	cv=none; b=ExYaMF2F63JgHoPkAVbBzymIJ7uQOjyMPDnijbKt/s5HYorYNlk5mO8dutgvfHPvBOjANfW4SyCpWvKtGII6jXo7GG6nxI5NgCgXIhsJ7hVLg6PzanV6YRebS8i7+29vfnV0HAFBBVPDMW8oGI7k3W9iZXB9+Yuu2WEnalD/q09R46jIroCyG95hOCDJ6I5eAF2pCmd2ph8DzRwjSwf7/qiOsxAE3waS08AEYsEc6nzjhTIKNSozm3zVGUMIaeyE8k3j/4hxaIps07XMPUf/cIi+etoYeEPfw/4cDGvD/RWFzCR6aFKkK8dh9UzvKGmMF2wTXskcfe7zRuVlWpJWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766035436; c=relaxed/relaxed;
	bh=ZzZcTG0OmDBiEmcskoM2ObPGdD017Xm02WOoMNyv6gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FXX4kXwuUIkRodndPB3aV720adF24e7O9iHypTMTvHQqJy2NJuoz5Vywp2ASRHO3Kl3u1DJCLYCEBt/rHQEDgrqugFXFlgNzNhjfhK2I0H95G03JpWym20hSJzdSk5j/PFRHBNbLUbDpNcauOJH6yq8elsHjxPBbxJEFz5cPFre8+WtaZgemVAxJLA0oFRV+H27XFx4Xr6u0ntu5a1y145rj8RjU6exMNrQASQcPFnpYGWbsLbMiIWZS7zhH48/+9Lc0J9mauaJJ0aUcjNwnOc1wBI/TT2Ds1F6c+yutnfxOBKNFlpjsDittZimX3pzG8mES11APH/ZZwPzLx48vfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dcTZwNRs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dcTZwNRs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWzbt62kSz2xPB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 16:23:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHIbHC0015244;
	Thu, 18 Dec 2025 05:22:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZzZcTG
	0OmDBiEmcskoM2ObPGdD017Xm02WOoMNyv6gc=; b=dcTZwNRsmuLFSU1HBFvDNH
	ihn8R/quSeNPcV3BhuWfBVZKES0WW1UI+6ZnxunAPQApiOvt+lDJeRl88eju8a80
	XmB3KAvSfaJoikHZUIi/HIZtWnFfloP7hiCQOkBRnbgQyRq/8JSJNlIq61cX98bn
	D9xnN65Ts9z5N2SI50j5RmhGqzl+E20jmecMN94Mcm8NWibpOcGyUwGUQXeo4jp9
	6Rl7tN4sH7vrLnl1Zo/B1wttNYFne4g7c3BVr/cqYqZlquxyh2FprTSW7fImQ9ed
	Z/CNqleFQ23sg9yevpfhTLy1SSW/FDgx9r82UC6u0v3dehVOVO9KvNgrhtZUajNQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvbgv8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:22:55 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BI5MtMl000695;
	Thu, 18 Dec 2025 05:22:55 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yvbgv8w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:22:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BI22H2G002835;
	Thu, 18 Dec 2025 05:22:53 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfnejkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 05:22:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BI5Mn7B43778526
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 05:22:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99F3820040;
	Thu, 18 Dec 2025 05:22:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 504F720043;
	Thu, 18 Dec 2025 05:22:45 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 05:22:45 +0000 (GMT)
Message-ID: <b8d6d83c-00d8-4b66-8470-62cc528e1d6b@linux.ibm.com>
Date: Thu, 18 Dec 2025 10:52:44 +0530
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
To: Yury Norov <yury.norov@gmail.com>, vincent.guittot@linaro.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, tglx@linutronix.de, maddy@linux.ibm.com,
        srikar@linux.ibm.com, gregkh@linuxfoundation.org, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu, linux-s390@vger.kernel.org
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <4ddbb5a1244cf444f330cc73b7d573f47b02f7eb.camel@linux.ibm.com>
 <8368868e-48aa-4a90-95d1-1be4de9879e8@linux.ibm.com> <aUBHw7MvOQYusuuA@yury>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aUBHw7MvOQYusuuA@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V/JwEOni c=1 sm=1 tr=0 ts=69438faf cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jJrOw3FHAAAA:8 a=vF6UPvp_E7XLvFInzeAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: krSORBQ2V2XXnx5eYIGc9CtvNKZ1mC_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX0eguy5oAFUvC
 ctDt8XKS6O0Jv+lQn5RwEBEpkoLk9i4PHenpTrhQ1wCCiFuk97oKdiAGRRVn7shFSS6/z3SJrXJ
 qNrKdeaS/9BSOcMLQq8nk7PHEips7b4yNn85j6D50pMixG931+t71cE3Pnr1rew8HsFK/glksaE
 tQHn/WSOJRERIzct3G/zK2i1uAgEXUok9Zjzmy8YEwpog5yCyx9VMWzH9pNZ/EOig9PUCT8aBQp
 2k5FJX8M0vfhj3y5LR+y9UGmbEfHOSR6EYylkvfQ/ds7XIVDAjEIsj8tt+YvjpbN+URjYxE90R4
 gGGW1Mey1Gyka03LJXKeEheot4k3ACm11A8gh4sBtCN74gialR4JT36uUNjqWoCISeetgm5zImj
 MZvVzpYVZj94claj5SJHyCtRGbe3WQ==
X-Proofpoint-ORIG-GUID: Odaz5qhoeBRCHpE_BMjML7cvEGDqeNys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi, Sorry for delay in response. Just landed yesterday from LPC.

>>> Others have already commented on the naming, and I would agree that
>>> "paravirt" is really misleading. I cannot say that the previous "cpu-
>>> avoid" one was perfect, but it was much better.
>   
> It was my suggestion to switch names. cpu-avoid is definitely a
> no-go. Because it doesn't explain anything and only confuses.
> 
> I suggested 'paravirt' (notice - only suggested) because the patch
> series is mainly discussing paravirtualized VMs. But now I'm not even
> sure that the idea of the series is:
> 
> 1. Applicable only to paravirtualized VMs; and
> 2. Preemption and rescheduling throttling requires another in-kernel
>     concept other than nohs, isolcpus, cgroups and similar.
> 
> Shrikanth, can you please clarify the scope of the new feature? Would
> it be useful for non-paravirtualized VMs, for example? Any other
> task-cpu bonding problems?

Current scope of the feature in virtulaized environment where the idea is
to do co-operative folding in each VM based on hint(either HW hint or steal time).

If you see from macro level, this is framework which allows one to avoid some vCPUs(In
Guest) to achieve better throughput or latency. So one could come up with more usecases
even in non-paravirtualized VMs. For example, one crazy idea such as avoid using SMT siblings
when the system utilization is low to achieve higher ipc(instruction per cycle) value.

> 
> On previous rounds you tried to implement the same with cgroups, as
> far as I understood. Can you discuss that? What exactly can't be done
> with the existing kernel APIs?
> 
> Thanks,
> Yury
> 

We discussed this in Sched-MC this year.
https://youtu.be/zf-MBoUIz1Q?t=8581


Currently explored options.

1. CPU Hotplug - slow. Some efforts underway to speed it up.
2. Creating isolated cpusets - Faster. still involves sched domain rebuilds.

The reason why they both won't work is that they break user affinities in the guest.
i.e guest can do "taskset -c <some_vcpus> <workload>, when the
last vCPU goes offline(guest vCPU hotplug) in that list of vCPUs
the affinity mask is reset and workload can run on online vCPUs and it
doesn't set back to earlier value. That is okay for hotlug or isolated cpusets
since it is driven by user in the guest. So user is aware of it.

Whereas here, the change is driven by the system than user in the guest.
So it cannot break user-space affinities.
So we need a new interface to drive this. I think it is better if it is
non cgroup based framework since cgroup is usually user driven.
(correct me if i am wrong).

PS:
There were some confusion around this affinity breaking. Note it is guest vCPU being marked and
guest vCPU being hotplugged. Task affinied workload was running in guest. Host CPUs(pCPU) are not
hotplugged.

---

I had discussion with vincent in hallway, idea is to use the push framework bits and set the
CPU Capacity=1 (lowest value and consider it as special value) and use a static key check to do
this stuff only when HW says to do so.
Such as (considering name as paravirt):

static inline bool cpu_paravirt(int cpu)
{
	if (static_branch_unlikely(&cpu_paravirt_framework))
		return arch_scale_cpu_capacity(cpu) == 1;

	return false;
}

Rest of the bits remain same. I found an issue with current series where setting affinity
is going wrong after cpu is marked paravirt, i will fix it next version. will do some more
testing and send next version in 2026.

Happy Holidays!

