Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC374F00A0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 12:30:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVtbR1gh2z3c4w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 21:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVtZg1xz1z3062
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 21:29:47 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KVtZV0sj3z9sSb;
 Sat,  2 Apr 2022 12:29:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id um39nUGiJxRy; Sat,  2 Apr 2022 12:29:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KVtZT5tNpz9sSQ;
 Sat,  2 Apr 2022 12:29:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B70DC8B76D;
 Sat,  2 Apr 2022 12:29:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UhIJN4BzORPW; Sat,  2 Apr 2022 12:29:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.136])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 78EB78B768;
 Sat,  2 Apr 2022 12:29:37 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 232ATWE1685821
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 2 Apr 2022 12:29:32 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 232ATUIE685820;
 Sat, 2 Apr 2022 12:29:30 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH] char: tpm: Prepare cleanup of powerpc's asm/prom.h
Date: Sat,  2 Apr 2022 12:29:19 +0200
Message-Id: <cfd3a718e147b39620dfa7c779a7ae1af2f6b575.1648895074.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <7a522d9029737d7a1fb513529659321ed62d50d9.1648895070.git.christophe.leroy@csgroup.eu>
References: <7a522d9029737d7a1fb513529659321ed62d50d9.1648895070.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648895353; l=1196; s=20211009;
 h=from:subject:message-id; bh=wSCumnp9XggBlThPYk0xbVFOfQCfn4BwRASVoIH+/0g=;
 b=tnQ/Y9RsTkls/KJxmWUPV5nyCGpquPxpDvauKKLqkHRj4JYZxDyZt1lzDpHJhE11NE92qKg2soTA
 yVOoy2x4BiD4uqZz2DwSg7tP5jTcWi4nRbirFWc2EqLMB+30xpdp
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
Cc: linux-arm-kernel@lists.infradead.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc's asm/prom.h brings some headers that it doesn't
need itself.

In order to clean it up, first add missing headers in
users of asm/prom.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/char/tpm/tpm_atmel.h   | 2 --
 drivers/char/tpm/tpm_ibmvtpm.c | 1 -
 2 files changed, 3 deletions(-)

diff --git a/drivers/char/tpm/tpm_atmel.h b/drivers/char/tpm/tpm_atmel.h
index ba37e77e8af3..959f7cce8301 100644
--- a/drivers/char/tpm/tpm_atmel.h
+++ b/drivers/char/tpm/tpm_atmel.h
@@ -26,8 +26,6 @@ struct tpm_atmel_priv {
 
 #ifdef CONFIG_PPC64
 
-#include <asm/prom.h>
-
 #define atmel_getb(priv, offset) readb(priv->iobase + offset)
 #define atmel_putb(val, priv, offset) writeb(val, priv->iobase + offset)
 #define atmel_request_region request_mem_region
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 3af4c07a9342..1180cce7067a 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -20,7 +20,6 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/wait.h>
-#include <asm/prom.h>
 
 #include "tpm.h"
 #include "tpm_ibmvtpm.h"
-- 
2.35.1

