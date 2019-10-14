Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF00ED59B5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 04:56:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s39r1h74zDqTR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 13:56:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::241; helo=mail-oi1-x241.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="q4vo8JFU"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s33d6cf2zDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 13:51:25 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id k20so12562870oih.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 19:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F36EaD5caKU9PTKbiMakPn6QNXZEgKWjgXwIAtKPD44=;
 b=q4vo8JFU4HugUERMWeB4mHp+fw5ON+93BhOylrPtQkKaqZFfDIVrpOI058PORX4ei/
 4Hn53KbXlJBc+Lb8QNW7fHlCUD80Mc8lsyFrLV3A9nZb3I9fUthgPkRYm/zkEYx/bWt4
 bOark5DAZa5oJYf0hn6FaM941/TMhBhsD21D7UOL29rHMZ7OlSPqTetpsNxp2ISsPOYw
 XpSF8cZQVABFIkW/wj83bqNW07tSrE47jJvVBLDxgUUJbQawgownaEircNT+0Matmc65
 gSrGwtWsybRFx0VzHTUbtSNxJsDinfJ+zJP5W8gNfguBxiSqKyzwGyQHRwI2qbSW8B0N
 ZjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F36EaD5caKU9PTKbiMakPn6QNXZEgKWjgXwIAtKPD44=;
 b=Ii21oKDPRDB0uu5r8E/lJW9fogay/ETEZ1NdzfGlyyk/Rqrl19yf3NK6HishmGED/j
 /gdawzxL7QCHgbLx7Elk6/zOOMae3tMvEeS7BsmytXI65sglJmY9S+dkj0io8cb79IKj
 x5/GG1c/JH6oKnyhs4VDB4FeOwByXRUP8kv+oAb2R+kqvo0f89F0E25N9Bw9zpFXwmHd
 LJmeMz1elgnSifmDsTXy3w3muN7bL1gvWPIxF6NXGTVJhmFuNhL2w9dbYSg95nEbbo7t
 qvIoDzoPiqO6cH3Ogv4F1cDX3BAdf80mSKQMwcgfrfKfXP3kUBbrmWWKG2MbJnOPcp7d
 qWHA==
X-Gm-Message-State: APjAAAUJu3oVgxvNt4TsHR6ssfy1YX19bpQujmkCw0a/8InAWAop7uLQ
 tFlSt48TbEVwHvZaW/OYJa8=
X-Google-Smtp-Source: APXvYqy3kpE2sfbwIeSFxIb/hb5mCSnlacPCXCspcSJ3kpbP6k1gek+DidMuI5Jk8HkzUiU5Nl5vhQ==
X-Received: by 2002:aca:53c3:: with SMTP id
 h186mr23216972oib.174.1571021483233; 
 Sun, 13 Oct 2019 19:51:23 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 11sm5612491otg.62.2019.10.13.19.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 19:51:22 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 2/3] powerpc: Avoid clang warnings around setjmp and longjmp
Date: Sun, 13 Oct 2019 19:51:00 -0700
Message-Id: <20191014025101.18567-3-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014025101.18567-1-natechancellor@gmail.com>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
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

 arch/powerpc/kernel/Makefile | 4 ++--
 arch/powerpc/xmon/Makefile   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index a7ca8fe62368..f1f362146135 100644
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

