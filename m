Return-Path: <linuxppc-dev+bounces-1938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8C997E56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKh23n0z3bqy;
	Thu, 10 Oct 2024 18:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543736;
	cv=none; b=bIPlorOx4CY4mV2J0tmUY3SUwjlD8CJLZ6YZRVPfIbyVYhhzwhUjMouR5kno/PRSPp1iEJ7yzCKFBx/mmogxwRzmtQskbg6kcFMOeSrWnAzYHVnSgTPoMV4AYRPrlxq2bB8H4diXfZCZ04QGLJCZKzTJCmWo4OD/E1DOkVMDRUI8X5iRIivNNNjCSV7dhtFJak60byIzrRiRkUMdijB13+XnpL7c5ferjbVzHiseMZUj537Q7b5WdwDwZdh6fM+OY9+RZq9ZxhsrpJPNR4B/blGaYFdhZfwWTFFwg/BVgWCPTivo38ASqZdISWZb8qS7YAl/W5WPP/66JgH8mzDRZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543736; c=relaxed/relaxed;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyD4ivxqro3Sq5EOkRpYQzZJc5Ob7UBAf1LFL81dB35hHzUwWPOeV0byDW8A+2NlmYnV1RCOWbc5EpxaQ7ibiJoIOY9+Pn1bYy1cDKaK93JIrJ4+J1duQv308ADcpWYm5ObttJKr7VTEJKOivEApL6GMn9OnFB00jKtCYYa8CwuxEs0bgK+2kQMoh3CsjruaI36EwkaEi/yHgIXK8XfqFBz9KyYb8UVaIZt5KP/w2vjCH4RJUw7hJ0NtvDgWnil97no0NA40W3NiUWkGWjE2zzcdK3lr8SF8yvZ+9FNoPP+8u7CsIwngQqwwlm7ipxNj13UNJsLgj3ksu68z61ZghA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PVsUO368; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cLvqHqyS; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=PVsUO368;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cLvqHqyS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKg2NTsz3bsd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:15 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=PVsUO368dvql/siKBcpr9l5wYV4gYvcYn+cxK8Bxegv6YBpSjlkgXybg8U/1i1nMy9++e2
	42nElRgzH1PBc+dSbfyFDW8aSC0HBfV3Aadzkj6Cpyp+e59OoY0g+cQndaUKRJbu4CO7DM
	o8rkBzg6kV1RR+JyoGzS2VR73qMblxTf04SSnaKYQK2EYn1rTEb3Pu+SgXzPngSo3ERkQ0
	TofPkQyQHnJ4jtDyurMvGZEZCTa7ECfE4BhsPZlXUYE/Vl6tN9HLshReXkL6u4vAR+7nFs
	SO/EWZU2mJglWlFygDzUbPHhwxnrPFhEH1Vh9KZa/9zbni2aeTD6VtWRsRjEmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZZQlViVgS+2LcEo+qdBKA00fw+gxukShi7G3ebpqnY=;
	b=cLvqHqySEHPZv1US1u8oDr9/h69opZq35kGQUn624MzSrtK+ViZDTJRnanJyDRS+U2H/Hg
	2sObeUVzRaZbQuBg==
Date: Thu, 10 Oct 2024 09:01:20 +0200
Subject: [PATCH 18/28] x86: vdso: Access vdso data without vvar.h
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
Message-Id: <20241010-vdso-generic-base-v1-18-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=2055;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=UVvHeMYo/4L1aZCClOsAJMCXlWGGvhyJSXRP56wXKoU=;
 b=Aw70U3TtTDgXoPoGX+ZU4CBMgh7YOqogGwOrL3DIezjMDNN7aimwPWM/gowDGA3eCE5TmK29N
 cDgvvkWxm5WBH3Pxzm3+MzflaZU+Rl+tz3bBifk8tkeFXLxlyVbS9Y9
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vdso_data is at the start of the vvar page.
Make use of this invariant to remove the usage of vvar.h.
This also matches the logic for the timens data.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/vdso-layout.lds.S    | 5 -----
 arch/x86/include/asm/vdso/gettimeofday.h | 6 +++---
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso-layout.lds.S b/arch/x86/entry/vdso/vdso-layout.lds.S
index c7e194b6e47def3bfa681b3ec5d45cfffbe839d2..9e602c0615243f8667498ac245c2aaf1b35dcd16 100644
--- a/arch/x86/entry/vdso/vdso-layout.lds.S
+++ b/arch/x86/entry/vdso/vdso-layout.lds.S
@@ -20,11 +20,6 @@ SECTIONS
 	vvar_start = . - 4 * PAGE_SIZE;
 	vvar_page  = vvar_start;
 
-	/* Place all vvars at the offsets in asm/vvar.h. */
-#define EMIT_VVAR(name, offset) vvar_ ## name = vvar_page + offset;
-#include <asm/vvar.h>
-#undef EMIT_VVAR
-
 	vdso_rng_data = vvar_page + __VDSO_RND_DATA_OFFSET;
 
 	pvclock_page = vvar_start + PAGE_SIZE;
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index 1e6116172a65cd07ef29092dba6241d719f07448..375a34b0f365792ec108381d7c7229f8351448f7 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -14,13 +14,13 @@
 
 #include <uapi/linux/time.h>
 #include <asm/vgtod.h>
-#include <asm/vvar.h>
 #include <asm/unistd.h>
 #include <asm/msr.h>
 #include <asm/pvclock.h>
 #include <clocksource/hyperv_timer.h>
 
-#define __vdso_data (VVAR(_vdso_data))
+extern struct vdso_data vvar_page
+	__attribute__((visibility("hidden")));
 
 extern struct vdso_data timens_page
 	__attribute__((visibility("hidden")));
@@ -277,7 +277,7 @@ static inline u64 __arch_get_hw_counter(s32 clock_mode,
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
-	return __vdso_data;
+	return &vvar_page;
 }
 
 static inline bool arch_vdso_clocksource_ok(const struct vdso_data *vd)

-- 
2.47.0


