Return-Path: <linuxppc-dev+bounces-10852-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4089B21D54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:48:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L7L49Ktz3dRf;
	Tue, 12 Aug 2025 15:45:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977502;
	cv=none; b=ebn/DTi9aT7/2RFPKMhfLCI+9pMP81CfsVwUviBD0RoWCZW8bAafYWl7Npi/95Mzf9QxCWoHHRvc1zfBQRwZRu89bWqLR/jdxWa2eFO5bqmvYFTJ2nXDgnNmX/6cm05w4Xem2AuBRHs5FM7HcxcYd2yu9yPw1vZ4144I3sDWQKUJ4g8IH3+XZPIa9L1mFi/c+hRqc+ddXkdjGSoqgYQJxm3isQ/k/6ozQxQwgb+w2NuSgA1oKLuUOQu387VZs2yqcm6E+/ZgchESxqw9gpNM/p43q2lkdeG7UwSad0ur77XDlrU3aPSab4LdtCIlfdcZk7D6c3tM3KUKwNlWUjeTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977502; c=relaxed/relaxed;
	bh=cZ20UpxcMxk4CxqTAsOEg+d3tEufNIUEKrmXXn+g7es=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxoVOzRIxdrl4T8GwpOyf1oBfXPFHP/cA1G3KYVW8jU9jop/+i4LD0Kt3c6/RFL8VBFkqCM7u8CkXgyUMU9LtzzdHrkHFIXvb+QrYItQ1W97PDC0U8K9Fe7sRBwxugXqVlRSIGexza0c11FgIHx1ng8HBtlPOuoDi6AjvUXhVOF2EcIr45+YMxMrd9FQSvKe7CxFruk2UdM9Vm3de+E4cqk/72EuhSTz1u3q0AaSWtZsDH5ezKUpzsZEkEsRbUOSQHbtsnj18g8uR0uThUhHfjtkF9k6uj48w4AnPgSZrg06Crx7kD/1KkEzADgZcfTnwyjICqQ9wxNPd9zw5qGcTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u02ULTpX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dCjTzytX; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=u02ULTpX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dCjTzytX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L7K5Gbzz3dL4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:45:01 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ20UpxcMxk4CxqTAsOEg+d3tEufNIUEKrmXXn+g7es=;
	b=u02ULTpXMKVYfa57toc79SeSvHFZXxCkrNoUYan+T5r+jzG+jErgF3lH3L6hpXG5GD7AiP
	BIUXfeq2JImvh4BYaqWeRcsPcpQWyQhVM6L37lOS8/C3ZaJKOGeEyLxqjYZEbvX/ROLkBH
	u79IO6ttBD1PVC+tYif7r2bAXlngTkKup+NLj++0//mmwP8JvHnpMe87VUFc0bOwAeIITA
	jDpSHVlj7jvidjWsVLXDskx33s+au1U1XzyN/9KPs2LnIbFp5cV3y+a+R/VTZv4VZHKIAG
	LWkElhMb8xt5p1hHetTPMUO1bZj316mgGQEbOwBvZ0KYDGtgbZwU0kEgUkCLYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ20UpxcMxk4CxqTAsOEg+d3tEufNIUEKrmXXn+g7es=;
	b=dCjTzytXjhSAHdYjPLNNi/GmmKuNlP6Pk8Piyd2jaSGduNETuOdwRfsVItAyacB+69vj23
	yvuwshG6rMcH0pAw==
Date: Tue, 12 Aug 2025 07:44:36 +0200
Subject: [PATCH v4 23/24] MIPS: vdso: Enable the vdsocheck tool
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
Message-Id: <20250812-vdso-absolute-reloc-v4-23-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3783;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=zF65fVgprCI+5PEX2Gd11z0u6ua3JxVTHzfPFJcJjKs=;
 b=Esy6EbfOm7fmj2t+sBDFIgicd0JzbcJSTuk1wzj0YxPaqfzdPFEbZ+ivqSYv677dvrTRTHpOG
 hG06K4nNRAiASYK8xK3m4Pu8PF6fSaApaCF0D/lo8n5VKUT5XEMMGlM
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
 arch/mips/vdso/Makefile     |  8 ++++----
 lib/vdso/Kconfig            |  1 +
 lib/vdso/check/vdsocheck.rs | 13 +++++++++++++
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index 69d4593f64fee593c9ea5b030eabdea40b39b89a..24de045737580fb6a0148abb87e459d8f4be1d89 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -69,7 +69,7 @@ quiet_cmd_vdso_mips_check = VDSOCHK $@
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check); $(cmd_vdso_mips_check)
+      cmd_vdsold_and_vdso_check = $(cmd_ld_vdso); $(cmd_vdso_check); $(cmd_vdso_mips_check)
 
 quiet_cmd_vdsoas_o_S = AS      $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
@@ -106,7 +106,7 @@ $(obj-vdso): KBUILD_AFLAGS := $(aflags-vdso) $(native-abi)
 
 $(obj)/vdso.lds: KBUILD_CPPFLAGS := $(ccflags-vdso) $(native-abi)
 
-$(obj)/vdso.so.dbg.raw: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.dbg.raw: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso-image.c: $(obj)/vdso.so.dbg.raw $(obj)/vdso.so.raw \
@@ -144,7 +144,7 @@ $(obj)/vdso-o32.lds: KBUILD_CPPFLAGS := $(ccflags-vdso) -mabi=32
 $(obj)/vdso-o32.lds: $(src)/vdso.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/vdso-o32.so.dbg.raw: $(obj)/vdso-o32.lds $(obj-vdso-o32) FORCE
+$(obj)/vdso-o32.so.dbg.raw: $(obj)/vdso-o32.lds $(obj-vdso-o32) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso-o32-image.c: VDSO_NAME := o32
@@ -184,7 +184,7 @@ $(obj)/vdso-n32.lds: KBUILD_CPPFLAGS := $(ccflags-vdso) -mabi=n32
 $(obj)/vdso-n32.lds: $(src)/vdso.lds.S FORCE
 	$(call if_changed_dep,cpp_lds_S)
 
-$(obj)/vdso-n32.so.dbg.raw: $(obj)/vdso-n32.lds $(obj-vdso-n32) FORCE
+$(obj)/vdso-n32.so.dbg.raw: $(obj)/vdso-n32.lds $(obj-vdso-n32) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso-n32-image.c: VDSO_NAME := n32
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index b5b6673897e24a1f36147c21d00dff057f293980..567ac937a9c3084fd5669e1b890b667af8a2f12d 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -58,6 +58,7 @@ config HAVE_VDSOCHECK
 	default y if RISCV
 	default y if LOONGARCH
 	default y if S390
+	default y if MIPS
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 01073062f2b2d276291ccfbc6aa516f14a13fdd5..d9e660385e154fea179665ef9c5ba90223bf72be 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -146,6 +146,19 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_390_PLT32DBL,
             ],
         }),
+        bindings::EM_MIPS => Some(AllowedRelocations {
+            ignored_object_file_sections: Some(&[".rel.pdr", ".rela.pdr"]),
+            in_object_file: &[
+                bindings::R_MIPS_PC16,
+                bindings::R_MIPS_PC21_S2,
+                bindings::R_MIPS_PC26_S2,
+                bindings::R_MIPS_PC18_S3,
+                bindings::R_MIPS_PC19_S2,
+                bindings::R_MIPS_PCHI16,
+                bindings::R_MIPS_PCLO16,
+                bindings::R_MIPS_PC32,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


