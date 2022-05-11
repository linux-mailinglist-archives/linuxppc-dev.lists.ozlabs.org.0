Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A4B523CE6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 20:52:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz3tH5Z9Nz3chW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 04:52:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A3PwFceq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=A3PwFceq; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz3rH2fbmz3bwX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 04:50:23 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A34F960FC6;
 Wed, 11 May 2022 18:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9460C34100;
 Wed, 11 May 2022 18:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652295021;
 bh=uWfZdAk0PxnLwPOVrQC6qfy5AARkFg7cXs9CQ8AeM34=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A3PwFceqTQ44qGMGOap/dWKbgcX9jy1AOjkJKFLhpDq7W2TKxtALPu0kZq3cRBwAj
 5D2MIyngAkgsrxpW3KfgeC6fYrX73fBPnuNyV9PYsMSuu6AnMQPT+IIINbzSgTC9O0
 lcWRSLBOaj9ws0/TKIYFKqnnCSTcatJqcO5shqIYPjCsmbSojG0DtpNrun1nHxb8Nd
 zOvjKkftg2KNS43RXehoD6R4xTTxoi0gOwstKCjf6XtH76dMISO7hMBezQmowuH78D
 64ZUvDtMmuFaQEJbGNDbLoDjK7cGgZBGXgrNTxDvVuywFJpGy19mQPqp9Tw4X6Ey68
 Fj+iXS9ykjvzA==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/2] powerpc/vdso: Link with ld.lld when requested
Date: Wed, 11 May 2022 11:50:01 -0700
Message-Id: <20220511185001.3269404-3-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511185001.3269404-1-nathan@kernel.org>
References: <20220511185001.3269404-1-nathan@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PowerPC vDSO uses $(CC) to link, which differs from the rest of the
kernel, which uses $(LD) directly. As a result, the default linker of
the compiler is used, which may differ from the linker requested by the
builder. For example:

  $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
  ...

  $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg

  File: arch/powerpc/kernel/vdso/vdso32.so.dbg
  String dump of section '.comment':
  [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

  File: arch/powerpc/kernel/vdso/vdso64.so.dbg
  String dump of section '.comment':
  [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

LLVM=1 sets LD=ld.lld but ld.lld is not used to link the vDSO; GNU ld is
because "ld" is the default linker for clang on most Linux platforms.

This is a problem for Clang's Link Time Optimization as implemented in
the kernel because use of GNU ld with LTO requires the LLVMgold plugin,
which is not technically supported for ld.bfd per
https://llvm.org/docs/GoldPlugin.html. Furthermore, if LLVMgold.so is
missing from a user's system, the build will fail, even though LTO as it
is implemented in the kernel requires ld.lld to avoid this dependency in
the first place.

Ultimately, the PowerPC vDSO should be converted to compiling and
linking with $(CC) and $(LD) respectively but there were issues last
time this was tried, potentially due to older but supported tool
versions. To avoid regressing GCC + binutils, use the compiler option
'-fuse-ld', which tells the compiler which linker to use when it is
invoked as both the compiler and linker. Use '-fuse-ld=lld' when
LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
linked with the same linker as the rest of the kernel.

  $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg

  File: arch/powerpc/kernel/vdso/vdso32.so.dbg
  String dump of section '.comment':
  [     0] Linker: LLD 14.0.0
  [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

  File: arch/powerpc/kernel/vdso/vdso64.so.dbg
  String dump of section '.comment':
  [     0] Linker: LLD 14.0.0
  [    14] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

LD can be a full path to ld.lld, which will not be handled properly by
'-fuse-ld=lld' if the full path to ld.lld is outside of the compiler's
search path. '-fuse-ld' can take a path to the linker but it is
deprecated in clang 12.0.0; '--ld-path' is preferred for this scenario.

Use '--ld-path' if it is supported, as it will handle a full path or
just 'ld.lld' properly. See the LLVM commit below for the full details
of '--ld-path'.

Link: https://github.com/ClangBuiltLinux/linux/issues/774
Link: https://github.com/llvm/llvm-project/commit/1bc5c84710a8c73ef21295e63c19d10a8c71f2f5
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/kernel/vdso/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 954974287ee7..096b0bf1335f 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -48,6 +48,7 @@ UBSAN_SANITIZE := n
 KASAN_SANITIZE := n
 
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib -Wl,--hash-style=both
+ccflags-$(CONFIG_LD_IS_LLD) += $(call cc-option,--ld-path=$(LD),-fuse-ld=lld)
 
 CC32FLAGS := -Wl,-soname=linux-vdso32.so.1 -m32
 AS32FLAGS := -D__VDSO32__ -s
-- 
2.36.1

