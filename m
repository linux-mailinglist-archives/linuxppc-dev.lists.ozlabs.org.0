Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA4C3B5952
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 08:57:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GCz1V537tz3bTN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 16:57:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GCz0q1ZQRz30JZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 16:56:26 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GCz0c3JJxzBD3H;
 Mon, 28 Jun 2021 08:56:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGG8CusSe2ok; Mon, 28 Jun 2021 08:56:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GCz0Y0YjCzBD2H;
 Mon, 28 Jun 2021 08:56:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BDE798B781;
 Mon, 28 Jun 2021 08:56:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PK5cYC-pTAkN; Mon, 28 Jun 2021 08:56:12 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F0E78B77F;
 Mon, 28 Jun 2021 08:56:12 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8A36E64BE3; Mon, 28 Jun 2021 06:56:12 +0000 (UTC)
Message-Id: <b9c2a9add0f11754539e24c6f421bd2009327c36.1624863323.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/4xx: Fix setup_kuep() on SMP
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 28 Jun 2021 06:56:12 +0000 (UTC)
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
 arch/powerpc/mm/nohash/44x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
index 7da6d1e9fc9b..20c18bd5b9a0 100644
--- a/arch/powerpc/mm/nohash/44x.c
+++ b/arch/powerpc/mm/nohash/44x.c
@@ -241,8 +241,11 @@ void __init mmu_init_secondary(int cpu)
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

