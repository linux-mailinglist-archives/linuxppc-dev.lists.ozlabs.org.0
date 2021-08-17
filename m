Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00663EE0DC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 02:22:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpWth4PfCz3bNm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 10:22:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=jkUmqiWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3awebyqwkdiarhiweyprmivwksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=jkUmqiWk; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpWt13zKKz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 10:21:27 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 c63-20020a25e5420000b0290580b26e708aso18508197ybh.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3mIJT3ikKBz70xHqPeYP9DUuj3yJmyYSvnlROWprNU0=;
 b=jkUmqiWkUIn11XZwndfNewlhPuEQQy8ysb2pdFSiPo5hAHF2dxek21dMO+EdjI7641
 /QeXZBfXv0zovdWxI0x5OjZ30z+ss9QsEBiRa/67SyuQm48imip28lKvf9UeImZt1uUe
 ZS2zuIMf3X5fCZCnXYrDxAu/NxPAN/UPBHgVFRlgUOHFpU3WZWgNosd4NNATCZ8666aR
 HQ2Ubw0j/af2Yhf0zeBGo8lD7GmzghODJyC0K6zT6/xIpOVOHUi6ID/HVcsW2Aadifqo
 K7fO0AGZlV23M+MHKq/xh76t24+tK9cwHpW34jjrZYXB5aDlRZU3STy/oLio97USMv+4
 f8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3mIJT3ikKBz70xHqPeYP9DUuj3yJmyYSvnlROWprNU0=;
 b=p1t6d6naY+2h2Bs7+RaYnDkr4fvC78RH22ZQnpuRbbRl4dBPwSH27plEmwoF+Od/vl
 /sDCAtX7fX9oBxu1GhF5DmjN+LMZ0iL3hI2xRE6qdwhRK2fe4AAJjxkn7WB2PQoKfZLF
 wMH5PGkUscbkFt4qA04zbfQrmr2x2+Wt2hCV+BA6VuTX7f6ricVe7chfzwtJ5mqFSJel
 yY5bLqW0GLT+4nu5k2tqmSRmXwjMgC2KEqsyxtVPzF2GcsWbwVAKnyN4EMwHJzM8tQ8o
 j66xH3NEj55ChBm++2gX+DpB35ETTb4BDQPDbUvg1Dv8YX5206g9KyESIZrNe1+za2uw
 qn9A==
X-Gm-Message-State: AOAM5329yd8yfv+ho9KEJ8LTiXS81wgjHR5BtsPNhuhbhUqd89ZipuwX
 AdZbmdnJCefZSBiEYucnVYs7lwNhl2ezz4nGRkA=
X-Google-Smtp-Source: ABdhPJz+WFisbuTUhA9xMZaACAa+nhKyIKSUZly6CfYDeYL5RkUfu40rrbH/kYqR1wHiskhIB9bQNCgkGJwAypmpY8g=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a25:ca8b:: with SMTP id
 a133mr882102ybg.339.1629159683765; Mon, 16 Aug 2021 17:21:23 -0700 (PDT)
Date: Mon, 16 Aug 2021 17:21:05 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-4-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/powerpc/Makefile      | 12 ++++++------
 arch/powerpc/boot/Makefile |  5 +----
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9aaf1abbc641..85e224536cf7 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -12,12 +12,12 @@
 # Rewritten by Cort Dougan and Paul Mackerras
 #
 
-HAS_BIARCH	:= $(call cc-option-yn, -m32)
+HAS_BIARCH	:= $(call cc-option,-m32)
 
 # Set default 32 bits cross compilers for vdso and boot wrapper
 CROSS32_COMPILE ?=
 
-ifeq ($(HAS_BIARCH),y)
+ifeq ($(HAS_BIARCH),-m32)
 ifeq ($(CROSS32_COMPILE),)
 ifdef CONFIG_PPC32
 # These options will be overridden by any -mcpu option that the CPU
@@ -107,7 +107,7 @@ cflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 aflags-$(CONFIG_CPU_BIG_ENDIAN)		+= $(call cc-option,-mbig-endian)
 aflags-$(CONFIG_CPU_LITTLE_ENDIAN)	+= -mlittle-endian
 
-ifeq ($(HAS_BIARCH),y)
+ifeq ($(HAS_BIARCH),-m32)
 KBUILD_CFLAGS	+= -m$(BITS)
 KBUILD_AFLAGS	+= -m$(BITS) -Wl,-a$(BITS)
 KBUILD_LDFLAGS	+= -m elf$(BITS)$(LDEMULATION)
@@ -125,7 +125,9 @@ LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
-ifeq ($(call cc-option-yn,-mcmodel=medium),y)
+ifeq ($(call cc-option,-mcmodel=medium),)
+	export NO_MINIMAL_TOC := -mno-minimal-toc
+else
 	# -mcmodel=medium breaks modules because it uses 32bit offsets from
 	# the TOC pointer to create pointers where possible. Pointers into the
 	# percpu data area are created by this method.
@@ -135,8 +137,6 @@ ifeq ($(call cc-option-yn,-mcmodel=medium),y)
 	# kernel percpu data space (starting with 0xc...). We need a full
 	# 64bit relocation for this to work, hence -mcmodel=large.
 	KBUILD_CFLAGS_MODULE += -mcmodel=large
-else
-	export NO_MINIMAL_TOC := -mno-minimal-toc
 endif
 endif
 
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 10c0fb306f15..33e1de5d1c95 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -66,10 +66,7 @@ ifdef CONFIG_DEBUG_INFO
 BOOTCFLAGS	+= -g
 endif
 
-ifeq ($(call cc-option-yn, -fstack-protector),y)
-BOOTCFLAGS	+= -fno-stack-protector
-endif
-
+BOOTCFLAGS	+= $(call cc-option,-fstack-protector)
 BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
 
 DTC_FLAGS	?= -p 1024
-- 
2.33.0.rc1.237.g0d66db33f3-goog

