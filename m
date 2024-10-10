Return-Path: <linuxppc-dev+bounces-1951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2C9997E68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:05:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKy2Rgqz3c2L;
	Thu, 10 Oct 2024 18:02:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543750;
	cv=none; b=ZuIPpueRAOvaIXSBmqlCE9+cqPN5fmAdDBrCAYSQEPdWtqt2z8SmaIJs9pa8G+zkdIZh7OCZOyUuy47rFAn+mv4ter2/JfTNHewtNi3KUBGntvRZ2jriu0x0gLMQ9cvx5vteFEpbUxiPfhNjIilaxvWFB/cTVr9ahRwzCUzZW0adp1/ujwp9lyYBFatX70sxP7oDOKcsymzjkxtI+BOeAn6JqKkq0Yp37T6dL94ExD0lhBnlNGYIEllC8mMab2roR4jB9CNJstPmXfBi1M3yO4yZoGD5k/IMmsvCyyudZrrkoZPIYCXFTKpPMScV2o5ZmXv2yhnRGd+j7dXg80F+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543750; c=relaxed/relaxed;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/8MCBRo+VlUexoXrZIAXiG5f+v7Hrs7PFsSvu8zVSmC94uRAICGU3ICLMEtxa2LbutOCJj15JEfAMPkjziL1uEqgaGuSrPAB2sNOU5+3t21uLueZqn2GrFA++Y+Cociq3rAmhVFXlRqlCEUcNmvveViKCxS8IysmVCMWlME9CTwxuv/o+CazK53sV/ZWsVjHR8VJQRERlBQ7cg4wyy5RivV5yN9WVWEKUjm/8FJc3XuIDInKM5Ac5/G3QJcNst1ajMf2ebkhujKaBw4uSu8fY8rEHYpRcJ3GgsLUI4QN5gfz87Yo3GQrDNZUb+b0hZ6kxUDvFPvzS49J1/TpZTDuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oR2MBOmC; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OLc0/Izc; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=oR2MBOmC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OLc0/Izc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKx16hmz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:29 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=;
	b=oR2MBOmC8kYuKrHMx461FC2+cUPMhFJ6D1VRIgry34xBIrBo+VzVzj6Q1kbJMDxDxrpM5w
	BibcvUOsfhxeZFqpFe7Dz3h4X9VmsWB+vh6eXtf185bxeWUSTPYSPnpDOtrmjGGOB1FDvs
	80mXlYYzDOGq/4GWwybYZvhu3a/zol6Hvqcy+5MBkQyVqNu1DBjnxzOXgUCaq8o8B/78/V
	H7bArnDGZnvw8As8rr6shQ5aoLBScYPP5T7h7+yRqkBGpCGZCOy6eSgicp2xIEJpc5BP88
	ku3YK6VW/Ygn+VBqB6hc3nhQ87EUtji+qTi8KCJp0BaEUuuX+AG1zT0Wpqpi0g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o80BJ2ePq/KTeWTph/dk3r0TbxIJWIzYIWjc4f8IPAY=;
	b=OLc0/IzcI1/Q0xfn6++5SSfFHZnsZswl+T5N39o23MMYsZ/2b515TSBPnlXG7UYDBAK8nH
	0W/YxVH5uAC0RrCA==
Date: Thu, 10 Oct 2024 09:01:17 +0200
Subject: [PATCH 15/28] x86: vdso: Access timens vdso data without vvar.h
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-15-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2753;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5q/oYmCSAPWM0DZS09Zn4vubsvf/hAs/b2wMHxglk/E=;
 b=kReKc4w+yDADDmj9s544US9VPVSloE8UMIfnmrPa7aAdPH4ejj+L3bd9L+1xbmEfjoHrX8qSs
 maEyo7KotmKA6M0V/aylVq3f/Ugs1ZBlarmgyjV66OmOTx3DXEQv6Uj
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vdso_data is at the start of the timens page.
Make use of this invariant to remove the usage of vvar.h.
This also matches the logic for the pvclock and hvclock pages.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S    | 6 ------
 arch/x86/include/asm/vdso/getrandom.h    | 2 +-
 arch/x86/include/asm/vdso/gettimeofday.h | 6 ++++--
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index bafa73f09e9285fbf29cf3f73e13b6d92df2f376..51c0cc0119748dda0f29d577197c520f272fd02f 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -28,12 +28,6 @@ SECTIONS
 	hvclock_page = vvar_start + 2 * PAGE_SIZE;
 	timens_page  = vvar_start + 3 * PAGE_SIZE;
 
-#undef _ASM_X86_VVAR_H
-	/* Place all vvars in timens too at the offsets in asm/vvar.h. */
-#define EMIT_VVAR(name, offset) timens_ ## name = timens_page + offset;
-#include <asm/vvar.h>
-#undef EMIT_VVAR
-
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
diff --git a/arch/x86/include/asm/vdso/getrandom.h b/arch/x86/include/asm/vdso/getrandom.h
index ecdcdbcd3392533e5619d7f09403d60a9810ceab..d0713c829254cc8172c5903a1fdba168b52ff1ea 100644
--- a/arch/x86/include/asm/vdso/getrandom.h
+++ b/arch/x86/include/asm/vdso/getrandom.h
@@ -33,7 +33,7 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
 {
 	if (IS_ENABLED(CONFIG_TIME_NS) && __arch_get_vdso_data()->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&__vdso_rng_data + ((void *)&__timens_vdso_data - (void *)__arch_get_vdso_data());
+		return (void *)&__vdso_rng_data + ((void *)&timens_page - (void *)__arch_get_vdso_data());
 	return &__vdso_rng_data;
 }
 
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index b2d2df026f6e707b8164d8842c33edea9a658466..1e6116172a65cd07ef29092dba6241d719f07448 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -21,7 +21,9 @@
 #include <clocksource/hyperv_timer.h>
 
 #define __vdso_data (VVAR(_vdso_data))
-#define __timens_vdso_data (TIMENS(_vdso_data))
+
+extern struct vdso_data timens_page
+	__attribute__((visibility("hidden")));
 
 #define VDSO_HAS_TIME 1
 
@@ -61,7 +63,7 @@ extern struct ms_hyperv_tsc_page hvclock_page
 static __always_inline
 const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
 {
-	return __timens_vdso_data;
+	return &timens_page;
 }
 #endif
 

-- 
2.47.0


