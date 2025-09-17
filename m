Return-Path: <linuxppc-dev+bounces-12341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD5B7FBD5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:06:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSf2hJXz3dwr;
	Thu, 18 Sep 2025 00:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117746;
	cv=none; b=JrLLp3mRlUtzGjfGbwux8MiFH0fP4splNNNlsrzFPb4L3v3PNfmLSuLK4YHhM0xllPQcruz33O2yIopEbRGoOKVvgB0qXYtTNzvQhRFE7acVf/A5m6sbB8+KbETOCAU/0kSfpcBMJavcBsaxmO9k3HwNZnwkINoXQk8XYN2fdN/K09ReBh42o2bvJak/1hJ/5wucoM0ri6IHtSHPfk3EXu4W0xYnwWe871EYsutkHywx+DT0m9tF0V4XFXOgVAzxrl7MAtdKDozY1gO1sbjuSkmnezcqf74JbTafWtAHp8CN6QyeIa9U5fg6rszocmeVs6f2lUwzK7MBIoqEvwoZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117746; c=relaxed/relaxed;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnseCFwpqKt1HKGwgCSTM9NqAlWRJFFLDOJTUqOZnFzR5vdoMaNrZFt4a+BcorPWkbe92YQvYTVIQS+a2CHShN13w1EseNqHycsIB/C0HaiBvuNO0yn0rPaCU3kUGD6+uygnkPx3NPYvk3YuzAxly5HyUC3xQ4v+AyggITkw+gF1JwW4QBlZsvTtbAfTHdpVWBbhpOBKAQMTuyc2WkVO202SurQK7RzKWku5EZo2HAFQNtJfEf2qsR4kxsz0nlIVzoxXDrv7vRjiV8drbzcyKgR7JZesyFUVEPH/1du8wFXsJGZbmwc0FwZXXD1hZ0Ir0hEMuIETKJCIIivHY6VNwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WyIEv5kN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1Ov3WBkd; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WyIEv5kN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=1Ov3WBkd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSd518Lz3dmy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:25 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=;
	b=WyIEv5kNEj9kmZtWOWeZFCCCY1bKbOwpQLdESGYzHr8aG+JimbdpiPhO+pYGXJ5hXnUmOC
	nkDWFRp/Km9ncq1IUzarC6zSat13sCZFinKSZ6TJ4igvoAyZwcGPLFjc/X4xEPTO3btvvw
	ndMOpmuthbyZu7XIQM7yN5qCw+OiSniKzriW2W3IWdIhqreAChd7jTIp3RkgAMQEdnfo13
	Usp5z0uaapjAvRcSpMy6GjR0JEgkmOnr1+EedQA31VYdmhXb4xyImRuvHYPXAnOTtmZv3/
	OfordU9WHIWzFvZehPLEXkZGw/8cjzTTQnZtmNk7vyesWkqywAm3i6Q42mHY5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXWzH3AvD69Q8lI5Y0llzQzfFSEhsuV9TmtXsx0N6Y8=;
	b=1Ov3WBkd4ndEaUkbAYesP5lZZeKZBCW6v/dv4t+5HpDa4vpaLTKURbGvN8xeVceJNb0Lkn
	HSsYPzwckq71LeCA==
Date: Wed, 17 Sep 2025 16:00:38 +0200
Subject: [PATCH v3 36/36] clocksource: drop include of asm/clocksource.h
 from linux/clocksource.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-36-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=681;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=z6rw8gc2i+vXaJlg660yiQKhkDkj7a8Qr+J2EFiBq9A=;
 b=RhaONrS37dhEX8d1wSADLLwBV5kdoZ8JXoywKJrRNnTRBnqPjh/4TWSHyfP00DxiPUP9Nzz7Y
 EkydccSCII3B3rLLld2L+tAc2+T/EDPK/KlwsHTX3SAToBbrIuL3HqZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The same inclusion is already satisfied by vdso/clocksource.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/clocksource.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 12d853b1883265cb47d93e33d8370e3957e7e695..afa03e9fb6f6c978099b33c07ec853b7a82fde84 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,10 +25,6 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
-#include <asm/clocksource.h>
-#endif
-
 #include <vdso/clocksource.h>
 
 /**

-- 
2.51.0


