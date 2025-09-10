Return-Path: <linuxppc-dev+bounces-12001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA34B51F36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:44:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSjr0sdjz3dTk;
	Thu, 11 Sep 2025 03:44:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526255;
	cv=none; b=iBGqSInrlXMK1OpMPjtSgKD+PSHoBysJ/9fRbcyq85kClFTqgOaZXB6RFUXHfRABH30BDU7hcQP7n6xnpheBzlu1FKdtbGdAZaHoike2uqkFaJCHd6g3FdXh+FvokZ2skadGC/7H8Dp0WTn0TXrZmK/275yENYOsLh+n4KJ/8+9flEoIHHCBYlDBw9GIdAMp5PSWZ0b/uz/bzqYMHYIHqpCRnzgwkAkfAhD4Hn8+tzzuj8mGsvhWlRb9KBJoTpkOMAvuap0d3q+FRPBHtV/QiAS+i5rqXKpncKPOxHoZ/6LFUnhbv+OSMSFpCXJnprJm0Q22RZlCwco1mNwxI+Ld+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526255; c=relaxed/relaxed;
	bh=P9u3logqu73n7HIQy9aatRfDsAm363pZHQ5Ipi5qTOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TdjJbMzvhpg+b3VI86yoigBzYnfbEEWYHxHml3O1N/nzyT+VgVG6ZuR4VKmsME/xwHaZ4+56ieBS0PiVTM1ptfg6murPx0QuNp7BG4mwx+rOkwVNJyDteyFyl5yv5Ja3sGMLtm0kkrknjUpCeycMUDo0yi7zLPyFcH/3Tpj9ZTKvBvWdiHqK0DmaGbQkcJsSW5c8VZrWf0Ry2Z+tqFCmZEJBX9CkNX08Qc3qPfAd6Rw1J1eWP8b0OsSABPz1z6F13Yjl+NJLTe1zCTkH2YyTiF730aRSAX4E2uWvdT4ppvJQDrXIriiBIPinvn1lTZtBPIxReF8Po6TAl6t4+PwpGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rRfSfDTn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rRfSfDTn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSjp4RYvz3dSk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:14 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A9N5sm018068;
	Wed, 10 Sep 2025 17:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=P9u3logqu73n7HIQy9aatRfDsAm363pZHQ5Ipi5qT
	OY=; b=rRfSfDTnMaMI/fYGxp1Vd2bTc0acr0uwOrawQzqibqFasD2KyfYX1pyd3
	SVTUd3q1OGmySWqMaw7blLXUv7KJpcVqbWrs3SskEvIC+4c+6xVpuTYhpB+3ylIl
	L1nwlqMxqokPxHckhEWh7Abye/GKzQNr7Z4GI9Yvc+Xsv5BV/3noGd017XQ09/cj
	7cjaSP/l/2ZsTap0QCKW4rFPSPpnJslkmktzDB70J+KKXHYS9jBmwuIH1zHoBEGR
	ozhOv5ViQqPp4B4QpCQMsBVBq8xicmgjxCvNUxRR6ivpRVh3zx+jxfqukBUGtm+M
	JorALhd1YrNommR5awGqn3sLORIHA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsycj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHh5YD005066;
	Wed, 10 Sep 2025 17:43:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsychw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AFskgB011447;
	Wed, 10 Sep 2025 17:43:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9uj012-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:43:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHhYBr20709844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:43:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A26120043;
	Wed, 10 Sep 2025 17:43:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9C1220040;
	Wed, 10 Sep 2025 17:43:27 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:43:27 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 00/10] paravirt CPUs and push task for less vCPU preemption
Date: Wed, 10 Sep 2025 23:12:00 +0530
Message-ID: <20250910174210.1969750-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfXzl31pObr4hcf
 TPuFgq6goUYUxavNWDmDlgRvuZIfluL/H+cZaJ0s0rfXFMF7gkxF+kldCZ6mw9W99MbvDvkPV2d
 5l6RcWUFB55l6h18UCS8HJIsRuSrBJvquc+7D5uhFTxp7a0YAWcY4KfISOpYkDMGNrezfHPhwph
 NZSv6qXlE9ZaMHJw79dHL2fbbxEGeOiAGC+CSHJRfF0M7LDdaJ53CbTUWPuGpFeusPiTSz5op+s
 c1FTLz2bNW3y0fOwWpU/OLWWkjIlzzZ8zH+GQTM2DZeSrd+4IEzy0gLuE4HyEf0CTBKI0mSDdK3
 vuBI+u4Zu7kVYIBu0wp/YF6BV2TAYuk3PXnSfJKo9NOxRxfsBJHsUJNbCgycDeq5Ze/f69rVMYi
 gsLhyPcQ
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c1b8cb cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=hFtaOhxwmeujMiCyABMA:9
X-Proofpoint-GUID: mwSIF66BRE0IPJErI7bjBgJBIupjPnkN
X-Proofpoint-ORIG-GUID: VxakH01rzkOSRLf9H7UyMFxQnihcNamH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

tl;dr

This is follow up of [1] with few fixes and addressing review comments.
Upgraded it to RFC PATCH from RFC. 
Please review. 

[1]: v2 - https://lore.kernel.org/all/20250625191108.1646208-1-sshegde@linux.ibm.com/

v2 -> v3:
- Renamed to paravirt CPUs
- Folded the changes under CONFIG_PARAVIRT.
- Fixed the crash due work_buf corruption while using
  stop_one_cpu_nowait. 
- Added sysfs documentation.
- Copy most of __balance_push_cpu_stop to new one, this helps it move 
  the code out of CONFIG_HOTPLUG_CPU. 
- Some of the code movement suggested. 

-----------------
::Detailed info:: 
-----------------
Problem statement 

vCPU - Virtual CPUs - CPU in VM world.
pCPU - Physical CPUs - CPU in baremetal world.

A hypervisor does scheduling of vCPUs on a pCPUs. It has to give each
vCPU some cycles and be fair. When there are more vCPU requests than
the pCPUs, hypervsior has to preempt some vCPUs in order to run others.
This is called as vCPU preemption.

If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from 
VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
each other and request for limited  vCPUs, it avoids the above overhead and 
there is context switching within vCPU(less expensive). Even if hypervisor
is preempting one vCPU to run another within the same VM, it is still more 
expensive than the task preemption within the vCPU. So basic aim to avoid 
vCPU preemption.

So to achieve this, introduce "Paravirt CPU" concept, where it is better if
workload avoids these vCPUs at this moment. (vCPUs stays online, don't want
the overhead of sched domain rebuild and hotplug takes a lot of time too).

When there is contention, don't use paravirt CPUs.
When there is no contention, use all vCPUs. 

----------------------------------
Implementation details and choices

- current version copies most of code in __balance_push_cpu_stop. This
  was done to avoid the CONFIG_HOTPLUG_CPU dependency and move it
  under CONFIG_PARAVIRT. This also allows fixing the race in
  stop_one_cpu_nowait. Hacks are needed in __balance_push_cpu_stop
  otherwise. 

- Did explore using task_work_add instead of stop_one_cpu_nowait,
  something similar to what mm_cid does. It ended up in locking up the
  system sometimes. Takes slightly longer to move tasks compared to
  stop_one_cpu_nowait

- Tried using push_cpu_stop instead of adding more code. Made it work 
  for CFS by adding find_lock_rq. But rt tasks fail to move out of paravirt
  CPUs completely. There is like 5-10% utilization left. Maybe it races
  with pull/push rt tasks since they all use push_busy for gating.

- Kept the helper patch where one could specify the cpulist to set the
  paravirt CPUs. It helped to uncover some of the corner cases. Such as
  if say CPUs 0-100 are marked as paravirt. Number based debug file didn't do
  that. Nature of hint could change, so kept both the flavours as of now.
  Depending on how hint design goes will change it accordingly.

---------------------
bloat-o-meter reports

- CONFIG_PARAVIRT=y
add/remove: 12/0 grow/shrink: 14/0 up/down: 1767/0 (1767)
Function                                     old     new   delta
paravirt_push_cpu_stop                         -     479    +479
push_current_from_paravirt_cpu                 -     410    +410
store_paravirt_cpus                            -     174    +174
...
Total: Before=25132435, After=25134202, chg +0.01%
Values depend on NR_CPUS. Above data is for NR_CPUS=64 on x86.

add/remove: 18/3 grow/shrink: 26/12 up/down: 5320/-484 (4836)
Function                                     old     new   delta
__cpu_paravirt_mask                            -    1024   +1024
paravirt_push_cpu_stop                         -     864    +864
push_current_from_paravirt_cpu                 -     648    +648
...
Total: Before=30273517, After=30278353, chg +0.02%
on PowerPC with NR_CPUS=8192.


- CONFIG_PARAVIRT=n
add/remove: 0/0 grow/shrink: 2/1 up/down: 35/-32 (3)
Function                                     old     new   delta
select_task_rq_fair                         4376    4395     +19
check_preempt_wakeup_fair                    895     911     +16
set_next_entity                              659     627     -32
Total: Before=25106525, After=25106528, chg +0.00%

------------------------------
Functional and Performance data

- tasks move out of paravirt CPUs quite fast. Even when system is
  heavily loaded, max it takes 1-2 seconds for tasks to move out of all
  paravirt CPUs.

- schbench results. Experiments were done on a system with physical 94 cores.
  Two Shared Processor LPARs(VMs). LPAR1 has 90 Cores(entitled 60) and
  LPAR2 has 64 Cores(entitled 32). Entitled here means it should get those
  many cores worth of cycles at least. When both LPAR run at high
  utilization at the same time, there will be contention and high steal
  time was seen. When there is contention, the non-entitled number of
  Cores were made as paravirt CPUs. In another experiment non-entitled
  cpus were hotplugged. Both data below shows advantage in using
  paravirt CPUs instead.
  LPAR1 is running schbench and LPAR2 is running stress-ng intermittently
  i.e busy/idle (stress-ng is running for 60sec and then idle for 60 sec)

Wakeup Latencies      Out of Box        cpu_hotplug       cpu_paravirt
50.0th: 		15		   15			14
90.0th: 		70         	   25                   19
99.0th: 	      3084		  345                   95 
99.9th: 	      6184               3004                  523

  When the busy/idle duration is reduced close to 10 seconds in LPAR2,
  the benefit of cpu_paravirt reduces. cpu_hotplug wont work in those
  cases at all since hotplug operation itself takes close to 20+
  seconds. Benefit of cpu_paravirt shows up compared to out of box when
  the busy/idle duration is greater than 10 seconds. When the concurrency
  of the system is lowered, benefit is seen even with 10 seconds. So
  using paravirt CPUs will likely help workloads which are sensitive to
  latency.
------------
Open issues: 

- Derivation of hint from steal time is still a challenge. Some work is
  underway to address it. 

- Consider kvm and other hypervsiors and how they could derive the hint.
  Need inputs from community. 

- make irqbalance understand cpu_paravirt_mask. 

- works on nohz_full cpus somewhat, but doesn't completely move out of few CPUs.
  Was wondering if it would work at all since tick is usually disabled there. 
  Need to understand/investigate further. 

Shrikanth Hegde (10):
  sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
  cpumask: Introduce cpu_paravirt_mask
  sched: Static key to check paravirt cpu push
  sched/core: Dont allow to use CPU marked as paravirt
  sched/fair: Don't consider paravirt CPUs for wakeup and load balance
  sched/rt: Don't select paravirt CPU for wakeup and push/pull rt task
  sched/core: Push current task from paravirt CPU
  sysfs: Add cpu paravirt file
  powerpc: Add debug file for set/unset paravirt CPUs
  sysfs: Provide write method for paravirt

 .../ABI/testing/sysfs-devices-system-cpu      |   9 ++
 Documentation/scheduler/sched-arch.rst        |  37 +++++++
 arch/powerpc/include/asm/paravirt.h           |   1 +
 arch/powerpc/kernel/smp.c                     |  58 ++++++++++
 drivers/base/base.h                           |   4 +
 drivers/base/cpu.c                            |  53 +++++++++
 include/linux/cpumask.h                       |  15 +++
 kernel/sched/core.c                           | 103 +++++++++++++++++-
 kernel/sched/fair.c                           |  15 ++-
 kernel/sched/rt.c                             |  11 +-
 kernel/sched/sched.h                          |  26 ++++-
 11 files changed, 325 insertions(+), 7 deletions(-)

-- 
2.47.3


