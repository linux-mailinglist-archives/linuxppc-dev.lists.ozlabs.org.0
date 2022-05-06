Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE451D414
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:15:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvlJt3BCjz3fTf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvlJV3X6Kz2xCp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 19:14:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KvlJQ081Tz9sTq;
 Fri,  6 May 2022 11:14:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fnO24S0l597Z; Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KvlJP6Ppqz9sTl;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD0838B790;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id p0zZkgpRqI01; Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.81])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 818228B78F;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2469EYDL1217953
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 6 May 2022 11:14:34 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2469EYhh1217952;
 Fri, 6 May 2022 11:14:34 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 2/2] powerpc: Don't include asm/ppc_asm.h in other headers
Date: Fri,  6 May 2022 11:14:25 +0200
Message-Id: <e2d7b96547037f852c7ed164e4f79e8918c2607a.1651828453.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <11956ec181a034b51a881ac9c059eea72c679a73.1651828453.git.christophe.leroy@csgroup.eu>
References: <11956ec181a034b51a881ac9c059eea72c679a73.1651828453.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651828460; l=2132; s=20211009;
 h=from:subject:message-id; bh=SeXYhKdfx2ALWIzzowSQTmFHVhf2HPku0NijyAI/8ls=;
 b=nGFe6RLxirlIK3tpHR80ftnxqDw8x8GfgOwptuGCbEQN6cbKcOnxg2Jy3yB+it+8y4rWxuzXlqvK
 ko4M3G6zAdMCptmhGD2dI5JesLcCdyEFvLcz/6jU+lmKqs+8CZUE
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

asm/ppc_asm.h is not needed in any of the header it is included.

It is only needed by irq.c. Include it there and remove it from
other headers.

word-at-a-time.h only need ex_table.h, so include it instead.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/io.h             | 1 -
 arch/powerpc/include/asm/uaccess.h        | 1 -
 arch/powerpc/include/asm/word-at-a-time.h | 2 +-
 arch/powerpc/kernel/irq.c                 | 1 +
 4 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index fee979d3a1aa..6291af42533d 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -33,7 +33,6 @@ extern struct pci_dev *isa_bridge_pcidev;
 #include <asm/delay.h>
 #include <asm/mmiowb.h>
 #include <asm/mmu.h>
-#include <asm/ppc_asm.h>
 
 #define SIO_CONFIG_RA	0x398
 #define SIO_CONFIG_RD	0x399
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 9b82b38ff867..14a08806f8e8 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -2,7 +2,6 @@
 #ifndef _ARCH_POWERPC_UACCESS_H
 #define _ARCH_POWERPC_UACCESS_H
 
-#include <asm/ppc_asm.h>
 #include <asm/processor.h>
 #include <asm/page.h>
 #include <asm/extable.h>
diff --git a/arch/powerpc/include/asm/word-at-a-time.h b/arch/powerpc/include/asm/word-at-a-time.h
index f3f4710d4ff5..46c31fb8748d 100644
--- a/arch/powerpc/include/asm/word-at-a-time.h
+++ b/arch/powerpc/include/asm/word-at-a-time.h
@@ -7,7 +7,7 @@
 
 #include <linux/kernel.h>
 #include <asm/asm-compat.h>
-#include <asm/ppc_asm.h>
+#include <asm/extable.h>
 
 #ifdef __BIG_ENDIAN__
 
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 752fb182eacb..5f68d5e4243d 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -66,6 +66,7 @@
 #include <asm/livepatch.h>
 #include <asm/hw_irq.h>
 #include <asm/softirq_stack.h>
+#include <asm/ppc_asm.h>
 
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
-- 
2.35.1

