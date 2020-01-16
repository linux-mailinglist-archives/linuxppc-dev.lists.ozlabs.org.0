Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347D13D1D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:03:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynYD1qhyzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:03:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCG0l5qzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dc3eEn9B; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCF4rwmz9sRX; Thu, 16 Jan 2020 12:48:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCF2hQYz9sRY; Thu, 16 Jan 2020 12:48:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139289;
 bh=cepm8rI7GxHcik1XRKwbC6NfQVITr02FRjy8Ahsf5As=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dc3eEn9B+P0scOdsqHFzFEBzgZYsiYPnmzSfdX6a3d0XbEde90sjsN8VxaYBQBJ4a
 9WwJ5isbEh2JJHx8ZvgjhmvsmXwb4V8WcVF2S1KiXtD0rv6TQTfbGqRHjWHa5K5gLa
 DSM2s3V5CBRL53pgLkHsqQxYq4dYgqvhOahSL45I6R9YX6eMIdhR0rYJmcl5GX19qu
 qnz1DNkqQSpBq/59h/K92fxYOWsuXVslpknn1nf99TMC8fS5ei/jCxb94W+mfDOWto
 cEZMchEpDh9qLblRd1GEQRaZNyA9syuvvd5n9rVrO+lNc85YRhLbVzIRgaYAd/lO0F
 9wOn3VWT2+9KQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [RFC PATCH 8/9] powerpc/configs/skiroot: Disable xmon default &
 enable reboot on panic
Date: Thu, 16 Jan 2020 11:48:07 +1000
Message-Id: <20200116014808.15756-8-mpe@ellerman.id.au>
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

If the skiroot kernel crashes we don't want it sitting at an xmon
prompt forever. Instead it's more helpful to reboot and bring the
boot loader back up, and if the crash was transient we can then boot
successfully.

Similarly if we panic we should reboot, with a short timeout in case
someone is watching the console.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index bd661a9a9410..12c96c8b0c1d 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -29,6 +29,7 @@ CONFIG_ALTIVEC=y
 CONFIG_VSX=y
 CONFIG_NR_CPUS=2048
 CONFIG_CPU_LITTLE_ENDIAN=y
+CONFIG_PANIC_TIMEOUT=30
 # CONFIG_PPC_VAS is not set
 # CONFIG_PPC_PSERIES is not set
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
@@ -293,6 +294,7 @@ CONFIG_LIBCRC32C=y
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_STACKOVERFLOW=y
+CONFIG_PANIC_ON_OOPS=y
 CONFIG_SOFTLOCKUP_DETECTOR=y
 CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
 CONFIG_HARDLOCKUP_DETECTOR=y
@@ -301,5 +303,4 @@ CONFIG_WQ_WATCHDOG=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_FTRACE is not set
 CONFIG_XMON=y
-CONFIG_XMON_DEFAULT=y
 # CONFIG_RUNTIME_TESTING_MENU is not set
-- 
2.21.1

