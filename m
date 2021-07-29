Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C21B3DA65E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 16:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbCZ36qwTz3dDX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 00:28:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=dEba40yz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.67;
 helo=condef-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=dEba40yz; 
 dkim-atps=neutral
Received: from condef-02.nifty.com (condef-02.nifty.com [202.248.20.67])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GbCY45mDvz3cP2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jul 2021 00:27:36 +1000 (AEST)
Received: from conuserg-12.nifty.com ([10.126.8.75])by condef-02.nifty.com
 with ESMTP id 16TEKVZ6003968
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 23:21:00 +0900
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 16TEJpXL024963;
 Thu, 29 Jul 2021 23:19:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 16TEJpXL024963
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1627568394;
 bh=tVlc+Zehc0ZuNG0/0e46gBchE5kb8xTkthFuDGJLr5o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dEba40yzIedI5gzfvTXsJCQJkSOLZ4EuYCn889j29SxvQIqFETZHdwHDF/H0FHTUD
 +us19Q/eOhGVzYjS3GqAsHU6Bvb/BvowgdzazNvQWABBr21XWsGrxyu/wevBYn1mlf
 fIt9PFZSY++HcJIpcgDuWgXqOzEXrl/NDXvFe+W9epOHoRMYT6hDLEg9x6GYlabWcd
 wXYCpnjM7aSGbNX77ls6is3Uty2OSM8gQuI4WrGrXTR2CrLdtRQlDMC/UapNkH58fE
 thrbidXHmSx3cEnjZIYLBOk1c/m5lxqrXoHd8wLQ6BP29InxMb4stSXKaQ7zpe+1tz
 2CiWzGEDX9/og==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc: move the install rule to arch/powerpc/Makefile
Date: Thu, 29 Jul 2021 23:19:37 +0900
Message-Id: <20210729141937.445051-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210729141937.445051-1-masahiroy@kernel.org>
References: <20210729141937.445051-1-masahiroy@kernel.org>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bill Wendling <morbo@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, the install target in arch/powerpc/Makefile descends into
arch/powerpc/boot/Makefile to invoke the shell script, but there is no
good reason to do so.

arch/powerpc/Makefile can run the shell script directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/Makefile      | 3 ++-
 arch/powerpc/boot/Makefile | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 6505d66f1193..9aaf1abbc641 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -407,7 +407,8 @@ endef
 
 PHONY += install
 install:
-	$(Q)$(MAKE) $(build)=$(boot) install
+	sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
+	System.map "$(INSTALL_PATH)"
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 0d165bd98b61..10c0fb306f15 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -444,12 +444,6 @@ $(obj)/zImage:		$(addprefix $(obj)/, $(image-y))
 $(obj)/zImage.initrd:	$(addprefix $(obj)/, $(initrd-y))
 	$(Q)rm -f $@; ln $< $@
 
-# Only install the vmlinux
-install:
-	sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
-
-PHONY += install
-
 # anything not in $(targets)
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
-- 
2.27.0

