Return-Path: <linuxppc-dev+bounces-6636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80BA4BDC0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:13:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x3B1W7fz30WT;
	Mon,  3 Mar 2025 22:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000310;
	cv=none; b=juMfh8q2wCp0xz5NyqeMrWyrWnwx3+1Rg0+aPNkS15GDOlHg3w8Fe4Rvij4JfqfN11i1VkyOhQiOWTUt2VgEU9ggIjq4tZPPdikxHR9QD11ZmyrTuULtc7y58Km8ByvSyn4qPsRmM/FYHSnArUy2TAgLlm0QM1IgRcjJMggO64G+teQyRWcsbYcFdUp7adnsHUvj7ndeA8FdEVQKWMm4XXivCOpdS39+vxeOVUi9AGLlFZvzkJISMDwrT5AqHXo/zAqz0kLZn7KDp6FXJ7tagDvsom9w3Pvcg3qGNxuAcyInnw4699UKtqF06HeK9wrusxp+2tR2YQbbnqY8r+/VQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000310; c=relaxed/relaxed;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YGp1RQropguk8YvrhNsfeKN6hbTfTtqjD6Q0UDPDvW7pk+yG3RyuANcw2MpTDw9mT/ag2Nn1njp0wkJpJe00XH6TJiv0v5xDrs0716hZEKOBXRoxdXlXT3TrsKSDnJX2JZNLpPrdAyiR/CidV52agP9SKpyNp+UlT3H9aPPxsJDGsxhdYyj+UDp/KrG0Nof8+iXpa0doFFGFjLAKQe8Gb+nxq5b7iuhv/Majrx1WiXjqY6U6AqwvoHhmD6yu0kcU4s74bveRmw6zXWAzOa0mtGHLfpcAG6iP9myJvV8rlBMUYJuxxou1Z3NS4orq2QxPis6Vs+u60UGV44C7APysJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DPMhc5St; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1+KAwjf8; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DPMhc5St;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1+KAwjf8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x390Lvhz30W0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:49 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=;
	b=DPMhc5St6/iBg0Y6tqofShmyTKuwKq3vvfQL17Fv17cL5576zmzU/q8wwATt065xdTEIe0
	H5/lUJEkDJb4Dnot8oim8ONpHiXn4rxkl4ZKuUNIRZf1yoBxWK3e3fFVIHF4t5DYt+Pta1
	WjEaK2yuyJ7lEyiV/TYAsOZNVCsiQO5Xend1W+CLKTyAaVSTMUdP1qYL2R4vusXlk+lUxC
	Wz6VPs7+syo2CcYwbmSbLSbcCRq+/ECmxtW8MdBwpiNShdz4AC/P1mN0h6oa7FsU54kOh6
	fzTsvsJNKNKPJWpfL0/vFFAWVvQz2jAywdZxbsnCOt1EFdsExTkIMvIy5evpAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJv8sbi30FpTvlQDBkPTmpk9/XqdhxgUpv0PpOkXPOI=;
	b=1+KAwjf81amAe8EFn1H/1U+g2iwu7oBX2L4PER3y+YH1TmvAt1mLk0jvbLUY5cZe+V6lBa
	XrUyykEgLplRiQAg==
Date: Mon, 03 Mar 2025 12:11:14 +0100
Subject: [PATCH 12/19] vdso/vsyscall: Prepare introduction of struct
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
Message-Id: <20250303-vdso-clock-v1-12-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=5035;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TGrYgHBDC1ym/D0u89FhQ1yXA+RjazyIG5JtuCcOFIQ=;
 b=O0ykrjovG/rAJm0nxuT72171DFtNpYj28xh5+v7YJoR1artjVb5TWt8ayEA+4+1DaKgw1KXq4
 S4wO7RvQ76JASNE0pYEgVClwArWHVorrse27BBdxE3CW+jNIThljxoa
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

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 kernel/time/vsyscall.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index 418192296ef7dd3c1772d50f129e7838883cf00c..dd85b41a70bee7decbd943c35197c091916ee4c7 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -18,25 +18,26 @@
 static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct timekeeper *tk)
 {
 	struct vdso_timestamp *vdso_ts;
+	struct vdso_clock *vc = vdata;
 	u64 nsec, sec;
 
-	vdata[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
+	vc[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vdata[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
+	vc[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
 #endif
-	vdata[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
-	vdata[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
-	vdata[CS_HRES_COARSE].shift		= tk->tkr_mono.shift;
-	vdata[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
+	vc[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
+	vc[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
+	vc[CS_HRES_COARSE].shift	= tk->tkr_mono.shift;
+	vc[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-	vdata[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
+	vc[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
 #endif
-	vdata[CS_RAW].mask			= tk->tkr_raw.mask;
-	vdata[CS_RAW].mult			= tk->tkr_raw.mult;
-	vdata[CS_RAW].shift			= tk->tkr_raw.shift;
+	vc[CS_RAW].mask			= tk->tkr_raw.mask;
+	vc[CS_RAW].mult			= tk->tkr_raw.mult;
+	vc[CS_RAW].shift		= tk->tkr_raw.shift;
 
 	/* CLOCK_MONOTONIC */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 
 	nsec = tk->tkr_mono.xtime_nsec;
@@ -54,7 +55,7 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	nsec	+= (u64)tk->monotonic_to_boot.tv_nsec << tk->tkr_mono.shift;
 
 	/* CLOCK_BOOTTIME */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_BOOTTIME];
 	vdso_ts->sec	= sec;
 
 	while (nsec >= (((u64)NSEC_PER_SEC) << tk->tkr_mono.shift)) {
@@ -64,12 +65,12 @@ static inline void update_vdso_time_data(struct vdso_time_data *vdata, struct ti
 	vdso_ts->nsec	= nsec;
 
 	/* CLOCK_MONOTONIC_RAW */
-	vdso_ts		= &vdata[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
+	vdso_ts		= &vc[CS_RAW].basetime[CLOCK_MONOTONIC_RAW];
 	vdso_ts->sec	= tk->raw_sec;
 	vdso_ts->nsec	= tk->tkr_raw.xtime_nsec;
 
 	/* CLOCK_TAI */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_TAI];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_TAI];
 	vdso_ts->sec	= tk->xtime_sec + (s64)tk->tai_offset;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 }
@@ -78,6 +79,7 @@ void update_vsyscall(struct timekeeper *tk)
 {
 	struct vdso_time_data *vdata = vdso_k_time_data;
 	struct vdso_timestamp *vdso_ts;
+	struct vdso_clock *vc = vdata;
 	s32 clock_mode;
 	u64 nsec;
 
@@ -85,21 +87,21 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_write_begin(vdata);
 
 	clock_mode = tk->tkr_mono.clock->vdso_clock_mode;
-	vdata[CS_HRES_COARSE].clock_mode	= clock_mode;
-	vdata[CS_RAW].clock_mode		= clock_mode;
+	vc[CS_HRES_COARSE].clock_mode	= clock_mode;
+	vc[CS_RAW].clock_mode		= clock_mode;
 
 	/* CLOCK_REALTIME also required for time() */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec;
 
 	/* CLOCK_REALTIME_COARSE */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_REALTIME_COARSE];
 	vdso_ts->sec	= tk->xtime_sec;
 	vdso_ts->nsec	= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
 
 	/* CLOCK_MONOTONIC_COARSE */
-	vdso_ts		= &vdata[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
+	vdso_ts		= &vc[CS_HRES_COARSE].basetime[CLOCK_MONOTONIC_COARSE];
 	vdso_ts->sec	= tk->xtime_sec + tk->wall_to_monotonic.tv_sec;
 	nsec		= tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift;
 	nsec		= nsec + tk->wall_to_monotonic.tv_nsec;

-- 
2.48.1


