Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF819570563
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 16:20:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQzF5vdbz3f2h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 00:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQyP3wTDz3cdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 00:20:13 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LhQyL1gL5z9syh;
	Mon, 11 Jul 2022 16:20:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBzFu2LNQITg; Mon, 11 Jul 2022 16:20:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LhQyL0hn2z9sWf;
	Mon, 11 Jul 2022 16:20:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F17D48B767;
	Mon, 11 Jul 2022 16:20:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id m2CzUUGV9Lkl; Mon, 11 Jul 2022 16:20:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D22E48B763;
	Mon, 11 Jul 2022 16:20:09 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 26BEK0111585526
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 16:20:01 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 26BEJwVj1585434;
	Mon, 11 Jul 2022 16:19:58 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 3/5] powerpc/405: Fix build failure with GCC 12 (unrecognized opcode: `wrteei')
Date: Mon, 11 Jul 2022 16:19:31 +0200
Message-Id: <d344a42c99061cfe10a28e00de4e31a1363f4251.1657549153.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
References: <8abab4888da69ff78b73a56f64d9678a7bf684e9.1657549153.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657549171; l=1366; s=20211009; h=from:subject:message-id; bh=/jjLRgysLYYJyLjytD6TMTnOqgg1k6y/+YbbSMaSllw=; b=sCAXpZSaQZs2OCDmNJOmoLb2AO/jqINCE5QPLu96AygNK6Q3Pqqxau5pwOA24DdCpfdG9JRopuE4 aGTFuEIuDUkbHju3FThrZrQRyRnp42LShE/9xBitpuGTbs3D0q1H
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

Building ppc40x_defconfig leads to following error

  CC      arch/powerpc/kernel/process.o
{standard input}: Assembler messages:
{standard input}:626: Error: unrecognized opcode: `wrteei'

Add -mcpu=405 by default.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/Kconfig.cputype | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index bfea5d8452f8..e14000557ebd 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -137,7 +137,7 @@ config GENERIC_CPU
 
 config POWERPC_CPU
 	bool "Generic 32 bits powerpc"
-	depends on PPC32 && !PPC_8xx && !PPC_85xx
+	depends on PPC32 && !PPC_8xx && !PPC_85xx && !40x
 
 config CELL_CPU
 	bool "Cell Broadband Engine"
@@ -179,6 +179,10 @@ config E6500_CPU
 	bool "Freescale e6500"
 	depends on PPC64 && E500
 
+config 405_CPU
+	bool "40x family"
+	depends on 40x
+
 config 860_CPU
 	bool "8xx family"
 	depends on PPC_8xx
@@ -223,6 +227,7 @@ config TARGET_CPU
 	default "power7" if POWER7_CPU
 	default "power8" if POWER8_CPU
 	default "power9" if POWER9_CPU
+	default "405" if 405_CPU
 	default "860" if 860_CPU
 	default "e300c2" if E300C2_CPU
 	default "e300c3" if E300C3_CPU
-- 
2.36.1

