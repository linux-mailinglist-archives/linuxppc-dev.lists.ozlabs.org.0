Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750051B8DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv4z23HSDz3cYd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=T77AYbWp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=T77AYbWp; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv4wR50d7z2xdN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:25:11 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 2457Neni019426;
 Thu, 5 May 2022 16:23:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 2457Neni019426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651735421;
 bh=mq8Yk8ot1m2mhjLX32XL2W0Bgs0dGB51vVKxKbSTMUk=;
 h=From:To:Cc:Subject:Date:From;
 b=T77AYbWp+W8B/eXgnFGulan20TeHw3N6W7RIXt54h6dPGoOqBWyaZNhM/USm2COY1
 1ai4VjljO6SS+KIZdz9zDlbPcqhQnBQeKneHyAHJdZ84G+BLsISEwrf5tO5Dr/i9PB
 F94bzoe3Oo0TSu1N115G9q5JVECDckPxmFdLpg9iBzUQAI0aY2wPXdhmYVFSHyMMFO
 q9se3e2KHp4ASisYM7uhuvaAfDDmUKe07fp1pOQ7PQebdARYuQLzr56U6xU38UYJDq
 pBOrMk+PhVZ1hXHhscAEgaCyhjpTKX5PIofvTZP38NtlwKytBpwbg0AN2yAxcYmtWJ
 JIz/mJfS9d9Bw==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v3 00/15] kbuild: yet another series of cleanups (modpost, LTO,
 MODULE_REL_CRCS)
Date: Thu,  5 May 2022 16:22:29 +0900
Message-Id: <20220505072244.1155033-1-masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier a <nicolas@fjasle.eu>,
 Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This is the third batch of cleanups in this development cycle.

Major changes in v3:

 - Generate symbol CRCs as C code, and remove CONFIG_MODULE_REL_CRCS.

Major changes in v2:

 - V1 did not work with CONFIG_MODULE_REL_CRCS.
   I fixed this for v2.

 - Reflect some review comments in v1

 - Refactor the code more

 - Avoid too long argument error


Masahiro Yamada (15):
  modpost: mitigate false-negatives for static EXPORT_SYMBOL checks
  modpost: change the license of EXPORT_SYMBOL to bool type
  modpost: merge add_{intree_flag,retpoline,staging_flag} to add_header
  modpost: move *.mod.c generation to write_mod_c_files()
  kbuild: generate a list of objects in vmlinux
  kbuild: record symbol versions in *.cmd files
  modpost: extract symbol versions from *.cmd files
  kbuild: link symbol CRCs at final link, removing
    CONFIG_MODULE_REL_CRCS
  kbuild: stop merging *.symversions
  genksyms: adjust the output format to modpost
  kbuild: do not create *.prelink.o for Clang LTO or IBT
  modpost: simplify the ->is_static initialization
  modpost: use hlist for hash table implementation
  kbuild: make built-in.a rule robust against too long argument error
  kbuild: make *.mod rule robust against too long argument error

 arch/powerpc/Kconfig         |   1 -
 arch/s390/Kconfig            |   1 -
 arch/um/Kconfig              |   1 -
 include/asm-generic/export.h |  22 +-
 include/linux/export.h       |  30 +--
 include/linux/symversion.h   |  13 +
 init/Kconfig                 |   4 -
 kernel/module.c              |  10 +-
 scripts/Kbuild.include       |   4 +
 scripts/Makefile.build       | 118 +++------
 scripts/Makefile.lib         |   7 -
 scripts/Makefile.modfinal    |   5 +-
 scripts/Makefile.modpost     |   9 +-
 scripts/genksyms/genksyms.c  |  18 +-
 scripts/link-vmlinux.sh      |  46 ++--
 scripts/mod/file2alias.c     |   2 -
 scripts/mod/list.h           |  52 ++++
 scripts/mod/modpost.c        | 449 ++++++++++++++++++++---------------
 scripts/mod/modpost.h        |   2 +
 19 files changed, 402 insertions(+), 392 deletions(-)
 create mode 100644 include/linux/symversion.h

-- 
2.32.0

