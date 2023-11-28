Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB87FBB8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 14:29:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WuE5bBit;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sfjwp3HKSz3dH8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 00:29:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WuE5bBit;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfjv40xsgz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 00:28:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701178080;
	bh=ZM5a4CnGOTbqA/Q5wr3KDgfvN/S4jBWQH+ArmSLmqMA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WuE5bBitTIiDdB8125hcVsnSC1KRLR9HhN6T8lgeC7BlqzkEBnd/gR6NmY0J4OEn4
	 7WMrKTwBJE5SFZdcPx/wJqSm0Q3aS43TKAuP5uOX8+njuG+RX27idY4cERjLkyW8s2
	 w7lcaPO8D33lNU1faCDk6VIO0k//ymYuN4K4NlS0EKgKwiVwRmuuPlsbgrpomV2mGM
	 jsmCKNtq4hfrCGBG+cWK0cOCPPGF1f7Vuw24oyeAAso7ZDPG0Akb3QCXOpYTyi03Zc
	 1xw7524PgKyzDCdhAURxwp/B6oiwBbxqhxLYoifwTvECsjiInW2fGfOT43QLw/Egk8
	 O0pso8yhFWbMw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Sfjv36rdBz4x2V;
	Wed, 29 Nov 2023 00:27:59 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/5] selftests/powerpc: Generate better bit patterns for FPU tests
Date: Wed, 29 Nov 2023 00:27:46 +1100
Message-ID: <20231128132748.1990179-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231128132748.1990179-1-mpe@ellerman.id.au>
References: <20231128132748.1990179-1-mpe@ellerman.id.au>
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
Cc: tpearson@raptorengineering.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The fpu_preempt test randomly initialises an array of doubles to try and
detect FPU register corruption.

However the values it generates do not occupy the full range of values
possible in the 64-bit double, meaning some partial register corruption
could go undetected.

Without getting too carried away, add some better initialisation to
generate values that occupy more bits.

Sample values before:

  f0             902677510               (raw 0x41cae6e203000000)
  f1             325217596               (raw 0x41b3626d3c000000)
  f2             1856578300              (raw 0x41dbaa48bf000000)
  f3             1247189984              (raw 0x41d295a6f8000000)

And after:

  f0             1.1078153481413311e-09  (raw 0x3e13083932805cc2)
  f1             1.0576648474801922e+17  (raw 0x43777c20eb88c261)
  f2             -6.6245033413594075e-10 (raw 0xbe06c2f989facae9)
  f3             3.0085988827156291e+18  (raw 0x43c4e0585f2df37b)

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/math/fpu.h    | 25 +++++++++++++++++++
 .../selftests/powerpc/math/fpu_preempt.c      |  6 ++---
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/math/fpu.h

diff --git a/tools/testing/selftests/powerpc/math/fpu.h b/tools/testing/selftests/powerpc/math/fpu.h
new file mode 100644
index 000000000000..a8ad0d42604e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/math/fpu.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright 2023, Michael Ellerman, IBM Corporation.
+ */
+
+#ifndef _SELFTESTS_POWERPC_FPU_H
+#define _SELFTESTS_POWERPC_FPU_H
+
+static inline void randomise_darray(double *darray, int num)
+{
+	long val;
+
+	for (int i = 0; i < num; i++) {
+		val = random();
+		if (val & 1)
+			val *= -1;
+
+		if (val & 2)
+			darray[i] = 1.0 / val;
+		else
+			darray[i] = val * val;
+	}
+}
+
+#endif /* _SELFTESTS_POWERPC_FPU_H */
diff --git a/tools/testing/selftests/powerpc/math/fpu_preempt.c b/tools/testing/selftests/powerpc/math/fpu_preempt.c
index 24b5abacccdc..97dff3690136 100644
--- a/tools/testing/selftests/powerpc/math/fpu_preempt.c
+++ b/tools/testing/selftests/powerpc/math/fpu_preempt.c
@@ -19,6 +19,7 @@
 #include <pthread.h>
 
 #include "utils.h"
+#include "fpu.h"
 
 /* Time to wait for workers to get preempted (seconds) */
 #define PREEMPT_TIME 20
@@ -39,12 +40,9 @@ extern int preempt_fpu(double *darray, int *threads_starting, int *running);
 void *preempt_fpu_c(void *p)
 {
 	long rc;
-	int i;
 
 	srand(pthread_self());
-	for (i = 0; i < ARRAY_SIZE(darray); i++)
-		darray[i] = rand();
-
+	randomise_darray(darray, ARRAY_SIZE(darray));
 	rc = preempt_fpu(darray, &threads_starting, &running);
 
 	return (void *)rc;
-- 
2.41.0

