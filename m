Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF2154769F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 18:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LL3lJ5SJXz3chC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jun 2022 02:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LL3kv0FSdz3bq3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Jun 2022 02:51:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LL3kl5J28z9tSB;
	Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-GeVd3UagWG; Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LL3kl4GMcz9t4V;
	Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 77E428B780;
	Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xPvV6BTXLlWy; Sat, 11 Jun 2022 18:51:27 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.192])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F2B968B77C;
	Sat, 11 Jun 2022 18:51:26 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25BGpEFO741176
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 11 Jun 2022 18:51:14 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25BGpEha741175;
	Sat, 11 Jun 2022 18:51:14 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, deller@gmx.de,
        manoj@linux.ibm.com, mrochs@linux.ibm.com, ukrishn@linux.ibm.com,
        jejb@linux.ibm.com, martin.petersen@oracle.com, tzimmermann@suse.de
Subject: [PATCH 3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
Date: Sat, 11 Jun 2022 18:50:59 +0200
Message-Id: <0185bab82df3bc3f870791e75fdab577ab420c16.1654966253.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
References: <a1dfa936043eeed715e8cda7f8690fe553ba7c1a.1654966253.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1654966257; l=1314; s=20211009; h=from:subject:message-id; bh=A5oEMWM1tbgeNqcczx0E9KKuLps7GCNDia3yuM/VYJs=; b=bWc1kazF1KLq4sogsrkpAG4F1rOEBqg+/vl9fc0JtPPtA5WhtnOk5eTi/1t/ZO/38g/dQrdZDSNc FkerX/EVA3DAwO+ytX7fR8gQV9X7CW1Xhlq5cimVg9u1qTJgvfLN
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
Cc: linux-fbdev@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

asm/pci.h and asm/mpc52xx.h don't need asm/prom.h

Declare struct device_node locally to avoid including of.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/mpc52xx.h | 3 ++-
 arch/powerpc/include/asm/pci.h     | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/asm/mpc52xx.h
index ce1e0aabaa64..f721a5c90e20 100644
--- a/arch/powerpc/include/asm/mpc52xx.h
+++ b/arch/powerpc/include/asm/mpc52xx.h
@@ -15,7 +15,6 @@
 
 #ifndef __ASSEMBLY__
 #include <asm/types.h>
-#include <asm/prom.h>
 #include <asm/mpc5xxx.h>
 #endif /* __ASSEMBLY__ */
 
@@ -268,6 +267,8 @@ struct mpc52xx_intr {
 
 #ifndef __ASSEMBLY__
 
+struct device_node;
+
 /* mpc52xx_common.c */
 extern void mpc5200_setup_xlb_arbiter(void);
 extern void mpc52xx_declare_of_platform_devices(void);
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 915d6ee4b40a..0f182074cdb7 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -14,7 +14,6 @@
 
 #include <asm/machdep.h>
 #include <asm/io.h>
-#include <asm/prom.h>
 #include <asm/pci-bridge.h>
 
 /* Return values for pci_controller_ops.probe_mode function */
-- 
2.35.3

