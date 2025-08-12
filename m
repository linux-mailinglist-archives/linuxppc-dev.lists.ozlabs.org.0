Return-Path: <linuxppc-dev+bounces-10839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E449B21D34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L724zPnz3dJp;
	Tue, 12 Aug 2025 15:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977486;
	cv=none; b=ZAERTboGpEfBYeAtc3pWBys34AFWsP6oRkdF+i2wduh40o0l8V+TL8d/h1UNzBFN3BT+Ez70CoTadvdjkjCdkgxHSzoFDUQUluWWQ75J6R1WqrF00J5GZZ+JlyWvaUe+Y1+lZbohDHj713hYH95EyJPw/Y4cQ5FTQ4+oqxxpRj3g/Yez4wlNY40ZbWMbmhctlo9JWN4fjzYKXSwfq7+eGfDk+spFjVc3JqqTejxyGriiKaMZgPMZ/ts9K42SSQ1iD1boub4FZjX3jcDiwah7cDHKC8YAyHU4TSdMC9Ggj/p3aNZwtR3ol7el+z3r+JIVCrAJQ91/XpR9Y9rY7QPLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977486; c=relaxed/relaxed;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nf2VqZ6hZUOwb4n0siD52Sz5a4j/UfDEwE+Xq0P5Mgh+xqvFwiVwT1Kc7v6wx2G/7BHAZOdDdmPVMbZYzSOf8S7HYdEHoxIvIsacxbLaL1oU71E6UvOHhtE9sZkAfVDXpOFyEbaIwubvNXPIw9jjQHsY9CxmpEaqRLvnyvm02uUbUpzNBSPYSWBXSiVAw/8W27TFwewdtolcdX5dxCjudsVOje6lDQha64jsD5hrq49uejkEmVxdowKmxWcsGRawTF3uka4Jd52mVVM3DUEBEVgRxikOCD7z+pAzaeCkFaY4JSv2cInGwHL2/hSzZnxXGIHkO9Ab2DK38orzRwgXAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zocDmbkM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d4tRasLS; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zocDmbkM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=d4tRasLS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L713Kfdz3dKF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:45 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=zocDmbkM7SrtEfoMUMLk7syduA2FoS07iTJjRQxpoxVtJk6FCTcA63FHi4HDZhjOydKkAT
	DrrV0zBYz8rfc084esfgs4uuXAkhxzoVwcqdSmF7BEFWQKKsdlPKcE3LkSmnxFYonNODFZ
	2sN1ZNTgiR2KEOVXZQEVEMIVuHADKnDkoOaaebcfpKh5m4MlO1i3mxd6K0dfDn4f2gzo2k
	hM+ll5vK+/7O/uRdgK7BcmGop+bMKCmttdkUi9IyiFrD6fxo3aGU/1dH+Y4ccEvyjf/xRm
	ukysMSWz8XN0tHKKSQ2jKT60/8Q/5ewwHZkK0m/GvkKLUmwKhqnNwsd4lL/hmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HfCt5JZT5TLY1vTOkO3zmfWoCgmYOOlaa/RcOHdKaps=;
	b=d4tRasLSDVTIK2B95jsGzJ+ah9uconnEpGunOzkAkX0RhJ6u8QF5Rm6WA7PtZmvXd7GJ+4
	tmhczEYwE7G4MtAQ==
Date: Tue, 12 Aug 2025 07:44:25 +0200
Subject: [PATCH v4 12/24] x86/vdso: Enable the vdsocheck tool
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
Message-Id: <20250812-vdso-absolute-reloc-v4-12-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3221;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=y8zJkYgbdBbZEV0tFUnY1VVHpY6kpQMx7JNEIl5bx6U=;
 b=fENeUAc8ExvUZD2cHV52CW4BlgBth0NPCMcPLk1EKHf1hnG4lTQ/vRhPMnJvsZZXuIYsNnulZ
 VQ7lpvqs+SzB4XtQHOZ7OgLms0zrQWlEQppNKDCg82HN7J6F262h/0M
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
 arch/x86/entry/vdso/Makefile |  6 +++---
 lib/vdso/Kconfig             |  1 +
 lib/vdso/check/vdsocheck.rs  | 12 ++++++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index f247f5f5cb44dad706701dd5344c9a8031deffc1..9da9cdf8c976ccebac1429afd244d4c9ea6ef5fa 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -35,7 +35,7 @@ CPPFLAGS_vdso.lds += -P -C
 VDSO_LDFLAGS_vdso.lds = -m elf_x86_64 -soname linux-vdso.so.1 \
 			-z max-page-size=4096
 
-$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
+$(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/$(SUBARCH)/include/uapi
@@ -108,7 +108,7 @@ $(obj)/%.so: OBJCOPYFLAGS := -S --remove-section __ex_table
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/vdsox32.so.dbg: $(obj)/vdsox32.lds $(vobjx32s) FORCE
+$(obj)/vdsox32.so.dbg: $(obj)/vdsox32.lds $(vobjx32s) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 CPPFLAGS_vdso32/vdso32.lds = $(CPPFLAGS_vdso.lds)
@@ -144,7 +144,7 @@ endif
 
 $(obj)/vdso32.so.dbg: KBUILD_CFLAGS = $(KBUILD_CFLAGS_32)
 
-$(obj)/vdso32.so.dbg: $(obj)/vdso32/vdso32.lds $(vobjs32) FORCE
+$(obj)/vdso32.so.dbg: $(obj)/vdso32/vdso32.lds $(vobjs32) $(vdsocheck) FORCE
 	$(call if_changed,vdso_and_check)
 
 #
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index b461e2be6db80eae957c8e0a1ab573a85d78fd15..e9215084462dfb33a5cd55a57171d2ec4295a270 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -51,6 +51,7 @@ config GENERIC_VDSO_DATA_STORE
 
 config HAVE_VDSOCHECK
 	bool
+	default y if X86
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index 3c421100a91740ce3735edfbc9837ef49f55d8f8..c4feb75f93ec0a6a153a758ee7a51cc6f2f58bf1 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -34,6 +34,18 @@ fn is_ignored_section(&self, section: &elf::Section<'_>) -> bool {
 
 fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'static>> {
     match machine as u32 {
+        bindings::EM_386 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_386_PC32,
+                bindings::R_386_GOTOFF,
+                bindings::R_386_GOTPC,
+            ],
+        }),
+        bindings::EM_X86_64 => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[bindings::R_X86_64_PC32, bindings::R_X86_64_PLT32],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


