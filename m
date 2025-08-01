Return-Path: <linuxppc-dev+bounces-10504-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B7DB18043
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 12:38:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btj8m0kktz2y2B;
	Fri,  1 Aug 2025 20:38:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754044696;
	cv=none; b=b4gJa6z6I83V47UEBRpXF87L51C+giXB6GHc+VKKVCr2d9fuJNze7S3NMhpS/65OemD50JSPAp52fb3DSLPzr4iJmdtpzQ/5Zo46f2yTZbIJ1V7Wt4K963WvswWjFWvprFz+t0ApxhB293qJ94JTEeeHq9L69PA2SnINV9VAgO2bWZ5p2Z71rli6OptV37XhVyJSZLz/mUDIy+/a2x/Sk/CbvTuTSmzU2zyk27PBU8LCWQN3kvf1AODWDR4JCfd2qNTn2RSCf2GuHSPnAqnXT7ew8yMMu5z5GODc9MvdX2l2qoj/RcKNozIBdt0ykYygieLzoIfzRt0Va/GEljQuwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754044696; c=relaxed/relaxed;
	bh=uvXCgyq8iO7DjIvxLkszVszOFS4P5UUPEfAZBgUlOMg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=khsIt+vm3jCkIfBlgt9bkAeFVc01U1A7JkTR82iymiuphKFyLwEV/f9rMadUgRACPnVs5GNQtYjWltz1cB2vNw6qovxMIXfzDpRzNJtKdrTM+NOW1Ipl0X+e3ikrrNwUgkj/kLP3fBw/8pA40sl6afnkhHt3nmIF+sBZdDTc0VEtMlwQgvAxFddu1F07gamuxq4GEA5hqAE/KdiZshQhzfP67f6v4pycE+YbFJf6yFNR25D+2zll1T2opnVmjwx9LV5SEjz1uAaX2zb9Se+2vMGHQGGdQqtdqIEkMXgt3Mam+532jSsfVqP3QGG5eR45U7irUUH/buIWxNulliqTRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0tbB07U; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L0tbB07U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btj8k0btHz2xHY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 20:38:13 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5716lEsq017483;
	Fri, 1 Aug 2025 10:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=uvXCgyq8iO7DjIvxLkszVszOFS4P
	5UUPEfAZBgUlOMg=; b=L0tbB07U8kTPcjyiqtbfy5q9P3sTdSstyD9OYYgHadGT
	gXS0T3DQNWKcq/+SRJcSoI0DZ8haouNSVBDMKRkrcIpa4RSQFTsHUIj4WOzU8K8r
	vAdE+ExsrZT/hYQqpm/kgiIZItACfUndg7xueAUx36Z/FILMjFaRAwG2nBYVhfKm
	twYkk78n5oND/+uxAqJLenhS0d5vbkPS2hcIM5WNoXjcj/IC2ocHfVgXdp4ZN2JN
	p4pOUqOfszzpybkFWh8G/w7/2BE/XjkWgZrZx2wRNfrK+sozp/N+2JqVXTEeZVkW
	EsWIwjuGC+BlY0O4O1Fg1Ngyk3Y4t0cGUzHS166TWw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4864k88kxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 10:38:02 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 571Ac1xV007046;
	Fri, 1 Aug 2025 10:38:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4864k88kxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 10:38:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57189p42017369;
	Fri, 1 Aug 2025 10:38:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4859r0h3w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 10:38:00 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571AbvPx50594150
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 10:37:57 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0864120043;
	Fri,  1 Aug 2025 10:37:57 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69A7320040;
	Fri,  1 Aug 2025 10:37:54 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.39.20.90])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 10:37:54 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Donet Tom <donettom@linux.ibm.com>, stable@vger.kernel.org
Subject: [PATCH v2] powerpc/mm: Fix SLB multihit issue during SLB preload
Date: Fri,  1 Aug 2025 16:07:47 +0530
Message-ID: <20250801103747.21864-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y7g5A_dDmV6PbSlORhVpZJHCD84LYchZ
X-Proofpoint-GUID: 05-Wfiw2eq0MTkcOzytVI2NkaLeniX5s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA3NiBTYWx0ZWRfX/wn0Vcp0L2Ef
 GDHDBLnhN8yhEe1wqAv5M8RfaJMI/NzeWNK7/qeyrstTYia9xTxNlk8MEhA0TvaWykcx0bh8YgV
 6CUVC23o+cuZLIBKy9mQddwwmxNFCv6d732aPD1g17YbJHYIUgiQs0YMXJJN+BndpSqNFzS1X/Z
 qVLOzfsKfWWSYhUZyEzW9I7+7TPSpjrBsFMAsyti+sFLVCTcfKnVwCHi2ILsYktrs5Y/XVY2oEx
 ZAd2yI55gXpFp/lBkL72dIktJFfRslGDHEiwPTvZTDlYm+k6yS5R3YTVMoC6F14EUQS1jcFzg7b
 2rlVzQ/s59bWG1uDOdXt+ddYCXGvzFYpst0fjDIfMeVHfAaHJGyz04Snbt3fDKBVsj/gtxfFn6X
 M8xioLAKwc+46weGKRyKjDjg/+rHNTNA6IXIN8qBPu2BujsOcPRzJjH3SWDQZ7uWZIIHNwOM
X-Authority-Analysis: v=2.4 cv=ZoDtK87G c=1 sm=1 tr=0 ts=688c990a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=1UX6Do5GAAAA:8 a=pGLkceISAAAA:8 a=Z9p2nfiIB6IMVperFDQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_03,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 clxscore=1011
 adultscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010076
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On systems using the hash MMU, there is a software SLB preload cache that
mirrors the entries loaded into the hardware SLB buffer. This preload
cache is subject to periodic eviction — typically after every 256 context
switches — to remove old entry.

To optimize performance, the kernel skips switch_mmu_context() in
switch_mm_irqs_off() when the prev and next mm_struct are the same.
However, on hash MMU systems, this can lead to inconsistencies between
the hardware SLB and the software preload cache.

If an SLB entry for a process is evicted from the software cache on one
CPU, and the same process later runs on another CPU without executing
switch_mmu_context(), the hardware SLB may retain stale entries. If the
kernel then attempts to reload that entry, it can trigger an SLB
multi-hit error.

The following timeline shows how stale SLB entries are created and can
cause a multi-hit error when a process moves between CPUs without a
MMU context switch.

CPU 0                                   CPU 1
-----                                    -----
Process P
exec                                    swapper/1
 load_elf_binary
  begin_new_exc
    activate_mm
     switch_mm_irqs_off
      switch_mmu_context
       switch_slb
       /*
        * This invalidates all
        * the entries in the HW
        * and setup the new HW
        * SLB entries as per the
        * preload cache.
        */
context_switch
sched_migrate_task migrates process P to cpu-1

Process swapper/0                       context switch (to process P)
(uses mm_struct of Process P)           switch_mm_irqs_off()
                                         switch_slb
                                           load_slb++
                                            /*
                                            * load_slb becomes 0 here
                                            * and we evict an entry from
                                            * the preload cache with
                                            * preload_age(). We still
                                            * keep HW SLB and preload
                                            * cache in sync, that is
                                            * because all HW SLB entries
                                            * anyways gets evicted in
                                            * switch_slb during SLBIA.
                                            * We then only add those
                                            * entries back in HW SLB,
                                            * which are currently
                                            * present in preload_cache
                                            * (after eviction).
                                            */
                                        load_elf_binary continues...
                                         setup_new_exec()
                                          slb_setup_new_exec()

                                        sched_switch event
                                        sched_migrate_task migrates
                                        process P to cpu-0

context_switch from swapper/0 to Process P
 switch_mm_irqs_off()
  /*
   * Since both prev and next mm struct are same we don't call
   * switch_mmu_context(). This will cause the HW SLB and SW preload
   * cache to go out of sync in preload_new_slb_context. Because there
   * was an SLB entry which was evicted from both HW and preload cache
   * on cpu-1. Now later in preload_new_slb_context(), when we will try
   * to add the same preload entry again, we will add this to the SW
   * preload cache and then will add it to the HW SLB. Since on cpu-0
   * this entry was never invalidated, hence adding this entry to the HW
   * SLB will cause a SLB multi-hit error.
   */
load_elf_binary continues...
 START_THREAD
  start_thread
   preload_new_slb_context
   /*
    * This tries to add a new EA to preload cache which was earlier
    * evicted from both cpu-1 HW SLB and preload cache. This caused the
    * HW SLB of cpu-0 to go out of sync with the SW preload cache. The
    * reason for this was, that when we context switched back on CPU-0,
    * we should have ideally called switch_mmu_context() which will
    * bring the HW SLB entries on CPU-0 in sync with SW preload cache
    * entries by setting up the mmu context properly. But we didn't do
    * that since the prev mm_struct running on cpu-0 was same as the
    * next mm_struct (which is true for swapper / kernel threads). So
    * now when we try to add this new entry into the HW SLB of cpu-0,
    * we hit a SLB multi-hit error.
    */

WARNING: CPU: 0 PID: 1810970 at arch/powerpc/mm/book3s64/slb.c:62
assert_slb_presence+0x2c/0x50(48 results) 02:47:29 [20157/42149]
Modules linked in:
CPU: 0 UID: 0 PID: 1810970 Comm: dd Not tainted 6.16.0-rc3-dirty #12
VOLUNTARY
Hardware name: IBM pSeries (emulated by qemu) POWER8 (architected)
0x4d0200 0xf000004 of:SLOF,HEAD hv:linux,kvm pSeries
NIP:  c00000000015426c LR: c0000000001543b4 CTR: 0000000000000000
REGS: c0000000497c77e0 TRAP: 0700   Not tainted  (6.16.0-rc3-dirty)
MSR:  8000000002823033 <SF,VEC,VSX,FP,ME,IR,DR,RI,LE>  CR: 28888482  XER: 00000000
CFAR: c0000000001543b0 IRQMASK: 3
<...>
NIP [c00000000015426c] assert_slb_presence+0x2c/0x50
LR [c0000000001543b4] slb_insert_entry+0x124/0x390
Call Trace:
  0x7fffceb5ffff (unreliable)
  preload_new_slb_context+0x100/0x1a0
  start_thread+0x26c/0x420
  load_elf_binary+0x1b04/0x1c40
  bprm_execve+0x358/0x680
  do_execveat_common+0x1f8/0x240
  sys_execve+0x58/0x70
  system_call_exception+0x114/0x300
  system_call_common+0x160/0x2c4

To fix this issue, we add a code change to always switch the MMU context on
hash MMU if the SLB preload cache has aged. With this change, the
SLB multi-hit error no longer occurs.

cc: Christophe Leroy <christophe.leroy@csgroup.eu>
cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
cc: Michael Ellerman <mpe@ellerman.id.au>
cc: Nicholas Piggin <npiggin@gmail.com>
Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
cc: stable@vger.kernel.org
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---

v1 -> v2 : Changed commit message and added a comment in
switch_mm_irqs_off()

v1 - https://lore.kernel.org/all/20250731161027.966196-1-donettom@linux.ibm.com/
---
 arch/powerpc/mm/book3s64/slb.c | 2 +-
 arch/powerpc/mm/mmu_context.c  | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6b783552403c..08daac3f978c 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -509,7 +509,7 @@ void switch_slb(struct task_struct *tsk, struct mm_struct *mm)
 	 * SLB preload cache.
 	 */
 	tsk->thread.load_slb++;
-	if (!tsk->thread.load_slb) {
+	if (tsk->thread.load_slb == U8_MAX) {
 		unsigned long pc = KSTK_EIP(tsk);
 
 		preload_age(ti);
diff --git a/arch/powerpc/mm/mmu_context.c b/arch/powerpc/mm/mmu_context.c
index 3e3af29b4523..95455d787288 100644
--- a/arch/powerpc/mm/mmu_context.c
+++ b/arch/powerpc/mm/mmu_context.c
@@ -83,8 +83,11 @@ void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
 	/* Some subarchs need to track the PGD elsewhere */
 	switch_mm_pgdir(tsk, next);
 
-	/* Nothing else to do if we aren't actually switching */
-	if (prev == next)
+	/*
+	 * Nothing else to do if we aren't actually switching and
+	 * the preload slb cache has not aged
+	 */
+	if ((prev == next) && (tsk->thread.load_slb != U8_MAX))
 		return;
 
 	/*
-- 
2.50.1


