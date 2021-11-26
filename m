Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0545E891
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 08:40:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0mqd5vkdz3bbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 18:40:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0mqC6hNtz2yZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 18:39:49 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0mq711b1z9sSM;
 Fri, 26 Nov 2021 08:39:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PwVp3kA8u1IL; Fri, 26 Nov 2021 08:39:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0mq70CFlz9sS3;
 Fri, 26 Nov 2021 08:39:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA8DB8B77D;
 Fri, 26 Nov 2021 08:39:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qMo3RkB0FNgG; Fri, 26 Nov 2021 08:39:46 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A110D8B763;
 Fri, 26 Nov 2021 08:39:46 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AQ7ddvm428780
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 08:39:39 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AQ7daHR428778;
 Fri, 26 Nov 2021 08:39:36 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/code-patching: Relax verification of patchability
Date: Fri, 26 Nov 2021 08:39:23 +0100
Message-Id: <68d7d57675e0963fe5e2c4b84b0cb2390c78638c.1637912333.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637912362; l=1793; s=20211009;
 h=from:subject:message-id; bh=uH60GDNc5x57OmrWqmFlrPAq1iGxm4Gf783DcGypKvc=;
 b=GmcP09nvIVJNypv1zTf7MfA8mUoT2I0qz8rQ5QQuaVgZKz0tlf8kN7ew318Jw5FIiuar3phHZAcq
 /XuW2ppeCKeEjHUFSWwiAsbMvULWlYFKbi9tDheojeOGiGdndDqN
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of
patchability") introduced a stricter verification of the patched
area by checking it is proper kernel text.

But as least two usages of patch_instruction() fall outside:
- Code patching selftests, which use stack and vmalloc space.
- Ftrace

So for the time being, partially revert commit 8b8a8f0ab3f5 and add
a onetime warning:

  Running code patching self-tests ...
  patch_instruction() called on invalid text address 0xe1011e58 from test_code_patching+0x34/0xd6c

Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Fixes: 8b8a8f0ab3f5 ("powerpc/code-patching: Improve verification of patchability")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 1dd636a85cc1..c87eea773930 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -190,9 +190,13 @@ static int do_patch_instruction(u32 *addr, struct ppc_inst instr)
 int patch_instruction(u32 *addr, struct ppc_inst instr)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (!kernel_text_address((unsigned long)addr))
+	if (system_state >= SYSTEM_FREEING_INITMEM && init_section_contains(addr, 4))
 		return 0;
 
+	if (!kernel_text_address((unsigned long)addr))
+		pr_warn_once("%s() called on invalid text address 0x%p from %pS\n",
+			     __func__, addr, __builtin_return_address(0));
+
 	return do_patch_instruction(addr, instr);
 }
 NOKPROBE_SYMBOL(patch_instruction);
-- 
2.33.1

