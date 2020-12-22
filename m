Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBE72E0B64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:06:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dRr4C9qzDqL4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc81tBMzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cc217Wtz9v15d;
 Tue, 22 Dec 2020 14:28:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iixZzDL3wcdx; Tue, 22 Dec 2020 14:28:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cc202Gjz9v15c;
 Tue, 22 Dec 2020 14:28:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 562728B81B;
 Tue, 22 Dec 2020 14:28:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mAu6oID8eh2Q; Tue, 22 Dec 2020 14:28:35 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 094398B812;
 Tue, 22 Dec 2020 14:28:35 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DCCAF66969; Tue, 22 Dec 2020 13:28:34 +0000 (UTC)
Message-Id: <7d896a74e638f60dde8fd6d29ed928149b8c121f.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 12/15] powerpc/32: Remove msr argument in
 EXC_XFER_TEMPLATE() on 6xx/8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:34 +0000 (UTC)
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

Only MSR_KERNEL is used as msr in EXC_XFER_TEMPLATE(), no need
to make it an argument.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_6xx_8xx.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_6xx_8xx.h b/arch/powerpc/kernel/head_6xx_8xx.h
index 2536f0a660af..11b608b6f4b7 100644
--- a/arch/powerpc/kernel/head_6xx_8xx.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -194,21 +194,19 @@
 	addi	r3,r1,STACK_FRAME_OVERHEAD;	\
 	xfer(n, hdlr)
 
-#define EXC_XFER_TEMPLATE(hdlr, trap, msr, tfer, ret)		\
+#define EXC_XFER_TEMPLATE(hdlr, trap, tfer, ret)		\
 	li	r10,trap;					\
 	stw	r10,_TRAP(r11);					\
-	LOAD_REG_IMMEDIATE(r10, msr);				\
+	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL);			\
 	bl	tfer;						\
 	.long	hdlr;						\
 	.long	ret
 
 #define EXC_XFER_STD(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n, MSR_KERNEL, transfer_to_handler_full,	\
-			  ret_from_except_full)
+	EXC_XFER_TEMPLATE(hdlr, n, transfer_to_handler_full, ret_from_except_full)
 
 #define EXC_XFER_LITE(n, hdlr)		\
-	EXC_XFER_TEMPLATE(hdlr, n+1, MSR_KERNEL, transfer_to_handler, \
-			  ret_from_except)
+	EXC_XFER_TEMPLATE(hdlr, n + 1, transfer_to_handler, ret_from_except)
 
 .macro vmap_stack_overflow_exception
 #ifdef CONFIG_SMP
-- 
2.25.0

