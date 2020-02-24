Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB916AE4F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 19:04:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48R91F3TsQzDqWh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 05:04:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=VqRcwZtj; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R8zB6R56zDqT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 05:02:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48R8z16g7cz9v9kQ;
 Mon, 24 Feb 2020 19:02:05 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VqRcwZtj; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JrN8DRE25OKN; Mon, 24 Feb 2020 19:02:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48R8z15d9Zz9v9kP;
 Mon, 24 Feb 2020 19:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582567325; bh=CNFLih4PSoPyQOKHdwh0bZCil4LvN1c7uLrlcFFy9Dg=;
 h=From:Subject:To:Cc:Date:From;
 b=VqRcwZtjprMistze4TollXwv7njS+9K1lRrSm8r6JAlNw/EdWMvGMj/2pJsk70fec
 7GT6v67BhGwXY/wQqOLOhwYI37P9DNk2D7iURtYEgO9cokdU4gN9VUITGCjj34JDtS
 LQtEra6Bmk8g5g3ZiZOkZks+gG6KL8ZOAHMhP/A0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29D5F8B80C;
 Mon, 24 Feb 2020 19:02:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TsW2Zfb04y9p; Mon, 24 Feb 2020 19:02:11 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB8428B7FC;
 Mon, 24 Feb 2020 19:02:10 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B6840653B3; Mon, 24 Feb 2020 18:02:10 +0000 (UTC)
Message-Id: <7f24b5961a6839ff01df792816807f74ff236bf6.1582567319.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/kprobes: Use probe_address() to read instructions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Mon, 24 Feb 2020 18:02:10 +0000 (UTC)
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

In order to avoid Oopses, use probe_address() to read the
instruction at the address where the trap happened.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/kprobes.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 84567406b53d..a35320b79e16 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -276,14 +276,18 @@ int kprobe_handler(struct pt_regs *regs)
 
 	p = get_kprobe(addr);
 	if (!p) {
-		if (*addr != BREAKPOINT_INSTRUCTION) {
+		unsigned int instr;
+
+		if (probe_kernel_address(addr, instr))
+			goto no_kprobe;
+
+		if (instr != BREAKPOINT_INSTRUCTION) {
 			/*
 			 * PowerPC has multiple variants of the "trap"
 			 * instruction. If the current instruction is a
 			 * trap variant, it could belong to someone else
 			 */
-			kprobe_opcode_t cur_insn = *addr;
-			if (is_trap(cur_insn))
+			if (is_trap(instr))
 				goto no_kprobe;
 			/*
 			 * The breakpoint instruction was removed right
-- 
2.25.0

