Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B55B81F403
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 02:54:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lt0bxxZ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0s4k0BLhz3vnC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Dec 2023 12:54:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=lt0bxxZ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0rqQ2xwJz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Dec 2023 12:42:42 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3bb82a52002so5279486b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 17:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727760; x=1704332560; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2e+fg9SOqP34XnXL5jU4pEY4/pq3fOIOqFLUTdc21ng=;
        b=lt0bxxZ1FEklD32gBOo3RimIcnsWql9hGdF3RLIJVJzb66V+b0SK6/LQp2XFshRAs7
         SyuQPzpSI7NKvOOO3MO1NXtX+UYl3ivGmeZtUew4PO/4tv5HXAkShAl0PCauUhs7W08P
         FJpnHsY9JgJYJD0iuh8nwpOJrH72sGeV2W8fKZoKVLPYLxzUQEmbrN0qZPjou/nlwHdJ
         bP05gNuieOn4w2OppjKi6h3A4BFeXDu+NCGs2GaMm+Q92hwawFRxMA3DGMsLqaxTw73Y
         97HmeoYdiUmHP2yDXHN6wagOkEf+okSemfADsgbSVtNRYfxC9Joefelsgk/4zTbzcE0N
         CHvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727760; x=1704332560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e+fg9SOqP34XnXL5jU4pEY4/pq3fOIOqFLUTdc21ng=;
        b=lj1YiI7uaBFTIkzSV/D88ay6yG4v3HrQbfq1CeO8scJZGJ8VwVFm/D5B4ve4A9ldYA
         y1xW4ehCYF79ktcXw/Sj8+1vfVturfQRnSMa/o8Hq0fE2OJpn9eEq5kd3ykm4Pvh5y6G
         ngSdTgnckHohEVLIuwW1fwypECR0LWyAWb0aDQT8eX2e1DYG9dFfV89L8yHyvLZJs9Bf
         1ZxGZetxYYSCaNj1gF+LynYoOpid41JifKtd22k3Pk76t6O88svOSjYT8YcGBpCdMQ8a
         IlkIm0z78ig01WDjkfr9DqC/ZhC1gtIuLjEWHoeKNg+jERfFg+GzEmPk15JjniSnW3X7
         Xvkg==
X-Gm-Message-State: AOJu0Yy+oVlpTbyKOH5tKuIYXkkqSpZWzPdVxl+70lMu+ZTkyXbPKTTb
	N7mvhjVP/Qq0VGMZjhXAcdr0cJEyZZ6puw==
X-Google-Smtp-Source: AGHT+IFlBstkCmb/D17edCTs8sY4vteYMNaBpcxdbvjkI2D4UtEwweJgmB+5F+NfpsSlT4ktPGSvhA==
X-Received: by 2002:a05:6808:159d:b0:3bb:76ca:f143 with SMTP id t29-20020a056808159d00b003bb76caf143mr11199985oiw.54.1703727760626;
        Wed, 27 Dec 2023 17:42:40 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:40 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 14/14] selftests/fpu: Allow building on other architectures
Date: Wed, 27 Dec 2023 17:42:04 -0800
Message-ID: <20231228014220.3562640-15-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Samuel Holland <samuel.holland@sifive.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that ARCH_HAS_KERNEL_FPU_SUPPORT provides a common way to compile
and run floating-point code, this test is no longer x86-specific.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/Kconfig.debug   |  2 +-
 lib/Makefile        | 25 ++-----------------------
 lib/test_fpu_glue.c |  5 ++++-
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4405f81248fb..4596100eeb14 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2918,7 +2918,7 @@ config TEST_FREE_PAGES
 
 config TEST_FPU
 	tristate "Test floating point operations in kernel space"
-	depends on X86 && !KCOV_INSTRUMENT_ALL
+	depends on ARCH_HAS_KERNEL_FPU_SUPPORT && !KCOV_INSTRUMENT_ALL
 	help
 	  Enable this option to add /sys/kernel/debug/selftest_helpers/test_fpu
 	  which will trigger a sequence of floating point operations. This is used
diff --git a/lib/Makefile b/lib/Makefile
index e7cbd54944a2..b9f28558c9bd 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -109,31 +109,10 @@ CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
 obj-$(CONFIG_TEST_OBJPOOL) += test_objpool.o
 
-#
-# CFLAGS for compiling floating point code inside the kernel. x86/Makefile turns
-# off the generation of FPU/SSE* instructions for kernel proper but FPU_FLAGS
-# get appended last to CFLAGS and thus override those previous compiler options.
-#
-FPU_CFLAGS := -msse -msse2
-ifdef CONFIG_CC_IS_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
-#
-# The "-msse" in the first argument is there so that the
-# -mpreferred-stack-boundary=3 build error:
-#
-#  -mpreferred-stack-boundary=3 is not between 4 and 12
-#
-# can be triggered. Otherwise gcc doesn't complain.
-FPU_CFLAGS += -mhard-float
-FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
-endif
-
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
 test_fpu-y := test_fpu_glue.o test_fpu_impl.o
-CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
+CFLAGS_test_fpu_impl.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_test_fpu_impl.o += $(CC_FLAGS_NO_FPU)
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
diff --git a/lib/test_fpu_glue.c b/lib/test_fpu_glue.c
index 85963d7be826..eef282a2715f 100644
--- a/lib/test_fpu_glue.c
+++ b/lib/test_fpu_glue.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/debugfs.h>
-#include <asm/fpu/api.h>
+#include <linux/fpu.h>
 
 #include "test_fpu.h"
 
@@ -38,6 +38,9 @@ static struct dentry *selftest_dir;
 
 static int __init test_fpu_init(void)
 {
+	if (!kernel_fpu_available())
+		return -EINVAL;
+
 	selftest_dir = debugfs_create_dir("selftest_helpers", NULL);
 	if (!selftest_dir)
 		return -ENOMEM;
-- 
2.42.0

