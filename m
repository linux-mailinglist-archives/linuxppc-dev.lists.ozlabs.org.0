Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C4A4B6C53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 13:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyght15pCz3cm0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 23:42:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jygh23K52z3bZY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 23:41:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jyggp13FYz9sT0;
 Tue, 15 Feb 2022 13:41:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0f10AOUrKn0; Tue, 15 Feb 2022 13:41:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jyggn1NYjz9sSH;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1DA0E8B78B;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dqfLvVJOOgX9; Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 66C808B776;
 Tue, 15 Feb 2022 13:41:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FCfGnW080617
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:41:16 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FCfFva080616;
 Tue, 15 Feb 2022 13:41:15 +0100
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
Subject: [PATCH v4 03/13] powerpc: Use 'struct func_desc' instead of 'struct
 ppc64_opd_entry'
Date: Tue, 15 Feb 2022 13:40:58 +0100
Message-Id: <34e76bac6cbe95a63ecd37df69fb7feb93b0ea7c.1644928018.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644928860; l=2500; s=20211009;
 h=from:subject:message-id; bh=lF3vrnWaSCZb9OJrJGlARG72CsPx1sV+HmC9+sMkkEg=;
 b=/tPj+khmgESFC6ef3SwpSsEOUxKp2XbhHIzYXcnlariWadT07u6qaQyMZmQ7AKx3IigP1ZJHi6PM
 HHu6BFZgBnXGYTvNULUqFxtoa+eQAMvQ5CI5TbsSn7gjRDe6KpK8
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
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'struct ppc64_opd_entry' is somehow redundant with 'struct func_desc',
the later is more correct/complete as it includes the third
field which is unused.

So use 'struct func_desc' instead of 'struct ppc64_opd_entry'

Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/sections.h |  4 ++--
 arch/powerpc/kernel/module_64.c     | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 38f79e42bf3c..baca39f4c6d3 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -61,10 +61,10 @@ static inline int overlaps_kernel_text(unsigned long start, unsigned long end)
 #undef dereference_function_descriptor
 static inline void *dereference_function_descriptor(void *ptr)
 {
-	struct ppc64_opd_entry *desc = ptr;
+	struct func_desc *desc = ptr;
 	void *p;
 
-	if (!get_kernel_nofault(p, (void *)&desc->funcaddr))
+	if (!get_kernel_nofault(p, (void *)&desc->addr))
 		ptr = p;
 	return ptr;
 }
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 6a45e6ddbe58..46e8eeb7c432 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -64,19 +64,19 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 #else
 
 /* An address is address of the OPD entry, which contains address of fn. */
-typedef struct ppc64_opd_entry func_desc_t;
+typedef struct func_desc func_desc_t;
 
 static func_desc_t func_desc(unsigned long addr)
 {
-	return *(struct ppc64_opd_entry *)addr;
+	return *(struct func_desc *)addr;
 }
 static unsigned long func_addr(unsigned long addr)
 {
-	return func_desc(addr).funcaddr;
+	return func_desc(addr).addr;
 }
 static unsigned long stub_func_addr(func_desc_t func)
 {
-	return func.funcaddr;
+	return func.addr;
 }
 static unsigned int local_entry_offset(const Elf64_Sym *sym)
 {
@@ -187,7 +187,7 @@ static int relacmp(const void *_x, const void *_y)
 static unsigned long get_stubs_size(const Elf64_Ehdr *hdr,
 				    const Elf64_Shdr *sechdrs)
 {
-	/* One extra reloc so it's always 0-funcaddr terminated */
+	/* One extra reloc so it's always 0-addr terminated */
 	unsigned long relocs = 1;
 	unsigned i;
 
-- 
2.34.1

