Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6783E063
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 18:37:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSfQhLxS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM4dh4sK0z3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 04:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eSfQhLxS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM4ct1MdQz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 04:36:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 82D3B6256A;
	Fri, 26 Jan 2024 17:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C985EC43394;
	Fri, 26 Jan 2024 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706290601;
	bh=4iVM9+Je1Wsvrrm8yBmVzSmaL5OSsQ/orDrecbPYen8=;
	h=From:Date:Subject:To:Cc:From;
	b=eSfQhLxSwoBb3Kl5xmdZLqSuNuEh4sZLAQEbkIFuELSIvawi+eWE4VifIzKJCA1xN
	 ud1K2sDHZNEU+9NvzpLehMGrBwNA4FU/V6dfTCEcGsUFYvYx28DdLpnYMZWeJhtiHt
	 X+5wCY7lKxz5xbS0snMo2gaEI5jMmOH45EU6PgHKEsH9TXVOYxHjajQ70IUsmNEEYc
	 pZpno9hTFis1oZzYWC1I57fwnnTLaU1tGIlGe7G2trNV+pdTwa7eZgHkKgPwTE+CvH
	 bgA9Kf+bcqp1jm0MgmdiwKDSnypDEaJh3yKnN6nvrKvwJajC3jW70LmygRvcReN0VI
	 iSb3Ln+zquTMA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:36:31 -0700
Subject: [PATCH 4.19] powerpc: Use always instead of always-y in for
 crtsavres.o
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ7ts2UC/x3M0QqDMAxA0V+RPC9iuiLTXxl7iDWdYWJLKttA/
 PeVPR643AOKmEqBsTnA5K1F01ZBlwbCwttTUOdqcJ3zHbkePdKAUb+46oQ5fcRywInDKyfbsY+
 eb+7KcySG+sgmtf3/7+BbGuBxnj+ZDa74dQAAAA==
To: gregkh@linuxfoundation.org, sashal@kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=nathan@kernel.org;
 h=from:subject:message-id; bh=4iVM9+Je1Wsvrrm8yBmVzSmaL5OSsQ/orDrecbPYen8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmb3664uenfguxwHdbUCL8t+sYm6TnH3/BZ2O1hYW21S
 LaVEj7RUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACbyXYjhnz43z6GLhtYb33a+
 UVdp3nvb1mS73BMVQzv1rYUH5Jb+s2VkmCcRtPnbAR/3Y2wbl33v/vtp6Sc5ndnrDd86Vqz0nRX
 swg8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit is for linux-4.19.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-4.19.y as commit b7b85ec5ec15 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: b7b85ec5ec15 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 6f1e57182876..f0aa6fc8c6b2 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -21,8 +21,8 @@ obj-$(CONFIG_PPC32)	+= div64.o copy_32.o crtsavres.o strlen_32.o
 # 64-bit linker creates .sfpr on demand for final link (vmlinux),
 # so it is only needed for modules, and only for older linkers which
 # do not support --save-restore-funcs
-ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-always-$(CONFIG_PPC64)	+= crtsavres.o
+ifeq ($(call ld-ifversion, -lt, 225000000, y)$(CONFIG_PPC64),yy)
+always	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \

---
base-commit: b060cfd3f707ad3c8ae8322e1b149ba7e2cf33e0
change-id: 20240126-4-19-fix-lib-powerpc-backport-6f4a823adf1a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

