Return-Path: <linuxppc-dev+bounces-2733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4D79B6C47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 19:41:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xdwvl3jC0z2xrb;
	Thu, 31 Oct 2024 05:41:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730313715;
	cv=none; b=i5joghBnOOmUjY4b99s40EiocyXcvxF3b4BVsheG3E/v6/NBC54c9RmIw5378HJtTsv6M4fCePzn/70eZ6BG8oPekt7dF2+zKOpP2ySf71bh1eYWPH9u3qKcFqsFb0QCcwRKsne3Ge0/pUCGpu3oRdkoe2FOE7c2BqhdK1JwaA5xXUhYf6daq6+VVceFSOQVnRtGHU3E4+7u+3ooD29n533GfFPtr36bbRKVq8ls3ZChvStDffwVzf/SRy9Q9R8Sqb4mNOZtB9FnRXbJ9MWOAqEMIwns8VfeUiEJijRu1iHmuIoVXK7zyPmHqnMhS9/SWB4h+S/ugNNbTO1wbdJPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730313715; c=relaxed/relaxed;
	bh=2EL5GF5uzYTl7KLQV7OoHy5yJ1kuhl9CNC0GQ7SQ4ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZwHaWb6NdoWjqCjdAWZ3oFNqZdtMAraSXHJ1/beL6+OxLVK6VE+3xV4b+dIxxTK+qojmVaM7h3Mn/DYrJqT7nmrYUABMd8oqGDr/WnUj86VlJfeUZ3HQpWcCap1dGlglhaXSJBDZckTaVdiM1FUIIRY4m7ngH0BEft4DaNbCWSLdMFiKdiDdlH9eeUgRnj6cvxotsUILAjkP+lVJsPj7ErXDfRsHKS9osGsdchBtnNrpHfwAnsHefFFDGWR4TLMrsJ0gb4U7f2dgRa/ap8NFEg7WuyJt2FaSEpD9Jc4/l5k6lJJzdg9ajQTjMHdv7i2RUcVB7PI3foiXm9mdSdKnrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L5t5cJZS; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L5t5cJZS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xdwvk1tqQz2xGH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2024 05:41:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B14A5C5CF5;
	Wed, 30 Oct 2024 18:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD84C4CECE;
	Wed, 30 Oct 2024 18:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730313706;
	bh=bFayy90KzO6wEJgJAEKS9naOm6gN2b1q5QrHLnmsrsU=;
	h=From:Date:Subject:To:Cc:From;
	b=L5t5cJZSSE1D8wzp9BT8EDMwrUSVuuquiCE2au4879x2xxjsMRFDQgtjF2Sb9/Ipr
	 NrlG+KfNmOVvHt51q0de6luqL/Wx1o56fgghSI7mTzj0NzpBAQybuMWIv3AOimXM+b
	 HpUiRuNQBS2j8yH7IGsYnx+DpxHRcT56S5MRYECS9mTelbRss9CUdnsA5dx8OWvT1U
	 1A0KC84y+djeM/G4iKcIDoN3Ph4g942LAUryPsBIv+C+uNt+uvAW3aOIQ+VRMiOvrL
	 4DIO2hEA/pbJiicVZFXK/sVLrDGjRTTv0uGZ59e/4cNRMDM0EpAQQeb9PLxuwNikb4
	 5qK7pHFFqotJw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 30 Oct 2024 11:41:37 -0700
Subject: [PATCH] powerpc/vdso: Drop -mstack-protector-guard flags in 32-bit
 files with clang
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-powerpc-vdso-drop-stackp-flags-clang-v1-1-d95e7376d29c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOB9ImcC/x2NQQrCQAwAv1JyNrBdRcGviId1k9Rg6YZEqlD6d
 xePc5iZDYJdOeA6bOC8amhbOoyHAeqzLBOjUmfIKZ/GdExo7cNuFVeKhuTNMN6lvgxlLlNgnbu
 ERPKQzJIv5Qw9Zc6i3//mdt/3Hx8h+5h2AAAA
X-Change-ID: 20241030-powerpc-vdso-drop-stackp-flags-clang-ddfbf2ef27a6
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3454; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bFayy90KzO6wEJgJAEKS9naOm6gN2b1q5QrHLnmsrsU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlKtS8NJ2Q626/gSb+x2bvsUUj9Rludh///vP1Xkf5XM
 WOKpb9iRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiI+TeG/9HCsif+b5AUK8pY
 MZ11cVXPscSUeewSqVVznxpeePRz4kVGhmfvq2xn52TytUvnLwu/+2bOmTz5DdctBXTPbA1uLH9
 wkBsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Under certain conditions, the 64-bit '-mstack-protector-guard' flags may
end up in the 32-bit vDSO flags, resulting in build failures due to the
structure of clang's argument parsing of the stack protector options,
which validates the arguments of the stack protector guard flags
unconditionally in the frontend, choking on the 64-bit values when
targeting 32-bit:

  clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2
  clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2
  make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/vgettimeofday-32.o] Error 1
  make[3]: *** [arch/powerpc/kernel/vdso/Makefile:87: arch/powerpc/kernel/vdso/vgetrandom-32.o] Error 1

Remove these flags by adding them to the CC32FLAGSREMOVE variable, which
already handles situations similar to this. Additionally, reformat and
align a comment better for the expanding CONFIG_CC_IS_CLANG block.

Cc: stable@vger.kernel.org # v6.1+
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I say "Under certain conditions" because I am not entirely sure what
they are. I cannot reproduce this error in my host environment but I can
reproduce it in TuxMake's environment, which our CI uses:

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2o9p6AV0oOjkNTPVHNoVckfOf5V/build.log

  $ tuxmake \
        -a powerpc \
        -k ppc64_guest_defconfig \
        -r podman \
        -t clang-nightly \
        LLVM=1 \
        config default
  ...
  clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2
  clang: error: invalid value 'r13' in 'mstack-protector-guard-reg=', expected one of: r2

I suspect that make 4.4 could play a difference here but the solution is
quite simple here (since it is already weird with reusing flags) so I
figured it was just worth doing this regardless of what the underlying
reason is.
---
 arch/powerpc/kernel/vdso/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 31ca5a5470047e7ac0a0f8194fd59c6a3b453b4d..c568cad6a22e6b8a8bcb04463b7c850306364804 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -54,10 +54,14 @@ ldflags-y += $(filter-out $(CC_AUTO_VAR_INIT_ZERO_ENABLER) $(CC_FLAGS_FTRACE) -W
 
 CC32FLAGS := -m32
 CC32FLAGSREMOVE := -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
-  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
-  # an unused command line flag warning for this file.
 ifdef CONFIG_CC_IS_CLANG
+# This flag is supported by clang for 64-bit but not 32-bit so it will cause
+# an unused command line flag warning for this file.
 CC32FLAGSREMOVE += -fno-stack-clash-protection
+# -mstack-protector-guard values from the 64-bit build are not valid for the
+# 32-bit one. clang validates the values passed to these arguments during
+# parsing, even when -fno-stack-protector is passed afterwards.
+CC32FLAGSREMOVE += -mstack-protector-guard%
 endif
 LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
 AS32FLAGS := -D__VDSO32__

---
base-commit: bee08a9e6ab03caf14481d97b35a258400ffab8f
change-id: 20241030-powerpc-vdso-drop-stackp-flags-clang-ddfbf2ef27a6

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


