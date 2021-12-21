Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA87B47C492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 18:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJN8D4ssGz3cks
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 04:03:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AJ4Xuw6o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AJ4Xuw6o; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJN5c3gxVz3081
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 04:01:24 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3B41EB817C8;
 Tue, 21 Dec 2021 17:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0189C36AEA;
 Tue, 21 Dec 2021 17:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106080;
 bh=hDrpxjLpH7AYnsBnnFE9PQK2fvJYNhcVso1F5XKuDwI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AJ4Xuw6oLpN8ml0LwHdI39lylRfTgDcfl8iIiQTt73Uxrxsz18t5iWDWxLfFMofvf
 BYXiPVWpbcpVSl+Up80Kzzr/UdNMenLF3AEowc7WAONmtN9qA9wdZ6ufhnVed+63jp
 yNi0L5okjlgWTf9w+/nPeVMhvMjmxgK7G9whxRzeqpgBVhCHO4lrGODFKI63ljF917
 o6H6mITHNRBhOgqqlA2JwTsceC4kbYwisgUKxrEtVrEAGfZjnM8MR6aAUmjqpF3/H4
 zl21s/bk5UNrnDwlw7d3pKwOL1+ZdYf+8Hm2dMUIym6Ke5jWRJE0C6/Tf08BXA9APE
 xVzSJAXLFU/sA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Subject: [PATCH 3/8] sched: sparc: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:52 +0800
Message-Id: <20211221170057.2637763-4-guoren@kernel.org>
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

This macro isn't used in Linux, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/sparc/include/asm/processor_64.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/sparc/include/asm/processor_64.h b/arch/sparc/include/asm/processor_64.h
index ae851e8fce4c..628349fc4cdd 100644
--- a/arch/sparc/include/asm/processor_64.h
+++ b/arch/sparc/include/asm/processor_64.h
@@ -27,9 +27,6 @@
 #define VPTE_SIZE	(1 << (VA_BITS - PAGE_SHIFT + 3))
 #endif
 
-#define TASK_SIZE_OF(tsk) \
-	(test_tsk_thread_flag(tsk,TIF_32BIT) ? \
-	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
 #define TASK_SIZE \
 	(test_thread_flag(TIF_32BIT) ? \
 	 (1UL << 32UL) : ((unsigned long)-VPTE_SIZE))
-- 
2.25.1

