Return-Path: <linuxppc-dev+bounces-11292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D08B35439
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Aug 2025 08:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9yDW6j92z3dK5;
	Tue, 26 Aug 2025 16:19:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756189155;
	cv=none; b=eEV9MMxuJRy65AGgnZ/kcmaIqqWAcNdafualibWxPG+E5UGqTAhWpw0BKCNYSTQbtpJA7qjC1QJTlMl1S1bh/4O63fdCXQlo9EyfIHGiGO8MP6vAdLMDK91PsK3SqJZAYlghfWWAL8OTg7qNtzzPBB9Hh9v3x+LvqXV0zsfVtI0T7lzF9JVZwZxwPcAUeu5L1QZ4nkTLck/pNi6UnLDDgzOffpCpRyhbj/jc+sCP6LgFKPB5LFJ+lzJfgCjkZJfYY5EkPoziPjXhGjlbtQBGRM4FJ/yVmG/KqnETjq1YdpmWd41/2nk4ISplUZMdRi+JKppLjmX/M1ENRl23eeqKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756189155; c=relaxed/relaxed;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSuhxKxpSuo5Cai3zOI7VVnc/K7myRMYwhurxS4rTTInKlAhE859R2cDKhzxur5lAb1cwSPqmDFGleNxh1rl0IJ5CXxXGEY9Sxa8sh9wP+LUfFYakp5MOp/4USfi9Z+dVmN+48cjJOlELbaLrMJ0rPNVwfjXw0UuwjuYysNvAgxG+6mkMCNznj/DwVFf2IKaOHH3F/VD1FCYStGMdSKS2IF1Z5urjW2aW70Hw8pXOpoEKN5kYarX0d7kY0ybND/7AVEnYlnh6AWBmHi2vq8PFDlDYVJ3Css7l4lovYGf79fFTd+k4gcp9LBfolzUB8ygWCP0tqHSxhansblyNQ29gg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y7BA+StB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eX4ApMd4; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Y7BA+StB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=eX4ApMd4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c9yCN5jR4z3dHm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 16:18:24 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=;
	b=Y7BA+StBK859WKGDBThqNJzUURHkFFg61E0vffUNTCQF1VxCAHN6xIXKlyiHbm9eajvVvI
	Jt2GBaIF/pi7LvI0utN6sJQhfLqKDQPZOqDyCHKEfKrCO50+UW590sV1dM+eZn6te1RbF9
	PyeES+znaqYbX/ssIrN39kD3Kk09hoWNTLMrNZp3to3aZHXhrk/vJALCBcxIxdORkBp/am
	uLQaB0JAQI/GDq9oYJJEaiJmug7ASdO6OyB8IVh15jxqnnvzCkRVdctLGYZ4k8F1iN9Zvz
	muN/flVMNl5dCVqSsfywVPrbMq2Yg/EKUtf+JWnprwsvjdX/+lc9kWIeQ4TJsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756189099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uszkh3lqv/KNmuDmi3U8LEjAUFp6txufWN65uYpGjyY=;
	b=eX4ApMd4ziFJ+O7XtN9ONWYbWvF8LT00ruUQ8zsD0FgJE7m4FLwFuEe2Mo8xsi0CtiVh9r
	4pAcBkCmeL70n1BQ==
Date: Tue, 26 Aug 2025 08:17:05 +0200
Subject: [PATCH 02/11] ARM: VDSO: remove cntvct_ok global variable
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
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-vdso-cleanups-v1-2-d9b65750e49f@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756189098; l=2467;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SraZm0ID4pbqm566wM3v0Ccba0fElQJFwVMRPDgnQv0=;
 b=gZMwdBr81Gd7SfGI9zA49QzosCdIhBKgEYiZOU6oZRlEUfUXED78+TGCO1Aix2Xt9rw5NrYMT
 tA6ghwW+GTLCIiMiWaHkprmyw7TLEyHTqzP7iQQA/CqwF/kDQFk1ywg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Rasmus Villemoes <linux@rasmusvillemoes.dk>

The cntvct_ok variable has not had any external user since commit
c7a18100bdff ("lib/vdso: Avoid highres update if clocksource is not
VDSO capable").

It also only has one user in vdso.c, once during init, so rather than
having the caller of patch_vdso() initialize cntvct_ok, just call
cntvct_functional() directly and avoid the global variable entirely.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
---
 arch/arm/include/asm/vdso/vsyscall.h |  2 --
 arch/arm/kernel/vdso.c               | 10 +++-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index 4e7226ad02ec4dcf88203c9046e1b320a10e7373..ff1c729af05f03ac5db86c28276db2e4a31c775c 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -7,8 +7,6 @@
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
 
-extern bool cntvct_ok;
-
 static __always_inline
 void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
 {
diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index 325448ffbba0c29895ea5d97e60d6f51e552cb2e..e38a30477f3d70939f6d57c79fad52eed73c49b4 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -54,11 +54,9 @@ struct elfinfo {
 	char		*dynstr;	/* ptr to .dynstr section */
 };
 
-/* Cached result of boot-time check for whether the arch timer exists,
- * and if so, whether the virtual counter is useable.
+/* Boot-time check for whether the arch timer exists, and if so,
+ * whether the virtual counter is usable.
  */
-bool cntvct_ok __ro_after_init;
-
 static bool __init cntvct_functional(void)
 {
 	struct device_node *np;
@@ -159,7 +157,7 @@ static void __init patch_vdso(void *ehdr)
 	 * want programs to incur the slight additional overhead of
 	 * dispatching through the VDSO only to fall back to syscalls.
 	 */
-	if (!cntvct_ok) {
+	if (!cntvct_functional()) {
 		vdso_nullpatch_one(&einfo, "__vdso_gettimeofday");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime");
 		vdso_nullpatch_one(&einfo, "__vdso_clock_gettime64");
@@ -197,8 +195,6 @@ static int __init vdso_init(void)
 	vdso_total_pages = VDSO_NR_PAGES; /* for the data/vvar pages */
 	vdso_total_pages += text_pages;
 
-	cntvct_ok = cntvct_functional();
-
 	patch_vdso(vdso_start);
 
 	return 0;

-- 
2.50.1


