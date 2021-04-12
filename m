Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267C35C57D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 13:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJn1f0tY5z3c0S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 21:43:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJn0815R8z2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 21:42:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FJn004bC8z9tyR5;
 Mon, 12 Apr 2021 13:42:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OHhTilnkQS9z; Mon, 12 Apr 2021 13:42:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FJn002pHCz9tyQT;
 Mon, 12 Apr 2021 13:42:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5C74F8B78E;
 Mon, 12 Apr 2021 13:42:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LfESG8-dPI8R; Mon, 12 Apr 2021 13:42:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 155BA8B78D;
 Mon, 12 Apr 2021 13:42:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E8D4067A06; Mon, 12 Apr 2021 11:42:12 +0000 (UTC)
Message-Id: <a2e56b54bfe106ba21f5e9dec4140d9a107fb911.1618227677.git.christophe.leroy@csgroup.eu>
In-Reply-To: <857ceb23b6a614aea2522e770b067593d5f9e906.1618227677.git.christophe.leroy@csgroup.eu>
References: <857ceb23b6a614aea2522e770b067593d5f9e906.1618227677.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 4/4] powerpc: Move copy_from_kernel_nofault_inst()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 jniethe5@gmail.com
Date: Mon, 12 Apr 2021 11:42:12 +0000 (UTC)
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

When probe_kernel_read_inst() was created, there was no good place to
put it, so a file called lib/inst.c was dedicated for it.

Since then, probe_kernel_read_inst() has been renamed
copy_from_kernel_nofault_inst(). And mm/maccess.h didn't exist at that
time. Today, mm/maccess.h is related to copy_from_kernel_nofault().

Move copy_from_kernel_nofault_inst() into mm/maccess.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/inst.c   | 26 --------------------------
 arch/powerpc/mm/maccess.c | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 26 deletions(-)
 delete mode 100644 arch/powerpc/lib/inst.c

diff --git a/arch/powerpc/lib/inst.c b/arch/powerpc/lib/inst.c
deleted file mode 100644
index ec7f6bae8b3c..000000000000
--- a/arch/powerpc/lib/inst.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright 2020, IBM Corporation.
- */
-
-#include <linux/uaccess.h>
-#include <asm/disassemble.h>
-#include <asm/inst.h>
-#include <asm/ppc-opcode.h>
-
-int copy_from_kernel_nofault_inst(struct ppc_inst *inst, struct ppc_inst *src)
-{
-	unsigned int val, suffix;
-	int err;
-
-	err = copy_from_kernel_nofault(&val, src, sizeof(val));
-	if (err)
-		return err;
-	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
-		err = copy_from_kernel_nofault(&suffix, (void *)src + 4, 4);
-		*inst = ppc_inst_prefix(val, suffix);
-	} else {
-		*inst = ppc_inst(val);
-	}
-	return err;
-}
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index fa9a7a718fc6..e75e74c52a8a 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -3,7 +3,28 @@
 #include <linux/uaccess.h>
 #include <linux/kernel.h>
 
+#include <asm/disassemble.h>
+#include <asm/inst.h>
+#include <asm/ppc-opcode.h>
+
 bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
+
+int copy_from_kernel_nofault_inst(struct ppc_inst *inst, struct ppc_inst *src)
+{
+	unsigned int val, suffix;
+	int err;
+
+	err = copy_from_kernel_nofault(&val, src, sizeof(val));
+	if (err)
+		return err;
+	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
+		err = copy_from_kernel_nofault(&suffix, (void *)src + 4, 4);
+		*inst = ppc_inst_prefix(val, suffix);
+	} else {
+		*inst = ppc_inst(val);
+	}
+	return err;
+}
-- 
2.25.0

