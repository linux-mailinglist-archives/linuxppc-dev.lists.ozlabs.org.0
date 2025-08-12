Return-Path: <linuxppc-dev+bounces-10851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE33EB21D53
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L7J6FRVz3dRV;
	Tue, 12 Aug 2025 15:45:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977500;
	cv=none; b=IcPEHhdO4dNylN9cJEfbgXuj7lNt6u6txSDlezobxOeyag/boEkGCeBun61iPwJXv6txunfGkqpML7Zp+/+NRdbmYK9DjzmQD04dbPMRLOg3YdddCmSmnbCfUDGQQtOwjpJO93D6UZTDXRM20ro58bx/wXvL7u3Qo6a/XS0eyNKWlu8G47d13h1nfSwEf/i8Eu9+uBZ8xvNkHJXv598CGmQlU9ISsHwe4bZdXuFr8EALR5k6ZWTml+95FH9bYB6Q123BhRdgXIg9A+zeBOdq+9Lh/UOklCJFpJJisMgYghWTpSR4xjxdYkXB0GLtIQ54jmO48wuqfJ2gF5Hm6qFchA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977500; c=relaxed/relaxed;
	bh=4Ohsn0uRwU+hqw8smnbWosllb5/RpGYnB9VEAvO1A/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A83LspqhOmlegtjgzKKbUqKGUIemQ+2khPdF9cTuJU58qNDWO24TlYwMfWgbOoWV68WuaVfd1Ay5gYRi9uFOpHstKq/1KLqxGApiEZVLhceQuPRgQGguy1DqiZ0/ngUpoHu5FQXw9MiEbUbex4Gpzddw3PlZh/knNmXmUaSVKsak9ca8ZPA/YeyL+/n24w9P1SY6R81ypMGb5Q5h9R5Sh8KfimGyyAqxf/CcSX/j7O0SIjs3mCspQkVkLP+MqXxL0NiWoc0PQHohVDFJZyzVZgUEa/I2jkt2j6gb8q7VgbEnykk70G4rF2mOR2OZDqfwBVu2RQKKL6v1WPArwxSkaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gVUd2BKN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E3zfUlZM; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=gVUd2BKN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=E3zfUlZM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L7J2WJVz3dL4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:45:00 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ohsn0uRwU+hqw8smnbWosllb5/RpGYnB9VEAvO1A/o=;
	b=gVUd2BKNRu49lqg4NSeZ4pKy2oD1HLdzTFOjP5wa3OkUArCPejQi3q6nUUr2hwWVlPH2Kd
	CpxufrleSj5IZe8RVpKM1ltFMzRJO9obwhqsMGuapaXgAqGhXqHAW1SITBjzjuIFxYogme
	VHW9rhxA7fc8nsd57iZTz0NzWxS4qCvj0HR7XdalckB95CeAtDcPREEN4EOpD8wSUEK1Fj
	JpEDuofzGC0RATmSZcEZf8c/4R+6SxzYN4hGrvSuM267wDyFyN3n0HVqzoxPKY02BuyYgJ
	Z9VulQJw/Kd9S+FCzxMpZgWlnADluI2ZtXqh+SyfPfSKvhoitMn+YWd5L9OT6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Ohsn0uRwU+hqw8smnbWosllb5/RpGYnB9VEAvO1A/o=;
	b=E3zfUlZMz5EWlnuWD04WRwJZzaIYqsb9Hq174OOh7rbwH0by1UeqdRfVLVDKyXeX8pZQ9r
	AHYbNMgU+lq97wCQ==
Date: Tue, 12 Aug 2025 07:44:37 +0200
Subject: [PATCH v4 24/24] vdso/vdsocheck: Drop the transitional kconfig
 option
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
Message-Id: <20250812-vdso-absolute-reloc-v4-24-61a8b615e5ec@linutronix.de>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1638;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XgLT+HRfIExEaxGQakA0kG9YYMgwqfszT+N1NJLYmAY=;
 b=1I1jQfDAIUdxhhr5poZTNsBtXG7kI9OeSFZyV1uG5GiskTP3f4x0XtJf5y22KDovg2SDqYoC/
 1/LS9SuRW0lC44pibDwoRDG1rIxAT00dk7cwwtQfK+pJ8Esyu7dhqf4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All users of the generic vDSO are now using the vdsocheck tool.

Remove the now unnecessary kconfig option.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/Kconfig          | 14 --------------
 lib/vdso/Makefile.include |  2 +-
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 567ac937a9c3084fd5669e1b890b667af8a2f12d..45df764b49ad62479e6456e00c053e46131936a3 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -48,17 +48,3 @@ config GENERIC_VDSO_DATA_STORE
 	bool
 	help
 	  Selected by architectures that use the generic vDSO data store.
-
-config HAVE_VDSOCHECK
-	bool
-	default y if X86
-	default y if ARM
-	default y if ARM64
-	default y if PPC
-	default y if RISCV
-	default y if LOONGARCH
-	default y if S390
-	default y if MIPS
-	help
-	  Selected for architectures that are supported by the 'vdsocheck' progam.
-	  Only transitional.
diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
index 759fe41b48f658c399f54aa7d54a3dfeb07e5c9c..a5621b1d6ab51fde3fdab6e72309d51943939860 100644
--- a/lib/vdso/Makefile.include
+++ b/lib/vdso/Makefile.include
@@ -6,7 +6,7 @@ GENERIC_VDSO_DIR := $(dir $(GENERIC_VDSO_MK_PATH))
 c-gettimeofday-$(CONFIG_GENERIC_GETTIMEOFDAY) := $(addprefix $(GENERIC_VDSO_DIR), gettimeofday.c)
 c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrandom.c)
 
-ifeq ($(CONFIG_RUST_IS_AVAILABLE)$(CONFIG_HAVE_VDSOCHECK),yy)
+ifdef CONFIG_RUST_IS_AVAILABLE
 vdsocheck := lib/vdso/check/vdsocheck
 
 $(vdsocheck): FORCE

-- 
2.50.1


