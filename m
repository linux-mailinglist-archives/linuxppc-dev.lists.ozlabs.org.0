Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 424CE46144D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:53:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2kJj18QKz3cNk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:53:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kJJ49Qkz2xF1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:53:18 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2kJC4jgQz9sSr;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djs3iYgPjbQ7; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2kJC3pfMz9sSP;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AF578B775;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N2AI2FPaDhJX; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4025E8B76E;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATBr6DJ895113
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 12:53:06 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATBr6XR895112;
 Mon, 29 Nov 2021 12:53:06 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 1/5] powerpc/inst: Refactor ___get_user_instr()
Date: Mon, 29 Nov 2021 12:53:01 +0100
Message-Id: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638186784; l=1409; s=20211009;
 h=from:subject:message-id; bh=zIo/9aHkNL26PXcoL1CcR42y7+ImikzNzgYR0PCbPKI=;
 b=X8WaJenduw62ESQHEadrOxaqk399Qj2JBj2a/ebVNFYFbkjALuT64oWK8TcZucbHZg8+fipI9Fij
 lt5JQqboCVp/cWMjSQzMXUDXOuQKzWCgJrdL87fX+EjrZs0Z9JfF
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC64 version of ___get_user_instr() can be used for PPC32 as well,
by simply disabling the suffix part with IS_ENABLED(CONFIG_PPC64).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index b11c0e2f9639..fea4d46155a9 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -4,8 +4,6 @@
 
 #include <asm/ppc-opcode.h>
 
-#ifdef CONFIG_PPC64
-
 #define ___get_user_instr(gu_op, dest, ptr)				\
 ({									\
 	long __gui_ret;							\
@@ -16,7 +14,7 @@
 	__chk_user_ptr(ptr);						\
 	__gui_ret = gu_op(__prefix, __gui_ptr);				\
 	if (__gui_ret == 0) {						\
-		if ((__prefix >> 26) == OP_PREFIX) {			\
+		if (IS_ENABLED(CONFIG_PPC64) && (__prefix >> 26) == OP_PREFIX) { \
 			__gui_ret = gu_op(__suffix, __gui_ptr + 1);	\
 			__gui_inst = ppc_inst_prefix(__prefix, __suffix); \
 		} else {						\
@@ -27,13 +25,6 @@
 	}								\
 	__gui_ret;							\
 })
-#else /* !CONFIG_PPC64 */
-#define ___get_user_instr(gu_op, dest, ptr)				\
-({									\
-	__chk_user_ptr(ptr);						\
-	gu_op((dest).val, (u32 __user *)(ptr));				\
-})
-#endif /* CONFIG_PPC64 */
 
 #define get_user_instr(x, ptr) ___get_user_instr(get_user, x, ptr)
 
-- 
2.33.1

