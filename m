Return-Path: <linuxppc-dev+bounces-13866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B646C3A0E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:06:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2Hmt1PBZz3fNH;
	Thu,  6 Nov 2025 21:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762423358;
	cv=none; b=cSzS/pJljGBHKqPnqrcAfnyhFRQ8BfyPT/ARmeVq9UV/KA9mkYeg3W8Yc9dEALeXIpk0uyqkEgbIRkZ7WtLUghhrL+tOGivluPhyEUYYOfiT7nzRYOvHojuDs8m27/VAgfN/VuFXMPZkfAQnggJkdKKcTVKQHmK2817BGEEPs5XOj7UuOMuSA0R+6lCzDr6TtTZghwWsxCSdD8L6GcGLxYil36hKcVo+QXNNXwXAjEvAqux3r1L5AEKlN6SQoVykaT7/UxVLP27t+Tp3Eq150ccByNvFf+Z6od2snb0DuRrbFDU1cyFFhZY62hMiNY6Dlp8YUgCNNB/5Mqu0oyGA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762423358; c=relaxed/relaxed;
	bh=VjJXMHE/nZ0JgqIfSCrtFNclnrKwtH1lYk/BfThnBk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XpAPSaMjOeWKH37rNDch4T+//+7fGQzcrgWFGAZcI6CiictaCEBNnLKCKyMzTdVRzHCq/iks2F4RnhMxpdzlrYjMGC3Vsdg1p6UNG0QALInSNenMbsLVfX5KX0u/a30RAoLidOlUO9QjO3ZV/e4LsMIKWzjzE7eA2UE95POcYDOEhZqgHg1DC/CysAqLpq5eSsF3u96MtoFyGxbacLQpPRtR11yXkTY186H9+vkUeoTGvdewLe8P3NbeR8hUXBGI4+qigfhgWzcWCJ1pWMu2Fcr+XMLYMQcIRoyc1msQkvK1LwP6NEXgZNpSj4Q4oHZPn0Z7BLhinEMJRQyrVoloag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MrCzWGLB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=97OHrgIN; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MrCzWGLB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=97OHrgIN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d2Hms3N7Yz3fMd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:02:37 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762423349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjJXMHE/nZ0JgqIfSCrtFNclnrKwtH1lYk/BfThnBk0=;
	b=MrCzWGLB0lWIu1LSOV7PEGZzY5qO4h6kdgxM8sQ+P464cvUQMfG66p7Gwm5GPvPSxzpLkC
	nmOM0yBFy/xcoQ1cY9QkjuO2gA2kOf5N9WEzg//839WZH2Nk9RPUt9hQkDj3BZI+OocJtg
	xPNG2uZwyhGTsOy7jz8Q38RJ9SzQy65nJ5IWY9JAfG1P/6FJ7hS4s7bc5cUdy4tUI+3BUj
	xWGGYL08804xu3NZQ3Kr6N9Yb0yK5PkEW5N9ZwUxVwj6JZzTM+FCBFok+gPfjGK27YAkmR
	BMyte0UKIExqEe3dRc0HHzn/5RzkQTaV1ILYv3sDugaIQSAiYvqF42KE2fj89Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762423349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VjJXMHE/nZ0JgqIfSCrtFNclnrKwtH1lYk/BfThnBk0=;
	b=97OHrgINP8T9ndtnJwjqGrhlOPrUfwm5+CbB7joJIF4im/+8DzD4RTmYgzhZnWUk/8KLmE
	nxe0T1sIShI4n3Dw==
Date: Thu, 06 Nov 2025 11:02:24 +0100
Subject: [PATCH v5 31/34] sparc64: vdso2c: Drop sym_vvar_start handling
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
Message-Id: <20251106-vdso-sparc64-generic-2-v5-31-97ff2b6542f7@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762423327; l=2109;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xwcj3q/CdIriTySoC7OX6peFSSoIsXzZXvpqY2dDPDE=;
 b=Hhn5daOJZVisGyTN/NvVhaoCDQr87SW2SzQzmBYTJUPA7K9CAYpDfc4FfkaH9b3CHzTVSr4gJ
 Ojm7TIxY+OwAeSKIQM/TV9HPLqgjzJrSZrgtkxEic1v3ACiYOlghq+l
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

After the adoption of the generic vDSO library this symbol does not exist.

The alignment invariant is now guaranteed by the generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso.h | 2 --
 arch/sparc/vdso/vdso2c.c      | 6 ------
 arch/sparc/vdso/vdso2c.h      | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index 59e79d35cd7384e2dd752e92d20bc599e38cb8b0..f08562d10215bd3e9a2d4eaa0aadc8400b40e256 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -8,8 +8,6 @@
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
-
-	long sym_vvar_start;  /* Negative offset to the vvar area */
 };
 
 #ifdef CONFIG_SPARC64
diff --git a/arch/sparc/vdso/vdso2c.c b/arch/sparc/vdso/vdso2c.c
index b97af5ec9f35c01f2a976b6213b1768b677ad231..70b14a436fe2297ab446f778ab0d43155c272421 100644
--- a/arch/sparc/vdso/vdso2c.c
+++ b/arch/sparc/vdso/vdso2c.c
@@ -58,18 +58,12 @@
 
 const char *outfilename;
 
-/* Symbols that we need in vdso2c. */
-enum {
-	sym_vvar_start,
-};
-
 struct vdso_sym {
 	const char *name;
 	int export;
 };
 
 struct vdso_sym required_syms[] = {
-	[sym_vvar_start] = {"vvar_start", 1},
 };
 
 __attribute__((format(printf, 1, 2))) __attribute__((noreturn))
diff --git a/arch/sparc/vdso/vdso2c.h b/arch/sparc/vdso/vdso2c.h
index 60d69acc748f2401156a730027fe34abfb9fb6bc..ba0794659eb5af53b8c86b24f3221a5d0b3f74ab 100644
--- a/arch/sparc/vdso/vdso2c.h
+++ b/arch/sparc/vdso/vdso2c.h
@@ -104,10 +104,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		}
 	}
 
-	/* Validate mapping addresses. */
-	if (syms[sym_vvar_start] % 8192)
-		fail("vvar_begin must be a multiple of 8192\n");
-
 	if (!name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;

-- 
2.51.0


