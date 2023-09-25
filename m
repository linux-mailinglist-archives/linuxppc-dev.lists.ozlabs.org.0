Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9516A7ADF48
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Sep 2023 20:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RvX4Y3yVnz3hy0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Sep 2023 04:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RvWjc3xSVz3dsT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Sep 2023 04:33:56 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RvWgj5xjwz9vCC;
	Mon, 25 Sep 2023 20:32:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w06IP2b_9jGx; Mon, 25 Sep 2023 20:32:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RvWg80ctCz9v2F;
	Mon, 25 Sep 2023 20:31:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 116358B78C;
	Mon, 25 Sep 2023 20:31:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zZwLTLzqyG9N; Mon, 25 Sep 2023 20:31:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.137])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C8B528B763;
	Mon, 25 Sep 2023 20:31:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38PIVctW1499308
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 20:31:38 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38PIVcR51499279;
	Mon, 25 Sep 2023 20:31:38 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
Date: Mon, 25 Sep 2023 20:31:51 +0200
Message-ID: <4283ea9cbef9ff2fbee468904800e1962bc8fc18.1695659959.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695659959.git.christophe.leroy@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695666677; l=9003; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=FVim9qpC8yu8zbHE5Y+NQgvWgaWzX0CPJgVT3bS0s5w=; b=3Mn8VNqS7ZHvgjZMiNAnh1e608hmFpDa/mnq1jF5vZATlOtqtlVXO3+059lbn63mpN2OT6Eh2 4nZKUzp3SaUD2loiZKmYh351JPvXj9A9aXOW9qFXwoZ0WKdGIIr2b0B
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Kees Cook <keescook@chromium.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce PAGE_EXECONLY_X macro which provides exec-only rights.
The _X may be seen as redundant with the EXECONLY but it helps
keep consistancy, all macros having the EXEC right have _X.

And put it next to PAGE_NONE as PAGE_EXECONLY_X is
somehow PAGE_NONE + EXEC just like all other SOMETHING_X are
just SOMETHING + EXEC.

On book3s/64 PAGE_EXECONLY becomes PAGE_READONLY_X.

On book3s/64, as PAGE_EXECONLY is only valid for Radix add
VM_READ flag in vm_get_page_prot() for non-Radix.

And update access_error() so that a non exec fault on a VM_EXEC only
mapping is always invalid, even when the underlying layer don't
always generate a fault for that.

For 8xx, set PAGE_EXECONLY_X as _PAGE_NA | _PAGE_EXEC.
For others, only set it as just _PAGE_EXEC

With that change, 8xx, e500 and 44x fully honor execute-only
protection.

On 40x that is a partial implementation of execute-only. The
implementation won't be complete because once a TLB has been loaded
via the Instruction TLB miss handler, it will be possible to read
the page. But at least it can't be read unless it is executed first.

On 603 MMU, TLB missed are handled by SW and there are separate
DTLB and ITLB. Execute-only is therefore now supported by not loading
DTLB when read access is not permitted.

On hash (604) MMU it is more tricky because hash table is common to
load/store and execute. Nevertheless it is still possible to check
whether _PAGE_READ is set before loading hash table for a load/store
access. At least it can't be read unless it is executed first.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Russell Currey <ruscur@russell.cc>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |  4 +---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  1 +
 arch/powerpc/include/asm/nohash/pgtable.h    |  2 +-
 arch/powerpc/include/asm/nohash/pte-e500.h   |  1 +
 arch/powerpc/include/asm/pgtable-masks.h     |  2 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 10 ++++------
 arch/powerpc/mm/fault.c                      |  9 +++++----
 arch/powerpc/mm/pgtable.c                    |  4 ++--
 9 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 244621c88510..52971ee30717 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -425,7 +425,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
 	 * A read-only access is controlled by _PAGE_READ bit.
-	 * We have _PAGE_READ set for WRITE and EXECUTE
+	 * We have _PAGE_READ set for WRITE
 	 */
 	if (!pte_present(pte) || !pte_read(pte))
 		return false;
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 0fd12bdc7b5e..751b01227e36 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -18,6 +18,7 @@
 #define _PAGE_WRITE		0x00002 /* write access allowed */
 #define _PAGE_READ		0x00004	/* read access allowed */
 #define _PAGE_NA		_PAGE_PRIVILEGED
+#define _PAGE_NAX		_PAGE_EXEC
 #define _PAGE_RO		_PAGE_READ
 #define _PAGE_ROX		(_PAGE_READ | _PAGE_EXEC)
 #define _PAGE_RW		(_PAGE_READ | _PAGE_WRITE)
@@ -141,9 +142,6 @@
 
 #include <asm/pgtable-masks.h>
 
-/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
-#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
-
 /* Permission masks used for kernel mappings */
 #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
 #define PAGE_KERNEL_NC	__pgprot(_PAGE_BASE_NC | _PAGE_KERNEL_RW | _PAGE_TOLERANT)
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 1ee38befd29a..137dc3c84e45 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -48,6 +48,7 @@
 
 #define _PAGE_HUGE	0x0800	/* Copied to L1 PS bit 29 */
 
+#define _PAGE_NAX	(_PAGE_NA | _PAGE_EXEC)
 #define _PAGE_ROX	(_PAGE_RO | _PAGE_EXEC)
 #define _PAGE_RW	0
 #define _PAGE_RWX	_PAGE_EXEC
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index f922c84b23eb..a50be1de9f83 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -203,7 +203,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
 {
 	/*
 	 * A read-only access is controlled by _PAGE_READ bit.
-	 * We have _PAGE_READ set for WRITE and EXECUTE
+	 * We have _PAGE_READ set for WRITE
 	 */
 	if (!pte_present(pte) || !pte_read(pte))
 		return false;
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index 31d2c3ea7df8..f516f0b5b7a8 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -57,6 +57,7 @@
 #define _PAGE_KERNEL_ROX	(_PAGE_BAP_SR | _PAGE_BAP_SX)
 
 #define _PAGE_NA	0
+#define _PAGE_NAX	_PAGE_BAP_UX
 #define _PAGE_RO	_PAGE_READ
 #define _PAGE_ROX	(_PAGE_READ | _PAGE_BAP_UX)
 #define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
diff --git a/arch/powerpc/include/asm/pgtable-masks.h b/arch/powerpc/include/asm/pgtable-masks.h
index 808a3b9e8fc0..6e8e2db26a5a 100644
--- a/arch/powerpc/include/asm/pgtable-masks.h
+++ b/arch/powerpc/include/asm/pgtable-masks.h
@@ -4,6 +4,7 @@
 
 #ifndef _PAGE_NA
 #define _PAGE_NA	0
+#define _PAGE_NAX	_PAGE_EXEC
 #define _PAGE_RO	_PAGE_READ
 #define _PAGE_ROX	(_PAGE_READ | _PAGE_EXEC)
 #define _PAGE_RW	(_PAGE_READ | _PAGE_WRITE)
@@ -20,6 +21,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
+#define PAGE_EXECONLY_X	__pgprot(_PAGE_BASE | _PAGE_NAX)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_RWX)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 8f8a62d3ff4d..be229290a6a7 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -635,12 +635,10 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)
 	unsigned long prot;
 
 	/* Radix supports execute-only, but protection_map maps X -> RX */
-	if (radix_enabled() && ((vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)) {
-		prot = pgprot_val(PAGE_EXECONLY);
-	} else {
-		prot = pgprot_val(protection_map[vm_flags &
-						 (VM_ACCESS_FLAGS | VM_SHARED)]);
-	}
+	if (!radix_enabled() && ((vm_flags & VM_ACCESS_FLAGS) == VM_EXEC))
+		vm_flags |= VM_READ;
+
+	prot = pgprot_val(protection_map[vm_flags & (VM_ACCESS_FLAGS | VM_SHARED)]);
 
 	if (vm_flags & VM_SAO)
 		prot |= _PAGE_SAO;
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index b1723094d464..9e49ede2bc1c 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -266,14 +266,15 @@ static bool access_error(bool is_write, bool is_exec, struct vm_area_struct *vma
 	}
 
 	/*
-	 * VM_READ, VM_WRITE and VM_EXEC all imply read permissions, as
-	 * defined in protection_map[].  Read faults can only be caused by
-	 * a PROT_NONE mapping, or with a PROT_EXEC-only mapping on Radix.
+	 * VM_READ, VM_WRITE and VM_EXEC may imply read permissions, as
+	 * defined in protection_map[].  In that case Read faults can only be
+	 * caused by a PROT_NONE mapping. However a non exec access on a
+	 * VM_EXEC only mapping is invalid anyway, so report it as such.
 	 */
 	if (unlikely(!vma_is_accessible(vma)))
 		return true;
 
-	if (unlikely(radix_enabled() && ((vma->vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)))
+	if ((vma->vm_flags & VM_ACCESS_FLAGS) == VM_EXEC)
 		return true;
 
 	/*
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 781a68c69c2f..79508c1d15d7 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -492,7 +492,7 @@ const pgprot_t protection_map[16] = {
 	[VM_READ]					= PAGE_READONLY,
 	[VM_WRITE]					= PAGE_COPY,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
-	[VM_EXEC]					= PAGE_READONLY_X,
+	[VM_EXEC]					= PAGE_EXECONLY_X,
 	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
 	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
 	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
@@ -500,7 +500,7 @@ const pgprot_t protection_map[16] = {
 	[VM_SHARED | VM_READ]				= PAGE_READONLY,
 	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
 	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
-	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
+	[VM_SHARED | VM_EXEC]				= PAGE_EXECONLY_X,
 	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
 	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
-- 
2.41.0

