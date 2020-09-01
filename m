Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4C25A16F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:29:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh1vp1S4HzDqTN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3ympoxwwkddeaqrfnhyavreftbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=G1fcxj7N; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh1qb43YkzDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 08:25:41 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id p138so2812174yba.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 15:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=1Vm2QqyX/OUi6RR2IULKGjS+daCT8Blmd+/gKY17G40=;
 b=G1fcxj7NZ2HKC3O3tMp7OaMWLaYHaeE9KsxbMa4zRsJJVBwflae1qaQvhTrD9ZrJKX
 8uxzDbP9UDghqhvAq0e/p57waEeBVCZp7eZsU0L/Iil4/f58FCSkNr0QUELw0+sdJm6h
 9hNL1cAJRg+9Lf6PDKIX25eLT/Cwx/RrCkrslPykkYujMCe+LxOhh8pzlUeaoInYxUfK
 R9Sw0QwRRwHq9avL6LlzpI0vtTMG23d+i+ypHwy8d3KRRF3lB5tAK+UIImMkMCY4hCSr
 3ys0h9VjnvAfa/z0G8Y7tXq9BSVMTq0jEtayzVpuu6d0aGlBultoPKdf8EDn+n0Wq7Hz
 aoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1Vm2QqyX/OUi6RR2IULKGjS+daCT8Blmd+/gKY17G40=;
 b=LhTRA1CgcHuGIwAki86g+0mE7rxTVCJ0uVE40xBt5eBp/wn46PHUlKDs24Ffw5TG36
 KNhw7dsGRBibE/0MFVvED46J5lF0yFdStwaVj8qp67vOi7GPyzEphM/f26E/z4ZMkRkd
 kaAU0hjA88BzWRGmo1VmTWL5GF8M12iFdo5XK9px6sLWRwqB00J0XiQfphghAnrZZBLQ
 VBoZc40oVIiCi2n8ZOb+APWogSghCnDEF6n7Rtx6QopC272jX7UP8MDyU7DFhZ9WXly8
 sCnHdq7nXlVkjefnSEjSsuqNHfjkajTyYc/1hLcLNvGt1UGTD1hkFmVxmhIgtWSJ9/SW
 HKVg==
X-Gm-Message-State: AOAM533GmEa5pp9pCkAOho9BJjq/SGLS592/whtbPV19f5aW1knnShaY
 tn5b8Vzfga5mAoh6i6P/kIGxH4QaTSvwECCmY14=
X-Google-Smtp-Source: ABdhPJx5yf3WNW7Q5w2bD1WYoDV7Na2wjlaEIzL4kF+ReKd10GAYtHjsF7mnqYQo7KV+jgGCvau1EGlVhk8NOTuv0R4=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:7509:: with SMTP id
 q9mr5300885ybc.317.1598999136478; Tue, 01 Sep 2020 15:25:36 -0700 (PDT)
Date: Tue,  1 Sep 2020 15:25:22 -0700
In-Reply-To: <20200901222523.1941988-1-ndesaulniers@google.com>
Message-Id: <20200901222523.1941988-2-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200901222523.1941988-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH 1/2] powerpc/vdso64: link vdso64 with linker
From: Nick Desaulniers <ndesaulniers@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Joe Lawrence <joe.lawrence@redhat.com>, Kees Cook <keescook@chromium.org>,
 Fangrui Song <maskray@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than invoke the compiler as the driver, use the linker. That way
we can check --orphan-handling=warn support correctly, as cc-ldoption
was removed in
commit 055efab3120b ("kbuild: drop support for cc-ldoption").

Painstakingly compared the output between `objdump -a` before and after
this change. Now function symbols have the correct type of FUNC rather
than NONE, and the entry is slightly different (which doesn't matter for
the vdso). Binary size is the same.

Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
Link: https://lore.kernel.org/lkml/CAKwvOdnn3wxYdJomvnveyD_njwRku3fABWT_bS92duihhywLJQ@mail.gmail.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/include/asm/vdso.h         | 17 ++---------------
 arch/powerpc/kernel/vdso64/Makefile     |  8 ++++++--
 arch/powerpc/kernel/vdso64/vdso64.lds.S |  1 -
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso.h b/arch/powerpc/include/asm/vdso.h
index 2ff884853f97..11b2ecf49f79 100644
--- a/arch/powerpc/include/asm/vdso.h
+++ b/arch/powerpc/include/asm/vdso.h
@@ -24,19 +24,7 @@ int vdso_getcpu_init(void);
 
 #else /* __ASSEMBLY__ */
 
-#ifdef __VDSO64__
-#define V_FUNCTION_BEGIN(name)		\
-	.globl name;			\
-	name:				\
-
-#define V_FUNCTION_END(name)		\
-	.size name,.-name;
-
-#define V_LOCAL_FUNC(name) (name)
-#endif /* __VDSO64__ */
-
-#ifdef __VDSO32__
-
+#if defined(__VDSO32__) || defined (__VDSO64__)
 #define V_FUNCTION_BEGIN(name)		\
 	.globl name;			\
 	.type name,@function; 		\
@@ -46,8 +34,7 @@ int vdso_getcpu_init(void);
 	.size name,.-name;
 
 #define V_LOCAL_FUNC(name) (name)
-
-#endif /* __VDSO32__ */
+#endif /* __VDSO{32|64}__ */
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index 38c317f25141..7ea3ce537d0a 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -32,9 +32,13 @@ $(obj)/%.so: OBJCOPYFLAGS := -S
 $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
+ldflags-y := -shared -soname linux-vdso64.so.1 \
+	$(call ld-option, --eh-frame-hdr) \
+	$(call ld-option, --orphan-handling=warn) -T
+
 # actual build commands
-quiet_cmd_vdso64ld = VDSO64L $@
-      cmd_vdso64ld = $(CC) $(c_flags) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) $(call cc-ldoption, -Wl$(comma)--orphan-handling=warn)
+quiet_cmd_vdso64ld = LD      $@
+      cmd_vdso64ld = $(cmd_ld)
 
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 4e3a8d4ee614..58c33b704b6a 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -11,7 +11,6 @@ OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
 OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
 #endif
 OUTPUT_ARCH(powerpc:common64)
-ENTRY(_start)
 
 SECTIONS
 {
-- 
2.28.0.402.g5ffc5be6b7-goog

