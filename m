Return-Path: <linuxppc-dev+bounces-12828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1B5BD7AD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:51:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZW5f3Bz3dHD;
	Tue, 14 Oct 2025 17:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424563;
	cv=none; b=AkbHeDhgSUh8DugBpWW+ZRwAc5u9o8b+UkTbJyp37v+jhUivj0Wr1Lyifq3V8V+S3UxmdKSVpvWNg7Z9sIt1mqR0jBE4OD4XXX9qyJtDNtZwukYEAtbiIWvNfV5ckkA+jF1fq643n7FWhpLYfNC3JmvAzIrSs1e0jq6uAQUkkZO9odOCoqofiQqvf/QKiNXRrsjPATRm46/r4KmJtJ5ycPi8ejGnyxZlWgPUWXIvskkaWt6ltwJRUQ400y3kZ/HWEMKJyp2Kd3GbcpHVKXyTGubFq4xqT5o3kajW86Fd20ExARD2S77PuHkdnOrqFGBZVA6rRb2KK2QrwPe4nV5o9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424563; c=relaxed/relaxed;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Af7WylF8yboR/jwJ0Vj5E+SKFFObzzs0bDZWrXmSrQCJKoVqw324w9/PogUdOB7Jg9TDCxAnrjDICJku0iqvajCaOFBtq9wbd1RjHdtVCfXp9GH4waA2RGH+Lh1ogPG4LPm3uvp+kNE9VwzsHne5MoWWum4dUkLzWv+yW9NuRZHhgqVbPiygn7m4UiPJ23GplNzPZze8zT3GTrR5erqDdD6lu/BqyvEYrKJ7navz5GInXdiReR5RYZaXEjWrudCQ23CMhbfT2Hs/OXP9XR8Z+e6pWNFsMRDn1xkc6nzweT3z3tjkP8DRr9xZqdQHdD7RZpL0HMI666YZS9Vn902gZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xwpgAjCw; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YFGw/5OT; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xwpgAjCw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YFGw/5OT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZV5kFkz3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:22 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	b=xwpgAjCw/ps+pinXuuk2/1dUDVRTBDHyfrLLMo8MlWkHEttiN3Lme9z3POyxQgkpIBnlH2
	bfPLMPbmonasAP8/h3DqUcWmWdTXpcMp+PURdY/aodql4tRR7iLuAfceTvw5qLAfvhNUi9
	kjFwk/qplrwr+RHSIqMxc1sefFqio7IBE1qrCch3a5MvboPVK+rdu1F2vR2lBsOdw2DFmF
	vn/v76sttztESWoDAoBxDE20ZNauwK6nlVs303NrJpH7lTfqX1lHGkoz7dU38hNgNyutWX
	7seC/Ivqdv/wEqDL7QgRy/it5N0QMmlz7ca94RhyOuyknwXYeKlBwVSBOPaZwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	b=YFGw/5OTU7+qFg7O1bPcZy+A26sSqbjmgTFySDLn8C+zWb7h8CXgac6r1GEKgHexeNhCWM
	Rt5a8gCQztnFyzDw==
Date: Tue, 14 Oct 2025 08:49:04 +0200
Subject: [PATCH v4 18/35] random: vDSO: split out datapage update into
 helper functions
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-vdso-sparc64-generic-2-v4-18-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=3858;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yjs06k6xtXBqaQesLwEwImUgnZrxr+a65u05KeyUpws=;
 b=Z/fYMJVpB38ZTotx7ngQAg3m8vGxBbu5vNnNCk1ITkJ/S1Sy7ZizJ/fsfLPddfumk6a8XDGxg
 z6DZxy1Cm6ICrTMT0W+xc8eyJIN6lJAMQL3zaONjy9S1b8GrM/mVYP5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Some upcoming changes will introduce additional callers of them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/char/random.c | 51 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b0b88c6f6a1afcdb770e39b7a64cb3408e33bd2c..73c53a4fb949bfd2ed723fa3cec3fe0d066a7fa3 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -246,6 +246,37 @@ static unsigned int crng_reseed_interval(void)
 /* Used by crng_reseed() and crng_make_state() to extract a new seed from the input pool. */
 static void extract_entropy(void *buf, size_t len);
 
+/* This updates the generation in the vDSO data page */
+static void random_vdso_update_generation(unsigned long next_gen)
+{
+	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		return;
+
+	/* base_crng.generation's invalid value is ULONG_MAX, while
+	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
+	 * former to arrive at the latter. Use smp_store_release so that this
+	 * is ordered with the write above to base_crng.generation. Pairs with
+	 * the smp_rmb() before the syscall in the vDSO code.
+	 *
+	 * Cast to unsigned long for 32-bit architectures, since atomic 64-bit
+	 * operations are not supported on those architectures. This is safe
+	 * because base_crng.generation is a 32-bit value. On big-endian
+	 * architectures it will be stored in the upper 32 bits, but that's okay
+	 * because the vDSO side only checks whether the value changed, without
+	 * actually using or interpreting the value.
+	 */
+	smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
+}
+
+/* This sets is_ready in the vDSO data page */
+static void random_vdso_set_ready(void)
+{
+	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		return;
+
+	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
+}
+
 /* This extracts a new crng key from the input pool. */
 static void crng_reseed(struct work_struct *work)
 {
@@ -272,22 +303,7 @@ static void crng_reseed(struct work_struct *work)
 	if (next_gen == ULONG_MAX)
 		++next_gen;
 	WRITE_ONCE(base_crng.generation, next_gen);
-
-	/* base_crng.generation's invalid value is ULONG_MAX, while
-	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
-	 * former to arrive at the latter. Use smp_store_release so that this
-	 * is ordered with the write above to base_crng.generation. Pairs with
-	 * the smp_rmb() before the syscall in the vDSO code.
-	 *
-	 * Cast to unsigned long for 32-bit architectures, since atomic 64-bit
-	 * operations are not supported on those architectures. This is safe
-	 * because base_crng.generation is a 32-bit value. On big-endian
-	 * architectures it will be stored in the upper 32 bits, but that's okay
-	 * because the vDSO side only checks whether the value changed, without
-	 * actually using or interpreting the value.
-	 */
-	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
-		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
+	random_vdso_update_generation(next_gen);
 
 	if (!static_branch_likely(&crng_is_ready))
 		crng_init = CRNG_READY;
@@ -741,8 +757,7 @@ static void __cold _credit_init_bits(size_t bits)
 		if (static_key_initialized && system_unbound_wq)
 			queue_work(system_unbound_wq, &set_ready);
 		atomic_notifier_call_chain(&random_ready_notifier, 0, NULL);
-		if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
-			WRITE_ONCE(vdso_k_rng_data->is_ready, true);
+		random_vdso_set_ready();
 		wake_up_interruptible(&crng_init_wait);
 		kill_fasync(&fasync, SIGIO, POLL_IN);
 		pr_notice("crng init done\n");

-- 
2.51.0


