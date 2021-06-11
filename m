Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA2E3A494C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 21:09:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1r4P0tTgz3c5m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 05:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1r411JRPz2xfx
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jun 2021 05:09:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G1r3q3MQhzB9x0;
 Fri, 11 Jun 2021 21:08:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQCsyBMoYoC5; Fri, 11 Jun 2021 21:08:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G1r3q1FFwzB9ss;
 Fri, 11 Jun 2021 21:08:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B9058B850;
 Fri, 11 Jun 2021 21:08:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4JeMjUmysYVf; Fri, 11 Jun 2021 21:08:55 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF37F8B848;
 Fri, 11 Jun 2021 21:08:54 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 917FC66132; Fri, 11 Jun 2021 19:08:54 +0000 (UTC)
Message-Id: <98394503e92d6fd6d8f657e0b263b32f21cf2790.1623438478.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32: Display modules range in virtual memory layout
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 11 Jun 2021 19:08:54 +0000 (UTC)
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

book3s/32 and 8xx don't use vmalloc for modules.

Print the modules area at startup as part of the virtual memory layout:

[    0.000000] Kernel virtual memory layout:
[    0.000000]   * 0xffafc000..0xffffc000  : fixmap
[    0.000000]   * 0xc9000000..0xffafc000  : vmalloc & ioremap
[    0.000000]   * 0xb0000000..0xc0000000  : modules
[    0.000000] Memory: 118480K/131072K available (7152K kernel code, 2320K rwdata, 1328K rodata, 368K init, 854K bss, 12592K reserved, 0K cma-reserved)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 77fce7aa7dc5..c3b4fdda7069 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -302,6 +302,10 @@ void __init mem_init(void)
 			ioremap_bot, IOREMAP_TOP);
 	pr_info("  * 0x%08lx..0x%08lx  : vmalloc & ioremap\n",
 		VMALLOC_START, VMALLOC_END);
+#ifdef MODULES_VADDR
+	pr_info("  * 0x%08lx..0x%08lx  : modules\n",
+		MODULES_VADDR, MODULES_END);
+#endif
 #endif /* CONFIG_PPC32 */
 }
 
-- 
2.25.0

