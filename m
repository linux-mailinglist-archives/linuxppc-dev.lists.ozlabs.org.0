Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8204060AA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:17:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5Gf50jqPz2ywJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:17:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DsykcG7L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DsykcG7L; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5GdT5lvmz2xsg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:16:45 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C91461186;
 Fri, 10 Sep 2021 00:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233003;
 bh=rrP6UZKWyt1RVKSSBV5KUzVqgGPtefHEyDItHTegIAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DsykcG7LrQ/IhV5CLKEBeAYD5sZPC6r6z5wh8l9vtNmhgdstBuhsd2zHYp8J90CbV
 PMTjhN/HpNyUJmDpni1B6vSGy7esFATYd6W9LyTOebp3RGzC+XsuspQutPueikurWI
 c/cc4oKo48OhTs9p48x3vLg6hTgOtKxlO2idTt61sdw1pZXNhsl0cZh+1k5lWn6NzO
 WiXlhTujcPnTjpKK4nRU1ahLIgHa7Q+1YOAhr1OHR5W6m9THkbOcZz00/vpKHsGvxH
 X7kx/uphQUuU+MWlWiHTM6mmqNchmyd4QfKaLR8wuuHNIgHUlIph9f2cD33QW8lTYI
 ZKBwOOhIe7fTg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 32/99] powerpc: make the install target not
 depend on any build artifact
Date: Thu,  9 Sep 2021 20:14:51 -0400
Message-Id: <20210910001558.173296-32-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit 9bef456b20581e630ef9a13555ca04fed65a859d ]

The install target should not depend on any build artifact.

The reason is explained in commit 19514fc665ff ("arm, kbuild: make
"make install" not depend on vmlinux").

Change the PowerPC installation code in a similar way.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210729141937.445051-2-masahiroy@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/boot/Makefile   |  2 +-
 arch/powerpc/boot/install.sh | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index e312ea802aa6..b90e53e413c8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -445,7 +445,7 @@ $(obj)/zImage.initrd:	$(addprefix $(obj)/, $(initrd-y))
 	$(Q)rm -f $@; ln $< $@
 
 # Only install the vmlinux
-install: $(CONFIGURE) $(addprefix $(obj)/, $(image-y))
+install:
 	sh -x $(srctree)/$(src)/install.sh "$(KERNELRELEASE)" vmlinux System.map "$(INSTALL_PATH)"
 
 # Install the vmlinux and other built boot targets.
diff --git a/arch/powerpc/boot/install.sh b/arch/powerpc/boot/install.sh
index b6a256bc96ee..8d669cf1ccda 100644
--- a/arch/powerpc/boot/install.sh
+++ b/arch/powerpc/boot/install.sh
@@ -21,6 +21,20 @@
 # Bail with error code if anything goes wrong
 set -e
 
+verify () {
+	if [ ! -f "$1" ]; then
+		echo ""                                                   1>&2
+		echo " *** Missing file: $1"                              1>&2
+		echo ' *** You need to run "make" before "make install".' 1>&2
+		echo ""                                                   1>&2
+		exit 1
+	fi
+}
+
+# Make sure the files actually exist
+verify "$2"
+verify "$3"
+
 # User may have a custom install script
 
 if [ -x ~/bin/${INSTALLKERNEL} ]; then exec ~/bin/${INSTALLKERNEL} "$@"; fi
-- 
2.30.2

