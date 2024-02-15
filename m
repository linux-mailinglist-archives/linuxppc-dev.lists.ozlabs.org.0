Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F7855F57
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 11:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBJT34qxz3vm8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 21:34:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbBGj4hcfz3bwd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 21:33:01 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 149FD14BF;
	Thu, 15 Feb 2024 02:33:11 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.26])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B7CA3F7B4;
	Thu, 15 Feb 2024 02:32:26 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Barry Song <21cnbao@gmail.com>,
	Alistair Popple <apopple@nvidia.com>,
	Yang Shi <shy828301@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH v6 03/18] mm: Introduce pte_advance_pfn() and use for pte_next_pfn()
Date: Thu, 15 Feb 2024 10:31:50 +0000
Message-Id: <20240215103205.2607016-4-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240215103205.2607016-1-ryan.roberts@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The goal is to be able to advance a PTE by an arbitrary number of PFNs.
So introduce a new API that takes a nr param. Define the default
implementation here and allow for architectures to override.
pte_next_pfn() becomes a wrapper around pte_advance_pfn().

Follow up commits will convert each overriding architecture's
pte_next_pfn() to pte_advance_pfn().

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/pgtable.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 231370e1b80f..b7ac8358f2aa 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -212,14 +212,17 @@ static inline int pmd_dirty(pmd_t pmd)
 #define arch_flush_lazy_mmu_mode()	do {} while (0)
 #endif
 
-
 #ifndef pte_next_pfn
-static inline pte_t pte_next_pfn(pte_t pte)
+#ifndef pte_advance_pfn
+static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
 {
-	return __pte(pte_val(pte) + (1UL << PFN_PTE_SHIFT));
+	return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
 }
 #endif
 
+#define pte_next_pfn(pte) pte_advance_pfn(pte, 1)
+#endif
+
 #ifndef set_ptes
 /**
  * set_ptes - Map consecutive pages to a contiguous range of addresses.
-- 
2.25.1

