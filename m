Return-Path: <linuxppc-dev+bounces-15158-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 099BDCEEA72
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 14:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djPHz1s3mz2yKn;
	Sat, 03 Jan 2026 00:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767359567;
	cv=none; b=oSkbH+FgzH42054kpM5LXtbzY9j0WHPYaTnxTtkpGReAvNQLXc4fX6XMDHaZRWVsokRBPuWwbnJRGIJFB5idYpqalJ3IMWyAwdi+8Uv92Zs3eQEMewes5sRAFsLeBmXxQpcdnuG3s4cem4zktISlvKLeFq6SiVozipHSB1OzpmP86MhzDrmKsxbRjwXSNz4VYmoscjYR/ssUb1nItb6ev+ft7KmjgyEEU8Zj/Q+klWjHRaJaSBksnHuqA6szhIh4BbMffI3Q4CgQ88vgohRVAt6/H/X8Jd9lG6PaEUL84Y56FcIrRjwa3vHV64y6k+F6UNhHkzjI1ivbJEWUzAFRcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767359567; c=relaxed/relaxed;
	bh=MWto1Q0kowHhw4FoeBdAHUQM9hEeAI3jz0BnUWumgVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xsez6sZG86nIkBGWblDuM9aEyKwW4dB1eowEE1GxjgydsboGZBn2LwodXPzWggP44M4ifSO2iVgZ9FyQbAfeoqJK5A3xDMyT1o6hzcXe4bgqK9hlawM1G2TNZO9r3txvA+nfhoBV3seZJR+j8NOvZxo5mgH89AYp/pPmD4Z3Bb/w0g9TCGoVp/TOb1p06/mmWHwCHE2yB6tlf4cdVHu5D1X/uEukwY1A5ieOCcA4zpA1IU9pDYUvVkwEa9wG6ubBpdQ0En1gbve/G5jfak7bHpHpCbGKa4B1H+gNtfPGrI5rSzsU1rZLQS09ObwaKdNyzv3Vm8xx45fYFKa8hNcgMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djPHy2lhCz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 00:12:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95E961515;
	Fri,  2 Jan 2026 05:12:08 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CF7F3F5A1;
	Fri,  2 Jan 2026 05:12:11 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to __always_inline
Date: Fri,  2 Jan 2026 13:11:53 +0000
Message-ID: <20260102131156.3265118-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260102131156.3265118-1-ryan.roberts@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
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
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We will shortly use prandom_u32_state() to implement kstack offset
randomization and some arches need to call it from non-instrumentable
context. Given the function is just a handful of operations and doesn't
call out to any other functions, let's take the easy path and make it
__always_inline.

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/prandom.h | 19 ++++++++++++++++++-
 lib/random32.c          | 19 -------------------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index ff7dcc3fa105..e797b3709f5c 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -17,7 +17,24 @@ struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
 
-u32 prandom_u32_state(struct rnd_state *state);
+/**
+ * prandom_u32_state - seeded pseudo-random number generator.
+ * @state: pointer to state structure holding seeded state.
+ *
+ * This is used for pseudo-randomness with no outside seeding.
+ * For more random results, use get_random_u32().
+ */
+static __always_inline u32 prandom_u32_state(struct rnd_state *state)
+{
+#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
+	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
+	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
+	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
+	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
+
+	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+}
+
 void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
 void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
 
diff --git a/lib/random32.c b/lib/random32.c
index 24e7acd9343f..d57baf489d4a 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -42,25 +42,6 @@
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
-/**
- *	prandom_u32_state - seeded pseudo-random number generator.
- *	@state: pointer to state structure holding seeded state.
- *
- *	This is used for pseudo-randomness with no outside seeding.
- *	For more random results, use get_random_u32().
- */
-u32 prandom_u32_state(struct rnd_state *state)
-{
-#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
-	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
-	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
-	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
-	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
-
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
-}
-EXPORT_SYMBOL(prandom_u32_state);
-
 /**
  *	prandom_bytes_state - get the requested number of pseudo-random bytes
  *
-- 
2.43.0


