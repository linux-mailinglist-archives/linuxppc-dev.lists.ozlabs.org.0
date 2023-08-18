Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C0781009
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:14:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RS6Qk0DbWz3dFS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 02:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RS6Pl23CCz3cGC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 02:14:03 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RS6PY2hn2z9vbg;
	Fri, 18 Aug 2023 18:13:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7GzkWEFP1NI; Fri, 18 Aug 2023 18:13:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RS6PX0lZnz9vbc;
	Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 15A988B76C;
	Fri, 18 Aug 2023 18:13:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2Znxlenji7VQ; Fri, 18 Aug 2023 18:13:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (PO17626.IDSI0.si.c-s.fr [172.19.54.29])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BDA618B763;
	Fri, 18 Aug 2023 18:13:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37IGDeLD139529
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 18:13:40 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37IGDaor139513;
	Fri, 18 Aug 2023 18:13:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 1/2] powerpc: Introduce PAGE_NONE_X to replace PAGE_EXECONLY
Date: Fri, 18 Aug 2023 18:13:26 +0200
Message-ID: <227e23622d4778c342d072541ad2416aea5ab44e.1692375190.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692375205; l=9146; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NoIAHeOgWsGl7U1Op61hlSKaEbee8y69me0TsoLfS4A=; b=Zfm9arVNfVoz5/IRv2SpyRxIeYCk+0wOmVg2HYh3Ql4PyVc4TMhVUiCGsFZvN7WJflviqtfz6 4jV2vHVTwAzAt9WE+2AmghLZKTh9MmVhb33UqurE+hJFH2qvY0lzWu7
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

Introduce PAGE_NONE_X macro which provides exec-only rights.

For the time being, this is a copy of PAGE_READONLY_X on all subarches
except on book3s/64 where PAGE_EXECONLY becomes PAGE_NONE_X.

On book3s/64, as PAGE_EXECONLY is only valid for Radix add
VM_READ flag in vm_get_page_prot() for non-Radix.

And update access_error() so that a non exec fault on a VM_EXEC only
mapping is always invalid, even when the underlying layer don't
always generate a fault for that.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Russell Currey <ruscur@russell.cc>
Cc: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h  |  1 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  4 ++--
 arch/powerpc/include/asm/nohash/32/pte-40x.h  |  1 +
 arch/powerpc/include/asm/nohash/32/pte-44x.h  |  1 +
 arch/powerpc/include/asm/nohash/32/pte-85xx.h |  1 +
 arch/powerpc/include/asm/nohash/32/pte-8xx.h  |  1 +
 arch/powerpc/include/asm/nohash/pte-e500.h    |  1 +
 arch/powerpc/mm/book3s64/pgtable.c            | 10 ++++------
 arch/powerpc/mm/fault.c                       |  9 +++++----
 arch/powerpc/mm/pgtable.c                     |  4 ++--
 10 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index d49c2a9d4ffe..96a38ce29a76 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -105,6 +105,7 @@ static inline bool pte_user(pte_t pte)
  * Write permissions imply read permissions for now.
  */
 #define PAGE_NONE	__pgprot(_PAGE_BASE)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 4acc9690f599..4ae909e95d46 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -144,14 +144,14 @@
  * possible on platforms that define _PAGE_EXEC
  */
 #define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_PRIVILEGED)
+/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_RW | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_READ)
 #define PAGE_COPY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
 #define PAGE_READONLY	__pgprot(_PAGE_BASE | _PAGE_READ)
 #define PAGE_READONLY_X	__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_EXEC)
-/* Radix only, Hash uses PAGE_READONLY_X + execute-only pkey instead */
-#define PAGE_EXECONLY	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 
 /* Permission masks used for kernel mappings */
 #define PAGE_KERNEL	__pgprot(_PAGE_BASE | _PAGE_KERNEL_RW)
diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
index 6fe46e754556..b5ad980cca64 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-40x.h
@@ -77,6 +77,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
diff --git a/arch/powerpc/include/asm/nohash/32/pte-44x.h b/arch/powerpc/include/asm/nohash/32/pte-44x.h
index b7ed13cee137..afea625b6ad2 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-44x.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-44x.h
@@ -107,6 +107,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
diff --git a/arch/powerpc/include/asm/nohash/32/pte-85xx.h b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
index 16451df5ddb0..7cfe4913f3aa 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-85xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
@@ -63,6 +63,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index 1a89ebdc3acc..b234a93b05f1 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -79,6 +79,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE | _PAGE_NA)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_RO | _PAGE_EXEC)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_EXEC)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_RO)
diff --git a/arch/powerpc/include/asm/nohash/pte-e500.h b/arch/powerpc/include/asm/nohash/pte-e500.h
index d8924cbd61e4..1cd9c19b81a0 100644
--- a/arch/powerpc/include/asm/nohash/pte-e500.h
+++ b/arch/powerpc/include/asm/nohash/pte-e500.h
@@ -91,6 +91,7 @@
 
 /* Permission masks used to generate the __P and __S table */
 #define PAGE_NONE	__pgprot(_PAGE_BASE)
+#define PAGE_NONE_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_BAP_UX)
 #define PAGE_SHARED	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW)
 #define PAGE_SHARED_X	__pgprot(_PAGE_BASE | _PAGE_USER | _PAGE_RW | _PAGE_BAP_UX)
 #define PAGE_COPY	__pgprot(_PAGE_BASE | _PAGE_USER)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 2f2872986b09..d1d7e314c0d8 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -557,12 +557,10 @@ pgprot_t vm_get_page_prot(unsigned long vm_flags)
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
index 5bfdf6ecfa96..50e1bfffe552 100644
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
index cb2dcdb18f8e..1a27489e235b 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -479,7 +479,7 @@ const pgprot_t protection_map[16] = {
 	[VM_READ]					= PAGE_READONLY,
 	[VM_WRITE]					= PAGE_COPY,
 	[VM_WRITE | VM_READ]				= PAGE_COPY,
-	[VM_EXEC]					= PAGE_READONLY_X,
+	[VM_EXEC]					= PAGE_NONE_X,
 	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
 	[VM_EXEC | VM_WRITE]				= PAGE_COPY_X,
 	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
@@ -487,7 +487,7 @@ const pgprot_t protection_map[16] = {
 	[VM_SHARED | VM_READ]				= PAGE_READONLY,
 	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
 	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED,
-	[VM_SHARED | VM_EXEC]				= PAGE_READONLY_X,
+	[VM_SHARED | VM_EXEC]				= PAGE_NONE_X,
 	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
 	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED_X,
 	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
-- 
2.41.0

