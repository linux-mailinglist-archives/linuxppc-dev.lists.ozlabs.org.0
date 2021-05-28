Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154539470F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 20:30:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FsCsm346tz3bt4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 May 2021 04:30:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hNQ+OCbF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hNQ+OCbF; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FsCsG0s0wz2xfT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 May 2021 04:29:54 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43175613B5;
 Fri, 28 May 2021 18:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622226588;
 bh=QSRZ6S+Sdf5WKAtAbGtJdidvTJ3wPSV/gRZewGESIdk=;
 h=From:To:Cc:Subject:Date:From;
 b=hNQ+OCbF7nGq0MnBf2zAPV0EqKgB5b70lnJOPG/Bwu1By3raVTVvicfYq/ICuuHbd
 TC4czzsMTLqk/RFcDpjfix5VBAQA34WlMU6mD/3sEKEkGHA1scGO+5EtIlxJb6bb58
 962RSm5GttFs0CsZ8cXfAJ+eZhpLF/JFoUYqjV/b6uVemz8qtqktlMljUQ5UGd4Azl
 XD5WWPTootKdW6q8HHwnhvXYLSk+a70AX587QpUItcVK6WevBjXPBPIYj903/XSfic
 FIdC1ILIpNVc42D925oe+PjwSOgQwuqCkmAe0+hc+y9hJY7LAyK7zRUkUDuMF+CJTg
 9n7m86SCQtTlQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/barrier: Avoid collision with clang's __lwsync macro
Date: Fri, 28 May 2021 11:27:52 -0700
Message-Id: <20210528182752.1852002-1-nathan@kernel.org>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A change in clang 13 results in the __lwsync macro being defined as
__builtin_ppc_lwsync, which emits 'lwsync' or 'msync' depending on what
the target supports. This breaks the build because of -Werror in
arch/powerpc, along with thousands of warnings:

 In file included from arch/powerpc/kernel/pmc.c:12:
 In file included from include/linux/bug.h:5:
 In file included from arch/powerpc/include/asm/bug.h:109:
 In file included from include/asm-generic/bug.h:20:
 In file included from include/linux/kernel.h:12:
 In file included from include/linux/bitops.h:32:
 In file included from arch/powerpc/include/asm/bitops.h:62:
 arch/powerpc/include/asm/barrier.h:49:9: error: '__lwsync' macro redefined [-Werror,-Wmacro-redefined]
 #define __lwsync()      __asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
        ^
 <built-in>:308:9: note: previous definition is here
 #define __lwsync __builtin_ppc_lwsync
        ^
 1 error generated.

Undefine this macro so that the runtime patching introduced by
commit 2d1b2027626d ("powerpc: Fixup lwsync at runtime") continues to
work properly with clang and the build no longer breaks.

Cc: stable@vger.kernel.org
Link: https://github.com/ClangBuiltLinux/linux/issues/1386
Link: https://github.com/llvm/llvm-project/commit/62b5df7fe2b3fda1772befeda15598fbef96a614
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/include/asm/barrier.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index 7ae29cfb06c0..f0e687236484 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -46,6 +46,8 @@
 #    define SMPWMB      eieio
 #endif
 
+/* clang defines this macro for a builtin, which will not work with runtime patching */
+#undef __lwsync
 #define __lwsync()	__asm__ __volatile__ (stringify_in_c(LWSYNC) : : :"memory")
 #define dma_rmb()	__lwsync()
 #define dma_wmb()	__asm__ __volatile__ (stringify_in_c(SMPWMB) : : :"memory")

base-commit: 97e5bf604b7a0d6e1b3e00fe31d5fd4b9bffeaae
-- 
2.32.0.rc0

