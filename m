Return-Path: <linuxppc-dev+bounces-12325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E5B7FB1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:04:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSL1gBxz3dBK;
	Thu, 18 Sep 2025 00:02:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117730;
	cv=none; b=WVjTYWjivZJx+FiqouKTYhFwf3abgEOPPHhpaGpBryjwby0pZ7lWQymonbhNXTja1JlB7U8oHjHmu8NZVmNjNRrvHdGo2mKqxHSscOqlov5i1hJBwmsBYmgkp4ng4S9wh8S1H6Z/h5LBCo+RAbP9lNuUQ4uvgfsLLSqHY8Qa3CXua9H3PQiA0gTQDtVLNNCE7q8dIsU85N3Df95xVUbjg5AoEqfgUQXA4T1gubWBTeVhMQKp4urGYbdhIb1TpZuODYoLcr7Pyh7XO9FUpNNAAirj8oCMJHv6kHX20V6dCBMjPdZvxZsSE5OOtD0hnHN9vy/tYJGeUk5SB8SwZnjyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117730; c=relaxed/relaxed;
	bh=mUFFv50bhb2+00GyqpEZHNIfyXG+VUi75AZvpEX7DOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFIeXFmThvIipyQAZjHuHJL/v1D1YXh/Hkp+RUVNoT2Q9UAM44J2jmJmx5mt1Qox4mn587R3yIN+EJkfY61X8G+EWWLsGUfE6HJqi/g8YBmlPs7rxujfYPB7UCYPPW4usbrty0hV2efTw7NFE2+yoJ2hlKYS6n6Ek36/bJnGVhBugVNxXuVgZ9QRcvybRdNYkAqB0bWOwhaVnCzOkyI1PzTMNVupZMvOJv0xhLplkh0/k7ZiMBZMeWuQAVetfQWIYJ8tfv2ArbnE80kt4UnPWVPn38knn7GNhDGLGx1svFLE46TpaAsd40JQizGDQhLIMJoCvuoqcxjdt/gEqykoDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=25tRyX7M; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QLiWyBdR; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=25tRyX7M;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=QLiWyBdR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSK2HGdz3d4H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:09 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUFFv50bhb2+00GyqpEZHNIfyXG+VUi75AZvpEX7DOM=;
	b=25tRyX7MK/yc1747HtA5vxS6y/LfwSpeLcAuZtpf5RG1mH6HSA7Z0CBkKx6h4fLVKJgG+i
	gzs16Dj7Oqh9qL5b96kEPaap7sNRCNVH32um1VNUGmpCBrHGyNZJ08QXkjiFDFodmkVlWZ
	mLVIQdB3q+8PyoCtB0JUkIUaLBgWQOhXbNTf2n7PiIstBuyjhPlTNoLHpETAnszd3ptqXF
	m/8ZmT5IACI4nY9JYHML4/CLRtkqfsnuWbFAw6zEh8PTj3C9IOyorjp3uEvd+hXJYMIUlx
	2st4cCerZ5AEWNevtqdyZ5hdb45mvcnwOp5xPWnAHgbTGM778njcXb/bqWJ7HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUFFv50bhb2+00GyqpEZHNIfyXG+VUi75AZvpEX7DOM=;
	b=QLiWyBdR2rg3zkPbtErOOuSNp2bFt7wDVXrC/RZUHhbaL4Nb+7QmKT2gwUZVr4UAiKIiOg
	LkjjO8SrN5k4YjAg==
Date: Wed, 17 Sep 2025 16:00:21 +0200
Subject: [PATCH v3 19/36] random: vDSO: only access vDSO datapage after
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-19-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=2363;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=eZ1dDq0MfGenTPjQNZP07/Jb7BnP3IgLLLQRjIR+5Yw=;
 b=ulpG5t+QjFlzrCh0/hSQNTxQqa9rMe5B8ib8Z7QwM7aJKgiEMuj9UWYwV+0f5PlWBhjJFPUE3
 925uYZxoSJiBEVKqLWte5Jf7eE+g+uEwfp8mMAfyQm4a+qXjG1JHGH6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Upcoming changes to the generic vDSO library will mean that the vDSO
datapage will not yet be usable during early boot.

Introduce a static key which prevents early accesses.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 73c53a4fb949bfd2ed723fa3cec3fe0d066a7fa3..8970645463ceae0dadb75825a3cb0df3ef1e982e 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -88,6 +88,11 @@ static DEFINE_STATIC_KEY_FALSE(crng_is_ready);
 static DECLARE_WAIT_QUEUE_HEAD(crng_init_wait);
 static struct fasync_struct *fasync;
 static ATOMIC_NOTIFIER_HEAD(random_ready_notifier);
+#ifdef CONFIG_VDSO_GETRANDOM
+static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
+#else
+DECLARE_STATIC_KEY_FALSE(random_vdso_is_ready);
+#endif
 
 /* Control how we warn userspace. */
 static struct ratelimit_state urandom_warning =
@@ -252,6 +257,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
 	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 		return;
 
+	if (!static_branch_likely(&random_vdso_is_ready))
+		return;
+
 	/* base_crng.generation's invalid value is ULONG_MAX, while
 	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
 	 * former to arrive at the latter. Use smp_store_release so that this
@@ -274,6 +282,9 @@ static void random_vdso_set_ready(void)
 	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
 		return;
 
+	if (!static_branch_likely(&random_vdso_is_ready))
+		return;
+
 	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
 }
 
@@ -925,6 +936,9 @@ void __init random_init(void)
 	_mix_pool_bytes(&entropy, sizeof(entropy));
 	add_latent_entropy();
 
+	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
+		static_branch_enable(&random_vdso_is_ready);
+
 	/*
 	 * If we were initialized by the cpu or bootloader before jump labels
 	 * or workqueues are initialized, then we should enable the static
@@ -934,8 +948,10 @@ void __init random_init(void)
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


