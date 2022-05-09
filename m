Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605B152062E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 22:48:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxtYm1cXDz3cgJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T40M0Shh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T40M0Shh; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxtWp37Zsz3bbs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 06:47:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B341616FA;
 Mon,  9 May 2022 20:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5777C385BA;
 Mon,  9 May 2022 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652129219;
 bh=LPoqNytL/dcXDmLHjdnmp6kf5QofpJwXrg3EPyjgqos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T40M0ShhTHT+jgDXHoKyf9PluyRWQACDA8mmu5u3L7mXyahxPpQcgh+5fJOGubg7R
 e0qoGsdw9sWIKHfyJ++BPzzJXqMhb9xKZONQyzcXjLFIE4pqINaLp2aOPvSCuVD4H1
 3wtUwcQWrjOWFMIhk2lNd/nkg68EHozJHfZj990tLnHbbP9POMfolsaOyYdbIaaafh
 Tr+gN1APyHp4KdLBCZ40fk0KCGsG4kaPiL0fSldtXekPOpH73KZFBitiN/7vMZTf5M
 wyE22IhjHf22BOXTMWzqz/3Ejv8WcJP1XyncWJfDYaDwwBZyx4W9Jo3eHt6SDtBnYJ
 Pj6UdKYdeqm7A==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/vdso: Link with ld.lld when requested
Date: Mon,  9 May 2022 13:46:35 -0700
Message-Id: <20220509204635.2539549-3-nathan@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220509204635.2539549-1-nathan@kernel.org>
References: <20220509204635.2539549-1-nathan@kernel.org>
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

The PowerPC vDSO is linked with $(CC) instead of $(LD), which means the
default linker of the compiler is used instead of the linker requested
by the builder.

  $ make ARCH=powerpc LLVM=1 mrproper defconfig arch/powerpc/kernel/vdso/
  ...

  $ llvm-readelf -p .comment arch/powerpc/kernel/vdso/vdso{32,64}.so.dbg

  File: arch/powerpc/kernel/vdso/vdso32.so.dbg
  String dump of section '.comment':
  [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

  File: arch/powerpc/kernel/vdso/vdso64.so.dbg
  String dump of section '.comment':
  [     0] clang version 14.0.0 (Fedora 14.0.0-1.fc37)

The compiler option '-fuse-ld' tells the compiler which linker to use
when it is invoked as both the compiler and linker. Use '-fuse-ld=lld'
when LD=ld.lld has been specified (CONFIG_LD_IS_LLD) so that the vDSO is
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

