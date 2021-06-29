Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FDF3B7205
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 14:24:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDkFB0f1Fz3bWB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 22:24:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDkDs1tz6z2yMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 22:24:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GDkDk6Kq4zBB1J;
 Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-UIwH5HNrjf; Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GDkDk5SgMzB9kb;
 Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DB718B7C4;
 Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wUsJs3mO_VbF; Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 170B08B7BF;
 Tue, 29 Jun 2021 14:24:22 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BF36166386; Tue, 29 Jun 2021 12:24:21 +0000 (UTC)
Message-Id: <8ee05934288994a65743a987acb1558f12c0c8c1.1624969450.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/4xx: Fix setup_kuep() on SMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Jun 2021 12:24:21 +0000 (UTC)
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

On SMP, setup_kuep() is also called from start_secondary() since
commit 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").

start_secondary() is not an __init function.

Remove the __init marker from setup_kuep() and bail out when
not caller on the first CPU as the work is already done.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 10248dcba120 ("powerpc/44x: Implement Kernel Userspace Exec Protection (KUEP)")
Fixes: 86f46f343272 ("powerpc/32s: Initialise KUAP and KUEP in C").
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add missing asm/smp.h to avoid build failure without CONFIG_SMP
---
 arch/powerpc/mm/nohash/44x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
index 7da6d1e9fc9b..e079f26b267e 100644
--- a/arch/powerpc/mm/nohash/44x.c
+++ b/arch/powerpc/mm/nohash/44x.c
@@ -25,6 +25,7 @@
 #include <asm/page.h>
 #include <asm/cacheflush.h>
 #include <asm/code-patching.h>
+#include <asm/smp.h>
 
 #include <mm/mmu_decl.h>
 
@@ -241,8 +242,11 @@ void __init mmu_init_secondary(int cpu)
 #endif /* CONFIG_SMP */
 
 #ifdef CONFIG_PPC_KUEP
-void __init setup_kuep(bool disabled)
+void setup_kuep(bool disabled)
 {
+	if (smp_processor_id() != boot_cpuid)
+		return;
+
 	if (disabled)
 		patch_instruction_site(&patch__tlb_44x_kuep, ppc_inst(PPC_RAW_NOP()));
 	else
-- 
2.25.0

