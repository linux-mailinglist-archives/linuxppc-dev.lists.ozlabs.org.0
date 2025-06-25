Return-Path: <linuxppc-dev+bounces-9782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EACAE8E26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:12:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBJp2PlMz30P3;
	Thu, 26 Jun 2025 05:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878730;
	cv=none; b=ZEwFkIVNMLy/tijPvwiGHCYCrIWWgdlYzzowAGX0MAP6jfoiDmz9t5GuYMjcEWDY/g/BCqYi+bOPYxg5j2diHBo6e+cbCmdPbkB0E8peHvA1Lm1jKvp27TXIFr1CtZP4xa/DPQnber8gyyK/vmtyVtT7/VmTV+ciYQvvCUgff54h7U0WxZGB90rzQUE88WsU6KMyBf1wxFBCnqY8hN0EG09cmBYR0PXPc4YDctMvQi5OFH2j5h9HpiVrjhoHBGbm9flGhA9nDZIV+7oBj65ypZheCIp0UI+QLD9gY78ff/+DWKdd1jVyczaJyi1RIpwsWHM+Bh6mASGlroqmyfZipA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878730; c=relaxed/relaxed;
	bh=5Gw1RJHHZfttkqe23HirKDPVygLFpQ1CNF9vh/05TIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YUvrvp/ilaqIH2GrtS94hXfiMOjAT8SaAYRGM0HjTfVrELCLgQXELOB4vvHWIspF4ryZqh1pSUgm15f2lbKYqVHIki2ozrwV65wbg+/Ly5cOYQD/EEflYTcGI1p/nJ3AJbWvgjfbu3len1HbpPKCUxfK/gcmftTwwf6wmcgg8Af5tzh4M7WVRUcR8DW+45OCedBOgGNT/kC5c2SvhciH3VHl0F/faG14YpUg188GF9mWYCwLyl/5jPb9fVgQBinPk44JT4tcekYGQUjlYkCRchwGQZoZaI2fw54dN2NRzxNi6PPYQlnapzSXugAl8YDHxMt3AM2kqOatWpSE2nXxJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j+5W3mGQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j+5W3mGQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBJn1RHBz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:08 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PF8EH8007226;
	Wed, 25 Jun 2025 19:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=5Gw1RJHHZfttkqe23HirKDPVygLFpQ1CNF9vh/05T
	IY=; b=j+5W3mGQGE0U9zt9Y9RrzK2xD2bOCGwpNAHfgsfUSsQyqqU5olJa0MwpS
	TAvjhzY2keWLRhu1mEFDrzEjF9mcq4KiRaj6h++g+AoXIl76m5fhQJOEYZZ15Ga2
	p8DcWO4X6SxQcXJdOZL9AJJK3pFfcVHHJmQj/h8wmvZ/2AHEpq/iiPyXrxrjIKJx
	OEhFi5zYp3zX81D9SNHqQxhlUoc8CcoF/LAkTDE1IB2uckmaMacM8c+nbELnw6db
	BhsfkmsYzwvIbXEMu80clttTfJt4SVovILMYGskatMDKaO3l9Mix/S0J9rxZe++F
	yfqgrYEkTW1I17W9ZGNfzUx6xPV/w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dk6416gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJ9Te5024643;
	Wed, 25 Jun 2025 19:11:33 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dk6416gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PH6pl3006414;
	Wed, 25 Jun 2025 19:11:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82paxun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBSqu49611032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 167FE20043;
	Wed, 25 Jun 2025 19:11:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75C7D20040;
	Wed, 25 Jun 2025 19:11:24 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:24 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 0/9] cpu avoid state and push task mechanism
Date: Thu, 26 Jun 2025 00:40:59 +0530
Message-ID: <20250625191108.1646208-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX5o4c9SK/0Mgh zXmpWixIXtu9R3zEunkOUGhJELLe9G5632mNtUBVXggPiNvj8R0Kb2nEYQuy5DFoeiF2coBgYg4 Hc69dkKE4XkC/JIOSc39I2BtFkvBu/H8J7DttqrTVBzFh5Qjcod3K5RMOqfFR82/FLfwx5TjECC
 Y53gnFlZFARS1iq69rCLhK4SNflV8P+/6klm1dQbkH3lV3/LDL1Yuorog1Cz6a4cMmyybqyTy4C AieBAhnUsi9J8tZi2jhWFUN0FLB+OcbgJ3farQ46VmvlPVu5rhch1pBwNSLWY+LSBGLy9ra/WU7 P/q9gQBq3oQB0MBNwxSFdBwn163ZDajIil4vPytNC2lXnhYUFkbyvcLbuVZq+pmXiuOZNM0hE3C
 bhY6XivfNF7kQ+X9xD402I04Eb++7uoxJuEFIwUvCYO2YKyS3MQ8jDB9gKivkbkZaEFVtXYW
X-Proofpoint-ORIG-GUID: JTNI2qIyFNqmERLTLVcxOMtf7NvJZj0x
X-Proofpoint-GUID: j6xmZrWyKUdMLHBZyoW7swMnLCf1U6rb
X-Authority-Analysis: v=2.4 cv=BfvY0qt2 c=1 sm=1 tr=0 ts=685c49e5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=rao2rHU-l_mUQkgOp-sA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 mlxlogscore=858 malwarescore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a followup version if [1] with few additions. This is still an RFC 
and would like get feedback on the idea and suggestions on improvement. 

v1->v2:
- Renamed to cpu_avoid_mask in place of cpu_parked_mask.
- Used a static key such that no impact to regular case. 
- add sysfs file to show avoid CPUs.
- Make RT understand avoid CPUs. 
- Add documentation patch 
- Took care of reported compile error in [1] when NR_CPUS=1

-----------------
Problem statement
-----------------
vCPU - Virtual CPUs - CPU in VM world.
pCPU - Physical CPUs - CPU in baremetal world.

A hypervisor is managing these vCPUs from different VMs. When a vCPU 
requests for CPU, hypervisor does the job of scheduling them on a pCPU.

So this issue occurs when there are more vCPUs(combined across all VMs) 
than the pCPU. So when *all* vCPUs are requesting for CPUs, hypervisor 
can only run a few of them and remaining will be preempted(waiting for pCPU).

If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from 
VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
each other and request for *limited*  vCPUs, it avoids the above overhead and 
there is context switching within vCPU(less expensive). Even if hypervisor
is preempting one vCPU to run another within the same VM, it is still more 
expensive than the task preemption within the vCPU. So *basic* aim to avoid 
vCPU preemption.

So to achieve this, use "CPU Avoid" concept, where it is better
if workload avoids these vCPUs at this moment.
(vCPUs stays online, we don't want the overhead of sched domain rebuild).

Contention is dynamic in nature. When there is contention for pCPU is to be 
detected and determined by architecture. Archs needs to update the mask 
accordingly.

When there is contention, use limited vCPUs as indicated by arch.
When there is no contention, use all vCPUs.

-------------------------
To be done and Questions: 
-------------------------
1. IRQ - still don't understand this cpu_avoid_mask. Maybe irqbalance
code could be modified to do the same. Ran stress-ng --hrtimers, irq
moved out of avoid cpu though. So need to see if changes to irqbalance is
required or not.

2. If a task is spawned by affining to only avoid CPUs. Should that fail
or throw a warning to user. 

3. Other classes such as SCHED_EXT, SCHED_DL won't understand this infra
yet.

4. Performance testing yet to be done. RFC only verified the functional
aspects of whether task move out of avoid CPUs or not. Move happens quite
fast (around 1-2 seconds even on large systems with very high utilization) 

5. Haven't come up an infra which could combine all push task related
changes. It is currently spread across rt, dl, fair. Maybe some
consolidation can be done. but which tasks to push/pull still remains in
the class. 

6. cpu_avoid_mask may need some sort of locking to ensure read/write is
correct. 

[1]: https://lore.kernel.org/all/20250523181448.3777233-1-sshegde@linux.ibm.com/

Shrikanth Hegde (9):
  sched/docs: Document avoid_cpu_mask and avoid CPU concept
  cpumask: Introduce cpu_avoid_mask
  sched/core: Don't allow to use CPU marked as avoid
  sched/fair: Don't use CPU marked as avoid for wakeup and load balance
  sched/rt: Don't select CPU marked as avoid for wakeup and push/pull rt task
  sched/core: Push current task out if CPU is marked as avoid
  sched: Add static key check for cpu_avoid
  sysfs: Add cpu_avoid file
  powerpc: add debug file for set/unset cpu avoid

 Documentation/scheduler/sched-arch.rst | 25 +++++++++++++
 arch/powerpc/include/asm/paravirt.h    |  2 ++
 arch/powerpc/kernel/smp.c              | 50 ++++++++++++++++++++++++++
 drivers/base/cpu.c                     |  8 +++++
 include/linux/cpumask.h                | 17 +++++++++
 kernel/cpu.c                           |  3 ++
 kernel/sched/core.c                    | 50 +++++++++++++++++++++++++-
 kernel/sched/fair.c                    | 11 +++++-
 kernel/sched/rt.c                      |  9 +++--
 kernel/sched/sched.h                   | 10 ++++++
 10 files changed, 181 insertions(+), 4 deletions(-)

-- 
2.43.0


