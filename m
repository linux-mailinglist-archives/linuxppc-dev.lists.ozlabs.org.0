Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6169E0FF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 14:04:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLfd65Zm2z3cDp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 00:04:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CYVfNbuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfc85GZ6z3bgs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 00:03:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CYVfNbuX;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PLfc84DJSz4x7W;
	Wed, 22 Feb 2023 00:03:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676984616;
	bh=/qotrgXoW+smJIhOLs8wTio2vNfwQyTcszZlM8qcwl0=;
	h=From:To:Subject:Date:From;
	b=CYVfNbuXULfY7Z8Bjt5KwuV+nBKovx86MArDmuZnA6LKiCQ+Xcp1fUPLxX4hw40ix
	 miEWYqZ2MzDyHAna51kFy4Uqxtw2hydgFWRlERYgY9uEgt/iskfa0HU0DKOADfJiDx
	 F5K9ZfjK7JLTDmx/TdU1xXw8WCBsK1mIdoU5B76ce3UC+QPUXQbCfaqOjHmxML1mUH
	 xTuyCLZ8qOVejtqMEULq2URpNHH134ws6fLzc+3oxvFrysw4XwwASrD8a2ZgBloX2F
	 vkDFKwAsQN/vjbN2BKCol5yvWza+7Bs0HLwGo4+PACEJE5Ew9wrezO/QATiSR5o2wj
	 NFmsrjUSnirCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Avoid dead code/data elimination when using recordmcount
Date: Wed, 22 Feb 2023 00:03:31 +1100
Message-Id: <20230221130331.2714199-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although powerpc now has objtool mcount support, it's not enabled in all
configurations due to dependencies.

On those configurations, with some linkers (binutils 2.37 at least),
it's still possible to hit the dreaded "recordmcount bug", eg. errors
such as:

    CC      kernel/kexec_file.o
  Cannot find symbol for section 10: .text.unlikely.
  kernel/kexec_file.o: failed
  make[1]: *** [scripts/Makefile.build:287 : kernel/kexec_file.o] Error 1

Those errors are much more prevalent when building with
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION, because it places every function
in a separate section.

CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is marked experimental and is not
enabled in any powerpc defconfigs or by major distros. Although it does
have at least some users on 32-bit where kernel size tends to be more
important.

Avoid the build errors by blocking CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
when the build is using recordmcount, rather than objtool. In practice
that means for 64-bit big endian builds, or 64-bit clang builds - both
because they lack CONFIG_MPROFILE_KERNEL.

On 32-bit objtool is always used, so
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is still available there.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2c9cdf1d8761..a6c4407d3ec8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -236,7 +236,7 @@ config PPC
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
-	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
+	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if HAVE_OBJTOOL_MCOUNT
 	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
-- 
2.39.1

