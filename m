Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E0D59B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 04:53:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s35f550jzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 13:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::243; helo=mail-oi1-x243.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z/ZH4sY6"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s33c47Y7zDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 13:51:24 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id o205so12535302oib.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2019 19:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CHmUbEEX69AqhdbGgT5mtRK+KzbNgJpahv1dD9kcoow=;
 b=Z/ZH4sY6OkTSRGyGfULWwz0nnTcjjTY56RwSiEHPADnMR79o16ZZz3J5ejCu8rRyK2
 FiHIst1HatvX4z5BXeayrSKv8Q6cNiijNfhV9FLC5OtlqooeUR7D/A3thk5TA3jSwrnC
 j0HS+iCyjhkF1zKT9g+0AOqi7iQZYr1o2uh56ZwO4lqQV2jLdJENoGxC+YWxV7WrSTY0
 B9U2K1ktlFDigtjPkqQXYfXX1i/LAxzay8brzaUSbSYVA78l4KAFgg30K6H9k962wbU4
 FMW2agc+hE9gLdzVWOi5kCL2T/ZMrJLCSZS+5o4l2ajknnUQbSnpcubxAS21upX99Nzy
 1eeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CHmUbEEX69AqhdbGgT5mtRK+KzbNgJpahv1dD9kcoow=;
 b=OEa7TPx0VFuVKhFK7jgXBnoeFwCADjAX4KmTSHZeH7M6hkMzAFqnNUpauieoALsSsB
 rytrGnxsAJWWO5wcJTcNA+9ZbQETg5hRStPi3GmCDpYm69qzv5k7aANJQyK1v3rd500z
 CzsA8zPrtHPpxfgbO0adFajnZAhMmnAe4/Vwc1twmZmYrDTOwvXiBAqCXyiaolRAGxVr
 dQNzPk8Pj9KjDGC9RX5zLsETFE7uiCKbgjkW01wVNd18f4+4wEDykjsE0gbowcTib1Yt
 3nt8WdwmkOt5gcvhE2QBCRAV9FQ+6uAr8omL9onrLuMvjkTxhf3ViN75szBcEH/T6bNq
 heCQ==
X-Gm-Message-State: APjAAAVPLe6mIivO3AnLxCzWx1W1mRCy/ERG2PVz7t6RVf/z8nlu6lOF
 or90w5EougHisy8JrkPo4Fc=
X-Google-Smtp-Source: APXvYqw6PeVHbSHxMK9QXZUVR43r2OehkYWUjPEpGrGg9Kg1EWZ8tl2/DaYxeecULNYz5IXa4sZ0vA==
X-Received: by 2002:aca:211a:: with SMTP id 26mr21810859oiz.122.1571021481959; 
 Sun, 13 Oct 2019 19:51:21 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 11sm5612491otg.62.2019.10.13.19.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 19:51:21 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 1/3] powerpc: Don't add -mabi= flags when building with
 Clang
Date: Sun, 13 Oct 2019 19:50:59 -0700
Message-Id: <20191014025101.18567-2-natechancellor@gmail.com>
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
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building pseries_defconfig, building vdso32 errors out:

  error: unknown target ABI 'elfv1'

This happens because -m32 in clang changes the target to 32-bit,
which does not allow the ABI to be changed, as the setABI virtual
function is not overridden:

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/include/clang/Basic/TargetInfo.h#L1073-L1078

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Basic/Targets/PPC.h#L327-L365

Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
powerpc64le toolchain") added these flags to fix building big endian
kernels with a little endian GCC.

Clang doesn't need -mabi because the target triple controls the default
value. -mlittle-endian and -mbig-endian manipulate the triple into
either powerpc64-* or powerpc64le-*, which properly sets the default
ABI:

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Driver/Driver.cpp#L450-L463

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/llvm/lib/Support/Triple.cpp#L1432-L1516

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0/clang/lib/Basic/Targets/PPC.h#L377-L383

Adding a debug print out in the PPC64TargetInfo constructor after line
383 above shows this:

$ echo | ./clang -E --target=powerpc64-linux -mbig-endian -o /dev/null -
Default ABI: elfv1

$ echo | ./clang -E --target=powerpc64-linux -mlittle-endian -o /dev/null -
Default ABI: elfv2

$ echo | ./clang -E --target=powerpc64le-linux -mbig-endian -o /dev/null -
Default ABI: elfv1

$ echo | ./clang -E --target=powerpc64le-linux -mlittle-endian -o /dev/null -
Default ABI: elfv2

Don't specify -mabi when building with clang to avoid the build error
with -m32 and not change any code generation.

-mcall-aixdesc is not an implemented flag in clang so it can be
safely excluded as well, see commit 238abecde8ad ("powerpc: Don't
use gcc specific options on clang").

pseries_defconfig successfully builds after this patch and
powernv_defconfig and ppc44x_defconfig don't regress.

Link: https://github.com/ClangBuiltLinux/linux/issues/240
Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Improve commit message

v2 -> v3:

* Rebase and merge into a single series.

v3 -> v4:

* Rebase on v5.4-rc3.

* Update links to point to llvmorg-9.0.0 instead of llvmorg-9.0.0-rc2.

 arch/powerpc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 83522c9fc7b6..37ac731a556b 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -91,11 +91,13 @@ MULTIPLEWORD	:= -mmultiple
 endif
 
 ifdef CONFIG_PPC64
+ifndef CONFIG_CC_IS_CLANG
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mcall-aixdesc)
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mabi=elfv1)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mabi=elfv2
 endif
+endif
 
 ifndef CONFIG_CC_IS_CLANG
   cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mno-strict-align
@@ -141,6 +143,7 @@ endif
 endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
+ifndef CONFIG_CC_IS_CLANG
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
@@ -149,6 +152,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 endif
+endif
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
-- 
2.23.0

