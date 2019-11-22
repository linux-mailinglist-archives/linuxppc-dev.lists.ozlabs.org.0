Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69D106288
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 07:04:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K5Vk4GQgzDr8m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 17:04:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AoW2zRTy"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K5CM4FrfzDr8m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:51:27 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B546B2070E;
 Fri, 22 Nov 2019 05:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574401885;
 bh=0BKgJK0ru3iRADVaPyo5g95TkJZb3iLxgNnyE9BBUxQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AoW2zRTySCjlKux1l/KduFivVCCph+/7xCyk79eWIPcvBjX0uIgqZJDPnHVLOiTpi
 V6wWoThpderv6ki1R/7a1iIBh65ssmAdxnrH4b2z3d76Yc4KL9uR5OlY3TFMzahvGX
 E2bB4JKO/7Xgakr9JX88zyP4gD3/559C20Jwv3Zo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 119/219] powerpc/32: Avoid unsupported flags with
 clang
Date: Fri, 22 Nov 2019 00:47:31 -0500
Message-Id: <20191122054911.1750-112-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191122054911.1750-1-sashal@kernel.org>
References: <20191122054911.1750-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Joel Stanley <joel@jms.id.au>

[ Upstream commit 72e7bcc2cdf82bf03caaa5e6c9b0134c2fc2ee7d ]

When building for ppc32 with clang these flags are unsupported:

  -ffixed-r2 and -mmultiple

llvm's lib/Target/PowerPC/PPCRegisterInfo.cpp marks r2 as reserved on
when building for SVR4ABI and !ppc64:

  // The SVR4 ABI reserves r2 and r13
  if (Subtarget.isSVR4ABI()) {
    // We only reserve r2 if we need to use the TOC pointer. If we have no
    // explicit uses of the TOC pointer (meaning we're a leaf function with
    // no constant-pool loads, etc.) and we have no potential uses inside an
    // inline asm block, then we can treat r2 has an ordinary callee-saved
    // register.
    const PPCFunctionInfo *FuncInfo = MF.getInfo<PPCFunctionInfo>();
    if (!TM.isPPC64() || FuncInfo->usesTOCBasePtr() || MF.hasInlineAsm())
      markSuperRegs(Reserved, PPC::R2);  // System-reserved register
    markSuperRegs(Reserved, PPC::R13); // Small Data Area pointer register
  }

This means we can safely omit -ffixed-r2 when building for 32-bit
targets.

The -mmultiple/-mno-multiple flags are not supported by clang, so
platforms that might support multiple miss out on using multiple word
instructions.

We wrap these flags in cc-option so that when Clang gains support the
kernel will be able use these flags.

Clang 8 can then build a ppc44x_defconfig which boots in Qemu:

  make CC=clang-8 ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-  ppc44x_defconfig
  ./scripts/config -e CONFIG_DEVTMPFS -d DEVTMPFS_MOUNT
  make CC=clang-8 ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnu-

  qemu-system-ppc -M bamboo \
   -kernel arch/powerpc/boot/zImage \
   -dtb arch/powerpc/boot/dts/bamboo.dtb \
   -initrd ~/ppc32-440-rootfs.cpio \
   -nographic -serial stdio -monitor pty -append "console=ttyS0"

Link: https://github.com/ClangBuiltLinux/linux/issues/261
Link: https://bugs.llvm.org/show_bug.cgi?id=39556
Link: https://bugs.llvm.org/show_bug.cgi?id=39555
Signed-off-by: Joel Stanley <joel@jms.id.au>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c4c03992ee828..dfcb698ec8f3b 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -145,7 +145,14 @@ endif
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
-CFLAGS-$(CONFIG_PPC32)	:= -ffixed-r2 $(MULTIPLEWORD)
+# Clang unconditionally reserves r2 on ppc32 and does not support the flag
+# https://bugs.llvm.org/show_bug.cgi?id=39555
+CFLAGS-$(CONFIG_PPC32)	:= $(call cc-option, -ffixed-r2)
+
+# Clang doesn't support -mmultiple / -mno-multiple
+# https://bugs.llvm.org/show_bug.cgi?id=39556
+CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
+
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
 ifdef CONFIG_PPC_BOOK3S_64
-- 
2.20.1

