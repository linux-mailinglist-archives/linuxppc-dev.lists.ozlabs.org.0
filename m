Return-Path: <linuxppc-dev+bounces-13856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDCDC3A065
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:05:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmh2YvDz3f5Z;
	Thu,  6 Nov 2025 21:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423348;
	cv=none; b=ZLQzvNN/txZpL6FnJu2uMZX/rbiB2uiBv/rzQDTwXQaAw40YpLOnLe26+PIQPdF9wKGEMYoQwtFLhgQ9O18Y4o5pm8+84xoOr34M1JUCdjp9D4au7Af8G0yYbGXq69vG+XuPp+abw+rmtsiHrnkqEqvlVGAQxEWundX73pmj2UFb1s2+9ID6LG4hxAbbSlwcgcfU9sppZGHiDW1aq0A4pfnFA75aTWitVno87Gf4EG53S2rGCVceamkc4ExO0Jq18N6sPO4OMMyK0iBdq7+fWEMpUms8km63GywSlNvRntKWMO4b7iPxm1uobhk6r285IoiKvVe3hxvjFXBrzhpdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423348; c=relaxed/relaxed;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DW7XxwsTmTDgP95iIF4Yf21rhHfCrAsP3Hi+qyrCZQ9WS8uLfsRM9zBXIQZXKkevMYwGf8ZKESxXWo78RLIfAwB6f8CXudctNXLn/4nW4BqSCBFVp+YPT90vwh9ntoqNA/McZEl5jvVITx9C3OsQti6K5q+JYFv76oTLw05P33P2j+WKM8VAjXs00yrB4YW1S/vIuiSKn3kwaNWlYL14ZpRAizw27s8fBQESz+Axa21HrRwfTicZdQ/iWsSd/VakUXrWHcFW3HQwxreldcIleDxpWQPTcVf8ukOOapkR5mjNf5IK4NDZhGkF0CJrlxPDzXduXshL4MuKVmJNHF5AvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IS82j6FD; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IQzJWc/I; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IS82j6FD;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IQzJWc/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmg2c53z3f99
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:27 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	b=IS82j6FDl7Ny+WZ6JAbmEnikWn5fk5BKXLGg330FI4L/O4Ay1WXhQlvWJtGmMxqipV2KLM
	Yyi4cIW0x+8Z2gsq3GhASyD0VgfilEm9lZ852jE1hsXYHm3cDkzarje7iUbTCAsZhb+S/F
	S6KBL64/N/d2QDM6THqZ+LqVn6PKSjwLFqdScgsG7JZs8K/EtL/xi/oSJiH6kxEmhKV6I1
	p17oBsinUPILAKY3wKRPgBuyjXUEpZSL5RajdlPtxQKX4x0iZgr9QXFRBNCjmBMu6jZGEe
	UaofP2CLbPOqvVUKeUrwqBkqrrGejcEdVWGiL4mjxm0L/wY2zNP1hWX+Fwz+4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y3tGpR5SbTtmYH9/UhUB7FG7sTK6XysaxzCJ0fbVJv4=;
	b=IQzJWc/I58sgXAbxGDnvHbnbx22zuN+uYONk9lslfn28Stw1YS7Z19VBWQxpa8nJ0rzmlF
	5ao8jqHUHC914jBQ==
Date: Thu, 06 Nov 2025 11:02:13 +0100
Subject: [PATCH v5 20/34] s390/time: Set up vDSO datapage later
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-20-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
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
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1384;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2hSFMUISgDavbKKRu1atPOpNqM6l7sLyIWcWtFRLYDU=;
 b=Ov4mzaNxAT2GTQwh7RPz3N1qjaNCSocF2bw0jkDMXSFmOiEJkoHSjG7+bqcrj2PG3wzY60VRh
 T/MQVcZTM9PDCxCMhOiQu3NLt8WCtCrc/0M9p20icPbA/+4/MccBS9w
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Upcoming changes to the generic vDSO library will mean that the vDSO
datapage will not yet be usable during time_early_init().

Move the initialization to time_init() which is called later. This is
valid as the value of tod_clock_base.tod only changes in stop_machine()
context and both time_init_early() and time_init() are called before
interrupts are enabled.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/s390/kernel/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 63517b85f4c930b799235c381d9d6b263fff5431..6b948b9e61fe674bbc842a0143dd35a26b91a860 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -78,8 +78,6 @@ void __init time_early_init(void)
 	struct ptff_qto qto;
 	struct ptff_qui qui;
 
-	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
-
 	if (!test_facility(28))
 		return;
 
@@ -248,6 +246,8 @@ struct clocksource * __init clocksource_default_clock(void)
  */
 void __init time_init(void)
 {
+	vdso_k_time_data->arch_data.tod_delta = tod_clock_base.tod;
+
 	/* Reset time synchronization interfaces. */
 	stp_reset();
 

-- 
2.51.0


