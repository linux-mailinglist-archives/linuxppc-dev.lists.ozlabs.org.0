Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D14C4E652B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSMw3QyQz30Dy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:31:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSM84dVTz30CP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:31:00 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSLz0wTJz9sV3;
 Thu, 24 Mar 2022 15:30:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xITyY5qnQeet; Thu, 24 Mar 2022 15:30:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLy2b5Kz9sTc;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DE9C8B7AA;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Wra1eX0Kb7pj; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 924DD8B781;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUiNo1811750
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUiL81811749;
 Thu, 24 Mar 2022 15:30:44 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 18/22] powerpc/ftrace: Don't use copy_from_kernel_nofault()
 in module_trampoline_target()
Date: Thu, 24 Mar 2022 15:30:08 +0100
Message-Id: <a69258e6e1f5d966b80e51c8ac9aec5696b4c344.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132152; l=1852; s=20211009;
 h=from:subject:message-id; bh=Dkafy5NvUjSHjq7KoYZeDuZLfb4PxqJ6RzfaxFY7ijA=;
 b=mGsxDCVO37ZGzOz43c9mDE1B71zJx+va/Y7Gu0M7jRs4SyLb2NS+dAgYbW+DyKNCOTHin7c/TzVt
 gNXsfn30CWIpdD7J0kmV67ozOTUV+acOkA7vA1S9fLtQb9UbtfMC
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
index 2aa368ce21c9..1282cfd672f2 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -289,13 +289,19 @@ int apply_relocate_add(Elf32_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_FUNCTION_TRACER
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

