Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F39684F7D36
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyfn0GY9z3ftC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:44:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KYyQy59pYz3cK5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:33:46 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A46312FC;
 Thu,  7 Apr 2022 03:33:15 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.36.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4DF943F5A1;
 Thu,  7 Apr 2022 03:33:11 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V4 7/7] mm/mmap: Drop arch_vm_get_page_pgprot()
Date: Thu,  7 Apr 2022 16:02:51 +0530
Message-Id: <20220407103251.1209606-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407103251.1209606-1-anshuman.khandual@arm.com>
References: <20220407103251.1209606-1-anshuman.khandual@arm.com>
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
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are no platforms left which use arch_vm_get_page_prot(). Just drop
generic arch_vm_get_page_prot().

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/mman.h | 4 ----
 mm/mmap.c            | 3 +--
 2 files changed, 1 insertion(+), 6 deletions(-)

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
index edf2a5e38f4d..db7f33154206 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -110,8 +110,7 @@ pgprot_t protection_map[16] __ro_after_init = {
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
 	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
-				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
-			pgprot_val(arch_vm_get_page_prot(vm_flags)));
+				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]));
 
 	return ret;
 }
-- 
2.25.1

