Return-Path: <linuxppc-dev+bounces-1982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A998998C29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 17:46:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPYwz193Fz3bp0;
	Fri, 11 Oct 2024 02:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728575107;
	cv=none; b=H4TcorCcrWX5VaavOYe6ISwoJdI7Ku2vwLCq9eA2BzwraRXWE9wnRXxBdBpj3f0jnQhNxEKpXq6RNQRxlgR492H5TvbYUSoEKuT8jCdOsmMMgrIjiU7crG5UBS8nvyZBJvztpgVHsEEp8UpXsFBoIQqlrK5uzjF6q/BHxL3StammqmC03BP/s74GJjVyjJejOA+QLi5Y0B1CbGcyPlvF4yOV6KtsX6nF3TVpbaFlHitIDdw/Oa5J9RYUg7w+oSQLw+t4nJCzj57CSr737JEjr/b1rnR3aq2VAwbw0RFwBDiNhXk/x/JY9iJFGxyfVK4HPe2IA1LFie1Xn52kAEWOPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728575107; c=relaxed/relaxed;
	bh=//WOaSb+qiFuhDcrD1QvrKSX9jq6HrXx3vMVSTOjlpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4lat8ucGCRS4l8hNb0IpyPcmfdgotFArHNuaUR/yf2KyI2iC3Bk+DSfw6wjnhlykLeoqUHmyPt8blOjBBwB7w8TTQg5gH4Xjr0BM/dorlUWqSGcQhRNl4b7BZXNiYirdpn/h0elHKeu1SJxD3rbnutsjWpUZdpy4LXCjQK6yptLgIZJvBD7bLrNQOVl7Vgx6eHiXPpNPnkP1cj3jkne9wH7ZEQH6WUa8X14pvuHHFoXB/FGZWhVHn6y9aY5r0JBq0taW/JWKtfq1bfq1brjyuKqANiTWjIsmyX0Q79CkL2gPo1vjFyde/2fpFateZtVsq6n8BuhI6nIJ6zoW2uYCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2VrXyCvl; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=84jkthMW; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2VrXyCvl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=84jkthMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPYww4kfyz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 02:45:04 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//WOaSb+qiFuhDcrD1QvrKSX9jq6HrXx3vMVSTOjlpM=;
	b=2VrXyCvlEPG/qSkhA7AEYBYXeD45ZWKkLTe2Mlb6dw7lZRpUe5oEjGYhhUTX9WxqWueCmX
	bWyV8FnZpDzj5zu6qChhR6ojn1Jco3nNNl6s6iqrrUSoJjd1fIrYn3aeRZ/SExewoutWqf
	D5xXvosPkw4N7cOT+3CDeFTl0H83mGQjnQU0pXyQWSEffFSNQWpuR0lJXUguCuMfB9XWp3
	vpIgRP5XjW5p56Eo3UApKPrbAzpyLxDzfUjNyI1flxZBOJLMcQhg7ZgijRNfW34LG2iHhk
	LUe6H17KpbiZZMKc2tFVOsdVPc27Hyahhm3Yb4c82oQB0prBIni+Hbhledyjmg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728575095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=//WOaSb+qiFuhDcrD1QvrKSX9jq6HrXx3vMVSTOjlpM=;
	b=84jkthMWjxjsydzn/4oqUu2+UXGDE3w3mSl6Nx3zbBL3u4gTWtw+ZFEf10TNhsDTjLWQy+
	cBy+YXEZCzhNQPAA==
Date: Thu, 10 Oct 2024 17:44:47 +0200
Subject: [PATCH 4/9] powerpc/vdso: Remove timekeeper includes
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
Message-Id: <20241010-vdso-generic-arch_update_vsyscall-v1-4-7fe5a3ea4382@linutronix.de>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728575090; l=1560;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2LvKRYHam7JPvf9YTnYT/Pt96cAREdv5IB7CnEDdMso=;
 b=wCeMto8LigT0NWmLWaYqjH4etZsM507fuDoQptvkr3x3QkMHLdq+92lLyQYSHdu4J9UgjahuM
 gvKGsW+JLn0B/ParFwQLICcr2DHaXVyP0GNd1k0EsAzL/zETzTfLLPv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since the generic VDSO clock mode storage is used, this header file is
unused and can be removed.

This avoids including a non-VDSO header while building the VDSO,
which can lead to compilation errors.

Also drop the comment which is out of date and in the wrong place.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso/vsyscall.h | 4 ----
 arch/powerpc/kernel/time.c               | 1 -
 2 files changed, 5 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/asm/vdso/vsyscall.h
index 92f480d8cc6dcb905d5960185ca8b615cfc541ee..48560a11955956b8fbb59360334a81972723bd57 100644
--- a/arch/powerpc/include/asm/vdso/vsyscall.h
+++ b/arch/powerpc/include/asm/vdso/vsyscall.h
@@ -4,12 +4,8 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/timekeeper_internal.h>
 #include <asm/vdso_datapage.h>
 
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
 static __always_inline
 struct vdso_data *__arch_get_k_vdso_data(void)
 {
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 0ff9f038e800db6dbc910ce581550b457ee5f2db..4a95654c1d36f25d6021284889fdd1510782b408 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -75,7 +75,6 @@
 /* powerpc clocksource/clockevent code */
 
 #include <linux/clockchips.h>
-#include <linux/timekeeper_internal.h>
 
 static u64 timebase_read(struct clocksource *);
 static struct clocksource clocksource_timebase = {

-- 
2.47.0


