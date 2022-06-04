Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7253D62B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 10:53:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LFYRs37hFz3byY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jun 2022 18:52:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=P1D+qmFK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.78; helo=conuserg-11.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=P1D+qmFK;
	dkim-atps=neutral
Received: from conuserg-11.nifty.com (conuserg-11.nifty.com [210.131.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LFYRB24NJz302N
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jun 2022 18:52:21 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp [133.32.177.133]) (authenticated)
	by conuserg-11.nifty.com with ESMTP id 2548p0xo013521;
	Sat, 4 Jun 2022 17:51:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 2548p0xo013521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1654332661;
	bh=FEAy194PWq95HNbYDnr1IqurmUH0R2wQrRmS1HC000s=;
	h=From:To:Cc:Subject:Date:From;
	b=P1D+qmFKkOacKls3HlfteNNBNbd46qHxatZFOoNxKzKI7qCjiD7P5mXwp51JouN3e
	 WvF8ToAxeBgnAny1boG6PxhPcFE42TG+1OSnhr8UtAAdz6ncuHuVA8tYENs6QfI3sM
	 R7zrVo8VuWsASAk7d2fQbqnma/rf8H1xhe6AIQvgD7tfZNaCMvngd+gv9Z7Ts9DriX
	 13zgBwgocKc9E2+G04x8jh+7ayALIgY71pdsjLPXaAxidMveTXBtRz/2VdmC2kvynE
	 XgeL5A8l2/cFWe37pBB8rsG3m6zg1mV5SdHi56K64Ec4xfdDZdXuPvUfnN3zpyZUwQ
	 XIOXj7GpyrfGw==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: get rid of #include <generated/compile.h>
Date: Sat,  4 Jun 2022 17:50:50 +0900
Message-Id: <20220604085050.4078927-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
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
Cc: Rob Herring <robh@kernel.org>, Jason Yan <yanaijie@huawei.com>, Scott Wood <oss@buserror.net>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, Diana Craciun <diana.craciun@nxp.com>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frank.rowand@sony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

You cannot include <generated/compile.h> here because it is generated
in init/Makefile but there is no guarantee that it happens before
arch/powerpc/mm/nohash/kaslr_booke.c is compiled for parallel builds.

The places where you can reliably include <generated/compile.h> are:

  - init/          (because init/Makefile can specify the dependency)
  - arch/*/boot/   (because it is compiled after vmlinux)

Commit f231e4333312 ("hexagon: get rid of #include <generated/compile.h>")
fixed the last breakage at that time, but powerpc re-added this.

<genearated/compile.h> was unneeded because 'build_str' is almost the
same as 'linux_banner' defined in init/version.c

Let's copy the solution from MIPS.
(get_random_boot() in arch/mips/kernel/relocate.c)

Fixes: 6a38ea1d7b94 ("powerpc/fsl_booke/32: randomize the kernel image offset")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

If this gets into the mainline before -rc2 or -rc3,
I will base my kbuild work on top of this.


 arch/powerpc/mm/nohash/kaslr_booke.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 96c38f971603..5f81c076621f 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -18,7 +18,6 @@
 #include <asm/prom.h>
 #include <asm/kdump.h>
 #include <mm/mmu_decl.h>
-#include <generated/compile.h>
 #include <generated/utsrelease.h>
 
 struct regions {
@@ -36,10 +35,6 @@ struct regions {
 	int reserved_mem_size_cells;
 };
 
-/* Simplified build-specific string for starting entropy. */
-static const char build_str[] = UTS_RELEASE " (" LINUX_COMPILE_BY "@"
-		LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION;
-
 struct regions __initdata regions;
 
 static __init void kaslr_get_cmdline(void *fdt)
@@ -70,7 +65,8 @@ static unsigned long __init get_boot_seed(void *fdt)
 {
 	unsigned long hash = 0;
 
-	hash = rotate_xor(hash, build_str, sizeof(build_str));
+	/* build-specific string for starting entropy. */
+	hash = rotate_xor(hash, linux_banner, strlen(linux_banner));
 	hash = rotate_xor(hash, fdt, fdt_totalsize(fdt));
 
 	return hash;
-- 
2.32.0

