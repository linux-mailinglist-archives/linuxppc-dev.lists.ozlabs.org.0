Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F03C9657
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 03:41:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46kG1z0JlYzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Oct 2019 11:41:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46kFtk5PRYzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2019 11:35:10 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x931WZ40155104; Wed, 2 Oct 2019 21:33:54 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd2vm6gdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 21:33:54 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x931Wcsv155403;
 Wed, 2 Oct 2019 21:33:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vd2vm6gd0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Oct 2019 21:33:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x931UoxN031350;
 Thu, 3 Oct 2019 01:33:52 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02wdc.us.ibm.com with ESMTP id 2v9y58gg9s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Oct 2019 01:33:52 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x931XoPf46924270
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Oct 2019 01:33:51 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D25867805C;
 Thu,  3 Oct 2019 01:33:50 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B36967805E;
 Thu,  3 Oct 2019 01:33:38 +0000 (GMT)
Received: from LeoBras.ibmuc.com (unknown [9.85.174.224])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Oct 2019 01:33:38 +0000 (GMT)
From: Leonardo Bras <leonardo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v5 00/11] Introduces new count-based method for tracking
 lockless pagetable walks
Date: Wed,  2 Oct 2019 22:33:14 -0300
Message-Id: <20191003013325.2614-1-leonardo@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=931 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910030012
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
Cc: Song Liu <songliubraving@fb.com>, Michal Hocko <mhocko@suse.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 "Dmitry V. Levin" <ldv@altlinux.org>, Keith Busch <keith.busch@intel.com>,
 Paul Mackerras <paulus@samba.org>, Christoph Lameter <cl@linux.com>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Santosh Sivaraj <santosh@fossix.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Allison Randal <allison@lohutok.net>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Ralph Campbell <rcampbell@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Jesper Dangaard Brouer <brouer@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dan Williams <dan.j.williams@intel.com>, Reza Arbab <arbab@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <christian.brauner@ubuntu.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, Roman Gushchin <guro@fb.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If a process (qemu) with a lot of CPUs (128) try to munmap() a large
chunk of memory (496GB) mapped with THP, it takes an average of 275
seconds, which can cause a lot of problems to the load (in qemu case,
the guest will lock for this time).

Trying to find the source of this bug, I found out most of this time is
spent on serialize_against_pte_lookup(). This function will take a lot
of time in smp_call_function_many() if there is more than a couple CPUs
running the user process. Since it has to happen to all THP mapped, it
will take a very long time for large amounts of memory.

By the docs, serialize_against_pte_lookup() is needed in order to avoid
pmd_t to pte_t casting inside find_current_mm_pte(), or any lockless
pagetable walk, to happen concurrently with THP splitting/collapsing.

It does so by calling a do_nothing() on each CPU in mm->cpu_bitmap[],
after interrupts are re-enabled.
Since, interrupts are (usually) disabled during lockless pagetable
walk, and serialize_against_pte_lookup will only return after
interrupts are enabled, it is protected.

So, by what I could understand, if there is no lockless pagetable walk
running, there is no need to call serialize_against_pte_lookup().

So, to avoid the cost of running serialize_against_pte_lookup(), I
propose a counter that keeps track of how many find_current_mm_pte()
are currently running, and if there is none, just skip
smp_call_function_many().

The related functions are:
begin_lockless_pgtbl_walk()
        Insert before starting any lockless pgtable walk
end_lockless_pgtbl_walk()
        Insert after the end of any lockless pgtable walk
        (Mostly after the ptep is last used)
running_lockless_pgtbl_walk()
        Returns the number of lockless pgtable walks running

On my workload (qemu), I could see munmap's time reduction from 275
seconds to 418ms.

Also, I documented some lockless pagetable walks in which it's not
necessary to keep track, given they work on init_mm or guest pgd.

The patchset works by focusing all steps needed to begin/end lockless
pagetable walks on the above functions, and then adding the config option
to enable the tracking of these functions using the counting method.

Changes since v4:
 Rebased on top of v5.4-rc1
 Declared real generic functions instead of dummies
 start_lockless_pgtbl_walk renamed to begin_lockless_pgtbl_walk
 Interrupt {dis,en}able is now inside of {begin,end}_lockless_pgtbl_walk
 Power implementation has option to not {dis,en}able interrupt
 More documentation inside the funtions.
 Some irq maks variables renamed
 Removed some proxy mm_structs
 Few typos fixed

Changes since v3:
 Explain (comments) why some lockless pgtbl walks don't need
	local_irq_disable (real mode + MSR_EE=0)
 Explain (comments) places where counting method is not needed (guest pgd,
	which is not touched by THP)
 Fixes some misplaced local_irq_restore()
 Link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=132417

Changes since v2:
 Rebased to v5.3
 Adds support on __get_user_pages_fast
 Adds usage decription to *_lockless_pgtbl_walk()
 Better style to dummy functions
 Link: http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=131839

Changes since v1:
 Isolated atomic operations in functions *_lockless_pgtbl_walk()
 Fixed behavior of decrementing before last ptep was used
 Link: http://patchwork.ozlabs.org/patch/1163093/


Leonardo Bras (11):
  asm-generic/pgtable: Adds generic functions to monitor lockless
    pgtable walks
  powerpc/mm: Adds counting method to monitor lockless pgtable walks
  mm/gup: Applies counting method to monitor gup_pgd_range
  powerpc/mce_power: Applies counting method to monitor lockless pgtbl
    walks
  powerpc/perf: Applies counting method to monitor lockless pgtbl walks
  powerpc/mm/book3s64/hash: Applies counting method to monitor lockless
    pgtbl walks
  powerpc/kvm/e500: Applies counting method to monitor lockless pgtbl
    walks
  powerpc/kvm/book3s_hv: Applies counting method to monitor lockless
    pgtbl walks
  powerpc/kvm/book3s_64: Applies counting method to monitor lockless
    pgtbl walks
  mm/Kconfig: Adds config option to track lockless pagetable walks
  powerpc/mm/book3s64/pgtable: Uses counting method to skip serializing

 arch/powerpc/include/asm/book3s/64/pgtable.h |   9 ++
 arch/powerpc/kernel/mce_power.c              |   6 +-
 arch/powerpc/kvm/book3s_64_mmu_hv.c          |   6 +-
 arch/powerpc/kvm/book3s_64_mmu_radix.c       |  34 +++++-
 arch/powerpc/kvm/book3s_64_vio_hv.c          |   7 +-
 arch/powerpc/kvm/book3s_hv_nested.c          |  22 +++-
 arch/powerpc/kvm/book3s_hv_rm_mmu.c          |  32 ++---
 arch/powerpc/kvm/e500_mmu_host.c             |   9 +-
 arch/powerpc/mm/book3s64/hash_tlb.c          |   6 +-
 arch/powerpc/mm/book3s64/hash_utils.c        |  27 +++--
 arch/powerpc/mm/book3s64/pgtable.c           | 120 ++++++++++++++++++-
 arch/powerpc/perf/callchain.c                |   6 +-
 include/asm-generic/pgtable.h                |  58 +++++++++
 include/linux/mm_types.h                     |  11 ++
 kernel/fork.c                                |   3 +
 mm/Kconfig                                   |  11 ++
 mm/gup.c                                     |  10 +-
 17 files changed, 325 insertions(+), 52 deletions(-)

-- 
2.20.1

