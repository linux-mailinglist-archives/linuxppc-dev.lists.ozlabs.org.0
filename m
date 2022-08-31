Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B422D5A811E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 17:22:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHnwX546pz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 01:22:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXMTB1pz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uXMTB1pz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHnvs03fFz3bdy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 01:21:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 86637B821AD;
	Wed, 31 Aug 2022 15:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89678C433C1;
	Wed, 31 Aug 2022 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661959298;
	bh=DTL+LV2yF2EH+15dxhJXJ7zmzomlghacq3fufP//T8g=;
	h=From:To:Cc:Subject:Date:From;
	b=uXMTB1pzQhVDzse2eYe/8fReXNqRMnQhKSVL2CIhKlqloRVvQDRTOewBE7hor/JOx
	 d/aUvJZzk9oOiwH1rnRAuSiZxyCYYnjYaAT5jGThcsse21w1aulO8aykX5M27CyXQd
	 mGY1POf0PmgNFhpHCnYtEdDXjim59m3G4gHxRyPn0Nj7eOHZNHFVGeETdKnw5rlXDp
	 rCz4IsOUdTy235EpZoMo88pmu2v66QVenNSHBrOmOXoeGz4T59FkekGj6XoTNlK7v+
	 y6NCuqG5j114iAEwU0jGIHlOuoDQlW0EDyRoZtTncI9XQwb+Adh+R+ck7m15a1Wrzc
	 AC7kEk7O3SbwA==
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/math_emu/efp: Include module.h
Date: Wed, 31 Aug 2022 08:20:15 -0700
Message-Id: <20220831152014.3501664-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.3
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
Cc: kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building with a recent version of clang, there are a couple of
errors around the call to module_init():

  arch/powerpc/math-emu/math_efp.c:927:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
  module_init(spe_mathemu_init);
  ^
  int
  arch/powerpc/math-emu/math_efp.c:927:13: error: a parameter list without types is only allowed in a function definition
  module_init(spe_mathemu_init);
              ^
  2 errors generated.

module_init() is a macro, which is not getting expanded because module.h
is not included in this file. Add the include so that the macro can
expand properly, clearing up the build failure.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

No Fixes tag because it seems likely that this is a transient include
issue (the code builds with GCC). The robot blamed commit e8c07082a810
("Kbuild: move to -std=gnu11") but I think that just exposed these
errors, not caused them.

 arch/powerpc/math-emu/math_efp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/math-emu/math_efp.c b/arch/powerpc/math-emu/math_efp.c
index 39b84e7452e1..aa3bb8da1cb9 100644
--- a/arch/powerpc/math-emu/math_efp.c
+++ b/arch/powerpc/math-emu/math_efp.c
@@ -17,6 +17,7 @@
 
 #include <linux/types.h>
 #include <linux/prctl.h>
+#include <linux/module.h>
 
 #include <linux/uaccess.h>
 #include <asm/reg.h>

base-commit: dcf8e5633e2e69ad60b730ab5905608b756a032f
-- 
2.37.3

