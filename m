Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70751143642
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:39:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wmh60QqzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:39:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYs2l04zDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Kcch4E0k; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYs0mn8z9sP6; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYr6PGqz9sSD; Tue, 21 Jan 2020 15:30:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581008;
 bh=qQ8B2+JjyFfENjCIh655uy/Q7qx2PstxkOlbD7SRpts=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kcch4E0ku/Sn02/8RONr3V0CP5WyjhAEwJu+r+XXiA2JAMk/WuHFn9txaQXKnqE7N
 xLZmLcPofYt9felRG+Gy/f5Um+BiDKwhusW9stU98m+nT37A4fW34Ev30bhvfPHUqT
 w0Q2UJodZQDwYlDVjeVYNb9yc0oligVY6mubWE/idrOfTBxlaPBounDYu0cSpZDxv8
 PsiQoc5rKNO1OoPRl3/CNs0AoWHlJoCm/wAGXkqCzwbDkjoz4ejEXKRVFM/z52d6R3
 +kyITdN5kdMxzUI3B50eRskEMd4jW3E4TIFwvbpQ1iQ4JbSoEN9SqySjP9hdm0pGvF
 6ePpocbJqLApg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 06/10] powerpc/configs/skiroot: Update for symbol movement
 only
Date: Tue, 21 Jan 2020 15:29:56 +1100
Message-Id: <20200121043000.16212-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121043000.16212-1-mpe@ellerman.id.au>
References: <20200121043000.16212-1-mpe@ellerman.id.au>
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

v2: No change.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 0aa060eef06c..24a210fe0049 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -1,8 +1,3 @@
-CONFIG_PPC64=y
-CONFIG_ALTIVEC=y
-CONFIG_VSX=y
-CONFIG_NR_CPUS=2048
-CONFIG_CPU_LITTLE_ENDIAN=y
 CONFIG_KERNEL_XZ=y
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
@@ -29,16 +24,11 @@ CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_SLAB_FREELIST_HARDENED=y
-CONFIG_JUMP_LABEL=y
-CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_SIG=y
-CONFIG_MODULE_SIG_FORCE=y
-CONFIG_MODULE_SIG_SHA512=y
-CONFIG_PARTITION_ADVANCED=y
-# CONFIG_MQ_IOSCHED_DEADLINE is not set
-# CONFIG_MQ_IOSCHED_KYBER is not set
+CONFIG_PPC64=y
+CONFIG_ALTIVEC=y
+CONFIG_VSX=y
+CONFIG_NR_CPUS=2048
+CONFIG_CPU_LITTLE_ENDIAN=y
 # CONFIG_PPC_VAS is not set
 # CONFIG_PPC_PSERIES is not set
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
@@ -49,14 +39,24 @@ CONFIG_KEXEC=y
 CONFIG_PRESERVE_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_NUMA=y
-# CONFIG_COMPACTION is not set
-# CONFIG_MIGRATION is not set
 CONFIG_PPC_64K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
 # CONFIG_SECCOMP is not set
 # CONFIG_PPC_MEM_KEYS is not set
+CONFIG_JUMP_LABEL=y
+CONFIG_STRICT_KERNEL_RWX=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_SIG=y
+CONFIG_MODULE_SIG_FORCE=y
+CONFIG_MODULE_SIG_SHA512=y
+CONFIG_PARTITION_ADVANCED=y
+# CONFIG_MQ_IOSCHED_DEADLINE is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_COMPACTION is not set
+# CONFIG_MIGRATION is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -153,7 +153,6 @@ CONFIG_IGB=m
 CONFIG_IXGB=m
 CONFIG_IXGBE=m
 CONFIG_I40E=m
-CONFIG_S2IO=m
 # CONFIG_NET_VENDOR_MARVELL is not set
 CONFIG_MLX4_EN=m
 # CONFIG_MLX4_CORE_GEN2 is not set
@@ -164,6 +163,7 @@ CONFIG_MLX5_CORE_EN=y
 # CONFIG_NET_VENDOR_MICROSEMI is not set
 CONFIG_MYRI10GE=m
 # CONFIG_NET_VENDOR_NATSEMI is not set
+CONFIG_S2IO=m
 # CONFIG_NET_VENDOR_NETRONOME is not set
 # CONFIG_NET_VENDOR_NI is not set
 # CONFIG_NET_VENDOR_NVIDIA is not set
@@ -271,6 +271,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_ENCRYPTED_KEYS=y
+# CONFIG_CRYPTO_HW is not set
 CONFIG_CRC16=y
 CONFIG_CRC_ITU_T=y
 CONFIG_LIBCRC32C=y
@@ -289,8 +291,6 @@ CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=y
 CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
-# CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_XMON=y
 CONFIG_XMON_DEFAULT=y
-CONFIG_ENCRYPTED_KEYS=y
-# CONFIG_CRYPTO_HW is not set
+# CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.21.1

