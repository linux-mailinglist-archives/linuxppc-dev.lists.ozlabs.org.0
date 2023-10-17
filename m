Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0409F7CC0D0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 12:38:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QaRapYwk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8r7M6F6jz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QaRapYwk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8r6X41ggz2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 21:38:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A7A9DB81D0A;
	Tue, 17 Oct 2023 10:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB2D4C433C7;
	Tue, 17 Oct 2023 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697539088;
	bh=eKMGcZsMQDmh2XIngoO27ap1DpB5rplaSJR1DYg/pc8=;
	h=From:To:Cc:Subject:Date:From;
	b=QaRapYwkwmCacW8HwqsxWXC31f2QMHrz+w7jsl7pBJeh3K1VQZVYvfufrilHhTjXd
	 0EIVa98dnYgBaBrqDHc7TADhJhFHjiXu7JSD1PqXI4coxWuxLdi0D7xwC/PyneKGa4
	 uSuOVuIxzN0xP8r/KD1DWUcu0mS5vKmwrFFO20/dDsJtbFszzO26DLqZnKguMDRqVn
	 JO5cl1x5GwyOfcEivSoIZUk33J1YlsXTFWde/19Todb+P0Ac2JSqx710uBa/yVKUVH
	 kBOa9m8ejE3dLKufSJAgZJho+OKWZk/ZIFllJ+qZ0x1igUTuAekdovLlkbfN8psEua
	 B8DHWxdhlylww==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 1/4] kbuild: remove ARCH_POSTLINK from module builds
Date: Tue, 17 Oct 2023 19:37:39 +0900
Message-Id: <20231017103742.130927-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: x86@kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Nicolas Schier <nicolas@fjasle.eu>, Masahiro Yamada <masahiroy@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "H. Peter Anvin" <hpa@zytor.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
'true' command.

Remove the meaningless code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/Makefile.postlink    | 3 ---
 arch/powerpc/Makefile.postlink | 3 ---
 arch/riscv/Makefile.postlink   | 3 ---
 arch/x86/Makefile.postlink     | 3 ---
 scripts/Makefile.modfinal      | 5 +----
 5 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index 34e3bd71f3b0..6cfdc149d3bc 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -31,9 +31,6 @@ ifeq ($(CONFIG_RELOCATABLE),y)
 	$(call if_changed,relocs)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@true
 
diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index 1f860b3c9bec..ae5a4256b03d 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -35,9 +35,6 @@ ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	rm -f .tmp_symbols.txt
 
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index a46fc578b30b..829b9abc91f6 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -36,9 +36,6 @@ ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_strip)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@true
 
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index 936093d29160..fef2e977cc7d 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -34,9 +34,6 @@ ifeq ($(CONFIG_X86_NEED_RELOCS),y)
 	$(call cmd,strip_relocs)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@rm -f $(OUT_RELOCS)/vmlinux.relocs
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index b3a6aa8fbe8c..8568d256d6fb 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -28,14 +28,11 @@ quiet_cmd_cc_o_c = CC [M]  $@
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
-ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
-
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o +=							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T scripts/module.lds -o $@ $(filter %.o, $^);		\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+		-T scripts/module.lds -o $@ $(filter %.o, $^)
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-- 
2.40.1

