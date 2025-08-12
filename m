Return-Path: <linuxppc-dev+bounces-10847-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F627B21D4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 07:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1L7D3kdnz3dLh;
	Tue, 12 Aug 2025 15:44:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754977496;
	cv=none; b=T1wUsvvnDO3lV+8qCjAVlmPyCl1w7bn1TG056fQXxJdAOGOdwr/0w8NXLtHW3xyNNKQmIyLX+jg7V16l53LtAiP5Hv7eviUs1gYyE6lpOFMzQ4EVgzSxIX/S0N+GTusHWJH6ah9YDqinTmhY9ffnkjlTUx1p3Q0Jlvr12mhiFGFini36AJ45xVvFOMIbKwC2MODJV8F/osY7f2EUjzhrzIsAHkW4vgTgOHjjmGLnj2NOYw2Ny485s3Qkr6lzn0g1g60t6n7o0K6YtGY4jr/wcKVDhrpx2ifLtYIjpaOeLG2OXbLr0D1xw6suOd+L5KdhJDpqEL5fimUoHqccdDbVTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754977496; c=relaxed/relaxed;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L05Rqt0GaNuEGukvxXgF8WAyCfS3LdhVE0DCWahOq/kAih1Be4cgs5qd02TJojbVAUiE+xXNKyhm/QQ4BFUQ0devwf2WRdEQQ84cUnd3IffklIOWvOr/s4wd6b0yxtP0HjO1ROIZ++r5M2V5OAcctp1tAKHh2obsTJdNRa0G4RpG7YYtv4mF9O6hY+B6lPNOYerG5p/G+wTNOdssEz2k43tn7pfTrRnXg5oLd/fDodyS5jio1v+2gr0vSTATZ+fQ747USYZR5v9cabA+7f7qCv9C+KHOtT3BHoV9MdcrvQHF6lCtRF1c3NRU882pbiwgZsBOZOc3MX5pKW+rYf2MgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=y6kJZp/a; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NXZQJgvp; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=y6kJZp/a;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NXZQJgvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4c1L7C45Xpz3dLb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 15:44:55 +1000 (AEST)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=;
	b=y6kJZp/aMepqZyqIpu2Ge7fuGhIrg50IqAa8/kDWQydm7It5QCDOz2yKzkQ3nTVNspTLSa
	0Z4k7oD1Q+xCqfzj5lYWkxPTS1MmOTr51kIJLK870+GnX/yGOhUkdCBK3uwWNwW6iPZVQC
	tgpAkrU7Zb0EAA6ZRz5RBZ6MPFx1SbJhfTBFQA4FevsFC+l/Zzx62GlvL4c5g3ZKDTbJWh
	7bvJslx0+0Y9/A2L7wtCdcBkbz4Hhs6lfksVYdjmQ5h4IYF4Bv1fx8akKwgCXeg+i8kq/k
	X4D8gv59NZLmB7c4EWhKN/Uxh5AX9lhl4fWV3oXKTC2YK9nd/9yxz6HJGp2oAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754977480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mxk1j7bQVP7gkeGhqiBaJTM8Rt+qR7YGqcRddWJjs3Q=;
	b=NXZQJgvpthSi0X2yy7bk/mKr8cSd4B68z61qxsqtB551PCUPMszU49Btx/qpuXPqLXGzsR
	LaQJ4RnSqXSXw+DA==
Date: Tue, 12 Aug 2025 07:44:33 +0200
Subject: [PATCH v4 20/24] LoongArch: vDSO: Enable the vdsocheck tool
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
Message-Id: <20250812-vdso-absolute-reloc-v4-20-61a8b615e5ec@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754977469; l=3338;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1IZrubHrqMbaFtOk3hdvCwRPSsl7pLGR/UJMuiLBbOY=;
 b=LqYg38rSkBwpE7p9p2L9QYuv0JUyTLtER245hHstQoHs7MiLUh2lPURSIZcAihCYxsat6bpQV
 An04KjctmxQDRVzmaoiEcTtq1AzmJcVR/h2OWecT6+BVOcWz8b8Wtr+
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
 arch/loongarch/vdso/Makefile |  4 ++--
 lib/vdso/Kconfig             |  1 +
 lib/vdso/check/vdsocheck.rs  | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index d8316f993482406c2633b49b1daa475fc415a82c..a9b1934dce7c821df96e636a9833e70f22ee1b31 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -43,7 +43,7 @@ ldflags-y := -Bsymbolic --no-undefined -soname=linux-vdso.so.1 \
 #
 
 quiet_cmd_vdsold_and_vdso_check = LD      $@
-      cmd_vdsold_and_vdso_check = $(cmd_ld); $(cmd_vdso_check)
+      cmd_vdsold_and_vdso_check = $(cmd_ld_vdso); $(cmd_vdso_check)
 
 quiet_cmd_vdsoas_o_S = AS       $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
@@ -72,7 +72,7 @@ $(obj-vdso): KBUILD_AFLAGS := $(aflags-vdso) $(native-abi)
 
 $(obj)/vdso.lds: KBUILD_CPPFLAGS := $(ccflags-vdso) $(native-abi)
 
-$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
+$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) $(vdsocheck) FORCE
 	$(call if_changed,vdsold_and_vdso_check)
 
 $(obj)/vdso.so: OBJCOPYFLAGS := -S
diff --git a/lib/vdso/Kconfig b/lib/vdso/Kconfig
index 441ff03e1028f7bde5104bd01941c6a9b006e21f..0fe70b3604f9925ef8c5608bb4cac24d3a28faab 100644
--- a/lib/vdso/Kconfig
+++ b/lib/vdso/Kconfig
@@ -56,6 +56,7 @@ config HAVE_VDSOCHECK
 	default y if ARM64
 	default y if PPC
 	default y if RISCV
+	default y if LOONGARCH
 	help
 	  Selected for architectures that are supported by the 'vdsocheck' progam.
 	  Only transitional.
diff --git a/lib/vdso/check/vdsocheck.rs b/lib/vdso/check/vdsocheck.rs
index d48c9da6f18270afe883d167955f73f061b9c472..93819f668d8a4f623f41403bb09b42c4aec2c8de 100644
--- a/lib/vdso/check/vdsocheck.rs
+++ b/lib/vdso/check/vdsocheck.rs
@@ -115,6 +115,29 @@ fn allowed_relocations_for_machine(machine: u16) -> Option<AllowedRelocations<'s
                 bindings::R_RISCV_32_PCREL,
             ],
         }),
+        bindings::EM_LOONGARCH => Some(AllowedRelocations {
+            ignored_object_file_sections: None,
+            in_object_file: &[
+                bindings::R_LARCH_ADD8,
+                bindings::R_LARCH_ADD16,
+                bindings::R_LARCH_ADD24,
+                bindings::R_LARCH_ADD32,
+                bindings::R_LARCH_ADD64,
+                bindings::R_LARCH_SUB8,
+                bindings::R_LARCH_SUB16,
+                bindings::R_LARCH_SUB24,
+                bindings::R_LARCH_SUB32,
+                bindings::R_LARCH_SUB64,
+                bindings::R_LARCH_B16,
+                bindings::R_LARCH_B21,
+                bindings::R_LARCH_B26,
+                bindings::R_LARCH_PCALA_HI20,
+                bindings::R_LARCH_PCALA_LO12,
+                bindings::R_LARCH_PCALA64_LO20,
+                bindings::R_LARCH_PCALA64_HI12,
+                bindings::R_LARCH_32_PCREL,
+            ],
+        }),
         _ => None,
     }
 }

-- 
2.50.1


