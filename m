Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A28283E06E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 18:38:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiFWv8C1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TM4fW3r1Kz3cWs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 04:38:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZiFWv8C1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TM4dK25n8z3cVj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 04:37:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 866FF6257B;
	Fri, 26 Jan 2024 17:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76CBC43394;
	Fri, 26 Jan 2024 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706290627;
	bh=3QIZ72FdmNJxfJTI/wVAKy9oUIOLAXdb3QQ7TUnEfjI=;
	h=From:Date:Subject:To:Cc:From;
	b=ZiFWv8C125lFdQlkGCn4RlFCr72xq+O1KSrF/kqcxrs0CmrPPBHDKC6IsO+SsoWaz
	 9AjoYDuBQb9/P5aNO0NJSmPBildJr+jW9bVWjjogctBh7d8M9H+f9Cm2R3kuPOpBIh
	 jhrM8kFdwEyZfptJc7epu4g4UH+ez7lzHUDVf3tOuC/ngiwKKj4LR408FiNYDaj8Xm
	 KfTyhhSAENkVxVN700MWdfH34Z5RcUwWWP2j+sikMoI54Igc4ITYZrpmUdUNmUhyk1
	 Ag4RNmZpDAb4CkjTGcWOmx4pBKrh+zF7GQ4RLO3mjFB9pKoIlTCLpLvzOiQgiRc1ud
	 79cUSuZ3G28WA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 26 Jan 2024 10:37:02 -0700
Subject: [PATCH 5.4] powerpc: Use always instead of always-y in for
 crtsavres.o
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-5-4-fix-lib-powerpc-backport-v1-1-2c110ed18b1d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL3ts2UC/x3MQQqDMBBA0avIrDuiaaLYq0gXOhl1UEyYiC2Id
 2/o8sHnX5BYhRO8iguUT0kS9oz6UQAtwz4zis8GUxlb1aZBhxYn+eImI8bwYY2E40BrDHpg513
 bNvbpaSLIi6ic2/++B1daeN/3D0kY9YBzAAAA
To: gregkh@linuxfoundation.org, sashal@kernel.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1893; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3QIZ72FdmNJxfJTI/wVAKy9oUIOLAXdb3QQ7TUnEfjI=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmb3x5iPR34rc9j+ta/2RVm3c/PbLkk47q8Qu3aYl3Xj
 KsHRerqOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE+A8zMmxUSn0utdna4Yzs
 U9XnR1W7/sxWeLXTXKj85RcvOYmV044y/GZh3jDnRcOyS1au4vdt9L99X/PO++h8tisnCn4dvJw
 aLcIIAA==
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

This commit is for linux-5.4.y only, it has no direct upstream
equivalent.

Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
hostprogs/always-y"), always-y did not exist, making the backport of
mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
instead of extra-y") to linux-5.4.y as commit 245da9eebba0 ("powerpc:
add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
build with linkers that need crtsavres.o:

  ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory

Backporting the aforementioned kbuild commit is not suitable for stable
due to its size and number of conflicts, so transform the always-y usage
to an equivalent form using always, which resolves the build issues.

Fixes: 245da9eebba0 ("powerpc: add crtsavres.o to always-y instead of extra-y")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/powerpc/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 7c603839fe28..841e6ed30f13 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -34,8 +34,8 @@ obj-$(CONFIG_FUNCTION_ERROR_INJECTION)	+= error-inject.o
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
base-commit: f0602893f43a54097fcf22bd8c2f7b8e75ca643e
change-id: 20240126-5-4-fix-lib-powerpc-backport-9d577643dcfc

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

