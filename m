Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA123136921
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 09:47:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47vGnQ4NrlzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 19:47:06 +1100 (AEDT)
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
 header.s=mail header.b=ODEtV2P7; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47vGl44rDwzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 19:45:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47vGkv6r8mz9v3lj;
 Fri, 10 Jan 2020 09:44:55 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ODEtV2P7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PTbvLHgRYo7m; Fri, 10 Jan 2020 09:44:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47vGkv5VdMz9v3lg;
 Fri, 10 Jan 2020 09:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578645895; bh=X4bhvXuqtswvV10n057izmhqNVRm8lbtqjvUU8z28JI=;
 h=From:Subject:To:Cc:Date:From;
 b=ODEtV2P7aOXi6VbY2+nbMaTviixfpCJAbAkRSdMoBNFPzskw3hDJHUWmfIr/hnH0Q
 1pUnVcOYnvgG+AcZiV5ocD6nQ4poII4hUhkIvgTj7uufYnZaKkapVbfopwhqwTxthk
 HC3TQPmPyXieW2HjqnJ1vAKAXfleZLuFcCl6f50g=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C65B28B781;
 Fri, 10 Jan 2020 09:44:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6LX6hgl553vk; Fri, 10 Jan 2020 09:44:56 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D75C8B755;
 Fri, 10 Jan 2020 09:44:56 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6040563B90; Fri, 10 Jan 2020 08:44:56 +0000 (UTC)
Message-Id: <176774c19b0398634e004835b9515c93030d326f.1578645835.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/ptdump: don't entirely rebuild kernel when selecting
 CONFIG_PPC_DEBUG_WX
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 10 Jan 2020 08:44:56 +0000 (UTC)
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

Selecting CONFIG_PPC_DEBUG_WX only impacts ptdump and pgtable_32/64
init calls. Declaring related functions in asm/pgtable.h implies
rebuilding almost everything.

Move ptdump_check_wx() declaration in a new dedicated header file.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/pgtable.h |  6 ------
 arch/powerpc/include/asm/ptdump.h  | 15 +++++++++++++++
 arch/powerpc/mm/pgtable_32.c       |  1 +
 arch/powerpc/mm/pgtable_64.c       |  1 +
 arch/powerpc/mm/ptdump/ptdump.c    |  1 +
 5 files changed, 18 insertions(+), 6 deletions(-)
 create mode 100644 arch/powerpc/include/asm/ptdump.h

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 0e4ec8cc37b7..8cc543ed114c 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -94,12 +94,6 @@ void mark_initmem_nx(void);
 static inline void mark_initmem_nx(void) { }
 #endif
 
-#ifdef CONFIG_PPC_DEBUG_WX
-void ptdump_check_wx(void);
-#else
-static inline void ptdump_check_wx(void) { }
-#endif
-
 /*
  * When used, PTE_FRAG_NR is defined in subarch pgtable.h
  * so we are sure it is included when arriving here.
diff --git a/arch/powerpc/include/asm/ptdump.h b/arch/powerpc/include/asm/ptdump.h
new file mode 100644
index 000000000000..246b92c21729
--- /dev/null
+++ b/arch/powerpc/include/asm/ptdump.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_PTDUMP_H
+#define _ASM_POWERPC_PTDUMP_H
+
+#ifndef __ASSEMBLY__
+
+#ifdef CONFIG_PPC_DEBUG_WX
+void ptdump_check_wx(void);
+#else
+static inline void ptdump_check_wx(void) { }
+#endif
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* _ASM_POWERPC_PTDUMP_H */
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 73b84166d06a..6c866f1b1eeb 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -29,6 +29,7 @@
 #include <asm/fixmap.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
+#include <asm/ptdump.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index e78832dce7bb..3686cd887c2f 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -45,6 +45,7 @@
 #include <asm/sections.h>
 #include <asm/firmware.h>
 #include <asm/dma.h>
+#include <asm/ptdump.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 2f9ddc29c535..d7b02bcd0691 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -23,6 +23,7 @@
 #include <linux/const.h>
 #include <asm/page.h>
 #include <asm/pgalloc.h>
+#include <asm/ptdump.h>
 
 #include "ptdump.h"
 
-- 
2.13.3

