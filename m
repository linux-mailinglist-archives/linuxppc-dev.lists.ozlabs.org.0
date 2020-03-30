Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4812197634
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:08:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQ7R73GCzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:08:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--courbet.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=39qebxgckdeclx30kn2pxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--courbet.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=R5aQu0gP; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rQ356jPZzDqXP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:04:10 +1100 (AEDT)
Received: by mail-qt1-x84a.google.com with SMTP id v49so14228440qtc.20
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:cc;
 bh=6uUpEI08oXikXCp5+9gsd81DMfh5aZ7xYc26aZNsMcE=;
 b=R5aQu0gPcdYxwympNDA6UKdwMEnC2lGvXrGlXdylt5YSMQ4nAlR4gXuAS+7DzVEFW9
 bncYZz2qzYyv60L9tsSIMS6mi7tymeJ2mjj2uFTPgT8gTz02xBhf4Ut/2l8JRwepapq6
 v7MV4eHIuJsBec5DldbEcDJ/X2g+0uDLUfpyPOsLAWJG+7u5noEunaLudIgD88epxYKv
 Jdolza7eiLG5kgnu5wfR62bw23CdRRHVOQAFXqOhIs2UJBqImVKGEcmPswTxOAVJmNqi
 QkhU2j1WsrWkCb5+2hNw1Xx4esmiKqnMFvbnwL0CIsgEPe//N0hq9yOnyhTr3R1xVQrZ
 tHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:cc;
 bh=6uUpEI08oXikXCp5+9gsd81DMfh5aZ7xYc26aZNsMcE=;
 b=tXtextfg/lLq9ltX4RPNq6XvZw9UMxEPa7xiCFB6vlHC/miSW/p6SABYEP6L9r3dzd
 yeOh404J629cxC5WKXEIghkOiB7zbT/f9OKgmtrl63cCesdGfzetvmnp9Q0rtH+Hwp6g
 /vQF451bzNfFzbNYuS+eM82OKXYGfumCIn72jBZIsDk1ucth0VcdUu9BFcf/u7Z6hsX3
 xb9x3F9dSjoUpfh43QMWYjY/OUcxdPBCHsBiMuMfYjt0CKKKAbuEeNhjnibn/kyTpc+s
 U7EoJe9SmIKR/OiHskYpG8PqN41021FSBjQHpfro4km8GIYdbEO8y3S3VsclJLaWESId
 Kvcg==
X-Gm-Message-State: ANhLgQ1WPXwja8brTDB9J73/AsAtOnhSaL3oSVXnJpKpOUA4BFXhCN2O
 Ct0nnnSkXHl0YEtF6gt00NHPxyNp5hC4
X-Google-Smtp-Source: ADFU+vtYJzmxymIGka0/I/Su3giY+YfBRdfUHQGLXnJq4xIk/Xdj15dHeXATi7wBUj2ccVnQni5sms+J4AtS
X-Received: by 2002:ac8:6890:: with SMTP id m16mr10623891qtq.5.1585555446842; 
 Mon, 30 Mar 2020 01:04:06 -0700 (PDT)
Date: Mon, 30 Mar 2020 10:03:56 +0200
In-Reply-To: <20200327100801.161671-1-courbet@google.com>
Message-Id: <20200330080400.124803-1-courbet@google.com>
Mime-Version: 1.0
References: <20200327100801.161671-1-courbet@google.com>
X-Mailer: git-send-email 2.26.0.rc2.310.g2932bb562d-goog
Subject: [PATCH v3] powerpc: Make setjmp/longjmp signature standard
From: Clement Courbet <courbet@google.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Clement Courbet <courbet@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Declaring setjmp()/longjmp() as taking longs makes the signature
non-standard, and makes clang complain. In the past, this has been
worked around by adding -ffreestanding to the compile flags.

The implementation looks like it only ever propagates the value
(in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
with integer parameters.

This allows removing -ffreestanding from the compilation flags.

Context:
https://lore.kernel.org/patchwork/patch/1214060
https://lore.kernel.org/patchwork/patch/1216174

Signed-off-by: Clement Courbet <courbet@google.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
Tested-by: Nathan Chancellor <natechancellor@gmail.com>
Cc: stable@vger.kernel.org # v4.14+
Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

---

v2:
Use and array type as suggested by Segher Boessenkool
Add fix tags.

v3:
Properly place tags.
---
 arch/powerpc/include/asm/setjmp.h | 6 ++++--
 arch/powerpc/kexec/Makefile       | 3 ---
 arch/powerpc/xmon/Makefile        | 3 ---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/setjmp.h b/arch/powerpc/include/asm/setjmp.h
index e9f81bb3f83b..f798e80e4106 100644
--- a/arch/powerpc/include/asm/setjmp.h
+++ b/arch/powerpc/include/asm/setjmp.h
@@ -7,7 +7,9 @@
 
 #define JMP_BUF_LEN    23
 
-extern long setjmp(long *) __attribute__((returns_twice));
-extern void longjmp(long *, long) __attribute__((noreturn));
+typedef long jmp_buf[JMP_BUF_LEN];
+
+extern int setjmp(jmp_buf env) __attribute__((returns_twice));
+extern void longjmp(jmp_buf env, int val) __attribute__((noreturn));
 
 #endif /* _ASM_POWERPC_SETJMP_H */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 378f6108a414..86380c69f5ce 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -3,9 +3,6 @@
 # Makefile for the linux kernel.
 #
 
-# Avoid clang warnings around longjmp/setjmp declarations
-CFLAGS_crash.o += -ffreestanding
-
 obj-y				+= core.o crash.o core_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index c3842dbeb1b7..6f9cccea54f3 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for xmon
 
-# Avoid clang warnings around longjmp/setjmp declarations
-subdir-ccflags-y := -ffreestanding
-
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
 UBSAN_SANITIZE := n
-- 
2.26.0.rc2.310.g2932bb562d-goog

