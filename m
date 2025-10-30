Return-Path: <linuxppc-dev+bounces-13572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A69DC21894
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 18:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyBL325Dhz3btC;
	Fri, 31 Oct 2025 04:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761846219;
	cv=none; b=k1k4kyLk1eZREXsXpFi6aDoCWmtx4jogb/V0axfkmba1bQXnUxen2zcTaFaGHRXki3LnzalQnCkvqEQ9tugQ1mPmesNVNwtPNZFH/18x5NKGXrhd6vo2L5n8gsvsipMGu7/Xd0PL7yyOT6UKCsM/vfiQh6DNCUCcDL6jQa7UYVuWcIkvQDLBUoSkluaP7BQzuXW7Q2/n9bCPoWuGWPcNnLoyrH8nB1bqSZphacTpp196vni2il8UE9IEjWvcODn687ON2nN2+V2JKj8YD/1f7U7i3rBccqmLnHhkyUucXFK0tJ+qX1V/ishzPyvms4fK7AoDC7ZkI8aS5YWhfTF5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761846219; c=relaxed/relaxed;
	bh=ZgtSx7hhIOtzVUgoXwdyB16XAmwdV9aviNEVG77sTUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTDk0li/Yeij2xxRz2iTYUreeM54u/vtqQxv+HpdVdCnOtmNHiPd3XM1dp9yzn1noZ9INSXmEkFtCwveFhLVqaHU3Cv+WnZNnqw9iBFKXPGtBnNyRxmw0uZCNmLKgpXe1idh/2MqJQPOMvEhX5GSpXcTPBT9LzwSfgbD2JRx20kxL6bOd85K90rIjvJ7Evb7liFebx6JcjWHRNzVMtACK+QSW2lvXuSggzAxs39e0bApP0p14FHcwuWW9zzNM/cN0RrXwmoNaXUe8E/msvxuxg4yDLRkzMjeqmAzbzbMyJVDEV+sF1S8bs6fQBliJq1N9/iTxNPjHZQtlcPN02X2HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VfPQhj/W; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VfPQhj/W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyBL209Nwz2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 04:43:37 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59UD7UCp008812;
	Thu, 30 Oct 2025 17:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZgtSx7
	hhIOtzVUgoXwdyB16XAmwdV9aviNEVG77sTUo=; b=VfPQhj/WMHDu+A6yd1baql
	egc9Ic+/yN8UsWtTA9O2zuZmpQDKW8Jclxjao0EcNf9DP2v3Hgtf5wkdne4qKRNo
	km26BqqPNveZo7LxAqHIloQ3g8Q2e010I2qTN3wcfXM5ycScquqNWUqjZ9Pp6Swi
	2Wd7ZCoG+fk8W7QnVV4eAMb29rpPNmJCRGbbyIAW9e3OC4Lo1fQI6WJQwybazgeQ
	Vuf++dg3S8C1w1SKZ2RfK7eD/NhNv/95Wxa0PCMqsxX5ajVKQhImS31N0H+4/bri
	y1T+6LojBvVBJ+9XXI4Z4bSSyVnNLZ5s+zox42b1cub5taXqseRrgwIejIaLBh+w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhy5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 17:43:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59UHS6OI008360;
	Thu, 30 Oct 2025 17:43:22 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34afhy5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 17:43:22 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59UGHtXa027546;
	Thu, 30 Oct 2025 17:43:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33w2t4wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 17:43:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59UHhHgu44368364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 17:43:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 405D420040;
	Thu, 30 Oct 2025 17:43:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F6D020043;
	Thu, 30 Oct 2025 17:43:13 +0000 (GMT)
Received: from [9.124.211.3] (unknown [9.124.211.3])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Oct 2025 17:43:13 +0000 (GMT)
Message-ID: <6f2d4aa8-6bde-4cda-b6d9-c6c46cf01e78@linux.ibm.com>
Date: Thu, 30 Oct 2025 23:13:12 +0530
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
Subject: Re: [RFC PATCH v3 00/10] paravirt CPUs and push task for less vCPU
 preemption
To: Sean Christopherson <seanjc@google.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org,
        vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
        jgross@suse.com, pbonzini@redhat.com
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <aPZIGCFk-Rnlc1yT@google.com>
 <48d66446-40be-4a4e-a5af-c19e0b8d9182@linux.ibm.com>
 <aPkmdsnG1qsaW3Ro@google.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aPkmdsnG1qsaW3Ro@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RtUGJCXH1f5m0RG4eKTx-Pg0iKkwRz7f
X-Authority-Analysis: v=2.4 cv=WPhyn3sR c=1 sm=1 tr=0 ts=6903a3bb cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=OYDx72yix90wosouAF0A:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfXyE9BjXBzDY/u
 b9sZP8AnMZjFSdAuCfovLnKzz+nkdCrDnt3T5EJGojkWyziDD2wtGT4dysk7b/XXhzXg0ewC4aP
 ng2Z0geVchGfaBYR9UITiD8An63+azQc4jhXNlyYCoV00FyUOiizft2VkC0TtdOAw/loaIYanQm
 GTPlv9dmHbrM9hA/cMJ4XKWZxmNZPnpYD169ZNvA2vbF0oi8hmMPVGwzSAHYeM0ZMxbbSfVvike
 yXQcwW6v1fElN+FH0PUBTfNm47/wstXC6+kYOuO7lyYwtoxbyiYODSMgZmghrV8AmehaynZdV9A
 M4uMOJeuncvnMFdGLTzlCM1ScXJyPBXuaPWTcE8ybpOK3ZDVB8k4I8pP/bCUa269BYIL8BlpDtM
 8AIxa4AC8tgtUNBngW2VfEFq5qhv5Q==
X-Proofpoint-ORIG-GUID: nSlmmbq9yv6w9KmI679Py5cIozB8NtD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Sean.

On 10/23/25 12:16 AM, Sean Christopherson wrote:
> On Tue, Oct 21, 2025, Shrikanth Hegde wrote:
>>
>> Hi Sean.
>> Thanks for taking time and going through the series.
>>
>> On 10/20/25 8:02 PM, Sean Christopherson wrote:
>>> On Wed, Sep 10, 2025, Shrikanth Hegde wrote:
>>>> tl;dr
>>>>
>>>> This is follow up of [1] with few fixes and addressing review comments.
>>>> Upgraded it to RFC PATCH from RFC.
>>>> Please review.
>>>>
>>>> [1]: v2 - https://lore.kernel.org/all/20250625191108.1646208-1-sshegde@linux.ibm.com/
>>>>
>>>> v2 -> v3:
>>>> - Renamed to paravirt CPUs
>>>
>>> There are myriad uses of "paravirt" throughout Linux and related environments,
>>> and none of them mean "oversubscribed" or "contended".  I assume Hillf's comments
>>> triggered the rename from "avoid CPUs", but IMO "avoid" is at least somewhat
>>> accurate; "paravirt" is wildly misleading.
>>
>> Name has been tricky. We want to have a positive sounding name while
>> conveying that these CPUs are not be used for now due to contention,
>> they may be used again when the contention has gone.
> 
> I suspect part of the problem with naming is the all-or-nothing approach itself.
> There's a _lot_ of policy baked into that seemingly simple decision, and thus
> it's hard to describe with a human-friendly name.
> 

open for suggestions :)

>>>> Open issues:
>>>>
>>>> - Derivation of hint from steal time is still a challenge. Some work is
>>>>     underway to address it.
>>>>
>>>> - Consider kvm and other hypervsiors and how they could derive the hint.
>>>>     Need inputs from community.
>>>
>>> Bluntly, this series is never going to land, at least not in a form that's remotely
>>> close to what is proposed here.  This is an incredibly simplistic way of handling
>>> overcommit, and AFAICT there's no line of sight to supporting more complex scenarios.
>>>
>>
>> Could you describe these complex scenarios?
> 
> Any setup where "don't use this CPU" isn't a viable option, e.g. because all cores
> could be overcommitted at any given time, or is far, far too coarse-grained.  Very
> few use cases can distill vCPU scheduling needs and policies into single flag.
> 

Okay. Let me explain whats the current thought process is.
  
On S390 and pseries are the current main use cases.

On S390, Z hypervisor provides distinction among vCPUs. vCPU are marked as Vertical High,
Vertical Medium and Vertical Low. When there is a steal time it is recommended
to use Vertical Highs and avoid using Vertical Lows. In such cases, using this infra, one
can avoid scheduling anything on these vertical low vCPUs. Performance benefit is
observed since there is less contention and CPU cycles are mainly from Vertical Highs.

On PowerVM hypervisor, hypervisor dispatches full core at a time. all SMT=8 siblings are dispatched
to the same core always. That means it beneficial to schedule on vCPU siblings together at core level.
When there is contention for pCPU full core is preempted. i.e all vCPU belonging to that core would be
preempted. In such cases, depending on the configuration of overcommit, and depending on the steal time
one could limit the number of cores usage by using limited vCPUs. When done in that way, we see better
latency numbers and increase in throughput compared to out-box. The cover letter has those numbers.

Now, lets come to KVM with Linux running as Hypervisor. Correct me if i am wrong.
each vCPU in KVM will be a process in the host. when vCPU is running, that process will be in
running state as well. When there is overcommit and all vCPU are running, there will be more
process than number of physical CPUs and host has to context switch and will preempt one vCPU
to run another. It can also preempt vCPU to run some host process.
If we restrict the number of vCPU where workload is currently running, then
number of runnable process in the host also will reduce and less chance of host context switches.
Since this avoid any overhead of kvm context save/restore the workload is likely to benefit.

I guess it is possible to distinguish between host process and vCPU running as process.
If so, host can decide how many threads it can optimally run and give signal to each guest
depending on the configuration.

Currently keeping it arch dependent, since IMHO it is each Hypervisor is in right place to
make decision. Not sure if one fit for all approach works here.


Another tricky point is how this signal is going to be. It could be hcall, or vpa area
or some shared memory region or using bpf method similar to vCPU boosting patch series.
There too, i think it is best to leave to arch to specify how. the reason being bpf method
will not work for powerVM hypervisors.

> E.g. if all CPUs in a system are being used to vCPU tasks, all vCPUs are actively
> running, and the host has a non-vCPU task that _must_ run, then the host will need
> to preempt a vCPU task.  Ideally, a paravirtualized scheduling system would allow

Host/Hypervsior need not make the vCPU as "Not use" every single time it preempts.
It needs to do so, only when there are more vCPU processes than number of physical CPUS and
preemption is happening between vCPU process.

There would be corner cases such as only one physical process is there, and two
KVM each with one vCPU, then nothing much can be done.

> the host to make an informed decision when choosing which vCPU to preempt, e.g. to
> minimize disruption to the guest(s).


