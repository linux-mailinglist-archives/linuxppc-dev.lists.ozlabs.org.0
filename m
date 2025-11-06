Return-Path: <linuxppc-dev+bounces-13854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62EC3A053
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:04:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmf1BYLz3f5j;
	Thu,  6 Nov 2025 21:02:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423346;
	cv=none; b=MVG4xq2kxCgF1Yeo0NZQoZZAZdZXaP7SSPoTb0F++BiUpgu1t2Xt0vichY57WkxXNqAuYMCPSGnNjME63UjjYV8QZYJ/+GKP57QuzFUhdFCyvjWzgjCs2yR57b7gGjNPPjUc+FWqVlEoTXomgGjzY0ltUGa/PUw3MibYoB1jr10WgXn7AATI84n2j39QeEraF5hCnSL04RojYWI9yoc4LOFaS64ReXoCbkcjRSdXUKCAoggzqSPf4jeuaWuVvN3/3Wz06oszhZcuIkCDszR21j9XyltuPRspHQW3foM4u5m5ILxci2qAE1Uo+DcIByN114qDU5xOzJZes5eq1RTzgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423346; c=relaxed/relaxed;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDKXAbG1mg2tuIArzxGyO0EhMm9PTb4F2ESxudegaJ7BVJoRYfU/uSZfWlpKZIk3OpasmMyauM9U1ieEunjGBStXhFD+1pYVtXROap15DS2eI98oE7U30L21OjbUAPB7MCtUJgJFBP9bRiV1Wiijc/O+tRJq3/jmldDV2wfv3cuWWkOvHyrsx9doV1vnOZa/KH5VI3donG6oI4lYOMLAIDEx6w+1vc5PG4Cj6XOrqnuUV8y0SYGDUZkqnnY7wQMyl7XCND1A61Ucw/rLs7jyeaky7OwP5J67CZQIQGcK3oTy8jkXIxbqm0uQ8LyD+FjHXxz7IhbnM3pPmbVSEzjzyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rTh5AzdO; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qr5vrwnE; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rTh5AzdO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qr5vrwnE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmd4GjFz3f4Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:25 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	b=rTh5AzdOU4DHUsOMOnWbiDWfL+4uyMkWzQgAbfZJ/px5TRTZrNIDTQ5TTeK8j5rPXyufjB
	H7bJxlpK0rm++C8qmfPXxkLG8FHTqSD/zhELreQ8T5p9Q0cQzt6wK/V0m3dogQOnP0FbM/
	9RT3T3flvAyDs4KhiCsPF6GFdy5X0mw9oMNr4mJsaBvWQyZm6B0gkSIdvw61yN8+rF6Rbj
	1nT3gT3985ewGn28YEFcGRHfNqjlQDTsvwTd0hf1tBvbJ/fRUFKilM698gBsGW0yi4YU5X
	B0swcNGWJWJmvRw2ZaaNfivFyarRe2OUT5yQFYyN+MysxmiWwO96f+zE3OLJEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	b=Qr5vrwnEGTdXs43qwnoObu1jc0kRTBtVkpX/f4DQRjZTbZ71sg8u8jsQ+r2waidhpAyRu1
	zkcorxtbtUVF0cBA==
Date: Thu, 06 Nov 2025 11:02:12 +0100
Subject: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=2362;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nnfqDyJKV+11Uo9x3MwHeHQO2C8dr6iNLVlc2B+leBE=;
 b=fzvKWRUnoil/U9ov/twv/xZgHPWkat/4jEO7Y/mddE/lMWOXMPgXrZ9vAOtQgKUINpEmg86lw
 xRYdU4WoK0QCIy9rphUvPkmLQd9Dh8lWklVauD+6cPeh6xhrswM7tuq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Upcoming changes to the generic vDSO library will mean that the vDSO
datapage will not yet be usable during early boot.

Introduce a static key which prevents early accesses.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 drivers/char/random.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 73c53a4fb949bfd2ed723fa3cec3fe0d066a7fa3..f39524fb076a0c77bab228d4f2d45fee37291eb0 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -88,6 +88,7 @@ static DEFINE_STATIC_KEY_FALSE(crng_is_ready);
 static DECLARE_WAIT_QUEUE_HEAD(crng_init_wait);
 static struct fasync_struct *fasync;
 static ATOMIC_NOTIFIER_HEAD(random_ready_notifier);
+static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
 
 /* Control how we warn userspace. */
 static struct ratelimit_state urandom_warning =
@@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
 	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 		return;
 
+	if (!static_branch_likely(&random_vdso_is_ready))
+		return;
+
 	/* base_crng.generation's invalid value is ULONG_MAX, while
 	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
@@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
 	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 		return;
 
+	if (!static_branch_likely(&random_vdso_is_ready))
+		return;
+
 	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 }
 
@@ -925,6 +932,9 @@ void __init random_init(void)
 	_mix_pool_bytes(&entropy, sizeof(entropy));
 	add_latent_entropy();
 
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		static_branch_enable(&random_vdso_is_ready);
+
 	/*
 	 * If we were initialized by the cpu or bootloader before jump labels
 	 * or workqueues are initialized, then we should enable the static
@@ -934,8 +944,10 @@ void __init random_init(void)
 		crng_set_ready(NULL);
 
 	/* Reseed if already seeded by earlier phases. */
-	if (crng_ready())
+	if (crng_ready()) {
 		crng_reseed(NULL);
+		random_vdso_set_ready();
+	}
 
 	WARN_ON(register_pm_notifier(&pm_notifier));
 

-- 
2.51.0


