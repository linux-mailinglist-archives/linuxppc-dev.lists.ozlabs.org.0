Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420EB47C4A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 18:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJN9f0lyFz3dfs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 04:04:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y1OS/PO+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y1OS/PO+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJN5n5BgRz3bnq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 04:01:33 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6241AB817A9;
 Tue, 21 Dec 2021 17:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12666C36AEA;
 Tue, 21 Dec 2021 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106090;
 bh=21+K8fAisVvzD89O507BazhTiVK3e2SzmbL55P10Iuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y1OS/PO+yvJI/bKgEMBVmfoC8xvxNIheoQmJpV42TA5ec+u8S5T/x1fdLb0hsigyD
 KBD8N9nQjxYvk95eA9zbLUMFvqbRNJSKX3ew9qlmxEhJY5JfVWKFtr4N1+uG3NKMaM
 JAX2pbFs3tg0Megdetl7llVWiT/imMIoJdsGjFdfamzdZlkGnd6+wvQOCJYiIDmHlp
 8pcfZjJF1rR4SiObVwlzCFr/aBo/ROB6IyYczCzMIVpc1OGOXbArI/X9ZDXc7x3fWi
 A0CAjJNtSjjBfDxaomCqyqkAXNHx/wU/OouL8BQZmX6ACLPQrCacoqCsKvhvOjHKEC
 2K1suEEmaHOZg==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Subject: [PATCH 5/8] sched: s390: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:54 +0800
Message-Id: <20211221170057.2637763-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.or,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/s390/include/asm/processor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
index f54c152bf2bf..605bc57a5ffc 100644
--- a/arch/s390/include/asm/processor.h
+++ b/arch/s390/include/asm/processor.h
@@ -88,11 +88,10 @@ extern void __bpon(void);
  * User space process size: 2GB for 31 bit, 4TB or 8PT for 64 bit.
  */
 
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_31BIT) ? \
+#define TASK_SIZE		(test_tsk_thread_flag(current, TIF_31BIT) ? \
 					_REGION3_SIZE : TASK_SIZE_MAX)
 #define TASK_UNMAPPED_BASE	(test_thread_flag(TIF_31BIT) ? \
 					(_REGION3_SIZE >> 1) : (_REGION2_SIZE >> 1))
-#define TASK_SIZE		TASK_SIZE_OF(current)
 #define TASK_SIZE_MAX		(-PAGE_SIZE)
 
 #define STACK_TOP		(test_thread_flag(TIF_31BIT) ? \
-- 
2.25.1

