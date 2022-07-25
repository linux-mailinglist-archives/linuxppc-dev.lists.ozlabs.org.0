Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9AB57FF1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:40:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls04m5xxyz3c9p
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:40:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cckJ3ie6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls04B3Nk4z2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:39:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cckJ3ie6;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ls0490wGkz4xFw;
	Mon, 25 Jul 2022 22:39:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658752794;
	bh=eSOLGSxxYNa3xROdrcKx9ie20r/UPvDadRCttEkmp6M=;
	h=From:To:Cc:Subject:Date:From;
	b=cckJ3ie61VXTZuA+PJMocDjxpnWF/WYCTpYuoWoOZeNNZaoeifq0LXqGf7YfGv8KV
	 0TDZTeNx2uzQaJ0HAGCc1XIsbOf0FbumYT/OqzSWsOvTgaJaS3wQCNgt+3o++wbozi
	 0FNLgy7uWSdbgZjGtjtOcccfDNzNjcMDbm8eQ4jjWYeTWUMVT4G8YPIfoEKhu0NoEv
	 VJPEv55b50XmApiJGBght5zqEYINJ2rMkGXGpkVicV/bxOBAzEgfxjbAZba/b1/tTZ
	 hJddKbV/AOcUWV9sOIDm64SauKpGxUAMKlHViu1zvBLGdfHbK+G3eT6u+02vkWEWMW
	 ZwPIaX3/+pRkA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] drm/amdgpu: Re-enable DCN for 64-bit powerpc
Date: Mon, 25 Jul 2022 22:39:18 +1000
Message-Id: <20220725123918.1903255-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: dan@danny.cz, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com, torvalds@linux-foundation.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit d11219ad53dc ("amdgpu: disable powerpc support for the newer
display engine") disabled the DCN driver for all of powerpc due to
unresolved build failures with some compilers.

Further digging shows that the build failures only occur with compilers
that default to 64-bit long double.

Both the ppc64 and ppc64le ABIs define long double to be 128-bits, but
there are compilers in the wild that default to 64-bits. The compilers
provided by the major distros (Fedora, Ubuntu) default to 128-bits and
are not affected by the build failure.

There is a compiler flag to force 128-bit long double, which may be the
correct long term fix, but as an interim fix only allow building the DCN
driver if long double is 128-bits by default.

The bisection in commit d11219ad53dc must have gone off the rails at
some point, the build failure occurs all the way back to the original
commit that enabled DCN support on powerpc, at least with some
toolchains.

Depends-on: d11219ad53dc ("amdgpu: disable powerpc support for the newer display engine")
Fixes: 16a9dea110a6 ("amdgpu: Enable initial DCN support on POWER")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2100
---
 arch/powerpc/Kconfig                | 4 ++++
 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

Alex, are you OK if I take this via the powerpc tree for v5.19?

cheers

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 7aa12e88c580..287cc2d4a4b3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -281,6 +281,10 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 
+config PPC_LONG_DOUBLE_128
+	depends on PPC64
+	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
+
 config PPC_BARRIER_NOSPEC
 	bool
 	default y
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 0ba0598eba20..ec6771e87e73 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -6,7 +6,7 @@ config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
 	select SND_HDA_COMPONENT if SND_HDA_CORE
-	select DRM_AMD_DC_DCN if X86 && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
+	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128) && !(KCOV_INSTRUMENT_ALL && KCOV_ENABLE_COMPARISONS)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
-- 
2.35.3

