Return-Path: <linuxppc-dev+bounces-10843-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F3B21D41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:46:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L773wJXz3dL7;
	Tue, 12 Aug 2025 15:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977491;
	cv=none; b=oh1LDut/t/Oi86aDIiJ1waYNKsZeoLtxmdwC4lvjaEJ3MInYyvzGeQvK8g2ZAKJewiEINlyLtegB8g18yEEJHSSFgqe/zXzcpIvuh8HVaCCBJ+ka+h2h6LSC5uTiS4t0AGHUDaS4tdK93skR8p5j8LN6vRFDLLleFaNcawtHKt7WGA2E6AfqK2qhLw5wM3Vi2E72jLB+Vd7BuJLtoyeyD06/S/mkBYP5OhyweSX+YHxrk+mgYKzJjD4KhTnf4SQR7nHA4OJqNDrTsF5d+EMLIdhuzTxy4aE9y0hOqUzYYPbbHf8+p3L/G6G5UwApCyzjikjtTb7AiIvFrmB0UcmTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977491; c=relaxed/relaxed;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NiQX8tbI0lxr2DeqsGWd1tuCQz3yUuT661puqMmc7whOwdLDsLzl3JXg2fkCgmkh3I17YXzF2qbe8Y1+GRbSItj51oGqVWq5x0IOvtLdZz6PkOqXPopeecwvHbFr3x8WtEk+eDRF38wpenO3UJaZ6SkqYJuR6EldFIhMhw7lYjH4YnKIphj7yFAgWH6fJVzhO4fVikYLP6OtnLvwenuyEmoZgWO39mnGAQNSrMMVuOuLq8k9prOjbJm6kUyVEcT+OQpLzNnMhpUF9PARW9s9Aqls7BH23IpRZDLvXWeaX+WQ8Rw80SiPSR7w1GIkbhE67BsqkfznLTyYJe48Q6R1cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=F22xZcK2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CIvDa3NH; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=F22xZcK2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=CIvDa3NH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L765x27z3dKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:50 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=;
	b=F22xZcK20TXBf5jZYwevz3QDaZU3UZdkYRKPWY6C4m9SOtAW/94DLHjYy+CQODOajcbuP8
	MPuKnXuduuI/jhqsirbr4WDRq0UCEwLS9ico7i3W51ZwBK//QX5U/DFAfzE1ZfWMKRv1fo
	U204HMGXOXouMg9NvdzgNnQ3u5xAm7roz2wc8MIoolSJvm4oYaWLKrkRHYueW7rKS1NB1M
	M66TWmw08jIG99a4Abb4Ty+uqba/s3TVFyhenXOKgI+lnOHn0VOL47w8Nbea7L7Aa9lbbq
	qDIyaw6x+h/5wdjGBDsWrXJDjrCbuIbIvo6NedGG2NbzD7A6pnHseaNfqod0Fg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8J7TMiJJPZpKeE1Ou1BERsW/DWLgHHFhkRd6+bQxh4o=;
	b=CIvDa3NH3jry3aeRacozBMFDrQSzLfZ5hYqcOa0ZRn/0gu5GgdotOJzL+xdQny7o5u5pZT
	TOIV6QFRAgoN9fCw==
Date: Tue, 12 Aug 2025 07:44:29 +0200
Subject: [PATCH v4 16/24] powerpc/vdso: Enable the vdsocheck tool
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
Message-Id: <20250812-vdso-absolute-reloc-v4-16-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3422;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=r7UGwjKWy5Zeb3xhIIrMh9pf0ciHc2+w+MWcQSjDNGA=;
 b=Q0EZvSWT3Q75vpmTxwYRVjiyR2O2xw9tAfm1kD1FblKw0cRCQJd0iAfyLt/+gYR+ZyTVxexIt
 TIIS6p5vayTD8+ve2mOSceJuJpTEl1kRVjS440cBUU/8+/7OHdQGucC
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The vdsocheck tool validates the object files and final .so library.
It can detect if the compiler created relocations which are incompatible
with the vDSO which need to be worked around.

Wire it up for the architecture.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/kernel/vdso/Makefile |  4 ++--
 lib/vdso/Kconfig                  |  1 +
 lib/vdso/check/vdsocheck.rs       | 25 +++++++++++++++++++++++++
 3 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 8834dfe9d72796c8f1e20b84ebcb33a6b74b82f0..193af6877eba25898aeaf55a04cd834f7a2eb753 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -75,9 +75,9 @@ targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday-32.o $(obj)/vgetrandom-32.o $(obj)/crtsavres-32.o $(vdsocheck) FORCE
 	$(call if_changed,vdso32ld_and_check)
-$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday-64.o $(obj)/vgetrandom-64.o $(vdsocheck) FORCE
 	$(call if_changed,vdso64ld_and_check)
 
 # assembly rules for the .S files
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 3037b15476bb60ee47c1e083eae3968ab9604f59..8994419d90e7b5c66ac77449b6c3bd96c968983d 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -54,6 +54,7 @@ config HAVE_VDSOCHECK
 	default y if X86
 	default y if ARM
 	default y if ARM64
+	default y if PPC
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index a695aed95ad391a0c55e5388bc6d1f1141fd784e..54372a547b1cde05c1a4454b9a21de357b22b0df 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -65,6 +65,31 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_AARCH64_CALL26,
             ],
         }),
+        bindings::EM_PPC => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_PPC_REL24,
+                bindings::R_PPC_REL14,
+                bindings::R_PPC_REL32,
+                bindings::R_PPC_REL16,
+                bindings::R_PPC_REL16_LO,
+                bindings::R_PPC_REL16_HI,
+                bindings::R_PPC_REL16_HA,
+            ],
+        }),
+        bindings::EM_PPC64 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_PPC64_REL24,
+                bindings::R_PPC64_REL14,
+                bindings::R_PPC64_REL32,
+                bindings::R_PPC64_REL64,
+                bindings::R_PPC64_REL16,
+                bindings::R_PPC64_REL16_LO,
+                bindings::R_PPC64_REL16_HI,
+                bindings::R_PPC64_REL16_HA,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


