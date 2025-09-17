Return-Path: <linuxppc-dev+bounces-12315-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03555B7FAC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSF01tgz3cgP;
	Thu, 18 Sep 2025 00:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117724;
	cv=none; b=b37fjtvRjd9IuIOFvNAROHw9VkjVLwSQEtyH0RhXOCz5R9S60Cwf2bS4wjboBWiHfzB09IUFE/EpCTAY3GNbnPXaGIMzqO9YDr41ZGt9k98Azn+vE5PJFiqZCJnTCA65MqI6H0vYl/vJCnXdO5FHT8zV34gfTUW1AVi35AiAJHr04rEXmYcGwfA8wiHMKS5FpWRgZtEDATyVvr/jVO6vTE9Z0iE+JbOeID+gnj3fEfJ4w0zmq6FIioePlakECqehqNlO6iiFY7mgWcKaFVORzmZDqdSAz+UeAZEeqtYL+AWOWZ2qZf/w2RCXFbFhQ7vmqA+oNSEMI3wtJ6eyltX/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117724; c=relaxed/relaxed;
	bh=47T7iPdNirqM8qlRGkGZpaT1NEQpHCYbOewUqaEAnV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FCKc5zcnqz8ZCqYigSU8WwNqN1mj7sCUn9PIihgbq/+1VMu4mGmHY9My0LeajcyHonfz9r94R4pvhgMK0Qschd2NzF3QO0IEh7vPyHRF+C0aOlIDQKSx2Bc6LwrVxYDJNjgQo+K8W7g7IMr8gb5BhOFmLdZN0Xu0sQTQFtWqGxY36ff0MzZnwuRUN+h9kwXYTCh2B/xMr1EKbyV4Hoqv8/DCJ/aow5jGMyaB5oNWcyO0FrNG78A6QYoVezZGEWHEKFAWcv33xfIhsyTVc+scUhrXmQ8F6aifLzhwl4qWAMAc+a1HHOiE+EKjMzsdQIxM2eCPMxs5lOEQY4aDZ9mK4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ooikjw7v; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NqZ0MGBv; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Ooikjw7v;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NqZ0MGBv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSD10j5z2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:04 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47T7iPdNirqM8qlRGkGZpaT1NEQpHCYbOewUqaEAnV0=;
	b=Ooikjw7vHFP4Lyvc7mB5kwRxAU0TCqEny1UYbkUqvHAVubO3/gyuJr5mPOQW3NldOXFtwB
	Qe3iE2fu1Umv8RohUYFvudq8YJI24M7TjJcJwj0ddNnVR14jvQhiKSfxG5ubmzEtwfssR8
	nRzOigzYo7/WV8tnBD6wMF1TgMqjuDkNEBKf4zi6A6jElV54HYWL5Aod9tWCCPSH6P3STE
	v8YojwZflKuJIXnzC0Tbza5p72ZYtjYhxbrBfFanpNJIU1Puv8IfASRj3TPCJUrnNuFFzt
	LcFPtpRTFg6Bh+6KqizrJQ8zaxCfDFYTPNqIG8oPQwjDRa0oE43tt1GyuBIRsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47T7iPdNirqM8qlRGkGZpaT1NEQpHCYbOewUqaEAnV0=;
	b=NqZ0MGBv17X+406JgKcC/o0DZ0E3y/RxgwoCHb7EPKPLSvsSbr5OSQdAUwL+9GPndm2/Mn
	hIroOyypd1HB/rAg==
Date: Wed, 17 Sep 2025 16:00:10 +0200
Subject: [PATCH v3 08/36] LoongArch: vDSO: Explicitly include
 asm/vdso/vdso.h
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-8-3679b1bc8ee8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1286;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Y3yJwigyjXG9eLqxWap+JSlo/zpUIEZhYBbJcRrDjAU=;
 b=+Rtz7ZfiUi2i3l5LnnVEFFH7JWPxcJ2s4X4OO9Lt2vve+w0mdy7yiqIVyoga5HaAUpKLgWp63
 3HbT8v0VosfCBlTAzZ0uQvjzvEaGtDA9laaUkFvFVjt7g9CriCs7tEM
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The usage of 'struct old_timespec32' requires asm/vdso/vdso.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/kernel/process.c | 1 +
 arch/loongarch/kernel/vdso.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 3582f591bab286c30127e715c47d485f74d5e2ca..49f1c7d7c458848abd588ff4c0485fb1fa8a3fdf 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 7b888d9085a014062c82cf129892fa668d8c1a3d..b196d6e8c9ff48864d56f12d925c8e91d6210ee1 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 #include <vdso/datapage.h>

-- 
2.51.0


