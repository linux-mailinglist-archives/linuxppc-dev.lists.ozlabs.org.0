Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FD842936B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 17:30:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSjRl4qvGz3dhm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 02:30:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSjN01q6yz3c5p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 02:27:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HSjMC4kv3z9sV6;
 Mon, 11 Oct 2021 17:26:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69ySF6czzl1u; Mon, 11 Oct 2021 17:26:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HSjM314Xvz9sTq;
 Mon, 11 Oct 2021 17:26:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ECA8F8B778;
 Mon, 11 Oct 2021 17:26:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rVKjXVkBNBqi; Mon, 11 Oct 2021 17:26:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 309EC8B763;
 Mon, 11 Oct 2021 17:26:38 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19BFQV4Z1585023
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 17:26:31 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19BFQVSQ1585022;
 Mon, 11 Oct 2021 17:26:31 +0200
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
Subject: [PATCH v1 05/10] asm-generic: Define 'funct_descr_t' to commonly
 describe function descriptors
Date: Mon, 11 Oct 2021 17:25:32 +0200
Message-Id: <02224551451ab9c37055499fc621c41246c81125.1633964380.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633964380.git.christophe.leroy@csgroup.eu>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1633965928; l=2235; s=20211009;
 h=from:subject:message-id; bh=EBbDfN2Js8pQu1zMhsvpM5K62fnKFSITgBasmcu5as4=;
 b=JKx5mIowPw90iGVlBO2cLzOk7AJXLyrHko1ih+4Zfp7YiLHDC4neRwtP47l53x5+Cna9yu4BvxlT
 lEz9g+OzDrsifJiEfV5/MPXZeMXmrgFmMaLfA1AVFfDF/BdIYO8D
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
own name.

Add a common typedef that can be used in generic code.

Also add a stub typedef for architecture without function descriptors,
to avoid a forest of #ifdefs.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/ia64/include/asm/sections.h    | 1 +
 arch/parisc/include/asm/sections.h  | 1 +
 arch/powerpc/include/asm/sections.h | 1 +
 include/asm-generic/sections.h      | 3 +++
 4 files changed, 6 insertions(+)

diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
index 80f5868afb06..929b5c535620 100644
--- a/arch/ia64/include/asm/sections.h
+++ b/arch/ia64/include/asm/sections.h
@@ -8,6 +8,7 @@
  */
 
 #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
+typedef struct fdesc funct_descr_t;
 
 #include <linux/elf.h>
 #include <linux/uaccess.h>
diff --git a/arch/parisc/include/asm/sections.h b/arch/parisc/include/asm/sections.h
index 2e781ee19b66..329e80f7af0a 100644
--- a/arch/parisc/include/asm/sections.h
+++ b/arch/parisc/include/asm/sections.h
@@ -4,6 +4,7 @@
 
 #ifdef CONFIG_64BIT
 #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
+typedef Elf64_Fdesc funct_descr_t;
 #endif
 
 /* nothing to see, move along */
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index b7f1ba04e756..d0d5287fa568 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -10,6 +10,7 @@
 
 #ifdef PPC64_ELF_ABI_v1
 #define HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR 1
+typedef struct ppc64_opd_entry funct_descr_t;
 #endif
 
 #include <asm-generic/sections.h>
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 1db5cfd69817..436412d94054 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -63,6 +63,9 @@ extern __visible const void __nosave_begin, __nosave_end;
 #else
 #define dereference_function_descriptor(p) ((void *)(p))
 #define dereference_kernel_function_descriptor(p) ((void *)(p))
+typedef struct {
+	unsigned long addr;
+} funct_descr_t;
 #endif
 
 /* random extra sections (if any).  Override
-- 
2.31.1

