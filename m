Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 695A366694F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 04:07:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NsqGd2CKgz3fBM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 14:07:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rVLVuVeT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rVLVuVeT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NsqDj750fz3c4x
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 14:05:41 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A6A961F0C;
	Thu, 12 Jan 2023 03:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EC7C43396;
	Thu, 12 Jan 2023 03:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673492739;
	bh=uAHgiJSCHpIUV5vt/SRkX0KHkpA5UbELEGGq1ql5Qak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rVLVuVeTlHKtoWOmjZ+358Jzlf1tfQeNy3bGkJhjSwHJwEzQaTmi6iPfn2zhd8yku
	 SiiOIO+WX200NtX3TyIeXFL/bdCbJzy/kMaON0d45nND6Eqp+Jiry2COytuXnikcEO
	 1YXC9A33GD+XdvMFxhw2H176oSqMa7Y4yO6mfVp9eo8b3gIFV2HufvV11EJSkWtEMp
	 POPdtD3fo5IsDGCgj6X6JYilQwEtNnKWRWLsWPs0OhFvA0nhwDVZMwNHdEt5Kxl/4L
	 kdN7a2veO8GsJo9UOm4Vpd9nBa2DGLbmW/6cxfxIH/ottwRHZUzZcCYMNQo7izHb+P
	 Ik7a2Ii3YN+6w==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Jan 2023 20:05:03 -0700
Subject: [PATCH v2 06/14] powerpc/vdso: Remove unused '-s' flag from
 ASFLAGS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v2-6-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To: masahiroy@kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=1751; i=nathan@kernel.org;
 h=from:subject:message-id; bh=uAHgiJSCHpIUV5vt/SRkX0KHkpA5UbELEGGq1ql5Qak=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K37Luf5TSJn1zGJGs5WDEWtGnPySzwmOwleXi5y7GMc1
 LUaxo5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyEgYuRYdKPQG4+2+5fz2Y7PqucK2
 V3YumbB5PKOXc9ursgvuacygxGhiPeFmF7Jdj7jnBc+ZpmGWXzfAWTQrbrjFs11zznMDEe4wYA
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

  clang-16: error: argument unused during compilation: '-s' [-Werror,-Wunused-command-line-argument]

The compiler's '-s' flag is a linking option (it is passed along to the
linker directly), which means it does nothing when the linker is not
invoked by the compiler. The kernel builds all .o files with '-c', which
stops the compilation pipeline before linking, so '-s' can be safely
dropped from ASFLAGS.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org

As I mentioned before, it is possible that we should add '-s' to
ldflags-y in the following patch but I assume someone would have noticed
by now if that was a problem.
---
 arch/powerpc/kernel/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 6a977b0d8ffc..45c0cc5d34b6 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -51,10 +51,10 @@ ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
 ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 
 CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
-AS32FLAGS := -D__VDSO32__ -s
+AS32FLAGS := -D__VDSO32__
 
 CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
-AS64FLAGS := -D__VDSO64__ -s
+AS64FLAGS := -D__VDSO64__
 
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc

-- 
2.39.0

