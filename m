Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E67577FD90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 20:12:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TaGbMUFB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRY5N3R4qz3c1H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 04:12:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=TaGbMUFB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ndesaulniers.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=372lezawkdfwh78m4ofhc8lmaiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--ndesaulniers.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRY4R36VXz3bP2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 04:12:05 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c5fc972760eso169791276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 11:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692295919; x=1692900719;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WDpEeeNNR0Nw6EuE4P52nYwvS2tr5AEnMgO9JS9l+5M=;
        b=TaGbMUFBJl9KSgciaIgpVCisyqbCRpB7YYBG8v79mOmaHpt1tQW4gawLupbCsjGmej
         z0M22Qkxwd6H5Xf9tezwcGzF2BEM0GiWrlMbrqI6y1DxAhLEHpA4LEFNbzzvaS5/USQK
         lnCy83pmJ5KTWktENc5P093oPYM0W7geImacqNCB5v+MvPhMCV3KLqFUNdtuwxAttkjP
         dtl8Pb8QNhuqq+jGhdU0UI1QD77M36OE/e70pTSQuPwf6Xf8AlWO0BYWDs6MfgyskmLc
         s0mENOVB8d4jdzMDABjzbc2Nrq6t54AzWyred9TY2rPT9nehfBlceHHhguFaNgrKcA0v
         avfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692295919; x=1692900719;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDpEeeNNR0Nw6EuE4P52nYwvS2tr5AEnMgO9JS9l+5M=;
        b=jsm9gJ50AaBnWkd4vh4XxYOVt0vBQiOnawwoydinswLRI82vaGQWWfUjK6CZuwIldl
         9YfUpSTJfRZhCT9Q7DBWONjlIsJAWguXn3pshLlLUwRS3VRfGbvnTtOX45RtYL3r30HT
         8RnvmHHCVCNDXdN55Xgk4OUPgHHkDwGRh7RX8xDVJTuaUKsob9EkidpAJ3EVxEHmZd7J
         AtXoGN0k/9JbyqoDCpH7Up0NvOyozO3j3g6/Eel5t4uF/uFnfSNH5g4MMkanG8eAoSje
         BWgA4O+0wqL+GvHXRQQ/M+XXggnZtQSG4igk5hG6gt3VF45kXb3I+HPiWMJUxNGMmxi6
         r5TA==
X-Gm-Message-State: AOJu0YwBkJsOgl3/tCerkPhbRo8LtLfbmGSzIxfKYQ9nS8PwMVoOp5S6
	NEaaPK+JyHmWAFoPepWPu/it3s0PMzVvZwjcIlI=
X-Google-Smtp-Source: AGHT+IHGCNqBSivcUqwjOFgkuqC7Ixw26kQNxulLbkpUGpA9QPWtOwJPpJ84qHhcCJciZbWLNwY8Ah3LFW97G3/jWMA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:ede8:d843:1818:cd60])
 (user=ndesaulniers job=sendgmr) by 2002:a25:e7ca:0:b0:d74:347:1e3 with SMTP
 id e193-20020a25e7ca000000b00d74034701e3mr4153ybh.9.1692295919476; Thu, 17
 Aug 2023 11:11:59 -0700 (PDT)
Date: Thu, 17 Aug 2023 11:11:56 -0700
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOti3mQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0Nz3YKC5PiK3Pw83RQjC4sUCwNjM0ODVCWg8oKi1LTMCrBR0bG1tQA SG74bWgAAAA==
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692295917; l=1306;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=KvMdBaUrJ04OP30COeFfEE9LlNaItBIz7QURy18B4Q4=; b=0evZ866zmAcV3WRRll2szvRKmqpke+TXcD3BeqNZENNAC0GzwFFUTYVL/l+EVlX7ETBXDWTYb
 1ikpSuCMENIDTDAuHTqXGGIONyo6p216JYBb88Z9dqYHLzGgZbHiDDV
X-Mailer: b4 0.12.3
Message-ID: <20230817-ppc_xmon-v1-1-8cc2d51b9995@google.com>
Subject: [PATCH] Revert "powerpc/xmon: Relax frame size for clang"
From: ndesaulniers@google.com
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="utf-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 9c87156cce5a63735d1218f0096a65c50a7a32aa.

I have not been able to reproduce the reported -Wframe-larger-than=
warning (or disassembly) with clang-11 or clang-18.

I don't know precisely when this was fixed in llvm, but it may be time
to revert this.

Closes: https://github.com/ClangBuiltLinux/linux/issues/252
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/xmon/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index d334de392e6c..7705aa74a24d 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -10,12 +10,6 @@ KCSAN_SANITIZE := n
 # Disable ftrace for the entire directory
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
 
-ifdef CONFIG_CC_IS_CLANG
-# clang stores addresses on the stack causing the frame size to blow
-# out. See https://github.com/ClangBuiltLinux/linux/issues/252
-KBUILD_CFLAGS += -Wframe-larger-than=4096
-endif
-
 ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
 
 obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o

---
base-commit: 16931859a6500d360b90aeacab3b505a3560a3ed
change-id: 20230817-ppc_xmon-d288d803610e

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>

