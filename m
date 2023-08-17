Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB24677F8DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 16:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRS615XvYz3clf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 00:28:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=csgroup.eu (client-ip=90.115.179.12; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (unknown [90.115.179.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRS5X2MQTz3bWy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 00:27:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RRS5T1wrFz9x7v;
	Thu, 17 Aug 2023 16:27:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZV6txLA989B; Thu, 17 Aug 2023 16:27:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RRS5T1DJcz9x7n;
	Thu, 17 Aug 2023 16:27:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 26A268B76C;
	Thu, 17 Aug 2023 16:27:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 12zksZKOPVCI; Thu, 17 Aug 2023 16:27:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.19.54.59])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD3688B763;
	Thu, 17 Aug 2023 16:27:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37HERT42446275
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 16:27:29 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37HERTJ8446236;
	Thu, 17 Aug 2023 16:27:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/4xx: Add missing includes to fix no previous prototype errors
Date: Thu, 17 Aug 2023 16:27:23 +0200
Message-ID: <c8253017e355638132737ff47936e290df8738d1.1692282432.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692282442; l=1777; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=yGTRAmMTYM0Y3spDgeN3QkgVKi9Gx46oVPN1AD83t74=; b=WYxGZjBxhhd1DmqCSQYw0oT0E4p4RUZpBkLFnaiOkgn8Z2A27j150A0CWsCDO5ShRC3OTwe2F e7J0OaJfqlNAn8UA+vdC4ceBaTr9rjdUA3yHQT7nkdcra7Uo/auAIyx
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
Cc: Arnd Bergmann <arnd@arndb.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A W=1 build of ppc40x_defconfig throws the followings errors:

  CC      arch/powerpc/platforms/4xx/uic.o
arch/powerpc/platforms/4xx/uic.c:274:13: warning: no previous prototype for 'uic_init_tree' [-Wmissing-prototypes]
  274 | void __init uic_init_tree(void)
      |             ^~~~~~~~~~~~~
arch/powerpc/platforms/4xx/uic.c:319:14: warning: no previous prototype for 'uic_get_irq' [-Wmissing-prototypes]
  319 | unsigned int uic_get_irq(void)
      |              ^~~~~~~~~~~
  CC      arch/powerpc/platforms/4xx/machine_check.o
  CC      arch/powerpc/platforms/4xx/soc.o
arch/powerpc/platforms/4xx/soc.c:193:6: warning: no previous prototype for 'ppc4xx_reset_system' [-Wmissing-prototypes]
  193 | void ppc4xx_reset_system(char *cmd)
      |      ^~~~~~~~~~~~~~~~~~~

Add missing includes to get the missing prototypes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/platforms/4xx/soc.c | 1 +
 arch/powerpc/platforms/4xx/uic.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/4xx/soc.c b/arch/powerpc/platforms/4xx/soc.c
index f91df0827877..b2d940437a66 100644
--- a/arch/powerpc/platforms/4xx/soc.c
+++ b/arch/powerpc/platforms/4xx/soc.c
@@ -21,6 +21,7 @@
 #include <asm/dcr.h>
 #include <asm/dcr-regs.h>
 #include <asm/reg.h>
+#include <asm/ppc4xx.h>
 
 static u32 dcrbase_l2c;
 
diff --git a/arch/powerpc/platforms/4xx/uic.c b/arch/powerpc/platforms/4xx/uic.c
index d667ad039bd3..e3e148b9dd18 100644
--- a/arch/powerpc/platforms/4xx/uic.c
+++ b/arch/powerpc/platforms/4xx/uic.c
@@ -24,6 +24,7 @@
 #include <asm/irq.h>
 #include <asm/io.h>
 #include <asm/dcr.h>
+#include <asm/uic.h>
 
 #define NR_UIC_INTS	32
 
-- 
2.41.0

