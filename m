Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48AF7773810
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 08:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKjPN1x3Qz3bWC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 16:06:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKjNC1Bbsz2xHK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 16:05:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RKjN143N7z9t1q;
	Tue,  8 Aug 2023 08:05:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG-IauvTFr90; Tue,  8 Aug 2023 08:05:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RKjN05Ybgz9t1v;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BB3128B763;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jrMe1R4GtcK2; Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.230])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7287B8B76C;
	Tue,  8 Aug 2023 08:05:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 37865G4u1246292
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 8 Aug 2023 08:05:17 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 37865GL31246291;
	Tue, 8 Aug 2023 08:05:16 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v1 2/6] powerpc/include: Declare mpc8xx_immr in 8xx_immap.h
Date: Tue,  8 Aug 2023 08:04:39 +0200
Message-ID: <62d490b65899c2f2667ca7045c5f0fad9cbda458.1691474658.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
References: <b056c4e986a4a7707fc1994304c34f7bd15d6871.1691474658.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691474677; l=2698; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QYZQQJSoqBDOvDAaa2lO1yTKY8DE9xrk98GamoQpBnM=; b=neS52Goje1+Bgjr8g/CGGLWEFHcORFC4euTAxjg9Jk7tjgH1wSB4DUqVUq3aspXnbIpdr7b6t 5ioQ9+xLVyGBNExZ9cIpU06lNQBCOsPyqT3711JGDPWtop+J2U3JW8T
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

Do the same as for cmp2_immr : declare it at the same place
as its type immap_t, that is in 8xx_immap.h instead of fs_pd.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/8xx_immap.h         | 2 ++
 arch/powerpc/include/asm/fs_pd.h             | 2 --
 arch/powerpc/platforms/8xx/adder875.c        | 2 +-
 arch/powerpc/platforms/8xx/mpc86xads_setup.c | 1 -
 arch/powerpc/platforms/8xx/mpc885ads_setup.c | 1 -
 5 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/8xx_immap.h b/arch/powerpc/include/asm/8xx_immap.h
index bdf0563ba423..f9cac46a95cb 100644
--- a/arch/powerpc/include/asm/8xx_immap.h
+++ b/arch/powerpc/include/asm/8xx_immap.h
@@ -560,5 +560,7 @@ typedef struct immap {
 	cpm8xx_t	im_cpm;		/* Communication processor */
 } immap_t;
 
+extern immap_t __iomem *mpc8xx_immr;
+
 #endif /* __IMMAP_8XX__ */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/fs_pd.h b/arch/powerpc/include/asm/fs_pd.h
index 8def56ec05c6..2b2b52b7451d 100644
--- a/arch/powerpc/include/asm/fs_pd.h
+++ b/arch/powerpc/include/asm/fs_pd.h
@@ -29,8 +29,6 @@
 #ifdef CONFIG_PPC_8xx
 #include <asm/8xx_immap.h>
 
-extern immap_t __iomem *mpc8xx_immr;
-
 #define immr_map(member) (&mpc8xx_immr->member)
 #define immr_map_size(member, size) (&mpc8xx_immr->member)
 #define immr_unmap(addr) do {} while (0)
diff --git a/arch/powerpc/platforms/8xx/adder875.c b/arch/powerpc/platforms/8xx/adder875.c
index 7e83eb6746f4..ae72c574eb7e 100644
--- a/arch/powerpc/platforms/8xx/adder875.c
+++ b/arch/powerpc/platforms/8xx/adder875.c
@@ -13,7 +13,7 @@
 #include <asm/time.h>
 #include <asm/machdep.h>
 #include <asm/cpm1.h>
-#include <asm/fs_pd.h>
+#include <asm/8xx_immap.h>
 #include <asm/udbg.h>
 
 #include "mpc8xx.h"
diff --git a/arch/powerpc/platforms/8xx/mpc86xads_setup.c b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
index 11b3d1116db1..e4192c0a3c0c 100644
--- a/arch/powerpc/platforms/8xx/mpc86xads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc86xads_setup.c
@@ -24,7 +24,6 @@
 #include <asm/time.h>
 #include <asm/8xx_immap.h>
 #include <asm/cpm1.h>
-#include <asm/fs_pd.h>
 #include <asm/udbg.h>
 
 #include "mpc86xads.h"
diff --git a/arch/powerpc/platforms/8xx/mpc885ads_setup.c b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
index 2fc7cacbcd96..eb4e54ba417f 100644
--- a/arch/powerpc/platforms/8xx/mpc885ads_setup.c
+++ b/arch/powerpc/platforms/8xx/mpc885ads_setup.c
@@ -37,7 +37,6 @@
 #include <asm/time.h>
 #include <asm/8xx_immap.h>
 #include <asm/cpm1.h>
-#include <asm/fs_pd.h>
 #include <asm/udbg.h>
 
 #include "mpc885ads.h"
-- 
2.41.0

