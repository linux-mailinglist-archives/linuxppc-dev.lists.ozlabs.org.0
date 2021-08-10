Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0976E3E7D3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Aug 2021 18:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkdLX65CLz3cY0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 02:14:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkdKh2fDxz308Q
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 02:13:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GkdKW2dxqz9sVq;
 Tue, 10 Aug 2021 18:13:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKKJIg0SqOqw; Tue, 10 Aug 2021 18:13:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GkdKV56VZz9sVm;
 Tue, 10 Aug 2021 18:13:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5026D8B7C0;
 Tue, 10 Aug 2021 18:13:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Myg4jxzq8Hfv; Tue, 10 Aug 2021 18:13:18 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 179758B7B9;
 Tue, 10 Aug 2021 18:13:18 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DA93466271; Tue, 10 Aug 2021 16:13:17 +0000 (UTC)
Message-Id: <aed174f5cbc06f2cf95233c071d8aac948e46043.1628611921.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/interrupt: Do not call single_step_exception() from
 other exceptions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, userm57@yahoo.com, fthain@linux-m68k.org
Date: Tue, 10 Aug 2021 16:13:17 +0000 (UTC)
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

single_step_exception() is called by emulate_single_step() which
is called from (at least) alignment exception() handler and
program_check_exception() handler.

Redefine it as a regular __single_step_exception() which is called
by both single_step_exception() handler and emulate_single_step()
function.

Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers")
Cc: stable@vger.kernel.org
Cc: Stan Johnson <userm57@yahoo.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/traps.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index dfbce527c98e..d56254f05e17 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1104,7 +1104,7 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
 	_exception(SIGTRAP, regs, TRAP_UNK, 0);
 }
 
-DEFINE_INTERRUPT_HANDLER(single_step_exception)
+static void __single_step_exception(struct pt_regs *regs)
 {
 	clear_single_step(regs);
 	clear_br_trace(regs);
@@ -1121,6 +1121,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
 }
 
+DEFINE_INTERRUPT_HANDLER(single_step_exception)
+{
+	__single_step_exception(regs);
+}
+
 /*
  * After we have successfully emulated an instruction, we have to
  * check if the instruction was being single-stepped, and if so,
@@ -1130,7 +1135,7 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
 static void emulate_single_step(struct pt_regs *regs)
 {
 	if (single_stepping(regs))
-		single_step_exception(regs);
+		__single_step_exception(regs);
 }
 
 static inline int __parse_fpscr(unsigned long fpscr)
-- 
2.25.0

