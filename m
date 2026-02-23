Return-Path: <linuxppc-dev+bounces-17069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCqxOVGmnGklJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:11:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C48917C10C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKVnV1zf0z3blq;
	Tue, 24 Feb 2026 06:11:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771873870;
	cv=none; b=UNH02w1pzVhC+/JTdZtxh/5mM+3gP1dNi6h8dQJbWh4fWxqQ1x6qcR/nCsJTMQE3ny+NdN5dMZPrpZjlJUDsQt0/4Xrrjj1HE2JXlcJZmUsmGkTK0K6Ea7F6QlJlxo7r/FusuVWvy+IYX/doz6jpAWgwGVF4I51QtJimrepxh1LMnrI4vaX4YOm6x7HQgphdXWkLVI/Tukbn28UeSPDRWZTqo8rd1ytXVRP30WFuMq055Ea1NcdC7d+KaUZhyFCD/OsWx6J5vHD6gKZ8xFs7MJabin10bhPsosWokuGa8199A3miW+lWScIRDHK7PUrLxRSs+Dq3K8iIuK15ILx7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771873870; c=relaxed/relaxed;
	bh=igAvqaLmnhDSetP2pdr7U8fuWsXSuS2dGwSNMeHQK2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyaPIq9jCsvnjKVTKd8lMFaZgAP66Wf4fCVF3XqpPpXleCxHLxfwT91LZ8KzEmumQ1mwU6tUfQ0BSHVE6k0LdkOBHXpEMGehW1pKRlFuX3JYe0tAAmOOpjCttjABc37cpc685LBlVHCdiEzVoFeEe0Z+QR10baFmMrS5grXtDqB2ID4dE6BQv3UwKrA8ucRZ+QFxlLRnwTNpKDW3gvXKXpC7dFDp9TFLi2x8i4Ailf4X+SHUXwxObiCeHZz0pDHYTjlqxuLG1kV+aUfNBrK56pT+U5aDonoxXF6uCI4vbjppFU8NOTtGk6QdMM1Mg0ahoABpakNgx2v2ZzeRaRODDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GN8C1JhZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GN8C1JhZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKVnS0mjjz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:11:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 724776111A;
	Mon, 23 Feb 2026 19:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B742DC116C6;
	Mon, 23 Feb 2026 19:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771873865;
	bh=JkTF5bcI/LJDdihvClbdqAW2KYqXqhfJYTnKJqYjBBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GN8C1JhZvRhhpBPCfAA96a162Ot08dT2IYkPKN6S544ZNG0yHykfVFWnC3JeUts7C
	 OOBW1bvYDFQgFVmNff8jfugMpquKLPZgcCo8UIMLh3Hw9w/f55cHJgjRT5Ew15xt2p
	 Ey6Rs1BTLVqBkq0PuTFMfq1rdUW9nTfeCblLoa7tb93nPCWIIwsP9jFfXqoMJkyJKx
	 lN1BNM0xuFGZ4sWWjhY9R1FgxDmHxcSbD/7GZSjaZugb53LR1P6RjjqTyydHuc64Di
	 oLKGybcxSvG/d9Vm7FznEoxeZN6nenq+4OYR8duG8q81LllndukFFwurhkpfYTdkLZ
	 hK7FIDMLHHP9A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 23 Feb 2026 12:10:28 -0700
Subject: [PATCH 1/2] kbuild: Consolidate C dialect options
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
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fms-anonymous-structs-v1-1-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Kees Cook <kees@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-efi@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=11862; i=nathan@kernel.org;
 h=from:subject:message-id; bh=JkTF5bcI/LJDdihvClbdqAW2KYqXqhfJYTnKJqYjBBk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlzlllucv4qHBczxXYld7Hc+ueJCwPdrooI6CZXL+988
 ozV8PjFjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRmZcZGS6uPub1dI+a2Isa
 zcD6mtC69g7ld/8u5D66ZpZ0kunTlWWMDJuZOGy+L/xlb7869Nyya4e+hkdrie+WcGdQNJLsWGB
 7iBsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17069-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@HansenPartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:
 lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,arm.com,kernel.org,xen0n.name,HansenPartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0C48917C10C
X-Rspamd-Action: no action

Introduce CC_FLAGS_DIALECT to make it easier to update the various
places in the tree that rely on the GNU C standard and Microsoft
extensions flags atomically. All remaining uses of '-std=gnu11' and
'-fms-extensions' are in the tools directory (which has its own build
system) and other standalone Makefiles. This will allow the kernel to
use a narrower option to enable the Microsoft anonymous tagged structure
extension in a simpler manner. Place the CC_FLAGS_DIALECT block after
the configuration include (so that a future change can move the
selection of the flag to Kconfig) but before the
arch/$(SRCARCH)/Makefile include (so that CC_FLAGS_DIALECT is available
for use in those Makefiles).

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile                              | 16 ++++++++++++----
 arch/arm64/kernel/vdso32/Makefile     |  3 +--
 arch/loongarch/vdso/Makefile          |  2 +-
 arch/parisc/boot/compressed/Makefile  |  2 +-
 arch/powerpc/boot/Makefile            |  3 +--
 arch/s390/Makefile                    |  3 +--
 arch/s390/purgatory/Makefile          |  3 +--
 arch/x86/Makefile                     |  6 +-----
 arch/x86/boot/compressed/Makefile     |  6 +-----
 drivers/firmware/efi/libstub/Makefile |  3 +--
 scripts/Makefile.warn                 |  5 -----
 11 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/Makefile b/Makefile
index e944c6e71e81..06ff3032a6bc 100644
--- a/Makefile
+++ b/Makefile
@@ -587,7 +587,6 @@ LINUXINCLUDE    := \
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
 
 KBUILD_CFLAGS :=
-KBUILD_CFLAGS += -std=gnu11
 KBUILD_CFLAGS += -fshort-wchar
 KBUILD_CFLAGS += -funsigned-char
 KBUILD_CFLAGS += -fno-common
@@ -790,6 +789,18 @@ ifdef need-config
 include $(objtree)/include/config/auto.conf
 endif
 
+CC_FLAGS_DIALECT := -std=gnu11
+# Allow including a tagged struct or union anonymously in another struct/union.
+CC_FLAGS_DIALECT += -fms-extensions
+# Clang enables warnings about GNU and Microsoft extensions by default, disable
+# them because this is expected with the above options.
+ifdef CONFIG_CC_IS_CLANG
+CC_FLAGS_DIALECT += -Wno-gnu
+CC_FLAGS_DIALECT += -Wno-microsoft-anon-tag
+endif
+export CC_FLAGS_DIALECT
+KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
+
 ifeq ($(KBUILD_EXTMOD),)
 # Objects we will link into vmlinux / subdirs we need to visit
 core-y		:=
@@ -1093,9 +1104,6 @@ NOSTDINC_FLAGS += -nostdinc
 # perform bounds checking.
 KBUILD_CFLAGS += $(call cc-option, -fstrict-flex-arrays=3)
 
-# Allow including a tagged struct or union anonymously in another struct/union.
-KBUILD_CFLAGS += -fms-extensions
-
 # disable invalid "can't wrap" optimizations for signed / pointers
 KBUILD_CFLAGS	+= -fno-strict-overflow
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 9d0efed91414..bea3675fa668 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -63,7 +63,7 @@ VDSO_CFLAGS += -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
                $(filter -Werror,$(KBUILD_CPPFLAGS)) \
                -Werror-implicit-function-declaration \
                -Wno-format-security \
-               -std=gnu11 -fms-extensions
+               $(CC_FLAGS_DIALECT)
 VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
@@ -71,7 +71,6 @@ VDSO_CFLAGS += -fno-strict-overflow
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
 VDSO_CFLAGS += -Werror=date-time
 VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
-VDSO_CFLAGS += $(if $(CONFIG_CC_IS_CLANG),-Wno-microsoft-anon-tag)
 
 # Compile as THUMB2 or ARM. Unwinding via frame-pointers in THUMB2 is
 # unreliable.
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index 520f1513f07d..904ef4a0d826 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -24,7 +24,7 @@ endif
 cflags-vdso := $(ccflags-vdso) \
 	-isystem $(shell $(CC) -print-file-name=include) \
 	$(filter -W%,$(filter-out -Wa$(comma)%,$(KBUILD_CFLAGS))) \
-	-std=gnu11 -fms-extensions -O2 -g -fno-strict-aliasing -fno-common -fno-builtin \
+	$(CC_FLAGS_DIALECT) -O2 -g -fno-strict-aliasing -fno-common -fno-builtin \
 	-fno-stack-protector -fno-jump-tables -DDISABLE_BRANCH_PROFILING \
 	$(call cc-option, -fno-asynchronous-unwind-tables) \
 	$(call cc-option, -fno-stack-protector)
diff --git a/arch/parisc/boot/compressed/Makefile b/arch/parisc/boot/compressed/Makefile
index f8481e4e9d21..14eefb5ed5d1 100644
--- a/arch/parisc/boot/compressed/Makefile
+++ b/arch/parisc/boot/compressed/Makefile
@@ -18,7 +18,7 @@ KBUILD_CFLAGS += -fno-PIE -mno-space-regs -mdisable-fpregs -Os
 ifndef CONFIG_64BIT
 KBUILD_CFLAGS += -mfast-indirect-calls
 endif
-KBUILD_CFLAGS += -std=gnu11 -fms-extensions
+KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 
 LDFLAGS_vmlinux := -X -e startup --as-needed -T
 $(obj)/vmlinux: $(obj)/vmlinux.lds $(addprefix $(obj)/, $(OBJECTS)) $(LIBGCC) FORCE
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index f1a4761ebd44..7ee0fa2d3371 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -70,7 +70,7 @@ BOOTCPPFLAGS	:= -nostdinc $(LINUXINCLUDE)
 BOOTCPPFLAGS	+= -isystem $(shell $(BOOTCC) -print-file-name=include)
 
 BOOTCFLAGS	:= $(BOOTTARGETFLAGS) \
-		   -std=gnu11 -fms-extensions \
+		   $(CC_FLAGS_DIALECT) \
 		   -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -O2 \
 		   -msoft-float -mno-altivec -mno-vsx \
@@ -86,7 +86,6 @@ BOOTARFLAGS	:= -crD
 
 ifdef CONFIG_CC_IS_CLANG
 BOOTCFLAGS += $(CLANG_FLAGS)
-BOOTCFLAGS += -Wno-microsoft-anon-tag
 BOOTAFLAGS += $(CLANG_FLAGS)
 endif
 
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index d78ad6885ca2..c8d16aca1cdc 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -22,7 +22,7 @@ KBUILD_AFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -D__ASSEMBLY__
 ifndef CONFIG_AS_IS_LLVM
 KBUILD_AFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),$(aflags_dwarf))
 endif
-KBUILD_CFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -O2 -mpacked-stack -std=gnu11 -fms-extensions
+KBUILD_CFLAGS_DECOMPRESSOR := $(CLANG_FLAGS) -m64 -O2 -mpacked-stack $(CC_FLAGS_DIALECT)
 KBUILD_CFLAGS_DECOMPRESSOR += -DDISABLE_BRANCH_PROFILING -D__NO_FORTIFY
 KBUILD_CFLAGS_DECOMPRESSOR += -D__DECOMPRESSOR
 KBUILD_CFLAGS_DECOMPRESSOR += -Wno-pointer-sign
@@ -35,7 +35,6 @@ KBUILD_CFLAGS_DECOMPRESSOR += $(call cc-disable-warning, address-of-packed-membe
 KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO),-g)
 KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_DEBUG_INFO_DWARF4), $(call cc-option, -gdwarf-4,))
 KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_CC_NO_ARRAY_BOUNDS),-Wno-array-bounds)
-KBUILD_CFLAGS_DECOMPRESSOR += $(if $(CONFIG_CC_IS_CLANG),-Wno-microsoft-anon-tag)
 
 UTS_MACHINE	:= s390x
 STACK_SIZE	:= $(if $(CONFIG_KASAN),65536,$(if $(CONFIG_KMSAN),65536,16384))
diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index 61d240a37633..95a8ac45b67e 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -13,7 +13,7 @@ CFLAGS_sha256.o := -D__NO_FORTIFY
 $(obj)/mem.o: $(srctree)/arch/s390/lib/mem.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-KBUILD_CFLAGS := -std=gnu11 -fms-extensions -fno-strict-aliasing -Wall -Wstrict-prototypes
+KBUILD_CFLAGS := $(CC_FLAGS_DIALECT) -fno-strict-aliasing -Wall -Wstrict-prototypes
 KBUILD_CFLAGS += -Wno-pointer-sign -Wno-sign-compare
 KBUILD_CFLAGS += -fno-zero-initialized-in-bss -fno-builtin -ffreestanding
 KBUILD_CFLAGS += -Os -m64 -msoft-float -fno-common
@@ -21,7 +21,6 @@ KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 KBUILD_CFLAGS += $(CLANG_FLAGS)
-KBUILD_CFLAGS += $(if $(CONFIG_CC_IS_CLANG),-Wno-microsoft-anon-tag)
 KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
 KBUILD_CFLAGS += $(call cc-option, -Wno-default-const-init-unsafe)
 KBUILD_AFLAGS := $(filter-out -DCC_USING_EXPOLINE,$(KBUILD_AFLAGS))
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 5f881460a8b5..46fec0b08487 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -48,7 +48,7 @@ endif
 
 # How to compile the 16-bit code.  Note we always compile for -march=i386;
 # that way we can complain to the user if the CPU is insufficient.
-REALMODE_CFLAGS	:= -std=gnu11 -fms-extensions -m16 -g -Os \
+REALMODE_CFLAGS	:= $(CC_FLAGS_DIALECT) -m16 -g -Os \
 		   -DDISABLE_BRANCH_PROFILING -D__DISABLE_EXPORTS \
 		   -Wall -Wstrict-prototypes -march=i386 -mregparm=3 \
 		   -fno-strict-aliasing -fomit-frame-pointer -fno-pic \
@@ -59,10 +59,6 @@ REALMODE_CFLAGS += -fno-stack-protector
 REALMODE_CFLAGS += -Wno-address-of-packed-member
 REALMODE_CFLAGS += $(cc_stack_align4)
 REALMODE_CFLAGS += $(CLANG_FLAGS)
-ifdef CONFIG_CC_IS_CLANG
-REALMODE_CFLAGS += -Wno-gnu
-REALMODE_CFLAGS += -Wno-microsoft-anon-tag
-endif
 export REALMODE_CFLAGS
 
 # BITS is used as extension for files which are available in a 32 bit
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 68f9d7a1683b..8924196927bf 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -25,7 +25,7 @@ targets := vmlinux vmlinux.bin vmlinux.bin.gz vmlinux.bin.bz2 vmlinux.bin.lzma \
 # avoid errors with '-march=i386', and future flags may depend on the target to
 # be valid.
 KBUILD_CFLAGS := -m$(BITS) -O2 $(CLANG_FLAGS)
-KBUILD_CFLAGS += -std=gnu11 -fms-extensions
+KBUILD_CFLAGS += $(CC_FLAGS_DIALECT)
 KBUILD_CFLAGS += -fno-strict-aliasing -fPIE
 KBUILD_CFLAGS += -Wundef
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
@@ -36,10 +36,6 @@ KBUILD_CFLAGS += -mno-mmx -mno-sse
 KBUILD_CFLAGS += -ffreestanding -fshort-wchar
 KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
-ifdef CONFIG_CC_IS_CLANG
-KBUILD_CFLAGS += -Wno-gnu
-KBUILD_CFLAGS += -Wno-microsoft-anon-tag
-endif
 KBUILD_CFLAGS += -Wno-pointer-sign
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index e386ffd009b7..fbb8d4e33256 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -11,12 +11,11 @@ cflags-y			:= $(KBUILD_CFLAGS)
 
 cflags-$(CONFIG_X86_32)		:= -march=i386
 cflags-$(CONFIG_X86_64)		:= -mcmodel=small
-cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ -std=gnu11 -fms-extensions \
+cflags-$(CONFIG_X86)		+= -m$(BITS) -D__KERNEL__ $(CC_FLAGS_DIALECT) \
 				   -fPIC -fno-strict-aliasing -mno-red-zone \
 				   -mno-mmx -mno-sse -fshort-wchar \
 				   -Wno-pointer-sign \
 				   $(call cc-disable-warning, address-of-packed-member) \
-				   $(if $(CONFIG_CC_IS_CLANG),-Wno-gnu -Wno-microsoft-anon-tag) \
 				   -fno-asynchronous-unwind-tables \
 				   $(CLANG_FLAGS)
 
diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 5567da6c7dfe..e77ca875aea4 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -28,11 +28,6 @@ endif
 KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
 
 ifdef CONFIG_CC_IS_CLANG
-# The kernel builds with '-std=gnu11' and '-fms-extensions' so use of GNU and
-# Microsoft extensions is acceptable.
-KBUILD_CFLAGS += -Wno-gnu
-KBUILD_CFLAGS += -Wno-microsoft-anon-tag
-
 # Clang checks for overflow/truncation with '%p', while GCC does not:
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=111219
 KBUILD_CFLAGS += $(call cc-option, -Wno-format-overflow-non-kprintf)

-- 
2.53.0


