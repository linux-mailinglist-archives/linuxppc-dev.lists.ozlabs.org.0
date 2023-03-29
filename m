Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0756CF799
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 01:44:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pn36X0BxPz3fDd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 10:44:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dm5Hb/Vx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pn35h2vWqz3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 10:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dm5Hb/Vx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pn35Z57Rjz4x1f;
	Thu, 30 Mar 2023 10:43:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680133394;
	bh=yL6sheNfmJiAMfPNvjxMB9otWgyf6nSm6hVa3FOEEAg=;
	h=From:To:Subject:Date:From;
	b=dm5Hb/VxjgyT4uqxAfUwVRX2rsuWlQu/MAnXd6Ssstdq9aElUT+1734PFbOnRdwnC
	 oxABUI+27RefMBZITxv4JwgiI1mnrselG7nW6wkN6U010ikGBftyvdg+pvBUEMx3Jl
	 jce1RjAlz4P2mkeJMUM9PUtKOc/kRsZ68Co01O5ZKVHEzgV2c5sVe//tpS4KBtmQB/
	 9ERwkxYC3KqFKQ17Oc+9PEHXVrx/68ATAyncB246WHJ4Tr86XS8UpS4wsE19s+Oqi0
	 eX7b7B5zE/2uioiuqm9Z093zhFS4EJDmqTeoTWVV7B7PcuTVY9c18xn85Zup/Tjxne
	 di/UKtYL/O6+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64s: Move CPU -mtune options into Kconfig
Date: Thu, 30 Mar 2023 10:43:08 +1100
Message-Id: <20230329234308.2215833-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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

Currently the -mtune options are set in the Makefile, depending on what
the compiler supports.

One downside of doing it that way is that the chosen -mtune option is
not recorded in the .config.

Another downside is that if there's ever a need to do more complicated
logic to calculate the correct option, that gets messy in the Makefile.

So move the determination of which -mtune option to use into Kconfig
logic.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                  | 4 +---
 arch/powerpc/platforms/Kconfig.cputype | 7 +++++++
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 87d6ac27eebd..779956007f0c 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -156,9 +156,7 @@ endif
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 AFLAGS-$(CONFIG_TARGET_CPU_BOOL) += -mcpu=$(CONFIG_TARGET_CPU)
 
-CFLAGS-$(CONFIG_POWERPC64_CPU) += $(call cc-option,-mtune=power10,	\
-				  $(call cc-option,-mtune=power9,	\
-				  $(call cc-option,-mtune=power8)))
+CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 046b571496b1..76d6daa6c79d 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -273,6 +273,13 @@ config TARGET_CPU
 	default "e500mc" if E500MC_CPU
 	default "powerpc" if POWERPC_CPU
 
+config TUNE_CPU
+	string
+	depends on POWERPC64_CPU
+	default "-mtune=power10" if $(cc-option,-mtune=power10)
+	default "-mtune=power9"  if $(cc-option,-mtune=power9)
+	default "-mtune=power8"  if $(cc-option,-mtune=power8)
+
 config PPC_BOOK3S
 	def_bool y
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
-- 
2.39.2

