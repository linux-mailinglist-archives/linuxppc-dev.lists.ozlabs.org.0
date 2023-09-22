Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602DA7AB235
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 14:34:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsWsn1c1Gz3dh6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 22:34:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsWsD74qfz3cl4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 22:33:33 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RsWs46G01z9vCF;
	Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TROVTetYC20s; Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RsWs45cz7z9vCC;
	Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BD4798B787;
	Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jYfSB0-1QeqY; Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.41])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 898558B763;
	Fri, 22 Sep 2023 14:33:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 38MCXKcQ639082
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 22 Sep 2023 14:33:21 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 38MCXJhD639073;
	Fri, 22 Sep 2023 14:33:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc: Only define __parse_fpscr() when required
Date: Fri, 22 Sep 2023 14:33:13 +0200
Message-ID: <5de2998c57f3983563b27b39228ea9a7229d4110.1695385984.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695385992; l=1324; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=kqkFpcU5+/aIs05XRui9EgavgKRFVnBzzl5hzd+0zQM=; b=AMfPBLW5FkhYq/RQTxJ+uvLiQNcmDeRTJ5CCQtyGrx953lAKR9+ttHHWR7VNCqPhEPuHg2NY2 I1D641rG18YDZ9b3fXvP7R/9CS0k8/czenjlM8TccwKdyCYWOpui/Cz
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clang 17 reports:

arch/powerpc/kernel/traps.c:1167:19: error: unused function '__parse_fpscr' [-Werror,-Wunused-function]

__parse_fpscr() is called from two sites. First call is guarded
by #ifdef CONFIG_PPC_FPU_REGS

Second call is guarded by CONFIG_MATH_EMULATION which selects
CONFIG_PPC_FPU_REGS.

So only define __parse_fpscr() when CONFIG_PPC_FPU_REGS is defined.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309210327.WkqSd5Bq-lkp@intel.com/
Fixes: b6254ced4da6 ("powerpc/signal: Don't manage floating point regs when no FPU")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index eeff136b83d9..a52c786c2aec 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1164,6 +1164,7 @@ void emulate_single_step(struct pt_regs *regs)
 		__single_step_exception(regs);
 }
 
+#ifdef CONFIG_PPC_FPU_REGS
 static inline int __parse_fpscr(unsigned long fpscr)
 {
 	int ret = FPE_FLTUNK;
@@ -1190,6 +1191,7 @@ static inline int __parse_fpscr(unsigned long fpscr)
 
 	return ret;
 }
+#endif
 
 static void parse_fpe(struct pt_regs *regs)
 {
-- 
2.41.0

