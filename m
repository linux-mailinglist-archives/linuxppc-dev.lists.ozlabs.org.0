Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5E74AB945
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 12:18:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JskD50SPwz3bTy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 22:18:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aQhuxBf0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2404:9400:2221:ea00::3;
 helo=gandalf.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aQhuxBf0; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JskCS17x4z2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 22:18:11 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JskCR391hz4y3t;
 Mon,  7 Feb 2022 22:18:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644232691;
 bh=X9pvbvZhC+D5v5AF6gvrofeetIO+1Qb5OeO8MNnQ/RU=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aQhuxBf0BKfWLeN4uy1l4VkFHGpMBxba1jePK8Rj1b9VNndhuoDfg6wdxBrMm1uje
 5R3J9RImaYKnS9biR8tpKFiVnTBIOcLhdNAhHq1EPQpOMZipNxXI1279GHbDjhIYY9
 klWVwKLNQEdsIEMmY3ErbVImaSKyPQqI1C3DCEJyOcYPvfbs5oWUWYnXFj8364Bti9
 k5A+eFNCbf79vnsMr390NS5nHpmdKXvNG0wJE9kSyHoYDzBe0cQV0SIu60OOod8R49
 v+pwMSWoimEvOHWDN1vQBQQXItrvs7lDIzcqdCTw7KFBa5+bPrtXhzMIVHLa7as1h8
 aZhJXQmcG48Gw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [RFC PATCH v1 05/11] powerpc/machdep: Move sys_ctrler_t
 definition into pmac.h
In-Reply-To: <7dd5ead4bbca749e2da089ff6fe2b1878d6bf40e.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
 <7dd5ead4bbca749e2da089ff6fe2b1878d6bf40e.1630667612.git.christophe.leroy@csgroup.eu>
Date: Mon, 07 Feb 2022 22:18:06 +1100
Message-ID: <874k5blyc1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> sys_ctrler_t definitions are tied to pmac. Move it in pmac.h
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/machdep.h     | 15 ---------------
>  arch/powerpc/platforms/powermac/pmac.h | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 15 deletions(-)

This broke a few things in drivers/macintosh and sound/ppc, I fixed it
up with the delta below.

cheers


diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
index e08e829261b6..2495866f2e97 100644
--- a/arch/powerpc/include/asm/pmac_feature.h
+++ b/arch/powerpc/include/asm/pmac_feature.h
@@ -401,5 +401,17 @@ extern u32 __iomem *uninorth_base;
  */
 extern int pmac_get_uninorth_variant(void);
 
+/*
+ * Power macintoshes have either a CUDA, PMU or SMU controlling
+ * system reset, power, NVRAM, RTC.
+ */
+typedef enum sys_ctrler_kind {
+	SYS_CTRLER_UNKNOWN = 0,
+	SYS_CTRLER_CUDA = 1,
+	SYS_CTRLER_PMU = 2,
+	SYS_CTRLER_SMU = 3,
+} sys_ctrler_t;
+extern sys_ctrler_t sys_ctrler;
+
 #endif /* __ASM_POWERPC_PMAC_FEATURE_H */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/platforms/powermac/pmac.h b/arch/powerpc/platforms/powermac/pmac.h
index b96d28dd26cf..ba8d4e97095b 100644
--- a/arch/powerpc/platforms/powermac/pmac.h
+++ b/arch/powerpc/platforms/powermac/pmac.h
@@ -5,17 +5,7 @@
 #include <linux/pci.h>
 #include <linux/irq.h>
 
-/*
- * Power macintoshes have either a CUDA, PMU or SMU controlling
- * system reset, power, NVRAM, RTC.
- */
-typedef enum sys_ctrler_kind {
-	SYS_CTRLER_UNKNOWN = 0,
-	SYS_CTRLER_CUDA = 1,
-	SYS_CTRLER_PMU = 2,
-	SYS_CTRLER_SMU = 3,
-} sys_ctrler_t;
-extern sys_ctrler_t sys_ctrler;
+#include <asm/pmac_feature.h>
 
 /*
  * Declaration for the various functions exported by the
diff --git a/drivers/macintosh/via-cuda.c b/drivers/macintosh/via-cuda.c
index cd267392289c..3d0d0b9d471d 100644
--- a/drivers/macintosh/via-cuda.c
+++ b/drivers/macintosh/via-cuda.c
@@ -21,6 +21,7 @@
 #ifdef CONFIG_PPC
 #include <asm/prom.h>
 #include <asm/machdep.h>
+#include <asm/pmac_feature.h>
 #else
 #include <asm/macintosh.h>
 #include <asm/macints.h>
diff --git a/sound/ppc/pmac.h b/sound/ppc/pmac.h
index a758caf689d2..b6f454130463 100644
--- a/sound/ppc/pmac.h
+++ b/sound/ppc/pmac.h
@@ -26,6 +26,7 @@
 #include <asm/dbdma.h>
 #include <asm/prom.h>
 #include <asm/machdep.h>
+#include <asm/pmac_feature.h>
 
 /* maximum number of fragments */
 #define PMAC_MAX_FRAGS		32

