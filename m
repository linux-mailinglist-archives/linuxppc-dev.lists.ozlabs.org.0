Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5AC677C7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 05:24:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lwBB5hQdzDqcF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 13:24:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.77; helo=conuserg-10.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="H+3dgelz"; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lw802FVbzDqn1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 13:22:07 +1000 (AEST)
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net
 [126.26.94.249]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x6D3LCS2001105;
 Sat, 13 Jul 2019 12:21:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6D3LCS2001105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1562988073;
 bh=1IdPDx4QX0euUr4uIRn/uQ11mnE9aURyo1Zm0ZEzzSs=;
 h=From:To:Cc:Subject:Date:From;
 b=H+3dgelzRhySedQpLwoncmnFJlhOAC6smKw42tgxGW66g4TX+fG+zinNh4AGqdkBV
 sDGCcJP/3jlpIUG+9H4jbL5ashVrZTqBN9PoDIP1bG9kY/0MaTaWYJ4vBpWTxX4Omf
 RqW5HPyA59GEjvtFZ1wcuentYVv5NNZkFEWlYZ9ZehokwLXXZUshr7g+PqbMuvcy50
 SzPi5sTmajRUbguE4yWfcNru+V6pjhCXQaux7lpKlKU9UnUp/SKGF9Fj6AQYfpeOG8
 YIUYRITsvVlb8B8NQYEZJcn7roPqrgX41eu2sOvXQ7hqe6g0yNBm2702TTuTtq5KU+
 bWX8tcpizGxbg==
X-Nifty-SrcIP: [126.26.94.249]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
Date: Sat, 13 Jul 2019 12:21:06 +0900
Message-Id: <20190713032106.8509-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The KBUILD_ARFLAGS addition in arch/powerpc/Makefile has never worked
in a useful way because it is always overridden by the following code
in the top Makefile:

  # use the deterministic mode of AR if available
  KBUILD_ARFLAGS := $(call ar-option,D)

The code in the top Makefile was added in 2011, by commit 40df759e2b9e
("kbuild: Fix build with binutils <= 2.19").

The KBUILD_ARFLAGS addition for ppc has always been dead code from the
beginning.

Nobody has reported a problem since 43c9127d94d6 ("powerpc: Add option
to use thin archives"), so this code was unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/powerpc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index c345b79414a9..46ed198a3aa3 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -112,7 +112,6 @@ ifeq ($(HAS_BIARCH),y)
 KBUILD_CFLAGS	+= -m$(BITS)
 KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
-KBUILD_ARFLAGS	+= --target=elf$(BITS)-$(GNUTARGET)
 endif
 
 cflags-$(CONFIG_STACKPROTECTOR)	+= -mstack-protector-guard=tls
-- 
2.17.1

