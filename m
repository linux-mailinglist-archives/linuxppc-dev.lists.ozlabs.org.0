Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E1575EBDC2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:19:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474Bqd5CfKzF6X6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:19:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="KPc3vgN8"; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474Bl00h0xzF6F4
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:15:39 +1100 (AEDT)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id xA16ELBd016348;
 Fri, 1 Nov 2019 15:14:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xA16ELBd016348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572588863;
 bh=i3mAUJKjHAwllmd7KANZFUaKrxZfgZZBSwsGJnV7Xbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KPc3vgN83gq/1DFpYm2jc42MVPmVXAyW/Lg2mxWgvu1ZAu0bN1KYxqRvmNONYWFk3
 gaUQbkdfqWaDEZ2BcXD9Si4l6mpnff26BF+UBdrTZLRrMCTujMwF3QcBsWjbcgkcOF
 2XbnAVCrdwv3ty0YJtZg3c+4DVaAZKk3gkjpX0FwnK4VsdT89nJli9OWVsMEH9B2G4
 hss+ENiiJCQFP5NOVFqIIOBCByvo34NugeyFLi+nkDC66Xc3GjYRkp6KQ2rDBUrSMD
 JlBahWfNsllQ39/AajGZsAZRYAix+l2RjQ37GhjRbqpYTT/40NjdAoGwDVMHt+Y2WS
 XMwjT6UgHMK7w==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 1/3] libfdt: add SPDX-License-Identifier to libfdt wrappers
Date: Fri,  1 Nov 2019 15:14:09 +0900
Message-Id: <20191101061411.16988-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191101061411.16988-1-yamada.masahiro@socionext.com>
References: <20191101061411.16988-1-yamada.masahiro@socionext.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are kernel source code even though they are just two-line wrappers.

Files without explicit license information fall back to GPL-2.0-only,
which is the project default.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/fdt.c            | 1 +
 lib/fdt_empty_tree.c | 1 +
 lib/fdt_ro.c         | 1 +
 lib/fdt_rw.c         | 1 +
 lib/fdt_strerror.c   | 1 +
 lib/fdt_sw.c         | 1 +
 lib/fdt_wip.c        | 1 +
 7 files changed, 7 insertions(+)

diff --git a/lib/fdt.c b/lib/fdt.c
index 97f20069fc37..041f8922a23c 100644
--- a/lib/fdt.c
+++ b/lib/fdt.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt.c"
diff --git a/lib/fdt_empty_tree.c b/lib/fdt_empty_tree.c
index 5d30c58150ad..452221227bf3 100644
--- a/lib/fdt_empty_tree.c
+++ b/lib/fdt_empty_tree.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_empty_tree.c"
diff --git a/lib/fdt_ro.c b/lib/fdt_ro.c
index f73c04ea7be4..9f696d19f060 100644
--- a/lib/fdt_ro.c
+++ b/lib/fdt_ro.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_ro.c"
diff --git a/lib/fdt_rw.c b/lib/fdt_rw.c
index 0c1f0f4a4b13..2a61e9c6dd44 100644
--- a/lib/fdt_rw.c
+++ b/lib/fdt_rw.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_rw.c"
diff --git a/lib/fdt_strerror.c b/lib/fdt_strerror.c
index 8713e3ff4707..4554e5fdac12 100644
--- a/lib/fdt_strerror.c
+++ b/lib/fdt_strerror.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_strerror.c"
diff --git a/lib/fdt_sw.c b/lib/fdt_sw.c
index 9ac7e50c76ce..d3345ca399cf 100644
--- a/lib/fdt_sw.c
+++ b/lib/fdt_sw.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_sw.c"
diff --git a/lib/fdt_wip.c b/lib/fdt_wip.c
index 45b3fc3d3ba1..9674d4c3b115 100644
--- a/lib/fdt_wip.c
+++ b/lib/fdt_wip.c
@@ -1,2 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0-only
 #include <linux/libfdt_env.h>
 #include "../scripts/dtc/libfdt/fdt_wip.c"
-- 
2.17.1

