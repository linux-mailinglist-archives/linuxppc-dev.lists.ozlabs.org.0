Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CDB16EA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 03:32:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zJqZ1cykzDqM9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 11:32:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zJp06CL5zDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 11:30:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="afWhlewF"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 44zJp02dZMz9s3l;
 Wed,  8 May 2019 11:30:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1557279048;
 bh=4PVY2bZ7JdKhxRG+2PP4o9feJP3Y71cclUeVMdw8qUY=;
 h=From:To:Cc:Subject:Date:From;
 b=afWhlewFpiBP9Mf9iRbpBibBx1cm48lVOhKT/06q/5A8ZiNDodZjD5fIaDkJZw6rW
 imqRY8YFSGVHBMJ8zfZS7bLTNlnKejIUG0R6FD8/02W6hPqECQcFgIygenosU390rX
 T+Yv3VCCxV7GvyuFThkdg1POVso+qUD5XoN6MDye7r89by+NODJl8mRDnGy8BC2ey/
 vQcCIKn4TbMGh76SU+A17a374X+VSstYXGw/J7NcF3rL1rpVg0bCXonpIRMCU0TcCw
 BQ9e31bUrWURV+hps8tKJo4IiAg/Tns6Txtt7/JB7k8tQlDIEwbHoAuzJXwF5B7VQP
 Pxj6L4kwUASpA==
Received: by neuling.org (Postfix, from userid 1000)
 id 39B3C2A051F; Wed,  8 May 2019 11:30:48 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Fix compile issue with force DAWR
Date: Wed,  8 May 2019 11:30:47 +1000
Message-Id: <20190508013047.12850-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
at linking with:
  arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined reference to `dawr_force_enable'

This was caused by this recent patch:
   commit c1fe190c06723322f2dfac31d3b982c581e434ef
   Author: Michael Neuling <mikey@neuling.org>
   powerpc: Add force enable of DAWR on P9 option

This builds dawr_force_enable in always via a new file.

Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/Makefile        |  2 +-
 arch/powerpc/kernel/dawr.c          | 11 +++++++++++
 arch/powerpc/kernel/hw_breakpoint.c |  3 ---
 3 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/kernel/dawr.c

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4aa3a..48a20ef5be 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -49,7 +49,7 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o
+				   of_platform.o prom_parse.o dawr.o
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 				   signal_64.o ptrace32.o \
 				   paca.o nvram_64.o firmware.o
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
new file mode 100644
index 0000000000..ca343efd23
--- /dev/null
+++ b/arch/powerpc/kernel/dawr.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// DAWR global variables
+//
+// Copyright 2019, Michael Neuling, IBM Corporation.
+
+#include <linux/types.h>
+#include <linux/export.h>
+
+bool dawr_force_enable;
+EXPORT_SYMBOL_GPL(dawr_force_enable);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index da307dd93e..78a17454f4 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -381,9 +381,6 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
 	/* TODO */
 }
 
-bool dawr_force_enable;
-EXPORT_SYMBOL_GPL(dawr_force_enable);
-
 static ssize_t dawr_write_file_bool(struct file *file,
 				    const char __user *user_buf,
 				    size_t count, loff_t *ppos)
-- 
2.21.0

