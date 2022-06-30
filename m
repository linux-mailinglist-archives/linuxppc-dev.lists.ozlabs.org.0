Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 561DC56113A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 07:20:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRVV22fdz3f04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYRSB6ht7z3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 15:18:18 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C53A1758;
	Wed, 29 Jun 2022 22:17:47 -0700 (PDT)
Received: from a077893.blr.arm.com (unknown [10.162.41.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 857453F66F;
	Wed, 29 Jun 2022 22:17:39 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V6 07/26] mm/mmap: Build protect protection_map[] with ARCH_HAS_VM_GET_PAGE_PROT
Date: Thu, 30 Jun 2022 10:46:11 +0530
Message-Id: <20220630051630.1718927-8-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, hch@infradead.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Anshuman Khandual <anshuman.khandual@arm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that protection_map[] has been moved inside those platforms that enable
ARCH_HAS_VM_GET_PAGE_PROT. Hence generic protection_map[] array now can be
protected with CONFIG_ARCH_HAS_VM_GET_PAGE_PROT intead of __P000.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 include/linux/mm.h | 2 +-
 mm/mmap.c          | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0ff0a1bad091..07b56995e0fe 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -424,7 +424,7 @@ extern unsigned int kobjsize(const void *objp);
  * mapping from the currently active vm_flags protection bits (the
  * low four bits) to a page protection mask..
  */
-#ifdef __P000
+#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
 extern pgprot_t protection_map[16];
 #endif
 
diff --git a/mm/mmap.c b/mm/mmap.c
index b46d5e931bb3..2cc722e162fa 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -81,7 +81,7 @@ static void unmap_region(struct mm_struct *mm,
 		struct vm_area_struct *vma, struct vm_area_struct *prev,
 		unsigned long start, unsigned long end);
 
-#ifdef __P000
+#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
 pgprot_t protection_map[16] __ro_after_init = {
 	[VM_NONE]					= __P000,
 	[VM_READ]					= __P001,
@@ -100,9 +100,6 @@ pgprot_t protection_map[16] __ro_after_init = {
 	[VM_SHARED | VM_EXEC | VM_WRITE]		= __S110,
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= __S111
 };
-#endif
-
-#ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
 DECLARE_VM_GET_PAGE_PROT
 #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
 
-- 
2.25.1

