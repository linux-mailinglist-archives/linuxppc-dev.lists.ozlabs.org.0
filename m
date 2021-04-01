Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 068253514AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB1xL0T0rz3c8s
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 23:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n//hD8/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=parth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n//hD8/b; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB1vY0Ggxz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 22:59:52 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 131BY5QH028958; Thu, 1 Apr 2021 07:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XVGrdlT1gSl3/LbqnrHoUCMuvs8mW37czMHDNWoZQv0=;
 b=n//hD8/bbLTqyhG3JuniS/HxFCIWm+kxj9qm9UWx5P7U85eA5RIFWSAUdoSDDf2zKIcV
 YVbSLzYedM92iEcBYKM25FvQuMvDAAbVF0/vhiupTXhv6QujcJL1/+wPi8k4tpi4AwfI
 gz+IxmetqhOZdL11p6al6bCrgJajK0O3ir1gOWU5JwYAO2r4FTyI7BDDFTB7MeLqe9Bz
 1IbkYQy1jz68GwXHyIo/66J4X0lcxoMDqGv/Hputwh/Wtu2N6WB7uyGbltGbPyLMixo/
 lsIISe9/khfdn2iASkEawznKnX5pd/9u2KcYS26hFhQKUh461n8WfXiyWLCN/CHRe2gk +g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n8r09cuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:45 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 131BpqHq130901;
 Thu, 1 Apr 2021 07:59:44 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37n8r09ctj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 07:59:44 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 131BweRB014212;
 Thu, 1 Apr 2021 11:59:40 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 37n28w886a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Apr 2021 11:59:40 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 131BxbRa42992028
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 1 Apr 2021 11:59:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADFA64204F;
 Thu,  1 Apr 2021 11:59:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48FFF42041;
 Thu,  1 Apr 2021 11:59:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.32.50])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  1 Apr 2021 11:59:34 +0000 (GMT)
From: Parth Shah <parth@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 0/2] Define a new apporach to determine if an idle vCPU will be
 scheduled instantly or not
Date: Thu,  1 Apr 2021 17:29:20 +0530
Message-Id: <20210401115922.1524705-1-parth@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LWzJsZy7LqnASOoooMOx-cVGBfZg_l3L
X-Proofpoint-GUID: _2f9FqDiAeArfO5v_E2KjN1TgKULAZn7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-04-01_04:2021-03-31,
 2021-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103310000 definitions=main-2104010082
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
 npiggin@gmail.com, paulus@samba.org, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Abstract:
=========
The Linux task scheduler tries to find an idle cpu for a wakee task
thereby lowering the wakeup latency as much as possible. The process
of determining if a cpu is idle or not has evolved over time.
Currently, a cpu is considered idle if
- there are no task running or enqueued to the runqueue of the cpu and
- in while running inside a guest, a cpu is not yielded (determined
via available_idle_cpu())

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
This patchset introduces a new HCALL named H_IDLE_HINT for the guest
to query if a vCPU can be dispatched quickly or not. This is
currently a crude interface to demonstrate the efficacy of this
method. We are looking for feedback on any other mechanisms of
obtainining a hint from the hypervisor where the hint is still relevant.

But this patch series tries to emphasis the possible optimization for
task wakeup-latency and is open to accept any interface/architecture.

Internal working:
========
The code-flow of the current implementation is as follow:
- GuestOS scheduler searches for idle cpu using `avaialable_idle_cpu()`
  which also looks if a vcpu_is_preempted() to see if vCPU is yielded or
  not.
- If vCPU is yielded, then the GuestOS will additionally make hcall
  H_IDLE_HINT to find if a vCPU can be scheduled instantly or not.
- The hypervisor services hcall by first finding the corresponding
  task-p of the vCPU and returns 1 if the task_cpu(p) is
  avaialable_idle_cpu or running SCHED_IDLE task. Else returns 0.
- GuestOS takes up this hint and considers the vCPU as idle if the hint
  from hypervisor has value == 1.


The patch-set is based on v5.11 kernel.

Results:
========
- Baseline kernel = v5.11
- Patched kernel = v5.11 + this patch-set

Setup:
All the results are taken on IBM POWER9 baremetal system running patched
kernel. This system consists of 2 NUMA nodes, 22 cores per socket with
SMT-4 mode.

2 KVM guests are created sharing same set of physical CPUs, and each KVM
has identical CPU topology of 40 CPUs, 10 cores with SMT-4 support.


Scenarios:
----------
1. Under-commit case: Only one KVM is active at a time.

- Baseline (v5.11):
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 67
        75.0000th: 83
        90.0000th: 115
        95.0000th: 352
        *99.0000th: 2260 <-----
        99.5000th: 3580
        99.9000th: 7128
        min=0, max=9927
- With patch (v5.11 + patch):
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 100
        75.0000th: 113
        90.0000th: 328
        95.0000th: 360
        *99.0000th: 434 (-80%) <----
        99.5000th: 489
        99.9000th: 2324
        min=0, max=6054

We see a significant reduction in the tail latencies due to being able
to schedule on an yielded/ceded idle CPU with the patchset instead of
waking up the task on a busy CPU.

2. Over-commit case: Both KVMs sharing same set of CPUs. One KVM is
creating noise using `schbench -m 10 -t 2 -r 3000` while only the other
KVM is benchmarked.

- Baseline:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 73
        75.0000th: 89
        90.0000th: 115
        95.0000th: 166
        *99.0000th: 3084
        99.5000th: 4044
        99.9000th: 7656
        min=0, max=18448
- With patch:
$> schbench -m 20 -t 2 -r 30
Latency percentiles (usec)
        50.0000th: 114
        75.0000th: 137
        90.0000th: 170
        95.0000th: 237
        *99.0000th: 2828
        99.5000th: 4168
        99.9000th: 7528
        min=0, max=15387


The results demonstrates that the proposed method of getting idle-hint
from the hypervisor to better find an idle cpu in the guestOS is very
helpful in under-commmit cases due to higher chance of finding the
previously used physical cpu as idle.
The results also confirms that there is no regression in the over-commit
case where the proposed methodlogy does not affect much.

Additionally, more tests were carried out with different combinations of
schbench threads and different numbers of KVM guest. The results for
these tests further confirmed that there is no major regression on the
workload performance.


Parth Shah (2):
  KVM:PPC: Add new hcall to provide hint if a vcpu task will be
    scheduled instantly.
  sched: Use H_IDLE_HINT hcall to find if a vCPU can be wakeup target

 arch/powerpc/include/asm/hvcall.h   |  3 ++-
 arch/powerpc/include/asm/paravirt.h | 21 +++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv.c        | 13 +++++++++++++
 arch/powerpc/kvm/trace_hv.h         |  1 +
 include/linux/kvm_host.h            |  1 +
 include/linux/sched.h               |  1 +
 kernel/sched/core.c                 | 13 +++++++++++++
 kernel/sched/fair.c                 | 12 ++++++++++++
 kernel/sched/sched.h                |  1 +
 virt/kvm/kvm_main.c                 | 17 +++++++++++++++++
 10 files changed, 80 insertions(+), 3 deletions(-)

-- 
2.26.2

