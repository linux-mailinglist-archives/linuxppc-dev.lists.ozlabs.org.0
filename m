Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 299F546630E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 13:04:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4ZPQ04XFz3f1d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 23:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4ZL25Lv2z3c9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 23:01:14 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J4ZKT1WDCz9sSs;
 Thu,  2 Dec 2021 13:00:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTfZHapRIyB5; Thu,  2 Dec 2021 13:00:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J4ZKM1H09z9sT3;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 131E58B7C8;
 Thu,  2 Dec 2021 13:00:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rqQ-ej2kdoAP; Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.163])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 57CD18B7CC;
 Thu,  2 Dec 2021 13:00:38 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1B2C0V7I177257
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 2 Dec 2021 13:00:31 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1B2C0Vti177256;
 Thu, 2 Dec 2021 13:00:31 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 05/11] powerpc/code-patching: Reorganise
 do_patch_instruction() to ease error handling
Date: Thu,  2 Dec 2021 13:00:21 +0100
Message-Id: <dbc85980a0d2a935731b272e8907e8bb1d8fc8c5.1638446239.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
References: <3ff9823c0a812a8a145d979a9600a6d4591b80ee.1638446239.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638446425; l=2137; s=20211009;
 h=from:subject:message-id; bh=wwZgBZ4TyaaRC4WE1uUClwsvYY/KCs2dRTHFQ4EYX00=;
 b=9IIAm4Ce+/f05uvxzfBsrCseiULZgMDWC+9As5Lm9o69ZRJJYuP/KqP5p9rWwfTTtAGF/jl+A6QW
 eNBVqZP7AssQFhTXPhWPIdcuScbiXabRCl1filVCMXVMGFXwpuTP
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

Split do_patch_instruction() in two functions, the caller doing the
spin locking and the callee doing everything else.

And remove a few unnecessary initialisations and intermediate
variables.

This allows the callee to return from anywhere in the function.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 5fa719a4ee69..a43ca22313ee 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -129,13 +129,30 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }
 
+static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	int err;
+	u32 *patch_addr;
+	unsigned long text_poke_addr;
+
+	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
+	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+
+	err = map_patch_area(addr, text_poke_addr);
+	if (err)
+		return err;
+
+	err = __patch_instruction(addr, instr, patch_addr);
+
+	unmap_patch_area(text_poke_addr);
+
+	return err;
+}
+
 static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
 	int err;
-	u32 *patch_addr = NULL;
 	unsigned long flags;
-	unsigned long text_poke_addr;
-	unsigned long kaddr = (unsigned long)addr;
 
 	/*
 	 * During early early boot patch_instruction is called
@@ -146,19 +163,7 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 		return raw_patch_instruction(addr, instr);
 
 	local_irq_save(flags);
-
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
-	err = map_patch_area(addr, text_poke_addr);
-	if (err)
-		goto out;
-
-	patch_addr = (u32 *)(text_poke_addr + (kaddr & ~PAGE_MASK));
-
-	err = __patch_instruction(addr, instr, patch_addr);
-
-	unmap_patch_area(text_poke_addr);
-
-out:
+	err = __do_patch_instruction(addr, instr);
 	local_irq_restore(flags);
 
 	return err;
-- 
2.33.1

