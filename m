Return-Path: <linuxppc-dev+bounces-4986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39786A09517
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:24:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56C6vG3z3cYF;
	Sat, 11 Jan 2025 02:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522643;
	cv=none; b=bVPwLOCgVE+ovPFQ8Vg3O1tlRTQjn3TBhgUBRH3R6LkcyXAIfr9pNR9DGTAtm3UBFBFJ4TvLC1Fi4yDp+tV7ZORN2kSHXt784E7HjbsQqlLoi5fFivSfglj0RdTq9gtkN6YxvlXVaP9VC9jf+RgzK6ARgr/Jd2Ln1fwtQGwJWaKzyckAu/odOC8+es129OmjSrstUG13znQFadvHSslVZhB7o5z6yG6M07V8/TLsHf0AQBFgoAWGtCVaayJJ1X+6NVTRFJnhl0CWN16ZeXViHmayuzDRKwRV7MLGGD9iHNMSTTMP+TfdcyMwNcJfBMafsfe1kBgb3mRDQpIKGqlWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522643; c=relaxed/relaxed;
	bh=m8WMREGn25yHDxjslQs6BSfPQl6yYZiTZxD40yaQegk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BU5LqSU5UGrkGXt+dOAgt6Blkye5beMMBpJtpDhoUY3eNO2cbbb/D7JogiZniQtgEHYCuknDLio/joqMwz/XDIK5CS5kaB9tj0yDk4taFP2h6GLaSCKJnVBAeIDrkPp4fW1jYZdo90bI3TnTHwJnDaoudr83TWgokzNM1KHP+effp3kV93iZmkLbPMXqDjtNmKICAOeWPj8nLLeT82EcHzV0d6Mn3rK5F7F6SyBKF2Smk1xbB3BknaYMRUt2BkLawzNa0bsn5HifoAMvW5KTm9t8VwVMPhsf6QjtJx74hHs5B1eFq7/oc4KeWM9SIR/kXX+UR+JdrnvlncwcVC3oQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a+goen3N; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VrsdI0xa; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=a+goen3N;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VrsdI0xa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV5696whCz3cWd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8WMREGn25yHDxjslQs6BSfPQl6yYZiTZxD40yaQegk=;
	b=a+goen3NDiuCNKk5VbX3LQa22tPTwZ9pyLz0z0AJQekT9hJt7Kp+JILBXlY+iG1ZrSfvLm
	FzEtqMn4JZHJsMhYqsp4HFWRJww59PGPQNbQGqQuU4YcuNX6lREpFMeQABxTlVhxOJIYrE
	ha0mRMpDq0SDah0jHrxVicTaMPRqjs5fcRY8BXV/9ATocwcppxfOfZkYbuDoykhMnpjCJd
	c9b90u5HsvOxVVnSVK+Lu8PDDj3dp2S86/kYxVdgYZx1jpIvSawZEBR8e4/ua/ez91PqYK
	YlY5hUMeN1nqf/Ly77inJipzg7dPunuwLbLpKCfGR+dgSh1ovFGXw6UeRfFt2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m8WMREGn25yHDxjslQs6BSfPQl6yYZiTZxD40yaQegk=;
	b=VrsdI0xaM5xuvKtuexXVthnAMHSitk7pfv+V1eqF8Vf6ccPhLyMAALcBuwUglFfjl1lNaH
	fW8oMiNd7SH+XYDw==
Date: Fri, 10 Jan 2025 16:23:43 +0100
Subject: [PATCH v2 04/18] vdso: Rename included Makefile
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250110-vdso-store-rng-v2-4-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=8178;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=gZhdZKZMoTNYw2pU5X/col/8fSI23OaoBKYviSpwdkc=;
 b=ODVXUd6Lizh5S/6TjK63XF+ODf/7JeimxbvXYWGSRshLJsTds1xNhm8TpWL/t/ZVv9j9SJbMi
 X7NxIcJ5MuNB2xAJfxm4nj0l4UsuJeYAIO9rhaOZVogrMQ7djaKOADr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As the Makefile is included into other Makefiles it can not be used to
define objects to be built from the current source directory.
However the generic datastore will introduce such a local source file.
Rename the included Makefile so it is clear how it is to be used and to
make room for a regular Makefile in lib/vdso/.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/vdso/Makefile                  | 2 +-
 arch/arm64/kernel/vdso/Makefile         | 2 +-
 arch/arm64/kernel/vdso32/Makefile       | 2 +-
 arch/csky/kernel/vdso/Makefile          | 2 +-
 arch/loongarch/vdso/Makefile            | 2 +-
 arch/mips/vdso/Makefile                 | 2 +-
 arch/parisc/kernel/vdso32/Makefile      | 2 +-
 arch/parisc/kernel/vdso64/Makefile      | 2 +-
 arch/powerpc/kernel/vdso/Makefile       | 2 +-
 arch/riscv/kernel/vdso/Makefile         | 2 +-
 arch/s390/kernel/vdso32/Makefile        | 2 +-
 arch/s390/kernel/vdso64/Makefile        | 2 +-
 arch/x86/entry/vdso/Makefile            | 2 +-
 lib/vdso/{Makefile => Makefile.include} | 0
 14 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index 8a306bbec4a0c4d4b6580fe88187faf9f5422eed..cb044bfd145d10b5bf840d31900aefc8a187e5bd 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 hostprogs := vdsomunge
 
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 35685c0360441ddb0e549ff0abe39cf4fce64071..5e27e46aa49674bb4d2186bcba548aa841116fa9 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -7,7 +7,7 @@
 #
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 25a2cb6317f3592179dded21218e81036a8f67bc..f2dfdc7dc8185bc045907283b68ab18fed980312 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,7 +3,7 @@
 # Makefile for vdso32
 #
 
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 069ef0b17fe5235918a6aa13aa120857bbbf3faf..a3042287a0707a9aa5d512441311c3deffff2ceb 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Symbols present in the vdso
 vdso-syms  += rt_sigreturn
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index fdde1bcd4e2663bd400dcc6becc4261b7d5dce3a..1c26147aff7018d190c49aebf6012f6780770dd2 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -2,7 +2,7 @@
 # Objects to go into the VDSO.
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o vgetrandom.o \
               vgetrandom-chacha.o sigreturn.o
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index b289b2c1b2946057c29cde8ee456b311fa25d448..fb4c493aaffa904d51f68b483ab83256a2e358e4 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -2,7 +2,7 @@
 # Objects to go into the VDSO.
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
 
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 2b36d25ada6e3f2d259cb0a364dcaa07570cf7c4..e2f7c4140decca5e7a3a7c5d3e2c3cf61f92a5cb 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -1,5 +1,5 @@
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 KCOV_INSTRUMENT := n
 
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso64/Makefile
index bd87bd6a6659d3af91d599d356cc48a7248c5282..35d5ee4c43ba3102942f86b043d5fa66e1e11f95 100644
--- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -1,5 +1,5 @@
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 KCOV_INSTRUMENT := n
 
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 0e3ed6fb199fff7ad25aadca76e3a49a283b3f94..e8824f93332610db259b303c63957436bfef4191 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -3,7 +3,7 @@
 # List of files in the vdso, has to be asm only for now
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
 obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o note-64.o getcpu-64.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9a1b555e87331fb288eff12470ad498199d7cf24..ad73607abc2808af2cd1aaf839b227c78d7a1769 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -2,7 +2,7 @@
 # Copied from arch/tile/kernel/vdso/Makefile
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
 ifdef CONFIG_64BIT
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 2c5afb88d298263a70abbe1e4f903a95c0389225..1e4ddd1a683ff84492f0f4b48d0efa00688129c2 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -2,7 +2,7 @@
 # List of files in the vdso
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 obj-vdso32 = vdso_user_wrapper-32.o note-32.o
 
 # Build rules
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index 37bb4b761229759b068797c4584bbb5ae2fad314..64d734c7fa5949796028f91528a63ee52d676eb5 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -2,7 +2,7 @@
 # List of files in the vdso
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 obj-vdso64 = vdso_user_wrapper.o note.o vgetrandom-chacha.o
 obj-cvdso64 = vdso64_generic.o getcpu.o vgetrandom.o
 VDSO_CFLAGS_REMOVE := -pg $(CC_FLAGS_FTRACE) $(CC_FLAGS_EXPOLINE) $(CC_FLAGS_CHECK_STACK)
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index c9216ac4fb1eb8c1e5bc5e33b41e9e40c7924cbf..1c0072336e66177453f8bbad743c6a2ee1f1849d 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -4,7 +4,7 @@
 #
 
 # Include the generic Makefile to check the built vDSO:
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)/lib/vdso/Makefile.include
 
 # Files to link into the vDSO:
 vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o vgetrandom.o vgetrandom-chacha.o
diff --git a/lib/vdso/Makefile b/lib/vdso/Makefile.include
similarity index 100%
rename from lib/vdso/Makefile
rename to lib/vdso/Makefile.include

-- 
2.47.1


