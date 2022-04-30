Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D9515C5D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 13:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kr66Z3QMpz3bd8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 21:08:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=I7Qf2fOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=202.248.20.66;
 helo=condef-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=I7Qf2fOE; 
 dkim-atps=neutral
Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Kr65x5W8Gz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 21:08:05 +1000 (AEST)
Received: from conuserg-11.nifty.com ([10.126.8.74])by condef-01.nifty.com
 with ESMTP id 23UB5js6021298
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 20:06:00 +0900
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-11.nifty.com with ESMTP id 23UB4siD001142;
 Sat, 30 Apr 2022 20:04:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 23UB4siD001142
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651316695;
 bh=qFq62hBbENoaVAD7QD5BdAfmy70jfETPcpl34tqTGjQ=;
 h=From:To:Cc:Subject:Date:From;
 b=I7Qf2fOElOZRV86gYmAf4dApBSqjae3RPU5dBtFAMNakp0UAMWsj53+BtUffL/s7K
 fv2rpSJ+kL+TuEfGB90vgdJG7L5vL4+qZs53EDuGOr6QrX8GSCdMgaVPYqn/8/DW9s
 53f3eFcA24PZXc5Obrlluia7RO7W3lO9oYsvdtwx2dALx+DtJBu4XhIbAiVzobW7Wc
 kthogHWmHUd87WiJmnJnMHTka7loeCuauLagwZ3dhNjtIJIkqMLj33mfIBEbw/nP2N
 SZidkAb3XkSTizPaWU3FqEFilx/vQ7FTLTQTq8bwm1M6Q/g7vRVjuFrMK6+Ju4WvyU
 BnOgzQ2eQ4LlA==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: drop $(objtree)/ prefix support for clean-files
Date: Sat, 30 Apr 2022 20:04:09 +0900
Message-Id: <20220430110409.256858-1-masahiroy@kernel.org>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Paul Gortmaker <paul.gortmaker@windriver.com>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I think this hack is a bad idea. arch/powerpc/boot/Makefile is the
only user. Let's stop doing this.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/boot/Makefile | 4 ++--
 scripts/Makefile.clean     | 8 +-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 4b4827c475c6..008bf0bff186 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -453,8 +453,8 @@ clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 clean-kernel-base := vmlinux.strip vmlinux.bin
 clean-kernel := $(addsuffix .gz,$(clean-kernel-base))
 clean-kernel += $(addsuffix .xz,$(clean-kernel-base))
-# If not absolute clean-files are relative to $(obj).
-clean-files += $(addprefix $(objtree)/, $(clean-kernel))
+# clean-files are relative to $(obj).
+clean-files += $(addprefix ../../../, $(clean-kernel))
 
 WRAPPER_OBJDIR := /usr/lib/kernel-wrapper
 WRAPPER_DTSDIR := /usr/lib/kernel-wrapper/dts
diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index 74cb1c5c3658..878cec648959 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -36,13 +36,7 @@ __clean-files	:= \
 
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
-# clean-files is given relative to the current directory, unless it
-# starts with $(objtree)/ (which means "./", so do not add "./" unless
-# you want to delete a file from the toplevel object directory).
-
-__clean-files   := $(wildcard                                               \
-		   $(addprefix $(obj)/, $(filter-out $(objtree)/%, $(__clean-files))) \
-		   $(filter $(objtree)/%, $(__clean-files)))
+__clean-files   := $(wildcard $(addprefix $(obj)/, $(__clean-files)))
 
 # ==========================================================================
 
-- 
2.32.0

