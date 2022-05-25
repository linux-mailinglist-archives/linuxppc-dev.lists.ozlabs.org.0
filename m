Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1446D5335D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 05:28:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7GkV74DSz3bxt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 13:28:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b+cO+/rH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Gh52ph0z3bbV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 13:26:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=b+cO+/rH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L7Gh36NTqz4xXg;
 Wed, 25 May 2022 13:26:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1653449203;
 bh=n/3ns0H//VfRhKNoO+NlPF5S2Z+X9/PKdIBLevlIVsc=;
 h=From:To:Cc:Subject:Date:From;
 b=b+cO+/rHgE6gAYCpHsD3x8QsRelqD63Be/uO5u8WHb/9Zij7U44bkYaSvTC4oA0e8
 KDpdLGICW4f2HHPotwlBd8DCzev1Gf7SO4Yz9zw4jN3XX0+C+L3mwX4DVpSCyEF6Yc
 1eAzW4pfbur8+ctsZh1NvKReJsZ85BuOUA12IzA+/UEUbRkowSKtx/jC6RCBxeIFEk
 VQSXSBtZe/BNdkWtAgRCioCFAOjAnERJUnd+zZ6CmQXSD13Hgfe2gAsA/G9hddJkaV
 3gYm97xyhBFeRonFgetqWY+IBKdhfd1GFS+2+823bhjO3buSC0DmNn0RvO7MCGiB29
 s8OIg104C5XJw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
Date: Wed, 25 May 2022 13:26:39 +1000
Message-Id: <20220525032639.1947280-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HAVE_IRQ_EXIT_ON_IRQ_STACK option tells generic code that irq_exit()
is called while still running on the hard irq stack (hardirq_ctx[] in
the powerpc code).

Selecting the option means the generic code will *not* switch to the
softirq stack before running softirqs, because the code is already
running on the (mostly empty) hard irq stack.

But since commit 1b1b6a6f4cc0 ("powerpc: handle irq_enter/irq_exit in
interrupt handler wrappers"), irq_exit() is now called on the regular task
stack, not the hard irq stack.

That's because previously irq_exit() was called in __do_irq() which is
run on the hard irq stack, but now it is called in
interrupt_async_exit_prepare() which is called from do_irq() constructed
by the wrapper macro, which is after the switch back to the task stack.

So drop HAVE_IRQ_EXIT_ON_IRQ_STACK from the Kconfig. This will mean an
extra stack switch when processing some interrupts, but should
significantly reduce the likelihood of stack overflow.

It also means the softirq stack will be used for running softirqs from
other interrupts that don't use the hard irq stack, eg. timer interrupts.

Fixes: 1b1b6a6f4cc0 ("powerpc: handle irq_enter/irq_exit in interrupt handler wrappers")
Cc: stable@vger.kernel.org # v5.12+
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f5ed355e75e6..7e7d12ae9ecb 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -221,7 +221,6 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IOREMAP_PROT
-	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZMA			if DEFAULT_UIMAGE
-- 
2.35.3

