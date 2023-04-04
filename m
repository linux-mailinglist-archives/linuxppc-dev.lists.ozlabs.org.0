Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0656D5D7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 12:29:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PrPCG35YVz3cLf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Apr 2023 20:29:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A7nifk1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PrPBM3nGyz3brQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Apr 2023 20:28:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=A7nifk1k;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PrPBJ5WTrz4x1N;
	Tue,  4 Apr 2023 20:28:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680604139;
	bh=8o2+RFgNk7wyDy11vu39SRy4hjDn2gnyBl4n5abjTwI=;
	h=From:To:Cc:Subject:Date:From;
	b=A7nifk1kfEvS33UdTDBn/+ASOWdtcDwvPfFymDW3ssxupISW6nISIxZWYlIaUFzMX
	 ugpK9Tt5TQhb3Cu04glk9YwSzXHC+qv6wQtXVHLwh+GfPaJ1QUW6/Sllmvy08Xll0j
	 E5mcdgVkg253/0l/66LtTIrTIIGZRql9GV5Gb6Smflq1dtrWr5bXgZZwGIeEqXibEv
	 mkhhOkmA/l+P5PX4H9bIUzycZJ+ihHqOYNw/zZHZeHWam7safymyTKwP7gHPhqJwcO
	 vZiAVfLsALk/zcQfPwOBGyNHTBBhVU8bIzJ199WSFgOfCScoa7NsmPdZXRi26AdseZ
	 pB7lFKnCgcbzg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Always build with 128-bit long double
Date: Tue,  4 Apr 2023 20:28:47 +1000
Message-Id: <20230404102847.3303623-1-mpe@ellerman.id.au>
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
Cc: dan@danny.cz, daniel@octaforge.org, amd-gfx@lists.freedesktop.org, tpearson@raptorengineering.com, alexdeucher@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The amdgpu driver builds some of its code with hard-float enabled,
whereas the rest of the kernel is built with soft-float.

When building with 64-bit long double, if soft-float and hard-float
objects are linked together, the build fails due to incompatible ABI
tags.

In the past there have been build errors in the amdgpu driver caused by
this, some of those were due to bad intermingling of soft & hard-float
code, but those issues have now all been fixed since commit c92b7fe0d92a
("drm/amd/display: move remaining FPU code to dml folder").

However it's still possible for soft & hard-float objects to end up
linked together, if the amdgpu driver is built-in to the kernel along
with the test_emulate_step.c code, which uses soft-float. That happens
in an allyesconfig build.

Currently those build errors are avoided because the amdgpu driver is
gated on 128-bit long double being enabled. But that's not a detail the
amdgpu driver should need to be aware of, and if another driver starts
using hard-float the same problem would occur.

All versions of the 64-bit ABI specify that long-double is 128-bits.
However some compilers, notably the kernel.org ones, are built to use
64-bit long double by default.

Apart from this issue of soft vs hard-float, the kernel doesn't care
what size long double is. In particular the kernel using 128-bit long
double doesn't impact userspace's ability to use 64-bit long double, as
musl does.

So always build the 64-bit kernel with 128-bit long double. That should
avoid any build errors due to the incompatible ABI tags. Excluding the
code that uses soft/hard-float, the vmlinux is identical with/without
the flag.

It does mean any code which is incorrectly intermingling soft &
hard-float code will build without error, so those bugs will need to be
caught by testing rather than at build time.

For more background see:
  - commit d11219ad53dc ("amdgpu: disable powerpc support for the newer display engine")
  - commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
  - https://lore.kernel.org/r/dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig                | 4 ----
 arch/powerpc/Makefile               | 1 +
 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index fc4e81dafca7..3fb2c2766139 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -291,10 +291,6 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 
-config PPC_LONG_DOUBLE_128
-	depends on PPC64 && ALTIVEC
-	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
-
 config PPC_BARRIER_NOSPEC
 	bool
 	default y
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 12447b2361e4..4343cca57cb3 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -133,6 +133,7 @@ endif
 endif
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
+CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mlong-double-128)
 
 # Clang unconditionally reserves r2 on ppc32 and does not support the flag
 # https://bugs.llvm.org/show_bug.cgi?id=39555
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 0c9bd0a53e60..e36261d546af 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_DCN if (X86 || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
-- 
2.39.2

