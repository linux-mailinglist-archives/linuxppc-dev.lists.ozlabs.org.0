Return-Path: <linuxppc-dev+bounces-15377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35917CFCD5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMzS5Vbrz2yPM;
	Wed, 07 Jan 2026 20:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777828;
	cv=none; b=HRRpYp7PYxdNqObcqvwU7iV2QihdJBzt8AFyD/L2eOMUlE+ou764P8JmGuH32Vzeyawm0ftmWFjYq0HXQvGrMQofPQtyZ3L7KIs/fKTUDeqN000vHe0L1gx0uUis3iaFrzW2U+kecrU6MSY2lwspdmPqW1xDCHDaHu4oiDwhGA8IBxln93VJSHZBrz/+lNV5zbUZS0mTSdvBMY16/MAi5LjH0AZjhiZZHI41Px+SLU6RhzZgDSqIOtkIqIT1xE6cjg91o00lECGP2GrskaPjk3Tx6TfOBAGH1FrkLAsAPaJ3rc4hwiT5fz7dpQBvHb2IwuG3ngn+Z23ULgjotT//QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777828; c=relaxed/relaxed;
	bh=D74NZhmkxNvjfZirK4yhA980pC1krzYCuzfLlGYAVyo=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Cc:Content-Type; b=g7nphLCwPTBB53Z4/gumWuK10IaKn+iiXpx/P0ssU4TVsJWcGi5i4HjdNFjKeRrjmjuZ+2juVwJamCGaXOphZPl9TmLbv5bYH25MNPP71x+VPmdQEuGfh7qUUF9iK2UWyMjYjwiCLaXmJY/KoOus21x7dMHKuwkQqCJSDV/OWy25cVa6O9Eoq++wHHxJ0g7oprQbYJaY9OzzI9CR6SB/TUsLcYji64W+t7RrI/ma+o5Hg2ho5oZrJkHlR7qhKPw+WQ1JXeWsVxnXU+sAyKIWmyqNUrYkf2PZCoQ283DvG7QhMhRx1Gc+1D+lmB9tGluvnv3/1nomnFR5S3Zet0PLHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tiGcg12L; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tiGcg12L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMzR70l0z2yGQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:23:47 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606HpTrj009924;
	Wed, 7 Jan 2026 09:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=D74NZhmkxNvjfZirK4yhA980pC1k
	rzYCuzfLlGYAVyo=; b=tiGcg12LrmZOpWM28ExKhuZNiMi/5JI7srC8kI8GBwWa
	EzIzYxF8dNbMrvJtL8pg1nEmgdo3FkPXEX2WQCjXVRS7E9etx553HgctpEUIE7kw
	oqnmo+nRhPdlKXGKEUlvWgsDKDGEzH0xfc+y6Vfj7Vy1FXctbHIxoxGZz4Gvvw4t
	Tf7ykLVa85AmGjseJDNq7vvjAbtQt+WHMASYuRr55DJrmC5k3tvUkz5lQbhfByG2
	HaF7dGyJRR3P2O0G06kqGbZOuOANrsoaM7Pyyb0ICQJ+kaHs4b6eOVHOuU3tiiYI
	cvxj+n5/EpkEcuu7aCLKRqn71UQPaYcW0SG4lZstEQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betsq8229-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:23:44 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60771rcB023487;
	Wed, 7 Jan 2026 09:23:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bg3rmcu3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 09:23:42 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6079NcQa30409112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jan 2026 09:23:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAA832004B;
	Wed,  7 Jan 2026 09:23:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FDA520040;
	Wed,  7 Jan 2026 09:23:37 +0000 (GMT)
Received: from [9.124.216.12] (unknown [9.124.216.12])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jan 2026 09:23:37 +0000 (GMT)
Message-ID: <2a71b853-f461-4327-8d44-ef97564b2b91@linux.ibm.com>
Date: Wed, 7 Jan 2026 14:53:36 +0530
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
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: powerpc: BUG: Kernel NULL pointer when running with bcc tools
Cc: Ritesh Harjani <riteshh@linux.ibm.com>,
        Athira Rajeev <atrajeev@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, hbathini@linux.ibm.com,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: shIAPMnyxN0deH0xMKhh3igadqGm-qHJ
X-Authority-Analysis: v=2.4 cv=Jvf8bc4C c=1 sm=1 tr=0 ts=695e2620 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=Ta_QHltgBEVBiHhf9-EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: shIAPMnyxN0deH0xMKhh3igadqGm-qHJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA3NSBTYWx0ZWRfX+TesCD0raQ/c
 of2pA8lMMHi9Wh2yXzv9bNFRCEH5j/y1bhSqr2ZkGY+ERzKdZvXtJbpzwEgdHKs+//bYurNwnss
 EhSGNfnW+72Fq7UBRvL3cLAp71fO5kQp4KCgV86+FsNu5Ix/yIif0HAs8VkbRE1S0XTmeq/dib3
 R2O+cKj72YKOawKmq3cYgNLKfoeeuEDES1SrrXy+TZNIAB+fY+0o9W2nMOdiTbmRWry9Ghm1OMg
 3g8FB4pLZl5/gKMfaju2Fne1gcU5YH29qxl0or88oAnsuqHhamubgculTI/ib0Np7N69CzW5wgz
 E0oc//1zfLgizNkzi6C97X0k3KMsUN0fIj7yu2zoF6gWf8jRaVEuJGmC5bKSEQOs4/NJ2m6UK60
 nR+qo/tuiP7Zmim522vt6a9+tV6R6pQdI3t4cGS1L/BIjZFYr9oPmf0fiCKp26mx05o/91gVukb
 f+cW4ptDzCYHZ/gKTew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601070075
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello.

While doing some tracing, observed this kernel panic on powerpc.

It is quite easy reproduce this.
- keep it preempt=full/lazy
- enable some bcc tools. for example: ./stackcount nohz_balance_exit_idle
- Run some workload such as "hackbench 10 process 1000 loops"

I remember seeing this across other bcc tools.



Seen this on tip/master:
commit 5d3b0106245d467fd5ba0bd9a373a13356684f6e (HEAD -> master, origin/master, origin/HEAD)
Merge: 93368366738f e21279b73ef6
Author: Ingo Molnar <mingo@kernel.org>
Date:   Tue Jan 6 09:04:47 2026 +0100

     Merge branch into tip/master: 'x86/sev'



Panic log:
  attempted to read user page (6b8) - exploit attempt? (uid: 0)
  BUG: Kernel NULL pointer dereference on read at 0x000006b8
  Faulting instruction address: 0xc00000000013cf10
  Oops: Kernel access of bad area, sig: 11 [#1]
  CPU: 38 UID: 0 PID: 2938 Comm: hackbench Kdump: loaded Not tainted 6.19.0-rc4+ #326 PREEMPT(full)
  NIP:  c00000000013cf10 LR: c00000000013ced0 CTR: c0000000004a7f08
  REGS: c0000000a7f96b60 TRAP: 0300   Not tainted  (6.19.0-rc4+)
  MSR:  8000000000001033 <SF,ME,IR,DR,RI,LE>  CR: 88022828  XER: 20040000
  CFAR: c00000000050490c DAR: 00000000000006b8 DSISR: 40000000 IRQMASK: 3
  GPR00: c00000000013ced0 c0000000a7f96e00 c000000001c38100 0000000000000000
  GPR04: 00007fffda01fea8 0000000000000008 0000000000000000 00007fff94f05e84
  GPR08: c0000000a7f90000 0000000000000000 00007fffda0205d0 0000000000004000
  GPR12: c000000002dbdddc c0000017fd891c80 c0000000001e08f4 0000000000000000
  GPR16: 0000000000000000 0000000000000000 0000000000000000 00000d9842ecbda0
  GPR20: c0000000c5c54a00 0000000000000026 0000000000000000 0000000000000000
  GPR24: 0000000000000001 fffffffffffffe00 c0000000c5c54a00 000ffffffffffff8
  GPR28: 00007fffffffffdf 0000000000000000 00007fffda01fea0 c0000000a7f96ef0
  NIP [c00000000013cf10] perf_callchain_user_64+0x1b0/0x4f0
  LR [c00000000013ced0] perf_callchain_user_64+0x170/0x4f0
  Call Trace:
  perf_callchain_user_64+0x170/0x4f0 (unreliable)
  perf_callchain_user+0x20/0x3c
  get_perf_callchain+0x1b0/0x3dc
  bpf_get_stackid+0x94/0xec
  bpf_prog_1ca8f9c0bc38eaa6_trace_count+0x70/0x1bc
  trace_call_bpf+0x124/0x3c4
  kprobe_perf_func+0x54/0x2f8
  kprobe_ftrace_handler+0x1dc/0x298
  ftrace_regs_call+0x4/0xa0
  nohz_balance_exit_idle+0x10/0x120
  nohz_balancer_kick+0x50/0x3e4
  sched_tick+0x140/0x334
  update_process_times+0xf0/0x144
  tick_nohz_handler+0xc4/0x274
  __hrtimer_run_queues+0x1c4/0x480
  hrtimer_interrupt+0x12c/0x30c
  timer_interrupt+0x140/0x394
  __replay_soft_interrupts+0xa0/0x154
  arch_local_irq_restore.part.0+0x1ac/0x224
  _raw_spin_unlock_irqrestore+0x50/0xa0
  try_to_wake_up+0x3e8/0xa58
  wake_up_q+0x88/0xe4
  rwsem_wake.isra.0+0x98/0xd8
  up_write+0xa8/0xb4
  unlink_file_vma_batch_process+0xc8/0xf0
  unlink_file_vma_batch_add+0x5c/0xa4
  free_pgtables+0x110/0x394
  exit_mmap+0x1a0/0x5a8
  __mmput+0x64/0x194
  exit_mm+0xe0/0x170
  do_exit+0x21c/0x5d0
  do_group_exit+0x4c/0xc0
  pid_child_should_wake+0x0/0x7c
  system_call_exception+0x128/0x390
  system_call_vectored_common+0x15c/0x2ec



Looks like venkat had reported similar one earlier.
https://lore.kernel.org/all/49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm.com/

Venkat, can you give above mentioned steps a try on linux-next latest?

