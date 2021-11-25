Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31D545DA81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:55:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Ht74fQWz3dpR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:55:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=puxUibF8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=puxUibF8; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmb2vKDz3c69
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:50:55 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so7706144pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=puxUibF8lYjezZaxBX9/hoYb73DrxFZ5UOg0rOWZT5z0mVpT6nyPat0xQahYDKqVvK
 Y+TtPiCg2QWePIMKYoT0YtXSf0If4Aq3/Rmildh2MOlv3quZ4OvvOYySDPB1o/rDdvux
 vaj9JfwuwN720iLAnCBe61cHwZmDMS5bIjbbzKxqSa8Q8YUvxzq1z7OvzLAxxB8ZVKGi
 0wrnhpcewGa+avLTc3IYuEsL2fFYIqRrjHUkKA801lY0r3aTXrVeZIDiolhD5Rc+ZvDt
 BT0AZ13jpgEhhenJlVRX2IJtnVxhQeGrCRzW7gCYEmG36HkxmbxyJgnly0tuLEuF1Ot9
 5sMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYiqrOnJIVcoGDEZ78+PPl1VPjRqGYZHo0GYFpEQr9Q=;
 b=oy4vo3YCinUL0Z8dP6N5FEuStaKP6ZiDO6kBX/J1y2uW6j9kjno08npGBbQ6YJFBEa
 GPckkXyXY7oRDjq6OEB6t4gfxWe2uBjmfej8tprtWIcR6DpvlO2YwJ/sEoD2iE8VHeeH
 TBwAAcJ6mYYR432slBNwD4n1y6+rWYNWvLQgRU41Pou12we17jI3v93qRA0gNMkz/9AH
 jCro3pefys4ADVJ2+oWPlv1jN8OSK6tWoyBQE8Nz9nsrEzIvxoh+5Bk0t2qu/iy+naUp
 sDYly81Axg70JqLRCzICU9KB62vonIbbxbNs9IRL6nC/okas/QhRDPX9EN/cFrpaSl2Z
 4rxA==
X-Gm-Message-State: AOAM5327eSA0omXev2d3Ire1gxN+7b2EmweIVMz2rJXAW46qnhSn5Atl
 TWqXQ3W75O0IZGitaoBEC1eboNMAnYs=
X-Google-Smtp-Source: ABdhPJxnwRZ3Ptijx3p0WiDrFeDCLIUTLKhXuiNzIGUrO8nIpwrsttIXOEe4vSKpZ65MnNg9e4REbw==
X-Received: by 2002:a17:90b:2251:: with SMTP id
 hk17mr6588480pjb.31.1637844653759; 
 Thu, 25 Nov 2021 04:50:53 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:53 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 07/17] powerpc/64s: move THP trace point creation out of
 hash specific file
Date: Thu, 25 Nov 2021 22:50:15 +1000
Message-Id: <20211125125025.1472060-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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

