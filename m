Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5CF78503D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:56:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=haYx0HdE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwT70f0hz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:56:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=haYx0HdE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwPN4Hssz2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 15:53:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770004;
	bh=ibxaiamj+YoPWHNGksIeipqnbQLt8S1oYJ5MDCduRJY=;
	h=From:To:Cc:Subject:Date:From;
	b=haYx0HdEJOeHDBMlWAK3hfXxmurudrRHF6J/AOaWCYUi6r8aiXLfLnkvlNKScFUw2
	 EPSbnYIfvzorYgVYCzHLF4Jeq/zKz0eRfTsYcUKhdJDvAWIvHG64dWQZX3jAjlE3GZ
	 tMOxQHb+nOWEQajb+tzWh8Vo2I9OCKEU9PAm9Xmnw65zjCu7Rh0OLCz0BQKMO9snm6
	 yDxpwxutA2hHECvBhh85FWZ1IWbZqY+Ll2G1HxZp5V0XpXP7+UfT1KJlFDlZbIDKdQ
	 9kQxzAalSviCaPTXLHXr1Zwfhod3bd+HuMGdhhMPf0V3EFgmosvm+vLp6Q4VfYFv17
	 +QTpG+p4sA/2Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwPJ0xWnz4wxn;
	Wed, 23 Aug 2023 15:53:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/4] powerpc/pseries: Move VPHN constants into vphn.h
Date: Wed, 23 Aug 2023 15:53:14 +1000
Message-ID: <20230823055317.751786-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These don't have any particularly good reason to belong in lppaca.h,
move them into their own header.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/lppaca.h             | 22 -------------------
 arch/powerpc/include/asm/vphn.h               | 22 +++++++++++++++++++
 arch/powerpc/mm/numa.c                        |  1 +
 arch/powerpc/platforms/pseries/lpar.c         |  1 +
 arch/powerpc/platforms/pseries/vas.c          |  1 +
 arch/powerpc/platforms/pseries/vphn.c         |  2 +-
 .../selftests/powerpc/vphn/asm/lppaca.h       |  1 -
 .../testing/selftests/powerpc/vphn/asm/vphn.h |  1 +
 8 files changed, 27 insertions(+), 24 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vphn.h
 delete mode 120000 tools/testing/selftests/powerpc/vphn/asm/lppaca.h
 create mode 120000 tools/testing/selftests/powerpc/vphn/asm/vphn.h

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 34d44cb17c87..12159e5b6888 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -6,28 +6,6 @@
 #ifndef _ASM_POWERPC_LPPACA_H
 #define _ASM_POWERPC_LPPACA_H
 
-/*
- * The below VPHN macros are outside the __KERNEL__ check since these are
- * used for compiling the vphn selftest in userspace
- */
-
-/* The H_HOME_NODE_ASSOCIATIVITY h_call returns 6 64-bit registers. */
-#define VPHN_REGISTER_COUNT 6
-
-/*
- * 6 64-bit registers unpacked into up to 24 be32 associativity values. To
- * form the complete property we have to add the length in the first cell.
- */
-#define VPHN_ASSOC_BUFSIZE (VPHN_REGISTER_COUNT*sizeof(u64)/sizeof(u16) + 1)
-
-/*
- * The H_HOME_NODE_ASSOCIATIVITY hcall takes two values for flags:
- * 1 for retrieving associativity information for a guest cpu
- * 2 for retrieving associativity information for a host/hypervisor cpu
- */
-#define VPHN_FLAG_VCPU	1
-#define VPHN_FLAG_PCPU	2
-
 #ifdef __KERNEL__
 
 /*
diff --git a/arch/powerpc/include/asm/vphn.h b/arch/powerpc/include/asm/vphn.h
new file mode 100644
index 000000000000..e0970603fce2
--- /dev/null
+++ b/arch/powerpc/include/asm/vphn.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_VPHN_H
+#define _ASM_POWERPC_VPHN_H
+
+/* The H_HOME_NODE_ASSOCIATIVITY h_call returns 6 64-bit registers. */
+#define VPHN_REGISTER_COUNT 6
+
+/*
+ * 6 64-bit registers unpacked into up to 24 be32 associativity values. To
+ * form the complete property we have to add the length in the first cell.
+ */
+#define VPHN_ASSOC_BUFSIZE (VPHN_REGISTER_COUNT*sizeof(u64)/sizeof(u16) + 1)
+
+/*
+ * The H_HOME_NODE_ASSOCIATIVITY hcall takes two values for flags:
+ * 1 for retrieving associativity information for a guest cpu
+ * 2 for retrieving associativity information for a host/hypervisor cpu
+ */
+#define VPHN_FLAG_VCPU	1
+#define VPHN_FLAG_PCPU	2
+
+#endif // _ASM_POWERPC_VPHN_H
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 9f73d089eac1..f6c4ace3b221 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -34,6 +34,7 @@
 #include <asm/hvcall.h>
 #include <asm/setup.h>
 #include <asm/vdso.h>
+#include <asm/vphn.h>
 #include <asm/drmem.h>
 
 static int numa_enabled = 1;
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 2eab323f6970..27fb656bd6ba 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -41,6 +41,7 @@
 #include <asm/kexec.h>
 #include <asm/fadump.h>
 #include <asm/dtl.h>
+#include <asm/vphn.h>
 
 #include "pseries.h"
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 3fbc2a6aa319..e25ac52acf50 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -17,6 +17,7 @@
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
 #include <asm/firmware.h>
+#include <asm/vphn.h>
 #include <asm/vas.h>
 #include "vas.h"
 
diff --git a/arch/powerpc/platforms/pseries/vphn.c b/arch/powerpc/platforms/pseries/vphn.c
index cca474a2c396..3f85ece3c872 100644
--- a/arch/powerpc/platforms/pseries/vphn.c
+++ b/arch/powerpc/platforms/pseries/vphn.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <asm/byteorder.h>
-#include <asm/lppaca.h>
+#include <asm/vphn.h>
 
 /*
  * The associativity domain numbers are returned from the hypervisor as a
diff --git a/tools/testing/selftests/powerpc/vphn/asm/lppaca.h b/tools/testing/selftests/powerpc/vphn/asm/lppaca.h
deleted file mode 120000
index 942b1d00999c..000000000000
--- a/tools/testing/selftests/powerpc/vphn/asm/lppaca.h
+++ /dev/null
@@ -1 +0,0 @@
-../../../../../../arch/powerpc/include/asm/lppaca.h
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/vphn/asm/vphn.h b/tools/testing/selftests/powerpc/vphn/asm/vphn.h
new file mode 120000
index 000000000000..3a0b2a00171c
--- /dev/null
+++ b/tools/testing/selftests/powerpc/vphn/asm/vphn.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/asm/vphn.h
\ No newline at end of file
-- 
2.41.0

