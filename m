Return-Path: <linuxppc-dev+bounces-6624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26668A4BDA4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2Z5zvHz3bTf;
	Mon,  3 Mar 2025 22:11:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000278;
	cv=none; b=mooBUWM6I9kmVBrvD//1Tncp1i1vb/aTtl9pPgm8/gt0xJdg/BCVqhsN7q9kNr7A9AlH69tpJYCjUQuRfUiuPfYLDlM+pre8icNiEleD3j8Frtb7KBEY3Enfk+NR1e7qx8gP5aRysAbeLkVGctMBVOYau6Rt7hgDkgSW9kCjvBAqzdXLBIzyxuIQm2mv6yFfBNNDKh/6s1Cf9nZiNO1DWOAPCWMvMQoHHl6RcTS3W0ZZl61YHwHpRPFCJusACzwXmu9dP9x2J8TxRSQPF24aV5lZgawKiq/klTQXjP3nd5ZbDbHTU+S3q0Ao9RHKdxHmA2QXogrLihWeknCa7IKSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000278; c=relaxed/relaxed;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gzc6mE7sAkrIpMH6Jt51lTwyFaaEH804/TsGDJFBUt2b3/iOIGQNEJlhdgylqY5rBuHJGSabIET6QUh2qRXN18qmiZ2Dk8xtETgC4/QxexCs586X8Egq+bO7lbAd4LgFXYMi3qqjP2x92QWVjB1/WKd7rUqaqkZRnt1+LJFpLb72+xVbXC6jOlAyaySfOyEvXmVZJm6TENUwhWJKnSZdibw6Ef1wUXK+RHfg28jK2p74enMWD9a8xlKUcVgqCv24MJboyj69OgOQsfTbCnhrS3trc8B71FzymXT5vNWs0OD0PIU3Q4MRFq3QEz/hp2oJQX8n4mU7dAcBw+w1ZQjlEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JUwQeVEl; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JFehfof/; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JUwQeVEl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JFehfof/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2Y5XGnz30W7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:17 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=;
	b=JUwQeVElPmivru/iDcQB1jz+YU3YptqhV7tZ4A3UnPaaWYeSAC2TCcM2pqpn+dIL9PAgyk
	sPfcXUgqfJkEbk8VAD8WOKDIYt8v/OnirpZst3tsfsbKsHirTWyRbgA/qteqCw8bLp3qzX
	E27o5DUz6qOlyPbWz4aSrNhB/cJ/XGaDR2bWn2GHta4ISsKfYpF0+bUjg+UV5+fijn1iy0
	BUuHUpEz5hqc9QJO+D8s1ZFlTjw+QVyGZB5Z0+Ts7rbRxg/0tow2f3O9+CDi3sLpZlwMfV
	p9DlnJ9nc1DEwrwdqvFCr+kIVIHpVPrvOyj2RlpAQ/D6BJrqEix05sg28vGFCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wRJrxNM282C+g9kU4vuAnxbkq5JTq67GnYAzZiRLM=;
	b=JFehfof/+9xh4U791YnEEwPlkllR+336Eu52CUZjWAHExQftHcUhWXamBtZ8GON03OCKxh
	dG9SR4cKmU8HscCw==
Date: Mon, 03 Mar 2025 12:11:12 +0100
Subject: [PATCH 10/19] vdso/gettimeofday: Prepare do_coarse_timens() for
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
Message-Id: <20250303-vdso-clock-v1-10-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2984;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0h40dglNs6fnGxl4dOAKT3F3JwW4lYavueIQgAMF8RA=;
 b=saBNnkL0hQl7QE2A8rxZyUXJ547QYmIUFk5PeduK03TEkTi2dCnoZyxi2BIrkwlfsuNb8NMCk
 mppnQ1fw1ryBsJhroXABnLZZZtKFH3L0kVqYPmVxl8UJSAKaW7w83eE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. At the moment, vdso_clock
is simply a define which maps vdso_clock to vdso_time_data.

Prepare for the rework of these structures by adding struct vdso_clock
pointer argument to do_coarse_timens(), and replace the struct
vdso_time_data pointer with the new pointer arugment whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 36ef7de097e6137832605928a155a0ff78123fb4..03fa0393645ac0f5ee465ddc19d84b330913da65 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -193,21 +193,25 @@ int do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 }
 
 #ifdef CONFIG_TIME_NS
-static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					    struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		     clockid_t clk, struct __kernel_timespec *ts)
 {
 	const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
-	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
-	const struct timens_offset *offs = &vdns->offset[clk];
+	const struct timens_offset *offs = &vcns->offset[clk];
+	const struct vdso_timestamp *vdso_ts;
+	const struct vdso_clock *vc = vd;
 	u64 nsec;
 	s64 sec;
 	s32 seq;
 
+	vdso_ts = &vc->basetime[clk];
+
 	do {
-		seq = vdso_read_begin(vd);
+		seq = vdso_read_begin(vc);
 		sec = vdso_ts->sec;
 		nsec = vdso_ts->nsec;
-	} while (unlikely(vdso_read_retry(vd, seq)));
+	} while (unlikely(vdso_read_retry(vc, seq)));
 
 	/* Add the namespace offset */
 	sec += offs->sec;
@@ -222,8 +226,9 @@ static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, c
 	return 0;
 }
 #else
-static __always_inline int do_coarse_timens(const struct vdso_time_data *vdns, clockid_t clk,
-					    struct __kernel_timespec *ts)
+static __always_inline
+int do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
+		     clockid_t clk, struct __kernel_timespec *ts)
 {
 	return -1;
 }
@@ -244,7 +249,7 @@ int do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 		while ((seq = READ_ONCE(vc->seq)) & 1) {
 			if (IS_ENABLED(CONFIG_TIME_NS) &&
 			    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
-				return do_coarse_timens(vc, clk, ts);
+				return do_coarse_timens(vd, vc, clk, ts);
 			cpu_relax();
 		}
 		smp_rmb();

-- 
2.48.1


