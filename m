Return-Path: <linuxppc-dev+bounces-6626-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B2A4BDA9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2c1Drwz3blT;
	Mon,  3 Mar 2025 22:11:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000280;
	cv=none; b=hzYk36W7eNt5UVBS1R4fGhaDvT06wADRH3Mo07Ive+kD4tvkRdlko9u064FCW7vXTWpx5QObGPhzL9cZDURzzF6WW5MfUcn7nFFKX9STxrRnXiJ+MKJk+7TZPYWKrsVb4vPujIfsUr7Zc84JkbDXbpcxw3PxA70zND5XCt3oufdRYC0opW8R53w9lrBnvFmG+3F5B5gTsXJHemSHbBPbr+rZZBjP0NF0EAIqpV39Ak6HMw5D8wHsJ+U+z//dfDg8IxD/GuYXNZrM4UNUmFq0lqUjtPNljasp9Dre25/t3iqzXaHymbuW4k7O9sCyxngitt3vaTY/i/1mzp6/K+sTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000280; c=relaxed/relaxed;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g1OMdZ7uR6/L15Mqx6ySKW0s9cLuYMj51DLUkLzQYoojBKRjOsgxWpxWzH8x5wPcl3qUqnnjpSn33VrTxyn5oxwfIx9ps1T9Q/iPIQRRYEBGP4Ev4tfWXe+LKddJ0TerMVngymQR5QBP610JamBzCG8xIG03o3WqOvsywa8C8MUhrqZVQIJocxcXer5AH1/5gmD6PakQZbk1vyFBrsNLpeapCZ3kd6rp/cGFVq+kyU6OnYigtgterRMTMXK1SCDRDBbBwHGCP8l/G1R6ieBGNeLwbp7jCbXYpyd4CR6ZtDF+e4ATJ/lF2Sfg8sIDlhNbJOoNmPe4MGwxuDlHzXxyXw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eTOvMpIM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3coPW8he; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=eTOvMpIM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=3coPW8he;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2b0Pr9z3bVW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:19 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=;
	b=eTOvMpIMxmyAd9LOliw0S+YruQOiVjmBeLzScbkioXmoTB1ynEytW3q3/oR/TOfPRsYz7n
	0UZTLzt1xJj/QxJotLsT5C+wKny2iVGSwJwsBdIH30OG7L0zwbQ6SnjyaLBuVoL1q9jqC7
	/ewuYnBMKcmQ2tpwJosDyjBi9QadoZhoV2EEQhXsyXr1IUNGADV72vx9lWS5UZv9oSXHPm
	/WgfnQzIq0SHtk9KWbQOub2UMHmHnFCKrpUw4jr5bNGOV/VWz8/O61QqzbxvvLAK/ZkDYc
	i5CmWss+MsJzI9fkG5gUQIRMwLJGr3VYC2a+KCvbx3kf7AMoz/CuCr2CekkcOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5aCd4EMkjlNalFoR07yY3E582pKdgj75t6H7h3ol4lU=;
	b=3coPW8heN6x2TMm5riaOgfCuNNyicJ0eoPWFUOkenchvU+tFhsoPFowfTEyEXZCJQna9RV
	IWQA8ohD+HuOgxDQ==
Date: Mon, 03 Mar 2025 12:11:10 +0100
Subject: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=3635;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DD6TqSTT0n4lKxdBvYuWMMqzxVw/01dOoQIaUbeVuus=;
 b=ByURjHW0BXzpZLG3Q9Xizbjjjp5WZvUhrwy8shGeZwF08cAt5jmXQsOCnq5t/j798V8dxzaCG
 JkI07e3Haq+AG5dJh2BXfo7Uv+OjdM2UJuGE+s+TDCpSagjO4sUqlEH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

Prepare for the rework of these structures by adding struct vdso_clock
pointer argument to do_hres_timens(), and replace the struct vdso_time_data
pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 15611ab650232f2e847b7de80c7293c4fb7f84f2..e8d4b02bcb616af19f1e794b14fb4419809408da 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -81,36 +81,36 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 }
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
-static __always_inline int do_hres_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					  struct __kernel_timespec *ts)
+static __always_inline
+int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		   clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct timens_offset *offs = &vdns->offset[clk];
+	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
+	const struct timens_offset *offs = &vcns->offset[clk];
 	const struct vdso_timestamp *vdso_ts;
-	const struct vdso_time_data *vd;
+	const struct vdso_clock *vc = vd;
 	u64 cycles, ns;
 	u32 seq;
 	s64 sec;
 
-	vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
-	vd = __arch_get_vdso_u_timens_data(vd);
 	if (clk != CLOCK_MONOTONIC_RAW)
-		vd = &vd[CS_HRES_COARSE];
+		vc = &vc[CS_HRES_COARSE];
 	else
-		vd = &vd[CS_RAW];
-	vdso_ts = &vd->basetime[clk];
+		vc = &vc[CS_RAW];
+	vdso_ts = &vc->basetime[clk];
 
 	do {
-		seq = vdso_read_begin(vd);
+		seq = vdso_read_begin(vc);
 
-		if (unlikely(!vdso_clocksource_ok(vd)))
+		if (unlikely(!vdso_clocksource_ok(vc)))
 			return -1;
 
-		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
+		cycles = __arch_get_hw_counter(vc->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
 			return -1;
-		ns = vdso_calc_ns(vd, cycles, vdso_ts->nsec);
+		ns = vdso_calc_ns(vc, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	/* Add the namespace offset */
 	sec += offs->sec;
@@ -132,8 +132,9 @@ const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_tim
 	return NULL;
 }
 
-static __always_inline int do_hres_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					  struct __kernel_timespec *ts)
+static __always_inline
+int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		   clockid_t clk, struct __kernel_timespec *ts)
 {
 	return -EINVAL;
 }
@@ -166,7 +167,7 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		while (unlikely((seq = READ_ONCE(vc->seq)) & 1)) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
 			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_hres_timens(vd, clk, ts);
+				return do_hres_timens(vd, vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();

-- 
2.48.1


