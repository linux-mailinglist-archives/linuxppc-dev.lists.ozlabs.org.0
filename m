Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881147F1F6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 05:57:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLWrD1FvPz3ck0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 15:57:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HBUzN/dA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HBUzN/dA; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLWnm1bZ5z30JT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 15:55:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 716B1609ED;
 Sat, 25 Dec 2021 04:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB97FC36B02;
 Sat, 25 Dec 2021 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408105;
 bh=RZHxDhGeVX15oaLNc4kx+vq7jlXyQAqs6QHL/XY/HJ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HBUzN/dAdq53By2AFjyJLl1rUToAPIE0DArdtg2/nQcxIbo2Jb3T2uQD9h6V/j4lD
 AO4KrkZ4eaF7bxV4pwuJO32Huq9luMfiaNEVYeguq1ne+OKSWWzZUNNCOT6cxHxrDx
 4JDLSz2JRUouJ9fKJYqyJKJvEuA9MfTfc6Zvk8XyN084gA0wgj6BswXD2r1Em3nWPh
 yechGLYta7pErAUHHEbq2C0fTrmRGMUusAWTOSbZOMW9bHLi8RnXR4j/w+G46CaIX6
 Dqv5PslHxbh88YCZyfjD1r6NBxa40/8zEDDYYj+vE0A0TeoQNT+g2bNBr7Pxe+Igwf
 sn/mteg33tFgw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Subject: [PATCH V2 3/8] sched: sparc: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:25 +0800
Message-Id: <20211225045430.2868608-4-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
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
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
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

