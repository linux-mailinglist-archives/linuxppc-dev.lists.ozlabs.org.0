Return-Path: <linuxppc-dev+bounces-13849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAF0C3A023
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:03:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmZ3tNvz3dhR;
	Thu,  6 Nov 2025 21:02:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423342;
	cv=none; b=DQIJvz4czmaSDt7W7HyYqGPKVUbRmKrs1W39lPM7fI2vYY2Mep22qBetmDifh7jX3KaflsdUWCAMxJSbfi/540Ki+gLhwk3vvmJuHho70vTnuZFz+6+07tDW2MJV7bCZoKjd62/19doD8461s9OJ0s8t/jv/egGWSCUv4kbqSblMe5+h/1zZjbk6w/yXiuCIxmsGdo2+Xu5xz7ezSrdyDBrw/PUbJEXK/ACyWA6DQqWMjo173vc18sRJNKzFMkTU6VUoIP8XipyDWC6GjHI6Mur6tjRWh/h3t1S7D0YM28lb9rQs6OuBXfbUrRfjXL2TnsJMrVThsLqLp4QsiLjO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423342; c=relaxed/relaxed;
	bh=dfNwuY9Nbo9A8Jz5YapUcUJT7RvIIqIGIu7ip/76FOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WLx+MKaCgB7t8kExz8LeJymS098PjGllJtegTDC0KiP+BxoBsPWeUEooezHZ8kKF9N4zpxe+A8L0kr8SwSxooDFqoiCsX+tTbK7HJiGuDpvR+vEBmvgsQ1rbeM4LnekscjQT4i2RX7sVCEXDba8JwxEqWBkdQpNlSlXOE2eJYzg916Bqw0uondkd5Sv4vZC8tGNmAeoKElJcfhmwo8WnVcyzVYtaUNYncqLH5wJNbabAhpPwXTEjdXwTVf+4dBDX+bVVNqaRuqLYQ8T9abBz0jcj3bY92+Zu6eofD52wgx4SRBBmfYJKG53XppECENh8rRDHU0bk3ljmDvYZKfiWXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qp3l3VYN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l5WTT4o8; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qp3l3VYN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=l5WTT4o8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmY3XLhz3dX2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:21 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfNwuY9Nbo9A8Jz5YapUcUJT7RvIIqIGIu7ip/76FOw=;
	b=qp3l3VYNka5s1nY6eDnzOvG4BsEZVzoBbsrxfkDwCfjHvYy/cVdQgyWaX/hwKzCNyKhxeC
	IWLaRz2GgmYwypKQSt6Wi/n8Se0eWsYB5V4gYoRYLjwC4jOazBDWadM84vi6vm9QMHt4X1
	UZ3gAeF4pEuJtLd7XSBJtOC7htJfBDVwTDrJGBKyByLBsGJpmwqdMhCwLhyoHwlaXRdYVs
	9ENvfTx/rK9ThPrwb/zWvkOEdN+/VEN44A/83N1eln/M5vw+e/JvEHnTcXkMn8wdYOja0y
	z9MHXzkNFFGMZTSiRM4NJGa/Ur6QRxr6y13U7LqnKkCYKycOV4nr1n/mt6RHRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dfNwuY9Nbo9A8Jz5YapUcUJT7RvIIqIGIu7ip/76FOw=;
	b=l5WTT4o8blJG4zOeiHHjP50+OheD82E7UKUeJOMOuthXCXGMrZEdjnhyqqf2V4QFxa8XyT
	LCrwDM/5KloiOeDg==
Date: Thu, 06 Nov 2025 11:02:06 +0100
Subject: [PATCH v5 13/34] vdso/helpers: Explicitly include vdso/processor.h
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-13-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=852;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=pWSgr9LF0PVimD93prkaQ1gUly1gwK+GgmvcantsbHs=;
 b=FPc0jcTkM7lq8Xc6yadEp5IxwO9p/vtzhZuFOC/A71JdPZwDstZAyXmpfOJA4TmN2dNozEnnc
 eOzFcFg6z7DCn2Se6NHdpbuY/KU0V/s1o9E8EFmrIPUUeklAyMKOzMv
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c38553c0cdf413e0030286f884d53..a1c995af4696351e55cd870c7c4211b0984fe9ab 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.51.0


