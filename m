Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B51DADB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 10:40:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RmQx4czqzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 18:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=lgiiQjKM; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RmH524ZszDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 18:33:20 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 145so1191566pfw.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WEw2wGx1vvAyoxxZ9FPUEcrVmh8BFlemdBg8LI0s3UA=;
 b=lgiiQjKMJE/dVWoAw0AvHVU2UgJ+yZMqakQ8rhPmPx4MFyq1qv18DIG9HSWsDIv6+8
 GaABporOSoZ5/i1lkGBK1+w6JJCt0aDDTtnTS6VA8UYlkePLFXiWYvRjHvw1Ph7g8iV9
 bX3xb8MAzha7hzqAl4OSF4n44OeEnZ9J1381EYS6zI3LX0hyzbu/1lCDguTdnWg4Diku
 RBYxNBnYM2me47Fv0F6DTMRk6Kuv1+hbVrgeuS1fpchuwPEO1EizgD6xmbHkLaWgMuu9
 9VEvxTjfvV+kasnPmr6XZVPLFDcMC05MYhjwZnP0Az7auCw2qxHjWahWxNbvVM2OJ/QA
 20eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEw2wGx1vvAyoxxZ9FPUEcrVmh8BFlemdBg8LI0s3UA=;
 b=iDzVkslHnnTzhKiLf97hJJKHV7nPKQEBQZaVCIg6cOasuMFHKzm1gdPFU8eMT0PswP
 T/A9KPieJTMCBDOJu0Cy4WUlkDaQlL29rjAsrAja9ua5LsihH50JP/akj+9QtkBQ0Frz
 Nz3SjJhsRl2hrGnDyNzakigehcUMMJvwAsyFOLMFvQO0LJEedQQzFYuxu0oo2FarN1e8
 HaYmqTn7iwTgGb+/XdzZTb4EhLGTXUeW8kW1NXg5VlgMj2KZaUAEs6JErUHFFzeUbARy
 e5qI87kiHEgr7sOBQqh4FUZbgL+k6RQEcj1N7nlxpuz5s84rSxXzg+sC9Z5s4k/zJOc6
 FzNQ==
X-Gm-Message-State: AOAM533DuuqSpCaTDZ7MARwhzeIt1Vb/WpORILArJoFyUXx3ONTUpdRz
 2BE0DGPixg/slifdRfjAATtoPg==
X-Google-Smtp-Source: ABdhPJw5Qq3QN6wymXN/voLJ8FEV+C4e/lXnltEu3Z86k17QxxrTUCdDvqJQKCn91RQY+EEKI7RZoQ==
X-Received: by 2002:a63:712:: with SMTP id 18mr3023617pgh.96.1589963598843;
 Wed, 20 May 2020 01:33:18 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([223.181.246.139])
 by smtp.gmail.com with ESMTPSA id 2sm1553980pfz.39.2020.05.20.01.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:33:18 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 3/6] asm-generic/tlb,
 arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE
Date: Wed, 20 May 2020 14:00:22 +0530
Message-Id: <20200520083025.229011-4-santosh@fossix.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200520083025.229011-1-santosh@fossix.org>
References: <20200520083025.229011-1-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Santosh Sivaraj <santosh@fossix.org>, Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 96bc9567cbe112e9320250f01b9c060c882e8619 upstream

Make issuing a TLB invalidate for page-table pages the normal case.

The reason is twofold:

 - too many invalidates is safer than too few,
 - most architectures use the linux page-tables natively
   and would thus require this.

Make it an opt-out, instead of an opt-in.

No change in behavior intended.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: <stable@vger.kernel.org> # 4.19
Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
[santosh: prerequisite for upcoming tlbflush backports]
---
 arch/Kconfig         | 2 +-
 arch/powerpc/Kconfig | 1 +
 arch/sparc/Kconfig   | 1 +
 arch/x86/Kconfig     | 1 -
 mm/memory.c          | 2 +-
 5 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index a336548487e6..061a12b8140e 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -363,7 +363,7 @@ config HAVE_ARCH_JUMP_LABEL
 config HAVE_RCU_TABLE_FREE
 	bool
 
-config HAVE_RCU_TABLE_INVALIDATE
+config HAVE_RCU_TABLE_NO_INVALIDATE
 	bool
 
 config ARCH_HAVE_NMI_SAFE_CMPXCHG
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f475dc5829b..e09cfb109b8c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -216,6 +216,7 @@ config PPC
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_RCU_TABLE_FREE		if SMP
+	select HAVE_RCU_TABLE_NO_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if PPC64 && CPU_LITTLE_ENDIAN
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index e6f2a38d2e61..d90d632868aa 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -64,6 +64,7 @@ config SPARC64
 	select HAVE_KRETPROBES
 	select HAVE_KPROBES
 	select HAVE_RCU_TABLE_FREE if SMP
+	select HAVE_RCU_TABLE_NO_INVALIDATE if HAVE_RCU_TABLE_FREE
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_DYNAMIC_FTRACE
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index af35f5caadbe..181d0d522977 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -181,7 +181,6 @@ config X86
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_RCU_TABLE_FREE		if PARAVIRT
-	select HAVE_RCU_TABLE_INVALIDATE	if HAVE_RCU_TABLE_FREE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
 	select HAVE_STACKPROTECTOR		if CC_HAS_SANE_STACKPROTECTOR
diff --git a/mm/memory.c b/mm/memory.c
index 1832c5ed6ac0..ba5689610c04 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -327,7 +327,7 @@ bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page, int page_
  */
 static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 {
-#ifdef CONFIG_HAVE_RCU_TABLE_INVALIDATE
+#ifndef CONFIG_HAVE_RCU_TABLE_NO_INVALIDATE
 	/*
 	 * Invalidate page-table caches used by hardware walkers. Then we still
 	 * need to RCU-sched wait while freeing the pages because software
-- 
2.25.4

