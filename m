Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33722198E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 03:37:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6cLj56SyzDqWx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:37:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UHwwNzkJ; dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6cJq1cQyzDqs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:35:37 +1000 (AEST)
Received: by mail-wr1-x443.google.com with SMTP id q5so5109887wru.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=No2sfoa2XC1AzcEtK/n3qxZKzaVyUKVOKE64N4pMv54=;
 b=UHwwNzkJQ9qTDaaKlL7k/lxPK/jXaantEE3zp7KA0EWNHj+HPs1rIs3rWntTeks/o6
 +m98G3qHhJuhXaaq8kMs5n1L5gaAOL7G69soMsn2LermUDffcrkQbg8d+lBD47KfkOh/
 FWZtngpH9SVgpETAzmg1pSM0PbGP6WNa29gZ+OX8j6AX2NOPsVo5JekiDu9xM8T4vAHp
 9UgE8r8MqhF6H8LT7VR4ApCSXcZABKDhLkgudTSABbnCCuQGVny9DcDP7TsXxuamZzZ3
 fjAdMjVOkP5eknRNuqoyR2YW5UBzUKfG4rWkEWM9oqKqMhkBYXrBPeuBDzmHjTQZLURl
 aVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=No2sfoa2XC1AzcEtK/n3qxZKzaVyUKVOKE64N4pMv54=;
 b=AtdRNMIwnM5bce/qiBv4TsQqflAfIHP/XMZq7+KTBuv5PRm+35niMe9e45R2t7GAyF
 2T27G5FOjgHGABKezaolNVghWyBaKovVyPc4bEQTw6Dt9vpc9fQyaEjV4W4vNVKGPMUE
 lwkiTDfEmjQvpSlwoVwexZ6vzdz6WYAFrE7wgHdhcrRkkwM6FYwxOtU0rMNko/c66UHM
 UYz7NSNUkUbzPEatIfrL+plj2opZbBbPBWtmT96B2D40/nEE4nxNkNdY0GZKbOJZM9N1
 xUjMdE1oCje/Dm8mMjxhQ72/gJraP4ZtH//Q4/UQjg/9bg+/8PE3kJpBsgbuzzyCWqtJ
 NHrw==
X-Gm-Message-State: AOAM532gIwYMmN5uWRYNQoSj1Gd+yaWKQM9LKDTuOXDSHLfUGsluPp2o
 opysHANpCN1i34RTIz57wvW113I8
X-Google-Smtp-Source: ABdhPJzKwW4E8EKZahCMqsAY6dQ2dsSbs4WSKcT9kAgysOtibkSAFbX7DAlm2f6LYw5ti733qyoBTA==
X-Received: by 2002:a5d:6088:: with SMTP id w8mr2313955wrt.49.1594863332634;
 Wed, 15 Jul 2020 18:35:32 -0700 (PDT)
Received: from bobo.ibm.com (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id p29sm6155879wmi.43.2020.07.15.18.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 18:35:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
Date: Thu, 16 Jul 2020 11:35:22 +1000
Message-Id: <20200716013522.338318-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linux-arch@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc return from interrupt and return from system call sequences are
context synchronising.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

v3: more comment fixes

 .../features/sched/membarrier-sync-core/arch-support.txt  | 4 ++--
 arch/powerpc/Kconfig                                      | 1 +
 arch/powerpc/include/asm/exception-64e.h                  | 6 +++++-
 arch/powerpc/include/asm/exception-64s.h                  | 8 ++++++++
 arch/powerpc/kernel/entry_32.S                            | 6 ++++++
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/features/sched/membarrier-sync-core/arch-support.txt b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
index 8a521a622966..52ad74a25f54 100644
--- a/Documentation/features/sched/membarrier-sync-core/arch-support.txt
+++ b/Documentation/features/sched/membarrier-sync-core/arch-support.txt
@@ -5,7 +5,7 @@
 #
 # Architecture requirements
 #
-# * arm/arm64
+# * arm/arm64/powerpc
 #
 # Rely on implicit context synchronization as a result of exception return
 # when returning from IPI handler, and when returning to user-space.
@@ -45,7 +45,7 @@
     |       nios2: | TODO |
     |    openrisc: | TODO |
     |      parisc: | TODO |
-    |     powerpc: | TODO |
+    |     powerpc: |  ok  |
     |       riscv: | TODO |
     |        s390: | TODO |
     |          sh: | TODO |
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9fa23eb320ff..920c4e3ca4ef 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -131,6 +131,7 @@ config PPC
 	select ARCH_HAS_PTE_DEVMAP		if PPC_BOOK3S_64
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
+	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC32 && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
diff --git a/arch/powerpc/include/asm/exception-64e.h b/arch/powerpc/include/asm/exception-64e.h
index 54a98ef7d7fe..72b6657acd2d 100644
--- a/arch/powerpc/include/asm/exception-64e.h
+++ b/arch/powerpc/include/asm/exception-64e.h
@@ -204,7 +204,11 @@ exc_##label##_book3e:
 	LOAD_REG_ADDR(r3,interrupt_base_book3e);\
 	ori	r3,r3,vector_offset@l;		\
 	mtspr	SPRN_IVOR##vector_number,r3;
-
+/*
+ * powerpc relies on return from interrupt/syscall being context synchronising
+ * (which rfi is) to support ARCH_HAS_MEMBARRIER_SYNC_CORE without additional
+ * synchronisation instructions.
+ */
 #define RFI_TO_KERNEL							\
 	rfi
 
diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 47bd4ea0837d..d7a1a427a690 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -68,6 +68,14 @@
  *
  * The nop instructions allow us to insert one or more instructions to flush the
  * L1-D cache when returning to userspace or a guest.
+ *
+ * powerpc relies on return from interrupt/syscall being context synchronising
+ * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_SYNC_CORE
+ * without additional synchronisation instructions.
+ *
+ * soft-masked interrupt replay does not include a context-synchronising rfid,
+ * but those always return to kernel, the sync is only required when returning
+ * to user.
  */
 #define RFI_FLUSH_SLOT							\
 	RFI_FLUSH_FIXUP_SECTION;					\
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 217ebdf5b00b..f4d0af8e1136 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -35,6 +35,12 @@
 
 #include "head_32.h"
 
+/*
+ * powerpc relies on return from interrupt/syscall being context synchronising
+ * (which rfi is) to support ARCH_HAS_MEMBARRIER_SYNC_CORE without additional
+ * synchronisation instructions.
+ */
+
 /*
  * Align to 4k in order to ensure that all functions modyfing srr0/srr1
  * fit into one page in order to not encounter a TLB miss between the
-- 
2.23.0

