Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADD5599A65
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 13:05:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8JnV0DDnz3dx9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cv+Xf3TK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Jmv0F3fz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Aug 2022 21:04:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cv+Xf3TK;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M8Jms4SBrz4x1G;
	Fri, 19 Aug 2022 21:04:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660907086;
	bh=tNELHKAzDyLfryPFFWAOm18Pibmr2pSODguoP2aVEUo=;
	h=From:To:Cc:Subject:Date:From;
	b=cv+Xf3TKy2aLhGniGRp+1SFEJilJ7MU/tg8Wbr1y1nnH2aunvxi9RyVTVaJFZnOaZ
	 d20HjqLhgTzmW+I59GNgnZlyc5ynHWVTRM7MMjt4dicx0eAk6llT0+0gue/CPfeqEU
	 8m7rnvELSt7CUmWaArGfbqjZkiTT2DDkvXyHk4cMUfAwG1utMfy6NHSGjFms1hpSHK
	 13Q5q0+vt5/WyNaZK/qa/YrsmsNVva5Me2GZUgOmVqvmrjnWxYJI2QErlBaC9IDIXn
	 dr3TEofXr2mcgZao1RXm5KUG5afF8hOSf50uBOBJNUZHNPD4SD5bVkTv+86FgRWx/E
	 jgTpu5GREio9A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/boot: Convert more files to use SPDX tags
Date: Fri, 19 Aug 2022 21:04:30 +1000
Message-Id: <20220819110430.433984-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.1
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
Cc: linux-spdx@vger.kernel.org, tglx@linutronix.de, gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These files are all plain GPL 2.0, with a second sentence about being
licensed as-is.

Similar to the rule in commit 577b61cee5b2 ("treewide: Replace GPLv2
boilerplate/reference with SPDX - gpl-2.0_398.RULE").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/boot/44x.h          | 5 +----
 arch/powerpc/boot/4xx.h          | 5 +----
 arch/powerpc/boot/ops.h          | 6 ++----
 arch/powerpc/boot/serial.c       | 6 ++----
 arch/powerpc/boot/simple_alloc.c | 6 ++----
 5 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/boot/44x.h b/arch/powerpc/boot/44x.h
index 02563443788a..9b15e59522d6 100644
--- a/arch/powerpc/boot/44x.h
+++ b/arch/powerpc/boot/44x.h
@@ -1,11 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * PowerPC 44x related functions
  *
  * Copyright 2007 David Gibson, IBM Corporation.
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 #ifndef _PPC_BOOT_44X_H_
 #define _PPC_BOOT_44X_H_
diff --git a/arch/powerpc/boot/4xx.h b/arch/powerpc/boot/4xx.h
index 7dc5d45361bc..77f15d124c81 100644
--- a/arch/powerpc/boot/4xx.h
+++ b/arch/powerpc/boot/4xx.h
@@ -1,12 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * PowerPC 4xx related functions
  *
  * Copyright 2007 IBM Corporation.
  * Josh Boyer <jwboyer@linux.vnet.ibm.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 #ifndef _POWERPC_BOOT_4XX_H_
 #define _POWERPC_BOOT_4XX_H_
diff --git a/arch/powerpc/boot/ops.h b/arch/powerpc/boot/ops.h
index 8334bc3cbe49..a40c2162a4e9 100644
--- a/arch/powerpc/boot/ops.h
+++ b/arch/powerpc/boot/ops.h
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Global definition of all the bootwrapper operations.
  *
  * Author: Mark A. Greer <mgreer@mvista.com>
  *
- * 2006 (c) MontaVista Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2006 (c) MontaVista Software, Inc.
  */
 #ifndef _PPC_BOOT_OPS_H_
 #define _PPC_BOOT_OPS_H_
diff --git a/arch/powerpc/boot/serial.c b/arch/powerpc/boot/serial.c
index 54d2522be485..57b23ff53fde 100644
--- a/arch/powerpc/boot/serial.c
+++ b/arch/powerpc/boot/serial.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Generic serial console support
  *
@@ -6,10 +7,7 @@
  * Code in serial_edit_cmdline() copied from <file:arch/ppc/boot/simple/misc.c>
  * and was written by Matt Porter <mporter@kernel.crashing.org>.
  *
- * 2001,2006 (c) MontaVista Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2001,2006 (c) MontaVista Software, Inc.
  */
 #include <stdarg.h>
 #include <stddef.h>
diff --git a/arch/powerpc/boot/simple_alloc.c b/arch/powerpc/boot/simple_alloc.c
index 65ec135d0157..eccbf3b6cc00 100644
--- a/arch/powerpc/boot/simple_alloc.c
+++ b/arch/powerpc/boot/simple_alloc.c
@@ -1,12 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Implement primitive realloc(3) functionality.
  *
  * Author: Mark A. Greer <mgreer@mvista.com>
  *
- * 2006 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * 2006 (c) MontaVista, Software, Inc.
  */
 
 #include <stddef.h>
-- 
2.37.1

