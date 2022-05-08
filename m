Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217351EF2F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 21:11:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxDRb6yT9z3cV8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 05:11:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=PTC5AciD;
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
 header.s=dec2015msa header.b=PTC5AciD; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxDQR2ZFSz3bpj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 05:10:06 +1000 (AEST)
Received: from grover.sesame (133-32-177-133.west.xps.vectant.ne.jp
 [133.32.177.133]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id 248J8qSO030019;
 Mon, 9 May 2022 04:08:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 248J8qSO030019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1652036934;
 bh=EBR85XaMbeh0T44CkrvtpS6BU3Sm5SGyK1Gdmfon54A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PTC5AciDMODiNXRU2PTnmk/Nwzp1l6EM7aBTzt78lmVSYpuq8SdjA4xBxBzEkxcdO
 8WrNcZpTU18ZLSLe5RFUcBbBPM7kyxEZTH/zOWHL8C4wQ2mjaQXDATd+mLzL/WqRvK
 nB4F9ntC1xAYdFhznHMTS0b7bHzOqc3VrFk8oarmJfY/M0jRNN482Y+jU2uoA3GbMz
 jjfZU1+e+qCno/glVueakLSuyqIXsW/RhI6oS3mmuadLcm0zDhY5JVRFPlQPrPxgad
 uCN4On5jSUifzzZ+HwqT6LOFaIPIKmmo+qhlwFRv9QWb+wVX8f0y3r59ljMhUa0dSA
 vyUu9oISFXdpQ==
X-Nifty-SrcIP: [133.32.177.133]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH v4 01/14] modpost: remove left-over cross_compile declaration
Date: Mon,  9 May 2022 04:06:18 +0900
Message-Id: <20220508190631.2386038-2-masahiroy@kernel.org>
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
 Sami Tolvanen <samitolvanen@google.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a remnant of commit 6543becf26ff ("mod/file2alias: make
modalias generation safe for cross compiling").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v4:
  - New patch

 scripts/mod/modpost.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index cfa127d2bb8f..d9daeff07b83 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -174,7 +174,6 @@ static inline unsigned int get_secindex(const struct elf_info *info,
 }
 
 /* file2alias.c */
-extern unsigned int cross_build;
 void handle_moddevtable(struct module *mod, struct elf_info *info,
 			Elf_Sym *sym, const char *symname);
 void add_moddevtable(struct buffer *buf, struct module *mod);
-- 
2.32.0

