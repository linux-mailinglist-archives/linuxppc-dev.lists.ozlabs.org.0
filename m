Return-Path: <linuxppc-dev+bounces-6631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E01D7A4BDB5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2k5d0qz3brv;
	Mon,  3 Mar 2025 22:11:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000286;
	cv=none; b=Xy7Sq+E18+CmJf/ZFqcEtFlwaSQS6RxpVcu17Uro7RuwlsYiTMbDVJzZS1DWL5Qa5leaWQjFU3ACUqkV+ApF9tnOGjiBfHHo9IWflGHhSSbeewM4zcxX+skd5fbnhpawm6k9gphvA4SuThErQMnxbhguXDi0dtyQdYL1Cc/di04O2k1+BFxCGC4Gq9cyzfroal19TegVZsRNCqbLPQsDZyV1jid7CAXT56rrvsRNkBWEIWz+B36+ZoN1tuW5qMmDwWFMmtdDwjZjUkV8t+93KLVBenAIhf2J2GDT9XWiEQ8FGvd7XXNn0k/F07xXiIZ9VAzlmsIBiDJDA8cY9c5Zvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000286; c=relaxed/relaxed;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fgOnHu5NC5+GN6GKjdUSiB8GB54eX6soWeDgpZh0dDJeAIagxc+Os+RSCTHA+lBdz8WdMElBbWAuFFvQMKDymwzNG7A+L9tCMRXRh3O454wDXUc9uJ3fqsLnUSMd426C7daMvFJ1qNj8xWHxqesI4G+OldWN1vHdtj10wOpIxQeEVZS0EQdMPGeE8w9Hj3uzolGWQwtOOB0FsHNeYRcLmsus18YQUphkyUPhnvxl6s6muJzn810r0r/N3g1zMF+CfEhGUuNNWFyO9onp/xyRXCC5mKtmZlCisenSKS9dMEZhsA9pDi+zPE396G8gnxRlob/IVel740KAwU/+aJ91wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KlR439wt; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OJe2RCd5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KlR439wt;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OJe2RCd5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2j5YQPz3brP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:25 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=;
	b=KlR439wtCzp63opnm08CadoaqR8EQHOVNMecQAMDWoAhzDLh7N3HFaYn99kLzJu8c/87cj
	PcoK5OuK723FpyvA1wheJacC1EUReOItFr5w8LOb9w/sHZABa3hgKJlcuxaSr+CDU4uT+D
	/qn2O9wbsLkrc6XCAhqsgWL7fVrU+FM1vVAS/8nm3teVQ88wgepBI3arc2dnuMJWrbqyWj
	KC9OcwTcxlJ7E3AzrRjVe6rclqXONGygAdyACYuzkXcNZpM5MhSrWBwE2mLD8rejqUZw+t
	chZE/XpfsyKRUeAtMJM+OeoynYe/mThHbcJcTUYgdHbfzH1s2gaG2zEX8Na8ww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bUFBByn56mt9Jh1l7bqRrS+uh5r/Oj/pRKH3aZrKn6c=;
	b=OJe2RCd5u100FPp11ThFrMz2Ji9YSpds6cbr1c7c7JF8cnoqMnPMZDMIxaFlYM9gtX2jzU
	VQDwt7hl+t3MYeCw==
Date: Mon, 03 Mar 2025 12:11:13 +0100
Subject: [PATCH 11/19] vdso/gettimeofday: Prepare helper functions for
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
Message-Id: <20250303-vdso-clock-v1-11-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2810;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pm5bZvYeNAbEXTS39nRQ8eH42gMxWLNzUgPBgPezn1g=;
 b=FW8VbpGBDOc4gehZB0MHAgjqGugUx9jW+N8jr9fT+S+TPc15+FFXFF/O8gZIvxn8lSHVS+KUE
 MyHS7ULSmBsA61eJvARcZc9prIjVbV+Dg6xv1H+Y8KdITJ/pmkwkb9I
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
vdso_time_data pointer argument of the helper functions with struct
vdso_clock pointer if applicable.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 03fa0393645ac0f5ee465ddc19d84b330913da65..c6ff6934558658f9e280d5b84cfb034f4828893d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -17,12 +17,12 @@
 #endif
 
 #ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
-static __always_inline bool vdso_delta_ok(const struct vdso_time_data *vd, u64 delta)
+static __always_inline bool vdso_delta_ok(const struct vdso_clock *vc, u64 delta)
 {
-	return delta < vd->max_cycles;
+	return delta < vc->max_cycles;
 }
 #else
-static __always_inline bool vdso_delta_ok(const struct vdso_time_data *vd, u64 delta)
+static __always_inline bool vdso_delta_ok(const struct vdso_clock *vc, u64 delta)
 {
 	return true;
 }
@@ -39,14 +39,14 @@ static __always_inline u64 vdso_shift_ns(u64 ns, u32 shift)
  * Default implementation which works for all sane clocksources. That
  * obviously excludes x86/TSC.
  */
-static __always_inline u64 vdso_calc_ns(const struct vdso_time_data *vd, u64 cycles, u64 base)
+static __always_inline u64 vdso_calc_ns(const struct vdso_clock *vc, u64 cycles, u64 base)
 {
-	u64 delta = (cycles - vd->cycle_last) & VDSO_DELTA_MASK(vd);
+	u64 delta = (cycles - vc->cycle_last) & VDSO_DELTA_MASK(vc);
 
-	if (likely(vdso_delta_ok(vd, delta)))
-		return vdso_shift_ns((delta * vd->mult) + base, vd->shift);
+	if (likely(vdso_delta_ok(vc, delta)))
+		return vdso_shift_ns((delta * vc->mult) + base, vc->shift);
 
-	return mul_u64_u32_add_u64_shr(delta, vd->mult, base, vd->shift);
+	return mul_u64_u32_add_u64_shr(delta, vc->mult, base, vc->shift);
 }
 #endif /* vdso_calc_ns */
 
@@ -58,9 +58,9 @@ static inline bool __arch_vdso_hres_capable(void)
 #endif
 
 #ifndef vdso_clocksource_ok
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
-	return vd->clock_mode != VDSO_CLOCKMODE_NONE;
+	return vc->clock_mode != VDSO_CLOCKMODE_NONE;
 }
 #endif
 

-- 
2.48.1


