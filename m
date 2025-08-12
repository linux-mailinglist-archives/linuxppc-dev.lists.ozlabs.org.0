Return-Path: <linuxppc-dev+bounces-10845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EBDB21D45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:47:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L795fjjz3dLQ;
	Tue, 12 Aug 2025 15:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977493;
	cv=none; b=i9uYXixnEUJBm6mjOWmdO+9FO+v7rYOrkGoEqkc0+Xb/iMpllT8UaKJiiqLSCfHz866ZO1AKzHad/4xb8IBWQAj2nmvnr3p4xBlBqT/duXBA8cxdyC5KuZZoRGd7td2pOVB6M/AxJob3lJW078b6o4GI7giLS5J9jNU3MJqmI407JcFi5WaBts1fPiWW/dD7RScbGNtqYxJLGxYA6v2pfEzpOPYjKt82+yylrJrjSnITlCp8hb0PaxWbzegXGp+H70frFszazA3Z74KRQyjdJsHxcf+/gm4JA46vw/gGYf/9krAB4VVHWmBXMQNkPAJXX4AfqKwEs/6GDhMkQXeC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977493; c=relaxed/relaxed;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtLOAlSzfPfBnDMoPyxfGtifbvN5yLZ8/cniERyr8V4XOfnHr2Zay4K8mKPeo5BuKZ4fZ1fJSKwW7+wsEKxxYIneilgMzVliEUqZhmhfHs6E3qqyT9BWmlOYq4nKOeT2sQHYutgQTQCgmQzdKAcBRRcJPfp/kSwbMxzOMk8FQ9pRKFtTsChIZeHsjpLMg3OPsK+VhF1x5sHoQyPE4k1O1pfKkbH5pbhD2iXa1qPBwLcUSZUJstNf+Q6WW2GU8CzQIEANAwIU/m80D7iB89dP0MLyh7YSdJ61Hs/eidhefld5gHpP87fMRfkHPVeANchUIwrOrkgmn2wtdXyvrhG1UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4R7GK1Ns; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k3fJ6hiV; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=4R7GK1Ns;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k3fJ6hiV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L791Tg1z3dL4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:53 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=;
	b=4R7GK1Ns/hWx6TZIMnggUIdGxwNwFjzJWNFPxFs848dnDyWhFTvY+RMOmyP5Kp+tWOTxnw
	FMlWKazRs5aP80wuH+qVWYytZv2LPeT/htFzHm3zzQzRpZoSuglfAWCyLaRWo1xXJK3mze
	/EDXe9OX84IGqHKBu9Lj8PeaIAKiz3QONIRgJL07IsxQop3aVJVwOfvc4DfnQsvz9hR/K9
	FJWfI4Bec2VKnqy05LcEGQbq/VuFg76FAL/nGbNsK+Zp7Tb5Sn4jo6tXggcHjI+ruiVkZe
	efTuVKXLYnIxrPThzovEFcWF7aLKC9SRppWxAoQoH2kdV9cj8m1DRyvh4j321Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yt/Xm1UMfOhB+4hjRHAkXu2RVWCfW0hAXkjRskrMp90=;
	b=k3fJ6hiVMh2JFiv+1qKUzRxGonhn1sC95oifI2QM636AD1C5COlMeHHYVWR9m5qnrDzCl0
	WQQ3zD4hOmEYiUCA==
Date: Tue, 12 Aug 2025 07:44:31 +0200
Subject: [PATCH v4 18/24] riscv: vdso: Disable LTO for the vDSO
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
Message-Id: <20250812-vdso-absolute-reloc-v4-18-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=1406;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=SOEunbiKKKTnOWrF+pK81yxcp7tmWh1LCgMbmBwYcqE=;
 b=1Yj/TLz9zqgfdJG4tPNUhVnU/LPFKndOYqYO2YKY3GvxdtS2InB9rllJGVyVAVRovcYvZjFXM
 1mmMqVL3+dfBRWzstw5hka5H6IK1HeBJJp4KVZMkpgRQSb3KON+DLoI
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All the other architectures supporting LTO (x86, arm64, loongarch) do not
use it for the vDSO.

Its is problematic for some upcoming compile-time validation of the
generated object code.
The LTO object files do not contain the necessary relocation information
and -flto-fat-objects is not compatible with clang < 16.

For consistency and to enable the mentioned compile-time checks,
disable LTO for the vDSO.
The vDSO heavily uses __always_inline anyways.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Jan Stancek <jstancek@redhat.com>
---
 arch/riscv/kernel/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c19c3c76f7c9f6b2f7523a59269de3b683656323..9f1bf5bae9bd473e43d9fd3022e9e1a185128b73 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -49,7 +49,7 @@ CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
 endif
 
 # Disable -pg to prevent insert call site
-CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS)
+CFLAGS_REMOVE_VDSO = $(CC_FLAGS_FTRACE) $(CC_FLAGS_SCS) $(CC_FLAGS_LTO)
 CFLAGS_REMOVE_vgettimeofday.o = $(CFLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_getrandom.o = $(CFLAGS_REMOVE_VDSO)
 CFLAGS_REMOVE_hwprobe.o = $(CFLAGS_REMOVE_VDSO)

-- 
2.50.1


