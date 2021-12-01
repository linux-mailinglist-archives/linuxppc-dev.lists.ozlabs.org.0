Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C527B465058
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:47:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42474Kx2z3bjF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:47:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JFW2oTEg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JFW2oTEg; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yS24xmz3bnC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:24 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id n85so24631816pfd.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=JFW2oTEg9LSEK1uvIm9HlQt76wHq7ggs1kaQPaVMvv2yPUYKEPyFBftzwGQRqo90qL
 MD/9wMHIo6LuQWoYZbJM7O7TV5P72nMHg7LOwPA/f0pCQy1rIX6cdYZxXYUgv8kYmXRR
 eXAvlVllDfVccAxEX5QaOd7uIfR1EqX8wD8GBLFHuO9CRF27msF2LRHJ9Kw7KBBLTA36
 XuNpQKJAd6iWzIy3kBFS7AlwkwA0PF+oPJc7D0WspcU9HoDdWzZavHmV4eUAG4X/KYwM
 eCzo6vDQc+0dyh3hsjO64u005hzIMdUjnqvb0BvF0LKOnqj744bvXgMoih0FLmqZ02OV
 2ztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=vMZyfZONFJSQJjeF85ZOPlRpOXYi5R7tUQUg6qNyyi2CfVKovI5lcMZfHOuVkYiA/t
 HOo6fPLVuIfc5x2GJZU6BFA/05j3Adz11EeYkipQ7Xehf9mG+6CVkJUuM75V9sP5C5+v
 f4B1/1o2Tkt9lUftaDKyztgvfy5S7f2TXonxHljwbIX2XAtjyTEaPGKNBSboFEW8cDPG
 nA7ykC/tkcEOOpLzNbE/8B49c6bIwgKmlF/lHCWU8lh1/VYaw64mnmBNdvB7omdO1ibW
 2xM1+P0JMGJKP1nq5+skrCOaaPPpsvUnEe7s8Y/K3B4+o9IEeYI7SIN9QlMeYDFJ8PnZ
 f/Gg==
X-Gm-Message-State: AOAM531R4rgl4H+Vzi/cx4fabmRCwiD4dBbKNQXSE8M9+8PJPL1BW76B
 cs7HcyqNalaH1qmXhNNxUURBz7f2Djg=
X-Google-Smtp-Source: ABdhPJxrqHyg/wTaQveNdfox1lvsbrDvML7aQ/+EGWCJ52RXNET1EBaGZk7NcGyNNm1TTTe1U+K8sg==
X-Received: by 2002:a62:e508:0:b0:4a4:f06f:1cd9 with SMTP id
 n8-20020a62e508000000b004a4f06f1cd9mr6343425pff.21.1638369742075; 
 Wed, 01 Dec 2021 06:42:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 07/18] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Thu,  2 Dec 2021 00:41:42 +1000
Message-Id: <20211201144153.2456614-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for making hash MMU support configurable, move THP
trace point function definitions out of an otherwise hash-specific
file.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/Makefile       | 2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c | 1 -
 arch/powerpc/mm/book3s64/trace.c        | 8 ++++++++
 3 files changed, 9 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s64/trace.c

diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 319f4b7f3357..1579e18e098d 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -5,7 +5,7 @@ ccflags-y	:= $(NO_MINIMAL_TOC)
 CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
 
 obj-y				+= hash_pgtable.o hash_utils.o slb.o \
-				   mmu_context.o pgtable.o hash_tlb.o
+				   mmu_context.o pgtable.o hash_tlb.o trace.o
 obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index ad5eff097d31..7ce8914992e3 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -16,7 +16,6 @@
 
 #include <mm/mmu_decl.h>
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/thp.h>
 
 #if H_PGTABLE_RANGE > (USER_VSID_RANGE * (TASK_SIZE_USER64 / TASK_CONTEXT_SIZE))
diff --git a/arch/powerpc/mm/book3s64/trace.c b/arch/powerpc/mm/book3s64/trace.c
new file mode 100644
index 000000000000..b86e7b906257
--- /dev/null
+++ b/arch/powerpc/mm/book3s64/trace.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * This file is for defining trace points and trace related helpers.
+ */
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#define CREATE_TRACE_POINTS
+#include <trace/events/thp.h>
+#endif
-- 
2.23.0

