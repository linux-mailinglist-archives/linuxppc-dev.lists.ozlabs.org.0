Return-Path: <linuxppc-dev+bounces-13853-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 235C4C3A04D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:04:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmd5XvPz3f52;
	Thu,  6 Nov 2025 21:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423345;
	cv=none; b=RnIxmDaUhwW7xSlwR7V2vJ0fIG87eHprQn7AuC/MasE9SfR6G3tiRkOVzT7dMfy1zZ90ogzVcpk4i4AxwTzGVs9j8KyJLAJW46XWr/mMj/zTlhEz58iXjfZZ8eyoTlQXtp1s2PgzkUNaKoxSAVbnUMT4CmtP/kP2THya9udY1YM2im+MJWaA0ZX7MvrWayMGRN3r2yWeHqfO2QOjlSCYiGE/KKCwPCbxm+VxXtpq2nQ+okvnGFPASJ5Sg/NVEpwxIFp9IRm1kMesR8dl2mh4YQoBpKWcHpkHiC6xACum0lv1rMCPp1bYTn8me4m6NnPQM+sNzmKljRwt3a4PuPWTBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423345; c=relaxed/relaxed;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pgis5O1PdaUPdTuUhdh1nwdj/5GgpoR/IiFKqR2Ral8r0Bj4CU7U7PYO8Vx6YYctvaZiQUS3H/N6FItaq8hPNnazjhT8qz94kkGagaPHawCOv5bOxa3nHMrXnjNkTHagDMNKvR5ejLriLAlMSY9MWO+isy/4f5XtfqM6McWFkhKBMgSVBsoSHnONC0AZsNhpSifozed5RnW5pVrULxnkxgmHEa7TsdCbRqccmBsDQFPgY7Ed6Z6m3Br/+Z/SkBiyTeL8srSfYvBSyLFD/f4UO+CwZyYgNXtUaCnn9FAzLea43lV8ec1Os0kKQUcHZ81BXdhv/u2BKN3RQ9LAYrsYPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IUsuDmGs; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tpiCzaPo; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IUsuDmGs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tpiCzaPo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmc6QMyz3dnN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:24 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	b=IUsuDmGs4PRzFFRyr7vD8MIHrSJ+2CfOmRQy52IUMQk3iUzZSmR0Z9yHYsiJqDtSDbiFvL
	XDo11tmBDptuROw9amD9zCloSEFM3zZyGirghc5AXtLKFjRnQZAjDMige60I6dNO/C563V
	9mb2vWdM/YR3sm9ruhffdxa8tElNBvMThxftQTGOHqFXgAG3ZZiepa5WZrKrlWPFKO7Hj7
	xJYDS+M3Qtol/8NuTdzPV3Gzl2ovZWsu5QkZGHb/VpDClyqoNcAISMCx3skpxA6SAFVR9V
	OHOXdihLe9gcmOH2y2A1c8sSAYzpzx4YR0hAdhFwCtb8ydP0SKoGxIBRO6meBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pR/zA7NHuz/iSgfuExTYGBCAYU1piUOghds7Ej4rutQ=;
	b=tpiCzaPoOQcXkY4NknlzZ/2TDP+yG4JRj8lKHuWKNHLuRAwCWQbBf1oeLYma+HGiwxuljR
	pBDGmjYXUpYsepAw==
Date: Thu, 06 Nov 2025 11:02:11 +0100
Subject: [PATCH v5 18/34] random: vDSO: split out datapage update into
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-18-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=3858;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Yjs06k6xtXBqaQesLwEwImUgnZrxr+a65u05KeyUpws=;
 b=jUXgMFk4v+OnZC2gVGG9vK1t35/kfm+bhSmfGpborAwsZpS/GFqmA3fKYIB+bX9Tvdv7UNdzc
 kVcLAX4ceRmDX1YtnrgL84BUAsv/un8o1m0D75hNLssyK6QnbPcNQzF
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


