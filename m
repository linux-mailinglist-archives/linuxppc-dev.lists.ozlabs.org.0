Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EA822A1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 04:58:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456k9J0tC9zDqJm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 12:58:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.79; helo=conuserg-12.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="j+HUgc6I"; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456k7m6vR5zDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 12:56:52 +1000 (AEST)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id x4K2t5bU012494;
 Mon, 20 May 2019 11:55:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x4K2t5bU012494
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1558320907;
 bh=ItDusmL4vzKNjFPPWLEjK7F5VrZmlSnLB0r8igrrtVc=;
 h=From:To:Cc:Subject:Date:From;
 b=j+HUgc6Iy3uGJafJBfDatmbcg8XLfKdPcuIRs9zPkSTw6ldfduBQfjSqSj4/J910E
 hC3M7apPRTEoSERCF1naff7dVejPT951rueWCZkhEMre0wcFYv1daRvIZFpY2NdGeQ
 0VG0Xrv16XHUgOJjy3mReHruT0bPxbkbS+dw1tXHdA45GIv/ZKKMho/VSGY/BPiFlD
 Tzyx87MZ53EkJDsIdDzFdVxMyo33KWgjjNcxfJvFbZUTXJZJnhtTxsbM/JT4wKbn6B
 U9G3B0+PND9MnvcEhCgsrDa8VW6bSGRKaG29O1G0c2hca+s7m+MLK2vcO4k6qKVmIu
 LC0MGL8WSbmdw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] kbuild: do not check name uniqueness of builtin modules
Date: Mon, 20 May 2019 11:54:37 +0900
Message-Id: <20190520025437.13825-1-yamada.masahiro@socionext.com>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg KH <gregkh@linuxfoundation.org>, Rusty Russell <rusty@rustcorp.com.au>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Jessica Yu <jeyu@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I just thought it was a good idea to scan builtin.modules in the name
uniqueness checking, but Stephen reported a false positive.

ppc64_defconfig produces:

  warning: same basename if the following are built as modules:
    arch/powerpc/platforms/powermac/nvram.ko
    drivers/char/nvram.ko

..., which is a false positive because the former is never built as
a module as you see in arch/powerpc/platforms/powermac/Makefile:

  # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
  # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
  # CONFIG_NVRAM=y
  obj-$(CONFIG_NVRAM:m=y)         += nvram.o

Since we cannot predict how tricky Makefiles are written in wild,
builtin.modules may potentially contain false positives. I do not
think it is a big deal as far as kmod is concerned, but false positive
warnings in the kernel build makes people upset. It is better to not
do it.

Even without checking builtin.modules, we have enough (and more solid)
test coverage with allmodconfig.

While I touched this part, I replaced the sed code with neater one
provided by Stephen.

Link: https://lkml.org/lkml/2019/5/19/120
Link: https://lkml.org/lkml/2019/5/19/123
Fixes: 3a48a91901c5 ("kbuild: check uniqueness of module names")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/modules-check.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 2f659530e1ec..39e8cb36ba19 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -6,10 +6,10 @@ set -e
 # Check uniqueness of module names
 check_same_name_modules()
 {
-	for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
+	for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
 	do
-		echo "warning: same basename if the following are built as modules:" >&2
-		sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
+		echo "warning: same module names found:" >&2
+		sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
 	done
 }
 
-- 
2.17.1

