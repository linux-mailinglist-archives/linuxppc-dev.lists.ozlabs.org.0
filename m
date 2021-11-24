Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6922945B7B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 10:45:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzbjF1ySPz3dcX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 20:45:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UAkoGlTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzbdL0bqqz2yb6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 20:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=UAkoGlTK; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HzbdK6bPhz4xZ4;
 Wed, 24 Nov 2021 20:42:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637746934;
 bh=ZECkOnEEXB+wfhbAI0017a6B5h7xgNeMG2pcpShSANc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UAkoGlTKgr4Aw1ZzOvThKEZG2/BLYm+yws4Cm8LO9o1+KAjUOvDkdkDXw4P9TUAuJ
 GGbTM/iJCQrRIR/7/2yKi/w2+KfBekbR4iilVcY9OvHJys3xJuIO6gybMw6Q+4cAc0
 i4ZIFcLN8r1V3r90/UoiTqFBahOvht0ixWWTkRyf7yc9mtWZ/oE0987CM5ep12PMd+
 GEqz6Byf67MBtLu7hB1nhpTTsgZV651ulev3zMPLIc8jJYcdFmrqZeYVMSR0Lx80RV
 Mtqg9Nrth82od5sPoYC7CJO5SGEW/3x9Tyrw3Obm7IU3ZiKygGrCkQ/S9QJRhiNqLA
 G8jhWoQ1QeQsQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 6/6] powerpc: Mark probe_machine() __init and static
Date: Wed, 24 Nov 2021 20:32:54 +1100
Message-Id: <20211124093254.1054750-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211124093254.1054750-1-mpe@ellerman.id.au>
References: <20211124093254.1054750-1-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prior to commit b1923caa6e64 ("powerpc: Merge 32-bit and 64-bit
setup_arch()") probe_machine() was called from setup_32/64.c and lived
in setup-common.c. But now it's only called from setup-common.c so it
can be static and __init, and we don't need the declaration in
machdep.h either.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/machdep.h | 2 --
 arch/powerpc/kernel/setup-common.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 9c3c9f04129f..e821037f74f0 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -235,8 +235,6 @@ extern struct machdep_calls *machine_id;
 		machine_id == &mach_##name; \
 	})
 
-extern void probe_machine(void);
-
 #ifdef CONFIG_PPC_PMAC
 /*
  * Power macintoshes have either a CUDA, PMU or SMU controlling
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 4f1322b65760..f8da937df918 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -582,7 +582,7 @@ static __init int add_pcspkr(void)
 device_initcall(add_pcspkr);
 #endif	/* CONFIG_PCSPKR_PLATFORM */
 
-void probe_machine(void)
+static __init void probe_machine(void)
 {
 	extern struct machdep_calls __machine_desc_start;
 	extern struct machdep_calls __machine_desc_end;
-- 
2.31.1

