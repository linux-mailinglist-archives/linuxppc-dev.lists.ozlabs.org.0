Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D06436D87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2PG3Ts4z30RN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:35:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XglZ0OEl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XglZ0OEl; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hl2ZRmz3c8G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:43 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id f21so1418990plb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=XglZ0OElcy/c/7NJn27nI3AVx3iwyD7hEHxuONDnpIKW8vfOBjaXmH+MCiACDk7gEt
 IuNgh/yFfZlujQmaSTv/ry8W/QJjRhTGpjzxGZ04p6KaKdE0uhETCBQON94QnekM01ZO
 BUo2qT+DOo8wjaZZ7ph6Ua/TCgYDDBZ/befIlpIulPGZxHbNLGZvFEzHccLMVanN2fIN
 JqDnLOfsgA5hCz71b/HwwYbL+tgM6C6Zn+LNVx1sog3ci9vDcHvQEQPaNHR741dqhToE
 b/N0BdaE/nnTWgRsIXM2IsQKsArHd6WUwZZJ0YThxsAfX6VcPX+jGics8HdyrqJiv3iR
 xmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=rAC2JHpmY/xcRfYRXUwTNZ4AKQ0lUd85IWCyGjHiS61JRZKwTCHjDtrvMfxnLmZbNl
 U8ST6T3Iyn6SyRLZ5Kix7HasmaxcEq2ix7h6dumgl1/4s41y7M4k2jmhd34IcrfZITY/
 gA/ydw1vC3SWvNxMhat3TaysC5RUEjQM4ztcckjk+hs0XyGrGIvPLUEinbpygJRuIciv
 EjWOl0ApK1F96Tq8OFUAAk76W1zft/B5qPu1yWgOc6KzgncNQQiZMHGtnajzc3awu8rU
 8AIsuvL6USgYrqZXCNXiHVNXMnwyaZQ/w2LzXPcf8S/3iSLYonMxCf1IEUx7yFD+9B44
 LMyg==
X-Gm-Message-State: AOAM532oMDVGI+8x4KL6xv+iKZx0r0vOy3xaRNvQVx3wWE95NtKSQOOt
 TJfFWrmWr78Ug6NYcVcXr7+arFh80mY=
X-Google-Smtp-Source: ABdhPJxHNS8XYuvKGZrzdIyr6TqAyd1foHl44RTPZQpyUBLBoTv4xUjMw//5I+8rYRHFtrwzwXPQ7g==
X-Received: by 2002:a17:90a:784a:: with SMTP id
 y10mr2071443pjl.211.1634855440885; 
 Thu, 21 Oct 2021 15:30:40 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 07/18] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Fri, 22 Oct 2021 08:30:02 +1000
Message-Id: <20211021223013.2641952-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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
trace point function definitions out of an otherwise hash specific
file.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/Makefile       | 2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c | 1 -
 arch/powerpc/mm/book3s64/pgtable.c      | 1 +
 arch/powerpc/mm/book3s64/trace.c        | 8 ++++++++
 4 files changed, 10 insertions(+), 2 deletions(-)
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
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9e16c7b1a6c5..049843c8c875 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -28,6 +28,7 @@ unsigned long __pmd_frag_size_shift;
 EXPORT_SYMBOL(__pmd_frag_size_shift);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+
 /*
  * This is called when relaxing access to a hugepage. It's also called in the page
  * fault path when we don't hit any of the major fault cases, ie, a minor
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

