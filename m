Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AD666971
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:10:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsqKg0XCjz3fG3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 14:09:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXfklGda;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RXfklGda;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsqDk6HNtz3c6y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 14:05:42 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC16B61F3C;
	Thu, 12 Jan 2023 03:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17974C433A4;
	Thu, 12 Jan 2023 03:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673492740;
	bh=ZYrEe+UlGxSb3XmlyRW+kxOUXOC4ka67ZA2eVmniGls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RXfklGdaqsc4OBns3LZcCpfBAzzRfrmJY22decYhmK/DmMfUZPXq8HVbaEq62fqXF
	 spZsaa+1iNIPJwRIy6DXvwN7U/sxikAXM3tfBhjY+Us+Y2kzDiJwMfKVr57OWYpBe6
	 FR8RauQuRnHG5OnnUI5H7ZPa0ajNNIchD6jIcDJXW9dXbhSeIf9C5eOD639FQoqHnS
	 a8A7BRk/I9O4Ztil+KHW4UKsNaOEgQtkvvPt/wlTnCY3H6bAiVt2Zh18KGbaGFHYH4
	 DqdW2e86KkHAKk7fw23RyJF0XTpJYUtvlCETasjCL/g2ds8kvhgzEqByiln4CadxUd
	 BGadsL6QopuzQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Jan 2023 20:05:05 -0700
Subject: [PATCH v2 08/14] powerpc/vdso: Remove an unsupported flag from
 vgettimeofday-32.o with clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-8-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To: masahiroy@kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=2124; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZYrEe+UlGxSb3XmlyRW+kxOUXOC4ka67ZA2eVmniGls=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K36fz/vbKrXpuv2eZb5z05tO+M9908m59Na+tW+XzPtW
 NIe1uaOUhUGMg0FWTJGl+rHqcUPDOWcZb5yaBDOHlQlkCAMXpwBMxLCF4X/Q683ffF+8EF/c/znfU8
 hUYsO5nrIl2nKtN0oeJD77ppfLyPD844cfDWfy3iYd+fqEZ+ZSg0e973q5Co6d97tx58OhCVe5AQ==
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
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, it
warns:

  clang-16: error: argument unused during compilation: '-fno-stack-clash-protection' [-Werror,-Wunused-command-line-argument]

This warning happens because vgettimeofday-32.c gets its base CFLAGS
from the main kernel, which may contain flags that are only supported on
a 64-bit target but not a 32-bit one, which is the case here.
-fstack-clash-protection and its negation are only suppported by the
64-bit powerpc target but that flag is included in an invocation for a
32-bit powerpc target, so clang points out that while the flag is one
that it recognizes, it is not actually used by this compiler job.

To eliminate the warning, remove -fno-stack-clash-protection from
vgettimeofday-32.c's CFLAGS when using clang, as has been done for other
flags previously.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/vdso/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 4337b3aa9171..e78a57e0a6c0 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -16,6 +16,11 @@ ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday-32.o += -ffreestanding -fasynchronous-unwind-tables
   CFLAGS_REMOVE_vgettimeofday-32.o = $(CC_FLAGS_FTRACE)
   CFLAGS_REMOVE_vgettimeofday-32.o += -mcmodel=medium -mabi=elfv1 -mabi=elfv2 -mcall-aixdesc
+  # This flag is supported by clang for 64-bit but not 32-bit so it will cause
+  # an unused command line flag warning for this file.
+  ifdef CONFIG_CC_IS_CLANG
+  CFLAGS_REMOVE_vgettimeofday-32.o += -fno-stack-clash-protection
+  endif
   CFLAGS_vgettimeofday-64.o += -include $(c-gettimeofday-y)
   CFLAGS_vgettimeofday-64.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
   CFLAGS_vgettimeofday-64.o += $(call cc-option, -fno-stack-protector)

-- 
2.39.0

