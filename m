Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9A07096AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 13:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QN4dN39lBz3fG6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 21:39:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T+46Tuva;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QN4cW1MZ9z3fD6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 21:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T+46Tuva;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QN4cQ5kF5z4x2j;
	Fri, 19 May 2023 21:39:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684496342;
	bh=NAc7Jbrbt9R2t5oRIRdebRV7rWGxeW4bzzaHTICvqRo=;
	h=From:To:Cc:Subject:Date:From;
	b=T+46TuvaC8gPkIyL1a+uFbUzvUJTbDFjUaTfV7lfc1K2daZowQL1sMickQ+C5XRUB
	 JLL2ZKiS+lXEJ3eciijEpCYGARO/KgMregjkNawTg24UaQ6rhiBy6SExkZBWObpNUp
	 87Z8imxLbc9cGggEH87s3dMY4UmwmrkXSkdO8fCM9mAwhPmjRNsmO11ngC5V5G2ry0
	 O23aMInMrAJVijHNQFdZA1StI28zZH9bKWDUCnvI2rMvIQiROyWDqazW5yhHE7m+Ko
	 EsbgHrO3Yv5ufaHtBcCOfM565q1ldgGG2LOPM6tyULRAbbsTG0oZaEioOizbKEqwTS
	 QG0isTrbxlZHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/mm: Reinstate ARCH_FORCE_MAX_ORDER ranges
Date: Fri, 19 May 2023 21:38:06 +1000
Message-Id: <20230519113806.370635-1-mpe@ellerman.id.au>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 1e8fed873e74 ("powerpc: drop ranges for definition of
ARCH_FORCE_MAX_ORDER") removed the limits on the possible values for
ARCH_FORCE_MAX_ORDER.

However removing the ranges entirely causes some common work flows to
break. For example building a defconfig (which uses 64K pages), changing
the page size to 4K, and rebuilding used to work, because
ARCH_FORCE_MAX_ORDER would be clamped to 12 by the ranges.

With the ranges removed it creates a kernel that builds but crashes at
boot:
  kernel BUG at mm/huge_memory.c:470!
  Oops: Exception in kernel mode, sig: 5 [#1]
  ...
  NIP hugepage_init+0x9c/0x278
  LR  do_one_initcall+0x80/0x320
  Call Trace:
    do_one_initcall+0x80/0x320
    kernel_init_freeable+0x304/0x3ac
    kernel_init+0x30/0x1a0
    ret_from_kernel_user_thread+0x14/0x1c

The reasoning for removing the ranges was that some of the values were
too large. So take that into account and limit the maximums to 10 which
is the default max, except for the 4K case which uses 12.

Fixes: 1e8fed873e74 ("powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

I plan to merge this via the powerpc fixes branch.

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 539d1f03ff42..bff5820b7cda 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -906,11 +906,17 @@ config DATA_SHIFT
 
 config ARCH_FORCE_MAX_ORDER
 	int "Order of maximal physically contiguous allocations"
+	range 7 8 if PPC64 && PPC_64K_PAGES
 	default "8" if PPC64 && PPC_64K_PAGES
+	range 12 12 if PPC64 && !PPC_64K_PAGES
 	default "12" if PPC64 && !PPC_64K_PAGES
+	range 8 10 if PPC32 && PPC_16K_PAGES
 	default "8" if PPC32 && PPC_16K_PAGES
+	range 6 10 if PPC32 && PPC_64K_PAGES
 	default "6" if PPC32 && PPC_64K_PAGES
+	range 4 10 if PPC32 && PPC_256K_PAGES
 	default "4" if PPC32 && PPC_256K_PAGES
+	range 10 10
 	default "10"
 	help
 	  The kernel page allocator limits the size of maximal physically
-- 
2.40.1

