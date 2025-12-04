Return-Path: <linuxppc-dev+bounces-14607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBCBCA4D1C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:55:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhy24hmVz2xHt;
	Fri, 05 Dec 2025 04:55:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870954;
	cv=none; b=kwZZpczGmC2TdLrvgiJXI2tDkvJCXaY33EPNCMtOL+yZoRQ5DaQGV6KkEbrVBogTUdGep7R2mv4UAvbhiAZ3ZkBuMR6seDbRxLI5E22b00MGOC5/O1/U06AEqrDxfw8+II8m2/yE4zZsx/Jily5DIVFSuntXeAT2maWtThgPJp/Y/6+Fdi3K+MY30WfLjoQqfcz7tCwfk07ben143m0NyY+APkUgTfXXTyheSTGeWGr97HfRbpfuB8ZY+3JdZG3XNOn4sjhHlueSxpJFom4y2C/jHUe8/kX4/xZEqa7cuAsWaMLwB2c4TaM4AZ3vm9TmTgCeO4Wx1kdiHMbXCVaLhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870954; c=relaxed/relaxed;
	bh=U7f/YCqWT04jR/f3G4IobDlsrX5/s4BgmasGDa57jhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qy7dsEt95hIAmxzywv0G510dhMupBAbHatISCwEqThECVzOvcXcr0zOH+2nFc01uWtrC3TBeSMt/9Q67q1hycKlnmCoQzutGUljsus/HjcjePdUtwXQyDyE1n7GF3QVlTWzLDijq5KilBoFuUkhOiPiRpbbKapO9h+wu3CBnilyrpojIiplMhQI5eLFGB2pYAKVzwl8D8MP32WJ8cwq5ZA78T+xa7TQtXkKKucVzOp/Wz/s4otgnHvRoLLuYfGAvyj4Ouj89OPapwv79d4noVUNcT9DkCYojpwmWiBfJ/FX5HtDc9wxFkk/KE5kyPja9katroYX99G983xRO+k6mTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b/r3XH+m; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b/r3XH+m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhy15yX2z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:55:53 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4AL8a1021659;
	Thu, 4 Dec 2025 17:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=U7f/YCqWT04jR/f3G4IobDlsrX5/s4BgmasGDa57j
	hk=; b=b/r3XH+mkLqgsSIF81e+xeqA/rf/FHBmMVskCrEyNHzQNwJRuOHYuLbM1
	Wk92qpWpxP8XMUttrfQcjL4v0/tNBfPVKxnqciiQW0PNlrAnZrTdzC/pjay5ZG8p
	YOjLnIzEvF88D/CBlEEwwcRrLKGZJRC8derrKAcQDyBRiq/dMOlwD85qP63W59Mj
	sQutuq0HTG28g25yhV+WWs1ritWYggQ4yIgl06Va4pjZGm+UsiiEn2VeyDmaaRot
	AKCU7dNTh9axdnlY+Ss5yWxrUrarISbTFrc/f2/pYvBE6VEUmLdU7ngqAw3p1xna
	v6VnZlpvBW2nEasUf1uiYzQhjTR4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgj15j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:19 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hi1Db001151;
	Thu, 4 Dec 2025 17:55:18 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgj15f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:18 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4G1MLW029338;
	Thu, 4 Dec 2025 17:55:17 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1rv8s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtDGe57016690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7700E2004B;
	Thu,  4 Dec 2025 17:55:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0E1420040;
	Thu,  4 Dec 2025 17:55:09 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:09 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 00/17] Steal time based dynamic CPU resource management
Date: Thu,  4 Dec 2025 23:23:48 +0530
Message-ID: <20251204175405.1511340-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Proofpoint-ORIG-GUID: z_rFhuVfEnQlAP65rsFoVUiER5JhvOnz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAxNiBTYWx0ZWRfXyZ0n+ge/PZ5T
 6dYkwNVDk/0aXKBdsi9RoRZpZ2MUmBKtiaAcpiXr0YGcq2rAM4Er98I/oE1MxnD38V4IaxV7aeO
 VLP0wEFgcKNYCql2tRr+Z6MjdnRyTMGrXiDjvEj/OHjiE841znpdwdAOfmEtqvuoOe/h2iU8YbN
 B2mq+mjy0bfD0hcayf7YZXbYm4sgPKCl/KY2SsmY9uTKr4lpB71w7vNl3JcZ69G7Aa1P3fU4QDT
 tHYRp4U79anY/ah6wyq7cuF3juTPGg+Qu3bWwOYVgMYVOArkkXy47xTmPb6rGrcFh2yn+Uv0ygQ
 KxGaD7tvRDVS2Wfg1Z7NbqN7khU2DgQg82jjVtZdJkb0FceYf9IxYKtd+NA07zAv9c+n0/VugGu
 bNvsefWJ8vZBRouaAdpAHRL+3R77xQ==
X-Authority-Analysis: v=2.4 cv=UO7Q3Sfy c=1 sm=1 tr=0 ts=6931cb07 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=1XWaLZrsAAAA:8 a=1UX6Do5GAAAA:8 a=7CQSdrXTAAAA:8 a=20KFwNOVAAAA:8
 a=zd2uoN0lAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8
 a=meVymXHHAAAA:8 a=KKAkSRfTAAAA:8 a=BTeA3XvPAAAA:8 a=Ask-qF1ygu9u4zORMZcA:9
 a=Et2XPkok5AAZYJIKzHr1:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=2JgSa4NbpEOStq-L5dxp:22 a=cvBusfyB2V15izCimMoJ:22
 a=tafbbOV3vt1XuEhzTjGK:22
X-Proofpoint-GUID: a79xKekDvJs2Dt-Tj-asSkjXEux92I_R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

VMs or Shared LPARs provide flexibility, better and efficient use of system
resources. To achieve this most of these setups (VMs or LPARs) will have
guaranteed or entitled share of resources. However they will be allotted
more resources so that a VM can get to use unused share of free/unused VMs
Hence most of these VMs are configured to be overcommitted i.e each VM can
exceed its guaranteed share of resources. Here we are mostly looking at
CPU/cores as a resource. The other option is pinning, which does provide
flexibility but not better use of system resources.

However each VM thinks that it has access to all the allotted resources.
Hence each VM will spread the workload to as many CPUs/cores as possible.
This leads to resource contention causing performance impact. Hence the
clear goal of better system utilization is actually not met.

To overcome this problem, a hint could be provided to the VMs so that Linux
scheduler knows how many CPUs/cores have to be used. In this series, steal
time is used as a hint so that Linux scheduler uses to know how and which
CPUs/cores are to be used. Typically if the resources are over-utilized by
one or more of the VMs, the steal time will spike. If the resources are
underutilized, the steal time will be low. Currently this series implements
this steal based dynamic CPU resource management on PowerVM Shared LPARs.
However since steal is a pretty generic VM attribute, this can be extended
to any architecture that has some form of steal accounting.

If in the future, there is a better hinting mechanism/strategy, the
infrastructure could be modified to work with it.

There have been similar work on these lines. The most recent reference being
https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.com/

Here is the broad outline of this patch series.
- If the steal time is high identify CPUs that not be should be used, reduce
  their CPU capacity and mark them as inactive. This will make unpinned
  tasks to be migrated out. Pinned tasks that cant be migrated out will still
  continue to run over there.
- If the steal time is low identify CPUs that were marked as inactive, reset
  their CPU capacity, mark them as active and available for the scheduler to
  use.

For our experiment we have 2 shared LPARs both having 72 cores/576 CPUs
each entitled to 24 cores/192 CPUs and both sharing 64 cores/512 CPUs
running 10 iterations of ebizzy. (Higher is better)

nonoise case, i.e only ebizzy is running on 1 LPAR and the other LPAR is free
threads  base  cores-used  +patchset  cores-used
8        1     4.82        1.01958    5.025
12       1     6.855       1.01761    7.09
16       1     8.86        0.977243   8.475
24       1     13.47       0.996121   13.085
36       1     20.1        1.01447    19.79
64       1     33.2        0.976135   29.105
72       1     36.05       1.01956    35.775
144      1     55.14       1.01805    54.74
288      1     56.005      1.06081    56.575
576      1     54.945      1.07684    42.42
1152     1     54.65       1.06421    41.625

noise case, i.e both LPARS running similar ebizzy workload.
In the noise case, if one LPAR runs x threads, ebizzy, noise/other lpar also
runs x threads where x is 8,12,16,24..

threads  base  cores-used  +patchset  cores-used
8        1     4.805       0.982148   5.32
12       1     6.865       1.00572    7.405
16       1     8.975       0.972395   9.33
24       1     13.44       0.999339   13.525
36       1     19.95       1.00277    19.24
64       1     26.615      1.05265    26.73
72       1     27.055      0.968465   26.05
144      1     32.84       0.917759   33.23
288      1     30.365      0.957132   29.18
576      1     29.14       0.870245   23.325
1152     1     29.135      0.897712   24.36

While there are some regressions, its certainly using less number of cores.
Also on an average cache-misses, cycles, instructions, context-switches
reduced by 3x with the patchset both in the noise and nonoise case.
(Lower is better)

nonoise
         cache-misses    cs              cycles          instructions
threads  base  +patched  base  +patched  base  +patched  base  +patched
8        1     0.26      1     0.34      1     0.28      1     0.32
12       1     0.42      1     0.50      1     0.41      1     0.51
16       1     0.27      1     0.33      1     0.29      1     0.31
24       1     0.43      1     0.51      1     0.44      1     0.49
36       1     0.29      1     0.33      1     0.31      1     0.32
64       1     0.43      1     0.50      1     0.46      1     0.47
72       1     0.19      1     0.20      1     0.19      1     0.19
144      1     0.48      1     0.50      1     0.47      1     0.48
288      1     0.24      1     0.25      1     0.24      1     0.25
576      1     0.13      1     0.25      1     0.22      1     0.25
1152     1     0.35      1     0.34      1     0.37      1     0.33

noise
         cache-misses    cs              cycles          instructions
threads  base  +patched  base  +patched  base  +patched  base  +patched
8        1     0.26      1     0.33      1     0.28      1     0.33
12       1     0.39      1     0.52      1     0.41      1     0.48
16       1     0.27      1     0.33      1     0.29      1     0.32
24       1     0.42      1     0.51      1     0.44      1     0.48
36       1     0.35      1     0.34      1     0.32      1     0.32
64       1     0.43      1     0.50      1     0.46      1     0.48
72       1     0.20      1     0.19      1     0.19      1     0.19
144      1     0.49      1     0.51      1     0.46      1     0.45
288      1     0.23      1     0.25      1     0.21      1     0.21
576      1     0.26      1     0.25      1     0.21      1     0.20
1152     1     0.29      1     0.34      1     0.35      1     0.26

However there is still more work to be done.
Please let me know your valuable inputs/feedback about these changes.
Should apply cleanly on v6.18

Cc: "Ben Segall <bsegall@google.com>"
Cc: "Christophe Leroy <christophe.leroy@csgroup.eu>"
Cc: "Dietmar Eggemann <dietmar.eggemann@arm.com>"
Cc: "Ingo Molnar <mingo@kernel.org>"
Cc: "Juri Lelli <juri.lelli@redhat.com>"
Cc: "K Prateek Nayak <kprateek.nayak@amd.com>"
Cc: "linux-kernel@vger.kernel.org"
Cc: "linuxppc-dev@lists.ozlabs.org"
Cc: "Madhavan Srinivasan <maddy@linux.ibm.com>"
Cc: "Mel Gorman <mgorman@suse.de>"
Cc: "Michael Ellerman <mpe@ellerman.id.au>"
Cc: "Nicholas Piggin <npiggin@gmail.com>"
Cc: "Peter Zijlstra <peterz@infradead.org>"
Cc: "Shrikanth Hegde <sshegde@linux.ibm.com>"
Cc: "Steven Rostedt <rostedt@goodmis.org>"
Cc: "Swapnil Sapkal <swapnil.sapkal@amd.com>"
Cc: "Thomas Huth <thuth@redhat.com>"
Cc: "Valentin Schneider <vschneid@redhat.com>"
Cc: "Vincent Guittot <vincent.guittot@linaro.org>"
Cc: "virtualization@lists.linux.dev"
Cc: "Yicong Yang <yangyicong@hisilicon.com>"
Cc: "Ilya Leoshkevich <iii@linux.ibm.com>"

Srikar Dronamraju (17):
  sched/fair: Enable group_asym_packing in find_idlest_group
  powerpc/lpar: Reorder steal accounting calculation
  pseries/lpar: Process steal metrics
  powerpc/smp: Add num_available_cores callback for smp_ops
  pseries/smp: Query and set entitlements
  powerpc/smp: Delay processing steal time at boot
  sched/core: Set balance_callback only if CPU is dying
  sched/core: Implement CPU soft offline/online
  powerpc/smp: Implement arch_scale_cpu_capacity for shared LPARs
  powerpc/smp: Define arch_update_cpu_topology for shared LPARs
  pseries/smp: Create soft offline infrastructure for Powerpc shared
    LPARs.
  pseries/smp: Trigger softoffline based on steal metrics
  pseries/smp: Account cores when triggering softoffline
  powerpc/smp: Assume preempt if CPU is inactive.
  pseries/hotplug: Update available_cores on a dlpar event
  pseries/smp: Allow users to override steal thresholds
  pseries/lpar: Add debug interface to set steal interval

 arch/powerpc/include/asm/paravirt.h          |  62 +------
 arch/powerpc/include/asm/smp.h               |   6 +
 arch/powerpc/include/asm/topology.h          |   5 +
 arch/powerpc/kernel/smp.c                    |  38 ++++
 arch/powerpc/platforms/pseries/hotplug-cpu.c |   6 +
 arch/powerpc/platforms/pseries/lpar.c        |  71 +++++++-
 arch/powerpc/platforms/pseries/pseries.h     |   8 +
 arch/powerpc/platforms/pseries/smp.c         | 173 +++++++++++++++++++
 include/linux/sched/topology.h               |   1 +
 kernel/sched/core.c                          |  50 +++++-
 kernel/sched/fair.c                          |  33 +++-
 11 files changed, 383 insertions(+), 70 deletions(-)

-- 
2.43.7


