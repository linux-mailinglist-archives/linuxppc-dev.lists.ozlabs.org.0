Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBFA56B327
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 09:12:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfPby2gSRz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 17:12:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfPbS6nRFz3c1l
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 17:11:45 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LfPbL07kvz9tJ1;
	Fri,  8 Jul 2022 09:11:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHe5ROC2Guch; Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LfPbK6Jjwz9tDK;
	Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C65598B7A7;
	Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id s-F0zO7ju3R4; Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.202])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 726B48B76C;
	Fri,  8 Jul 2022 09:11:41 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2687BSws603403
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 8 Jul 2022 09:11:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2687BSLj603402;
	Fri, 8 Jul 2022 09:11:28 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        deller@gmx.de, manoj@linux.ibm.com, mrochs@linux.ibm.com,
        ukrishn@linux.ibm.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
        tzimmermann@suse.de
Subject: [PATCH v3 3/4] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
Date: Fri,  8 Jul 2022 09:11:07 +0200
Message-Id: <cf5243343e2364c2b40f22ee5ad9a6e2453d1121.1657264228.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
References: <f75b383673663e27f6b57e50b4abfb9fe3780b00.1657264228.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657264266; l=1729; s=20211009; h=from:subject:message-id; bh=i0Z1UEPZjbP1/SK0DF+c1njT/ERZZTtQbMiEmmoLlwE=; b=i+CN5DB1x2n6dy3E7dKZtXZyHiRDIr7r9sR2CpWiqnSsEXuGrRJwVNe7CUMHL81xae2eB9GDF1dn 3+OObRN6C1H2SSBJz7Okwz9HfEQXyZzEBpNrbq9i6E73lAs/wuhJ
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
v3: Add prom.h to prom.c
---
 arch/powerpc/include/asm/mpc52xx.h | 3 ++-
 arch/powerpc/include/asm/pci.h     | 1 -
 arch/powerpc/kernel/prom.c         | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/mpc52xx.h b/arch/powerpc/include/asm/mpc52xx.h
index ddd80aae1e32..5ea16a71c2f0 100644
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
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 1066b072db35..0a68c99da573 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -54,6 +54,7 @@
 #include <asm/dt_cpu_ftrs.h>
 #include <asm/drmem.h>
 #include <asm/ultravisor.h>
+#include <asm/prom.h>
 
 #include <mm/mmu_decl.h>
 
-- 
2.36.1

