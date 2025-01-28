Return-Path: <linuxppc-dev+bounces-5657-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A0FA214A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKg4QYCz30T6;
	Wed, 29 Jan 2025 09:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105079;
	cv=none; b=HhUwqYesrrCGg6/EXK1L69V0NsZzcY/noJiIdXD8I8dEiDb/ErkAIbWw0fTrVQw8M/2ZIWWvvTW+L/JB+gAomRCXjO7K3NnJLyXEZzSoxbz5mgfgtRzX3D+yPzKe0MLEVcf3iNNsdBHFT/A0fY60CC2MH1h2mEGHiN9eHwAYOB4rIlR+0izOX4BVDJ/pA7hJjAIdlL3UgWEcWRr0j/V4Vtr3P/J+sRHh8k5ub9x70UKI3t3NcYGOSZq8I/MTtoQ9fXyB1e626/dgWvanOtDzOTEjqK8ZT4lG3RHms7Vta16gRk5QgRcX6rxzOnhZE4N3KlKn5i8OTQ0lmt4zPXVdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105079; c=relaxed/relaxed;
	bh=JDU+Yl6m1UnkHr8giz6O/T93Pkf7ACkqETDDjHn026o=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hNN6DvgZVg/IzKmMR6CFU1+v8ekKZpbmQIcZx8xxvia55dBUhqah/8Xcl/mZXVTP5QCmHuV08VYQASOetq4YvmcOMKRiOIG9nP202wTg7/MoRJn2t1MrQpkvdzqRBtQBZbJ6yFI+TobmdQsLnni/vnqm5Jh0NUcAqwE5XT9Lt8ZWW8e5hqBT6drfLERpTkBWKpLBttBjiFnCC0tiHKWNA2NjZ8eJ/5t6lNab4GBr0Gq8bfOmfgMYCrNJ2WeuZ79oa+rTLROPmHF2p6LHF4f1Iur45axlWpntclbnaW+MZ7xmOjs2dxWUL/uDeizmCLs0LmjBKN8WQourk4KzSN0vLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wa0FEc03; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wa0FEc03;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKd224Cz3005
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=JDU+Yl6m1UnkHr8giz6O/T93Pkf7ACkqETDDjHn026o=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=wa0FEc03/+bTxyA1Z287mkELrpHVJN0qjS0ksUwazXQ7/eG2jMYv+7SVbYVv8hLBE
	 omFCpVTUnqJJcaQMjrZ+jE5RuD+0nCeUFuYkI4HdTKE2bBgk+McV0jQFgqH3lGFfWX
	 Kkp5jFFHyp6rzMkpCSCg7jrZtBmY+xMUr/yMtDjrlxFHS8HrLjJBR7dBR7WRN0KqJp
	 CuInEwrGAKb4vbijjCmWrwQcz8po2HgI3bwQ6o06UMNp8DmiubyLiAM0PlOMo4zmW4
	 PA1RBA7T8jKHLyMGlfM1J+D3nnjK7d4jR6rz/8m83DxazqrT2YzYpO7SGhc72IJynG
	 peCRh8ue1iTZg==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR34RNz4wc3; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:53:44 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc: Define config option for processors without
 broadcast TLBIE
Message-ID: <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Power ISA v3.1 implementations in the Linux Compliancy Subset and
lower are not required to implement broadcast TLBIE, and in fact
Microwatt doesn't.  To avoid the need to specify "disable_tlbie" on
the kernel command line on SMP Microwatt systems, this defines a
config option that asserts that broadcast TLBIE should never be used
(the kernel will instead use IPIs to trigger local TLBIEs on other
CPUs when required).

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++++++--
 arch/powerpc/platforms/Kconfig.cputype   | 12 ++++++++++++
 arch/powerpc/platforms/microwatt/Kconfig |  1 +
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 374542528080..14ee96e2a581 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -588,10 +588,16 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 }
 #endif
 
+#ifndef CONFIG_PPC_RADIX_NO_BROADCAST_TLBIE
+#define DEFAULT_TLBIE_ENABLE	true
+#else
+#define DEFAULT_TLBIE_ENABLE	false
+#endif
+
 /*
  * Does the CPU support tlbie?
  */
-bool tlbie_capable __read_mostly = true;
+bool tlbie_capable __read_mostly = DEFAULT_TLBIE_ENABLE;
 EXPORT_SYMBOL(tlbie_capable);
 
 /*
@@ -599,7 +605,7 @@ EXPORT_SYMBOL(tlbie_capable);
  * address spaces? tlbie may still be used for nMMU accelerators, and for KVM
  * guest address spaces.
  */
-bool tlbie_enabled __read_mostly = true;
+bool tlbie_enabled __read_mostly = DEFAULT_TLBIE_ENABLE;
 
 static int __init setup_disable_tlbie(char *str)
 {
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 1453ccc900c4..bd2a4e46ab34 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -449,6 +449,18 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
+config PPC_RADIX_NO_BROADCAST_TLBIE
+	depends on PPC_RADIX_MMU
+	help
+	  Power ISA v3.1 implementations in the Linux Compliancy Subset
+	  and lower are not required to implement broadcast TLBIE
+	  instructions, that is, a TLB invalidation instruction
+	  performed on one CPU is not required to operate on the TLBs
+	  in all CPUs in the system.  Instead, the kernel does an IPI
+	  to each relevant CPU to get it to do a local TLBIE instruction.
+	  Select this option to force global invalidations to be done via
+	  IPIs unconditionally.
+
 config PPC_KERNEL_PREFIXED
 	depends on PPC_HAVE_PREFIXED_SUPPORT
 	depends on CC_HAS_PREFIXED
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 5e41adadac1f..1d5cc1ae3636 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -7,6 +7,7 @@ config PPC_MICROWATT
 	select PPC_ICP_NATIVE
 	select PPC_UDBG_16550
 	select COMMON_CLK
+	select PPC_RADIX_NO_BROADCAST_TLBIE
 	help
           This option enables support for FPGA-based Microwatt implementations.
 
-- 
2.47.1


