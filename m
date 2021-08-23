Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A75A43F4D7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:29:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtbl54Zs4z2xsr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:29:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtbkh1dPGz2xYV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:29:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gtbkd3YCSz9sWm;
 Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qx5fZBqh7l38; Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gtbkd2fm1z9sT5;
 Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2D4138B7B3;
 Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DyLsmin7G7es; Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 120E98B7AF;
 Mon, 23 Aug 2021 17:29:13 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id ACAC86BC79; Mon, 23 Aug 2021 15:29:12 +0000 (UTC)
Message-Id: <316c543b8906712c108985c8463eec09c8db577b.1629732542.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Don't use lmw/stmw for saving/restoring non
 volatile regs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Aug 2021 15:29:12 +0000 (UTC)
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

Instructions lmw/stmw are interesting for functions that are rarely
used and not in the cache, because only one instruction is to be
copied into the instruction cache instead of 19. However those
instruction are less performant than 19x raw lwz/stw as they require
synchronisation plus one additional cycle.

SAVE_NVGPRS / REST_NVGPRS are used in only a few places which are
mostly in interrupts entries/exits and in task switch so they are
likely already in the cache.

Using standard lwz improves null_syscall selftest by:
- 10 cycles on mpc832x.
- 2 cycles on mpc8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index ffe712307e11..349fc0ec0dbb 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -28,8 +28,8 @@
 #else
 #define SAVE_GPR(n, base)	stw	n,GPR0+4*(n)(base)
 #define REST_GPR(n, base)	lwz	n,GPR0+4*(n)(base)
-#define SAVE_NVGPRS(base)	stmw	13, GPR0+4*13(base)
-#define REST_NVGPRS(base)	lmw	13, GPR0+4*13(base)
+#define SAVE_NVGPRS(base)	SAVE_GPR(13, base); SAVE_8GPRS(14, base); SAVE_10GPRS(22, base)
+#define REST_NVGPRS(base)	REST_GPR(13, base); REST_8GPRS(14, base); REST_10GPRS(22, base)
 #endif
 
 #define SAVE_2GPRS(n, base)	SAVE_GPR(n, base); SAVE_GPR(n+1, base)
-- 
2.25.0

