Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDAFB03A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:27:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T9PR5K9kzF3t0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:27:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="px6b4SIH"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T9GM6VHRzF3qh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 04:21:47 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id k6so13530343wrn.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GO23KGSs5kHbgoAK5zj/r8U5QGqjyd8r2ZN58CM8zQ=;
 b=px6b4SIHi7B132q4zg1w5hzHQ1m4CKKv3m/MiEVdt1uUL59NACme+DKlGdWGna5W5I
 a1r/Pvvz4XYWlLcYo9eGBJ1ZzPHjIBVTZ8WtFaqjYN4hTxo1dH/WtSItfQaiICCpjKpQ
 QVsKiSRVWKEZpX3svoLPnx5zSj1snwTefpaDm2GjaXjV9b1rYrEZDjBb6Jdo+1hsrnaK
 Gtaxjd0125CDUo3p/qtr/VCxWaA566gjpD+FlWMAseaN3I5bSqXsd1HnpTwFN9yRXUjM
 +UcdJu6U2kKikAVwNv2WgJoIpeXBxpbEQbERXYlhYk0twsoo923OXdhzZkyJDsmh9q2H
 fO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GO23KGSs5kHbgoAK5zj/r8U5QGqjyd8r2ZN58CM8zQ=;
 b=ADBs8PrnAhkr1CCIrxjJchiy6f/y0aY5EbBC3c7jB2+geichs3nVU9zwCnn4nqrgPd
 RO8++WTYI+/+Np5MDpaO4dKrn/v9xJKAGgCAW9osIUT36RgGqmrE89i6ezWFkHvp3Si3
 aHnKe5SLPiPogaJ49Bb9U0iterpbFrlSyOjsDsrR7GZjaM4afBV6bskyQ1/zX+YrGvtj
 8eMNvt5xaO+Lt8dYmQVhBoegw7SKC2IMtTkqGMSda0sBo3wezubi+aF8D8NTaTLP/1AS
 harrTzPapTZA0+UUxAGYUn9rbFmhCoSvBxNnF/2S3a/RE7syIXaI7yfkmmFlZBD9WSlE
 pPFw==
X-Gm-Message-State: APjAAAVqZdxX4Agxukg75i7NW3gyjYxatlR6F5KYQp/KwgzJAgN+tH+a
 9O7aZbXpfVlDFzyhW1hy7WI=
X-Google-Smtp-Source: APXvYqxLJhyRMbR/c7ChtdkpyoJmx7ehdi/qJxEzmAmumCkVERS6ST//GMwU3xyqIByyT/h57RQx3Q==
X-Received: by 2002:adf:de03:: with SMTP id b3mr30023354wrm.14.1568226104312; 
 Wed, 11 Sep 2019 11:21:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id q9sm2356753wmq.15.2019.09.11.11.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 11:21:43 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 2/3] powerpc: Avoid clang warnings around setjmp and longjmp
Date: Wed, 11 Sep 2019 11:20:51 -0700
Message-Id: <20190911182049.77853-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190911182049.77853-1-natechancellor@gmail.com>
References: <20190911182049.77853-1-natechancellor@gmail.com>
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
Suggested-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v3:

* Use -ffreestanding instead of outright disabling the warning because
  it is legitimate.

I skipped v2 because the first patch in the series already had a v2.

 arch/powerpc/kernel/Makefile | 4 ++--
 arch/powerpc/xmon/Makefile   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index c9cc4b689e60..19f19c8c874b 100644
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
2.23.0

