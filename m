Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E64C93FC433
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 10:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzL3H6BrFz2yJ7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 18:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzL2t1Vq9z2xXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 18:29:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GzL2l5Ydhz9sTF;
 Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffasIuKm1dMh; Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GzL2l4brwz9sT9;
 Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A5E38B7DD;
 Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I_QUyGcvPMKr; Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AC718B7DE;
 Tue, 31 Aug 2021 10:29:35 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 223E66BCA2; Tue, 31 Aug 2021 08:29:35 +0000 (UTC)
Message-Id: <c3f9ec9950394ef939014f7934268e6ee30ca04f.1630398566.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/time: Remove generic_suspend_{dis/en}able_irqs()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Aug 2021 08:29:35 +0000 (UTC)
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

Commit d75d68cfef49 ("powerpc: Clean up obsolete code relating to
decrementer and timebase") made generic_suspend_enable_irqs() and
generic_suspend_disable_irqs() static.

Fold them into their only caller.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/time.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 934d8ae66cc6..cae8f03a44fe 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -631,8 +631,12 @@ void timer_broadcast_interrupt(void)
 #endif
 
 #ifdef CONFIG_SUSPEND
-static void generic_suspend_disable_irqs(void)
+/* Overrides the weak version in kernel/power/main.c */
+void arch_suspend_disable_irqs(void)
 {
+	if (ppc_md.suspend_disable_irqs)
+		ppc_md.suspend_disable_irqs();
+
 	/* Disable the decrementer, so that it doesn't interfere
 	 * with suspending.
 	 */
@@ -642,23 +646,11 @@ static void generic_suspend_disable_irqs(void)
 	set_dec(decrementer_max);
 }
 
-static void generic_suspend_enable_irqs(void)
-{
-	local_irq_enable();
-}
-
-/* Overrides the weak version in kernel/power/main.c */
-void arch_suspend_disable_irqs(void)
-{
-	if (ppc_md.suspend_disable_irqs)
-		ppc_md.suspend_disable_irqs();
-	generic_suspend_disable_irqs();
-}
-
 /* Overrides the weak version in kernel/power/main.c */
 void arch_suspend_enable_irqs(void)
 {
-	generic_suspend_enable_irqs();
+	local_irq_enable();
+
 	if (ppc_md.suspend_enable_irqs)
 		ppc_md.suspend_enable_irqs();
 }
-- 
2.25.0

