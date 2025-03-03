Return-Path: <linuxppc-dev+bounces-6630-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2343EA4BDB1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:12:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2j4zLfz3brN;
	Mon,  3 Mar 2025 22:11:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000285;
	cv=none; b=cT5phBon1Cj6F6LI9P1+ilimOl7wkNjsSnGoZMKRLdGTWjJb9pemnK2qar7s7ZQmwm2xjInFfj4s3L+RiiwWVELiUniJ0Nhbnl/Ttf08ap2DocDFh5iTHb0XPo884LOgFSYphwo36NWuhlLmScLzSvnPQxNGtLFMJxNChBB6m5ty9ylPN0BUKb4/u+mKtgm+wo4odOMo8Olgm4ex4GdL9u3N4PPYDNXxy5kgN5guRFXwyx7ywo9CHM36EZKOhYRJwFOLI52E75jpDLFNkWQB8h+MazD4k++8USrdZOt0Yj5IoFNlFH3c97bCl6jpthbcS3ehzvMYjbXW+6TvXBlPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000285; c=relaxed/relaxed;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PRDz3ODFEFdbqUyhjSTay/A/kmRTIgGAE5KRU+WpRk48Ek6f9nNkR2MuFASghYh3DbBUkb7UbsBW62bmRwPwzPP7hxaj1LkxybEJAgOuxOKtBRC98XUmZt47uTq+r7Q5bT2x4YZtzdPobhuZteVsDZDCsjuXb4+8JazUVwW4/oUL2pvARoep8FlrqtYKoLimRW51rR1/qvWESvsUaIuC4l57tQts4Ll1SzUWLXYA6gtywwV6RUCn04jniBt7vXCwUWMmiU42zEBPAhTGMrjwri67mxobgNjOGNo08xJlVcfJ5SD3D1N+XkKWz3n+VV6jfX468GBjPZtJ+k4hhbd4zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=J2PnJ8Er; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GwBc4N7J; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=J2PnJ8Er;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=GwBc4N7J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2h6jh2z30dt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:24 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=;
	b=J2PnJ8ErcXhVIuRvqvkHXj7+dnNdS1EYL5YDEQZoOxgEkdIVKIFeg07b0VEIi3KThnzbt0
	ah3FK8WH0SUuZVYvxjp9pmpwO9vjxDPFsKHVNT/DUtprc2AbKlrSe/944ut+VipnhpibNE
	29SbO2Xuxo/jL/txmYAIO16qHVwJFP+bvw3QcgHJXU/FohbxePmQm/Y+7++xwQnw/Hws2/
	Hfq0VCWqKAR6lbMcAGPJux4b9Ev4LSi4bIfjXBPTW28XOqHQejdiPSeTSjqNqMnc5FIwO/
	uUO5w4RFlrbUUu8nnclDM2MIzMtXJU72CkI7ELp9NW9W5sVsPcqWIk3/EMh6Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kZM1ca5Q9+J4hpNMdg9ysh15hAgKOmycAt5hVatLnOo=;
	b=GwBc4N7JUlvmihVy8GcCVvbKSPyE3aY+zPykltsPgrrIWLNMhdZU0VqRTlm2Ku0wvazGx9
	XnuHfIQjnht8pgCw==
Date: Mon, 03 Mar 2025 12:11:19 +0100
Subject: [PATCH 17/19] powerpc/vdso: Prepare introduction of struct
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
Message-Id: <20250303-vdso-clock-v1-17-c1b5c69a166f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1274;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=J/Meo4khXD/IuyjcSchvegknYNCvt5RiCWDXgeCNEuA=;
 b=ipqT0aYN+nLJcWWGgAiulZ2z34jv+h8RZjUb8zE4PSrDBBV3fg7CNnQswUAW4p7fvphbY9V95
 iF6oxWHwSrZAnFYXR+PzpHDR0Rb2CslyLmtoDfl4dn1AAze7BQJj/Ii
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Nam Cao <namcao@linutronix.de>

To support multiple PTP clocks, the VDSO data structure needs to be
reworked. All clock specific data will end up in struct vdso_clock and in
struct vdso_time_data there will be array of it. By now, vdso_clock is
simply a define which maps vdso_clock to vdso_time_data.

To prepare for the rework of the data structures, replace the struct
vdso_time_data pointer with struct vdso_clock pointer whenever applicable.

No functional change.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index dc955f2e0cc51f44d46f488a292aa0dbee3dc16c..99c9d6f43fde2efaf92d4777d3a5510677da7c92 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -99,7 +99,7 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return get_tb();
 }
 
-static inline bool vdso_clocksource_ok(const struct vdso_time_data *vd)
+static inline bool vdso_clocksource_ok(const struct vdso_clock *vc)
 {
 	return true;
 }

-- 
2.48.1


