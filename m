Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13A430910
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:44:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKT56gKzz3dZ5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKN63479z3cbx
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:40:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HXKMC0nJXz9sSm;
 Sun, 17 Oct 2021 14:39:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sf0ECzruHg7y; Sun, 17 Oct 2021 14:39:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HXKM01NV6z9sSr;
 Sun, 17 Oct 2021 14:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10F6E8B76E;
 Sun, 17 Oct 2021 14:39:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YNpNmtQ588GM; Sun, 17 Oct 2021 14:39:07 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.38])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBAA68B774;
 Sun, 17 Oct 2021 14:39:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19HCctnm2946757
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sun, 17 Oct 2021 14:38:55 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19HCctkH2946756;
 Sun, 17 Oct 2021 14:38:55 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 07/12] asm-generic: Define 'func_desc_t' to commonly
 describe function descriptors
Date: Sun, 17 Oct 2021 14:38:20 +0200
Message-Id: <a33107c5b82580862510cc20af0d61e33a2b841d.1634457599.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634457599.git.christophe.leroy@csgroup.eu>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634474303; l=3452; s=20211009;
 h=from:subject:message-id; bh=+4DI7Ni9c1k0VnPM7UG6skvdZ/0xjFYEpJzZhp0UDUE=;
 b=MyHrhDT+d5rQjETbgErHhzv18Xl+XmuUzg2/N4bhknoFaimcnr8KPlsirgGziqhmqo/n3S01t/ix
 X3mZBtBXAANiUUCnbPLtaSUSeQG9FCBv49qkHMjJ5E/QwB7fKDdv
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have three architectures using function descriptors, each with its
own type and name.

Add a common typedef that can be used in generic code.

Also add a stub typedef for architecture without function descriptors,
to avoid a forest of #ifdefs.

It replaces the similar 'func_desc_t' previously defined in
arch/powerpc/kernel/module_64.c

Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/ia64/include/asm/sections.h    | 3 +++
 arch/parisc/include/asm/sections.h  | 5 +++++
 arch/powerpc/include/asm/sections.h | 4 ++++
 arch/powerpc/kernel/module_64.c     | 8 --------
 include/asm-generic/sections.h      | 3 +++
 5 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
index 2460d365a057..3abe0562b01a 100644
--- a/arch/ia64/include/asm/sections.h
+++ b/arch/ia64/include/asm/sections.h
@@ -9,6 +9,9 @@
 
 #include <linux/elf.h>
 #include <linux/uaccess.h>
+
+typedef struct fdesc func_desc_t;
+
 #include <asm-generic/sections.h>
 
 extern char __phys_per_cpu_start[];
diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
index c8092e4d94de..ace1d4047a0b 100644
--- a/arch/parisc/include/asm/sections.h
+++ b/arch/parisc/include/asm/sections.h
@@ -2,6 +2,11 @@
 #ifndef _PARISC_SECTIONS_H
 #define _PARISC_SECTIONS_H
 
+#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
+#include <asm/elf.h>
+typedef Elf64_Fdesc func_desc_t;
+#endif
+
 /* nothing to see, move along */
 #include <asm-generic/sections.h>
 
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index fb11544d7e6a..1e6b6e732fb3 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -8,6 +8,10 @@
 
 #define arch_is_kernel_initmem_freed arch_is_kernel_initmem_freed
 
+#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
+typedef struct func_desc func_desc_t;
+#endif
+
 #include <asm-generic/sections.h>
 
 extern bool init_mem_is_free;
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index b687ef88c4c4..3d06b996d504 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -32,11 +32,6 @@
 
 #ifdef PPC64_ELF_ABI_v2
 
-/* An address is simply the address of the function. */
-typedef struct {
-	unsigned long addr;
-} func_desc_t;
-
 static func_desc_t func_desc(unsigned long addr)
 {
 	return (func_desc_t){addr};
@@ -57,9 +52,6 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 }
 #else
 
-/* An address is address of the OPD entry, which contains address of fn. */
-typedef struct func_desc func_desc_t;
-
 static func_desc_t func_desc(unsigned long addr)
 {
 	return *(struct func_desc *)addr;
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index a918388d9bf6..33b51efe3a24 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_end;
 #else
 #define dereference_function_descriptor(p) ((void *)(p))
 #define dereference_kernel_function_descriptor(p) ((void *)(p))
+typedef struct {
+	unsigned long addr;
+} func_desc_t;
 #endif
 
 static inline bool have_function_descriptors(void)
-- 
2.31.1

