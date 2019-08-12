Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC48956B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 04:43:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466Ksj1W8yzDqhk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 12:43:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dGYrhLjU"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Kr65QGKzDqd1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 12:42:14 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id z11so1317954wrt.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 19:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yf3qi63BI9X/BYxP9kfuXNqP3LoeT8xFrAy0fp782mo=;
 b=dGYrhLjUkDj2WJPilmQW4xy3C/uREHCHQArXSMNPDpqIEW9bXvBveorN4AIx/dBEBe
 0IkYNrxa9lAnkMJQXZ8wtfmbkrk+mazm1sj+6pmuwC6RtgaCLHWHvMBXtwwj5i4Bwr6z
 XSdF0bZl23ZHz02JGh+C6o0Ogd7SV07ZxeFGWc5pLmEIv37r71wPOVREl39RsxL4WeQi
 LjrWDs8vWNaphnVGSXNBpuEOY3FEWcLexSOZjN3/XqToEJ4aIAhvO6DSvpf3equX5y+N
 A9BH5e2HrddMzVAAQqxQG5cw91i83TPYgUZrvmZWjx2Kl+fMd8XA4R1I8w25DqBfrbRi
 yLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yf3qi63BI9X/BYxP9kfuXNqP3LoeT8xFrAy0fp782mo=;
 b=bN4Hcl/Oc1OUpaHC0JEwJ4SHf5ffT31m4G2fododqdw/EhstWMOzKv/yLGHLoIb6YC
 SWBXy3EVLUkh7Hb2C7+zf3XaQEsmS+6HKKZHwu12fiHuZQ+va6wtnjIJUcTWlZGF2aFM
 Y+IP1IUp5Bw6tByHoyJjT+SkRW6s59ldZD+2fyQ5+iPTqXkAI4wnja255HG0xjFRyScZ
 1/mb5cPTy380UWzowtOfWk5eSAdK4OBJSLNzvgFYfKoxzT1L0eSPTPRXfTBUMtcNJKpV
 lXxA9ptiUcf0aQJdY103jK/E8Kuchg54V2wqp8PPZIczZb6+OoNwbRJ7ahjFQQhW+j+a
 0loQ==
X-Gm-Message-State: APjAAAW3TOWH/jgFcIIRqmRAkikf2/iwPcSGu7F4kBuszxvBveEVL8sR
 Ji8jdFJEfqEtLm3NGCxzVc4=
X-Google-Smtp-Source: APXvYqznAqEJ+GJ49TKqcvfBU6PxEdk43wnddnbNxpFj/DrvwKZy6Mob6j4soONcsG3hwYBtyUIFZg==
X-Received: by 2002:adf:dbcc:: with SMTP id e12mr28643909wrj.205.1565577728170; 
 Sun, 11 Aug 2019 19:42:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id a26sm16705786wmg.45.2019.08.11.19.42.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 11 Aug 2019 19:42:07 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Date: Sun, 11 Aug 2019 19:32:15 -0700
Message-Id: <20190812023214.107817-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

Take the same approach as the above commit by disabling the warning for
the same reason, we provide our own longjmp/setjmp function.

Cc: stable@vger.kernel.org # 4.19+
Link: https://github.com/ClangBuiltLinux/linux/issues/625
Link: https://github.com/llvm/llvm-project/commit/3be25e79477db2d31ac46493d97eca8c20592b07
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

It may be worth using -fno-builtin-setjmp and -fno-builtin-longjmp
instead as it makes it clear to clang that we are not using the builtin
longjmp and setjmp functions, which I think is why these warnings are
appearing (at least according to the commit that introduced this waring).

Sample patch:
https://github.com/ClangBuiltLinux/linux/issues/625#issuecomment-519251372

However, this is the most conservative approach, as I have already had
someone notice this error when building LLVM with PGO on tip of tree
LLVM.

 arch/powerpc/kernel/Makefile | 5 +++--
 arch/powerpc/xmon/Makefile   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index ea0c69236789..44e340ed4722 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -5,8 +5,9 @@
 
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
-# Disable clang warning for using setjmp without setjmp.h header
-CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
+# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
+CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header) \
+			   $(call cc-disable-warning, incomplete-setjmp-declaration)
 
 ifdef CONFIG_PPC64
 CFLAGS_prom_init.o	+= $(NO_MINIMAL_TOC)
diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
index f142570ad860..53f341391210 100644
--- a/arch/powerpc/xmon/Makefile
+++ b/arch/powerpc/xmon/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for xmon
 
-# Disable clang warning for using setjmp without setjmp.h header
-subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header)
+# Avoid clang warnings about longjmp and setjmp built-ins (inclusion of setjmp.h and declaration of jmp_buf type)
+subdir-ccflags-y := $(call cc-disable-warning, builtin-requires-header) \
+		    $(call cc-disable-warning, incomplete-setjmp-declaration)
 
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
-- 
2.23.0.rc2

