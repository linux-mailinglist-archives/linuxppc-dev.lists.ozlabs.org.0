Return-Path: <linuxppc-dev+bounces-15528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E79CD10704
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 04:15:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqHYm62Xfz2ysZ;
	Mon, 12 Jan 2026 14:15:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768187708;
	cv=none; b=EwwUuI4vINsQDZizx0C9zgcpaQhyFiNtDcayCyjfpuLetBxdX2zw0lIW64/jrKg1HIun+7ZeIKqp/f9n2IePaMrMw0ZB9KrYY5I9mGj4jp3LQc77RU2iwSaVpGYOt24nAMylg7AzYNlPs5ZaJICxzY3CBC2/iOFMPWQ2siqj1sjfP8Xq7jIjD/6UHbnsaaW0FLJMdwxgy2RjsDuc0Qar2NsRIz/xKADqt1Lkm+f4kgw4ZAG/AQK/eYD1JqOZF7j/b6NeowdUOw05QJtoxir/1TXBGDnx5+VPsg5ZKDD4MNj/tQkZv0SS8pTpHVqMzbZSf9YYm2RQIHLZ39edENY9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768187708; c=relaxed/relaxed;
	bh=u8GlQWWyxIBhozHklIBwGtUP9ekbdfMtsusbs70cLZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NQvIn+yKgWrPMp31dXpRvmV7ymp6IeofQKUaWgn9nPCBzzF31qiA1UcVNVu+6lntL5bj6QUt7yvOV/g1bY4VEg2ZaYUB6HXBZGgqDPxklgXmQbf2D8io2iCAw7L3UvLn9wGFSFrzAGo6JTU4svT4LQYT/SxV9w3MnY/IK711ow3MNKhQb8STZcnWGDK77eHdjNsGJYZ4fPZJDmzyTK/W+sIyVrKuj8M+HHDVT0Z5qD8HkEChi1JxBnlYoPBsXof2pPn7IWxyZ17k+AzsClX6sbyI8B0oUb6nTWmp8c1u/h4dysPsPi8QMYXXNucUrEqIglYssDMHezhCB+mqGZ9BOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBjQSWzW; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IBjQSWzW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqHYl3478z2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 14:15:07 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60BJkOaI011772;
	Mon, 12 Jan 2026 03:15:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=u8GlQW
	WyxIBhozHklIBwGtUP9ekbdfMtsusbs70cLZc=; b=IBjQSWzWkBslQkJH6zpzQp
	TbXynUy6J788IMIophZmlRobvbxVZkwKZcLbwguwFU6XHsbJQiXtcmN/XcLg2dyh
	ZT5ZjmdKOvGnY2UT7GuwzCBtGvnr2XEn2wT9/oS5QhocExVmZfd0vfbefnQPrdZL
	oFZ+vOaI48CYn7JxzaZSKpqcpFXavvqkxRr4W/oVCmRpZqSn86hLmFeurQvEnHe8
	l+/teTBwKpnBr6ki6lvQJgwdo9WYmyQlVTd7tH5ZrBYxsF+ZNaDf7uhE916nFAII
	TYbOLJZJzfF1zMljbH4Ykz2t39Lg1NgJRrMz3RhtB3rJ0xde0aZzckLZNu6GhXoQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke92nagx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 03:15:02 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60C2uZUW031294;
	Mon, 12 Jan 2026 03:15:02 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1bkqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 03:15:02 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60C3F0i6787140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 03:15:00 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C8D258061;
	Mon, 12 Jan 2026 03:15:00 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB1DE58056;
	Mon, 12 Jan 2026 03:14:57 +0000 (GMT)
Received: from [9.61.246.85] (unknown [9.61.246.85])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Jan 2026 03:14:57 +0000 (GMT)
Message-ID: <40c12a32-4e7c-4aa5-a77d-939468ca0e07@linux.ibm.com>
Date: Mon, 12 Jan 2026 08:44:55 +0530
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
Subject: Re: powerpc: BUG: Kernel NULL pointer when running with bcc tools
Content-Language: en-GB
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Ritesh Harjani <riteshh@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>, hbathini@linux.ibm.com,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
References: <2a71b853-f461-4327-8d44-ef97564b2b91@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <2a71b853-f461-4327-8d44-ef97564b2b91@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: g93lDSBhAnn6IzfWnUZ_St91yTxvteTl
X-Authority-Analysis: v=2.4 cv=dYyNHHXe c=1 sm=1 tr=0 ts=69646737 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=gkb95ddqhdx2lPl-xGcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAyMiBTYWx0ZWRfX3Tu+2Jbygc8E
 gapkR98YYT86mzbUmLlnO/eEUCrv6fqg3CV/MvVKUuIZTi+lxU22NaR4O2VSEuG9tMsBLDxDp8o
 ZGi/+lJjAKlyQiNhJbstHqmkjo5Ij9CKQBEvAX1bqKcmrCq0smGLTXqGp0zBEZAUIWHs7//VvLw
 1ruuvnx5+37FVNjbOymRDqTJ0oFmpQSolBDRzsJ/NMjdAAyRuiVOOtSFeAXzPuHcJFwWJJGOuZE
 schsUrj2WV5u+UH0o8y8ZTaLUFkgHKhSUWjZ0Au+Oue5mov7SFcfd/culurweioI22KoIKCW6l7
 IadbEwtXOB/DYMrbYHOUY8P02/StvkeItVAIaeAC2H5cAA5UuaxtffKglI8WWY3fyWV17/GEBqg
 cRzKkhnVwk1+PsH7ns1jElg85fE8oq4E1kgLyQzYQunPDU7p6/3RyrRZQrGTQSDSEgLCz4w2cTN
 V2YGPSZIBP9Z0yZV6iA==
X-Proofpoint-GUID: g93lDSBhAnn6IzfWnUZ_St91yTxvteTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_09,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601120022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 07/01/26 2:53 pm, Shrikanth Hegde wrote:
> Hello.
>
> While doing some tracing, observed this kernel panic on powerpc.
>
> It is quite easy reproduce this.
> - keep it preempt=full/lazy
> - enable some bcc tools. for example: ./stackcount nohz_balance_exit_idle
> - Run some workload such as "hackbench 10 process 1000 loops"
>
> I remember seeing this across other bcc tools.
>

Hello Shrikanth,


Thanks for the repro steps. I am hitting this issue on the latest 
linux-next kernel.


Regards,

Venkat.

>
>
> Seen this on tip/master:
> commit 5d3b0106245d467fd5ba0bd9a373a13356684f6e (HEAD -> master, 
> origin/master, origin/HEAD)
> Merge: 93368366738f e21279b73ef6
> Author: Ingo Molnar <mingo@kernel.org>
> Date:   Tue Jan 6 09:04:47 2026 +0100
>
>     Merge branch into tip/master: 'x86/sev'
>
>
>
> Panic log:
>  attempted to read user page (6b8) - exploit attempt? (uid: 0)
>  BUG: Kernel NULL pointer dereference on read at 0x000006b8
>  Faulting instruction address: 0xc00000000013cf10
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  CPU: 38 UID: 0 PID: 2938 Comm: hackbench Kdump: loaded Not tainted 
> 6.19.0-rc4+ #326 PREEMPT(full)
>  NIP:  c00000000013cf10 LR: c00000000013ced0 CTR: c0000000004a7f08
>  REGS: c0000000a7f96b60 TRAP: 0300   Not tainted  (6.19.0-rc4+)
>  MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 88022828 XER: 20040000
>  CFAR: c00000000050490c DAR: 00000000000006b8 DSISR: 40000000 IRQMASK: 3
>  GPR00: c00000000013ced0 c0000000a7f96e00 c000000001c38100 
> 0000000000000000
>  GPR04: 00007fffda01fea8 0000000000000008 0000000000000000 
> 00007fff94f05e84
>  GPR08: c0000000a7f90000 0000000000000000 00007fffda0205d0 
> 0000000000004000
>  GPR12: c000000002dbdddc c0000017fd891c80 c0000000001e08f4 
> 0000000000000000
>  GPR16: 0000000000000000 0000000000000000 0000000000000000 
> 00000d9842ecbda0
>  GPR20: c0000000c5c54a00 0000000000000026 0000000000000000 
> 0000000000000000
>  GPR24: 0000000000000001 fffffffffffffe00 c0000000c5c54a00 
> 000ffffffffffff8
>  GPR28: 00007fffffffffdf 0000000000000000 00007fffda01fea0 
> c0000000a7f96ef0
>  NIP [c00000000013cf10] perf_callchain_user_64+0x1b0/0x4f0
>  LR [c00000000013ced0] perf_callchain_user_64+0x170/0x4f0
>  Call Trace:
>  perf_callchain_user_64+0x170/0x4f0 (unreliable)
>  perf_callchain_user+0x20/0x3c
>  get_perf_callchain+0x1b0/0x3dc
>  bpf_get_stackid+0x94/0xec
>  bpf_prog_1ca8f9c0bc38eaa6_trace_count+0x70/0x1bc
>  trace_call_bpf+0x124/0x3c4
>  kprobe_perf_func+0x54/0x2f8
>  kprobe_ftrace_handler+0x1dc/0x298
>  ftrace_regs_call+0x4/0xa0
>  nohz_balance_exit_idle+0x10/0x120
>  nohz_balancer_kick+0x50/0x3e4
>  sched_tick+0x140/0x334
>  update_process_times+0xf0/0x144
>  tick_nohz_handler+0xc4/0x274
>  __hrtimer_run_queues+0x1c4/0x480
>  hrtimer_interrupt+0x12c/0x30c
>  timer_interrupt+0x140/0x394
>  __replay_soft_interrupts+0xa0/0x154
>  arch_local_irq_restore.part.0+0x1ac/0x224
>  _raw_spin_unlock_irqrestore+0x50/0xa0
>  try_to_wake_up+0x3e8/0xa58
>  wake_up_q+0x88/0xe4
>  rwsem_wake.isra.0+0x98/0xd8
>  up_write+0xa8/0xb4
>  unlink_file_vma_batch_process+0xc8/0xf0
>  unlink_file_vma_batch_add+0x5c/0xa4
>  free_pgtables+0x110/0x394
>  exit_mmap+0x1a0/0x5a8
>  __mmput+0x64/0x194
>  exit_mm+0xe0/0x170
>  do_exit+0x21c/0x5d0
>  do_group_exit+0x4c/0xc0
>  pid_child_should_wake+0x0/0x7c
>  system_call_exception+0x128/0x390
>  system_call_vectored_common+0x15c/0x2ec
>
>
>
> Looks like venkat had reported similar one earlier.
> https://lore.kernel.org/all/49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm.com/ 
>
>
> Venkat, can you give above mentioned steps a try on linux-next latest?
>

