Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0FB038E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 20:25:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T9LS0dpRzF3W3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 04:25:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKGZhQsc"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T9GB455szF3pr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 04:21:38 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id o184so4688506wme.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlwkreJLiH000TkL/I+nagVzmxnKwtX6/RI0S+Wf63c=;
 b=hKGZhQscUbNpwvhbBmzJE5rFZgRkwvD9/oiNRxYjGAsVkTilmapKoZdm3AUVR6aEfe
 6ClFLL9oKo+3iXCtcEPH9xPwnNEC204wkwAoq4rwVV2LaW3dSQB7G6ZibmUJ4wOXb9xn
 2HQs832KFhz+4iT/5nvPjXbRQGonAJQBRJ4+9oSZxYQEYX3PrZ/ysL0z27nS3jKNloWU
 1QHBaAQdaHzvysoPDoUGyeYKBv2XOPac/RM/rREtrT+Lz1SNA8PAKCMgd++uWkcxWPAS
 NNCN1NTQEhGY6I4r6qvcignOtM+WREgYmTKiEf04lUFKqYJ7S+5tsCgxUr4mSp1sGVVv
 gB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlwkreJLiH000TkL/I+nagVzmxnKwtX6/RI0S+Wf63c=;
 b=CRinaOs+l3gdU+atS0aydY4lNuPiRws1RSDNzS+P5vdX06NxNDYFvansWab32UvBKb
 uFiUrdHlzL3OviDQtKNwfdL1C+fsb2huUxY+Tf7t6Nic2neL9YlBTbzQu1+M8lk/p40s
 IySWoeaeJ3dbD4q5VCrUFTutpa+btqATIPIleT6Z45HTqunptYRBZJoFOrOkVAJktgV1
 P0ifh+ngqbHDq0VQnCjyxL5xUeGFJy1BBvPrAAHx8t5sG5Al61Scrf2iV9hyIang3jD3
 4nVmLEaKwxvc//A9+bW6OHSGpQeAQBLuTqpm0N7nvECBe1yVMqBxAK8F83zBPSbs8awy
 mPKQ==
X-Gm-Message-State: APjAAAXvxVtN6vtWIx4ExDXnuD6frJtLBmVxFjQz34qbFUoY0s1faz0+
 FSp5pVfqPnxyP/FsWtoQ0O8=
X-Google-Smtp-Source: APXvYqyleXXjEorGaKD9ck8QMoH1+NVOdLcyINZOZd9kylDsAeiOy+WMu/ZstSjZJtQsIASujOMMLw==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr4832772wmb.107.1568226095056; 
 Wed, 11 Sep 2019 11:21:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id q9sm2356753wmq.15.2019.09.11.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2019 11:21:34 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 1/3] powerpc: Don't add -mabi= flags when building with
 Clang
Date: Wed, 11 Sep 2019 11:20:49 -0700
Message-Id: <20190911182049.77853-2-natechancellor@gmail.com>
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

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/include/clang/Basic/TargetInfo.h#L1073-L1078

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Basic/Targets/PPC.h#L327-L365

Commit 4dc831aa8813 ("powerpc: Fix compiling a BE kernel with a
powerpc64le toolchain") added these flags to fix building big endian
kernels with a little endian GCC.

Clang doesn't need -mabi because the target triple controls the default
value. -mlittle-endian and -mbig-endian manipulate the triple into
either powerpc64-* or powerpc64le-*, which properly sets the default
ABI:

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Driver/Driver.cpp#L450-L463

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/llvm/lib/Support/Triple.cpp#L1432-L1516

https://github.com/llvm/llvm-project/blob/llvmorg-9.0.0-rc2/clang/lib/Basic/Targets/PPC.h#L377-L383

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

 arch/powerpc/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 46ed198a3aa3..150925a2e06e 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -93,11 +93,13 @@ MULTIPLEWORD	:= -mmultiple
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
@@ -143,6 +145,7 @@ endif
 endif
 
 CFLAGS-$(CONFIG_PPC64)	:= $(call cc-option,-mtraceback=no)
+ifndef CONFIG_CC_IS_CLANG
 ifdef CONFIG_CPU_LITTLE_ENDIAN
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2,$(call cc-option,-mcall-aixdesc))
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv2)
@@ -151,6 +154,7 @@ CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
 AFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mabi=elfv1)
 endif
+endif
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
 CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mno-pointers-to-nested-functions)
 
-- 
2.23.0

