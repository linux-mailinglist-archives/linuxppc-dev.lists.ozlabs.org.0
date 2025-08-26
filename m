Return-Path: <linuxppc-dev+bounces-11288-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A04FAB3542B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yCQ39psz3dJ5;
	Tue, 26 Aug 2025 16:18:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189105;
	cv=none; b=UP24U8ulEsZJEHsooBagk7YOtiaiUNz3b0qmNDGaLJD6u63TUfG4b6jBY/IlfK7KNGd/j9JbVoj8w9tCN+VMWYuI6LxTPy8HQCisysVA8pexRiaj8g80SvQLuDnRlUzOHFPJifmNOZEF6qtH9Zi5TErQUtA0+MV+VUR9LcujOYg+j0hxulBSNRbwSXU327cCMy2LkxaVSE+vN71KiB0SypKU24aEGrorf6Ei4AFef5+bS8F7d+agk6EVI9FugI3FrcKSAUjVe7nFHcBOeiMh6DBjryRLkHrXnPB8OI4VujlhOt1hhCI+9xySrDWc6hwqMv2Q1yO4PvQPtrMMyDhfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189105; c=relaxed/relaxed;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U8ISaQm43gIC1no8WV3SfjDmwlXqsq5kMdAILzcdQnmFWf5WmF6Y/mwW+G0cJERQ1B9RpnR0qxpUoZGEsuMiPyYjh4BEKMP24aIPewkQVLCmU8o5tlb0bnzj8TuxEZh9qCjwbpLEAR359nXvObgDuY4yP5fQPkYbXPP4N3sQGfNReXSXm49usnx6ZI/ifw58o2gxrKymqeMxKs72wNhOF+VQoqIO9jO+2qTcuM2q3+PKTDYLDH4sdvxErnzXh3x7UJ05OLfbVHtIr2V2a7kT3zzNgz3R2eTNa2JPtM5BRR1JP4f4/kMiRMVz1RwbhqcPF3HpK5ezGRZqGFJoYe4W8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SkRWsNvT; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D/AJx/Es; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SkRWsNvT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D/AJx/Es;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCN1Xvhz3dHf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:24 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=SkRWsNvTfHbckv53ywkAP2ElLQno6nL35GWoaL2ostie0fB8ZhIrtZ2GpuUn4Yog/ZqbRE
	7Ic6DelZ6GAsCv6r4UwjpNb7cBzSwuWnf7NOkczUv4NJuo6Lqe0iE9DBx6XOvzaIrOUWQo
	ZM0hBzR26cXTRvKvnkNUcchIelDhHzNqPoWVr5FtMu4Nudp2Z1D46OEL1XDCSKSmaZgXIQ
	GVPwi4kCLp7XohVVq/RWPsKA1Z9HMGn618o+O6/M1Ni8zE340s4Kit4LGTyA3C0Me8op4Y
	B3jPvpQhJwWgOn21qfbXuyhpqhYwaUwaTLAGms3NzzYcJcqF5v7lVsAOPnWVQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nO2JL615du1jOF72APE2zhJ94ZRmncTq0i3UGNr5c1I=;
	b=D/AJx/EsJAMGNOGXXQFrdYdT0ZJzLD/RNagxyHMRvN9hYL1zhSX7qy7lWuXYEwi6Dt8f0S
	27kxifT9iftB5EAA==
Date: Tue, 26 Aug 2025 08:17:07 +0200
Subject: [PATCH 04/11] vdso/gettimeofday: Remove !CONFIG_TIME_NS stubs
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-vdso-cleanups-v1-4-d9b65750e49f@linutronix.de>
References: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
In-Reply-To: <20250826-vdso-cleanups-v1-0-d9b65750e49f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2241;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=tJipNBF1mCJkcHD6N5bfKjS9Ac/LEi0lcuk3Tu4AjoE=;
 b=7HV/8pMpAQ+4eBDclWEwMfZrJXqv8psYox/k68u7tMzHASoMCDHXlEWrPcIR5Nm0+i+/zA6uc
 bGdBUfDn6tHATjO/gAnAN6QWWAGRNdzrTjLrH/04Nne7yZR3YZZBbeH
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All calls of these functions are already gated behind CONFIG_TIME_NS. The
compiler will already optimize them away if time namespaces are disabled.

Drop the unnecessary stubs.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 02ea19f671647e9a1b8c3e7ea0cbff33b4024711..1e2a40b8d2c6c2356cfc678a1ea441ec1bad181a 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -108,8 +108,6 @@ bool vdso_get_timestamp(const struct vdso_time_data *vd, const struct vdso_clock
 	return true;
 }
 
-#ifdef CONFIG_TIME_NS
-
 #ifdef CONFIG_GENERIC_VDSO_DATA_STORE
 static __always_inline
 const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_time_data *vd)
@@ -149,20 +147,6 @@ bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *
 
 	return true;
 }
-#else
-static __always_inline
-const struct vdso_time_data *__arch_get_vdso_u_timens_data(const struct vdso_time_data *vd)
-{
-	return NULL;
-}
-
-static __always_inline
-bool do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		    clockid_t clk, struct __kernel_timespec *ts)
-{
-	return false;
-}
-#endif
 
 static __always_inline
 bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
@@ -204,7 +188,6 @@ bool do_hres(const struct vdso_time_data *vd, const struct vdso_clock *vc,
 	return true;
 }
 
-#ifdef CONFIG_TIME_NS
 static __always_inline
 bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
 		      clockid_t clk, struct __kernel_timespec *ts)
@@ -233,14 +216,6 @@ bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock
 
 	return true;
 }
-#else
-static __always_inline
-bool do_coarse_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
-		      clockid_t clk, struct __kernel_timespec *ts)
-{
-	return false;
-}
-#endif
 
 static __always_inline
 bool do_coarse(const struct vdso_time_data *vd, const struct vdso_clock *vc,

-- 
2.50.1


