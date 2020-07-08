Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 528C52181CC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 09:51:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1s2Z4GYgzDqpG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 17:51:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aRaKS9Sb; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1s0T3tMgzDqd0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 17:50:00 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id l2so1908658wmf.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXqwR3z+pfAp4gbC8Ej8C3cwclHFw/oaLNSKfhXJQxw=;
 b=aRaKS9SbBjDXrJsHmwe8BguaG4wAOUm0XciVTwkilLR85DQ1jMvhFO3E4zDr+yVRbE
 NwGrfN4tD26RAVcAfrMEyFLRa/f2DtkWhnj14Qr8JuZ78Ak7uNWOXPtEgNerJQXRIJc5
 YxfR2g+v4oPOJ9/t5LjnZdHlk7O1hgTpsVU7pfQvObOtAre8IDqNBKBNhF57o6TwfHWG
 r4LEZ1n1ibPeaxtY1kjKX1gUDS3tbl8/Xznk3zJaySp/zXVtF1pEsIz1SqJM7DqvHNzd
 gxnUDepiijF3mHHAZ65pKqGfctZV77Aj7mJZhP94q93aLk0qN6wVYbdzKPIHNK4tM0tH
 vtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXqwR3z+pfAp4gbC8Ej8C3cwclHFw/oaLNSKfhXJQxw=;
 b=XAxGiZN0qZKQgMMMGNW5y7fMOofZ25BuDGDtgl54t6pIqJsck+mNyfLiycLNEZmJFc
 hiEMyXwTw9AY71Q3X+7vn/VjEjEcR8qF4IJh1FTGh5QeH3XGcwAxYJoLTwE426U9G5bn
 8AAoQpRstp+CJawIvyIXnTuWrbsbw77nwoNzHmdW8yysZ2xy+uT5PpNw0pr8icoWyMcU
 7Mte06LoXoRU4NuCP+A17L0IExA36X1jGKpWEcf754HcCUWcpqwznYocLN7RqJhaztrA
 /5uIOcYDI7ZCI1OtJItiecwiKRHKf35IHuYV5HWKav1P4eTCwlTao3erJLC8rDmF8nsY
 sFOA==
X-Gm-Message-State: AOAM533Hpwufa9V8jT6eyGojQlIyRtetr2/mAjHZAOhBS7eTavmcMtTX
 pmj2Yac1tnOjdyue39MfmBSqIFfn
X-Google-Smtp-Source: ABdhPJyeWg8vU6ZQj4JsD3HlFd1c1W67G90kqBGz3Sb8aBpni0k5f9hc3XdpOgOsWMLwGG/SfhCy2A==
X-Received: by 2002:a7b:c7c2:: with SMTP id z2mr7921679wmk.39.1594194593273;
 Wed, 08 Jul 2020 00:49:53 -0700 (PDT)
Received: from bobo.ibm.com (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id c206sm4893187wmf.36.2020.07.08.00.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 00:49:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/exception: Fix 0x1500 interrupt handler crash
Date: Wed,  8 Jul 2020 17:49:42 +1000
Message-Id: <20200708074942.1713396-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A typo caused the interrupt handler to branch immediately to the common
"unknown interrupt" handler and skip the special case test for denormal
cause.

This does not affect KVM softpatch handling (e.g., for POWER9 TM assist)
because the KVM test was moved to common code by commit 9600f261acaa
("powerpc/64s/exception: Move KVM test to common code") just before this
bug was introduced.

Fixes: 3f7fbd97d07d ("powerpc/64s/exception: Clean up SRR specifiers")
Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S          |  2 +-
 tools/testing/selftests/powerpc/math/Makefile |  2 +-
 .../selftests/powerpc/math/fpu_denormal.c     | 38 +++++++++++++++++++
 3 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/math/fpu_denormal.c

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index fa080694e581..0fc8bad878b2 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2551,7 +2551,7 @@ EXC_VIRT_NONE(0x5400, 0x100)
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
 	IHSRR=1
-	IBRANCH_COMMON=0
+	IBRANCH_TO_COMMON=0
 	IKVM_REAL=1
 INT_DEFINE_END(denorm_exception)
 
diff --git a/tools/testing/selftests/powerpc/math/Makefile b/tools/testing/selftests/powerpc/math/Makefile
index 11a10d7a2bbd..4e2049d2fd8d 100644
--- a/tools/testing/selftests/powerpc/math/Makefile
+++ b/tools/testing/selftests/powerpc/math/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_GEN_PROGS := fpu_syscall fpu_preempt fpu_signal vmx_syscall vmx_preempt vmx_signal vsx_preempt
+TEST_GEN_PROGS := fpu_syscall fpu_preempt fpu_signal fpu_denormal vmx_syscall vmx_preempt vmx_signal vsx_preempt
 
 top_srcdir = ../../../../..
 include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/math/fpu_denormal.c b/tools/testing/selftests/powerpc/math/fpu_denormal.c
new file mode 100644
index 000000000000..5f96682abaa8
--- /dev/null
+++ b/tools/testing/selftests/powerpc/math/fpu_denormal.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright IBM Corp. 2020
+ *
+ * This test attempts to cause a FP denormal exception on POWER8 CPUs. Unfortunately
+ * if the denormal handler is not configured or working properly, this can cause a bad
+ * crash in kernel mode when the kernel tries to save FP registers when the process
+ * exits.
+ */
+
+#include <stdio.h>
+#include <string.h>
+
+#include "utils.h"
+
+static int test_denormal_fpu(void)
+{
+	unsigned int m32;
+	unsigned long m64;
+	volatile float f;
+	volatile double d;
+
+	/* try to induce lfs <denormal> ; stfd */
+
+	m32 = 0x00715fcf; /* random denormal */
+	memcpy((float *)&f, &m32, sizeof(f));
+	d = f;
+	memcpy(&m64, (double *)&d, sizeof(d));
+
+	FAIL_IF((long)(m64 != 0x380c57f3c0000000)); /* renormalised value */
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(test_denormal_fpu, "fpu_denormal");
+}
-- 
2.23.0

