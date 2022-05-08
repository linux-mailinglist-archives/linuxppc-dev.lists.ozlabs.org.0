Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8EF51F023
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 21:19:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxDcy5Jz0z3fQG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 05:19:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=qukJg56K;
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
 header.s=dec2015msa header.b=qukJg56K; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxDR80YDHz3cFB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 05:10:43 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 248J8qSb030019;
 Mon, 9 May 2022 04:09:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 248J8qSb030019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652036949;
 bh=kEJzb0HV+D+/XrwgoxTro+DuX7He9WiLcsjIpQbmj1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qukJg56KBZ9tZ03DmIaB9J1P4O7T2033NPHrrIrxUDw+CxtspATGP01RIt7e5lRW7
 Z8d0neV5tpH0H3TYmv0hMpJxAL9VAxXFzSQF/5g3A1IjTi29mpDwgfF06WWsZSX5Im
 yDb1xo+Xai3ITqVXuc0tRlGv9PFYYTlh16npzqtGNUCBMoVpF4TzSRhmI053U+0Kmw
 wyggrDnu5+Ia8Gr8loCssyY4pFSbbT80GGZPVSnGJforCXrcRDvyitQ5GwCx0KhjaM
 DL7xFka0yMQBpnZa4OptbEq1Zpd1lu0vQNHcLPJIofLQeG1/BA9PY8WRI6Vdl4WfIv
 mbiloPzfyyMUQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v4 14/14] kbuild: rebuild multi-object modules when objtool is
 updated
Date: Mon,  9 May 2022 04:06:31 +0900
Message-Id: <20220508190631.2386038-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220508190631.2386038-1-masahiroy@kernel.org>
References: <20220508190631.2386038-1-masahiroy@kernel.org>
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
 Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org, Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT is enabled, objtool for
multi-object modules is postponed until the objects are linked together.

Make sure to re-run objtool and re-link multi-object modules when
objtool is updated.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
---

Changes in v4:
  - New
    Resent of my previous submission
    https://lore.kernel.org/linux-kbuild/20210831074004.3195284-11-masahiroy@kernel.org/

 scripts/Makefile.build | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f546b5f1f33f..4e6902e099e8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -404,13 +404,18 @@ $(obj)/modules.order: $(obj-m) FORCE
 $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
-quiet_cmd_link_multi-m = LD [M]  $@
-      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ @$(patsubst %.o,%.mod,$@) $(cmd_objtool)
+quiet_cmd_ld_multi_m = LD [M]  $@
+      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$(patsubst %.o,%.mod,$@) $(cmd_objtool)
+
+define rule_ld_multi_m
+	$(call cmd_and_savecmd,ld_multi_m)
+	$(call cmd,gen_objtooldep)
+endef
 
 $(multi-obj-m): objtool-enabled := $(delay-objtool)
 $(multi-obj-m): part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
-	$(call if_changed,link_multi-m)
+	$(call if_changed_rule,ld_multi_m)
 $(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
 
 targets := $(filter-out $(PHONY), $(targets))
-- 
2.32.0

