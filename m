Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFB535026E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:34:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9TN15Z4Rz3d6n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:34:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sLjjqYUK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sLjjqYUK; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9TL44lQnz3c5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:32:28 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50A8A60FF0;
 Wed, 31 Mar 2021 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201146;
 bh=Ht9rtu0Co+dG0mLJd/EeyOUGuASgL6Jraidb6iiV2SA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLjjqYUKM/9xT8bdGMLrv/vHz9hXgtgtxvs/oRmBw1S0V9setblm7Thg7sukdPtOh
 5Ff6couQIDJI4Zj2o5I89lUqC4hfTyLrlnnaG5vm6CEcTEYKTO/+O3NumvCjjgEiHc
 8qjcmWa/zIDXzY60NtXXR5R7f+OLc1kocQe2AiXzxCIR6a7HLR0QQiRzupGD7VTRTf
 RKfRw6YVG0MHOEviuThmdh3Z97OSB71QBJy1WJSuDfUIdQyk79BIDFWVVYeb316LO+
 2vLNSCWQKmwWV5DF2Rwv5oYo/GVqHJaM8oo/Br5KYK2E3yzm1SqoUhERexFzNrbhEA
 f1s1XOWvv+EcQ==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH v6 5/9] csky: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
Date: Wed, 31 Mar 2021 14:30:36 +0000
Message-Id: <1617201040-83905-6-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617201040-83905-1-git-send-email-guoren@kernel.org>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Waiman Long <longman@redhat.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

Update the C-SKY port to use the generic qspinlock and qrwlock.

C-SKY only support ldex.w/stex.w with word(double word) size &
align access. So it must select XCHG32 to let qspinlock only use
word atomic xchg_tail.

Default is still ticket lock.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 arch/csky/Kconfig                      | 8 ++++++++
 arch/csky/include/asm/Kbuild           | 2 ++
 arch/csky/include/asm/spinlock.h       | 4 ++++
 arch/csky/include/asm/spinlock_types.h | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 34e91224adc3..ae12332edb7b 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -8,6 +8,8 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_USE_QUEUED_SPINLOCKS	if !CSKY_TICKET_LOCK
+	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
@@ -304,6 +306,12 @@ config NR_CPUS
 	depends on SMP
 	default "4"
 
+config CSKY_TICKET_LOCK
+	bool "Ticket-based spin-locking"
+	default y
+	help
+	  Say Y here to use ticket-based spin-locking.
+
 config HIGHMEM
 	bool "High Memory Support"
 	depends on !CPU_CK610
diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index cc24bb8e539f..2a2d09963bb9 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -2,6 +2,8 @@
 generic-y += asm-offsets.h
 generic-y += gpio.h
 generic-y += kvm_para.h
+generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
+generic-y += qspinlock.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/spinlock.h b/arch/csky/include/asm/spinlock.h
index 69677167977a..fe98ad8ece51 100644
--- a/arch/csky/include/asm/spinlock.h
+++ b/arch/csky/include/asm/spinlock.h
@@ -6,6 +6,7 @@
 #include <linux/spinlock_types.h>
 #include <asm/barrier.h>
 
+#ifdef CONFIG_CSKY_TICKET_LOCK
 /*
  * Ticket-based spin-locking.
  */
@@ -80,6 +81,9 @@ static inline int arch_spin_is_contended(arch_spinlock_t *lock)
 	return (tickets.next - tickets.owner) > 1;
 }
 #define arch_spin_is_contended	arch_spin_is_contended
+#else /* CONFIG_CSKY_TICKET_LOCK */
+#include <asm/qspinlock.h>
+#endif /* CONFIG_CSKY_TICKET_LOCK */
 
 #include <asm/qrwlock.h>
 
diff --git a/arch/csky/include/asm/spinlock_types.h b/arch/csky/include/asm/spinlock_types.h
index 8ff0f6ff3a00..547f035f6dd5 100644
--- a/arch/csky/include/asm/spinlock_types.h
+++ b/arch/csky/include/asm/spinlock_types.h
@@ -7,6 +7,7 @@
 # error "please don't include this file directly"
 #endif
 
+#ifdef CONFIG_CSKY_TICKET_LOCK
 #define TICKET_NEXT	16
 
 typedef struct {
@@ -21,6 +22,9 @@ typedef struct {
 } arch_spinlock_t;
 
 #define __ARCH_SPIN_LOCK_UNLOCKED	{ { 0 } }
+#else
+#include <asm-generic/qspinlock_types.h>
+#endif
 
 #include <asm-generic/qrwlock_types.h>
 
-- 
2.17.1

