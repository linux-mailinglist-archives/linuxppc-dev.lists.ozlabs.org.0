Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C76DF19051D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 06:25:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mfpX09GRzDqr5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 16:25:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48mfmC5sPmzDqlp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 16:23:21 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CB3F30E;
 Mon, 23 Mar 2020 22:23:19 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6AE573F7C3;
 Mon, 23 Mar 2020 22:27:15 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
Date: Tue, 24 Mar 2020 10:52:52 +0530
Message-Id: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-doc@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds more arch page table helper tests. The new tests here are
either related to core memory functions and advanced arch pgtable helpers.
This also creates a documentation file enlisting all expected semantics as
suggested by Mike Rapoport (https://lkml.org/lkml/2020/1/30/40).

This series has been tested on arm64 and x86 platforms. There is just one
expected failure on arm64 that will be fixed when we enable THP migration.

[   21.741634] WARNING: CPU: 0 PID: 1 at mm/debug_vm_pgtable.c:782

which corresponds to

WARN_ON(!pmd_present(pmd_mknotpresent(pmd_mkhuge(pmd))))

There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
ifdefs scattered across the test. But consolidating all the fallback stubs
is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.

This series has been build tested on many platforms including the ones that
subscribe the test through ARCH_HAS_DEBUG_VM_PGTABLE.

This series is based on v5.6-rc7 after applying these following patches.

1. https://patchwork.kernel.org/patch/11431277/
2. https://patchwork.kernel.org/patch/11452185/

Changes in V2:

- Dropped CONFIG_ARCH_HAS_PTE_SPECIAL per Christophe
- Dropped CONFIG_NUMA_BALANCING per Christophe
- Dropped CONFIG_HAVE_ARCH_SOFT_DIRTY per Christophe
- Dropped CONFIG_MIGRATION per Christophe
- Replaced CONFIG_S390 with __HAVE_ARCH_PMDP_INVALIDATE
- Moved page allocation & free inside swap_migration_tests() per Christophe
- Added CONFIG_TRANSPARENT_HUGEPAGE to protect pfn_pmd()
- Added CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD to protect pfn_pud()
- Added a patch for other arch advanced page table helper tests
- Added a patch creating a documentation for page table helper semantics

Changes in V1: (https://patchwork.kernel.org/patch/11408253/)

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (3):
  mm/debug: Add tests validating arch page table helpers for core features
  mm/debug: Add tests validating arch advanced page table helpers
  Documentation/mm: Add descriptions for arch page table helpers

 Documentation/vm/arch_pgtable_helpers.rst | 256 ++++++++++
 mm/debug_vm_pgtable.c                     | 594 +++++++++++++++++++++-
 2 files changed, 839 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/vm/arch_pgtable_helpers.rst

-- 
2.20.1

