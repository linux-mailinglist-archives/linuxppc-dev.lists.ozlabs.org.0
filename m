Return-Path: <linuxppc-dev+bounces-12836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E63BD7B44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:52:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4Zf44sQz3dVN;
	Tue, 14 Oct 2025 17:49:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424570;
	cv=none; b=Q0i1ENpwgeCHuACKmXB+4SSK3fGlsWX5zNwwyfrrL46UgPnNICag3AUcq9/IpRgGQ+r3Tp95/072DsENUzPs85mv+drTUaFtRkk1Sloh94ucL14MkMCrQej12Ct4YzyIttUORKBTAlUo90kWpcoqL9sOA5SX2JkaBgE2QAdNzyyzoEBBersngds0doYpDJfthhWgmxDX1vyFZwNdr/P5incQPcU0G2lUNmiqVykbJmlKEwX6wmYaNFcvmE0ZY1Ao7COadgxAmX2hL3fnUnbWBGMvXDFVWo5+9FhMTgT4c1534q4qzHs2sWL5oA6WsPMguJBXbWSPFy8/0WrVmaLfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424570; c=relaxed/relaxed;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KYed8QFnQSc+ZiAYjR5v1Uw6XVi5PN3vRNAPHpIBkF4cKUszJE6opArz2LicJtWZIzSSslNCDk5qtyfM4KdAo/fv+8yaHnuVYQB1hPO33GAsq0cq7dHGVZceyofJrsGXZ3DUY9a3URwXLMaR7mZuWvTGeAMtVRm31afxF1e4Xct/uo1VMuITKzgTBsd6ZmgcZBHRSOsvk2MpZrGbHnD89og9Fp5AhDHklsoZ+Xl0aMrbLgcTt6hIeg3CAVqJW0alFnNOhf4TkIyFZXvp2yUllxZ2X/Qal2IGvyH5VgAK5EAa0z/RzpusPV2MzUzNuhB8OuJzhToM8cDEeNB1Ky3UoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=g18P+WOA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZmhdKmCp; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=g18P+WOA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZmhdKmCp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4Zf0GQ5z3dTm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:30 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	b=g18P+WOA9isRa1q1ErK/+Ni0DSDbiUSz46aMlyVMqFRNyuDIjttQarw+NnCLDCsGXbGcv2
	zBHvYbrRn7BYMGI6xIl2Hxwsb6WUrlTwyvlUXTlZp/SBuwMpZptodZR+Og66AWIjWQvr4B
	5x64SQUzl48VgMhOuuL+cmcqJzqVVRoCHd6iwA7NRUJZjo7v+WZvjubCAykqdwiBC1BgTJ
	NohLtu1i+xl3Qd6JUhiQ19uYYH4G1Cq2PHl+XfY39RhAp65uc8bpP4wp8z8Po1MVmse0Xg
	cwnKHpNHEjcSi6+f70KM8n+Gti0rS7TI9dLX2chgKTNKg1v9NI2O8ANFLR/yfA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424559;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0B7YkbPIlqSoj0P/D9keGEmA0f3ObTbURi5IRJM/pXM=;
	b=ZmhdKmCplihRjev/0HTyNhVWyr48rcMK3goPwlJUcagSoKZIwh8A8aIdu05En5O/uZyrIv
	Go9ZYU4cwyY3T4Dg==
Date: Tue, 14 Oct 2025 08:49:05 +0200
Subject: [PATCH v4 19/35] random: vDSO: only access vDSO datapage after
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-19-e0607bf49dea@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=2362;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=nnfqDyJKV+11Uo9x3MwHeHQO2C8dr6iNLVlc2B+leBE=;
 b=9Zc+eDNvdU8Y1XXdl92hx+AHY0om4okx8W7VD3j9btvvcp//mfZoeahs/MWKI+i2U7MedlgvM
 gI3hUZcK2rtCeyuuQdxrnYmdkEzCsknL0QxeFHy4aDh8lo7PSj31/UZ
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


