Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7501FE709
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 04:38:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nR2M2phdzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 12:38:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49nPCQ3bFHzDqyJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 11:16:16 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BB6C31B;
 Wed, 17 Jun 2020 18:16:13 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.80.176])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3351C3F6CF;
 Wed, 17 Jun 2020 18:16:02 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V3 (RESEND) 0/3] arm64: Enable vmemmap mapping from device
 memory
Date: Thu, 18 Jun 2020 06:45:27 +0530
Message-Id: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series enables vmemmap backing memory allocation from device memory
ranges on arm64. But before that, it enables vmemmap_populate_basepages()
and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
alocation requests.

This series applies on 5.8-rc1.

Pending Question:

altmap_alloc_block_buf() does not have any other remaining users in the
tree after this change. Should it be converted into a static function and
it's declaration be dropped from the header (include/linux/mm.h). Avoided
doing so because I was not sure if there are any off-tree users or not.

Changes in V3:

- Dropped comment from free_hotplug_page_range() per Robin
- Modified comment in unmap_hotplug_range() per Robin
- Enabled altmap support in vmemmap_alloc_block_buf() per Robin

Changes in V2: (https://lkml.org/lkml/2020/3/4/475)

- Rebased on latest hot-remove series (v14) adding P4D page table support

Changes in V1: (https://lkml.org/lkml/2020/1/23/12)

- Added an WARN_ON() in unmap_hotplug_range() when altmap is
  provided without the page table backing memory being freed

Changes in RFC V2: (https://lkml.org/lkml/2019/10/21/11)

- Changed the commit message on 1/2 patch per Will
- Changed the commit message on 2/2 patch as well
- Rebased on arm64 memory hot remove series (v10)

RFC V1: (https://lkml.org/lkml/2019/6/28/32)

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (3):
  mm/sparsemem: Enable vmem_altmap support in vmemmap_populate_basepages()
  mm/sparsemem: Enable vmem_altmap support in vmemmap_alloc_block_buf()
  arm64/mm: Enable vmem_altmap support for vmemmap mappings

 arch/arm64/mm/mmu.c       | 59 ++++++++++++++++++++++++++-------------
 arch/ia64/mm/discontig.c  |  2 +-
 arch/powerpc/mm/init_64.c | 10 +++----
 arch/riscv/mm/init.c      |  2 +-
 arch/x86/mm/init_64.c     | 12 ++++----
 include/linux/mm.h        |  8 ++++--
 mm/sparse-vmemmap.c       | 38 ++++++++++++++++++++-----
 7 files changed, 87 insertions(+), 44 deletions(-)

-- 
2.20.1

