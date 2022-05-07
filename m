Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E448C51E4FE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJCH5Vhcz3chJ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ1N2djGz3cPg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:48:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzl6J8lz9sWP;
 Sat,  7 May 2022 08:47:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S4w1VRN93DFg; Sat,  7 May 2022 08:47:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzF3pJPz9sWS;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 726418B792;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rAV0BwnurIxh; Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 236918B7A0;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476kfNe1320555
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476kfhJ1320554;
 Sat, 7 May 2022 08:46:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 21/25] powerpc/ftrace: Don't use copy_from_kernel_nofault()
 in module_trampoline_target()
Date: Sat,  7 May 2022 08:46:23 +0200
Message-Id: <921e8d60c847d42f7309feae1936fa0117b7f0d1.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=1851; s=20211009;
 h=from:subject:message-id; bh=uXcZ3GP6AL0nm6OE/PPychKM7tpuV066PB3o37u12jc=;
 b=35lMnYBVkNcTYC+s35MT+5tzvyCFefxWHnCM3ScwdEs3Zpk7QshfJfzUl4joS8eBKpEqFbAeg/GS
 QUYJIDfNDnsmJWFJe4t3qxQIGqDyYDMRgjkzvSbvt+ilpC7mAHfq
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

module_trampoline_target() is quite a hot path used when
activating/deactivating function tracer.

Avoid the heavy copy_from_kernel_nofault() by doing four calls
to copy_inst_from_kernel_nofault().

Use __copy_inst_from_kernel_nofault() for the 3 last calls. First call
is done to copy_from_kernel_nofault() to check address is within
kernel space. No risk to wrap out the top of kernel space because the
last page is never mapped so if address is in last page the first copy
will fails and the other ones will never be performed.

And also make it notrace just like all functions that call it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/module_32.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index a0432ef46967..1b129d728e83 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -289,13 +289,19 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-int module_trampoline_target(struct module *mod, unsigned long addr,
-			     unsigned long *target)
+notrace int module_trampoline_target(struct module *mod, unsigned long addr,
+				     unsigned long *target)
 {
 	unsigned int jmp[4];
 
 	/* Find where the trampoline jumps to */
-	if (copy_from_kernel_nofault(jmp, (void *)addr, sizeof(jmp)))
+	if (copy_inst_from_kernel_nofault(jmp, (void *)addr))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 1, (void *)addr + 4))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 2, (void *)addr + 8))
+		return -EFAULT;
+	if (__copy_inst_from_kernel_nofault(jmp + 3, (void *)addr + 12))
 		return -EFAULT;
 
 	/* verify that this is what we expect it to be */
-- 
2.35.1

