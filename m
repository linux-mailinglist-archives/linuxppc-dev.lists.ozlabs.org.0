Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD67740DD4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Sep 2021 16:55:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9Kr35TDTz304y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 00:54:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9KqZ0Hcgz2xsB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 00:54:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H9KqP4rkzz9sTp;
 Thu, 16 Sep 2021 16:54:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kPwgY1cGo74P; Thu, 16 Sep 2021 16:54:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H9KqN4RfGz9sT4;
 Thu, 16 Sep 2021 16:54:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 848028B796;
 Thu, 16 Sep 2021 16:54:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0Ejw6vR0cpbV; Thu, 16 Sep 2021 16:54:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.29])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E3C48B783;
 Thu, 16 Sep 2021 16:54:24 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18GEqKte426544
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 16 Sep 2021 16:52:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18GEqHcu426537;
 Thu, 16 Sep 2021 16:52:17 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: warn on emulation of dcbz instruction in kernel
 mode
Date: Thu, 16 Sep 2021 16:52:09 +0200
Message-Id: <2e3acfe63d289c6fba366e16973c9ab8369e8b75.1631803922.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: Stan Johnson <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dcbz instruction shouldn't be used on non-cached memory. Using
it on non-cached memory can result in alignment exception and
implies a heavy handling.

Instead of silentely emulating the instruction and resulting in high
performance degradation, warn whenever an alignment exception is
taken in kernel mode due to dcbz, so that the user is made aware that
dcbz instruction has been used unexpectedly by the kernel.

Reported-by: Stan Johnson <userm57@yahoo.com>
Cc: Finn Thain <fthain@linux-m68k.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Warn only when emulating kernel mode
---
 arch/powerpc/kernel/align.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index bbb4181621dd..bf96b954a4eb 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -349,6 +349,7 @@ int fix_alignment(struct pt_regs *regs)
 		if (op.type != CACHEOP + DCBZ)
 			return -EINVAL;
 		PPC_WARN_ALIGNMENT(dcbz, regs);
+		WARN_ON_ONCE(!user_mode(regs));
 		r = emulate_dcbz(op.ea, regs);
 	} else {
 		if (type == LARX || type == STCX)
-- 
2.31.1

