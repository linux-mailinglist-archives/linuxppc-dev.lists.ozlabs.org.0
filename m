Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F694F7D31
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYydw3Hxrz3fh7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:43:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KYyQx6Mp4z3cJs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:33:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AED7015BF;
 Thu,  7 Apr 2022 03:33:10 -0700 (PDT)
Received: from a077893.arm.com (unknown [10.163.36.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E739E3F5A1;
 Thu,  7 Apr 2022 03:33:06 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V4 6/7] mm/mmap: Drop arch_filter_pgprot()
Date: Thu,  7 Apr 2022 16:02:50 +0530
Message-Id: <20220407103251.1209606-7-anshuman.khandual@arm.com>
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

There are no platforms left which subscribe ARCH_HAS_FILTER_PGPROT. Hence
drop generic arch_filter_pgprot() and also config ARCH_HAS_FILTER_PGPROT.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/Kconfig | 3 ---
 mm/mmap.c  | 9 +--------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index b1f7624276f8..3f7b6d7b69df 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -762,9 +762,6 @@ config ARCH_HAS_CURRENT_STACK_POINTER
 	  register alias named "current_stack_pointer", this config can be
 	  selected.
 
-config ARCH_HAS_FILTER_PGPROT
-	bool
-
 config ARCH_HAS_VM_GET_PAGE_PROT
 	bool
 
diff --git a/mm/mmap.c b/mm/mmap.c
index 87cb2eaf7e1a..edf2a5e38f4d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -107,20 +107,13 @@ pgprot_t protection_map[16] __ro_after_init = {
 };
 
 #ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
-#ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
-static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
-{
-	return prot;
-}
-#endif
-
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
 	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
 				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
 			pgprot_val(arch_vm_get_page_prot(vm_flags)));
 
-	return arch_filter_pgprot(ret);
+	return ret;
 }
 EXPORT_SYMBOL(vm_get_page_prot);
 #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
-- 
2.25.1

