Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFD75469AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQJ61zCWz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQHd1tnVz3bqd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:44:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LKQHM32SJz9tS3;
	Fri, 10 Jun 2022 17:43:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVL_YSb_VQtj; Fri, 10 Jun 2022 17:43:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LKQHM2JFMz9tRp;
	Fri, 10 Jun 2022 17:43:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3DD188B77C;
	Fri, 10 Jun 2022 17:43:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aAdVr1Behtaf; Fri, 10 Jun 2022 17:43:59 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.157])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 056CD8B76C;
	Fri, 10 Jun 2022 17:43:58 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25AFhnCB580720
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 17:43:49 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25AFhkVT580719;
	Fri, 10 Jun 2022 17:43:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/prom_init: Fix build failure with GCC_PLUGIN_STRUCTLEAK_BYREF_ALL and KASAN
Date: Fri, 10 Jun 2022 17:43:43 +0200
Message-Id: <3802811f7cf94f730be44688539c01bba3a3b5c0.1654875808.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654875822; l=1218; s=20211009; h=from:subject:message-id; bh=oCsWeNQnkbAKajw9OSEKX+h8u6ZATnBOTU5zPrw1ZhU=; b=lJ+F+lnuJpPLlIGRUSLhvdU8NcrT1z1QzvkbmG4iMDTa04p0uqGhkvQvYZI8D1zQ/Zxnb+qfxsDM P2OZRJLIBTuD8CuB5uzCxAZlyPtnM+fJcmFp00lw2VAfP0PSc3DW
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

When CONFIG_KASAN is selected, we expect prom_init to use __memset()
because it is too early to use memset().

But with CONFIG_GCC_PLUGIN_STRUCTLEAK_BYREF_ALL, the compiler adds calls
to memset() to clear objects on stack, hence the following failure:

	  PROMCHK arch/powerpc/kernel/prom_init_check
	Error: External symbol 'memset' referenced from prom_init.c
	make[2]: *** [arch/powerpc/kernel/Makefile:204 : arch/powerpc/kernel/prom_init_check] Erreur 1

prom_find_machine_type() is called from prom_init() and is called only
once, so lets put compat[] in BSS instead of stack to avoid that.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/prom_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 04694ec423f6..13d6cb188835 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2302,7 +2302,7 @@ static void __init prom_init_stdout(void)
 
 static int __init prom_find_machine_type(void)
 {
-	char compat[256];
+	static char compat[256] __prombss;
 	int len, i = 0;
 #ifdef CONFIG_PPC64
 	phandle rtas;
-- 
2.35.3

