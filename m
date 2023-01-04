Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237BA65DD51
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 20:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnL5x6jk8z3cCy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 06:59:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GvS9EqaM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GvS9EqaM;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnL12385Sz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 06:55:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AC1C8B81714;
	Wed,  4 Jan 2023 19:54:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A948C433A1;
	Wed,  4 Jan 2023 19:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672862099;
	bh=f/bdga3DLC0ICmYuLt5jzIvLqqsy/uQ32UMKQcitWkk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GvS9EqaM2s+hmge+UB6B3qFcOQqV326tXO52kyiVP3AYuYQ6ikQBJmfw2q34xq4kq
	 FVKViCKfmUp5QLoXUIdmmHbv0u5SVD+otrmk8xjgG7JDjT29wMDhPdCIGLh/ANtku8
	 bBroSJ7wBayGI56jt64fxIxadPQuJ13hUUCjBaLmEfNz6plyBbFWqbCTixgxJt0+Y7
	 GgX2f7qyvNgHKoRFhRYZygfGMyuiDzupTSuOm79UyQPaMfVPjH7ScaCI+4h5MN0M3/
	 QAhrSgKBx2yF/XtiBfJcAZ+iG9ParcRuWTHErtR/u41KE/6oIQhDgXh4PKmBRho64U
	 u27rBFjr+rffA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 04 Jan 2023 12:54:24 -0700
Subject: [PATCH 07/14] powerpc/vdso: Improve linker flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221228-drop-qunused-arguments-v1-7-658cbc8fc592@kernel.org>
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
To: masahiroy@kernel.org, ndesaulniers@google.com
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3597; i=nathan@kernel.org;
 h=from:subject:message-id; bh=f/bdga3DLC0ICmYuLt5jzIvLqqsy/uQ32UMKQcitWkk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMlbb3apzJKXc9ueX/+8125m9oMq72PVWX5ec1P6c2McAxc+
 /jOno5SFQYyDQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEzkTzzDH55oKYa1cybLrMnU4kp4cW
 ta6lSBfNvtjw7+6v1yssVKrZCR4SXLv2kt05+vfT8pRiju7GG3u/knl1s+XCIYdVr1k6okOxMA
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
Cc: kernel test robot <lkp@intel.com>, linux-kbuild@vger.kernel.org, trix@redhat.com, llvm@lists.linux.dev, npiggin@gmail.com, Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, nicolas@fjasle.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When clang's -Qunused-arguments is dropped from KBUILD_CPPFLAGS, there
are several warnings in the PowerPC vDSO:

  clang-16: error: -Wl,-soname=linux-vdso32.so.1: 'linker' input unused [-Werror,-Wunused-command-line-argument]
  clang-16: error: -Wl,--hash-style=both: 'linker' input unused [-Werror,-Wunused-command-line-argument]
  clang-16: error: argument unused during compilation: '-shared' [-Werror,-Wunused-command-line-argument]

  clang-16: error: argument unused during compilation: '-nostdinc' [-Werror,-Wunused-command-line-argument]
  clang-16: error: argument unused during compilation: '-Wa,-maltivec' [-Werror,-Wunused-command-line-argument]

The first group of warnings point out that linker flags were being added
to all invocations of $(CC), even though they will only be used during
the final vDSO link. Move those flags to ldflags-y.

The second group of warnings are compiler or assembler flags that will
be unused during linking. Filter them out from KBUILD_CFLAGS so that
they are not used during linking.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: mpe@ellerman.id.au
Cc: npiggin@gmail.com
Cc: christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/kernel/vdso/Makefile | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 45c0cc5d34b6..769b62832b38 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -47,13 +47,17 @@ KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
-ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
-ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
-
-CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
+ccflags-y := -fno-common -fno-builtin
+ldflags-y := -Wl,--hash-style=both -nostdlib -shared
+ldflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
+# Filter flags that clang will warn are unused for linking
+ldflags-y += $(filter-out $(CC_FLAGS_FTRACE) -Wa$(comma)%, $(KBUILD_CFLAGS))
+
+CC32FLAGS := -m32
+LD32FLAGS := -Wl,-soname=linux-vdso32.so.1
 AS32FLAGS := -D__VDSO32__
 
-CC64FLAGS := -Wl,-soname=linux-vdso64.so.1
+LD64FLAGS := -Wl,-soname=linux-vdso64.so.1
 AS64FLAGS := -D__VDSO64__
 
 targets += vdso32.lds
@@ -92,14 +96,14 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.dbg FORCE
 
 # actual build commands
 quiet_cmd_vdso32ld_and_check = VDSO32L $@
-      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
+      cmd_vdso32ld_and_check = $(VDSOCC) $(ldflags-y) $(CC32FLAGS) $(LD32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c -o $@ $<
 quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
 
 quiet_cmd_vdso64ld_and_check = VDSO64L $@
-      cmd_vdso64ld_and_check = $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
+      cmd_vdso64ld_and_check = $(VDSOCC) $(ldflags-y) $(CC64FLAGS) $(LD64FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_check)
 quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c -o $@ $<
 

-- 
2.39.0
