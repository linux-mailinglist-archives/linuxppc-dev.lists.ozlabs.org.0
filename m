Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FA44BFA4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 15:06:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K31DL4nHxz3c9c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 01:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K31Cs6VTcz2yMx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:05:42 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4K31Cm50BMz9sSK;
 Tue, 22 Feb 2022 15:05:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pQe4Nwa6JW_l; Tue, 22 Feb 2022 15:05:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4K31Cm4HVCz9sSG;
 Tue, 22 Feb 2022 15:05:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 83C588B778;
 Tue, 22 Feb 2022 15:05:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dfKKNeyMRAAb; Tue, 22 Feb 2022 15:05:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.7.78])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56E648B764;
 Tue, 22 Feb 2022 15:05:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21ME5WUk1085144
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 15:05:32 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21ME5U491085143;
 Tue, 22 Feb 2022 15:05:30 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Remove remaining stab codes
Date: Tue, 22 Feb 2022 15:05:30 +0100
Message-Id: <d8b33342d7454f6ca4f368f5206896558dfa06f4.1645538722.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1645538729; l=790; s=20211009;
 h=from:subject:message-id; bh=FwvgNvm0imPRq6IfGzlyBogWeJqgKYW43VV3hftz2h0=;
 b=MRPARWAomFIMqE/iqctBUKRDVCsWcseycsKuW6EO+O4/tAS2wW2wJsa2kZzHS46FtCGxRqeFFMzT
 u56doPUeASmdcSdtbQ1rRF8XUbDpgfuvBrmNqRWlUHQdd772i353
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

Following commit 12318163737c ("powerpc/32: Remove remaining .stabs
annotations"), stabs code are not used anymore.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index d9c6f12e6d3e..ee52667d76e2 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -693,12 +693,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #define	evr30	30
 #define	evr31	31
 
-/* some stab codes */
-#define N_FUN	36
-#define N_RSYM	64
-#define N_SLINE	68
-#define N_SO	100
-
 #define RFSCV	.long 0x4c0000a4
 
 /*
-- 
2.34.1

