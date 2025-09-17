Return-Path: <linuxppc-dev+bounces-12346-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3372B7FC08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSt05yZz3fBf;
	Thu, 18 Sep 2025 00:02:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117757;
	cv=none; b=F2SNNcviReVqjMSqQSucrLBl/b+mFp+6BWLRu7iLyOrl+pEfN0q5JqIO4e86Bsm+zKbABDa6fF8CHvB0A3d96CJdzyaKR/UZHseM12GK1rhiZmsWhSwT/bP2EtBrLP96Ld9PqyCtWriQPqxASj2KBNK8fygVOeovqXQZEX1gDJiWkA44zenQOs3fYpzRJ6j12YlpikQhAtuf04vNDCYT2Vjr1qVN/FwX5E0srqefb37q1ZUENWcD2ocGA43xgAJQZPIGDAu3AV3S875rr0tZPuHT/RRUC/tkyi/tIr6PO43UbsV4R4EDjYM5n0BqrCbF/oo7vGYc3MihAYiarxFUmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117757; c=relaxed/relaxed;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U5s4mIQSbJSVnr4Ujm0StgBxNIAgzliyXmMgSYzC96oegxMackM8wMVujl4beziWzbh1en+4G00aylO3wnoPeP1DYWMJbQCmwoBeL0znF/VEEw1bFfwRhE3KtoYDkEx5r+rkgANVujE2kConG4RvOimHZycNz5l22Kt5OWdTjAlHNBxDR948Nm0rt02CsxpwwTrkEcUIMlUhdMHf77IHO9rbkKsgpTok1csdLj0r+o5vIG5/LlEX2zOjwICeMM9FRhSMEICg0r2eT/bYfnGMuoVnDuZTeii2vFtni28M78dGz9OUqNC+T6waS672jFbrkBT0vhsbGMUr0ZRkShg8jQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KXVTzeB1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VdooGNZA; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KXVTzeB1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VdooGNZA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSs2jhYz3f8T
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:37 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=;
	b=KXVTzeB1RPlsTnQnJRl4Ug/KrfPZsvG/7GefSlXXdGzZPU2NWXWZ17UXnyYbJHVTLIBzF9
	xNqD33IxMIKd7qFYt/QyaJ1Cz1lV2HTsa4C5s2I6+cc8GaevZZX+rs1u3jHp0whbosvwwp
	d5Xht3DZB8t4GHY/QLVx3hf2DF2wBaKlUGJskffoX6UbLkn/0N6DOOKyJ0CxsJU8IQzGR3
	orUos3sGWZKnScCfAePyINI4o3Q0ovHjipVFdnmmf8Evq4qymgAy7/zHz4pKjlJYUEeDmu
	C4/SD24nM2ZWV/Udhmy4jj2LhD1tt0xjKwYSl9HLntnMHEz7l/EvaMSsL15X0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1PxhHEOEcArK+oJF4kg6dLM0PhcqAsLM/pkrtwhzyU8=;
	b=VdooGNZAtBORgp2YaI23hG/2RWG+89fRKztgrKPnovVzmaeSHKfMDq+ylT2vPWPRKLlLOp
	HSJLLkewZKoJmgCA==
Date: Wed, 17 Sep 2025 16:00:18 +0200
Subject: [PATCH v3 16/36] random: vDSO: trim vDSO includes
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-16-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=679;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RsrUyYXXhTUZc8iIYJpxbMPkDkRzyWPj4riAorZuqSs=;
 b=SgvOer3x6V6AsfjzAtnHiIEePa9HZbBySOmMf6JRPwGbZayEPl64z9BsrTOKb6v5I2oPrFKbb
 SdbYXypoVe+AASSQki04oVLoyanPliIPxU+NfCcimpnqM8g6PtscQTd
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index b8b24b6ed3fe436c8102968392278d5cb5544f06..3860ddd9527930780d5c13cd4742fbc3c27acc42 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.51.0


