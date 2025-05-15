Return-Path: <linuxppc-dev+bounces-8601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF4BAB86B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 May 2025 14:47:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyqjS1Gdpz3055;
	Thu, 15 May 2025 22:47:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747313228;
	cv=none; b=eg+xnw+yyZ6JbMOwE9hM3jHT/hKw5v0d2EqJYE4Zomvme6zZa0Lfvy5CYS0VIfFqaY0wxtyZZpx6K+lqNoO7l4o9puHFiBqSo7Oj+ltZpiSBvQAXD0ag6yfR9diKmN644QOnP0wP59+gxiPCJ4eJuVdxn/AzGSIXNLYiUvICXL1ztRXvpyM9CGr5mzdobUmw6rBxttMaBeQc4FLgmQOTeIX1gjAbff/DcullSHgmUqg6nlTN9qojkwRlrK0opXqNnhNUzQkR8L25Tc5BvX+4vMUujYmiuTsypEZCd7jCwqtHCSPAQXYW6lSEWa+8yOajSG/O2nBda3TZcF7NllI3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747313228; c=relaxed/relaxed;
	bh=GKd5aU8mS1aGXHd9rQRBDzvT4lJ+m8y3SAc24hngIP4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2Nhy/umwNFL/df7s3mKA1Zz8Hgt9jYsDDj9Hxu9MaQQR7+lZYPU9zqvs0a5QhlmnNBLZOcXOYtuDVsPOgIPRTfZTcAKBFIEYBcsrmml3/fw5ufOod/Zsz99jpZMbaemG6tVapRDBckzIWkwswgTf4WAHXmUuccnaDN0PaTausJkXTdU/f94PzgTnrKqiwz5dFjvnz/owLkDGQHyCMHpgjR4XYx5I7B6gL9/dDmiyIKq7d0s/SQs+ut4MYEjzYPfEY1x+CeU2wngK1PWeQEZrch5ccFVZFgJ5uel4/EPfCbQQgYOSK1QjJP86AOaGVsUDMtFUuOa9nqCVfwG1eJLFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEvGwZys; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OEvGwZys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mingo@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyqjR3M4yz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 22:47:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 988224A74D;
	Thu, 15 May 2025 12:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04102C4CEE7;
	Thu, 15 May 2025 12:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747313224;
	bh=jWZIqV+3LcIXkF+SWUyEanhdz9apJ2bmCTUUM4BXA1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEvGwZysIN02LjYSXXXmVSN0DlT0Z8rJM19XbpEJp6apfofkDoVz5X80muuqnLNRq
	 eUyy4ry0rWNu1CxdBK6SuXzyw5NSGmtKp1/p4CdRQTrT9i7tbns6SQuY+MAAqdl3eq
	 Ft30xm6mqwS4EcNzfJtqvnQjBsO1zbNmqN/QZB2WXaggBocc6fTVMTYNIdvAZQWBvf
	 qC6hVVttumbJIFqHjqfr4nrHIeY4e2azXa9wa8n0Ytc2+zjnXKP9DACF2pyCmc1YeV
	 8uVquPRL9X+oXJE/k9QF02T3U6DqTQx+Z+x0NSECg6KMKai1RFJqnhUL1BTiXEGtAZ
	 Y06sCccK3g9XA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arch@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 07/15] bugs/powerpc: Concatenate 'cond_str' with '__FILE__' in BUG_ENTRY(), to extend WARN_ON/BUG_ON output
Date: Thu, 15 May 2025 14:46:36 +0200
Message-ID: <20250515124644.2958810-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515124644.2958810-1-mingo@kernel.org>
References: <20250515124644.2958810-1-mingo@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Extend WARN_ON and BUG_ON style output from:

  WARNING: CPU: 0 PID: 0 at kernel/sched/core.c:8511 sched_init+0x20/0x410

to:

  WARNING: CPU: 0 PID: 0 at [idx < 0 && ptr] kernel/sched/core.c:8511 sched_init+0x20/0x410

Note that the output will be further reorganized later in this series.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: <linux-arch@vger.kernel.org>
---
 arch/powerpc/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index b5537ba176b5..171b6b2ba100 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -55,7 +55,7 @@
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
-- 
2.45.2


