Return-Path: <linuxppc-dev+bounces-10978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7012FB260C8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Aug 2025 11:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2fxK0VKFz2yhD;
	Thu, 14 Aug 2025 19:25:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755163557;
	cv=none; b=Q1RFlvAGOAwrsfgxF9ZiOLF4vRdzR7MwNc08khBJqq7GxnHRjmoTUqLkLxAj/pT/vwRBYc0t/kdaa8DxypkQJJa8DrCZVCIwnI6NqpV4JZaMM+rDyt4/2Dae/CVTDkhu9iXDQibpXBbAgyZp5sRITH31Tds3udSLjIQ/uY+hd0WJLiKk8YXcPm/IfzaQNtHEFsk6cCFInhSlspmcz3BqKqsinUvOzBoUcRXGbVzJ6htsMRu8Knl48AGItKHF9jU+RE1samTidYuJNx29FF5SNmXuOWMJw3q7ZRf+q5PLa0gSUfahnHWee3ah67dNUP0LHJUIs7Q5VgHaKgGdMMoLPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755163557; c=relaxed/relaxed;
	bh=KTh/t+w2i3kJPi6JppMXN5qV29/bxTEnVBrxvmS6ats=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VN6pWSgqDdxZOfdRXeI51GUiLXj/+JnfI64utILh+6h8u6bguYyWE+DB6K8uUznUPRANGeAyEdxhS5onFiMi7JOeqzbqe/uhoH01gcmEkl8g14qmsZgLxGX1etnDLb5XRHw/5oQsaGJcSn7HzXPfyUqUhxYZC35Oq0vPu/OVyM+s/aKLfpCBlzFdRGSWbbWpX1UKRYxTqmGfwxiuWPS+R+svRhB7ZY3bFUKWcL1hDlRg+Pv9bj/HkSfDHKtTYoBSEqCYIQKbLaylxVvMxoCg2l58lsVvzeva4opoA0JZOKDaM5p+vHvQE5MmuwGOhG8/3k309TAFIhvADiBMYmvlXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKDWqm+W; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iKDWqm+W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c2fxH6Md4z2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 19:25:55 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DN7peP031309;
	Thu, 14 Aug 2025 09:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=KTh/t+w2i3kJPi6JppMXN5qV29/b
	xTEnVBrxvmS6ats=; b=iKDWqm+WGrW9NchOc2pES9+gJnMeRiuyiBvu9WWNoghQ
	Vi09ShWjG2xYt2kA7v5cCAgumDb0+SvZaYYeYkc2RX3r1Xd48V36YmOV0a7v/tFh
	bnzQXfPwwprxQo1lVrL12/CxcwNzxgaTL7yZqhY/0Jn5zRhg3kFjXdkoNjhPfRyG
	1Mepw+KVMbQH4UJzd8fST6T1vc5j6yKyL7ZLtZuMmvuRvbWKCiJYsC7ZAbN5v9TN
	wMH9hWAhiUttjuK9QnQ/kqsXzvFexccptdEO4T3aPcNUtGSb/ebd8+wsNAPWUb6D
	YgrlItVZFatjDAbZ1rKiveHwoX6CdD6OmWp0reoGvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrp8ysa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:25:42 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57E9Hoq8032390;
	Thu, 14 Aug 2025 09:25:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrp8ys8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:25:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57E8bT21026302;
	Thu, 14 Aug 2025 09:25:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48eh21bnt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 09:25:41 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57E9PbIO54788382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Aug 2025 09:25:37 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A8D120040;
	Thu, 14 Aug 2025 09:25:37 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F092520043;
	Thu, 14 Aug 2025 09:25:34 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.39.31.144])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Aug 2025 09:25:34 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-kernel@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Donet Tom <donettom@linux.ibm.com>, stable@vger.kernel.org
Subject: [PATCH] powerpc/mm: Fix SLB multihit issue during SLB preload
Date: Thu, 14 Aug 2025 14:55:32 +0530
Message-ID: <20250814092532.116762-1-donettom@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDIxOSBTYWx0ZWRfX2/KDVelDdvd3
 ZgIM0tB5S6oz9MIUnILry40tako9DEo6AER5/5Gc7OVcxkfKrPiU0fsZk26grdQXe1vgpEvbl4A
 F/YmhHRtgmCyeprub67hpF28ySlFOyXBRUbPyHnYYkik3DI0Qxs8Cvc+KGvzowxekb3reoRQWZ5
 24nu/YIhbJBFkOO+eyQ4pyS8eqw9f/SX9p772vqX/wY6vTHupTOAMEA3pwYbEolduIIXMeNlaRh
 S249x4CgT3fccOIGkB0jwOrjtPhEfu7M3JE16FaIaQof6v/queMKofhIhSmSqmlJ3LR3CS2C7OQ
 8F0QwEq0kUDRGZ1ZF8CxnibUuMXk3tf7mn4mgxl02gKGT+9CpiD1MsswEp0Ys0R+7lzwTKeudL1
 Y/kfnu4i
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=689dab96 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=d9o4jGqSoHxcCQIisAAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: RWf-oG4UiC6UTLaWger7edb6yfHK1SKZ
X-Proofpoint-ORIG-GUID: 2xvsuejIhINbvgK57lxAstLwBPGe5Kdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120219
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

From the above analysis, during early exec the hardware SLB is cleared,
and entries from the software preload cache are reloaded into hardware
by switch_slb. However, preload_new_slb_context and slb_setup_new_exec
also attempt to load some of the same entries, which can trigger a
multi-hit. In most cases, these additional preloads simply hit existing
entries and add nothing new. Removing these functions avoids redundant
preloads and eliminates the multi-hit issue. This patch removes these
two functions.

We tested process switching performance using the context_switch
benchmark on POWER9/hash, and observed no regression.

Without this patch: 129041 ops/sec
With this patch:    129341 ops/sec

We also measured SLB faults during boot, and the counts are essentially
the same with and without this patch.

SLB faults without this patch: 19727
SLB faults with this patch:    19786

Fixes: 5434ae74629a ("powerpc/64s/hash: Add a SLB preload cache")
cc: stable@vger.kernel.org
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  1 -
 arch/powerpc/kernel/process.c                 |  5 --
 arch/powerpc/mm/book3s64/internal.h           |  2 -
 arch/powerpc/mm/book3s64/mmu_context.c        |  2 -
 arch/powerpc/mm/book3s64/slb.c                | 88 -------------------
 5 files changed, 98 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 1c4eebbc69c9..e1f77e2eead4 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -524,7 +524,6 @@ void slb_save_contents(struct slb_entry *slb_ptr);
 void slb_dump_contents(struct slb_entry *slb_ptr);
 
 extern void slb_vmalloc_update(void);
-void preload_new_slb_context(unsigned long start, unsigned long sp);
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 void slb_set_size(u16 size);
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 855e09886503..2b9799157eb4 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1897,8 +1897,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	return 0;
 }
 
-void preload_new_slb_context(unsigned long start, unsigned long sp);
-
 /*
  * Set up a thread for executing a new program
  */
@@ -1906,9 +1904,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 {
 #ifdef CONFIG_PPC64
 	unsigned long load_addr = regs->gpr[2];	/* saved by ELF_PLAT_INIT */
-
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !radix_enabled())
-		preload_new_slb_context(start, sp);
 #endif
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/mm/book3s64/internal.h b/arch/powerpc/mm/book3s64/internal.h
index a57a25f06a21..c26a6f0c90fc 100644
--- a/arch/powerpc/mm/book3s64/internal.h
+++ b/arch/powerpc/mm/book3s64/internal.h
@@ -24,8 +24,6 @@ static inline bool stress_hpt(void)
 
 void hpt_do_stress(unsigned long ea, unsigned long hpte_group);
 
-void slb_setup_new_exec(void);
-
 void exit_lazy_flush_tlb(struct mm_struct *mm, bool always_flush);
 
 #endif /* ARCH_POWERPC_MM_BOOK3S64_INTERNAL_H */
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 4e1e45420bd4..fb9dcf9ca599 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -150,8 +150,6 @@ static int hash__init_new_context(struct mm_struct *mm)
 void hash__setup_new_exec(void)
 {
 	slice_setup_new_exec();
-
-	slb_setup_new_exec();
 }
 #else
 static inline int hash__init_new_context(struct mm_struct *mm)
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6b783552403c..7e053c561a09 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -328,94 +328,6 @@ static void preload_age(struct thread_info *ti)
 	ti->slb_preload_tail = (ti->slb_preload_tail + 1) % SLB_PRELOAD_NR;
 }
 
-void slb_setup_new_exec(void)
-{
-	struct thread_info *ti = current_thread_info();
-	struct mm_struct *mm = current->mm;
-	unsigned long exec = 0x10000000;
-
-	WARN_ON(irqs_disabled());
-
-	/*
-	 * preload cache can only be used to determine whether a SLB
-	 * entry exists if it does not start to overflow.
-	 */
-	if (ti->slb_preload_nr + 2 > SLB_PRELOAD_NR)
-		return;
-
-	hard_irq_disable();
-
-	/*
-	 * We have no good place to clear the slb preload cache on exec,
-	 * flush_thread is about the earliest arch hook but that happens
-	 * after we switch to the mm and have already preloaded the SLBEs.
-	 *
-	 * For the most part that's probably okay to use entries from the
-	 * previous exec, they will age out if unused. It may turn out to
-	 * be an advantage to clear the cache before switching to it,
-	 * however.
-	 */
-
-	/*
-	 * preload some userspace segments into the SLB.
-	 * Almost all 32 and 64bit PowerPC executables are linked at
-	 * 0x10000000 so it makes sense to preload this segment.
-	 */
-	if (!is_kernel_addr(exec)) {
-		if (preload_add(ti, exec))
-			slb_allocate_user(mm, exec);
-	}
-
-	/* Libraries and mmaps. */
-	if (!is_kernel_addr(mm->mmap_base)) {
-		if (preload_add(ti, mm->mmap_base))
-			slb_allocate_user(mm, mm->mmap_base);
-	}
-
-	/* see switch_slb */
-	asm volatile("isync" : : : "memory");
-
-	local_irq_enable();
-}
-
-void preload_new_slb_context(unsigned long start, unsigned long sp)
-{
-	struct thread_info *ti = current_thread_info();
-	struct mm_struct *mm = current->mm;
-	unsigned long heap = mm->start_brk;
-
-	WARN_ON(irqs_disabled());
-
-	/* see above */
-	if (ti->slb_preload_nr + 3 > SLB_PRELOAD_NR)
-		return;
-
-	hard_irq_disable();
-
-	/* Userspace entry address. */
-	if (!is_kernel_addr(start)) {
-		if (preload_add(ti, start))
-			slb_allocate_user(mm, start);
-	}
-
-	/* Top of stack, grows down. */
-	if (!is_kernel_addr(sp)) {
-		if (preload_add(ti, sp))
-			slb_allocate_user(mm, sp);
-	}
-
-	/* Bottom of heap, grows up. */
-	if (heap && !is_kernel_addr(heap)) {
-		if (preload_add(ti, heap))
-			slb_allocate_user(mm, heap);
-	}
-
-	/* see switch_slb */
-	asm volatile("isync" : : : "memory");
-
-	local_irq_enable();
-}
-
 static void slb_cache_slbie_kernel(unsigned int index)
 {
 	unsigned long slbie_data = get_paca()->slb_cache[index];
-- 
2.47.3


