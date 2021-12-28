Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E34806E5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 07:53:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JNQGf6mTsz3dnN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Dec 2021 17:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=p4P7PIVK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p4P7PIVK; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNQ9C6RXBz303H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 17:48:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8EED8B81183;
 Tue, 28 Dec 2021 06:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D17C36AEB;
 Tue, 28 Dec 2021 06:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674108;
 bh=VNmoFKw8R9K2OcmjmelDhRhySWO6Ih0fBU/Aljv4crs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p4P7PIVKeH9DRPDMaJHzgL9388gzhi6Jpx/12ZZaWUMeUmu0fZt7eygIyKX8iFEEp
 5V7Qm2P/0tUCPOllQQS5zGIKo1i9xBMYcEo0LwM4nRrc1GBp4jY0IknZCs8CW+b8aC
 +BWs1+cfSPC5J8+q7mLjVFtOZiazn965xbGrsrVnPhcbVr1Oo0pjsKAzECkfHZU1vW
 5oE6//VIWrFOJ7unJPtQolyyGtYFSHR++InYTtZ7ns6hf2rxEtLmmIRGM3fv3SKrIk
 WiGlzw3OZn26f4CGIp4O4kCTDg4moVXZYWKHXEQKA4j1miHCHincoRMHWP25QglKsk
 Oqsjqp5no8Bdg==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Subject: [PATCH V3 8/8] sched: mips: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:29 +0800
Message-Id: <20211228064730.2882351-9-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
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
Signed-off-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/include/asm/processor.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 4bb24579d12e..8871fc5b0baa 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -61,9 +61,6 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
 #define TASK_SIZE (test_thread_flag(TIF_32BIT_ADDR) ? TASK_SIZE32 : TASK_SIZE64)
 #define STACK_TOP_MAX	TASK_SIZE64
 
-#define TASK_SIZE_OF(tsk)						\
-	(test_tsk_thread_flag(tsk, TIF_32BIT_ADDR) ? TASK_SIZE32 : TASK_SIZE64)
-
 #define TASK_IS_32BIT_ADDR test_thread_flag(TIF_32BIT_ADDR)
 
 #endif
-- 
2.25.1

