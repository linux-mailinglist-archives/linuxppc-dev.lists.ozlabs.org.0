Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8432913221F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 10:18:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sRdB2t0PzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 20:18:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ntHh7OhB"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sRb22XtGzDqH2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 20:16:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47sRZv5lLdz9v0Y4;
 Tue,  7 Jan 2020 10:16:39 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ntHh7OhB; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id OxK4M7SF_qq0; Tue,  7 Jan 2020 10:16:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47sRZv4KRmz9v0Y2;
 Tue,  7 Jan 2020 10:16:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578388599; bh=ogZVZY/kn1mv+xJV69YBaTIh0up2D8ngI0X6/bQKCGU=;
 h=From:Subject:To:Cc:Date:From;
 b=ntHh7OhBWCQ0AznSgDaFKKfZdEfVoIOFEQ32uSMRU9FWI93IxBk4gNq7T0zQHAHEN
 rEXONlhkL2OLjWfQYFEVcNd3W5QZQUa1Qz1B70IO4GGsRO/XbeANaCllz6fRGeAijg
 jbEEBUQOLsBzTm57FNzgsXpKab82v7peaejA4lhU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A797F8B7C5;
 Tue,  7 Jan 2020 10:16:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TS_nc42frYp0; Tue,  7 Jan 2020 10:16:40 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 732848B7BF;
 Tue,  7 Jan 2020 10:16:40 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3D01563806; Tue,  7 Jan 2020 09:16:40 +0000 (UTC)
Message-Id: <d2c6dc65d27e83964eb05f16a126161ab6455eea.1578388585.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: don't restore r0, r6-r8 on exception entry path
 after trace_hardirqs_off()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  7 Jan 2020 09:16:40 +0000 (UTC)
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

Since commit b86fb88855ea ("powerpc/32: implement fast entry for
syscalls on non BOOKE") and commit 1a4b739bbb4f ("powerpc/32:
implement fast entry for syscalls on BOOKE"), syscalls don't
use the exception entry path anymore. It is therefore pointless
to restore r0 and r6-r8 after calling trace_hardirqs_off().

In the meantime, drop the '2:' label which is unused and misleading.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 4a7cd22a8aaf..748a13788b9b 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -242,9 +242,8 @@ reenable_mmu:
 	 * r3 can be different from GPR3(r1) at this point, r9 and r11
 	 * contains the old MSR and handler address respectively,
 	 * r4 & r5 can contain page fault arguments that need to be passed
-	 * along as well. r12, CCR, CTR, XER etc... are left clobbered as
-	 * they aren't useful past this point (aren't syscall arguments),
-	 * the rest is restored from the exception frame.
+	 * along as well. r0, r6-r8, r12, CCR, CTR, XER etc... are left
+	 * clobbered as they aren't useful past this point.
 	 */
 
 	stwu	r1,-32(r1)
@@ -258,16 +257,12 @@ reenable_mmu:
 	 * lockdep
 	 */
 1:	bl	trace_hardirqs_off
-2:	lwz	r5,24(r1)
+	lwz	r5,24(r1)
 	lwz	r4,20(r1)
 	lwz	r3,16(r1)
 	lwz	r11,12(r1)
 	lwz	r9,8(r1)
 	addi	r1,r1,32
-	lwz	r0,GPR0(r1)
-	lwz	r6,GPR6(r1)
-	lwz	r7,GPR7(r1)
-	lwz	r8,GPR8(r1)
 	mtctr	r11
 	mtlr	r9
 	bctr				/* jump to handler */
-- 
2.13.3

