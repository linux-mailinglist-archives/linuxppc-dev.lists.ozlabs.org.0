Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CE16A835D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 14:19:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSBWp05hwz30Ky
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 00:19:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SvrbGhac;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSBTq4h9nz3cMh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 00:17:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SvrbGhac;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PSBTp5dcqz4x1d;
	Fri,  3 Mar 2023 00:17:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1677763038;
	bh=MifMs1bYypPRVegWJmGbBMcmeEdR8W68yonET0zBtlA=;
	h=From:To:Cc:Subject:Date:From;
	b=SvrbGhactm4hGihZSENvYpT3ku+abvNzD3dgrGhh6vKIkL8Wnv71oDhr/TYLiwg/b
	 goLE+dyyzOwo5XJRBybL2yuI3Zc4IgZXnZUYufbUKntx/7UtmnS5oDVH3LCBgxRWoa
	 zz+HNAY4t9PigfOMBHVmu6jo5ueFtRqFQ6XiUrzejuoGZ5j7oMgRqu2eoV5x8kDwQ+
	 fN7/l9PIa6XVeV9GvcLXDeFMcWvnLLFK8Hv0M9oCbRpfa38OD1INNrsEMCrJDqTKxs
	 kpgL5nMFKYOqXd0hjtQwKNSYQzm9WUTu8jwr0DR1/LX245tAFIucho2aMvZ0wA3GYk
	 B+1Eb3pbxcVwA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/64: Move CPU -mtune options into Kconfig
Date: Fri,  3 Mar 2023 00:16:55 +1100
Message-Id: <20230302131656.50626-1-mpe@ellerman.id.au>
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
Cc: nathan@kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the -mtune options are set in the Makefile, depending on what
is the compiler supports.

One downside of doing it that way is that the chosen -mtune option is
not recorded in the .config.

Another downside is that doing more complicated logic to calculate the
correct option gets messy in the Makefile.

So move the determination of which -mtune option to use into Kconfig
logic.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                  | 4 +---
 arch/powerpc/platforms/Kconfig.cputype | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

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
index 046b571496b1..7d7477b73951 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -273,6 +273,12 @@ config TARGET_CPU
 	default "e500mc" if E500MC_CPU
 	default "powerpc" if POWERPC_CPU
 
+config TUNE_CPU
+	string
+	default "-mtune=power10" if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power10)
+	default "-mtune=power9"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power9)
+	default "-mtune=power8"  if POWERPC64_CPU && CC_IS_GCC   && $(cc-option,-mtune=power8)
+
 config PPC_BOOK3S
 	def_bool y
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64
-- 
2.39.2

