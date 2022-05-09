Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F651F40A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:47:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVYX1wSRz3gQm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVMN2xgjz3dtb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:38:24 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKn0kMLz9sWH;
 Mon,  9 May 2022 07:37:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2G3Rqetc9sH; Mon,  9 May 2022 07:37:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKH4kVxz9sWK;
 Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E1418B763;
 Mon,  9 May 2022 07:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id DRe330hselgB; Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BE688B76E;
 Mon,  9 May 2022 07:36:35 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aV6N1591291
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:31 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aVO01591290;
 Mon, 9 May 2022 07:36:31 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 21/25] powerpc/ftrace: Don't use copy_from_kernel_nofault()
 in module_trampoline_target()
Date: Mon,  9 May 2022 07:36:19 +0200
Message-Id: <c55559103e014b7863161559d340e8e9484eaaa6.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074582; l=2705; s=20211009;
 h=from:subject:message-id; bh=CfrUCzqErjkJ1BZ8LHw9+4wpcEnd2IhUoh9LhAGXY+w=;
 b=YOzklA9WshRXJoWz/vL2ydfXuPpqPlkb1zNRY5YKGdK2hfy+hK1QunRD+f/fAduTLVNB0cMdrOMz
 q7Ayb0u+CU3mt9WoSRNIqPyy501HRL4jnIi1SU5DDCNOvoRDIVoV
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
v3: Use ppc_inst_t to fix sparse warnings and split trampoline verification in one line per instruction.
---
 arch/powerpc/kernel/module_32.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index a0432ef46967..715a42f383d0 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -289,23 +289,32 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
-int module_trampoline_target(struct module *mod, unsigned long addr,
-			     unsigned long *target)
+notrace int module_trampoline_target(struct module *mod, unsigned long addr,
+				     unsigned long *target)
 {
-	unsigned int jmp[4];
+	ppc_inst_t jmp[4];
 
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
-	if ((jmp[0] & 0xffff0000) != PPC_RAW_LIS(_R12, 0) ||
-	    (jmp[1] & 0xffff0000) != PPC_RAW_ADDI(_R12, _R12, 0) ||
-	    jmp[2] != PPC_RAW_MTCTR(_R12) ||
-	    jmp[3] != PPC_RAW_BCTR())
+	if ((ppc_inst_val(jmp[0]) & 0xffff0000) != PPC_RAW_LIS(_R12, 0))
+		return -EINVAL;
+	if ((ppc_inst_val(jmp[1]) & 0xffff0000) != PPC_RAW_ADDI(_R12, _R12, 0))
+		return -EINVAL;
+	if (ppc_inst_val(jmp[2]) != PPC_RAW_MTCTR(_R12))
+		return -EINVAL;
+	if (ppc_inst_val(jmp[3]) != PPC_RAW_BCTR())
 		return -EINVAL;
 
-	addr = (jmp[1] & 0xffff) | ((jmp[0] & 0xffff) << 16);
+	addr = (ppc_inst_val(jmp[1]) & 0xffff) | ((ppc_inst_val(jmp[0]) & 0xffff) << 16);
 	if (addr & 0x8000)
 		addr -= 0x10000;
 
-- 
2.35.1

