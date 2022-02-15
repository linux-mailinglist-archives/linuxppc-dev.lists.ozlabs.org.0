Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 915C64B6C8B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 13:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyglK1DQhz3cnx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 23:44:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyghR2lrJz3cHS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 23:41:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jyggv1C10z9sST;
 Tue, 15 Feb 2022 13:41:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IdKtj2QNUyCc; Tue, 15 Feb 2022 13:41:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jyggn4p5kz9sSh;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D2108B776;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Rp4IPH4rC6t9; Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 81C388B77D;
 Tue, 15 Feb 2022 13:41:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FCfG60080629
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:41:16 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FCfGfh080628;
 Tue, 15 Feb 2022 13:41:16 +0100
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
Subject: [PATCH v4 06/13] ia64: Rename 'ip' to 'addr' in 'struct fdesc'
Date: Tue, 15 Feb 2022 13:41:01 +0100
Message-Id: <65b73ac614e4c002c5819d40b42f6f426d2ee52b.1644928018.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644928018.git.christophe.leroy@csgroup.eu>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644928860; l=2104; s=20211009;
 h=from:subject:message-id; bh=4mv1SiBbp7pTTqFBCvFgWxXkLKYIOhDRwyfgv8fTdHE=;
 b=rqmpUmT0MgrcuSuGQdvFvaQMGAC23n6tWxLMK4K8qIoig0QzZ2OFo/9wKPcNEhN7MC+goHcNFVNs
 3Z9uhiedB8tTGfOd1+xZn9/XwLv9q5AEW1/9kfJtKEiqwcT707Ox
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

There are three architectures with function descriptors, try to
have common names for the address they contain in order to
refactor some functions into generic functions later.

powerpc has 'entry'
ia64 has 'ip'
parisc has 'addr'

Vote for 'addr' and update 'struct fdesc' accordingly.

Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/ia64/include/asm/elf.h      | 2 +-
 arch/ia64/include/asm/sections.h | 2 +-
 arch/ia64/kernel/module.c        | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/ia64/include/asm/elf.h b/arch/ia64/include/asm/elf.h
index 6629301a2620..2ef5f9966ad1 100644
--- a/arch/ia64/include/asm/elf.h
+++ b/arch/ia64/include/asm/elf.h
@@ -226,7 +226,7 @@ struct got_entry {
  * Layout of the Function Descriptor
  */
 struct fdesc {
-	uint64_t ip;
+	uint64_t addr;
 	uint64_t gp;
 };
 
diff --git a/arch/ia64/include/asm/sections.h b/arch/ia64/include/asm/sections.h
index 3a033d2008b3..35f24e52149a 100644
--- a/arch/ia64/include/asm/sections.h
+++ b/arch/ia64/include/asm/sections.h
@@ -35,7 +35,7 @@ static inline void *dereference_function_descriptor(void *ptr)
 	struct fdesc *desc = ptr;
 	void *p;
 
-	if (!get_kernel_nofault(p, (void *)&desc->ip))
+	if (!get_kernel_nofault(p, (void *)&desc->addr))
 		ptr = p;
 	return ptr;
 }
diff --git a/arch/ia64/kernel/module.c b/arch/ia64/kernel/module.c
index 360f36b0eb3f..8f62cf97f691 100644
--- a/arch/ia64/kernel/module.c
+++ b/arch/ia64/kernel/module.c
@@ -602,15 +602,15 @@ get_fdesc (struct module *mod, uint64_t value, int *okp)
 		return value;
 
 	/* Look for existing function descriptor. */
-	while (fdesc->ip) {
-		if (fdesc->ip == value)
+	while (fdesc->addr) {
+		if (fdesc->addr == value)
 			return (uint64_t)fdesc;
 		if ((uint64_t) ++fdesc >= mod->arch.opd->sh_addr + mod->arch.opd->sh_size)
 			BUG();
 	}
 
 	/* Create new one */
-	fdesc->ip = value;
+	fdesc->addr = value;
 	fdesc->gp = mod->arch.gp;
 	return (uint64_t) fdesc;
 }
-- 
2.34.1

