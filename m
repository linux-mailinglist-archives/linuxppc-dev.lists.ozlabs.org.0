Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3D642F765
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW9k217h8z3cTR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 02:51:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PDYA9aGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PDYA9aGE; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW9cT0zRWz3c8f
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 02:46:49 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 pf6-20020a17090b1d8600b0019fa884ab85so9611084pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=PDYA9aGEpJC2+Nxe2rpSBSfnjpp/FjoslbJilHiVcX84Gwfgx32Tgo7Yo69X7/bINF
 OxU1Y56oJlgqkV8746ug9HwmnUB9Jcxzj0zx1dd3iX/GbOGIibyLEZvRvqO5GyGFTcY/
 8cb8xlEnlSYlzqNfFWuHeEz2KoRAg/lRgIPh/1hDlvQoQVDU5B5k5fBMx4WX7GO1gZ5f
 LD+ZUkf92YbdfZw9xeeMWWISD8mUAL/V/Sx7GG2dAdvdGChZKLf1snon8gdRlGxMJ3sL
 KcsEyBFmCplnxKabVWSteOtInId+NRXnr58VZSZvSSz0sD6FkuclXsc3Y0lKImUHNyk5
 2cfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkMGzwJAN8TMb4HSI/6ROPkBV/DnMWNyC7fvuDsq7sE=;
 b=mEVSI+LVu1ebN6QDTios4o593JGnVuW+2Y+YXmll2Ou2zHD8PeENkSiBKDyremwFAs
 A61jQKDqh5+Kh3HDNQYP6s2uN2sEqiOw19b+ypxx9swQG7+agqfZwIe+JZKW9Hm679lN
 u19hI+P8ZT0Y/LaqGva5C3MmoL+UkXRe2PbB5YVD5SJaJl0C4jJ0UB22PED88/Ybo/+2
 dW0Z4cnCwtlfkQTktT8p+/LjjEAZu5Q5+qA1KNigv9suO3bq5//Z0D9oNfqjZyEKwhez
 ICj6jhhwgvBJYukajcWjwcRU1/Itwn9vnKyNy+voZxjDwzJpLOLSBfrjTN009mwV86yN
 Hm7Q==
X-Gm-Message-State: AOAM530PZXMMH9c/dA/wxWEG4TN9fzOtvWZjQfEMdmk2hDlVzEsN2vwE
 nH0KzlRg1XDV2tBQL6PKJeEky1EUbyg=
X-Google-Smtp-Source: ABdhPJxk3gLKJBV3Ww1BUsVdb+JVdtuuDHsdE8ywi4fUnzgccZidb6Z1QT6e2XXqylqHOy8h+DfmYQ==
X-Received: by 2002:a17:90b:694:: with SMTP id
 m20mr28913175pjz.160.1634312806713; 
 Fri, 15 Oct 2021 08:46:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id y1sm5392092pfo.104.2021.10.15.08.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 08:46:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 07/11] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Sat, 16 Oct 2021 01:46:20 +1000
Message-Id: <20211015154624.922960-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211015154624.922960-1-npiggin@gmail.com>
References: <20211015154624.922960-1-npiggin@gmail.com>
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

