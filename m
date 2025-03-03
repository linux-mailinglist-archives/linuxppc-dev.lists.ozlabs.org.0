Return-Path: <linuxppc-dev+bounces-6633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 147E6A4BDB8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:13:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2n4MG6z3bwp;
	Mon,  3 Mar 2025 22:11:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000289;
	cv=none; b=bgvNwOaygWB3gcJpDUkn7Rjol+jcADNFYcU+0MENxJMMQhXDGRX+cfgrHHE9jEvP47pXgssM/wT+Zd11qGyJkTEbPfNG/zFdMjEPJRFYAXRvjKFioZceFCsLeG4efFpqdeq4+HOisSCRZaFhDjao0FrpmbS8HhrwCiCwG0FuxIu/kbv9wj+mAVaujHU1iUlemeA+W918dvZ4vzvZy1HG6qoISd2/ZOM5M9RH2dpJXXb3czNmisZx1svzgszbDFHU09p75v8ndPCIPvqdZrGaIZqKscyLJ3M0NimTy+0+OcqNwwpVQid5KokvcxzlB/m0a8q3yd19YNQcgCax6/zhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000289; c=relaxed/relaxed;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CalFLQsyY2bbPKD0tkm34Zim+gSOdX12FZwWnsGo4YwSWhs/Fz7TYt5hkeZ03d93zxfL3sqROaJdJsa6EDcPt8yLXYvcXF2CCmv+UVKqPJA736YJPLLXrUcyej7JeeMfqi7SL0jA/vVJB+gKixDT1vJVFHVCU+PXSMVOd1Ag6vwyqHzRvEvHC35pH5XqhHwOCS+wizA8DlDRXKzeNNxwqLF3c8o9qES/tVWwCOkHgUIMMaF8A1gu9Z1w6LSsixQ9YgxSOpw1sWyLOYfwkmQTOObDOK0414UjJKHVPxX6sAe3PQ0Ey/ozEMz1zwh8rRi1S8ThkGH09RbvLFTMYS2iWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qhBdyCjx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BMb3X3SY; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qhBdyCjx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BMb3X3SY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2n0FX2z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:29 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=;
	b=qhBdyCjxtiKLWvOc1plokn7HfcVzmwf+d4glPAKt3DEO52YztEmLk02vb7L3VZogzU2A+4
	kTs/E5ByKXP8uxQAXoDvY2FzGgDTE/UwbpxuKNixzQm5PoM/G7f8h9l/K3TWY8YtJv6qIE
	6zEkYZnS+jXRTBXgB/usq3SvKKk97lqoryzHUq0M63j6tngeCcCLtVeZAPDdVHBVuKnm+x
	GOK8rRB+IXVgo58Xt7K7XisPKf3Ikmf+bDcbXUTqt709HU9avzv7ceji+wiU9dlaSgDlpC
	rM9eQEz3o52fHaITdsZRgMUYFGF5zkCTogNt5Phtjl5yY1MgwrKjP+SarcanYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HgkXR8Ms7wQS05VGAhqJOHjZc2vDa+KQurvhzWf1zv4=;
	b=BMb3X3SY4t1L7AJIV4rv6PFcxHgHInWR8mh99SkR1hwnPPvG4cImQh/oz7XKHSBifrGyMb
	AArbHGlpDvR3nyBg==
Date: Mon, 03 Mar 2025 12:11:20 +0100
Subject: [PATCH 18/19] vdso: Move arch related data before basetime
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
Message-Id: <20250303-vdso-clock-v1-18-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2232;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+5uVvlPBOccXpBrllKubuXiCPd0eBucGi0zbF33gT3U=;
 b=X+HQHN+N5jVKZbjCjgYkbSkIIE7aQboC/nbk/mfHTATXfKThuTtUk4+181IgylalZLiBJjY7y
 fSrOanqYWacAJNG8ttNOKFyoifVvtbJU3lYM7zULF1yjrqrrAfTAZQe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

Architecture related vdso data is required in fastpath when acquiring
CLOCK_MONOTONIC or CLOCK_REALTIME. At the moment, this information is
located at the end of the vdso_time_data structure. The whole structure has
to be loaded into cache to be able to access this information.

To minimize the number of required cachelines, the architecture specific
vdso data struct is moved right before the basetime (basetime information
is required anyway). This change does not have an impact on architectures
with CONFIG_ARCH_HAS_VDSO_DATA=n. All other architectures could spare
reading unnecessary cachelines.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 1df22e8bb9b31153546b72b1e8b8c8aeaed7d9e3..bcd19c223783be7c22f90120330e7dddd0496f1a 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -70,6 +70,8 @@ struct vdso_timestamp {
 
 /**
  * struct vdso_time_data - vdso datapage representation
+ * @arch_data:		architecture specific data (optional, defaults
+ *			to an empty struct)
  * @seq:		timebase sequence counter
  * @clock_mode:		clock mode
  * @cycle_last:		timebase at clocksource init
@@ -83,8 +85,6 @@ struct vdso_timestamp {
  * @tz_dsttime:		type of DST correction
  * @hrtimer_res:	hrtimer resolution
  * @__unused:		unused
- * @arch_data:		architecture specific data (optional, defaults
- *			to an empty struct)
  *
  * vdso_time_data will be accessed by 64 bit and compat code at the same time
  * so we should be careful before modifying this structure.
@@ -105,6 +105,8 @@ struct vdso_timestamp {
  * offset must be zero.
  */
 struct vdso_time_data {
+	struct arch_vdso_time_data arch_data;
+
 	u32			seq;
 
 	s32			clock_mode;
@@ -125,8 +127,6 @@ struct vdso_time_data {
 	s32			tz_dsttime;
 	u32			hrtimer_res;
 	u32			__unused;
-
-	struct arch_vdso_time_data arch_data;
 } ____cacheline_aligned;
 
 #define vdso_clock vdso_time_data

-- 
2.48.1


