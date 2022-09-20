Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D5E5BE6C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 15:12:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX25b3x98z3chc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 23:12:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oaQI9fmp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX24y2Qvsz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 23:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oaQI9fmp;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MX24y05Vbz4xG7;
	Tue, 20 Sep 2022 23:12:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1663679522;
	bh=LUUxiEK29W0gO2D6WtJ1TBcE5D19HPmh7V776iZzUks=;
	h=From:To:Cc:Subject:Date:From;
	b=oaQI9fmpaEPaCtpAPSA5LnK5LSWgWLGTvdjeksw20TjTv+kyZ2j4Mr3bAeG5ypjMj
	 AEnivpL811yoFgYGyLQGfPX3fJgmUWKXDFh6FC+zAVEVioJD4YQlxWauleYo92SFsn
	 XNYv1875JQLsgCFHaLR0AAhVB9Ahy+4uSq+1pj4pZb1M1LhR8UFYeS2AUL7UFg7u9r
	 lRxI5ObqEDeIlSlRXOZ7EwwKwbtjXAJdEKbRFWyASIKgiH/oHcSe153cL/zIJ/nnAW
	 fKAdb8SjQ3Q9HikcG+FnQ/x27H4Rf1pe8rsdBrM+oBmHcgxK3b946aOkzpu1r8kMLq
	 Gza0DmYPoO4/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/64: Remove unused prom_init_toc symbols
Date: Tue, 20 Sep 2022 23:11:57 +1000
Message-Id: <20220920131157.1032707-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
made prom_init depend on CONFIG_RELOCATABLE.

But it missed cleaning up a case in the linker script for RELOCATABLE=n,
and associated symbols. Remove them now.

Fixes: 24d33ac5b8ff ("powerpc/64s: Make prom_init require RELOCATABLE")
Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/sections.h    | 3 ---
 arch/powerpc/kernel/prom_init_check.sh | 3 +--
 arch/powerpc/kernel/vmlinux.lds.S      | 5 -----
 3 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 7ed7273b7baf..9c00c9c0ca8f 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -33,9 +33,6 @@ extern long kvm_flush_link_stack;
 extern char __start_interrupts[];
 extern char __end_interrupts[];
 
-extern char __prom_init_toc_start[];
-extern char __prom_init_toc_end[];
-
 #ifdef CONFIG_PPC_POWERNV
 extern char start_real_trampolines[];
 extern char end_real_trampolines[];
diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index dfa5f729f774..311890d71c4c 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -26,8 +26,7 @@ _end enter_prom $MEM_FUNCS reloc_offset __secondary_hold
 __secondary_hold_acknowledge __secondary_hold_spinloop __start
 logo_linux_clut224 btext_prepare_BAT
 reloc_got2 kernstart_addr memstart_addr linux_banner _stext
-__prom_init_toc_start __prom_init_toc_end btext_setup_display TOC.
-relocate"
+btext_setup_display TOC. relocate"
 
 NM="$1"
 OBJ="$2"
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index d839bf78f5f2..29d891329856 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -345,11 +345,6 @@ SECTIONS
 
 	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
 		*(.got)
-#ifndef CONFIG_RELOCATABLE
-		__prom_init_toc_start = .;
-		arch/powerpc/kernel/prom_init.o*(.toc)
-		__prom_init_toc_end = .;
-#endif
 		*(.toc)
 	}
 #endif
-- 
2.37.2

