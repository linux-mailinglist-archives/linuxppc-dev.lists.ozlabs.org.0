Return-Path: <linuxppc-dev+bounces-1404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE33097A119
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2024 14:05:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X6kBT4FSLz2yL5;
	Mon, 16 Sep 2024 22:05:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726488321;
	cv=none; b=E6b/ZY1Ji0krReXBzpDSIs3fE3wYDRX2d4+Oh26b4r9Qj4YHZmxHttCPfHuSD0A7+uQl9VEjbxyJdHhY/pXYyc9HPdq00aqIUuBkdrIRT1doa5DKkZQJeSfZoVknaa0u3bFHci99xhJJYStdcFtkBdJ1fmvxNZOew/kdt7ARH7GoM7h3irbPzVJ0fwCl9Buvu0C2ysJLOG3M6xPau3WPaSmZa5p4C+NKMvJ0YjJo35tU5ysoJWEIpfiz3I410/F/2ti0uSQGr2qAd2NJpDGqr+B8sRQYhPLfN78hpMgNCSQ06WAo9Z6TH8B8sJWc4QTbsBoOC2qxEoFiutacd0sxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726488321; c=relaxed/relaxed;
	bh=18t7rflhaYvVgyXnOMIFDUq2RCu2sj0IPep/TMv98gk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAE+gCf68zhY9C482dornZXxV/HXLPbBVxfPW7TTtR5SMbN2YKyfy8ci8DOR5bgTbz0rXmgpoCfg+r7pV1t6IXAY4rKhYNM0iZx1g3efPfsGNiE2t+YtQw0G3HucrZE089lQ47eIg7wSePGKsX0xyKmvLY+O1/vQGBmK8HfOWaHt9xaJmWB1NDvN6V8af+f3fT8zjsPgYstLppU4CoDd4rmDTcA7CNxyv+sjPZ1GMGkyYaYbJA8SOpV1Ug1+u4iNHnZK6+vt8MLFAogMSVGJD6PDixU7XFeyDxvxTyibalI87dxkGoVaE942B882DUBA0dqgrHdgZbc4i3iz1Hgoog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bYGSkZ4u; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bYGSkZ4u;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X6kBS28Zpz2xYg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2024 22:05:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726488318;
	bh=18t7rflhaYvVgyXnOMIFDUq2RCu2sj0IPep/TMv98gk=;
	h=From:To:Cc:Subject:Date:From;
	b=bYGSkZ4uNi3nbhd6+xFM/L/builVI1Q41dpuBlNBkFGO65ljpumCpXpZsdo3clE7P
	 cn5/4048DYulkfwq4U2QK0kYE3dGeSNquMWZcyCpbbhMpeOtE1lyQ37cI82d6wUWnD
	 u/HJbZr2XQkrjmVFQ3wWxYkCQrl3YixBPcgZLXxgH2WGVvK63lA7OAIK1nz7k/Mb7a
	 mIEbIdPgdsX6HDHDeaOYYpAZvsESgx+hsQHb/qAphDP+/NqJ2Cw92+OKx/qTttma0Q
	 8c/Z8JRQLqx+TdmjbJ0JdFu+xL6TLbCPyz6Cwd4voN4YHqk922F1W709BeOGcO0oXa
	 wP3YAyzkZpbIA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X6kBP1Qc6z4x8g;
	Mon, 16 Sep 2024 22:05:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <christophe.leroy@csgroup.eu>,
	<segher@kernel.crashing.org>,
	<sfr@canb.auug.org.au>,
	<linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	almasrymina@google.com,
	<kuba@kernel.org>
Subject: [PATCH] powerpc/atomic: Use YZ constraints for DS-form instructions
Date: Mon, 16 Sep 2024 22:05:10 +1000
Message-ID: <20240916120510.2017749-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'ld' and 'std' instructions require a 4-byte aligned displacement
because they are DS-form instructions. But the "m" asm constraint
doesn't enforce that.

That can lead to build errors if the compiler chooses a non-aligned
displacement, as seen with GCC 14:

  /tmp/ccuSzwiR.s: Assembler messages:
  /tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
  make[5]: *** [scripts/Makefile.build:229: net/core/page_pool.o] Error 1

Dumping the generated assembler shows:

  ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t

Use the YZ constraints to tell the compiler either to generate a DS-form
displacement, or use an X-form instruction, either of which prevents the
build error.

See commit 2d43cc701b96 ("powerpc/uaccess: Fix build errors seen with
GCC 13/14") for more details on the constraint letters.

Fixes: 9f0cbea0d8cc ("[POWERPC] Implement atomic{, 64}_{read, write}() without volatile")
Cc: stable@vger.kernel.org # v2.6.24+
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240913125302.0a06b4c7@canb.auug.org.au
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/asm-compat.h | 6 ++++++
 arch/powerpc/include/asm/atomic.h     | 5 +++--
 arch/powerpc/include/asm/uaccess.h    | 7 +------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index 2bc53c646ccd..83848b534cb1 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -39,6 +39,12 @@
 #define STDX_BE	stringify_in_c(stdbrx)
 #endif
 
+#ifdef CONFIG_CC_IS_CLANG
+#define DS_FORM_CONSTRAINT "Z<>"
+#else
+#define DS_FORM_CONSTRAINT "YZ<>"
+#endif
+
 #else /* 32-bit */
 
 /* operations for longs and pointers */
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 5bf6a4d49268..d1ea554c33ed 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -11,6 +11,7 @@
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
 #include <asm/asm-const.h>
+#include <asm/asm-compat.h>
 
 /*
  * Since *_return_relaxed and {cmp}xchg_relaxed are implemented with
@@ -197,7 +198,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
 	else
-		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : DS_FORM_CONSTRAINT (v->counter));
 
 	return t;
 }
@@ -208,7 +209,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
 	else
-		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+		__asm__ __volatile__("std%U0%X0 %1,%0" : "=" DS_FORM_CONSTRAINT (v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index fd594bf6c6a9..4f5a46a77fa2 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -6,6 +6,7 @@
 #include <asm/page.h>
 #include <asm/extable.h>
 #include <asm/kup.h>
+#include <asm/asm-compat.h>
 
 #ifdef __powerpc64__
 /* We use TASK_SIZE_USER64 as TASK_SIZE is not constant */
@@ -92,12 +93,6 @@ __pu_failed:							\
 		: label)
 #endif
 
-#ifdef CONFIG_CC_IS_CLANG
-#define DS_FORM_CONSTRAINT "Z<>"
-#else
-#define DS_FORM_CONSTRAINT "YZ<>"
-#endif
-
 #ifdef __powerpc64__
 #ifdef CONFIG_PPC_KERNEL_PREFIXED
 #define __put_user_asm2_goto(x, ptr, label)			\
-- 
2.46.0


