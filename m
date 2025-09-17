Return-Path: <linuxppc-dev+bounces-12344-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0C8B7FBFC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:07:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSr32rlz3f1K;
	Thu, 18 Sep 2025 00:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117756;
	cv=none; b=YWusSoPWlX08jqwnPXusGEyb9yAWEEiOZkdEvWQkmbHbVU/KPCVeWX+L2JrrDjrUxZqg7fxzShcLYzTFPvVtNmECv1eE857EwWV5Rqzn413AI9bDb0aTL9d3K/jyeDi3gAf7goiMYI21K/W06ukWKtF87Hl0DEZmrCjc5NfXCFOKiCDKszzsdbRg9lHPlOz5NAkidLZK5tw+IiIcxp4ovbaZ1EGXYjQdQCohtid9SkBq8SRT0bQpMq4NkomUb2ovL62HCphgJR45kkPJU6ZA+kULiIwBapycpOcRPAk7YySyr8mRmYfyamJxiXw/nDiw89T3TkWasEyNHdTHFAZHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117756; c=relaxed/relaxed;
	bh=LIB6qj5Tyvf6yGXAjJF9cy2F7XmH3fdY3Ay5SCETptY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lj/yrx0k3+xLwRcuj9HEJB6BgI4tuH8wloYFkVHxy2kLC3klVMGjLnEnddVQPSoZZmFUrBdkmuamEVhC5pi9iu98mm+AAarW1hHJtV5jD+27s3w1A6Xx8X7O3Fqnk5CdzBTq7CFfyhS7MUStyhALbniymXjNy78xaMQnhRL1K3wmb7eruPR/T+b8QyB3VwJAe6IcvX19cGKI2bMciqlrLDatDFG61sobgHe6K4PlIOj/jFggY6st15aSP9i1phrKmj5VJl62yUMuW55I2UpKbdolglO42c/KjVgyDAm83Ql8/3radj3k5XEYNZeIISBU6V/o8MDuQCmY4T8xyYRibQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q6cdq2EQ; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xzZfGKFS; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Q6cdq2EQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=xzZfGKFS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSq4nRqz301Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:35 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIB6qj5Tyvf6yGXAjJF9cy2F7XmH3fdY3Ay5SCETptY=;
	b=Q6cdq2EQiyIY9gSp6W/gc41km2+1WHeveF+bCcxTU5a6wF2Ia3nvbEazshmf3ZkyfwkebO
	GaZOpZfItzlRCm5xJlTdrs1eg0PJZT7w4R4AuEbz3XDQoIIXxrAI4AhPyPDRXze3spWlO+
	PjYChAz7wy6hTfYfnZIwsg5OHbxftUFUnqsoZIB7RJZo0/Iw1TF2p03FylUkVK91ADxoMI
	F3KNXrsETLtD1W2joUZloM6/IDPCxmOFiOrs23B1XodwxuTrnbkEdw2pFysmjiOFj24eCP
	ZKGjchAV+mW7tRzpiCJmGMGLA5PsvJiU4uhACRYQSuTCITxQY6GhKM5u5PSmMA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LIB6qj5Tyvf6yGXAjJF9cy2F7XmH3fdY3Ay5SCETptY=;
	b=xzZfGKFSYXP3LbS4O9XJIQJA9cuaZI5onwSRZ1J2pN+8NQhHLjX1SO3ZoqqTqWTm/FpSFL
	zUDGdCGMmeKNRqBQ==
Date: Wed, 17 Sep 2025 16:00:16 +0200
Subject: [PATCH v3 14/36] vdso/datapage: Remove inclusion of gettimeofday.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-14-3679b1bc8ee8@linutronix.de>
References: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
In-Reply-To: <20250917-vdso-sparc64-generic-2-v3-0-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1893;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=w6xzYW6xAq1crhPrTB2AKCdAcCojZNogYyfWD5/zkQI=;
 b=pUIEkQChngesEy4Dk9YLFfuqBrnL9TYQk5Kjt1h+jpmLHBDwFEO0G4yAruxzI4O2gNAml0XAk
 x7cC0vfGeuaC22HKDbWurm0E3nDtXjddgGhr/4Tu8kXE6u3vJBAInMl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vdso/datapage.h is useful without pulling in the architecture-specific
gettimeofday() helpers.

Move the include to the only users which needs it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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


