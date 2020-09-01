Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C699D25A179
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 00:31:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh1yM2clWzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 08:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3yspoxwwkddmcsthpjacxtghvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=CgqVD+cU; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh1qc50LczDqDQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 08:25:42 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id 196so2002202qkn.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 15:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=xFF5qxswQ8XcvkvdvfVY4/mMkz+/5Nm8uIdW/HNF4l0=;
 b=CgqVD+cUWdzWbxzhIKI7RaHd9LEyOmQtSIfGxSeTZx3wjhQwa49KpJeXWTcaf02UaT
 1t1h7E4GQ51bnUwDBSLFbqTvq29wGC4ct4Zyu8vgZtkM46eQJN1UsEKFm/8Of7YG8Kv5
 A/r8lJXFwwttWKEbrul9OMFa6vSTWwUvt9OXf+wEX4A0aUKS8+RiOBiIr+8uA9ECs8bN
 Vl03pCefqLV6Bj+L87/WKvPDlpeTmXl597+8SYhKOlLzzvbsd2ifJ5UoyxVWQbs3AK3v
 u1F1qssZJ/KbKpGQp1c2MiRQlak+5cFS+kkOb5rIh5b0yPkY6YgNgyaHrOEJD4WpCq9p
 3+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=xFF5qxswQ8XcvkvdvfVY4/mMkz+/5Nm8uIdW/HNF4l0=;
 b=N2NLhYHuIPxkMfBm+MrkuefosNjELZHS1A4lpKMAeXk6QQwhPD0i+wXd+hnqHvciOh
 58CpcKxeFszlGWJITGZu2uQDGs2sJwiuMiWgsSNio05ZWlfu03ebdx9gxaAv11gnpEcO
 yr1CdcbQmTxr/JHz8FP5HMs+mvHC6awNnZd4w8iXVFro6DosRw0o7j+2SzDLjJI7ygbt
 5TB6gFwwRv6S1NTAo1+gjJXVuQOmbWZgdmCwYgdD94s8U8Wb1OAsvrWzXfISBLKo2nU+
 q3nzZtZBUDnK7Si2+i9QYL8T3fWZHa69uMV67hGhep7vFyUyT9gl7UHLHvbxM2ovvoz1
 Auqw==
X-Gm-Message-State: AOAM53304bJMiLUEBSFK8x85yza90nLsn6LBt5XNM77hXNX3O+NS4/2v
 LEXREWLQZ+RPRD4xgQ66RZh4yooTjxGp5NKu630=
X-Google-Smtp-Source: ABdhPJxyzoZmVuOGUXyZqPhNEmq3n7shEn4qdfzq8u7nGZfUD+VJvMmXZlfbSSn7oT0RWF6YqEQvDoRsCL3W6Eb4Rbc=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:10e8:: with SMTP id
 q8mr4223437qvt.59.1598999138727; Tue, 01 Sep 2020 15:25:38 -0700 (PDT)
Date: Tue,  1 Sep 2020 15:25:23 -0700
In-Reply-To: <20200901222523.1941988-1-ndesaulniers@google.com>
Message-Id: <20200901222523.1941988-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200901222523.1941988-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
Subject: [PATCH 2/2] powerpc/vdso32: link vdso64 with linker
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

Requires dropping the .got section.  I couldn't find how it was used in
the vdso32.

Fixes: commit f2af201002a8 ("powerpc/build: vdso linker warning for orphan sections")
Link: https://lore.kernel.org/lkml/CAKwvOdnn3wxYdJomvnveyD_njwRku3fABWT_bS92duihhywLJQ@mail.gmail.com/
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Not sure removing .got is a good idea or not.  Otherwise I observe the
following link error:
powerpc-linux-gnu-ld: warning: orphan section `.got' from `arch/powerpc/kernel/vdso32/sigtramp.o' being placed in section `.got'
powerpc-linux-gnu-ld: _GLOBAL_OFFSET_TABLE_ not defined in linker created .got
powerpc-linux-gnu-ld: final link failed: bad value

sigtramp.c doesn't mention anything from the GOT AFAICT, and doesn't
look like it contains relocations that do, so I'm not sure where
references to _GLOBAL_OFFSET_TABLE_ are coming from.

 arch/powerpc/kernel/vdso32/Makefile     | 7 +++++--
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 3 ++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 87ab1152d5ce..611a5951945a 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -27,6 +27,9 @@ UBSAN_SANITIZE := n
 ccflags-y := -shared -fno-common -fno-builtin -nostdlib \
 	-Wl,-soname=linux-vdso32.so.1 -Wl,--hash-style=both
 asflags-y := -D__VDSO32__ -s
+ldflags-y := -shared -soname linux-vdso32.so.1 \
+	$(call ld-option, --eh-frame-hdr) \
+	$(call ld-option, --orphan-handling=warn) -T
 
 obj-y += vdso32_wrapper.o
 extra-y += vdso32.lds
@@ -49,8 +52,8 @@ $(obj-vdso32): %.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
 
 # actual build commands
-quiet_cmd_vdso32ld = VDSO32L $@
-      cmd_vdso32ld = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ $(call cc-ldoption, -Wl$(comma)--orphan-handling=warn) -Wl,-T$(filter %.lds,$^) $(filter %.o,$^)
+quiet_cmd_vdso32ld = LD      $@
+      cmd_vdso32ld = $(cmd_ld)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
 
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 4c985467a668..0ccdebad18b8 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -61,7 +61,6 @@ SECTIONS
 	.fixup		: { *(.fixup) }
 
 	.dynamic	: { *(.dynamic) }		:text	:dynamic
-	.got		: { *(.got) }			:text
 	.plt		: { *(.plt) }
 
 	_end = .;
@@ -108,7 +107,9 @@ SECTIONS
 	.debug_varnames  0 : { *(.debug_varnames) }
 
 	/DISCARD/	: {
+		*(.got)
 		*(.note.GNU-stack)
+		*(.branch_lt)
 		*(.data .data.* .gnu.linkonce.d.* .sdata*)
 		*(.bss .sbss .dynbss .dynsbss)
 		*(.glink .iplt .plt .rela*)
-- 
2.28.0.402.g5ffc5be6b7-goog

