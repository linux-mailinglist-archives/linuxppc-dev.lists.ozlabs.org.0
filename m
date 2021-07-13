Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8983C69B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:25:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8Gs6nwsz3bVn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SJVePHsT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SJVePHsT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8GF3RW4z2yNQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:24:52 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D54Hj5000732; Tue, 13 Jul 2021 01:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dsxpG62fCRdkp7axqQYQ8gVZCtoVArPQgukYrPwNRRk=;
 b=SJVePHsTAOKLyatSQ8hFF8mG3nCofrx/IhxT3M+GH0+t5o2wbX3GsPeMT8SzmlM3vz0j
 4WSBHBnB8nzPC7IfddT37yRuq+NIijyWDVS4GfAp/j6Glcq5p4JTupTRn3Hd9/BMBnHX
 x2MUtfm57Zc6797pn2iudFSBxriA6ghmr3nyRKqyHpT84+e7IXkOLyHvMfVFaEI/k0Et
 NFM1iH942J6AWifhY0dn/pElxKAld/+FpzfDkp9BV2mRM7b5g6DKcBPN1s31CbsYcau6
 SmEilqDYBMuwj7qipvConPB2f2vB7mUGvikAGSaaRHq5blq5RJi8nMRdKe6KiuoE5IHd Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs2vr59u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:44 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D54K6g001042;
 Tue, 13 Jul 2021 01:24:43 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qs2vr596-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:24:43 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5Mrct007960;
 Tue, 13 Jul 2021 05:24:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 39q3688jnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:24:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5OdNx21561768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:24:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE5294C052;
 Tue, 13 Jul 2021 05:24:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE55F4C050;
 Tue, 13 Jul 2021 05:24:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.18.200])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Jul 2021 05:24:36 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 0/2] Paravirtualize idle CPU wakeup optimization
Date: Tue, 13 Jul 2021 10:54:31 +0530
Message-Id: <20210713052433.257003-1-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Dzi23vjTYmRzpwgBubcy8wSrPiJiekxp
X-Proofpoint-GUID: 7kZN0N8lOnaDs_82hiwKcGodg0qu2PnW
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130026
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, srikar@linux.vnet.ibm.com,
 parths1229@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch-set is a revision over HCALL based implementation which can
be found at:
https://lore.kernel.org/linuxppc-dev/20210401115922.1524705-1-parth@linux.ibm.com/
But since the overhead of HCALL is huge, this patch-set uses lppaca
region to update idle-hint, where hypervisor keeps changing the newly
added idle_hint attribute in the VPA region of each vCPUs of all KVMs,
and guest have to just look at this attribute.

This implementation is not aimed for full fledged solution, but is
rather a demonstration of para-virtualizing task scheduler. Hypervisor
can provided better idle-hints about vCPU scheduling and guest can use
it for better scheduling decisions.

Abstract:
=========
The Linux task scheduler searches for an idle cpu for task wakeup
in-order to lower the wakeup latency as much as possible. The process of
determining if a cpu is idle or not has evolved over time.
Currently, in available_idle_cpu(), a cpu is considered idle if
- there are no task running or enqueued to the runqueue of the cpu and
- the cpu is not-preempted, i.e. while running inside a guest, a cpu is
  not yielded (determined via vcpu_is_preempted())

While inside the guest, there is no way to deterministically predict
if a vCPU that has been yielded/ceded to the hypervisor can be gotten
back. Hence currently the scheduler considers such CEDEd vCPU as not
"available" idle and would instead pick other busy CPUs for waking up
the wakee task.

In this patch-set we try to further classify idle cpus as instantly
available or not. This is achieved by taking hint from the hypervisor
by quering if the vCPU will be scheduled instantly or not.  In most
cases, scheduler prefers prev_cpu of a waking task unless it is busy.
In this patchset, the hypervisor uses this information to figure out
if the prev_cpu used by the task (of the corresponding vCPU) is idle
or not, and passes this information to the guest.

Interface:
===========
This patchset introduces a new attribute in lppaca structure which is
shared by both the hypervisor and the guest. The new attribute, i.e.
idle_hint is updated regularly by the hypervisor. When a particular cpu
goes into idle-state, it updates the idle_hint of all the vCPUs of all
existing KVMs whose prev_cpu == smp_processor_id(). It similarly revert
backs the update when coming out of the idle-state.


Internal working:
========
The code-flow of the current implementation is as follow:
- In do_idle(), when entering an idle-state, walk through all vCPUs of
  all KVM guests and find whose prev_cpu of vCPU task was same as the
  caller's cpu, and mark the idle_hint=1 in the lppaca region of such
  vCPUs.
- Similarly, mark idle_hint=0 for such vCPUs when exiting idle state.
- Guest OS scheduler searches for idle cpu using `avaialable_idle_cpu()`
  which also looks if a vcpu_is_preempted() to see if vCPU is yielded or
  not.
- If vCPU is yielded, then the GuestOS will additionally see if
  idle_hint is marked as 1 or not. If idle_hint==1 then consider the
  vCPU as non-preempted and use it for scheduling a task.


The patch-set is based on v5.13 kernel.

Results:
========
- Baseline kernel = v5.13
- Patched kernel = v5.13 + this patch-set

Setup:
All the results are taken on IBM POWER9 baremetal system running patched
kernel. This system consists of 2 NUMA nodes, 22 cores per socket with
SMT-4 mode.

Each KVM guest have identical cpu topology with total 40 CPUs, which are
10 cores with SMT-4 support.

Scenarios:
----------
1. Under-commit case: Only one KVM is active at a time.

- Baseline kernel:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 86
        75.0000th: 406
        90.0000th: 497
        95.0000th: 541
        *99.0000th: 2572 <-----
        99.5000th: 3724
        99.9000th: 6904
        min=0, max=10007

- With Patched kernel:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 386
        75.0000th: 470
        90.0000th: 529
        95.0000th: 589
        *99.0000th: 741 (-71%) <-----
        99.5000th: 841
        99.9000th: 1522
        min=0, max=6488

We see a significant reduction in the tail latencies due to being able
to schedule on an yielded/ceded idle CPU with the patchset instead of
waking up the task on a busy CPU.


2. Over-commit case: Multiple KVM guests sharing same set of CPUs.

Two KVMs running baseline kernel is used for creating noise using `schbench
-m 10 -t 2 -r 3000` while only the other KVM is benchmarked.

- Baseline kernel:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 289
        75.0000th: 1074
        90.0000th: 7288
        95.0000th: 11248
        *99.0000th: 17760
        99.5000th: 21088
        99.9000th: 28896
        min=0, max=36640

- With Patched kernel:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 281
        75.0000th: 445
        90.0000th: 4344
        95.0000th: 9168
        *99.0000th: 15824
        99.5000th: 19296
        99.9000th: 26656
        min=0, max=36455


The results demonstrates that the proposed method of getting idle-hint
from the hypervisor to better find an idle cpu in the guestOS is very
helpful in under-commmit cases due to higher chance of finding the
previously used physical cpu as idle.
The results also confirms that there is no regression in the over-commit
case where the proposed methodlogy does not affect much.


Parth Shah (2):
  powerpc/book3s_hv: Add new idle-hint attribute in VPA region
  kernel/idle: Update and use idle-hint in VPA region

 arch/powerpc/include/asm/idle_hint.h | 28 +++++++++++++++++++++++
 arch/powerpc/include/asm/lppaca.h    |  3 ++-
 arch/powerpc/include/asm/paravirt.h  | 12 ++++++++--
 arch/powerpc/kvm/book3s.h            |  2 ++
 arch/powerpc/kvm/book3s_hv.c         | 34 ++++++++++++++++++++++++++++
 kernel/sched/idle.c                  |  3 +++
 6 files changed, 79 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/include/asm/idle_hint.h

-- 
2.26.3

