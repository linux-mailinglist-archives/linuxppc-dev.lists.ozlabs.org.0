Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33489143646
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:41:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wpb1cwPzDqJh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:41:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYt1JKnzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o+wOOh3+; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYs5Fd6z9sSG; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYs3Jncz9sS9; Tue, 21 Jan 2020 15:30:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581009;
 bh=YAdv2XcaqGX82QlkjYlHfG/GD/DMm/XSMSPJlcgl+Ck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o+wOOh3+7wsJhxKo2oy9OcWAPNqUJtqLi6+BH/4pXTb4lj3gmqxDbJ9a8K88Na3UG
 r11LWHoQCQIsb2jGo5WuSRSNwFSiWsk9EaDXrCLoozf1YKYkvpyGzHCe6UpO3AqCUu
 wLjQUUG+T5KUv8y1F4rZ4uRurtrAwWrMlFIQ1v1Iol1TBwJ9suF7Zhm2NcdfTCgRfB
 flmfX1Sk9gEZGh1XBeJUdt/iDoQF4Ny0aDzr/GUoh0nIzmarAX2CzRPoNpS9O0bu4b
 1twKVv9r0qQ82n5MB0wKtJY0+3+ZiN7rIDr3GMEhTo+JtTHs0QaUTUzehTJ8MkJBZR
 I6rz8N4KkycvQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 07/10] powerpc/configs/skiroot: Enable security features
Date: Tue, 21 Jan 2020 15:29:57 +1100
Message-Id: <20200121043000.16212-7-mpe@ellerman.id.au>
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

From: Joel Stanley <joel@jms.id.au>

This turns on HARDENED_USERCOPY with HARDENED_USERCOPY_PAGESPAN, and
FORTIFY_SOURCE.

It also enables SECURITY_LOCKDOWN_LSM with _EARLY and
LOCK_DOWN_KERNEL_FORCE_INTEGRITY options enabled. This still allows
xmon to be used in read-only mode.

MODULE_SIG is selected by lockdown, so it is still enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
[mpe: Switch to lockdown integrity mode per oohal]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

v2: Switch to lockdown integrity mode rather than confidentiality as noticed by
dja and discussed with jms and oohal.

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 24a210fe0049..93b478436a2b 100644
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
+CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY=y
+# CONFIG_INTEGRITY is not set
+CONFIG_LSM="yama,loadpin,safesetid,integrity"
 # CONFIG_CRYPTO_HW is not set
 CONFIG_CRC16=y
 CONFIG_CRC_ITU_T=y
-- 
2.21.1

