Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BC213D1D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 03:01:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ynW111VbzDqTM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 13:01:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ynCF3w9HzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nMIzaJOe; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 47ynCD6ksBz9sR4; Thu, 16 Jan 2020 12:48:08 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ynCD4nnXz9sR0; Thu, 16 Jan 2020 12:48:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579139288;
 bh=2e6Omzpo1o/8wnYEfQnrz1kDbLoI3dZOCu5krbBBLwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nMIzaJOeKpCzjZqGjyJ0QAxSNsnnzOmIsu5P1Faax+pEil4MF1l+PuvxSeAVeG+H7
 jNsnwzeqzCvoJucGezWD4lhlGiaplAX4obAHrq1NF3mccYVhS5vcVAIvFr3/gfXsRX
 gQb2FC2T5XoMbU5mF+8yzLI59ZBDbDJUMjQHuiQoO8oCHruSbToqgdzeNFq5o0ghZs
 5uEEwrAhi0jPvAgQOzI6ivbCwI2N54Lg4J+1n+MqkdB+bnbphF808wxBxA+jvKvMPc
 lC8ealgf6meihBMSeZhhKB4ZWW8SV1upq3hEbFy6lHH/jQRUJSBfs97V7ICxhRDZzm
 lXH/ZOnaz2WqQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 7/9] powerpc/configs/skiroot: Enable security features
Date: Thu, 16 Jan 2020 11:48:06 +1000
Message-Id: <20200116014808.15756-7-mpe@ellerman.id.au>
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

From: Joel Stanley <joel@jms.id.au>

This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
FORTIFY_SOURCE.

It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY options enabled.

MODULE_SIG is selected by lockdown, so it is still enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 24a210fe0049..bd661a9a9410 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -49,7 +49,6 @@ CONFIG_JUMP_LABEL=y
 CONFIG_STRICT_KERNEL_RWX=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
-CONFIG_MODULE_SIG=y
 CONFIG_MODULE_SIG_FORCE=y
 CONFIG_MODULE_SIG_SHA512=y
 CONFIG_PARTITION_ADVANCED=y
@@ -272,6 +271,16 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_ENCRYPTED_KEYS=y
+CONFIG_SECURITY=y
+CONFIG_HARDENED_USERCOPY=y
+# CONFIG_HARDENED_USERCOPY_FALLBACK is not set
+CONFIG_HARDENED_USERCOPY_PAGESPAN=y
+CONFIG_FORTIFY_SOURCE=y
+CONFIG_SECURITY_LOCKDOWN_LSM=y
+CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
+CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
+# CONFIG_INTEGRITY is not set
+CONFIG_LSM="yama,loadpin,safesetid,integrity"
 # CONFIG_CRYPTO_HW is not set
 CONFIG_CRC16=y
 CONFIG_CRC_ITU_T=y
-- 
2.21.1

