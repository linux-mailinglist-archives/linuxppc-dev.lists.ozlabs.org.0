Return-Path: <linuxppc-dev+bounces-12331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2955B7FB69
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Sep 2025 16:05:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cRgSR5Cldz3dLd;
	Thu, 18 Sep 2025 00:02:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758117735;
	cv=none; b=O43chcF24JzeAwtxGJ2WlfiHinN+dibDP4HTz1XeathhFYUABFF6z3nPFBGCTpOvXVfH54xb52OSHI+Uk9itekcuG3VjR10gWNXm+UycI9LJXJ1fu6SqsjesW2ajZwueBOWAlanbtVjos2NDsmFAyGoAOpHpN3SPAELyKUCBNStyuoN9+8E8XW3iH+pJWtNiNG8CXbVMzYSF1oZ/b6Y7mOrZ3O3ZZgnssEhG8FfAS/0Tq/PaOTA9nNMeI08070FCvl1cX3IDTAMwy4HLVpEXSPdGZ2QjxYHZxMxx9w3mEGF1GQ7vqnnzIQTlLeWtjdZQGsVAJEdziSljqnitB+En2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758117735; c=relaxed/relaxed;
	bh=tEnEiqv8MrBrNggtOru79S+HEO6OQ8LMpOXpkEewXe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2WbJ1kse5VFloYInmZguSeCNudKZNWKUBjvCqAwo9P5QCOsybPjc1+2xQrQn8P4m56pmxI7lwKkql3f16bfRKc65KVb6qXnYa/ZkMOEjGVK9rRcqBY+mPY1BsMZvZ4NkArmPkQBLz6pWSVnVb5K3drN5N8IdA4CIUMm2vqAIW/ZFOyvozddIwwecu2NB/6Gk6aKM+QpZkvroGKCJHV3NLo7JFAiYkj4awG4GeFymNPcVwbwO8cvdFiwKypQzFJRKLdXeTyRmJGSiYKA2m/lDlXwkEy2KobNg2srRixqCnWFL8IHtIC7qMY0nac4mmmP8pXqy4eRuXqjMFdCVibhyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DBLCKt/k; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oV6NLZvV; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DBLCKt/k;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=oV6NLZvV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4cRgSR1NNdz3dKn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 00:02:15 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tEnEiqv8MrBrNggtOru79S+HEO6OQ8LMpOXpkEewXe0=;
	b=DBLCKt/k3dS7BWaT5fIk4eZieaA31cI16K7p+8qtu3RmYKOnJeteUFFhu1yS9VLEcYZYA1
	zCWIv1MfoKxFmtsyDueA4/CKVv/HWmWFqZFlRG3hUIPMtBjw9WdbZgZWAHMqYzrMfaLIe+
	KMNk2p6icqp7LniuzHYciSb80iTtdydkyj6xxHeGSP9KCCfUrk3Sy9zg+fI4gLOdIigzty
	fnSwVnZz8324Z3y6fRBfRlfIXnx69sE1pC0+yqc2TB7AIZVqeNTQhEFvynXWdjUzAne/Xr
	4ME+kTaZFOBFWlGldxm+smIH/rL5N4V5ZJ+d0mZchftJYEnAFmZfW4s4uCvr1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tEnEiqv8MrBrNggtOru79S+HEO6OQ8LMpOXpkEewXe0=;
	b=oV6NLZvVqW8nysBOg+Qtw63QqZ2f9SBNmWkvaz+/eBtuJk4wJZTfl3foKC/jZ//jZJC2rp
	VEjq1L1LjmBYfFCw==
Date: Wed, 17 Sep 2025 16:00:27 +0200
Subject: [PATCH v3 25/36] sparc64: vdso: Link with -z noexecstack
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
Message-Id: <20250917-vdso-sparc64-generic-2-v3-25-3679b1bc8ee8@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758117712; l=1408;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=4jrKaNatrlS2U1eS/SPq1jK5+LqX9GNesaZnhV/t5C0=;
 b=5D05C1PiiGthWjXxTYFQYwCCXf051B2LPHkCKwscOyPOGzDY7E0en5oVCQyH1EGSdrZtKSAfX
 Bpy13R+3cWRCq0TqGfhLp7V37YgMsBK3+t2He9rMtxoApwdaVoHWWie
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The vDSO stack does not need to be executable. Prevent the linker from
creating executable. For more background see commit ffcf9c5700e4 ("x86:
link vdso and boot with -z noexecstack --no-warn-rwx-segments").

Also prevent the following warning from the linker:
sparc64-linux-ld: warning: arch/sparc/vdso/vdso-note.o: missing .note.GNU-stack section implies executable stack
sparc64-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
Fixes: 9a08862a5d2e ("vDSO for sparc")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 1a4e585c91d7d03d8444cc2e4914fd10cd078fb8..2e911ccc9db71b2888ffc432d75ac8815ecce0f7 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -107,4 +107,4 @@ quiet_cmd_vdso = VDSO    $@
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^)
 
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic --no-undefined
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic --no-undefined -z noexecstack

-- 
2.51.0


