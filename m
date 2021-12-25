Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 003CF47F1F5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 05:56:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLWqW6W4rz3cZM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 15:56:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=byrTRC+8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=byrTRC+8; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLWnj0ZdSz30JT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 15:55:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B858160C72;
 Sat, 25 Dec 2021 04:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0F74C36AED;
 Sat, 25 Dec 2021 04:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408101;
 bh=D7/U3HVHnvdLiesri1jE7OLilV2Wekoh0yj4lEBJWbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=byrTRC+8fxp8jHbj0YHIBTJx13ra9eI4+1+wqqb2XatoanHFeEnUAB5CPEexvwuwC
 RTxw6e8ibZfN8wvqdtxRQUqStPIviNR1tukjX6HSyvfiLGP/AcWEmF9o6gQ1cNUlMO
 MhUE6Ti6oGVKLse3OXbpvmnFWsABcjQVMue3COD79wkSU2vX77zDHRWbFBdiRLROu+
 JsbXlEXlUZPg82q/iMvMoN5Nw8lOaL5zFXNm4TEUS8KE+OSgZJX3403HFGX5C/d7WF
 BuopzUBs5cGJgVtZ8znSl2oVIZUcEZoIbWAwL6YU0MYms5CYlqeSGDbERbvQhYUEDP
 bln0VWBZohRhA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Subject: [PATCH V2 2/8] sched: x86: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:24 +0800
Message-Id: <20211225045430.2868608-3-guoren@kernel.org>
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
 arch/x86/include/asm/page_64_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index e9e2c3ba5923..6191cf417c31 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -74,8 +74,6 @@
 					IA32_PAGE_OFFSET : DEFAULT_MAP_WINDOW)
 #define TASK_SIZE		(test_thread_flag(TIF_ADDR32) ? \
 					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
-#define TASK_SIZE_OF(child)	((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
-					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
 
 #define STACK_TOP		TASK_SIZE_LOW
 #define STACK_TOP_MAX		TASK_SIZE_MAX
-- 
2.25.1

