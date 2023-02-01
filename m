Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EF2686E73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 19:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6WNp1Z9gz3f37
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 05:56:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=octaforge.org header.i=@octaforge.org header.a=rsa-sha256 header.s=fm2 header.b=INv99Zfk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EIFs4VgE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=octaforge.org (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=daniel@octaforge.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=octaforge.org header.i=@octaforge.org header.a=rsa-sha256 header.s=fm2 header.b=INv99Zfk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EIFs4VgE;
	dkim-atps=neutral
X-Greylist: delayed 518 seconds by postgrey-1.36 at boromir; Thu, 02 Feb 2023 05:55:49 AEDT
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6WMn5Gl0z3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 05:55:49 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 65AF732009A4;
	Wed,  1 Feb 2023 13:47:05 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute2.internal (MEProxy); Wed, 01 Feb 2023 13:47:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=octaforge.org;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1675277225; x=1675363625; bh=7qEMG9ZI2llbvFtAMUYr2ItZhnmpvWaxYO+
	71EGMdzc=; b=INv99ZfkWeItyE83F/cX5lbDa2hjkXEdlwtAqoGOo2YFcZPgKNQ
	r3dvd+0D7UhuRYE8uADdtb1w72J1xLAI8bdgg24ovVxJuVBdffpmanFIO1bLCHNT
	U35VCa89dHtB+35WaQxfafXbLf9v5tXa3Hvtp/ZOrX23Z+KKm8lvYWHHsk/uomip
	CL/06w4f9odcQdRhdscvVyQqxjUpc95jGfDyMTSNxFuTI2W2bQ44DHrKgaXauUgf
	IVZi6ZUiPGmT9Lt388eaXDNZBB4S4HeuOGxL+QSE9/ZH2E7AwfnLhwlcUCSBwaNq
	DuPlnsZxw7HRK3813Spvo1KZDRxB01e9fKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1675277225; x=
	1675363625; bh=7qEMG9ZI2llbvFtAMUYr2ItZhnmpvWaxYO+71EGMdzc=; b=E
	IFs4VgEvQNXkmEOTFPnGKMlAz/4XRrlwMdqNNXdqfSxUAzZg/gxm4ftANR6jrX24
	QSz99s8UVdPVFmPBHn3UIVMWTQ/+c7AEy2/+zZuWxuurZjP+ZtTtuZBdKCr+20pN
	J0DldCvDRdE0FGmPIA8LEymr9LUTwl7Um1XBfkuswZBsNfvc75HXDE3SKlCDn2zN
	XKnxebg9u882KhBDI1xAGFMVMoHlRt/0jf3GdKmGBgnaRmWQuxw3qGJSDV8J/vt4
	cEpGg9Y9SFxU7n6Kr6K5eK3P1/LR7jFUl/QCT6BHKKHzRz24JyW0i5H7SaXMHYgm
	4qVRwv9842uZ0wrc9t4Uw==
X-ME-Sender: <xms:qLPaY9hRz_-HPuOvvWMGeQezLKvSPLgzMuBYOOuPIjF2b7BEyarupA>
    <xme:qLPaYyAF5DmxUDZs75Y8yMFFEk_7PpxmWaWlUJG4cxelW5ixCaJO-LHpaeQgIMh3t
    84DDyy0rFq6VLfSrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefiedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvfevufgtsehttd
    ertderredtnecuhfhrohhmpedfffgrnhhivghlucfmohhlvghsrgdfuceouggrnhhivghl
    sehotghtrghfohhrghgvrdhorhhgqeenucggtffrrghtthgvrhhnpeetfeeifedvudegff
    elheefleffveejvdetteeljeeihfekheevledttdelteejjeenucffohhmrghinhepfhhr
    vggvuggvshhkthhophdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrnhhivghlsehotghtrghfohhr
    ghgvrdhorhhg
X-ME-Proxy: <xmx:qLPaY9FGkfPXSt7cYWjNPSphPkMtqlbagB6yCc62nXufqf5gLMxApA>
    <xmx:qLPaYyRZCgZFQBzLnhpNr0pZEFf0dfF628rBS8Alf_RY_NSNAwMBgg>
    <xmx:qLPaY6wQ8n9o7uFiSArpRjqqJJKlSJPd33uWbD1uyfGelxIRz_FB2Q>
    <xmx:qbPaY0vNEraNqzC4aLXChoFslb-jCmr8AbzwC-1C0w2_wWsKFP0Uuw>
Feedback-ID: ib9f842dd:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 70EDDA6007C; Wed,  1 Feb 2023 13:47:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-107-g82c3c54364-fm-20230131.002-g82c3c543
Mime-Version: 1.0
Message-Id: <dab9cbd8-2626-4b99-8098-31fe76397d2d@app.fastmail.com>
Date: Wed, 01 Feb 2023 19:46:07 +0100
From: "Daniel Kolesa" <daniel@octaforge.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] drm/amdgpu: drop the long-double-128 powerpc check/hack
Content-Type: text/plain
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
Cc: dan@danny.cz, stable@vger.kernel.org, tpearson@raptorengineering.com, amd-gfx@lists.freedesktop.org, alexdeucher@gmail.com, torvalds@linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit c653c591789b ("drm/amdgpu: Re-enable DCN for 64-bit powerpc")
introduced this check as a workaround for the driver not building
with toolchains that default to 64-bit long double.

The reason things worked on 128-bit-long-double toolchains and
not otherwise was however largely accidental. The real issue was
that some files containing floating point code were compiled
without -mhard-float, while others were compiled with -mhard-float.

The PowerPC compilers tag object files that use long doubles with
a special ABI tag in order to differentiate 64-bit long double,
IBM long double and IEEE 128-bit long double. When no long double
is used in a source file, the file does not receive the ABI tag.
Since only regular doubles are used in the AMDGPU source, there
is no ABI tag on the soft-float object files with 128-bit-ldbl
compilers, and therefore no error. With 64-bit long double,
the double and long double types are equal, and an ABI tag is
introduced.

Of course, this resulted in the real bug, which was mixing of
hard and soft float object files, getting hidden, which makes
this check technically incorrect.

Since then, work has been done to ensure that all float code is
separately compiled. This was also necessary in order to enable
AArch64 support in the display stack, as AArch64 does not have any
soft-float ABI, and all code that does not explicitly conatain
floats is compiled with -mgeneral-regs-only, which prevents
float-using code from being compiled at all. That means AArch64
support will from now on always safeguard against such cases
happening ever again.

In mainline, this work is now fully done, so this check is fully
redundant and does not do anything except preventing AMDGPU DC
from being built on systems such as those using musl libc. The
last piece of work to enable this was commit c92b7fe0d92a
("drm/amd/display: move remaining FPU code to dml folder")
and this has since been backported to 6.1 stable (in 6.1.7).

Relevant issue: https://gitlab.freedesktop.org/drm/amd/-/issues/2288

Signed-off-by: Daniel Kolesa <daniel@octaforge.org>
---
 arch/powerpc/Kconfig                | 4 ----
 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56b..267805072 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -289,10 +289,6 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 
-config PPC_LONG_DOUBLE_128
-	depends on PPC64 && ALTIVEC
-	def_bool $(success,test "$(shell,echo __LONG_DOUBLE_128__ | $(CC) -E -P -)" = 1)
-
 config PPC_BARRIER_NOSPEC
 	bool
 	default y
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 2efe93f74..94645b6ef 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_DCN if (X86 || PPC_LONG_DOUBLE_128 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_DCN if (X86 || PPC64 || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
-- 
2.34.1
