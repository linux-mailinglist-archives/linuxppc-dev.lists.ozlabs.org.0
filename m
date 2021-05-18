Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DF53881C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 22:59:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fl7fX57S1z30Cc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 06:59:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=esqjwBlz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3lsqkyawkdiyxno2k4vxso12qyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=esqjwBlz; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fl7f347l8z2xg6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 06:59:05 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id
 s10-20020a05620a030ab02902e061a1661fso1619107qkm.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 13:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=nnsMNSAI45Y61w2ZwBBkPC0ZzHgySsNQlypNad+FRoA=;
 b=esqjwBlzLOiKotMW09Du14ROzMqRS857IjgeTucMFUKAqnbXWJDyRt15fr+8vLpIKr
 T1eEEbyofUbsHLOQaohOsCwO57jpBxw0vBIx2phAja8dWCU7Qih06YOVKPKDw8q1LqsG
 ZUqIwXhRZpqymHYfAgblPGRNzQnXwHwwMOWLaJUTdPwyTtqa/+Kv6poqxqbksq6g3+kb
 TsPqwzjIDkb4Y2HdpZ+gPoCOMdHCJgPEooByl5HQXOKCzQuedhJuLnp4sHSFn2qC+rN7
 AQmqnjq+vF1zZJ7KfrKju7puYPsCpskXUBpb6KalINQ5KhQt3Q/RPrMYk6hV+PIuL1E4
 AXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=nnsMNSAI45Y61w2ZwBBkPC0ZzHgySsNQlypNad+FRoA=;
 b=mQt1FSvqNcbVUYDBKDInxhYoLHiJC1CGLQIXhrbHO6NIGyROzxcMKKSoR4ulFIRV+z
 7NHma8tlaQAcmfx8raIXfzXRmTpNacNCQN3S4ErXglUIYITAuW3ZRbBVM7MzPramD8ip
 BZlpdwcVd0305UOIaz9wXcDfaz54uYBrg4B4XGw6j+Pqlh9WdCOPlJU3igR0TOan1J2M
 2JR87LOGA88jVpbEYSs/5aMnrEgUqXg4wrDIo5kv9ifyd8KtQzXdI/K4aR0CygHDFoSK
 gtNQlVeGgfiAjTCbeOK0bNTY5A1zUJJSWMV2jYese8UKfW2xwhbyObdjaXuIKKIioNpL
 QaBQ==
X-Gm-Message-State: AOAM530pF/VpSGlg85M+/UbyT66BKg2XS5uK5YwBuOFKPuI0aNcn9Agk
 8mfhKZVODVRuwtvXPw4okjKC+bkxDlEqaxktcbA=
X-Google-Smtp-Source: ABdhPJzLXe5fcHrZr+dhBgrrMBuJvRjijTzgEAczvcdBQ5qmM0LOeNAM9JzQs+YYe2+wCuIlawCmy4lJfoz1fmAjzB0=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:5ce9:69f5:c21b:140f])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:450f:: with SMTP id
 k15mr8283687qvu.4.1621371541687; Tue, 18 May 2021 13:59:01 -0700 (PDT)
Date: Tue, 18 May 2021 13:58:57 -0700
Message-Id: <20210518205858.2440344-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
Subject: [PATCH] powerpc: Kconfig: disable CONFIG_COMPAT for clang < 12
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Fangrui Song <maskray@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Until clang-12, clang would attempt to assemble 32b powerpc assembler in
64b emulation mode when using a 64b target triple with -m32, leading to
errors during the build of the compat VDSO. Simply disable all of
CONFIG_COMPAT; users should upgrade to the latest release of clang for
proper support.

Link: https://github.com/ClangBuiltLinux/linux/issues/1160
Link: https://github.com/llvm/llvm-project/commits/2288319733cd5f525bf7e24dece08bfcf9d0ff9e
Link: https://groups.google.com/g/clang-built-linux/c/ayNmi3HoNdY/m/XJAGj_G2AgAJ
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ce3f59531b51..2a02784b7ef0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -289,6 +289,7 @@ config PANIC_TIMEOUT
 config COMPAT
 	bool "Enable support for 32bit binaries"
 	depends on PPC64
+	depends on !CC_IS_CLANG || CLANG_VERSION >= 120000
 	default y if !CPU_LITTLE_ENDIAN
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
-- 
2.31.1.751.gd2f1c929bd-goog

