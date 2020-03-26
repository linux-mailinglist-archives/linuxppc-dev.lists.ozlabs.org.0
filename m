Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B386F19447B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 17:39:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p9gt4fxczDr0L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 03:39:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p9dd2XrRzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 03:37:56 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD63FACCE;
 Thu, 26 Mar 2020 16:37:48 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>, Thomas Gleixner <tglx@linutronix.de>,
 Russell Currey <ruscur@russell.cc>, Michal Suchanek <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/64: Fix section mismatch warnings.
Date: Thu, 26 Mar 2020 17:37:42 +0100
Message-Id: <20200326163742.28990-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.23.0
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

Fixes the following warnings:

WARNING: vmlinux.o(.text+0x2d24): Section mismatch in reference from the variable __boot_from_prom to the function .init.text:prom_init()
The function __boot_from_prom() references
the function __init prom_init().
This is often because __boot_from_prom lacks a __init
annotation or the annotation of prom_init is wrong.

WARNING: vmlinux.o(.text+0x2fd0): Section mismatch in reference from the variable start_here_common to the function .init.text:start_kernel()
The function start_here_common() references
the function __init start_kernel().
This is often because start_here_common lacks a __init
annotation or the annotation of start_kernel is wrong.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/head_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index ad79fddb974d..4afb82f1b7c7 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -537,6 +537,7 @@ __start_initialization_multiplatform:
 	b	__after_prom_start
 #endif /* CONFIG_PPC_BOOK3E */
 
+__REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
 	/* Save parameters */
@@ -574,6 +575,7 @@ __boot_from_prom:
 	/* We never return. We also hit that trap if trying to boot
 	 * from OF while CONFIG_PPC_OF_BOOT_TRAMPOLINE isn't selected */
 	trap
+	.previous
 
 __after_prom_start:
 #ifdef CONFIG_RELOCATABLE
@@ -980,6 +982,7 @@ start_here_multiplatform:
 	.previous
 	/* This is where all platforms converge execution */
 
+__REF
 start_here_common:
 	/* relocation is on at this point */
 	std	r1,PACAKSAVE(r13)
@@ -1001,6 +1004,7 @@ start_here_common:
 	/* Not reached */
 	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
+	.previous
 
 /*
  * We put a few things here that have to be page-aligned.
-- 
2.16.4

