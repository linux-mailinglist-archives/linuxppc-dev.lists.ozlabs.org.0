Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 819387A46B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 12:15:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rq0zl3YKCz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 20:15:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux-m68k.org (client-ip=195.130.137.81; helo=weierstrass.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rq0z9701Qz2yhP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 20:14:59 +1000 (AEST)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Rq0z23N0Hz4wxqm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 12:14:54 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:9622:9b2f:73fd:43ad])
	by baptiste.telenet-ops.be with bizsmtp
	id nNEr2A00d4u9dj801NEr9R; Mon, 18 Sep 2023 12:14:53 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qiBGw-003wYZ-LZ;
	Mon, 18 Sep 2023 12:14:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qiBHH-006GjX-FP;
	Mon, 18 Sep 2023 12:14:51 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Greg Ungerer <gerg@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 2/2] powerpc: Replace GPL 2.0+ README.legal boilerplate with SPDX
Date: Mon, 18 Sep 2023 12:14:44 +0200
Message-Id: <d91725ff1ed5d4b6ba42474e2ebfeebe711cba23.1695031668.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695031668.git.geert@linux-m68k.org>
References: <cover.1695031668.git.geert@linux-m68k.org>
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
Cc: linux-spdx@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Upstream Linux never had a "README.legal" file, but it was present
in early source releases of Linux/m68k.  It contained a simple copyright
notice and a link to a version of the "COPYING" file that predated the
addition of the "only valid GPL version is v2" clause.

Get rid of the references to non-existent files by replacing the
boilerplate with SPDX license identifiers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - s/existant/existent/.
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

