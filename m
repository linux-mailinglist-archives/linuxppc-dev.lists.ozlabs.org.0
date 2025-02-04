Return-Path: <linuxppc-dev+bounces-5819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712CAA2711A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 13:08:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnMXd4gN2z302P;
	Tue,  4 Feb 2025 23:06:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738670785;
	cv=none; b=ErS6uWQcg7NIwteZxF3mQrHPFTQCFWsPiE6y3lAX6GSshX6ynLucpgOlJA++vbKInI/iUTLU05HrDtQSWuI1yFMZf4LwFPK33zELy0D2DX1gQP5kmjEwX25RIRCtgE6oJvQuYE+GdKyJctXn/+pHXNUfut65B6a9LDu4mHhz69IG1OuGPtVH7WAnKZpb+P811sYSRD414xRKBbPl2yhcTeNPwbDNHC8B0GKRE8uJDDrn5+qvVZaY4m0FxKLDVwsvt1DgHNmnVYSMLYzu2+DcCMV5Nm2kpbTpRj0xCCxLAEjhZgk3I5OKxbMjCYIN02XezL2M9QyOOQFyXRHotlTbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738670785; c=relaxed/relaxed;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SIeK7ej/yrJ+rtJxjLBpeHZQjNUUb01TTvYnBhguXj9f62ICYTobfWYCR+t0L5p1Ltl5NJHYA++BmHh75jARCYbvEgJEx5OUJWZrg2eOAEouh96WeO9/0LLUzzb7cCxeT+HSREAmdXuBkuLAuPvXKNqmBetQ3XH767QNKGMuvAEe2vLyOOYdHtGRzl6d3S1KikXlQFe/AlLHOzkZ9AGoR04eNeofIkDhNZW1VPYOODrSo5XqqT+6h4grA3SN5Vl4ctU7Pr5XwFg2AZaT20XEDhp9Z1voWT4SvB43A3Zs+jAthGME9KeJNEvbIToGMVukUp9j/x/kzwVdtlW3zjsGQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wxK92Pp/; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yQ4Xipxd; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=wxK92Pp/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yQ4Xipxd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YnMXc40dZz305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 23:06:23 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=wxK92Pp/r55qShjOBSU0exdyhKwvjhH/7KR82nwP3boIrWI8DOEcXNzmEI/GLTMuKG7f1x
	PkfpPhNlp694PQNIE9JxVVF0RpWJxqD5aD6dRJTgL2KBbo8+mjoASHji5u8OaqosLIhZYS
	I2WpvfYH8WEIAS9wTwTqnQ1ZQeUtq8sBWEr2MyVahakVyltRaNayKDqCym7YG/4nfSw//J
	jDeFgHHpiRWHn2Is5gVbkmGRrNzNZfoZVhXHD66WQ5mmpA0BX49BQFIK5vtjr3EN7X+E2o
	1ySk39mXl3dnbZHdIAb3DZtke3+Trc/kfWfTXMt0py/huHKrI8hV6DQZc87wzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roEAdS7GRy2NoEBIGEVrgoE1SBCHacklusP7n5QqKZw=;
	b=yQ4Xipxdi05s4pgfjTsItukvErNFC8tYL880xKiWzRwOe2Q1tERM9two9suuB4Vi5MstXN
	KvE5bLTn6wcq8sBw==
Date: Tue, 04 Feb 2025 13:05:49 +0100
Subject: [PATCH v3 17/18] vdso: Remove remnants of architecture-specific
 random state storage
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
Message-Id: <20250204-vdso-store-rng-v3-17-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=1909;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HgzmgdwkiaSDMiXf6XJkivPi1ft0DfM/ZF/QqgcCG+g=;
 b=yVdvyiouTW57SLrpHIPuIBmbt1VBsh4joVh2d8Xlt05DpEfmNT3KQwIdq5mEUqPx6MKl9Ku1M
 G3pd8yFEhW/CSALC2XFknkosOiA6chnJdCA+jrJ2s0Bn8d4Kmz2asPR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

All users of the random vDSO are using the generic storage
implementation. Remove the now unnecessary compatibility accessor
functions and symbols.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/asm-generic/vdso/vsyscall.h | 5 -----
 include/vdso/datapage.h             | 1 -
 2 files changed, 6 deletions(-)

diff --git a/include/asm-generic/vdso/vsyscall.h b/include/asm-generic/vdso/vsyscall.h
index a5f973e4e2723ef1815c88a7846f7c477e3febd9..13e2ac3736ee9b4aea6800117997ee165a7e2b9d 100644
--- a/include/asm-generic/vdso/vsyscall.h
+++ b/include/asm-generic/vdso/vsyscall.h
@@ -32,11 +32,6 @@ static __always_inline struct vdso_data *__arch_get_k_vdso_data(void)
 
 #define __arch_get_vdso_u_time_data __arch_get_vdso_data
 
-#ifndef __arch_get_vdso_u_rng_data
-#define __arch_get_vdso_u_rng_data() __arch_get_vdso_rng_data()
-#endif
-#define vdso_k_rng_data __arch_get_k_vdso_rng_data()
-
 #endif /* CONFIG_GENERIC_VDSO_DATA_STORE */
 
 #ifndef __arch_update_vsyscall
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 46658b39c28250e977f5a3454224c3ed0fb4c81d..497907c3aa11fcae913f62ef7373bbe6a1026bd6 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -152,7 +152,6 @@ struct vdso_rng_data {
 #ifndef CONFIG_GENERIC_VDSO_DATA_STORE
 extern struct vdso_time_data _vdso_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_time_data _timens_data[CS_BASES] __attribute__((visibility("hidden")));
-extern struct vdso_rng_data _vdso_rng_data __attribute__((visibility("hidden")));
 #else
 extern struct vdso_time_data vdso_u_time_data[CS_BASES] __attribute__((visibility("hidden")));
 extern struct vdso_rng_data vdso_u_rng_data __attribute__((visibility("hidden")));

-- 
2.48.1


