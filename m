Return-Path: <linuxppc-dev+bounces-5732-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085CA2398A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 07:30:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkmGm1pttz30Vn;
	Fri, 31 Jan 2025 17:30:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738305024;
	cv=none; b=Esjsq36f6ZVED0rVZdlGaNT7BSHe+Ou7AEvUG0FB71m40/Pa0TnTonz4Y04ZdS7X/5+R1z5z+IOAOu9cf+j/GomJETUUyCt5u8nIArROZNvth+hAoghwk42riObGMDpmG6ElqWVoKI4TwE2/pjLBpBBMqoBEi7BT5iXtxFw95ElFbgTUZKP7lIpCJ21yf2+NIFn6BCR+qqbl5B0iLyrTGKaW/EntzWplqHixLdw2iuPE7xKQlGpt+1E8dPXZsd/xKa/F+rFg4nVRwH7hc5F0TlQIO1a5AL+mvCL+LHPTa8kP/CkslIGYROeU+fu3BaVdXDIjIjWyePO1GTAesOB94A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738305024; c=relaxed/relaxed;
	bh=UvZz56ssisQx9HVK8XsyRQh4x5oWqkj3G9is77DCAGc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSCfPS8JsejLTQuiXBXuBnVBgmW4YvDtUMPxcUtoa/gEZ0/f7fIqai+gP22yAURNT07qVaO3lyNjTGlj00cAaiRS4LZ27hlEDbNpMyNJlrXWooE2bdiAeREdduj1yI6ESRMU3Ykx5iTPCVCmC+84Dc1iAEZuXWw3egL1B84lYnlHvzHt9ONJwJX7D2OMLssj9XC09sy5nLwZqTosxejfZIygvxX/0viqOrFNMmvEQ0mYo1cR4j6rN3+WzKVcnl6wWkvj57+a/W6OMoA8J2M/hYlTOR9DVkJOdU9iE8Zuo/y9u27cFzs+mgqnuE2F/yeEopOh9hH6GSYcHt5QhtYYJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=HWp5dJy/; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=HWp5dJy/;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkmGj2Hq6z2yMF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 17:30:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738305012;
	bh=UvZz56ssisQx9HVK8XsyRQh4x5oWqkj3G9is77DCAGc=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=HWp5dJy/BI32jvZgpHgjfVGPMM8lC196H5vd3F6nGZ9g7vmqJdDV5gOOYnMsLF9Yq
	 2m3e5LbVSFkwnM8nq1levUx/nIqB4ixeyihxjs+Tdv+iZmTIxPe1aM3iXqsPfS5QVY
	 CiBgudRfRIFMeUv65ogjr+ekCk/ThZhUuEqznoqJ4ZZ5FgFrqwS2UrMa/9NzZhJdeK
	 H3kn3Jt59ZKt3Y/phUvXJvP/FXs6m/bMsRp+bxjUnXlUFicCaBJZhdu+tW+y+dUGL7
	 X2rTTfx91EtGsPUzOx7NrxNxhCZqEpZYf4jKbt7ZoOp2Fg8sr1ojTmp4pdcQ+zN7a0
	 CRD+zP9lnjfWQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YkmGX1kHPz4x6V; Fri, 31 Jan 2025 17:30:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 17:29:17 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] powerpc: Define config option for processors with
 broadcast TLBIE
Message-ID: <Z5xtvdozEfEmRyeI@thinks.paulus.ozlabs.org>
References: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
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
In-Reply-To: <Z5xtIVa0y7lTDTU3@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Power ISA v3.0 (and later) implementations in the Linux Compliancy
Subset and lower are not required to implement broadcast TLBIE, and in
fact Microwatt doesn't.

To avoid the need to specify "disable_tlbie" on the kernel command
line on SMP Microwatt systems, this defines a config option that
asserts that the platform implements broadcast TLBIE.  This option is
selected by the pseries and powernv platforms, but not by microwatt.
Note that this option is only relevant when the radix MMU is being
used, so platforms without a radix MMU don't need it.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
v2: Made the option positive (has broadcast) rather than negative

 arch/powerpc/mm/book3s64/pgtable.c     |  4 ++--
 arch/powerpc/platforms/Kconfig.cputype | 13 +++++++++++++
 arch/powerpc/platforms/powernv/Kconfig |  1 +
 arch/powerpc/platforms/pseries/Kconfig |  1 +
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 374542528080..da0bba29a9d7 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -591,7 +591,7 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd_ptl,
 /*
  * Does the CPU support tlbie?
  */
-bool tlbie_capable __read_mostly = true;
+bool tlbie_capable __read_mostly = IS_ENABLED(CONFIG_PPC_RADIX_BROADCAST_TLBIE);
 EXPORT_SYMBOL(tlbie_capable);
 
 /*
@@ -599,7 +599,7 @@ EXPORT_SYMBOL(tlbie_capable);
  * address spaces? tlbie may still be used for nMMU accelerators, and for KVM
  * guest address spaces.
  */
-bool tlbie_enabled __read_mostly = true;
+bool tlbie_enabled __read_mostly = IS_ENABLED(CONFIG_PPC_RADIX_BROADCAST_TLBIE);
 
 static int __init setup_disable_tlbie(char *str)
 {
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 1453ccc900c4..613b383ed8b3 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -449,6 +449,19 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
+config PPC_RADIX_BROADCAST_TLBIE
+	bool
+	depends on PPC_RADIX_MMU
+	help
+	  Power ISA v3.0 and later implementations in the Linux Compliancy Subset
+	  and lower are not required to implement broadcast TLBIE instructions.
+	  Platforms with CPUs that do implement TLBIE broadcast, that is, where
+	  a TLB invalidation instruction performed on one CPU operates on the
+	  TLBs of all CPUs in the system, should select this option.  If this
+	  option is selected, the disable_tlbie kernel command line option can
+	  be used to cause global TLB invalidations to be done via IPIs; without
+	  it, IPIs will be used unconditionally.
+
 config PPC_KERNEL_PREFIXED
 	depends on PPC_HAVE_PREFIXED_SUPPORT
 	depends on CC_HAS_PREFIXED
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 70a46acc70d6..3fbe0295ce14 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -17,6 +17,7 @@ config PPC_POWERNV
 	select MMU_NOTIFIER
 	select FORCE_SMP
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select PPC_RADIX_BROADCAST_TLBIE
 	default y
 
 config OPAL_PRD
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 42fc66e97539..206dfa0a3b33 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -23,6 +23,7 @@ config PPC_PSERIES
 	select FORCE_SMP
 	select SWIOTLB
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select PPC_RADIX_BROADCAST_TLBIE
 	default y
 
 config PARAVIRT
-- 
2.47.1



