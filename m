Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8EE78503A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:55:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rxPKWVvB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVwS95H2Zz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 15:55:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rxPKWVvB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVwPL6xH2z2ytp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 15:53:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692770005;
	bh=WNSWjRhivhsPoefEDo29YmY/XDs4W+s/NXrLXMmZ1ms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rxPKWVvBGuC+ZV87tP7nFoSPj9wWNx134McNdvghzAjv25KdExaXu6eSOFqUAprtG
	 GSlEAXEOTObctXrcXPxddfpEg1oZqKoW69sA96XexM/EW239AsQT4cA1o7kcuLbXKy
	 PR5Lq6Z68aZvq4Az5Lhbtyvhsc0s2hT+iy0Rw8ZU7qBubUqcWDDQlY9m3WnGWofudR
	 s7HB5NfrdteyLQ46ZQSgPgwKqDxoyXpJhD7pWeDzq3Bbb7zXapzlVvb9evFXBF2Y8P
	 6R6kdNQcuSm62z4+33QYuBCR+7BgCqXXCMJqmCF7UxpfmlqFSiOFeoQL3pZSGQtav+
	 SyAOpNv27AvEQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RVwPK0tlXz4wy9;
	Wed, 23 Aug 2023 15:53:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/4] powerpc: Don't include lppaca.h in paca.h
Date: Wed, 23 Aug 2023 15:53:16 +1000
Message-ID: <20230823055317.751786-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823055317.751786-1-mpe@ellerman.id.au>
References: <20230823055317.751786-1-mpe@ellerman.id.au>
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
Cc: ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

By adding a forward declaration for struct lppaca we can untangle paca.h
and lppaca.h. Also move get_lppaca() into lppaca.h for consistency.

Add includes of lppaca.h to some files that need it.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/lppaca.h         | 4 ++++
 arch/powerpc/include/asm/paca.h           | 6 +-----
 arch/powerpc/include/asm/paravirt.h       | 1 +
 arch/powerpc/include/asm/plpar_wrappers.h | 1 +
 arch/powerpc/kvm/book3s_hv_ras.c          | 1 +
 arch/powerpc/mm/book3s64/slb.c            | 1 +
 arch/powerpc/xmon/xmon.c                  | 1 +
 7 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 27f0421188ec..b6a63fa0965f 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -112,6 +112,10 @@ static inline bool lppaca_shared_proc(struct lppaca *l)
 	return !!(l->__old_status & LPPACA_OLD_SHARED_PROC);
 }
 
+#ifdef CONFIG_PPC_PSERIES
+#define get_lppaca()	(get_paca()->lppaca_ptr)
+#endif
+
 /*
  * SLB shadow buffer structure as defined in the PAPR.  The save_area
  * contains adjacent ESID and VSID pairs for each shadowed SLB.  The
diff --git a/arch/powerpc/include/asm/paca.h b/arch/powerpc/include/asm/paca.h
index cb325938766a..e667d455ecb4 100644
--- a/arch/powerpc/include/asm/paca.h
+++ b/arch/powerpc/include/asm/paca.h
@@ -15,7 +15,6 @@
 #include <linux/cache.h>
 #include <linux/string.h>
 #include <asm/types.h>
-#include <asm/lppaca.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -47,14 +46,11 @@ extern unsigned int debug_smp_processor_id(void); /* from linux/smp.h */
 #define get_paca()	local_paca
 #endif
 
-#ifdef CONFIG_PPC_PSERIES
-#define get_lppaca()	(get_paca()->lppaca_ptr)
-#endif
-
 #define get_slb_shadow()	(get_paca()->slb_shadow_ptr)
 
 struct task_struct;
 struct rtas_args;
+struct lppaca;
 
 /*
  * Defines the layout of the paca.
diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index f5ba1a3c41f8..e08513d73119 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -6,6 +6,7 @@
 #include <asm/smp.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
+#include <asm/lppaca.h>
 #include <asm/hvcall.h>
 #endif
 
diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 8239c0af5eb2..fe3d0ea0058a 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -9,6 +9,7 @@
 
 #include <asm/hvcall.h>
 #include <asm/paca.h>
+#include <asm/lppaca.h>
 #include <asm/page.h>
 
 static inline long poll_pending(void)
diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index ccfd96965630..82be6d87514b 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -9,6 +9,7 @@
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
 #include <linux/kernel.h>
+#include <asm/lppaca.h>
 #include <asm/opal.h>
 #include <asm/mce.h>
 #include <asm/machdep.h>
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 6956f637a38c..f2708c8629a5 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -13,6 +13,7 @@
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/paca.h>
+#include <asm/lppaca.h>
 #include <asm/ppc-opcode.h>
 #include <asm/cputable.h>
 #include <asm/cacheflush.h>
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 78453b9b1ba0..6c6f90f1da94 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -58,6 +58,7 @@
 #ifdef CONFIG_PPC64
 #include <asm/hvcall.h>
 #include <asm/paca.h>
+#include <asm/lppaca.h>
 #endif
 
 #include "nonstdio.h"
-- 
2.41.0

