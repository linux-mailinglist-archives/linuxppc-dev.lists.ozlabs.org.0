Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F3A83EF5F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 19:08:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d57GkvdT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TMjH91PkNz3cNC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jan 2024 05:08:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d57GkvdT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMjGJ6Mttz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jan 2024 05:07:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BEE966118A;
	Sat, 27 Jan 2024 18:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C74D9C433F1;
	Sat, 27 Jan 2024 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706378868;
	bh=qtNyFxcBkmUTCmrI3w7d91OiAWcSyJmp5wFzXkJnfgU=;
	h=From:Date:Subject:To:Cc:From;
	b=d57GkvdTT9GzIuvTC7jRsYQ+SvmHJ52/jRZXK/P+rCS43j+eyxu4wVgwp4dgAfxL4
	 yQmoj/kWH6qed1J5imgzEhN86fwDZhMdEXyRgfHMza9QaH3G7LYzouri7I9v1W2IAr
	 N2vuE335kezdqO/WNlTsV0QlLf0DMDnLkdjo5p+2EoMBL6Fs7ZxcLRzOOAOM6PKOa9
	 QlFXE6HQRiopY5Hxn/mnghXRunvudA4dDMgO228A90S9f8S7vmlbiJbW/R/JQyNKHB
	 W27MLiv508K5dmU5F3Q296hYqMhH5Kmw3UEcvgxCii6W3XILZLnoFYvTkXm+pwlIcc
	 s/AJQ26MNlG9Q==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 27 Jan 2024 11:07:43 -0700
Subject: [PATCH] powerpc: xor_vmx: Add '-mhard-float' to CFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240127-ppc-xor_vmx-drop-msoft-float-v1-1-f24140e81376@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG5GtWUC/x3MUQqDMAwA0KtIvhfQTlS8ioxR23QG1JRUpCDe3
 bLP9/MuSKRMCcbqAqWTE8te0LwqcIvdf4Tsi8HUpq0b02OMDrPo99wyepWIW5JwYFjFHmh9N8z
 tuw9D56AUUSlw/vfT574fW3QHpW4AAAA=
To: mpe@ellerman.id.au
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=nathan@kernel.org;
 h=from:subject:message-id; bh=qtNyFxcBkmUTCmrI3w7d91OiAWcSyJmp5wFzXkJnfgU=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKlb3YqnZ6/+dz2C5YNv4empdqc5Cq5OfGkX+pf7Wc2mB
 NXvbCumdJSyMIhxMciKKbJUP1Y9bmg45yzjjVOTYOawMoEMYeDiFICJvGxi+O/i6GD82yvIZuIf
 1Xu/dq6Y/2SD/bO/f//+s8t7kLfsk3ECI8PKA4zulfevxsQ3h909xy8fuCHzMUPihb7EvVcfb7w
 bNJcHAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, patches@lists.linux.dev, aneesh.kumar@kernel.org, npiggin@gmail.com, justinstitt@google.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, morbo@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch/powerpc/lib/xor_vmx.o is built with '-msoft-float' (from the main
powerpc Makefile) and '-maltivec' (from its CFLAGS), which causes an
error when building with clang after a recent change in main:

  error: option '-msoft-float' cannot be specified with '-maltivec'
  make[6]: *** [scripts/Makefile.build:243: arch/powerpc/lib/xor_vmx.o] Error 1

Explicitly add '-mhard-float' before '-maltivec' in xor_vmx.o's CFLAGS
to override the previous inclusion of '-msoft-float' (as the last option
wins), which matches how other areas of the kernel use '-maltivec', such
as AMDGPU.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/1986
Link: https://github.com/llvm/llvm-project/commit/4792f912b232141ecba4cbae538873be3c28556c
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 6eac63e79a89..0ab65eeb93ee 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -76,7 +76,7 @@ obj-$(CONFIG_PPC_LIB_RHEAP) += rheap.o
 obj-$(CONFIG_FTR_FIXUP_SELFTEST) += feature-fixups-test.o
 
 obj-$(CONFIG_ALTIVEC)	+= xor_vmx.o xor_vmx_glue.o
-CFLAGS_xor_vmx.o += -maltivec $(call cc-option,-mabi=altivec)
+CFLAGS_xor_vmx.o += -mhard-float -maltivec $(call cc-option,-mabi=altivec)
 # Enable <altivec.h>
 CFLAGS_xor_vmx.o += -isystem $(shell $(CC) -print-file-name=include)
 

---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240127-ppc-xor_vmx-drop-msoft-float-ad68b437f86c

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

