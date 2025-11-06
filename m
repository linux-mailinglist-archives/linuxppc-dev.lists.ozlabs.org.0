Return-Path: <linuxppc-dev+bounces-13851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2CFC3A03B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmb3YtSz3f1C;
	Thu,  6 Nov 2025 21:02:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423343;
	cv=none; b=CnheZjI20aioW/WKqAcLZ63p9f5OV92fXQ9BbzL6ZzsdRTtKj3c3Avvo47dTJtMmz7mwGh6YSAAWxIEJo4xTebjU0FvFsd7TPDwyCK6yj+U/ijPUFb79CidIz453Pv1HF4RIUV+0E012D3FWVg0CFfdrotbZAlESWjLnnQkwXKnBEXVrlHqi6v0wdJxY4tymLVoIIBlzjBb7bKeCgS7EYC79Bir7ujk3rCAtrBsWgvnnmZX6CSCT0yq1rQ/jLk3OubtlLVOU3uCLvp2wv1vt12kq3lLwc5oN8XGeYgxq135zmPgUVMKplNJnqEvZLBRnVRMhFkj5MXuTeIMqyZ+80A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423343; c=relaxed/relaxed;
	bh=FHcQizXKIlU8rlwocB6TkeD1z+OIKxCXmz4FFDxeMJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OL+4mBwbQOkLPa3MqQqaDtXYYkvCW4AIVoFXVqKF4BNP5e5Vy17Yd3q1LLanUJ5zAoahcbGjbHx1i3XpCHScU5w40/wFtE8kQvbTZryrEQOgTU8BEXohKyixQU0zhKrrWkAe9v3yBtcpaDYPw1r14B6nWvmRkVZ8dvLuXMNdbExARhHUbEePKPfImFP3o2uMFfnV+zdhHz+WHO7bjwIexCyOeLFzrEYUUjOCFFeI6hgV0mbSL9sEIN5KksCoHBgJFv8oTECfv2VFiZ/SyVQ+ILFwxl2LEn9SIYAtKaIJX9C5d//MJ2Hmv36IYNBmCUIzrC4HuJwfLTb3ZX5dG4YNcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=adlixGJR; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cRbVY1Tm; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=adlixGJR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cRbVY1Tm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmZ4MPMz3dnN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:22 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHcQizXKIlU8rlwocB6TkeD1z+OIKxCXmz4FFDxeMJA=;
	b=adlixGJR4IldiRTbGD7/4BRp4OcSYWtdeSNrF85Vq87eF/Mlbnksmyg1Genmxrogv1bLDd
	ILIhBtMhLd1SqzqXtSms4razZg0WZxllN5xn7z6qltWk8fGA85MK8gSfC7IQhwg/FDYBGU
	gvEWAGygNEspZH4+Au5xEc/rwdPd0iWCf9xROjqWzuzlBsgwJOu+zHWFBpZq/xRcM3vS7L
	cRRQxY1KS1Ue5FLb2irZvFGclP4JbWOBwRGJsaP2LXmr2+NDuceRigCW6HNMYlO3KoNdnp
	cNwlUM+8Adsi135pCZ7T2XwJL1X6t7qnSywCEIcENEWE8HeqPX8vTLw4R8dLuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FHcQizXKIlU8rlwocB6TkeD1z+OIKxCXmz4FFDxeMJA=;
	b=cRbVY1TmRvc4UXwlz4ukHwV/bbbjLtb8qIdQUfjzQTDyML/5UxZCx4EYE7iSplduoKKrwY
	Kk1AnhY5CxkBHBCg==
Date: Thu, 06 Nov 2025 11:02:08 +0100
Subject: [PATCH v5 15/34] vdso/datapage: Trim down unnecessary includes
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-15-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1543;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=u5qksLE0CkeBqNMjOIpIJvowjU2FK+BsJIgAtLa3Fdo=;
 b=UC+kTtENPldSam5U22tKiHqhjB/6T+TDdaVD5UtltV6ZO8FyvrKwnhXnREIRJiKG1XwM+tcmX
 lIjJsRq1FLoDiX/jCCbyL+92WWiM9//+Y5YZp4L9lJEacbdtVVkH2I4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

vdso/datapage.h includes a lot of headers which are not strictly necessary.
Some of those headers include architecture-specific vDSO headers which
prevent the usage of vdso/datapage.h in kernel code on architectures
without an vDSO. This would be useful however to write generic code using
IS_ENABLED(), for example in drivers/char/random.c.

Remove the unnecessary includes.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/vdso/datapage.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 752856b36a3abf82b849451e5d5233b1067b86f2..9021b9580be229b2001dd17bfbdc236ebda1cee7 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -4,24 +4,16 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler.h>
+#include <linux/types.h>
+
 #include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
-#include <uapi/linux/types.h>
-#include <uapi/asm-generic/errno-base.h>
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/cache.h>
-#include <vdso/clocksource.h>
-#include <vdso/ktime.h>
-#include <vdso/limits.h>
-#include <vdso/math64.h>
 #include <vdso/page.h>
-#include <vdso/processor.h>
 #include <vdso/time.h>
-#include <vdso/time32.h>
-#include <vdso/time64.h>
 
 #ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
 #include <asm/vdso/time_data.h>

-- 
2.51.0


