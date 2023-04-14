Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A266E2442
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyckB3pwLz3fYN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:29:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AWoMtNqW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccm0FMKz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AWoMtNqW;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccl6Dw2z4xGk;
	Fri, 14 Apr 2023 23:24:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478695;
	bh=nL1aTs8MooA2u7vnfU0mo6JG0/lCILiuwWtU21svkaU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AWoMtNqW3j+l7rYzGEaIIQ8GhSU8cqtgKMHVj8qneq/9cvLNk+/Pz2rjJPoA7TiXA
	 1/aqs7yk5DacOapdH0nzQg8JIxUuMPBkS5Sy/07aSDdUmsrQ2xattjBD6CSieSQeGW
	 iX7FxmNuaUqKl7RzPhrNvhc3EX21tpAF+3vuDOVI2P6Ps3J1iDeiTGIAc2M06bOoDf
	 GPRp35fD/+UzuG9rKDXMys/GNAtEYy6SkAxU8EVBwZA341z1Y4aSZiO12lSd5vXzzB
	 HeBxk6G7J6nCia12HmUwMWFY15TL9PFuWnDPE6eGA4SO+A1IzDeXOLm/fECmkT3UAC
	 PaUG+vcvncmlg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 06/32] powerpc/configs/64s: Add secure boot options to defconfig
Date: Fri, 14 Apr 2023 23:23:49 +1000
Message-Id: <20230414132415.821564-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the numerous options required to get secure boot enabled.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index d98fe52a5892..f185adc128db 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -54,6 +54,7 @@ CONFIG_CRASH_DUMP=y
 CONFIG_FA_DUMP=y
 CONFIG_IRQ_ALL_CPUS=y
 CONFIG_SCHED_SMT=y
+CONFIG_PPC_SECURE_BOOT=y
 CONFIG_VIRTUALIZATION=y
 CONFIG_KVM_BOOK3S_64=m
 CONFIG_KVM_BOOK3S_64_HV=m
@@ -335,13 +336,25 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
+CONFIG_SECURITY=y
+CONFIG_SECURITY_LOCKDOWN_LSM=y
+CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
+CONFIG_INTEGRITY_SIGNATURE=y
+CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
+CONFIG_INTEGRITY_PLATFORM_KEYRING=y
+CONFIG_IMA=y
+CONFIG_IMA_KEXEC=y
+CONFIG_IMA_DEFAULT_HASH_SHA256=y
+CONFIG_IMA_WRITE_POLICY=y
+CONFIG_IMA_APPRAISE=y
+CONFIG_IMA_ARCH_POLICY=y
+CONFIG_IMA_APPRAISE_MODSIG=y
 CONFIG_CRYPTO_TEST=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_SERPENT=m
 CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
@@ -352,6 +365,8 @@ CONFIG_CRYPTO_SHA1_PPC=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
+CONFIG_SYSTEM_TRUSTED_KEYRING=y
+CONFIG_SYSTEM_BLACKLIST_KEYRING=y
 CONFIG_PRINTK_TIME=y
 CONFIG_PRINTK_CALLER=y
 CONFIG_DEBUG_KERNEL=y
-- 
2.39.2

