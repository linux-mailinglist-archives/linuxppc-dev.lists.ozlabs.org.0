Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A676751EF49
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 21:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxDSG3Q40z3cCV
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 05:11:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=F4LJf0iz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=F4LJf0iz; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxDQR2ghHz3bqw
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 05:10:06 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 248J8qSN030019;
 Mon, 9 May 2022 04:08:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 248J8qSN030019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652036933;
 bh=+vYUwETkJzeHMTCZ91mKcqrVUk+DZUgc4qJxVJGLB84=;
 h=From:To:Cc:Subject:Date:From;
 b=F4LJf0izMBoQwKKxFHapf/UWVkpce+bBOiPQDjYdwhGn4tjnhTYWvzVVqkcyPq804
 wDV3dj2VXzZ3nUn50spW30wo44yeinntn/zLBECDNy+HKuo4c5WjW594yBUMLi9HJT
 wh0d+02rTX2YFYjP5EQT1idNsaC0NZxLKCzsyElUxjIq91/u5NWViltNUAbCDr/fI1
 c4RsAMtN7VODeWSApmkeeIwtBppqcGR83Ocb9ZjcSCDL6dvRZ/T1gTzeJUi+3NL62D
 i3XLkjzJPLGGjjGT9pziJq2TeZyq+C4VDoadGLSYb3U3a6/WRGfI2AjWqpDZg7phzF
 89WOSAQW+ZG/A==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v4 00/14] kbuild: yet another series of cleanups (modpost, LTO,
 MODULE_REL_CRCS, export.h)
Date: Mon,  9 May 2022 04:06:17 +0900
Message-Id: <20220508190631.2386038-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Sami Tolvanen <samitolvanen@google.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the third batch of cleanups in this development cycle.

Major changes in v4:
 - Move static EXPORT_SYMBOL check to a script
 - Some refactoring

Major changes in v3:

 - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.

Major changes in v2:

 - V1 did not work with CONFIG_MODULE_REL_CRCS.
   I fixed this for v2.

 - Reflect some review comments in v1

 - Refactor the code more

 - Avoid too long argument error



Masahiro Yamada (14):
  modpost: remove left-over cross_compile declaration
  modpost: change the license of EXPORT_SYMBOL to bool type
  modpost: split the section mismatch checks into section-check.c
  modpost: add sym_find_with_module() helper
  modpost: extract symbol versions from *.cmd files
  kbuild: link symbol CRCs at final link, removing
    CONFIG_MODULE_REL_CRCS
  kbuild: stop merging *.symversions
  genksyms: adjust the output format to modpost
  kbuild: do not create *.prelink.o for Clang LTO or IBT
  kbuild: check static EXPORT_SYMBOL* by script instead of modpost
  kbuild: make built-in.a rule robust against too long argument error
  kbuild: make *.mod rule robust against too long argument error
  kbuild: add cmd_and_savecmd macro
  kbuild: rebuild multi-object modules when objtool is updated

 arch/powerpc/Kconfig            |    1 -
 arch/s390/Kconfig               |    1 -
 arch/um/Kconfig                 |    1 -
 include/asm-generic/export.h    |   22 +-
 include/linux/export-internal.h |   16 +
 include/linux/export.h          |   30 +-
 init/Kconfig                    |    4 -
 kernel/module.c                 |   10 +-
 scripts/Kbuild.include          |   10 +-
 scripts/Makefile.build          |  134 +--
 scripts/Makefile.lib            |    7 -
 scripts/Makefile.modfinal       |    5 +-
 scripts/Makefile.modpost        |    9 +-
 scripts/check-local-export      |   48 +
 scripts/genksyms/genksyms.c     |   18 +-
 scripts/link-vmlinux.sh         |   33 +-
 scripts/mod/Makefile            |    2 +-
 scripts/mod/modpost.c           | 1499 ++++---------------------------
 scripts/mod/modpost.h           |   35 +-
 scripts/mod/section-check.c     | 1222 +++++++++++++++++++++++++
 20 files changed, 1551 insertions(+), 1556 deletions(-)
 create mode 100644 include/linux/export-internal.h
 create mode 100755 scripts/check-local-export
 create mode 100644 scripts/mod/section-check.c

-- 
2.32.0

