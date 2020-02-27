Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D1617112D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:59:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sk6W4RLszDqvR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 17:58:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk446nwZzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:56:52 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6qUpQ000713; Thu, 27 Feb 2020 01:56:46 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydhhny8du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:56:46 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6qgQk001189;
 Thu, 27 Feb 2020 01:56:45 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydhhny8dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:56:45 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6o48P024965;
 Thu, 27 Feb 2020 06:56:45 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 2ydcmku9qv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:56:45 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6uiqB14681014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:56:44 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99FD328059;
 Thu, 27 Feb 2020 06:56:44 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60A252805A;
 Thu, 27 Feb 2020 06:56:42 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:56:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 00/21] Avoid IPI while updating page table entries.
Date: Thu, 27 Feb 2020 12:25:59 +0530
Message-Id: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=2 clxscore=1011 adultscore=0 lowpriorityscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002270053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Problem Summary:
Slow termination of KVM guest with large guest RAM config due to a large number
of IPIs that were caused by clearing level 1 PTE entries (THP) entries.
This is shown in the stack trace below.


- qemu-system-ppc  [kernel.vmlinux]            [k] smp_call_function_many
   - smp_call_function_many
      - 36.09% smp_call_function_many
           serialize_against_pte_lookup 
           radix__pmdp_huge_get_and_clear
           zap_huge_pmd
           unmap_page_range
           unmap_vmas
           unmap_region
           __do_munmap
           __vm_munmap
           sys_munmap
          system_call 
           __munmap
           qemu_ram_munmap
           qemu_anon_ram_free
           reclaim_ramblock
           call_rcu_thread
           qemu_thread_start 
           start_thread
           __clone

Why we need to do IPI when clearing PMD entries:
This was added as part of commit: 13bd817bb884 ("powerpc/thp: Serialize pmd clear against a linux page table walk")

serialize_against_pte_lookup makes sure that all parallel lockless page table
walk completes before we convert a PMD pte entry to regular pmd entry.
We end up doing that conversion in the below scenarios

1) __split_huge_zero_page_pmd
2) do_huge_pmd_wp_page_fallback
3) MADV_DONTNEED running parallel to page faults.

local_irq_disable and lockless page table walk:

The lockless page table walk work with the assumption that we can dereference
the page table contents without holding a lock. For this to work, we need to
make sure we read the page table contents atomically and page table pages are
not going to be freed/released while we are walking the
table pages. We can achieve by using a rcu based freeing for page table pages or
if the architecture implements broadcast tlbie, we can block the IPI as we walk the
page table pages.

To support both the above framework, lockless page table walk is done with
irq disabled instead of rcu_read_lock()

We do have two interface for lockless page table walk, gup fast and __find_linux_pte.
This patch series makes __find_linux_pte table walk safe against the conversion of PMD PTE
to regular PMD. 

gup fast:

gup fast is already safe against THP split because kernel now differentiate between a pmd
split and a compound page split. gup fast can run parallel to a pmd split and we prevent
a parallel gup fast to a hugepage split, by freezing the page refcount and failing the
speculative page ref increment.


Similar to how gup is safe against parallel pmd split, this patch series updates the
__find_linux_pte callers to be safe against a parallel pmd split. We do that by enforcing
the following rules.

1) Don't reload the pte value, because that can be updated in parallel.
2) Code should be able to work with a stale PTE value and not the recent one. ie,
the pte value that we are looking at may not be the latest value in the page table.
3) Before looking at pte value check for _PAGE_PTE bit. We now do this as part of pte_present()
check.

NOTE: I am still looking for details w.r.t corruption fixed by 
Commit: 33258a1db165 ("powerpc/64s: Fix THP PMD collapse serialisation")
Understanding that is important to make sure this series is not creating a regression around that.


Aneesh Kumar K.V (21):
  powerpc/pkeys: Avoid using lockless page table walk
  powerpc/pkeys: Check vma before returning key fault error to the user
  powerpc/mm/hash64: use _PAGE_PTE when checking for pte_present
  powerpc/hash64: Restrict page table lookup using init_mm with
    __flush_hash_table_range
  powerpc/book3s64/hash: Use the pte_t address from the caller
  powerpc/book3s/hash64/devmap: Use H_PAGE_THP_HUGE when setting up
    level huge devmap pte entries
  powerpc/mce: Don't reload pte val in addr_to_pfn
  powerpc/perf/callchain: Use __get_user_pages_fast in
    read_user_stack_slow
  powerpc/kvm/book3s: switch from raw_spin_*lock to arch_spin_lock.
  powerpc/kvm/book3s: Add helper to walk partition scoped linux page
    table.
  powerpc/kvm/nested: Add helper to walk nested shadow linux page table.
  powerpc/kvm/book3s: Use kvm helpers to walk shadow or secondary table
  powerpc/kvm/book3s: Add helper for host page table walk
  powerpc/kvm/book3s: Use find_kvm_host_pte in page fault handler
  powerpc/kvm/book3s: Use find_kvm_host_pte in h_enter
  powerpc/kvm/book3s: use find_kvm_host_pte in pute_tce functions
  powerpc/kvm/book3s: Avoid using rmap to protect parallel page table
    update.
  powerpc/kvm/book3s: use find_kvm_host_pte in
    kvmppc_book3s_instantiate_page
  powerpc/kvm/book3s: Use find_kvm_host_pte in kvmppc_get_hpa
  powerpc/kvm/book3s: Use pte_present instead of opencoding
    _PAGE_PRESENT check
  powerpc/mm/book3s64: Avoid sending IPI on clearing PMD

 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  6 ++
 arch/powerpc/include/asm/book3s/64/hash-64k.h |  8 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 19 +++--
 arch/powerpc/include/asm/book3s/64/radix.h    |  5 ++
 .../include/asm/book3s/64/tlbflush-hash.h     |  3 +-
 arch/powerpc/include/asm/kvm_book3s.h         |  2 +-
 arch/powerpc/include/asm/kvm_book3s_64.h      | 34 ++++++++-
 arch/powerpc/include/asm/mmu.h                |  9 ---
 arch/powerpc/kernel/mce_power.c               | 14 ++--
 arch/powerpc/kernel/pci_64.c                  |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           | 12 ++-
 arch/powerpc/kvm/book3s_64_mmu_radix.c        | 40 +++++-----
 arch/powerpc/kvm/book3s_64_vio_hv.c           | 64 ++++++++--------
 arch/powerpc/kvm/book3s_hv_nested.c           | 37 ++++++---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           | 58 +++++---------
 arch/powerpc/mm/book3s64/hash_pgtable.c       | 11 ---
 arch/powerpc/mm/book3s64/hash_tlb.c           | 16 +---
 arch/powerpc/mm/book3s64/hash_utils.c         | 62 ++++-----------
 arch/powerpc/mm/book3s64/pgtable.c            |  8 --
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 20 ++---
 arch/powerpc/mm/fault.c                       | 75 +++++++++++++------
 arch/powerpc/perf/callchain.c                 | 53 ++++++-------
 22 files changed, 274 insertions(+), 284 deletions(-)

-- 
2.24.1

