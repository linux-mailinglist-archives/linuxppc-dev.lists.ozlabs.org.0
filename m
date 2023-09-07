Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61775797308
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 16:22:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhLzx1lhgz3c3g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 00:22:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=2a02:1800:120:4::f00:10; helo=cantor.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [IPv6:2a02:1800:120:4::f00:10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhLyw6870z3bwZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 00:21:42 +1000 (AEST)
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4RhLyj3Mqjz4x1VQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 16:21:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:c214:2eac:128d:f67e])
	by laurent.telenet-ops.be with bizsmtp
	id j2MX2A00S2mGBSJ012MXea; Thu, 07 Sep 2023 16:21:32 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qeFsi-002mG9-FE;
	Thu, 07 Sep 2023 16:21:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qeFsx-00CNCC-NO;
	Thu, 07 Sep 2023 16:21:31 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate by SPDX
Date: Thu,  7 Sep 2023 16:21:30 +0200
Message-Id: <2349faf484969a86be141f6d90e45657e692d3a5.1694095086.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694095086.git.geert@linux-m68k.org>
References: <cover.1694095086.git.geert@linux-m68k.org>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Upstream Linux never had a "README.legal" file, but it was present
in early source releases of Linux/m68k.  It contained a simple copyright
notice and a link to a version of the "COPYING" file that predated the
addition of the "only valid GPL version is v2" clause.

Get rid of the references to non-existant files by replacing the
boilerplate with SPDX license identifiers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/powerpc/kernel/ptrace/ptrace.c | 5 +----
 arch/powerpc/kernel/signal.c        | 5 +----
 arch/powerpc/kernel/signal.h        | 7 ++-----
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 5d7a72b41ae71158..727ed4a145451356 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *  PowerPC version
  *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
@@ -9,10 +10,6 @@
  *
  * Modified by Cort Dougan (cort@hq.fsmlabs.com)
  * and Paul Mackerras (paulus@samba.org).
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #include <linux/regset.h>
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index 68a91e553e14cea2..aa17e62f37547a79 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Common signal handling code for both 32 and 64 bits
  *
  *    Copyright (c) 2007 Benjamin Herrenschmidt, IBM Corporation
  *    Extracted from signal_32.c and signal_64.c
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #include <linux/resume_user_mode.h>
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index a429c57ed4331805..58ecea1cdc27ae80 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -1,10 +1,7 @@
-/*
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
  *    Copyright (c) 2007 Benjamin Herrenschmidt, IBM Corporation
  *    Extracted from signal_32.c and signal_64.c
- *
- * This file is subject to the terms and conditions of the GNU General
- * Public License.  See the file README.legal in the main directory of
- * this archive for more details.
  */
 
 #ifndef _POWERPC_ARCH_SIGNAL_H
-- 
2.34.1

