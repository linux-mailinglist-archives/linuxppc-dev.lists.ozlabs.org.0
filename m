Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9E2806F47
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 12:57:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TKZs4nuP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlbW26yLqz3clB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 22:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TKZs4nuP;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlbTF2xlHz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 22:56:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701863760;
	bh=y/GOU0zi8sEL4tGOl1pRVIaHnufC9iWTamQOkSi6dVA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TKZs4nuPUFE0BX5ZPe4/V1a1hujB94agMjoT2uT8kNoJ6w6K/pw/gskhAFmHM3Mw4
	 LJcUSU6A8JPTNYtESrSEXE5Q+a06j+P8nv/mCmq22hzjs4UPsrhASlWgzNfIgmkYAb
	 CQy8a1h7aSV0K/FMMQhkst6hHF3yJsIQ7Tb3f2usltVyNC08CjVsZ7oGbrovEyjfdK
	 5wiSgmePixgNQwer7wBiWCmdla+xPtj+p5adgnBSqr3F/hyRI0L+jr1q5PDB4P1Aqu
	 iUnEosPIXemAQlT+JuI2Ap221tieMOu+CzAiijsjCD7oVywEbmqKnwRGn3qcQZv2Vr
	 TlnztyJC1y8Rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlbTD4XlRz4x1p;
	Wed,  6 Dec 2023 22:56:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/4] powerpc/vdso: No need to undef powerpc for 64-bit build
Date: Wed,  6 Dec 2023 22:55:46 +1100
Message-ID: <20231206115548.1466874-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206115548.1466874-1-mpe@ellerman.id.au>
References: <20231206115548.1466874-1-mpe@ellerman.id.au>
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

The vdso Makefile adds -U$(ARCH) to CPPFLAGS for the vdso64.lds linker
script. ARCH is always powerpc, so it becomes -Upowerpc, which means
undefine the "powerpc" symbol.

But the 64-bit compiler doesn't define powerpc in the first place,
compare:

  $ gcc-5.1.0-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc -m32 -E -dM - </dev/null | grep -w powerpc
  #define powerpc 1
  $ gcc-5.1.0-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc -m64 -E -dM - </dev/null | grep -w powerpc
  $

So there's no need to undefine it for the 64-bit linker script.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 0c7d82c270c3..1b93655c2857 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -71,7 +71,7 @@ AS64FLAGS := -D__VDSO64__
 targets += vdso32.lds
 CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 targets += vdso64.lds
-CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
+CPPFLAGS_vdso64.lds += -P -C
 
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o FORCE
-- 
2.43.0

