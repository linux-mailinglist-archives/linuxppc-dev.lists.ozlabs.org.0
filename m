Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B8460D0F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:13:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vm52pRNz3cp0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:13:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=digpf6g5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=digpf6g5; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfj0Dprz3bZj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:28 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id b68so15295460pfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=digpf6g5N8Ac14xI8DCx3a5W7n+91prnNLNri5kc5iGOZP/JnVwNcp3DL0TMOp/SDP
 60M5B/h4Wnudd+OZrTTvd9IwrHCAvAwdcp4TSFTthM+YzjDhLg449XI1qbD8mw+5kwcs
 VSDEY5WIFXDD8uLwMf0mzUACtQZLMm5vY0kY7aNMttbhnSA78Bc2QkHkFK4YQ2dH53Qc
 uAaXn2OmSYDPulRQPpArei0LK8hkTvSyssGS04/iw8qKCkgaPseMCUFZAmU4nv7stqV6
 6gn37rfJToL5V1PvU+8SjimMHtYFG7SKB1e6qrmBUN6RGnXhPbjSNdGSbp9n+YOJhMRg
 NCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=GSMnIkVV/ErJHYClNW7ReTA9aX4bvrEVuH7X8XtAjNbFeMvvUMgj9gtbU5lfjFS4gC
 KiPiufMKhtYCZ9lnvb6GvSWD0EiiNkvO2BAjLYurgUWl3JEBtZH+xg73GoaRC3cSB8Ng
 h+2VUy2VBstNJLvzjy1urdrk016RKb2A8RrLjOioO3nJ6I52ja5f5U4m8gQ+J97FUZBB
 Fa6eV9qYOlLP3X9UZWY9M+eDM7TvfPW0qWwoRBugFV1/MM7HHgkygquUOIlTf3bNqkJT
 6SLTMOCII4IXBhBdO7QGH3a1YW+kW+SrgLKONY/4EuHnBFBMsEPdEtihEayV5DVjgc5J
 iiGA==
X-Gm-Message-State: AOAM533oZa6zFm5z2xOr/LjQcCk2x9Z0Ey+ziYrjRKN92vmQXgxCAQaR
 ncUMW55V55aE1N0YweVttmgJ8FuTkp0=
X-Google-Smtp-Source: ABdhPJzOmyu65usnX5pwj8GtvJ8h4aTRiPDr78jb7N9WRmwmLc7wPnzk7pM1Lkfdu/NZC+q6qX96dA==
X-Received: by 2002:a63:5416:: with SMTP id i22mr33683684pgb.382.1638155306898; 
 Sun, 28 Nov 2021 19:08:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 07/17] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Mon, 29 Nov 2021 13:07:53 +1000
Message-Id: <20211129030803.1888161-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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

