Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA9D4B6C61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 13:43:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JygkG05nCz3dpr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 23:43:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyghH0ymWz3c9d
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 23:41:50 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jyggs1Hf4z9sSM;
 Tue, 15 Feb 2022 13:41:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k82_Xi-BHsDE; Tue, 15 Feb 2022 13:41:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jyggn2w58z9sRw;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 525278B763;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4q9AZT4zcRCb; Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C9AE8B77C;
 Tue, 15 Feb 2022 13:41:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FCfHYB080637
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:41:17 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FCfHdL080636;
 Tue, 15 Feb 2022 13:41:17 +0100
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
Subject: [PATCH v4 08/13] asm-generic: Define 'func_desc_t' to commonly
 describe function descriptors
Date: Tue, 15 Feb 2022 13:41:03 +0100
Message-Id: <f1f91b142b3c1082bdc1586ce71c9bac1e75213c.1644928018.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644928860; l=3528; s=20211009;
 h=from:subject:message-id; bh=f/Kz0vs7DzOIFvt0GMalWSxwhMlMtC2TwHZGNFAW5xk=;
 b=pjXGNgU4tJTpHtaKVo8K7qLnoS/WBn+e6Gl++nh7f3v0UMDFbRud25AzSQcY/w+ChnJQMG5svT/C
 IDhKL0suBodK3xIXENbiPQzeZ/hrkMGbkXNHt+ZhHeD6a9PcAk9l
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
Acked-by: Helge Deller <deller@gmx.de>
---
 arch/ia64/include/asm/sections.h    | 3 +++
 arch/parisc/include/asm/sections.h  | 5 +++++
 arch/powerpc/include/asm/sections.h | 4 ++++
 arch/powerpc/kernel/module_64.c     | 8 --------
 include/asm-generic/sections.h      | 5 +++++
 5 files changed, 17 insertions(+), 8 deletions(-)

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
index 7728a7a146c3..fddfb3937868 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -6,6 +6,10 @@
 #include <linux/elf.h>
 #include <linux/uaccess.h>
 
+#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
+typedef struct func_desc func_desc_t;
+#endif
+
 #include <asm-generic/sections.h>
 
 extern char __head_end[];
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index ff93ef4cb5a2..9abc0e783e36 100644
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
 	func_desc_t desc = {
@@ -61,9 +56,6 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 }
 #else
 
-/* An address is address of the OPD entry, which contains address of fn. */
-typedef struct func_desc func_desc_t;
-
 static func_desc_t func_desc(unsigned long addr)
 {
 	return *(struct func_desc *)addr;
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 3ef83e1aebee..bbf97502470c 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -63,6 +63,11 @@ extern __visible const void __nosave_begin, __nosave_end;
 #else
 #define dereference_function_descriptor(p) ((void *)(p))
 #define dereference_kernel_function_descriptor(p) ((void *)(p))
+
+/* An address is simply the address of the function. */
+typedef struct {
+	unsigned long addr;
+} func_desc_t;
 #endif
 
 static inline bool have_function_descriptors(void)
-- 
2.34.1

