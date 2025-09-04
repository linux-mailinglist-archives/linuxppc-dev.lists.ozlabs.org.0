Return-Path: <linuxppc-dev+bounces-11746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FBB44396
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Sep 2025 18:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHlpk2NRVz2yx8;
	Fri,  5 Sep 2025 02:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757004638;
	cv=none; b=l/Epw7seK/IDc+zKptWSe0G1kZWi1iZyTj3kacVqRMNaWpCE7QrOHlhDMcbL/ojnYhN4kPkH/C+xOo6Lbs3qaRAIyhpUESKuBmNardpHTCrCEqgQjrRmf3H+KnBvKxO3kWjJkHOQqEgkt4UMRtAoQKLuZIqXYQK+mK5hDra78oua+GlyFJFqL/Lva6/DfKi4PjUVJI4TT4MXoQVW+dhqg0ef0rO5ZugxodWZwoKNNL29vyrGVwa2l3I4rqmF8ZV9+4bLXwEQ3xLb1wWvH8HDPn8OXi2ZOLUQW0f9OXTCSw8REjJL7FsQyRfkRMqBqYlVlymeTwk2GnsZTkO5uE5edg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757004638; c=relaxed/relaxed;
	bh=A522sWw3GaZOE9bCrY3TA6bmLxXZNccn8O3oZThDQu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F7wuGZZv0WhBRiPPPxWlmszK3IzTfucb0P75RyorxpLxOmMbTvsA0R+trAqO8xPZCH75QeFw6k+zRySrtizIXxp0jTX1EqE5INOpHi/DcbMM1yZYlcRVQgEDRKQY4x3GajCJB7OUbePwWqk+tJkZFFzxJ+Sj6ZWFJj30POhggWwZ7W9EyLNDEtor7NLP6AlOw8/F4Jb2naLeW/t665he9OSMRL9Egl9k1Elzb2Dp7ZlYvxWkP6GSR129XWRssp1dTaS7Qr23sdO0LuUog7F0+qoTyvR4UzkgdOqIhBoTavct50wN6S7H6aE0hxMmvhxwJgvfi+BjCnUFNksLvgF20w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHlpj2f49z2yr2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 02:50:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cHlS70D50z9sSV;
	Thu,  4 Sep 2025 18:34:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y6xo9ZAGgD9m; Thu,  4 Sep 2025 18:34:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cHlS66GDfz9sRg;
	Thu,  4 Sep 2025 18:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B938C8B774;
	Thu,  4 Sep 2025 18:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id v5CnmidNTZz9; Thu,  4 Sep 2025 18:34:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 41B228B773;
	Thu,  4 Sep 2025 18:34:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Donnellan <ajd@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup failure
Date: Thu,  4 Sep 2025 18:33:19 +0200
Message-ID: <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003666; l=3463; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=5XmLWb6AW/wF1cOIffi1LQBKp5WVMTTPilSSuFEDOmM=; b=F5UynnZFkjGfkTcydx3QGxXAwguoGHAFd9xqEbKeZxKUuMqXaC1cPYAG/FAnK4HvgWJt8yB0H /lI4d2ifDj0CzATtd+wdd+Lg2Zc0jE9Wc3IjhgPBUlFS0FxPYfZrDU1
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
kernel text has to be mapped read-only or read-write based on build
time options.

But nowadays, with functionnalities like jump_labels, static links,
etc ... more only less all kernels need to be read-write at some
point, and some combinations of configs failed to work due to
innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
access to kernel modifications.

Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
possible options that may imply kernel text modification, always
set kernel text read-write at startup and rely on
CONFIG_STRICT_KERNEL_RWX to provide accurate protection.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/pgtable.h | 12 ------------
 arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
 arch/powerpc/mm/pgtable_32.c       |  2 +-
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 93d77ad5a92f..d8f944a5a037 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -20,18 +20,6 @@ struct mm_struct;
 #include <asm/nohash/pgtable.h>
 #endif /* !CONFIG_PPC_BOOK3S */
 
-/*
- * Protection used for kernel text. We want the debuggers to be able to
- * set breakpoints anywhere, so don't write protect the kernel text
- * on platforms where such control is possible.
- */
-#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_SWITCH) || \
-	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
-#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
-#else
-#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
-#endif
-
 /* Make modules code happy. We don't set RO yet */
 #define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
 
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index be9c4106e22f..c42ecdf94e48 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -204,7 +204,7 @@ int mmu_mark_initmem_nx(void)
 
 	for (i = 0; i < nb - 1 && base < top;) {
 		size = bat_block_size(base, top);
-		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
+		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
 	if (base < top) {
@@ -215,7 +215,7 @@ int mmu_mark_initmem_nx(void)
 				pr_warn("Some RW data is getting mapped X. "
 					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
 		}
-		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
+		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
 		base += size;
 	}
 	for (; i < nb; i++)
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 15276068f657..0c9ef705803e 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
 	p = memstart_addr + s;
 	for (; s < top; s += PAGE_SIZE) {
 		ktext = core_kernel_text(v);
-		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
+		map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
 		v += PAGE_SIZE;
 		p += PAGE_SIZE;
 	}
-- 
2.49.0


