Return-Path: <linuxppc-dev+bounces-13839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC53C39FD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:02:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2HmS4kPSz3cZV;
	Thu,  6 Nov 2025 21:02:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423336;
	cv=none; b=Uhgl5i7GU8IWvGfq1NPd5mlmdIIykZhQUIZVZN2xYuKavSFzTakO5NcsSmpJVMMBJjnVLVzJDj9ig1IODHWFP8BppGWGPmLRFITdOLyLATN7STZM+b8tX58LgymxuPPa2Rxp06Pya5lFfFEc3fkguiQJoVeL31sPbIN0DAkD5M8myt3nGpD5qkpcrJXymOEXTNB/sZSi8X2m09GISGYaBVTeaYitlvrkali452oE87ibPB0AJuoTmX3qkwS77jI+xgeRE5N0CEjjOWD+ZpPv7uqByntKvVgLqZLj98qD/PSUzBI/2DQfk9vhSsGga5ttEQq3nE+54Wa/qPUDtZXTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423336; c=relaxed/relaxed;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeO5/ujiwMWULlUYosLPjTqtZ/JVAx4X4EP+ELel9Z3Oqg0P8DQIwNc/wv+x61TllguBfU9mYDe3cfFds13AwkxuV3sTy0ifS7gzn9oMSkJH5C459IlpmFGyllaRhvI5OxfZfGj4h6YWfC/+VwPuniDZInIdEJFZfFvy8FS/3sal8BbRHAKYjG36XinTisWXTgMRwpUnmS2G7foUW7/BUhnD/LKKpvapDQBvFtsLTvt1vfaCoCiXjOQsNTlkrlMlQbaIFAbYHKR8WTYoRN3J9OdeR6su4eQyNuY0W5catKqDpn9p8C1VeIOhjbgcgAtt3qKYNyoYNVoCMVK+Kvr9Mw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3DlZXeko; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UIrdcFPc; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=3DlZXeko;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=UIrdcFPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2HmR3LBWz3bs7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:15 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	b=3DlZXekoeUVgZGZq1e0UHUf4vqg+iP0Iiv49LFrZb+KA4zg2DvjCmBbDy7TMduS1Vkn+sm
	7lygfi+V6fz8N+54m323xijINmw7GRXOynR7P15ZdKKRFQ847u1yLmCtC8r3R4aOU8IDIj
	0ZPh22CZilmq3FxLKJWQhqUErxHcNi5auVzMgBWQmx5HFYseRiBmDNp6Y1OyXOouP994Ed
	9wE9yVSAipvmGt6X2/0YvMZZVkeHlkdzs7jy27JWaWJZISYo7tzdYUmRz2kmrOfQWhTDxp
	a1Vdqg37Qisa/UoIFU50Li3Fx32JB1OzFgZ1WPLKdJZM30+axxLPdLvckSyqOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vpEp5M7NzfQSiFH2jKL570Ai1wZvStN2XYEWzJ3d1nM=;
	b=UIrdcFPc8+dP8m8pKm+dgGqLTWrzmrlX406z9MxIGmXKut48R0lhhFzf3GmVV5sw2g3cha
	4xh1P9O64p472WBQ==
Date: Thu, 06 Nov 2025 11:01:54 +0100
Subject: [PATCH v5 01/34] selftests: vDSO: vdso_test_correctness: Handle
 different tv_usec types
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-1-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=1636;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xwlcFnQEXqQ5ZW5NFBVaIG/RI+shPsghmy7vrrzmGh4=;
 b=canjkzbdZHbeS1vGHhpZnqXrZGddUYcT7pedmpgnoiLPVjcEMXGH6bhQX30E0/Jm7w3U4v16Y
 uVrH006OPfNB/pUPz63LangKR6suhJTmLUPhdNvTeuwHl4NdBc19EoZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On SPARC the field tv_usec of 'struct timespec' is not a 'long int', but
only a regular int. In this case the format string is incorrect and will
trigger compiler warnings.

Avoid the warnings by casting to 'long long', similar to how it is done for
the tv_sec and what the other similar selftests are doing.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
---
 tools/testing/selftests/vDSO/vdso_test_correctness.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index da651cf53c6ca4242085de109c7fc57bd807297c..5229fcaae8194d51b2cdffdbae59f00cfaeb96dc 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -412,10 +412,10 @@ static void test_gettimeofday(void)
 		return;
 	}
 
-	printf("\t%llu.%06ld %llu.%06ld %llu.%06ld\n",
-	       (unsigned long long)start.tv_sec, start.tv_usec,
-	       (unsigned long long)vdso.tv_sec, vdso.tv_usec,
-	       (unsigned long long)end.tv_sec, end.tv_usec);
+	printf("\t%llu.%06lld %llu.%06lld %llu.%06lld\n",
+	       (unsigned long long)start.tv_sec, (long long)start.tv_usec,
+	       (unsigned long long)vdso.tv_sec, (long long)vdso.tv_usec,
+	       (unsigned long long)end.tv_sec, (long long)end.tv_usec);
 
 	if (!tv_leq(&start, &vdso) || !tv_leq(&vdso, &end)) {
 		printf("[FAIL]\tTimes are out of sequence\n");

-- 
2.51.0


