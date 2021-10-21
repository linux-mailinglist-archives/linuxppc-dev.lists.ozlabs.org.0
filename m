Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C94359A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYdR0dQcz3cN0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:59:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y+RQeUyr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y+RQeUyr; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYX04Zw6z3bjP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:40 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id d9so4728575pfl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=Y+RQeUyrMOBxWPxyx2XM2OhkNsbzzGOyOR22YEM3sNahvNIeERfDMY3lSbmWDq6QWS
 zhyAFocW3cSXwySgBCoWJ5xe7PKHFOL6uFmbgHvWp5sgrC0rPs+46IkFV76wJwMRpoiO
 WrTodcGzGSQ5tju7vK1nXgOnnZfcAR74DXRjEB4FF6GCct3NdnYkL6Nuzhm90s10k2SJ
 pEkdiWUy6dCD6HB00+WkqhvI6apNaDPcOfqKM/dNFsoudp98S6KhF3K0xYChboejD0Tt
 HAUUWzbDr22Acf8VHXoBWF7KaVoO5g6jf5q9p/YfEK8hMayuqFD7JsOqo6pbcCLOR52F
 mtvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=MLnDAAB2uIxcgTkTm5IR6qSj8I82JBZ+sY8Cv0zGYMC/Z+nFykaFP986UezcvF4eRu
 rzx1coveqw1yv1zuNBzUN8cN616G+TLt6X/xNpb8iLeBiuYugqBQeUZKzJh8RT89PS6O
 RS/yhnCQVbIUxijQYQmnylwzC1o8rwD0bdyWog3laeBsoBPos2klwIc+u6EIvsrXSc4u
 KiR6iAen1kkkiFLeU5ZZT3pJlYV2COmmyWd0z40oQPqYQz3eQ/vLKmNJcnPuEevCP/si
 7uxmSNZ1DBzhqi3JC2WQhN4uXHBuGMyFt/TNx85xuprbbakeLKNqzO4lF8Wy/vm4ws/l
 wRJg==
X-Gm-Message-State: AOAM533W6cZsVQImI6BeFTCEtiLVKK/l+Noeu+b74Os7kEdph6txAIZ8
 wHqjYrhbySaP3zxMGW3/PebHjajbWpQ=
X-Google-Smtp-Source: ABdhPJy3jGorzEwcsQdCNZ0dJYxFV6KBt76YoZhOUm72x/C1u/fDck1WGLvYcgUqbBkevFh6nCkvaQ==
X-Received: by 2002:a05:6a00:b48:b0:444:f9d4:d800 with SMTP id
 p8-20020a056a000b4800b00444f9d4d800mr3438719pfo.38.1634788478223; 
 Wed, 20 Oct 2021 20:54:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 07/16] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Thu, 21 Oct 2021 13:54:08 +1000
Message-Id: <20211021035417.2157804-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

