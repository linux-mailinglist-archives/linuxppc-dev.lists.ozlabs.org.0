Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C468F1B0AC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 14:51:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495RQf5MDjzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 22:51:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495RHF4zDNzDqcN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 22:44:57 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03KCWaum134893; Mon, 20 Apr 2020 08:44:48 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghmb0wu8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:44:47 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03KCWocL136226;
 Mon, 20 Apr 2020 08:44:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghmb0wtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 08:44:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03KChOir023857;
 Mon, 20 Apr 2020 12:44:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 30fs660je4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Apr 2020 12:44:46 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03KCijmX36241794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Apr 2020 12:44:45 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDCAE136055;
 Mon, 20 Apr 2020 12:44:45 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1464513604F;
 Mon, 20 Apr 2020 12:44:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.51.43])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Apr 2020 12:44:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v3 00/22] Avoid IPI while updating page table entries.
Date: Mon, 20 Apr 2020 18:14:12 +0530
Message-Id: <20200420124434.47330-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-20_03:2020-04-20,
 2020-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=2 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004200107
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
Cc: leonardo@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 npiggin@gmail.com, kirill@shutemov.name
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

Performance:

This speeds up Qemu guest RAM del/unplug time as below
128 core, 496GB guest:

Without patch:
munmap start: timer = 13162 ms, PID=7684
munmap finish: timer = 95312 ms, PID=7684 - delta = 82150 ms

With patch (upto removing IPI)
munmap start: timer = 196449 ms, PID=6681
munmap finish: timer = 196488 ms, PID=6681 - delta = 39ms

With patch (with adding the tlb invalidate in pmdp_huge_get_and_clear_full)
munmap start: timer = 196345 ms, PID=6879
munmap finish: timer = 196714 ms, PID=6879 - delta = 369ms

Changes from V2:
* Rebase to lastest kernel

Changes from V1:
* Update commit messages
* Qemu Performance numbers



Aneesh Kumar K.V (22):
  powerpc/pkeys: Avoid using lockless page table walk
  powerpc/pkeys: Check vma before returning key fault error to the user
  powerpc/mm/hash64: use _PAGE_PTE when checking for pte_present
  powerpc/hash64: Restrict page table lookup using init_mm with
    __flush_hash_table_range
  powerpc/book3s64/hash: Use the pte_t address from the caller
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
  mm: change pmdp_huge_get_and_clear_full take vm_area_struct as arg
  powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel page fault race

 arch/powerpc/include/asm/book3s/64/pgtable.h  | 20 +++--
 .../include/asm/book3s/64/tlbflush-hash.h     |  3 +-
 arch/powerpc/include/asm/kvm_book3s.h         |  2 +-
 arch/powerpc/include/asm/kvm_book3s_64.h      | 34 ++++++++-
 arch/powerpc/include/asm/mmu.h                |  9 ---
 arch/powerpc/kernel/mce_power.c               | 14 ++--
 arch/powerpc/kernel/pci_64.c                  |  2 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c           | 15 ++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c        | 40 +++++-----
 arch/powerpc/kvm/book3s_64_vio_hv.c           | 64 ++++++++--------
 arch/powerpc/kvm/book3s_hv_nested.c           | 37 ++++++---
 arch/powerpc/kvm/book3s_hv_rm_mmu.c           | 58 +++++---------
 arch/powerpc/mm/book3s64/hash_pgtable.c       | 11 ---
 arch/powerpc/mm/book3s64/hash_tlb.c           | 16 +---
 arch/powerpc/mm/book3s64/hash_utils.c         | 62 ++++-----------
 arch/powerpc/mm/book3s64/pgtable.c            | 24 ++++--
 arch/powerpc/mm/book3s64/radix_pgtable.c      | 19 ++---
 arch/powerpc/mm/fault.c                       | 75 +++++++++++++------
 arch/powerpc/perf/callchain_64.c              | 46 ++++--------
 arch/s390/include/asm/pgtable.h               |  4 +-
 include/asm-generic/pgtable.h                 |  4 +-
 mm/huge_memory.c                              |  4 +-
 22 files changed, 275 insertions(+), 288 deletions(-)

-- 
2.25.3

