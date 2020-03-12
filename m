Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D091831F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 14:48:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dVX31VrlzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 00:48:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IbGHOA3s; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dV5H4BXZzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 00:28:19 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id g6so2682618plt.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ptL293kyj8nSFPX5gOhpUcpQg2dEQmzdIA3eipuwDzk=;
 b=IbGHOA3sWoTfAV58TcG7+E3AhEpW57IQvk9yDRbkbKZzcOJtB0wa8x3Hm/czySSKWR
 +0c+d+bJgiwcQv0Vi0altJNp/v5SBggifoTlJEkXWtE6X0yKlElTnVsvG4vjmvWajgEp
 Oj7x75h7o9LBho0fwgP5lYTdpMeSRmvFu4uf+7FvyB6GsEFyYE2DJ1U09c3o6EclbRRo
 FbL3VGvuZg0+AaEkiO2yYs9y6fc+9lLU8rd6CthyHuGdxFu6rNsJvo5imIbskHrzXVsQ
 AfdDE101+Ie7EbLNbOI5qa7kmktJb+8d1zQNyNgXJtK2SNPKiiOZjIh5uBFmnuZgOab7
 siTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ptL293kyj8nSFPX5gOhpUcpQg2dEQmzdIA3eipuwDzk=;
 b=eoNLxcdAgw8WPDGaB3zDrvtnmGrfOJ8lIHW6ZFzgiDYELvm3hmlJy4Ba39oYinTtlg
 mQfRj/IJEeteCvMpZrXVDIs96pSkrRsqT0xjHG/I03ztPgNFBKyg8mdDU7b0psKGkubZ
 f/YIn31TvsajwbzXSMN6H5aN83ATgY9e9w4d8wKMxAYxJPkXF2opVZ06krvWdsyvKxaV
 u52Qc45cI/YUhtgGavnFfvwZyjW4yRaf7VTR1E8PXdN1FTEra3skjfxiY0n7tnmJhPYq
 rv+MPH1cCJerItVV62ROW55TzOKfGpr7DezPFSL84WWTd7bRhMOBLnV2Q3uii89Msf25
 SMbQ==
X-Gm-Message-State: ANhLgQ04YjC4YY94DcayysRURnytsY0vrgGCv0b8n5ksiBwKum7Q3zVp
 CipiIHNMQq6nvFfllsMGFPlO1A==
X-Google-Smtp-Source: ADFU+vst0ubOJ3OTPrlmehYL5+WoIBd645gGraJhFqONxy/bybPJuO7k0PfDYSHJ3OEs6iZnWB7pOQ==
X-Received: by 2002:a17:90a:34c6:: with SMTP id
 m6mr4265443pjf.13.1584019696597; 
 Thu, 12 Mar 2020 06:28:16 -0700 (PDT)
Received: from santosiv.in.ibm.com ([111.125.206.208])
 by smtp.gmail.com with ESMTPSA id w206sm13007435pfc.54.2020.03.12.06.28.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 06:28:15 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: <stable@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 3/6] asm-generic/tlb,
 arch: Invert CONFIG_HAVE_RCU_TABLE_INVALIDATE
Date: Thu, 12 Mar 2020 18:57:37 +0530
Message-Id: <20200312132740.225241-4-santosh@fossix.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312132740.225241-1-santosh@fossix.org>
References: <20200312132740.225241-1-santosh@fossix.org>
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
 Greg KH <greg@kroah.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Peter Zijlstra <peterz@infradead.org>

commit 96bc9567cbe112e9320250f01b9c060c882e8619 upstream.

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
2.24.1

