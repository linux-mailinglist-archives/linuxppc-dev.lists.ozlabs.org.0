Return-Path: <linuxppc-dev+bounces-13869-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0247CC3A0FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:07:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmx0Cm7z3fRF;
	Thu,  6 Nov 2025 21:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423360;
	cv=none; b=e+n7z6DYsWXInPhpmb0JnXFx8dRtF0SfGZxOffGd2E5ElJ/6tu9e8ovMOcVY//xCvDZ58+9kIX35MLLJjxASUqoKYy+wY+o8D8pQIA6tUUxPY47RWJJNNC+WN6ZbYwFtxqpKTiUpnuIJUE3dPHOOIYyV+RjNQ/rfDF5tCcqs2oI7/ZLybdDhK/NqhcGy6+v6X+bgCVfEZmaaFps6xl9lqswyFsR8Nai86O3ULbuuJPzwvF1QjkVdCAwiJU1F3ISbH8EAxwJO2YcaukcPuOL+FMteTCrBWWTwYvLwsOmjVdv8Ud7GNy3NXiLxJAYkFxrT6wFf8U2x0QbnPy/PhKrJsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423360; c=relaxed/relaxed;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nY4a6ezRfhdn7YkbPi/btKuQvfkS0YzyuLK5lbWnsHHNAMPubsS72chyIcWRxCBp5+N0c2cOZ2YwSjvaO6i9sARWZwlrny3PNrv1sw7QCi62aFWuUCpFCcL5P7JArew6VNSvZVfsARZAfXwXRBWvdTOl918Q+XROJTgo/XGhAqrJSaeu/khNPH2ZtiFStoqxNSmwwIWi7tVkkL9X0kFYcPVKBXqg58s3Z6ghyn4IZ9jjAQFZvdc2JADrhoN802tftlyDMA5LhXr+TPyFP6zfKvfNW4H8HhI3efvXn6PnZtAfdBGq7sV0SjNFf/ywaCm0aNxldtK8kyGWNyCpVLlFYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ukZ4xA6V; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wdet2324; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ukZ4xA6V;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wdet2324;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hmw3LGZz3fQv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:40 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=;
	b=ukZ4xA6VMy8Kt0FQwFFNDx6HyFszi48OmTb6Cekc257aWBUoIh9WgBxsG9/zTw+vU9Pdtm
	+fvMsScYYwWrK2zhQg8UJofVQzw6/PUjMti9i3Duw0pCgYUh0vblcn0ENE/aah4Gk4Z6Gw
	H2bLt8zmr06JtpY9KYyfH1kYgaQJS1kFRybhmtJHU6WFIG3wlyuYNeaqN7Ce9fBdvJHDlb
	88lniXb7W0obwS90lw3cTO5V5FceGY0YN3yoXEdRWfz5Plq5boQmmHs6OmzfdbthhEW33p
	5/8Uy1TW+6kKiVxEygAP6EhTO3e9wi/Md7E2FL8Yzy1fwtLpTnwqQNxg+cC8oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ctw6z2zVCPFpRDjjK/Bor9mxmqzsDUqKVIr3JUMCPTE=;
	b=wdet232463nNOwVZwYlaNoIvfOv/cO2eGPt/hDZAA+phi8f2WLHCMaofKd6ja5fSEFoxe9
	mV9EP3mCPOxd6hCw==
Date: Thu, 06 Nov 2025 11:02:27 +0100
Subject: [PATCH v5 34/34] clocksource: remove ARCH_CLOCKSOURCE_DATA
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-34-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1786;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dQYrfrH6p59kOQp8CklF/Vp09pCtZ6J6GVY/7odturY=;
 b=1Wi9mWGUpw4gouObAIh4SKslvazl7wdxf+u0FsihHL9CxGgJV9Kufo1aP1r6igMIsXWd8O+PB
 zw5j5PN1Fk0Bx4MhmZvwus8qCRYjKYfcFQLyL1yLLHUC/dfVVt3SccB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Arnd Bergmann <arnd@arndb.de>

After sparc64, there are no remaining users of ARCH_CLOCKSOURCE_DATA
and it can just be removed.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: John Stultz <jstultz@google.com>
[Thomas: drop sparc64 bits from the patch]
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/linux/clocksource.h | 6 +-----
 kernel/time/Kconfig         | 4 ----
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 65b7c41471c390463770c2da13694e58e83b84ea..12d853b1883265cb47d93e33d8370e3957e7e695 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -25,8 +25,7 @@ struct clocksource_base;
 struct clocksource;
 struct module;
 
-#if defined(CONFIG_ARCH_CLOCKSOURCE_DATA) || \
-    defined(CONFIG_GENERIC_GETTIMEOFDAY)
+#if defined(CONFIG_GENERIC_GETTIMEOFDAY)
 #include <asm/clocksource.h>
 #endif
 
@@ -106,9 +105,6 @@ struct clocksource {
 	u64			max_idle_ns;
 	u32			maxadj;
 	u32			uncertainty_margin;
-#ifdef CONFIG_ARCH_CLOCKSOURCE_DATA
-	struct arch_clocksource_data archdata;
-#endif
 	u64			max_cycles;
 	u64			max_raw_delta;
 	const char		*name;
diff --git a/kernel/time/Kconfig b/kernel/time/Kconfig
index 7c6a52f7836cef248e0949060b50baa293f446cf..fe33118770978682d0ff6c6e7990896f42703b50 100644
--- a/kernel/time/Kconfig
+++ b/kernel/time/Kconfig
@@ -9,10 +9,6 @@
 config CLOCKSOURCE_WATCHDOG
 	bool
 
-# Architecture has extra clocksource data
-config ARCH_CLOCKSOURCE_DATA
-	bool
-
 # Architecture has extra clocksource init called from registration
 config ARCH_CLOCKSOURCE_INIT
 	bool

-- 
2.51.0


