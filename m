Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66C27715C8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 17:12:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KLkKdI5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJjbp6c1Fz3cRZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 01:12:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KLkKdI5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJjYZ0Qbxz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 01:10:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0DEFC61174;
	Sun,  6 Aug 2023 15:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35C6C433C8;
	Sun,  6 Aug 2023 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691334603;
	bh=5JuPDdGdNSdC6jvwQjYgOzHSi5Pn01pg2y6QTgxwK2g=;
	h=From:To:Cc:Subject:Date:From;
	b=KLkKdI5lLi4SHQl3IHqPWzr2igRldhC6jq4OWQ17vLglvb5Q2TMa+cUhZGK8U2CQ5
	 d6oXhG0rIAWgXtDqeHUZoLB0ZIREba2bI3VLZolV2gyYmrzj3Y4k5/DHU7jL6hJ+oq
	 +MoiTp/ajQo6beK/lrE5Gaq0m0ulTwQ641wezV7si23g8XGoDB6CIv03g9df9sX/il
	 ZHCxEtTDHYgAxxowPwpWhZFdJE4EMy9imJo9y/+mvs8EOsud9NhXVPdBtiosoK/4E8
	 XsAWUiZrGRO9MGovXKs7nIYwlloX7Hi81Eui/oPotJ4feacahbsuKRuKFItnye9ng6
	 eXDwRpCGJW1Dg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc: remove unneeded #include <asm/export.h>
Date: Mon,  7 Aug 2023 00:09:52 +0900
Message-Id: <20230806150954.394189-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-arch@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no EXPORT_SYMBOL line there, hence #include <asm/export.h>
is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/entry_32.S              | 1 -
 arch/powerpc/kernel/head_40x.S              | 1 -
 arch/powerpc/kernel/head_44x.S              | 1 -
 arch/powerpc/kernel/head_64.S               | 1 -
 arch/powerpc/kernel/head_85xx.S             | 1 -
 arch/powerpc/kernel/head_8xx.S              | 1 -
 arch/powerpc/kernel/head_book3s_32.S        | 1 -
 arch/powerpc/kernel/trace/ftrace_64_pg.S    | 1 -
 arch/powerpc/kernel/trace/ftrace_mprofile.S | 1 -
 9 files changed, 9 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index fe27d41f9a3d..9692acb0361f 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -29,7 +29,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 #include <asm/ptrace.h>
-#include <asm/export.h>
 #include <asm/feature-fixups.h>
 #include <asm/barrier.h>
 #include <asm/kup.h>
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 3f68a1624646..b32e7b2ebdcf 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -38,7 +38,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
-#include <asm/export.h>
 
 #include "head_32.h"
 
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index 63a85c16fef4..a3197c9f721c 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -35,7 +35,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
 #include <asm/synch.h>
-#include <asm/export.h>
 #include <asm/code-patching-asm.h>
 #include "head_booke.h"
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 6440b1bb332a..4690c219bfa4 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -40,7 +40,6 @@
 #include <asm/hw_irq.h>
 #include <asm/cputhreads.h>
 #include <asm/ppc-opcode.h>
-#include <asm/export.h>
 #include <asm/feature-fixups.h>
 #ifdef CONFIG_PPC_BOOK3S
 #include <asm/exception-64s.h>
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index fdbee1093e2b..97e9ea0c7297 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -40,7 +40,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/cache.h>
 #include <asm/ptrace.h>
-#include <asm/export.h>
 #include <asm/feature-fixups.h>
 #include "head_booke.h"
 
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index a79751e05781..647b0b445e89 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -29,7 +29,6 @@
 #include <asm/ppc_asm.h>
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
-#include <asm/export.h>
 #include <asm/code-patching-asm.h>
 #include <asm/interrupt.h>
 
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index c51f28b5abc0..6764b98ca360 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -31,7 +31,6 @@
 #include <asm/ptrace.h>
 #include <asm/bug.h>
 #include <asm/kvm_book3s_asm.h>
-#include <asm/export.h>
 #include <asm/feature-fixups.h>
 #include <asm/interrupt.h>
 
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.S b/arch/powerpc/kernel/trace/ftrace_64_pg.S
index 6708e24db0ab..cdbcb5a0783b 100644
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg.S
@@ -8,7 +8,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ftrace.h>
 #include <asm/ppc-opcode.h>
-#include <asm/export.h>
 
 _GLOBAL_TOC(ftrace_caller)
 	lbz	r3, PACA_FTRACE_ENABLED(r13)
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_mprofile.S
index 1f7d86de1538..600406716d66 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_mprofile.S
@@ -8,7 +8,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ftrace.h>
 #include <asm/ppc-opcode.h>
-#include <asm/export.h>
 #include <asm/thread_info.h>
 #include <asm/bug.h>
 #include <asm/ptrace.h>
-- 
2.39.2

