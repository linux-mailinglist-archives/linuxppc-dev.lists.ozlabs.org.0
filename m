Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DF61012BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 06:03:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HDH675mDzDqVH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 16:03:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::341;
 helo=mail-ot1-x341.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="odrJnbLA"; 
 dkim-atps=neutral
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HD8K3VgCzDqLh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 15:57:21 +1100 (AEDT)
Received: by mail-ot1-x341.google.com with SMTP id f10so16750469oto.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 20:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BfAG347llFRLd3tFIx1Ke7J/fonGQZbEZDA3VvZY+U=;
 b=odrJnbLAQ+lW8dC5pbNDgv4E5e5dOChAG3k/NKL11OtONbwKb18OmogkgowYaoNreY
 /nTmfn66HhS81ckhyMXroeZ7VZAd78gvYQcujp7csy8DeQZLGyVl6axC2Ya/cVeEYwhZ
 LBWLBm83HxtutrXCkFe4ONuEJTxJyczM/eRNFJw2EC/SDa49L2jtHadlz75D5PPcGWnI
 iwOrFq6hxfZgMufhny/94XaoBwmh9eiP1o1G725lHpVnNbFPjPL7ELLZlAr53EUI0f7w
 7TQbdHfJ86cHqKkSoHKrHf6Dv9ddOTezxJ9/Rre4G9IbkREOsr6MPfuCIZQw3BFbAXu6
 t5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BfAG347llFRLd3tFIx1Ke7J/fonGQZbEZDA3VvZY+U=;
 b=e2pziS37uOYmkETgxDbLMHJnQxz8IyiDDLjyDVsMcKazPOh57jfyFzwIutRV9pDuod
 Lm7g9PV6D97Scte70e57fM/FeEiVZiIIBdf+BJeeM2xkzGXphHblryzCTugPT39XtKLJ
 AAhERg9eTKlFPNZqWsw/+UAO11eD5+9jiUyoJ4kQSA+ZiPjQgoi232yA8GWu8lk/ue4s
 sjQmyWyKYWwdk4iZ7CL4yOmyW+8/t3yith3isDLymCCQBhWVvm5AHHs0ul87kbSng75B
 a5o5zeyom8n+cCapwofMVKM9WdCHEJLOkCgDxmfbCdclQe4oQc9EA7EzKIrf5Zkg5QaE
 7Q1w==
X-Gm-Message-State: APjAAAV2pqRSuMYCrwv4PraockFendstUxvXydXXxC4Ut4lCy0N7Nayo
 8U29kUchY98B6r1QM1Iep08=
X-Google-Smtp-Source: APXvYqymsvgrUhQmsQWi69cCe7+4yyiO+K/A7AyiJt/nSKg06hd83Nm3RGBTIb7mwxwlkdDzUCcFiQ==
X-Received: by 2002:a05:6830:2157:: with SMTP id
 r23mr1433047otd.343.1574139438568; 
 Mon, 18 Nov 2019 20:57:18 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::7])
 by smtp.gmail.com with ESMTPSA id e88sm7019765ote.39.2019.11.18.20.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 20:57:18 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 2/3] powerpc: Avoid clang warnings around setjmp and longjmp
Date: Mon, 18 Nov 2019 21:57:11 -0700
Message-Id: <20191119045712.39633-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119045712.39633-1-natechancellor@gmail.com>
References: <20191014025101.18567-1-natechancellor@gmail.com>
 <20191119045712.39633-1-natechancellor@gmail.com>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit aea447141c7e ("powerpc: Disable -Wbuiltin-requires-header when
setjmp is used") disabled -Wbuiltin-requires-header because of a warning
about the setjmp and longjmp declarations.

r367387 in clang added another diagnostic around this, complaining that
there is no jmp_buf declaration.

In file included from ../arch/powerpc/xmon/xmon.c:47:
../arch/powerpc/include/asm/setjmp.h:10:13: error: declaration of
built-in function 'setjmp' requires the declaration of the 'jmp_buf'
type, commonly provided in the header <setjmp.h>.
[-Werror,-Wincomplete-setjmp-declaration]
extern long setjmp(long *);
            ^
../arch/powerpc/include/asm/setjmp.h:11:13: error: declaration of
built-in function 'longjmp' requires the declaration of the 'jmp_buf'
type, commonly provided in the header <setjmp.h>.
[-Werror,-Wincomplete-setjmp-declaration]
extern void longjmp(long *, long);
            ^
2 errors generated.

We are not using the standard library's longjmp/setjmp implementations
for obvious reasons; make this clear to clang by using -ffreestanding
on these files.

Cc: stable@vger.kernel.org # 4.14+
Link: https://github.com/ClangBuiltLinux/linux/issues/625
Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
Link: https://godbolt.org/z/B2oQnl
Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v3 (I skipped v2 because the first patch in the series already
          had a v2):

* Use -ffreestanding instead of outright disabling the warning because
  it is legitimate.

v3 -> v4:

* Rebase on v5.4-rc3

* Add Nick's reviewed-by and Compiler Explorer link.

v4 -> v5:

* Rebase on next-20191118

 arch/powerpc/kernel/Makefile | 4 ++--
 arch/powerpc/xmon/Makefile   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index bb57d168d6f4..3c113ae0de2b 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -5,8 +5,8 @@
 
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
-# Disable clang warning for using setjmp without setjmp.h header
-CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
+# Avoid clang warnings around longjmp/setjmp declarations
+CFLAGS_crash.o		+= -ffreestanding
 
 ifdef CONFIG_PPC64
 CFLAGS_prom_init.o	+= $(NO_MINIMAL_TOC)
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index f142570ad860..c3842dbeb1b7 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for xmon
 
-# Disable clang warning for using setjmp without setjmp.h header
-subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header)
+# Avoid clang warnings around longjmp/setjmp declarations
+subdir-ccflags-y := -ffreestanding
 
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
-- 
2.24.0

