Return-Path: <linuxppc-dev+bounces-6625-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56295A4BDA6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2b0GK2z3bV6;
	Mon,  3 Mar 2025 22:11:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000279;
	cv=none; b=gtFv96hTJ0gPn7IxaQkAuMBBlH55QktN3UAbQ7jPgCaIpPsNJekrGClcvY7ZOfUyTVIfJGbq+Vb0ogUFSNqkQUXcwZXU6+xTzyXPC2Se8ZYxPTLuvuOoeqpFfXql0hwazDxw8iRUzTi3t04fdts888Y9UiV0w5lqJfyH/i93pIv6zPEqRZgIm5FY0w2E7pm/AA4izqpZKCf+CQWkDJr0I1p4G1pHqQyVE7HCWv4E8nEDNq9x8Gr5ayA4S412CGM0erFLL8wFLpRfBqpzjSbPgFxpQluUQC94/TBxGIC3eiLvVTmdiMZjoOL4W1L5wJeWuxbiWeA8KB2PB/pRIpX4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000279; c=relaxed/relaxed;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PMIxyGP/l9Fq6o9uMqGXTIwCeau3goGGhB2kNZyazWtLR8Q7V6iZGFK2pVJeFld1JcGjQpXJbju77NORqDI2cGKq/2SphIK89CpVPU/g6CnuaqmP1uyxdRUQPDchUoSdEyYO6n0AEfZV8UKGtqGohL0QCTemfGbdVhMJu40UzfG3hNGWWnmRBXlUI0hNyIrKxH/TVbSE/zYUQeY4CyNFWWC4/YOspCBGKVsCwcbSH0BC6NrmytzhXZumZn5QLEOya8OiMSBbw6jai69OtKj2zPuXDg1veeidEC+taJgsmLDmf1Hbw7jdH2qIDvmSfglyGHZ1YUUHTg+5KWCyLVlSpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1jkX2xc2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MrIpg7wj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=1jkX2xc2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MrIpg7wj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2Y6j6lz30dt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=;
	b=1jkX2xc2USYyAVaKA3S/OUrtvY2RcEpewvV903vx/WCEkI24THdZfXqweO1EoWZLpD6A4X
	DZXLWiRtTmw+u6w/EnUpGE8Nfb/lHSISkTdJ4jjJEKXZbwpJALXFXTcTyYlQ5xdz3I18ev
	ZweAb7a2ZMen44+qD3Z3qskbkr6rJN1540t8UHc/ftkF/ezKAYZMvpEk40nG3daTnZfWrr
	q/gzPfN17+a36mItfW8onrsRchta4RwL4yPH5mqPTNIeWpJ4Ev3ebBX6URWpyzl6o8b3lI
	pXKlViIwTVqn8dBeh5bQw8+rUFe2buemtHNGqlf5B+95jr7b+rDnYsxsjM++NQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr9JkpQD/EJDtjJ/SbcgjVylqUnYY78xk0lDKlXhM0w=;
	b=MrIpg7wj0aDz+QOskd587OX+pxI3VaGZCuFwLTTiyZ8Qtz5fDhWN6DGrlNZ0NaPhXXqUhU
	gjp1WYXtYyPx+aAQ==
Date: Mon, 03 Mar 2025 12:11:11 +0100
Subject: [PATCH 09/19] vdso/gettimeofday: Prepare do_coarse() for
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
Message-Id: <20250303-vdso-clock-v1-9-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2706;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4/BaH4I6+0tHmgqZ+WQUoIr8V7gABIjPIKZPE3OAkPc=;
 b=n8/pYeVd8xAqWuFxtbQOVJ1JDPO6LbfKuv0hp91lyg/I3/WqXF/DTOVHYeTT9gNOl4sC92FND
 rYkHHuurgLwDVr8z+B90JdwYjQ0MjQ32+l9bQmHG+S1h0oUqkAsUzEp
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
pointer argument to do_coarse(), and replace the struct vdso_time_data
pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index e8d4b02bcb616af19f1e794b14fb4419809408da..36ef7de097e6137832605928a155a0ff78123fb4 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -229,10 +229,11 @@ static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, c
 }
 #endif
 
-static __always_inline int do_coarse(const struct vdso_time_data *vd, clockid_t clk,
-				     struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
+	      clockid_t clk, struct __kernel_timespec *ts)
 {
-	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
+	const struct vdso_timestamp *vdso_ts = &vc->basetime[clk];
 	u32 seq;
 
 	do {
@@ -240,17 +241,17 @@ static __always_inline int do_coarse(const struct vdso_time_data *vd, clockid_t
 		 * Open coded function vdso_read_begin() to handle
 		 * VDSO_CLOCK_TIMENS. See comment in do_hres().
 		 */
-		while ((seq = READ_ONCE(vd->seq)) & 1) {
+		while ((seq = READ_ONCE(vc->seq)) & 1) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
-			    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_coarse_timens(vd, clk, ts);
+			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
+				return do_coarse_timens(vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();
 
 		ts->tv_sec = vdso_ts->sec;
 		ts->tv_nsec = vdso_ts->nsec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	return 0;
 }
@@ -274,7 +275,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	if (likely(msk & VDSO_HRES))
 		vc = &vc[CS_HRES_COARSE];
 	else if (msk & VDSO_COARSE)
-		return do_coarse(&vc[CS_HRES_COARSE], clock, ts);
+		return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
 	else if (msk & VDSO_RAW)
 		vc = &vc[CS_RAW];
 	else

-- 
2.48.1


