Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D58BB709A72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 16:51:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN8tg4r6vz3fLw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 00:51:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VaD18pva;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=ribalda@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=VaD18pva;
	dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN8q406zbz3fD8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 00:48:31 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso5830908a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684507708; x=1687099708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXwbVblZO4SjZiyR2RJlU+1lPwt65C7sEIHn8p960bg=;
        b=VaD18pvaYOrPW92cQcoX/NEFyAia0fIgR3ptOsuxx7KqL2m3/Fogz3ohdrjtw8jIAf
         /EDDCPYx2T0p21USc97DaVoXS6yaR7TsMgEpNMeajTXb8D6rWvFbDapW+nC79TBs8v+N
         rMi14ZDfRFVBtp/DNGdIPfZ3+MAQ50UYsHPYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684507708; x=1687099708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXwbVblZO4SjZiyR2RJlU+1lPwt65C7sEIHn8p960bg=;
        b=UO0J/+U35gpXJ+RL04tMNwc3BwUYR30sMdPfIwVqEifw/hq2yVBIHNfl6pP7P+26Rg
         ns/Fr4muXV2SzoRLb5NmSuJEdS6lh+BPAvUj2cn9Wr/L4/0nIxFaaJqBBBKLf0KNOuNh
         lO5hAWqhZHr7bm4iK8W7vL/VUyxaBkJt8ql5AsppSMBqGamjpxm1wh0et7uoIDtU5lvT
         fwWiiDz8C+PNrsOY4ec/EzxfB24e5r6OjclVih5NN9d54ohQ5F0JIKflar1IuZL5AWcp
         OQU7zVRn9AvW74HG2JXcrwQoPj0J52P6oWJ5dJYDIrH5wigxH9tPvYfpP+zT8vKgxmCV
         K1tA==
X-Gm-Message-State: AC+VfDwbY3NxGF5hvvsGJufLLbxmSUjGdQVeHYn5uhZPs8+tiePgKN3a
	GxLMSiNqYk91DgXyXyLnmqSGkg==
X-Google-Smtp-Source: ACHHUZ6IJYry1zbpAYrsb/Nt01gDEwYVyd3RcsdkRiDkcM4NVXli57Wi75rvrU+p/H5SVbhZnecZhA==
X-Received: by 2002:a17:906:5d09:b0:948:a1ae:b2c4 with SMTP id g9-20020a1709065d0900b00948a1aeb2c4mr2454616ejt.6.1684507708255;
        Fri, 19 May 2023 07:48:28 -0700 (PDT)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:62fd:274b:c2ab:69bb])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090680c200b0096a68648329sm2349437ejx.214.2023.05.19.07.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 07:48:27 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 May 2023 16:47:38 +0200
Subject: [PATCH v7 3/4] powerpc/purgatory: Remove PGO flags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230321-kexec_clang16-v7-3-b05c520b7296@chromium.org>
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
In-Reply-To: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
To: Eric Biederman <ebiederm@xmission.com>, 
 Philipp Rudo <prudo@linux.vnet.ibm.com>, Dave Young <dyoung@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=nWZ2BYP6i2Y8oRo+uF2PHambNY95ZiGn4TiaTAGbKto=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBkZ4wyHkNCHhezyfivzJzrNGMs0K4vUNQRc3pJJ
 kWHuaNU3qOJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCZGeMMgAKCRDRN9E+zzrE
 iP+cEACcWHC3j1LmIzpKx/SEOuyu+T8juc3Qsp240gztvu/viz42y8/iBia84BlsRwErLK2OL0F
 3ajW94BvdF+hTyHozZEgIagItfSauWAbew6wVa0Qzfv2fr5mU42KfHptzq1l42en7K2rPbcBmLI
 I2P1/oqo/f6jOgRfm+rkNph26o3SqzcGwOrNJxLkICIjOt2ryabXBD6m79TkrzdPaB9SoChGJac
 O79LnGL81Pw+Yncu0mYsV4I5Rjw5ZeyFHdpQ7Fz5EA8wvSDDG6odoFxcqf4yE6+bmUv/49AELSz
 4dxJdTvbEKZro9lHA0iSPkRPv/S0GQJu/n8ilKFXAYPfqAfDYAN86mjt4xRWsDrK/m2U5bJyQDO
 y1Bsea8Nuec1BFMA7YRXUDVC9wxgK6i5U1QYeDdEOWjG8KsrN7aDk6FT7Vs5HVZVFlpaYzxI1Qy
 OuCwULJN4OB++Blq1pndCgv3Enk4iWEnD3tV8M5ZGZEkwnZmi1PxTzTAUZrdHBuiBcGUJURHEal
 /D5/1Q6A+bUxW980Yzwcu1tPuxwKe1lCW0boDcrNi3inwoNG0wyymcZvtfl/+IKzenjCXxuZ8c4
 54evV8xE1nlppSTiE5EscgwFuFxb6elq+Frz99s4912olrL9bjc84OFEQ1brCORAnz/ZbTuENqO
 ZuH2pEvCDHPT0rw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, Baoquan He <bhe@redhat.com>, Philipp Rudo <prudo@redhat.com>, llvm@lists.linux.dev, Ross Zwisler <zwisler@google.com>, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, stable@vger.kernel.org, Simon Horman <horms@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kexec@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If profile-guided optimization is enabled, the purgatory ends up with
multiple .text sections.
This is not supported by kexec and crashes the system.

Cc: stable@vger.kernel.org
Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_puragory")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 arch/powerpc/purgatory/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/purgatory/Makefile b/arch/powerpc/purgatory/Makefile
index 6f5e2727963c..78473d69cd2b 100644
--- a/arch/powerpc/purgatory/Makefile
+++ b/arch/powerpc/purgatory/Makefile
@@ -5,6 +5,11 @@ KCSAN_SANITIZE := n
 
 targets += trampoline_$(BITS).o purgatory.ro
 
+# When profile-guided optimization is enabled, llvm emits two different
+# overlapping text sections, which is not supported by kexec. Remove profile
+# optimization flags.
+KBUILD_CFLAGS := $(filter-out -fprofile-sample-use=% -fprofile-use=%,$(KBUILD_CFLAGS))
+
 LDFLAGS_purgatory.ro := -e purgatory_start -r --no-undefined
 
 $(obj)/purgatory.ro: $(obj)/trampoline_$(BITS).o FORCE

-- 
2.40.1.698.g37aff9b760-goog

