Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA67BDF1D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S40DP4mYxz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:26:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S40Cs5bq4z3c13
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:25:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4S40Cj14mDz9vBy;
	Mon,  9 Oct 2023 15:25:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gphn4PpLowuC; Mon,  9 Oct 2023 15:25:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4S40Ch6Kpkz9vBQ;
	Mon,  9 Oct 2023 15:25:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D33CB8B794;
	Mon,  9 Oct 2023 15:25:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id O5Nkp0HQcBAB; Mon,  9 Oct 2023 15:25:52 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AE9738B780;
	Mon,  9 Oct 2023 15:25:52 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 397AkNme258256
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 7 Oct 2023 12:46:23 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 397AkMZ8258254;
	Sat, 7 Oct 2023 12:46:22 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/code-patching: Perform hwsync in __patch_instruction() in case of failure
Date: Sat,  7 Oct 2023 12:46:19 +0200
Message-ID: <e88b154eaf2efd9ff177d472d3411dcdec8ff4f5.1696675567.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696675578; l=1348; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=k9MOIxjlEEg3xQ6FC272ePXV8stsS7VaLfDlN1rnk+A=; b=hLdvCOgOVWYoBIXrpWrB0Ja6rVFEwwkXVLbkWv8R+Sz1AlP6QTmKgTloUS9aOavXUbUvoscOM awoz7adu5idDnnHdGzUiebX+TlKUSisFGdmc+HkXO+O3QDnoXQ2ltYO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Christopher M . Riedl" <cmr@bluescreens.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c28c15b6d28a ("powerpc/code-patching: Use temporary mm for
Radix MMU") added a hwsync for when __patch_instruction() fails,
we results in a quite odd unbalanced logic.

Instead of calling mb() when __patch_instruction() returns an error,
call mb() in the __patch_instruction()'s error path directly.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Christopher M. Riedl <cmr@bluescreens.de>
---
 arch/powerpc/lib/code-patching.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index b00112d7ad46..7a47a871e6b8 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -38,6 +38,7 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 	return 0;
 
 failed:
+	mb();  /* sync */
 	return -EPERM;
 }
 
@@ -309,10 +310,6 @@ static int __do_patch_instruction_mm(u32 *addr, ppc_inst_t instr)
 
 	err = __patch_instruction(addr, instr, patch_addr);
 
-	/* hwsync performed by __patch_instruction (sync) if successful */
-	if (err)
-		mb();  /* sync */
-
 	/* context synchronisation performed by __patch_instruction (isync or exception) */
 	stop_using_temp_mm(patching_mm, orig_mm);
 
-- 
2.41.0

