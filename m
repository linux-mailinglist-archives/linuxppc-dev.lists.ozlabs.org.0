Return-Path: <linuxppc-dev+bounces-13842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D05C39FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:02:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmW1JZ0z3dVC;
	Thu,  6 Nov 2025 21:02:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423338;
	cv=none; b=f3iCDWqkjjhJEH9JFBZLRBFoRZnfNao0SqVKzqMHW9CApt5D1+PU1DGZYKatRwXojpmUwfGvzjbpkMXMnfXYnJIqRmM5LShebqQwjaBWCz2RVRtiymIxg03cgTVxNcZJn//HTrH4BFwO4kPwoXrQDIi5zZyqELmljKsbNcwxkc+T4SpwwBSzSREK0l9B6VplG7cNCvqI/UYZ5pxx3ZQEwmiSivZd3n5DLNRdfNjnjRJZRqGejdENXWDXaDLbkXA2+Fz464g6+G2AFPkKl3gbzB5nO4FO3iBuAejCtqym5DwskHa9ZR9OFtrJjanWKeVBCBqOl7eZPw//6ANPFtePTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423338; c=relaxed/relaxed;
	bh=sUA+HXM2fIAbf0Dw3N5ucsyoMleN+ru8RCOZqiFNuVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vs6Hz+aqfmwgxsMFUR0nOm/Z/ndUf7b+eoN1LcFHunAvKKQ2/Vz6nolXwDFlA8q0jxRaIMSzG1/9xk/sRD+9rB7hO1GSz3oTln6mAu0LA6YQK0NvpGZBYvArEQyv8gVggJmN0bs4cwwDrMVpr1YdvGe7nBS3kEXj5Y20p5XYGAKXUX5XmGQ9H+gS48XQX1rL4mtHj/ZGt5PO+9kXOJ3ken8sMV4LfXFPEeydBrBUon9QAlkkIeBxZZMwrCmjP3NHkR3aZwaxQq/6ypupZmC31OY7mVH2RprjUPtXvdeyTvJOwTyW9y1Lb65NKF/4pxoIuR4VzroppS7KlkIrhYltrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XpWHcB7B; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nX1p2/hc; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XpWHcB7B;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nX1p2/hc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmV178Tz3dTs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:18 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUA+HXM2fIAbf0Dw3N5ucsyoMleN+ru8RCOZqiFNuVs=;
	b=XpWHcB7Bd+lGXJcotDgXeoq83f1a7nLqpvpI7dfk9M/Cp4ZtDUkeVZ657AlkeSmGVNLve2
	pivb8tZYzdzEUbCqSyrUp0/t5EhEaSV7FlPEfZIGrzD9MKVCZzSR6TKyvMiW245wAqz+uI
	csL6V/itp73nRtlbrmz7Yc9xsbeGsVW+cALBvBJPsj1gzp+E/NVfw8/PEQyttpKiA9BSVq
	96Bry5Hske8SyXdh3efUbK3qGnNRMUq9oeQq4dY/Yt3urNmQ2P0dPbYDtTnCgsiL06w4WB
	aiC5VLKH+e0710UDD+HNKca9yJMVuNScveDAhwB5b81J10hBvcGK2GHii+LMrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUA+HXM2fIAbf0Dw3N5ucsyoMleN+ru8RCOZqiFNuVs=;
	b=nX1p2/hc2xczs46SriosMFRR4WogaIor5NAb3ifZJbRu0tt4XO1qOFXPY5P2xXUunFX1vE
	8uTLPCsMHbydtrBQ==
Date: Thu, 06 Nov 2025 11:01:59 +0100
Subject: [PATCH v5 06/34] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-6-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1014;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6Tvlz7YTVVumh7b8245ahLshfSVp1NektvW47mEcH2M=;
 b=0oq7v1NBg4xiNNGgh7hWI9tGCtfy9A8PUCFEHWN7bHKagSn4ZV8Xf61tYWIY3YBFBURCKmi/6
 m3hRqg01HXmDPz/86zOc4WFFtan+8FAqbVuApgAxXfd6T3EqPxFJWcn
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index ab3df12c8d947ed3a5b0b173567ca8469afbf2d6..b2f0e971076acaea8bc70107fc0f5b2d23e0b312 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.51.0


