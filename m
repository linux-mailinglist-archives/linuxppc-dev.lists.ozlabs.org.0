Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF544FEF19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 08:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdX792jC1z3f5J
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 16:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KdX3n23hwz3brS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 15:59:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D00D11424;
 Tue, 12 Apr 2022 22:59:01 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.39.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7DE53F70D;
 Tue, 12 Apr 2022 22:58:56 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V6 7/7] mm/mmap: Drop arch_vm_get_page_pgprot()
Date: Wed, 13 Apr 2022 11:28:40 +0530
Message-Id: <20220413055840.392628-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413055840.392628-1-anshuman.khandual@arm.com>
References: <20220413055840.392628-1-anshuman.khandual@arm.com>
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
Cc: linux-arch@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are no platforms left which use arch_vm_get_page_prot(). Just drop
generic arch_vm_get_page_prot().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/mman.h | 4 ----
 mm/mmap.c            | 4 +---
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/mman.h b/include/linux/mman.h
index b66e91b8176c..58b3abd457a3 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -93,10 +93,6 @@ static inline void vm_unacct_memory(long pages)
 #define arch_calc_vm_flag_bits(flags) 0
 #endif
 
-#ifndef arch_vm_get_page_prot
-#define arch_vm_get_page_prot(vm_flags) __pgprot(0)
-#endif
-
 #ifndef arch_validate_prot
 /*
  * This is called from mprotect().  PROT_GROWSDOWN and PROT_GROWSUP have
diff --git a/mm/mmap.c b/mm/mmap.c
index b96e995f3733..475b7c367032 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -109,9 +109,7 @@ pgprot_t protection_map[16] __ro_after_init = {
 #ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	return __pgprot(pgprot_val(protection_map[vm_flags &
-			(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
-			pgprot_val(arch_vm_get_page_prot(vm_flags)));
+	return protection_map[vm_flags & (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)];
 }
 EXPORT_SYMBOL(vm_get_page_prot);
 #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
-- 
2.25.1

