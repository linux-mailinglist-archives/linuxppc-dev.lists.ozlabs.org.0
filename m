Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9085244B2EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 19:55:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpccC3RkLz2yxx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 05:55:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=xv/I0xmi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.75;
 helo=condef-10.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=xv/I0xmi; 
 dkim-atps=neutral
Received: from condef-10.nifty.com (condef-10.nifty.com [202.248.20.75])
 by lists.ozlabs.org (Postfix) with ESMTP id 4HpcbX6397z2yK3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 05:54:32 +1100 (AEDT)
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-10.nifty.com
 with ESMTP id 1A9IotE8016701
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 03:51:24 +0900
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 1A9IoUZc023095;
 Wed, 10 Nov 2021 03:50:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 1A9IoUZc023095
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1636483831;
 bh=BvQkRW9CNz6/jlg9D16+/K4NnL23b6i8ZHcso55PIA4=;
 h=From:To:Cc:Subject:Date:From;
 b=xv/I0xmifZEuwnRH9M9gh9+b4PL0Mf3zb3gt5htmu9nV6vPictomt92iU2OvoTsj/
 +u7+owpxirwELB+a8p5vmpCNW0HpREese7rMMBMyh5VfpgmwgnSvqNXDuFXt9Wv1Al
 vmR036vx/Fb/c5Qxl8HCItkgS1MqcJ/Sfldo35LlCnNtp6sdFkJwIv7a2B3o/BTvB/
 hrYZInYUx40syVmb8YFkyocIYOvuzqfcumgDgpfPWALNCrofd432/BbRG01r7gGZQq
 gDZrBeaLWCqGTc+QeaLI5zwv7v5OBNS8LB7erxogUXzeW1noiGGHKya5vCm0jne47t
 Az5RfAs8xb+tw==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: clean vdso32 and vdso64 directories
Date: Wed, 10 Nov 2021 03:50:15 +0900
Message-Id: <20211109185015.615517-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
vgettimeofday.o"), "make ARCH=powerpc clean" does not clean up the
arch/powerpc/kernel/{vdso32,vdso64} directories.

Use the subdir- trick to let "make clean" descend into them.

Fixes: bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of vgettimeofday.o")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0e3640e14eb1..5fa68c2ef1f8 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -196,3 +196,6 @@ clean-files := vmlinux.lds
 # Force dependency (incbin is bad)
 $(obj)/vdso32_wrapper.o : $(obj)/vdso32/vdso32.so.dbg
 $(obj)/vdso64_wrapper.o : $(obj)/vdso64/vdso64.so.dbg
+
+# for cleaning
+subdir- += vdso32 vdso64
-- 
2.30.2

