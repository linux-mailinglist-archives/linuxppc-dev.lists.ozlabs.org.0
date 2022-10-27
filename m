Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5602560F83A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 14:57:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mym103N2Wz3c9W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 23:57:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=INXg7ii+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mym025vpnz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 23:56:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=INXg7ii+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mym015562z4x1F;
	Thu, 27 Oct 2022 23:56:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1666875393;
	bh=+EYbyPSgzEElsdqpiTCQ7j7z8RziurzNzn63oMBao2c=;
	h=From:To:Subject:Date:From;
	b=INXg7ii+6VU6CFAvyA2Cn1Ks0+LX7axbNbL7Adf1I1xTi0hJsoXC1pVvtE5jVh2P6
	 5vJ0xwVgsdzfHp3mtAA9VIDgTXI2TMqa/KY9BXBcrTEe2rGI6QapHmLfJTMv63ZSIa
	 Nb2gmpCotMr9PvIFuc9H1bHroXW+0gFhhcLxOUDMD94RFJU1HNNpD6rx0RL1JcAQYl
	 YRiPBO5pbauNZukM2QCh1HSIk98p72Bq0+7FmO9YKm1dU+L3liJ4j9Qx0z5Ylvd44Z
	 1yUwAFN2JJOzdJ0eCMTrooTZzt4WUNsXGpMnc7/iSuVJKo/jMOGPDykfVDNb6vfDfC
	 GYzd89G5dKOzA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64e: Fix amdgpu build on Book3E w/o AltiVec
Date: Thu, 27 Oct 2022 23:56:26 +1100
Message-Id: <20221027125626.1383092-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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

There's a build failure for Book3E without AltiVec:
  Error: cc1: error: AltiVec not supported in this target
  make[6]: *** [/linux/scripts/Makefile.build:250:
  drivers/gpu/drm/amd/amdgpu/../display/dc/dml/display_mode_lib.o] Error 1

This happens because the amdgpu build is only gated by
PPC_LONG_DOUBLE_128, but that symbol can be enabled even though AltiVec
is disabled.

The only user of PPC_LONG_DOUBLE_128 is amdgpu, so just add a dependency
on AltiVec to that symbol to fix the build.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 699df27b0e2f..20fb1765238c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -285,7 +285,7 @@ config PPC
 	#
 
 config PPC_LONG_DOUBLE_128
-	depends on PPC64
+	depends on PPC64 && ALTIVEC
 	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
 
 config PPC_BARRIER_NOSPEC
-- 
2.37.3

