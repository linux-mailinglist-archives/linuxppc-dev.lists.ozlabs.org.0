Return-Path: <linuxppc-dev+bounces-6622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35113A4BDA0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2X3Nbtz30Vj;
	Mon,  3 Mar 2025 22:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000276;
	cv=none; b=lR5m57MBbARKHqE8wogcx9bYv90GqniUSadJhhhNsSVIJVYA5h+BwvGfhm7E34/ENCNO9CWiWp7gRH1DcYq2J/dlKbBlPE4vAucJ0zJbVE5hVw5ShGT9qpSeP84AR5BRX4t8IkxeaihPo6RmsOSzj/Qss+rqgu3/C+4OSixicdPPVrBpi7PcAsDSuQW7FDWSrsW+IbasYMCHxVP3fxoW8U1Kh442nSUGa0LFPKLxyXYmWEuh5+SG3qoXmHoVEyijXIXA6M2DGGjbEnvTl/br0k5I0kIrIM3uJbfvBNyCQdQoU6sNkUK7KT5/pnHq53EyRL3gF0vfdDnqL3nIRlqjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000276; c=relaxed/relaxed;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUAsOOCZU3tQOeZ6RsAaAn9pW5Ju5uTSi2GU6Jeye2A+sWqLXMFCSQrZUxG4mLyNnVhFsH9CKcnl4jkNENBwWyL6Q0tJILx7OBJqfav6/p3ID6LtNYfNt+URajisGi+vQXJoJt9C7Pg/9n779maKyOSLxaCjIkdvCnB/8Vjo7KL//fTvXIpCl7+irvxsJRCepzI+o1eVN1IUUzllJRgE7rY/22CqJcXtviMuytk1O2IuAsFr53AAkdCQueHodC4kTB4TNUM981eOJCTihUWezGaNsDIwniYOqBXDlL/krvdgT1J3WguRbgf0iWIu4Ayw5XcuSV8dkLjs7Aa/uJPiiA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cl0AoCOK; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TBsb7Kj6; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Cl0AoCOK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TBsb7Kj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2W45QMz30W4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:15 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=;
	b=Cl0AoCOKpupsyYAO5IIgXBPx/dwzDoqlSEJGaUvOMylaTpHHIysdjntn6Ctsm2nL8hX+sQ
	s+hryKYal9Rf4xH1DDeKAvcA8b+VRvXZvRDeExzwKnT9KgewllMkt2vjUNHN3dME4h16xV
	c9yStGjf3FgZfuBqqsnHFW+LguzchG+7SpKFCg9KG8lwctVwJNoYxgIssr5sz8crgS/xFe
	uUHF7HWBAp/rDaeSLRSsOyqmzUS7zuXuUaORbp/oy0m1KA6XZ8VI1wSFLmSfR9r5cIQmax
	jrGrCvTqlym1ZlCxYF0o6wRbUE+ROt5zBaTvMvtnlk/qugj5cmykO3jRzgxxEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiNmzZsI+IlqtlcCBw/HCwN6rFN2wNt5TZpQsWV/3tM=;
	b=TBsb7Kj66vCWCP6XUXD66wGWbCHqHHClQq6fuw1EMoMniwrPAF35PE+ig41PwgKMDBDvum
	B5IuuFkqNjH6/uAg==
Date: Mon, 03 Mar 2025 12:11:08 +0100
Subject: [PATCH 06/19] vdso/gettimeofday: Prepare introduction of struct
 vdso_clock
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
Message-Id: <20250303-vdso-clock-v1-6-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=3916;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h8QoW/f3rU49l2BZnno5Ej+ilYnLc5MZmanJRJHxpLU=;
 b=abZnNYKsOGQP0oaHmpAMUtb18E47BKabUrpm1zoCjuMbUMyy9sW8Ip3ryJLR33/fwFe0OAmg2
 YSR+Gw5l1bnBYcJlJ/sMhD6901iTtR4NjPETiMDq5/6NGQFwLwu2CGa
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

Prepare all functions which need the pointer to the vdso_clock array to
work well after introducing the new struct. Whenever applicable, struct
vdso_time_data pointer is replaced by struct vdso_clock pointer.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 299f027116ee0e50a69c5a8a17218004e4af0ea1..59369a4e9f25f937eb8d9aed3201ebd340097a9d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -257,6 +257,7 @@ static __always_inline int
 __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 			     struct __kernel_timespec *ts)
 {
+	const struct vdso_clock *vc = vd;
 	u32 msk;
 
 	/* Check for negative values or invalid clocks */
@@ -269,15 +270,15 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	 */
 	msk = 1U << clock;
 	if (likely(msk & VDSO_HRES))
-		vd = &vd[CS_HRES_COARSE];
+		vc = &vc[CS_HRES_COARSE];
 	else if (msk & VDSO_COARSE)
-		return do_coarse(&vd[CS_HRES_COARSE], clock, ts);
+		return do_coarse(&vc[CS_HRES_COARSE], clock, ts);
 	else if (msk & VDSO_RAW)
-		vd = &vd[CS_RAW];
+		vc = &vc[CS_RAW];
 	else
 		return -1;
 
-	return do_hres(vd, clock, ts);
+	return do_hres(vc, clock, ts);
 }
 
 static __maybe_unused int
@@ -328,11 +329,12 @@ static __maybe_unused int
 __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 			  struct __kernel_old_timeval *tv, struct timezone *tz)
 {
+	const struct vdso_clock *vc = vd;
 
 	if (likely(tv != NULL)) {
 		struct __kernel_timespec ts;
 
-		if (do_hres(&vd[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
+		if (do_hres(&vc[CS_HRES_COARSE], CLOCK_REALTIME, &ts))
 			return gettimeofday_fallback(tv, tz);
 
 		tv->tv_sec = ts.tv_sec;
@@ -341,7 +343,7 @@ __cvdso_gettimeofday_data(const struct vdso_time_data *vd,
 
 	if (unlikely(tz != NULL)) {
 		if (IS_ENABLED(CONFIG_TIME_NS) &&
-		    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+		    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
 			vd = __arch_get_vdso_u_timens_data(vd);
 
 		tz->tz_minuteswest = vd[CS_HRES_COARSE].tz_minuteswest;
@@ -361,13 +363,16 @@ __cvdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 static __maybe_unused __kernel_old_time_t
 __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 {
+	const struct vdso_clock *vc = vd;
 	__kernel_old_time_t t;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
-	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
 		vd = __arch_get_vdso_u_timens_data(vd);
+		vc = vd;
+	}
 
-	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	t = READ_ONCE(vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
 
 	if (time)
 		*time = t;
@@ -386,6 +391,7 @@ static __maybe_unused
 int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock,
 				struct __kernel_timespec *res)
 {
+	const struct vdso_clock *vc = vd;
 	u32 msk;
 	u64 ns;
 
@@ -394,7 +400,7 @@ int __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t clock
 		return -1;
 
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
-	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
+	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS)
 		vd = __arch_get_vdso_u_timens_data(vd);
 
 	/*

-- 
2.48.1


