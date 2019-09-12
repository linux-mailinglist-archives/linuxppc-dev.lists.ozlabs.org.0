Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAF1B09A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 09:43:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TW3S5x9MzF48N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 17:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.74; helo=conuserg-07.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="b5zTIocn"; 
 dkim-atps=neutral
Received: from conuserg-07.nifty.com (conuserg-07.nifty.com [210.131.2.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TW1Y5ptzzF43v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 17:41:53 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x8C7edBo002482;
 Thu, 12 Sep 2019 16:40:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8C7edBo002482
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1568274040;
 bh=tYNGmUKDdlHdaYWdH5IidgIolcOzTVD5cgXor3vQ83I=;
 h=From:To:Cc:Subject:Date:From;
 b=b5zTIocnN33/DdUDcjaMeyjFzoTtbxCd5868rKO0xNO0s4hj4TNzpDUOblkZcIN5s
 blwV1MedYVuH8L4E6jhrG9tGRK5B6XcHeO9hj0vbKerkxkYHo2Ide3IG4M/1a7c4bX
 1PaFV6ym3Hz6Rf1JatWU/532qvHQvpov555Eto+SN0h143gBLKQRZ81xTz1moDF4q8
 PIRr9nPjvDy9VjennU0QLC/d+55xbxsG5lX6PE7UvoAwocoen+R8QD/u8uMmFMIzBi
 yEL4RALzlrR3T6bfH2CDH66vDOel/m3mCNo/vLZ6dB9qFtFdxrTaTKOewUmDQU56i6
 cURS0DcBm/zvw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: improve prom_init_check rule
Date: Thu, 12 Sep 2019 16:40:37 +0900
Message-Id: <20190912074037.13813-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Firoz Khan <firoz.khan@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This slightly improves the prom_init_check rule.

[1] Avoid needless check

Currently, prom_init_check.sh is invoked every time you run 'make'
even if you have changed nothing in prom_init.c. With this commit,
the script is re-run only when prom_init.o is recompiled.

[2] Beautify the build log

Currently, the O= build shows the absolute path to the script:

  CALL    /abs/path/to/source/of/linux/arch/powerpc/kernel/prom_init_check.sh

With this commit, it is always a relative path to the timestamp file:

  PROMCHK arch/powerpc/kernel/prom_init_check

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/kernel/.gitignore |  1 +
 arch/powerpc/kernel/Makefile   | 14 ++++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/.gitignore b/arch/powerpc/kernel/.gitignore
index c5f676c3c224..67ebd3003c05 100644
--- a/arch/powerpc/kernel/.gitignore
+++ b/arch/powerpc/kernel/.gitignore
@@ -1 +1,2 @@
+prom_init_check
 vmlinux.lds
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 56dfa7a2a6f2..07bf5a45f176 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -184,15 +184,13 @@ extra-$(CONFIG_ALTIVEC)		+= vector.o
 extra-$(CONFIG_PPC64)		+= entry_64.o
 extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init.o
 
-ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
-$(obj)/built-in.a:		prom_init_check
+extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+= prom_init_check
 
-quiet_cmd_prom_init_check = CALL    $<
-      cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" "$(obj)/prom_init.o"
+quiet_cmd_prom_init_check = PROMCHK $@
+      cmd_prom_init_check = $(CONFIG_SHELL) $< "$(NM)" $(obj)/prom_init.o; touch $@
 
-PHONY += prom_init_check
-prom_init_check: $(src)/prom_init_check.sh $(obj)/prom_init.o
-	$(call cmd,prom_init_check)
-endif
+$(obj)/prom_init_check: $(src)/prom_init_check.sh $(obj)/prom_init.o FORCE
+	$(call if_changed,prom_init_check)
+targets += prom_init_check
 
 clean-files := vmlinux.lds
-- 
2.17.1

