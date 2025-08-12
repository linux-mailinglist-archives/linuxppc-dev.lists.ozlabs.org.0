Return-Path: <linuxppc-dev+bounces-10850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F203B21D51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:47:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L7G4TRRz3dRH;
	Tue, 12 Aug 2025 15:44:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977498;
	cv=none; b=fb2s5F3oCbp/sZppbhMdA4ZCtqs4/VkGqKuBbObs8oYM7giiuf4A1vkU4o9TJWiCh0dlR/ssfXejWpAoTweHgs+usZoqIl8YA85Ef+u5zFZuT7FTsZ/eeIoq0V1K6th0c5L0IKhx4EE8cX181NVExZusji5qNwr8xmwBg3ra7okLVKk7kRz/2BJf5BQfnVLzX77kHHXdaAPNbwkd2fTIC9Is5mqGfC+Ry5+wCra2iIFMYhWID/MkI296E2Tj4aDlJSy9ZQ6xoVhe3TulnNBjnU6Y5XN1R3rl76W1i+2Bc6+BYMUmKaD+7UfdEY8F1Fm7koQK2u3y9r0AmVPI4R6fLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977498; c=relaxed/relaxed;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaaA7p47iB26pdnx3oWuDWm+K0pFARw9IfABWquGuouk22JI5+UTR7rgjNdEuFhKSxtQTBzo5Iwe2g6qcVyMcx3XHyFVy6uOwuyVxYGz1O7W4albzUUqGDwCrpuAS7WNT37FeGFU/5N8Zbqegdj91q/7zP+YuJyAPRrDzsxeAJcYuu5Kc7Y64ZoTVXfutwZ7UnHZElztoI7h6ZgT59vgtjJBXVeUyKxQmIF/rtpW/t9HDVhfGhgWGK5HUvkuBeaqc/kC6qQ7ptwC8++nkE1QijxMqD41ORah+3JDOjdJWqorF9gaTE4PiY3lZfWpxe+n7KhijVyoFpf/rRAz09Soew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YVIBrzVs; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AHGoK11e; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=YVIBrzVs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=AHGoK11e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L7D30LFz3dL4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:56 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=;
	b=YVIBrzVs6jMRgP60RbLocRZINlpYIvgh/R8TmjjX9sgPwnMSGZAXRyMlQNpfj8cGpZ/fxK
	G1/ToFEH5kb8MyAyKBkqwWZy3FKtIaGyFnw/jDcC7cDfkV57unEWUErdw+4OFfUlhZ4I+Z
	u8LwflPKLpav+TZK1MYkSfenBQn967+uc5qSfgthMGz/rbRyu5ep6Dm6EBqZkIbqP0QvA/
	DEO9YwRG3oLtdNHQfyHGqGzKfO4J2v2y0izQdU6www5cNj6J0F/5SABcNgh9oQkLaiJmvS
	5ypEzeVA2rzpysAIPhXAr1gdv1DqmozBuroN9m2hnP3Ep+YD2Fk+LtTvniAoEQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmm+0jjK/cu4H5GKrhccpCqW984gVWKwBZnN5hgc4w=;
	b=AHGoK11e3ONpNsRnJ36Q4yzXjYjg8Xc+9ohCcoySpaOfSk5kLWkDoRsDYtFjalcZguXquc
	0s1EVjzvsI3du6Bg==
Date: Tue, 12 Aug 2025 07:44:34 +0200
Subject: [PATCH v4 21/24] s390/vdso: Enable the vdsocheck tool
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
Message-Id: <20250812-vdso-absolute-reloc-v4-21-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3294;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=PbETMq9VTMEwxP8nGcVWnIK4aa/sB1ug5A+6i2j8Dag=;
 b=0cxT7S8ALFBcremtG1GBYu7CMsjCUUhSxQ1TwTPoImStmnRVATckJ934fbovkMMjfs5d2wReE
 xM4bYW6HkdvAmAnJ8M3DKlcu59tynIH+5lbTlWBXo2H7IRGxFBIBEy2
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
 arch/s390/kernel/vdso32/Makefile | 4 ++--
 arch/s390/kernel/vdso64/Makefile | 4 ++--
 lib/vdso/Kconfig                 | 1 +
 lib/vdso/check/vdsocheck.rs      | 8 ++++++++
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index 1e4ddd1a683ff84492f0f4b48d0efa00688129c2..6e8fba248d1aa8787f44aca2d82d77c245871b65 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -36,9 +36,9 @@ CPPFLAGS_vdso32.lds += -P -C -U$(ARCH)
 $(obj)/vdso32_wrapper.o : $(obj)/vdso32.so
 
 quiet_cmd_vdso_and_check = VDSO    $@
-      cmd_vdso_and_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdso_and_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
-$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32.lds $(obj-vdso32) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 # strip rule for the .so file
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index d8f0df74280960cb351154a8a73b4f7fe83a9125..1334b6a188cedc883fe98dc271a995ee690c7fad 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -46,10 +46,10 @@ CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 $(obj)/vdso64_wrapper.o : $(obj)/vdso64.so
 
 quiet_cmd_vdso_and_check = VDSO    $@
-      cmd_vdso_and_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdso_and_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj-cvdso64) FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso64.lds $(obj-vdso64) $(obj-cvdso64) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 # strip rule for the .so file
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 0fe70b3604f9925ef8c5608bb4cac24d3a28faab..b5b6673897e24a1f36147c21d00dff057f293980 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -57,6 +57,7 @@ config HAVE_VDSOCHECK
 	default y if PPC
 	default y if RISCV
 	default y if LOONGARCH
+	default y if S390
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 93819f668d8a4f623f41403bb09b42c4aec2c8de..01073062f2b2d276291ccfbc6aa516f14a13fdd5 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -138,6 +138,14 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_LARCH_32_PCREL,
             ],
         }),
+        bindings::EM_S390 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_390_PC32,
+                bindings::R_390_PC32DBL,
+                bindings::R_390_PLT32DBL,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


