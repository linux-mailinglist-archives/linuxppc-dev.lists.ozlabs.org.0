Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E92B4362
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 13:13:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZSdp4CtQzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 23:13:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZSYS3dYBzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 23:09:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ZbgmUQ5E; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CZSYR74WYz9s1l; Mon, 16 Nov 2020 23:09:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CZSYR4ypxz9sPB; Mon, 16 Nov 2020 23:09:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1605528571;
 bh=6A7R6hXBzktVAliInkv7WMJvPqsNyb2IbSOaOZ0E2qM=;
 h=From:To:Cc:Subject:Date:From;
 b=ZbgmUQ5Edo6V5mjRw3t7a2sD+xqpGP0KzFaUHiKoA0L1HuRQiYl/EGo3xTC9RJO2D
 LDQ5rYRVBJhp8MiBKBNGqz+eTnhnty9bdjKRSE4J/Ycj4HhBichZURClEZXOEzwBAR
 etJgCeJl1CfZYXgIsLDV01ixVIM/v+8Os/7xJGpyEArPwqp/UpBkZkWBCP+YDYQTX6
 JCjA4C68a2hKHn1zsKMh9ID+4MayQzgNhNPOyo/Co7MXywl6psU7PFJes81q6VS+lN
 QwE4PTMMDwSWWyGYSxc+z3zRzZCGHKcOLFPwoMC9j2EXp6inCcUnDl+/z+/eGuJBgb
 qqVBVdjTSy9oQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc: Drop -me200 addition to build flags
Date: Mon, 16 Nov 2020 23:09:13 +1100
Message-Id: <20201116120913.165317-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: ndesaulniers@google.com, linux-kernel@vger.kernel.org, oss@buserror.net,
 natechancellor@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently a build with CONFIG_E200=y will fail with:

  Error: invalid switch -me200
  Error: unrecognized option -me200

Upstream binutils has never supported an -me200 option. Presumably it
was supported at some point by either a fork or Freescale internal
binutils.

We can't support code that we can't even build test, so drop the
addition of -me200 to the build flags, so we can at least build with
CONFIG_E200=y.

Reported-by: Németh Márton <nm127@freemail.hu>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---

More discussion: https://lore.kernel.org/lkml/202011131146.g8dPLQDD-lkp@intel.com
---
 arch/powerpc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a4d56f0a41d9..16b8336f91dd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -248,7 +248,6 @@ KBUILD_CFLAGS		+= $(call cc-option,-mno-string)
 cpu-as-$(CONFIG_40x)		+= -Wa,-m405
 cpu-as-$(CONFIG_44x)		+= -Wa,-m440
 cpu-as-$(CONFIG_ALTIVEC)	+= $(call as-option,-Wa$(comma)-maltivec)
-cpu-as-$(CONFIG_E200)		+= -Wa,-me200
 cpu-as-$(CONFIG_E500)		+= -Wa,-me500
 
 # When using '-many -mpower4' gas will first try and find a matching power4
-- 
2.25.1

