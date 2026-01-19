Return-Path: <linuxppc-dev+bounces-15992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B390ED3A9C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 14:02:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrFx6c75z3c8s;
	Tue, 20 Jan 2026 00:02:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827733;
	cv=none; b=cXpCo888L+Jfvp9nJPWHYjphn1ykIXGxWre+876JWQUV1j/H0WSSs2ERq8rZdm4Tq8iYjUkzmmznwtbBAt6ih/nc0U5rTMbHwXsfBZbBNyOJoOvlIxDxjhWDnsk/p4A2/9DL1fz/roCQdD70v6NxKZXnH/XbevXkAXSnsep1LWufr2kOmq0fecH354ioMg4KOThkxP7iG87Ji6Uxnjw9RveeTQZ5wjkL9hEGkbCWw5ybr3zNkJWKF49TleEq4i1Xe7KMpyvFOaAbYCOyCJe6tDguTehyrs0TBfVuEZRgm2dwWpj8oDsIRZUtRn4gFgJoFawD+xElnIvEpQrBgKUtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827733; c=relaxed/relaxed;
	bh=R7ig3Va+cgJWyxLk2AjzSNcEnc0SV+kvjb8+9+gGOlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkpVam29mgbXD7uHk3zpwQy2DW/yqj8GkOAhkXs+VZV6fRNL1hy0+fdQtEnlDCgrdQclveBY1zbBITY49xGBxDblDFSnxR9nZJLpFUzEXnIllPExhrV9I/4R85lRVwktoy772E6UQbwlugDIq/mY/r45ZX2CS6Rs2PHRIk53op+QkyN7OzSy2WjrSCbvUV3MhhuiIXbLdRXztlioWvz1Jk1y6CqNFRNo8wKMwjAf4q8li8L1Yju42JQ/xR+h53CKunwcIIkBRTHWlMy5dyfzoPg38v+cVARyt441S23idjdyPk4ojjBuyA2Sg7eWv/YtBJuqVkReOPsSjMXGiM8+UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvrFx0p9Yz3bfG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 00:02:13 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 431E11517;
	Mon, 19 Jan 2026 05:01:35 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74ECD3F740;
	Mon, 19 Jan 2026 05:01:38 -0800 (PST)
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
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v4 2/3] prandom: Add __always_inline version of prandom_u32_state()
Date: Mon, 19 Jan 2026 13:01:09 +0000
Message-ID: <20260119130122.1283821-3-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119130122.1283821-1-ryan.roberts@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
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
context. So let's implement prandom_u32_state() as an out-of-line
wrapper around a new __always_inline prandom_u32_state_inline(). kstack
offset randomization will use this new version.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---
 include/linux/prandom.h | 20 ++++++++++++++++++++
 lib/random32.c          |  8 +-------
 2 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/include/linux/prandom.h b/include/linux/prandom.h
index ff7dcc3fa105..801188680a29 100644
--- a/include/linux/prandom.h
+++ b/include/linux/prandom.h
@@ -17,6 +17,26 @@ struct rnd_state {
 	__u32 s1, s2, s3, s4;
 };
 
+/**
+ * prandom_u32_state_inline - seeded pseudo-random number generator.
+ * @state: pointer to state structure holding seeded state.
+ *
+ * This is used for pseudo-randomness with no outside seeding.
+ * For more random results, use get_random_u32().
+ * For use only where the out-of-line version, prandom_u32_state(), cannot be
+ * used (e.g. noinstr code).
+ */
+static __always_inline u32 prandom_u32_state_inline(struct rnd_state *state)
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
 u32 prandom_u32_state(struct rnd_state *state);
 void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
 void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
diff --git a/lib/random32.c b/lib/random32.c
index 24e7acd9343f..2a02d82e91bc 100644
--- a/lib/random32.c
+++ b/lib/random32.c
@@ -51,13 +51,7 @@
  */
 u32 prandom_u32_state(struct rnd_state *state)
 {
-#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
-	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
-	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
-	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
-	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
-
-	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
+	return prandom_u32_state_inline(state);
 }
 EXPORT_SYMBOL(prandom_u32_state);
 
-- 
2.43.0


