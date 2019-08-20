Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F2895843
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 09:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CMkz1pZfzDqgn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 17:25:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CMhx2xqlzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 17:23:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 46CMhx272Hz9s00; Tue, 20 Aug 2019 17:23:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46CMhx1pKSz9s3Z; Tue, 20 Aug 2019 17:23:29 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: will@kernel.org
Subject: [PATCH] powerpc/Makefile: Always pass --synthetic to nm if supported
Date: Tue, 20 Aug 2019 17:23:19 +1000
Message-Id: <20190820072319.2884-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
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
Cc: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, pcc@google.com,
 linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Back in 2004 we added logic to arch/ppc64/Makefile to pass
the --synthetic option to nm, if it was supported by nm.

Then in 2005 when arch/ppc64 and arch/ppc were merged, the logic to
add --synthetic was moved inside an #ifdef CONFIG_PPC64 block within
arch/powerpc/Makefile, and has remained there since.

That was fine, though crufty, until recently when a change to
init/Kconfig added a config time check that uses $(NM). On powerpc
that leads to an infinite loop because Kconfig uses $(NM) to calculate
some values, then the powerpc Makefile changes $(NM), which Kconfig
notices and restarts.

The original commit that added --synthetic simply said:
  On new toolchains we need to use nm --synthetic or we miss code
  symbols.

And the nm man page says that the --synthetic option causes nm to:
  Include synthetic symbols in the output. These are special symbols
  created by the linker for various purposes.

So it seems safe to always pass --synthetic if nm supports it, ie. on
32-bit and 64-bit, it just means 32-bit kernels might have more
symbols reported (and in practice I see no extra symbols). Making it
unconditional avoids the #ifdef CONFIG_PPC64, which in turn avoids the
infinite loop.

Debugged-by: Peter Collingbourne <pcc@google.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 2 --
 1 file changed, 2 deletions(-)

See the original discussion here: https://lore.kernel.org/lkml/CAMn1gO6P_VfDRjGZb67ZS4Kh0wjTEQi0cbOkmibTokHQOgP7qw@mail.gmail.com/

 
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a9..403f7e193833 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -39,13 +39,11 @@ endif
 uname := $(shell uname -m)
 KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defconfig
 
-ifdef CONFIG_PPC64
 new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' > /dev/null; then echo y; else echo n; fi)
 
 ifeq ($(new_nm),y)
 NM		:= $(NM) --synthetic
 endif
-endif
 
 # BITS is used as extension for files which are available in a 32 bit
 # and a 64 bit version to simplify shared Makefiles.
-- 
2.21.0

