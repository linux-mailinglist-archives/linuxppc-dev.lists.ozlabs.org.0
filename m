Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 277958FFC0C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 08:17:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M5eDGq2W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwWFc1Gspz2yD6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 16:17:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M5eDGq2W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwWDt2sgdz30Vr
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 16:16:46 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B2C04CE1CC2;
	Fri,  7 Jun 2024 06:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA9AC32786;
	Fri,  7 Jun 2024 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717740997;
	bh=qgHdQ12pGPqv4LQl2A25azzdtAo6RAm5OvuiMvQKvsQ=;
	h=From:To:Cc:Subject:Date:From;
	b=M5eDGq2WgpC2ptrYYfbhFd1t01HDMrMtZuAl1rxiC9JcCy7KZ4YF6/P6sjFFlpqXM
	 fXN9RKaiYm/hGMpSZBs5oaRZNiYlpLwf+8GhiM8+CE8xMt3EEqKNFQVthqnMrVzy0K
	 sHVG6gKTIC9I8i1h9Ah/GeV8vZp10qrQX1UEgpbnRTksYuvIgGH1m8FkclbLBDTMXr
	 ekv11RBOu1TFJr+bT1CB+6sYa1EH2PFvxc6lBqKvZ90QgfoCPyEJDEi+LWmRrB2ID5
	 FmBhvhfj4MNMzqt25WhSDw8Hli6LLvWRxd43MlsP4zCMNtDTiN6VBvrs9NboEZzJv3
	 QBipta5BEZJzA==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
Date: Fri,  7 Jun 2024 08:16:23 +0200
Message-Id: <20240607061629.530301-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Building powerpc64le kernels with the kernel.org crosstool toolchains
no longer works as the linker attempts to build a big-endian vdso:

powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: arch/powerpc/kernel/vdso/sigtramp32-32.o: compiled for a little endian system and target is big endian
powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: failed to merge target specific data of file arch/powerpc/kernel/vdso/sigtramp32-32.o

Apparently creating the vdso.lds files from the lds.S files fails to
pass the -mlittle-endian argument here, so the output format gets set
wrong. Changing the conditional to check for CONFIG_CPU_LITTLE_ENDIAN
instead still works, as the kernel configuration definitions are visible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I'm fairly sure this worked in the past, but I did not try to bisect the
issue.
---
 arch/powerpc/kernel/vdso/vdso32.lds.S | 2 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 426e1ccc6971..5845ea2d1cba 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -7,7 +7,7 @@
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
-#ifdef __LITTLE_ENDIAN__
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
 OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
 #else
 OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index bda6c8cdd459..82c418b18cce 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -7,7 +7,7 @@
 #include <asm/page.h>
 #include <asm-generic/vmlinux.lds.h>
 
-#ifdef __LITTLE_ENDIAN__
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
 OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
 #else
 OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
-- 
2.39.2

