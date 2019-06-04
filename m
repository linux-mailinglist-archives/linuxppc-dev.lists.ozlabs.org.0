Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766233E87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 07:44:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J17m3fg4zDqcS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 15:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J16Z0p9KzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 15:43:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="f+fvjgSq"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1010)
 id 45J16Y6NL9z9s4Y; Tue,  4 Jun 2019 15:43:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1559626981; bh=/6VuDf/uFaaPBvkmkQuaukwQQEW2dE0J5zdz5UnXxGE=;
 h=From:To:Cc:Subject:Date:From;
 b=f+fvjgSqKc4IMQbCjY2IIR4A16zsyFbyI23JguUjBPSCZ0ujRDGhUDMV5fXiX9VuJ
 G+n6bP7iIHauKva8I+N+bHcgNsAcD4XDoayOQ5V3YRJOWDqKqyrq+mHVS/JWTwgM5X
 un7ndyCFxhNRYA+Zhr+zyXAmB6yLISlr4WMF3NhSAROBDIhHbsQWMXOcuzh9dxbqC9
 BGYqhvYPTgLN1QpJcBvjMEAJGq0px71XaEnozp9FJIbTeT9YBlf6FKlJGTxWBdaXYL
 +dCIJh8Cf0uBlKKm+kSq0WLeEg+4F78kOyF8K3TKbkTHE+FjpKZijb9LnztZipHzvn
 1LcHjfdA5q6yQ==
From: Anton Blanchard <anton@ozlabs.org>
To: paulus@samba.org, mpe@ellerman.id.au, npiggin@gmail.com,
 aneesh.kumar@linux.vnet.ibm.com
Subject: [PATCH] powerpc/configs: Disable latencytop
Date: Tue,  4 Jun 2019 15:42:57 +1000
Message-Id: <20190604054257.30703-1-anton@ozlabs.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

latencytop adds almost 4kB to each and every task struct and as such
it doesn't deserve to be in our defconfigs.

Signed-off-by: Anton Blanchard <anton@ozlabs.org>
---
 arch/powerpc/configs/g5_defconfig       | 1 -
 arch/powerpc/configs/gamecube_defconfig | 1 -
 arch/powerpc/configs/maple_defconfig    | 1 -
 arch/powerpc/configs/pmac32_defconfig   | 1 -
 arch/powerpc/configs/powernv_defconfig  | 1 -
 arch/powerpc/configs/ppc64_defconfig    | 1 -
 arch/powerpc/configs/ppc64e_defconfig   | 1 -
 arch/powerpc/configs/ppc6xx_defconfig   | 1 -
 arch/powerpc/configs/pseries_defconfig  | 1 -
 arch/powerpc/configs/wii_defconfig      | 1 -
 10 files changed, 10 deletions(-)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index ceb3c770786f..8e9389d6c8ef 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -244,7 +244,6 @@ CONFIG_CRC_T10DIF=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
 CONFIG_BOOTX_TEXT=y
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_PCBC=m
diff --git a/arch/powerpc/configs/gamecube_defconfig b/arch/powerpc/configs/gamecube_defconfig
index 805b0f87653c..bfffdc4f1b73 100644
--- a/arch/powerpc/configs/gamecube_defconfig
+++ b/arch/powerpc/configs/gamecube_defconfig
@@ -91,7 +91,6 @@ CONFIG_CRC_CCITT=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
 CONFIG_SCHED_TRACER=y
 CONFIG_DMA_API_DEBUG=y
 CONFIG_PPC_EARLY_DEBUG=y
diff --git a/arch/powerpc/configs/maple_defconfig b/arch/powerpc/configs/maple_defconfig
index c5f2005005d3..1c436fafb397 100644
--- a/arch/powerpc/configs/maple_defconfig
+++ b/arch/powerpc/configs/maple_defconfig
@@ -104,7 +104,6 @@ CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_LATENCYTOP=y
 CONFIG_XMON=y
 CONFIG_XMON_DEFAULT=y
 CONFIG_BOOTX_TEXT=y
diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
index 50b610b48914..8d632ceaea48 100644
--- a/arch/powerpc/configs/pmac32_defconfig
+++ b/arch/powerpc/configs/pmac32_defconfig
@@ -293,7 +293,6 @@ CONFIG_CRC_T10DIF=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DETECT_HUNG_TASK=y
-CONFIG_LATENCYTOP=y
 CONFIG_XMON=y
 CONFIG_XMON_DEFAULT=y
 CONFIG_BOOTX_TEXT=y
diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index ef2ef98d3f28..1cf8ce18b4ca 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -317,7 +317,6 @@ CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
-CONFIG_LATENCYTOP=y
 CONFIG_FUNCTION_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_FTRACE_SYSCALLS=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 91fdb619b484..96d695ffe074 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -367,7 +367,6 @@ CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
 CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
 CONFIG_FUNCTION_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/arch/powerpc/configs/ppc64e_defconfig b/arch/powerpc/configs/ppc64e_defconfig
index 41d85cb3c9a2..7e52d4658867 100644
--- a/arch/powerpc/configs/ppc64e_defconfig
+++ b/arch/powerpc/configs/ppc64e_defconfig
@@ -223,7 +223,6 @@ CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_DETECT_HUNG_TASK=y
 CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
 CONFIG_IRQSOFF_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 7c6baf6df139..7bcdb4d1411c 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -1148,7 +1148,6 @@ CONFIG_FAIL_MAKE_REQUEST=y
 CONFIG_FAIL_IO_TIMEOUT=y
 CONFIG_FAULT_INJECTION_DEBUG_FS=y
 CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
-CONFIG_LATENCYTOP=y
 CONFIG_SCHED_TRACER=y
 CONFIG_STACK_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
index 62e12f61a3b2..c8f5f281e367 100644
--- a/arch/powerpc/configs/pseries_defconfig
+++ b/arch/powerpc/configs/pseries_defconfig
@@ -290,7 +290,6 @@ CONFIG_DEBUG_STACK_USAGE=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_HARDLOCKUP_DETECTOR=y
-CONFIG_LATENCYTOP=y
 CONFIG_FUNCTION_TRACER=y
 CONFIG_SCHED_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
diff --git a/arch/powerpc/configs/wii_defconfig b/arch/powerpc/configs/wii_defconfig
index f5c366b02828..d60c04a4708a 100644
--- a/arch/powerpc/configs/wii_defconfig
+++ b/arch/powerpc/configs/wii_defconfig
@@ -123,7 +123,6 @@ CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_SPINLOCK=y
 CONFIG_DEBUG_MUTEXES=y
-CONFIG_LATENCYTOP=y
 CONFIG_SCHED_TRACER=y
 CONFIG_BLK_DEV_IO_TRACE=y
 CONFIG_DMA_API_DEBUG=y
-- 
2.21.0

