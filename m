Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A9232E014
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 04:28:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsCrJ10w4z3dCc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 14:28:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DsCqz0kXMz3cGv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 14:28:28 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 286EDD6E;
 Thu,  4 Mar 2021 19:28:26 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.68.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 258B43F7D7;
 Thu,  4 Mar 2021 19:28:21 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V3] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
Date: Fri,  5 Mar 2021 08:58:48 +0530
Message-Id: <1614914928-22039-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

HUGETLB_PAGE_SIZE_VARIABLE need not be defined for each individual
platform subscribing it. Instead just make it generic.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This change was originally suggested in an earilier discussion. This
applies on v5.12-rc1 and has been build tested on all applicable
platforms i.e ia64 and powerpc.

https://patchwork.kernel.org/project/linux-mm/patch/1613024531-19040-3-git-send-email-anshuman.khandual@arm.com/

Changes in V3:

- Dropped the bool desciption that enabled user selection
- Dropped the dependency on HUGETLB_PAGE for HUGETLB_PAGE_SIZE_VARIABLE

Changes in V2:

https://patchwork.kernel.org/project/linux-mm/patch/1614661987-23881-1-git-send-email-anshuman.khandual@arm.com/

- Added a description for HUGETLB_PAGE_SIZE_VARIABLE
- Added HUGETLB_PAGE dependency while selecting HUGETLB_PAGE_SIZE_VARIABLE

Changes in V1:

https://patchwork.kernel.org/project/linux-mm/patch/1614577853-7452-1-git-send-email-anshuman.khandual@arm.com/

 arch/ia64/Kconfig    | 6 +-----
 arch/powerpc/Kconfig | 6 +-----
 mm/Kconfig           | 7 +++++++
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 2ad7a8d29fcc..dccf5bfebf48 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -32,6 +32,7 @@ config IA64
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
+	select HUGETLB_PAGE_SIZE_VARIABLE if HUGETLB_PAGE
 	select VIRT_TO_BUS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PENDING_IRQ if SMP
@@ -82,11 +83,6 @@ config STACKTRACE_SUPPORT
 config GENERIC_LOCKBREAK
 	def_bool n
 
-config HUGETLB_PAGE_SIZE_VARIABLE
-	bool
-	depends on HUGETLB_PAGE
-	default y
-
 config GENERIC_CALIBRATE_DELAY
 	bool
 	default y
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..11fea95a1f2c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -231,6 +231,7 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MMU_GATHER_PAGE_SIZE
 	select HAVE_REGS_AND_STACK_ACCESS_API
@@ -415,11 +416,6 @@ config HIGHMEM
 
 source "kernel/Kconfig.hz"
 
-config HUGETLB_PAGE_SIZE_VARIABLE
-	bool
-	depends on HUGETLB_PAGE && PPC_BOOK3S_64
-	default y
-
 config MATH_EMULATION
 	bool "Math emulation"
 	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
diff --git a/mm/Kconfig b/mm/Kconfig
index 24c045b24b95..4413a69e7850 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -274,6 +274,13 @@ config ARCH_ENABLE_HUGEPAGE_MIGRATION
 config ARCH_ENABLE_THP_MIGRATION
 	bool
 
+config HUGETLB_PAGE_SIZE_VARIABLE
+	def_bool n
+	help
+	  Allows the pageblock_order value to be dynamic instead of just standard
+	  HUGETLB_PAGE_ORDER when there are multiple HugeTLB page sizes available
+	  on a platform.
+
 config CONTIG_ALLOC
 	def_bool (MEMORY_ISOLATION && COMPACTION) || CMA
 
-- 
2.20.1

