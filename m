Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFB122093A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 11:51:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6CMb256QzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 19:51:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ghMBMa6o; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6CJF6LNlzDqkw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 19:48:45 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t11so1846681pfq.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 02:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BE62416Xc19KRXmvjN2CjcEmrYIv08l7/E7jdoi1zI4=;
 b=ghMBMa6oHPfUaqdUjwynOWV+LMKEd8BRi/Q8axbMR0CCyoyKEzrLVIrG6ZElLCYL0O
 Vh1/EM6p8Dhca9uJkhYwZwYZ02giYdAj2qBibkHARMEx3CzYVOu/J9G7ObEbiENqdpXI
 ECJWONylQ79Oy2JRSEoEqcOom72b96KGFvRW0kvP7/T6zR64NDEeMn8zuDlMyXEHnJr9
 CxRBshIye4MDx+wxyKHCwbHmY/IFkz61uIery9g2x9D0/lLOO/6V1HEX0B8hogYHZvpi
 MQi00HLqEbNUYvRehYZAJYOJSd3/o5reDPTPGXqlUxo1VLNdcmooSzuODddGdMtr/AkN
 mjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BE62416Xc19KRXmvjN2CjcEmrYIv08l7/E7jdoi1zI4=;
 b=T8rwkjqp0oOBYNNAwM7JtpN4VUxVHR8fQghlLQoeGUyw5v3spz6/zA/JDE+SGCZ/+D
 EGOwN1e66575aA7Os9HOQhcOUgf+lVHmd3Ltfi45nEe83UmeEVfsj4JvZl1vprdM1JMl
 AdmWzBZPfldrDn8roF55ebFDYQ6rCMsPkFfKNZ1/stwfHcfAkHoKbipyMxM7jwMhNhTq
 JCn5Fj4bgFzXpugp92M5k7g4RU3lfBpYhmimQ8sNbhzjeeW22bJnjeGNv0Zm8woY8u9c
 M+PtgO8/mrJOJZH7R4+NLtJopce6kSp0j5am7e36yp42F6HPFODtueFHtd6vj/V8P9nN
 f/PQ==
X-Gm-Message-State: AOAM532bgmW/3fInOGMFNr2TnT9LkQe8O5pcf02pgbyfiZfZt74SnxJo
 VQpnuQke++x29ybDir+cXCsrvskf
X-Google-Smtp-Source: ABdhPJw1ZZ9JPF/xHU2Hp61fu+puTuyZ0wJXDdK4fMm6aKqlfV/K5KJZXVLOvAn6niwYCehILcDuUw==
X-Received: by 2002:a62:7650:: with SMTP id r77mr7898932pfc.235.1594806519144; 
 Wed, 15 Jul 2020 02:48:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (110-174-173-27.tpgi.com.au.
 [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id x66sm1790622pgb.12.2020.07.15.02.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 02:48:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: select ARCH_HAS_MEMBARRIER_SYNC_CORE
Date: Wed, 15 Jul 2020 19:48:29 +1000
Message-Id: <20200715094829.252208-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc return from interrupt and return from system call sequences are
context synchronising.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
v2: add more comments

 .../features/sched/membarrier-sync-core/arch-support.txt   | 4 ++--
 arch/powerpc/Kconfig                                       | 1 +
 arch/powerpc/include/asm/exception-64e.h                   | 6 +++++-
 arch/powerpc/include/asm/exception-64s.h                   | 7 +++++++
 arch/powerpc/kernel/entry_32.S                             | 6 ++++++
 5 files changed, 21 insertions(+), 3 deletions(-)

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
index 54a98ef7d7fe..071d7ccb830f 100644
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
+ * additional synchronisation instructions.
+ */
 #define RFI_TO_KERNEL							\
 	rfi
 
diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 47bd4ea0837d..a4704f405e8d 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -68,6 +68,13 @@
  *
  * The nop instructions allow us to insert one or more instructions to flush the
  * L1-D cache when returning to userspace or a guest.
+ *
+ * powerpc relies on return from interrupt/syscall being context synchronising
+ * (which hrfid, rfid, and rfscv are) to support ARCH_HAS_MEMBARRIER_SYNC_CORE
+ * without additional additional synchronisation instructions. soft-masked
+ * interrupt replay does not include a context-synchronising rfid, but those
+ * always return to kernel, the context sync is only required for IPIs which
+ * return to user.
  */
 #define RFI_FLUSH_SLOT							\
 	RFI_FLUSH_FIXUP_SECTION;					\
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 217ebdf5b00b..23bb7352e7c3 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -35,6 +35,12 @@
 
 #include "head_32.h"
 
+/*
+ * powerpc relies on return from interrupt/syscall being context synchronising
+ * (which rfi is) to support ARCH_HAS_MEMBARRIER_SYNC_CORE without additional
+ * additional synchronisation instructions.
+ */
+
 /*
  * Align to 4k in order to ensure that all functions modyfing srr0/srr1
  * fit into one page in order to not encounter a TLB miss between the
-- 
2.23.0

