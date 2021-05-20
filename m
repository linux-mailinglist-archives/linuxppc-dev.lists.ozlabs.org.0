Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 987FD389BDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 05:29:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlwGQ4KGrz3brw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 13:29:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlwG43fYBz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 13:29:30 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 1AEBFAE8000E;
 Wed, 19 May 2021 23:29:21 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH kernel] powerpc: Fix early setup to make early_ioremap work
Date: Thu, 20 May 2021 13:29:19 +1000
Message-Id: <20210520032919.358935-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The immediate problem is that after
0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
the kernel silently reboots. The reason is that early_ioremap() returns
broken addresses as it uses slot_virt[] array which initialized with
offsets from FIXADDR_TOP == IOREMAP_END+FIXADDR_SIZE ==
KERN_IO_END- FIXADDR_SIZ + FIXADDR_SIZE == __kernel_io_end which is 0
when early_ioremap_setup() is called. __kernel_io_end is initialized
little bit later in early_init_mmu().

This fixes the initialization by swapping early_ioremap_setup and
early_init_mmu.

This also fixes IOREMAP_END to use FIXADDR_SIZE defined just next to it,
seems to make sense, unless there is some weird logic with redefining
FIXADDR_SIZE as the compiling goes.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/kernel/setup_64.c               | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a666d561b44d..54a06129794b 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -325,8 +325,8 @@ extern unsigned long pci_io_base;
 #define  PHB_IO_END	(KERN_IO_START + FULL_IO_SIZE)
 #define IOREMAP_BASE	(PHB_IO_END)
 #define IOREMAP_START	(ioremap_bot)
-#define IOREMAP_END	(KERN_IO_END - FIXADDR_SIZE)
 #define FIXADDR_SIZE	SZ_32M
+#define IOREMAP_END	(KERN_IO_END - FIXADDR_SIZE)
 
 /* Advertise special mapping type for AGP */
 #define HAVE_PAGE_AGP
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index b779d25761cf..ce09fe5debf4 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -369,11 +369,12 @@ void __init early_setup(unsigned long dt_ptr)
 	apply_feature_fixups();
 	setup_feature_keys();
 
-	early_ioremap_setup();
 
 	/* Initialize the hash table or TLB handling */
 	early_init_mmu();
 
+	early_ioremap_setup();
+
 	/*
 	 * After firmware and early platform setup code has set things up,
 	 * we note the SPR values for configurable control/performance
-- 
2.30.2

