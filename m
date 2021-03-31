Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C0034FC3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 11:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9LF40TH0z3c5n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 20:12:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9LDl4rfzz30Cn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 20:12:22 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9LDf6FVrz9v077;
 Wed, 31 Mar 2021 11:12:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FLi6KVY5Vd5c; Wed, 31 Mar 2021 11:12:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9LDf5PXTz9v076;
 Wed, 31 Mar 2021 11:12:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A57BF8B7F8;
 Wed, 31 Mar 2021 11:12:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7CojbRHYE_Jc; Wed, 31 Mar 2021 11:12:19 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 63D5C8B7FB;
 Wed, 31 Mar 2021 11:12:19 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 28D8D67624; Wed, 31 Mar 2021 09:12:19 +0000 (UTC)
Message-Id: <8bb015bc98c51d8ced581415b7e3d157e18da7c9.1617181918.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/vdso: Make sure vdso_wrapper.o is rebuilt everytime
 vdso.so is rebuilt
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 masahiroy@kernel.org
Date: Wed, 31 Mar 2021 09:12:19 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of
vgettimeofday.o") moved vdso32_wrapper.o and vdso64_wrapper.o out
of arch/powerpc/kernel/vdso[32/64]/ and removed the dependencies in
the Makefile. This leads to the wrappers not being re-build hence the
kernel embedding the old vdso library.

Add back missing dependencies to ensure vdso32_wrapper.o and vdso64_wrapper.o
are rebuilt when vdso32.so.dbg and vdso64.so.dbg are changed.

Fixes: bce74491c300 ("powerpc/vdso: fix unnecessary rebuilds of vgettimeofday.o")
Cc: stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 6084fa499aa3..f66b63e81c3b 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -191,3 +191,7 @@ $(obj)/prom_init_check: $(src)/prom_init_check.sh $(obj)/prom_init.o FORCE
 targets += prom_init_check
 
 clean-files := vmlinux.lds
+
+# Force dependency (incbin is bad)
+$(obj)/vdso32_wrapper.o : $(obj)/vdso32/vdso32.so.dbg
+$(obj)/vdso64_wrapper.o : $(obj)/vdso64/vdso64.so.dbg
-- 
2.25.0

