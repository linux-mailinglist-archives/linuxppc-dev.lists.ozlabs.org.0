Return-Path: <linuxppc-dev+bounces-12824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7067CBD7AAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 08:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm4ZS2XKKz3d9s;
	Tue, 14 Oct 2025 17:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760424560;
	cv=none; b=G0oTzYQpHFa6EfJNljXEydenNDTnpxSzA70h0Bf7I3SHTrdg67IKukmDxaEFeUZcsDV/NLlzEba/zAaCjBCby9Et8uOzbwJVilVmbkHhBeEJcvBUT3L33OqzHURs6ERTnyCdgyPLcuYW2+TPeIjeR6ceoxllYkQTPWVaBTfDA8fRbmtwJ2yBQ6u/8Xj4NIT1ze8B3KniDrqkfMMa2rqYpn0p0BxgtzOeActDVudz4fQywlWXHoin5nHJwWXBczLgtDVL11KHqD3IJgBjMZpuQ85FTIQaOL0Zs3o+fDpMFWm0ZHek4kczQUzdRSc70lySRVqUEJ0CXdkQQUxnbebBww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760424560; c=relaxed/relaxed;
	bh=L+bQGGgEleKR6qKcL7e+IzIL4DEdxuTbcX+pJZvo9tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MeoPnIDfazURIa6FTxue5tK3Xhlg8YIXAsh0xdb97fhm8wZ+Aa+KyWth1eZUuucxtPMxiRtjyIsq6gbLH+ocmTQx0/mIth/lDsFAxd1U5+gRpeGd6XsBV69UFYbSKugLIZkYQtUxvx0JlJgIrZ4gYHENcNfaaW03BI4Gu4Lsrnz61L4hoC5r6Wvum0gh0Mp/icSblDrQR5w4ojlLq4YWhSQn7aH67l2lc0ehGwcLy+xRWWWjtBWS00ytY+5UE1LZIwYOMiH7bEDLNWiKBNBcKhdvmDDdrG7Al/iiWRB/OB1+9uiyD/f8D7toD2b2dAuNDdHHLU+VN2h9lQR7HC9E/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dE+JKAtl; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qc04abMq; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dE+JKAtl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Qc04abMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cm4ZQ5sRFz3d28
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 17:49:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760424555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+bQGGgEleKR6qKcL7e+IzIL4DEdxuTbcX+pJZvo9tw=;
	b=dE+JKAtlzVcOU7qMVWd+wOIpDBIO6/E6E6lf2r4Hm5J7vNxNlJFjJ8nss9T+ZYN298NWm1
	/u6IBffK04gV8/A/jljWo6nnSw3gZROir4kzTD6eo4X/WVcCnIM68YIsV5T9ZI4xBJVIMT
	jAEwTr8wC7hGyKCCO17rsh57L6iaQBxGMBTe6wbgHL7odi0CV7KdLytWw2vufAcC4YJ8dn
	mScXJCComLnsz1mlmdOviomTWrCbEuPNes43L7r4HwzbEYiDwpyE4NmKwaAkmIy5LcKkIW
	ZFkoC+FJPmWNVCKSt1ItGdg2lXZ1YzXa5lxTj9+/1IU2vWXCrQVlU+i6VhDXrg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760424555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+bQGGgEleKR6qKcL7e+IzIL4DEdxuTbcX+pJZvo9tw=;
	b=Qc04abMq+QGgU/+r8eYljefhoSS1pvXdRgFckAu7O2nO5WAEtElmMBMxWIYuaM35smUeGp
	jJ5lIRLQjF3fZwDA==
Date: Tue, 14 Oct 2025 08:49:00 +0200
Subject: [PATCH v4 14/35] vdso/datapage: Remove inclusion of gettimeofday.h
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
Message-Id: <20251014-vdso-sparc64-generic-2-v4-14-e0607bf49dea@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
 Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760424546; l=1995;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4Cu28HtGZeNZ2tWXY+8GZcEypzFGKNdtzWDHnoy4D9o=;
 b=cRYYUYuwSy1/sQjgQ8nwnyU5oKcNByhZR7Rdr6sAsc5maxw6trpUanKI0+heRL4Rn+doW4BAU
 3w7hBV3IsueDA/39768ZK9QM+han+NhUwo2tKIeXjlZR4EQtdwWSoOO
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vdso/datapage.h is useful without pulling in the architecture-specific
gettimeofday() helpers.

Move the include to the only users which needs it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/vdso/datapage.h | 11 -----------
 lib/vdso/gettimeofday.c | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 23c39b96190fdfc2f31bf76a8614d69a3a98017c..752856b36a3abf82b849451e5d5233b1067b86f2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -184,17 +184,6 @@ enum vdso_pages {
 	VDSO_NR_PAGES
 };
 
-/*
- * The generic vDSO implementation requires that gettimeofday.h
- * provides:
- * - __arch_get_hw_counter(): to get the hw counter based on the
- *   clock_mode.
- * - gettimeofday_fallback(): fallback for gettimeofday.
- * - clock_gettime_fallback(): fallback for clock_gettime.
- * - clock_getres_fallback(): fallback for clock_getres.
- */
-#include <asm/vdso/gettimeofday.h>
-
 #else /* !__ASSEMBLY__ */
 
 #ifdef CONFIG_VDSO_GETRANDOM
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 7b3fbae85544c2f2f6b9abd5437f130706fb6ec6..9dddf6c23913e87a62bdaa50c5e32d2951c92760 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -12,6 +12,17 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
+/*
+ * The generic vDSO implementation requires that gettimeofday.h
+ * provides:
+ * - __arch_get_hw_counter(): to get the hw counter based on the
+ *   clock_mode.
+ * - gettimeofday_fallback(): fallback for gettimeofday.
+ * - clock_gettime_fallback(): fallback for clock_gettime.
+ * - clock_getres_fallback(): fallback for clock_getres.
+ */
+#include <asm/vdso/gettimeofday.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 

-- 
2.51.0


