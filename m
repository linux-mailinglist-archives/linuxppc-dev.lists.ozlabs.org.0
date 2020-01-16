Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F9F13D1C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 02:59:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynSb3nG0zDqRN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCD2cTrzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Dl6xiek+; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCD1BgMz9sR0; Thu, 16 Jan 2020 12:48:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCD0CTGz9sRQ; Thu, 16 Jan 2020 12:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139288;
 bh=rgOENX0Qw1x/DPxqlvnAjiQFFxeZ90iSbQwsDiRPMbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dl6xiek+GNB2mBrc55UcUFpsFWS8vaSmavKn0czmRsJZ21nENoMg/upVVKzP9VLNt
 PHT71YYHe/rdjYuoNf1YNA6A3FntTQvV87eLw4RN4nhkvHm9MTEftGNrTwtoTX/RMG
 ZjpmeOuaZi2nXbyroNIegL8wNwPu4IosKxTRz8fu2l22C4NPmONPhbIrAyPxAevmle
 VLNLlobQhpKr839fJ+WjeQIUiyokvNw7L7/v6WTZfFrjqMZIhMEkM5QIGYBow/1cfY
 kT5HXCUF1MJwSrX54aYBfglsmU2SiQycMoVd7QOJeW3MVI+rZzIrsyPVBUnQ2hLJWF
 4yZX5mHX1JwDQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 6/9] powerpc/configs/skiroot: Update for symbol movement only
Date: Thu, 16 Jan 2020 11:48:05 +1000
Message-Id: <20200116014808.15756-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200116014808.15756-1-mpe@ellerman.id.au>
References: <20200116014808.15756-1-mpe@ellerman.id.au>
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
Cc: joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 42 +++++++++++++-------------
 1 file changed, 21 insertions(+), 21 deletions(-)

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

