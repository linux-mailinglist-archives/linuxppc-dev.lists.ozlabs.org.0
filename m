Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCB469F712
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 15:49:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMJwH2w1vz3fyB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 01:49:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMJnp17Qsz3cjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 01:44:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4PMJn70hHHz9sTT;
	Wed, 22 Feb 2023 15:43:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OqrajB7KGRNg; Wed, 22 Feb 2023 15:43:39 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4PMJmx0nxqz9sTd;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0383C8B763;
	Wed, 22 Feb 2023 15:43:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MijR4bgs45tD; Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EC478B77A;
	Wed, 22 Feb 2023 15:43:28 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 31MEhLu11187093
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 15:43:21 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 31MEhLSZ1187092;
	Wed, 22 Feb 2023 15:43:21 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v4 02/17] powerpc/85xx: Rename setup_arch and pic_init on p1023
Date: Wed, 22 Feb 2023 15:42:49 +0100
Message-Id: <9ac65418c7b9d053d7731f21b78b4c1f2602f84b.1677076552.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1677076552.git.christophe.leroy@csgroup.eu>
References: <cover.1677076552.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677076979; l=1478; s=20211009; h=from:subject:message-id; bh=PEFiM3HoBKg5bK+qEWGSBwFGxLl0Jc468AqAiHS5FQw=; b=cp9qkTuZy9/rJHXfuIzcp4bN+atNigDt+/n8aeJMwKqsiuBu9WdaYDSYnu2eBDVF8aC8Mf8dDGCj 2nymKHk7AY9x7N9fthhTiylZnozpbe1oWHkActNs8vjU005IzJ8p
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

Avoid conflict with other functions, rename mpc85xx_rdb_setup_arch()
to p1023_rdb_setup_arch(), same for mpc85xx_rdb_pic_init().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/85xx/p1023_rdb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/p1023_rdb.c b/arch/powerpc/platforms/85xx/p1023_rdb.c
index c04868eb2eb1..5d434ee96445 100644
--- a/arch/powerpc/platforms/85xx/p1023_rdb.c
+++ b/arch/powerpc/platforms/85xx/p1023_rdb.c
@@ -37,7 +37,7 @@
  * Setup the architecture
  *
  */
-static void __init mpc85xx_rdb_setup_arch(void)
+static void __init p1023_rdb_setup_arch(void)
 {
 	struct device_node *np;
 
@@ -83,7 +83,7 @@ static void __init mpc85xx_rdb_setup_arch(void)
 
 machine_arch_initcall(p1023_rdb, mpc85xx_common_publish_devices);
 
-static void __init mpc85xx_rdb_pic_init(void)
+static void __init p1023_rdb_pic_init(void)
 {
 	struct mpic *mpic = mpic_alloc(NULL, 0, MPIC_BIG_ENDIAN |
 		MPIC_SINGLE_DEST_CPU,
@@ -103,8 +103,8 @@ static int __init p1023_rdb_probe(void)
 define_machine(p1023_rdb) {
 	.name			= "P1023 RDB",
 	.probe			= p1023_rdb_probe,
-	.setup_arch		= mpc85xx_rdb_setup_arch,
-	.init_IRQ		= mpc85xx_rdb_pic_init,
+	.setup_arch		= p1023_rdb_setup_arch,
+	.init_IRQ		= p1023_rdb_pic_init,
 	.get_irq		= mpic_get_irq,
 	.calibrate_decr		= generic_calibrate_decr,
 	.progress		= udbg_progress,
-- 
2.39.1

