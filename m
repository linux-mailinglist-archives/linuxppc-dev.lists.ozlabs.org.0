Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543E5651DAC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 10:41:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nbs6F1K1Fz3fCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Dec 2022 20:41:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nbs594WvLz2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Dec 2022 20:40:45 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Nbs4z4lBVz9t3q;
	Tue, 20 Dec 2022 10:40:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUyV7fBD5z7Y; Tue, 20 Dec 2022 10:40:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Nbs4n4nr8z9t41;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C87E8B774;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rw_imi8iIn-V; Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.18])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72F6B8B763;
	Tue, 20 Dec 2022 10:40:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2BJIkHMn1709633
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Dec 2022 19:46:17 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2BJIkHCi1709632;
	Mon, 19 Dec 2022 19:46:17 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        jbglaw@lug-owl.de
Subject: [PATCH v1 5/5] powerpc/epapr: Don't use wrteei on non booke
Date: Mon, 19 Dec 2022 19:46:00 +0100
Message-Id: <b29c7f1727433b003eae050e44072741c8ac223b.1671475543.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1671475558; l=1048; s=20211009; h=from:subject:message-id; bh=Cg2+M3VifLSSD0LyQ3hL3PQ83SXOIFp0qiPKO1QwDcg=; b=Vi1YuEJYanST1ZaxHCzqg5MiIex+yQfaZB3QwDjpW/HIWKiLwC2JIlosX7s9rPOLK9INV5zBdEbY aJFypXFPDMeprZ694hPaChMXlL/qlkok/ub0DKOwUgRMJbAzf8bd
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

wrteei is only for booke. Use the standard mfmsr/ori/mtmsr
when non booke.

Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Not sure this is needed at all, the commit that introduced the code says it is for e500, but there's no such limitation in Kconfig. Maybe we should limit all the file to CONFIG_PPC_E500
---
 arch/powerpc/kernel/epapr_hcalls.S | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/kernel/epapr_hcalls.S b/arch/powerpc/kernel/epapr_hcalls.S
index 69a912550577..033116e465d0 100644
--- a/arch/powerpc/kernel/epapr_hcalls.S
+++ b/arch/powerpc/kernel/epapr_hcalls.S
@@ -21,7 +21,13 @@ _GLOBAL(epapr_ev_idle)
 	ori	r4, r4,_TLF_NAPPING	/* so when we take an exception */
 	PPC_STL	r4, TI_LOCAL_FLAGS(r2)	/* it will return to our caller */
 
+#ifdef CONFIG_BOOKE_OR_40x
 	wrteei	1
+#else
+	mfmsr	r4
+	ori	r4, r4, MSR_EE
+	mtmsr	r4
+#endif
 
 idle_loop:
 	LOAD_REG_IMMEDIATE(r11, EV_HCALL_TOKEN(EV_IDLE))
-- 
2.38.1

