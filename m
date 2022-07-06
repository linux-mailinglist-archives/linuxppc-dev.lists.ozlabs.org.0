Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB44D567B22
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 02:33:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ld0rc4lPNz3c2l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 10:33:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HB0NeYjL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=igxa=xl=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=HB0NeYjL;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ld0qz3vKBz2xmc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 10:32:47 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E1590B81A46;
	Wed,  6 Jul 2022 00:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03447C341C7;
	Wed,  6 Jul 2022 00:32:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="HB0NeYjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1657067556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8hY50EUIwXyXEL9Dt6kCiCr6Rdb7d35iCkloytNyu8=;
	b=HB0NeYjL0fi6oMfAXC2OUAK5iqiyu2gygmneDxyQWnSA98FO7S2ySfZZ60wuRpbXHGGyYE
	TQivwkgZkDcK7VMzXpSxuB/Hhdqj2CZ14CwkKjgCc/ohq4uqSFbdDGSttS9Vepz7dYS3ci
	cqxV+CxoOAzsNPKC0aRgFy1lLqpqYns=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4558f604 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO);
	Wed, 6 Jul 2022 00:32:36 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Heiko Carstens <hca@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2] random: remove CONFIG_ARCH_RANDOM
Date: Wed,  6 Jul 2022 02:32:25 +0200
Message-Id: <20220706003225.335768-1-Jason@zx2c4.com>
In-Reply-To: <YsTXI3J+ptkN/vb4@zx2c4.com>
References: <YsTXI3J+ptkN/vb4@zx2c4.com>
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

When RDRAND was introduced, there was much discussion on whether it
should be trusted and how the kernel should handle that. Initially, two
mechanisms cropped up, CONFIG_ARCH_RANDOM, a compile time switch, and
"nordrand", a boot-time switch.

Later the thinking evolved. With a properly designed RNG, using RDRAND
values alone won't harm anything, even if the outputs are malicious.
Rather, the issue is whether those values are being *trusted* to be good
or not. And so a new set of options were introduced as the real
ones that people use -- CONFIG_RANDOM_TRUST_CPU and "random.trust_cpu".
With these options, RDRAND is used, but it's not always credited. So in
the worst case, it does nothing, and in the best case, maybe it helps.

Along the way, CONFIG_ARCH_RANDOM's meaning got sort of pulled into the
center and became something certain platforms force-select.

The old options don't really help with much, and it's a bit odd to have
special handling for these instructions when the kernel can deal fine
with the existence or untrusted existence or broken existence or
non-existence of that CPU capability.

So this commit simplifies things down to the two options that are
actually used, and removes the confusing old ones that aren't used or
useful. It leaves "nordrand" for now, as the removal of that will take a
different route.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/arm64/Kconfig                                |  8 --------
 arch/arm64/include/asm/archrandom.h               | 10 ----------
 arch/arm64/kernel/cpufeature.c                    |  2 --
 arch/powerpc/Kconfig                              |  3 ---
 arch/powerpc/include/asm/archrandom.h             |  3 ---
 arch/powerpc/include/asm/machdep.h                |  2 --
 arch/powerpc/platforms/microwatt/Kconfig          |  1 -
 arch/powerpc/platforms/powernv/Kconfig            |  1 -
 arch/powerpc/platforms/pseries/Kconfig            |  1 -
 arch/s390/Kconfig                                 | 15 ---------------
 arch/s390/configs/zfcpdump_defconfig              |  1 -
 arch/s390/crypto/Makefile                         |  2 +-
 arch/s390/include/asm/archrandom.h                |  3 ---
 arch/x86/Kconfig                                  |  9 ---------
 arch/x86/include/asm/archrandom.h                 | 10 +---------
 arch/x86/kernel/cpu/rdrand.c                      |  2 --
 drivers/char/Kconfig                              |  1 -
 drivers/char/hw_random/s390-trng.c                |  9 ---------
 include/linux/random.h                            |  9 +--------
 .../selftests/wireguard/qemu/kernel.config        |  1 -
 20 files changed, 3 insertions(+), 90 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1652a9800ebe..1880f71c2547 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1858,14 +1858,6 @@ config ARM64_E0PD
 
 	  This option enables E0PD for TTBR1 where available.
 
-config ARCH_RANDOM
-	bool "Enable support for random number generation"
-	default y
-	help
-	  Random number generation (part of the ARMv8.5 Extensions)
-	  provides a high bandwidth, cryptographically secure
-	  hardware random number generator.
-
 config ARM64_AS_HAS_MTE
 	# Initial support for MTE went in binutils 2.32.0, checked with
 	# ".arch armv8.5-a+memtag" below. However, this was incomplete
diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
index 3a6b6d38c5b8..c3b9fa56af67 100644
--- a/arch/arm64/include/asm/archrandom.h
+++ b/arch/arm64/include/asm/archrandom.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_ARCHRANDOM_H
 #define _ASM_ARCHRANDOM_H
 
-#ifdef CONFIG_ARCH_RANDOM
-
 #include <linux/arm-smccc.h>
 #include <linux/bug.h>
 #include <linux/kernel.h>
@@ -167,12 +165,4 @@ arch_get_random_seed_long_early(unsigned long *v)
 }
 #define arch_get_random_seed_long_early arch_get_random_seed_long_early
 
-#else /* !CONFIG_ARCH_RANDOM */
-
-static inline bool __init smccc_probe_trng(void)
-{
-	return false;
-}
-
-#endif /* CONFIG_ARCH_RANDOM */
 #endif /* _ASM_ARCHRANDOM_H */
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 8d88433de81d..0e9462abeb77 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2416,7 +2416,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.cpu_enable = cpu_enable_e0pd,
 	},
 #endif
-#ifdef CONFIG_ARCH_RANDOM
 	{
 		.desc = "Random Number Generator",
 		.capability = ARM64_HAS_RNG,
@@ -2428,7 +2427,6 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.sign = FTR_UNSIGNED,
 		.min_field_value = 1,
 	},
-#endif
 #ifdef CONFIG_ARM64_BTI
 	{
 		.desc = "Branch Target Identification",
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c2ce2e60c8f0..0d5757c125c4 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1248,9 +1248,6 @@ config PHYSICAL_START
 	default "0x00000000"
 endif
 
-config	ARCH_RANDOM
-	def_bool n
-
 config PPC_LIB_RHEAP
 	bool
 
diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 9a53e29680f4..25ba65df6b1a 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -2,8 +2,6 @@
 #ifndef _ASM_POWERPC_ARCHRANDOM_H
 #define _ASM_POWERPC_ARCHRANDOM_H
 
-#ifdef CONFIG_ARCH_RANDOM
-
 #include <asm/machdep.h>
 
 static inline bool __must_check arch_get_random_long(unsigned long *v)
@@ -35,7 +33,6 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 
 	return rc;
 }
-#endif /* CONFIG_ARCH_RANDOM */
 
 #ifdef CONFIG_PPC_POWERNV
 int powernv_hwrng_present(void);
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 358d171ae8e0..6c1002043367 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -200,9 +200,7 @@ struct machdep_calls {
 	ssize_t (*cpu_release)(const char *, size_t);
 #endif
 
-#ifdef CONFIG_ARCH_RANDOM
 	int (*get_random_seed)(unsigned long *v);
-#endif
 };
 
 extern void e500_idle(void);
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 5e320f49583a..6af443a1db99 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -6,7 +6,6 @@ config PPC_MICROWATT
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
 	select PPC_UDBG_16550
-	select ARCH_RANDOM
 	help
           This option enables support for FPGA-based Microwatt implementations.
 
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 161dfe024085..e1a05c5a9004 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -12,7 +12,6 @@ config PPC_POWERNV
 	select EPAPR_BOOT
 	select PPC_INDIRECT_PIO
 	select PPC_UDBG_16550
-	select ARCH_RANDOM
 	select CPU_FREQ
 	select PPC_DOORBELL
 	select MMU_NOTIFIER
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index f7fd91d153a4..f4a647c1f0b2 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -19,7 +19,6 @@ config PPC_PSERIES
 	select PPC_UDBG_16550
 	select PPC_DOORBELL
 	select HOTPLUG_CPU
-	select ARCH_RANDOM
 	select FORCE_SMP
 	select SWIOTLB
 	default y
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 91c0b80a8bf0..28a958b900f1 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -508,21 +508,6 @@ config KEXEC_SIG
 	  verification for the corresponding kernel image type being
 	  loaded in order for this to work.
 
-config ARCH_RANDOM
-	def_bool y
-	prompt "s390 architectural random number generation API"
-	help
-	  Enable the s390 architectural random number generation API
-	  to provide random data for all consumers within the Linux
-	  kernel.
-
-	  When enabled the arch_random_* functions declared in linux/random.h
-	  are implemented. The implementation is based on the s390 CPACF
-	  instruction subfunction TRNG which provides a real true random
-	  number generator.
-
-	  If unsure, say Y.
-
 config KERNEL_NOBP
 	def_bool n
 	prompt "Enable modified branch prediction for the kernel by default"
diff --git a/arch/s390/configs/zfcpdump_defconfig b/arch/s390/configs/zfcpdump_defconfig
index a87fcc45e307..f4976f611b94 100644
--- a/arch/s390/configs/zfcpdump_defconfig
+++ b/arch/s390/configs/zfcpdump_defconfig
@@ -15,7 +15,6 @@ CONFIG_TUNE_ZEC12=y
 # CONFIG_COMPAT is not set
 CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
-# CONFIG_ARCH_RANDOM is not set
 # CONFIG_RELOCATABLE is not set
 # CONFIG_CHSC_SCH is not set
 # CONFIG_SCM_BUS is not set
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index c63abfeb6d17..1b1cc478fa94 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_CRYPTO_CHACHA_S390) += chacha_s390.o
 obj-$(CONFIG_S390_PRNG) += prng.o
 obj-$(CONFIG_CRYPTO_GHASH_S390) += ghash_s390.o
 obj-$(CONFIG_CRYPTO_CRC32_S390) += crc32-vx_s390.o
-obj-$(CONFIG_ARCH_RANDOM) += arch_random.o
+obj-y += arch_random.o
 
 crc32-vx_s390-y := crc32-vx.o crc32le-vx.o crc32be-vx.o
 chacha_s390-y := chacha-glue.o chacha-s390.o
diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
index 5dc712fde3c7..27a3ff021b96 100644
--- a/arch/s390/include/asm/archrandom.h
+++ b/arch/s390/include/asm/archrandom.h
@@ -11,8 +11,6 @@
 #ifndef _ASM_S390_ARCHRANDOM_H
 #define _ASM_S390_ARCHRANDOM_H
 
-#ifdef CONFIG_ARCH_RANDOM
-
 #include <linux/static_key.h>
 #include <linux/atomic.h>
 
@@ -50,5 +48,4 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 	return false;
 }
 
-#endif /* CONFIG_ARCH_RANDOM */
 #endif /* _ASM_S390_ARCHRANDOM_H */
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index be0b95e51df6..59b82135c814 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1833,15 +1833,6 @@ config ARCH_USES_PG_UNCACHED
 	def_bool y
 	depends on X86_PAT
 
-config ARCH_RANDOM
-	def_bool y
-	prompt "x86 architectural random number generator" if EXPERT
-	help
-	  Enable the x86 architectural RDRAND instruction
-	  (Intel Bull Mountain technology) to generate random numbers.
-	  If supported, this is a high bandwidth, cryptographically
-	  secure hardware random number generator.
-
 config X86_UMIP
 	def_bool y
 	prompt "User Mode Instruction Prevention" if EXPERT
diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
index ebc248e49549..1d7bd74d2b44 100644
--- a/arch/x86/include/asm/archrandom.h
+++ b/arch/x86/include/asm/archrandom.h
@@ -65,10 +65,8 @@ static inline bool __must_check rdseed_int(unsigned int *v)
 
 /*
  * These are the generic interfaces; they must not be declared if the
- * stubs in <linux/random.h> are to be invoked,
- * i.e. CONFIG_ARCH_RANDOM is not defined.
+ * stubs in <linux/random.h> are to be invoked.
  */
-#ifdef CONFIG_ARCH_RANDOM
 
 static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
@@ -92,10 +90,4 @@ static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 
 extern void x86_init_rdrand(struct cpuinfo_x86 *c);
 
-#else  /* !CONFIG_ARCH_RANDOM */
-
-static inline void x86_init_rdrand(struct cpuinfo_x86 *c) { }
-
-#endif  /* !CONFIG_ARCH_RANDOM */
-
 #endif /* ASM_X86_ARCHRANDOM_H */
diff --git a/arch/x86/kernel/cpu/rdrand.c b/arch/x86/kernel/cpu/rdrand.c
index c4be62058dd9..8f216669ecb8 100644
--- a/arch/x86/kernel/cpu/rdrand.c
+++ b/arch/x86/kernel/cpu/rdrand.c
@@ -26,7 +26,6 @@ __setup("nordrand", x86_rdrand_setup);
  */
 #define SANITY_CHECK_LOOPS 8
 
-#ifdef CONFIG_ARCH_RANDOM
 void x86_init_rdrand(struct cpuinfo_x86 *c)
 {
 	unsigned int changed = 0;
@@ -63,4 +62,3 @@ void x86_init_rdrand(struct cpuinfo_x86 *c)
 "RDRAND gives funky smelling output, might consider not using it by booting with \"nordrand\"");
 
 }
-#endif
diff --git a/drivers/char/Kconfig b/drivers/char/Kconfig
index 0b6c03643ddc..30192e123e5f 100644
--- a/drivers/char/Kconfig
+++ b/drivers/char/Kconfig
@@ -431,7 +431,6 @@ config ADI
 config RANDOM_TRUST_CPU
 	bool "Initialize RNG using CPU RNG instructions"
 	default y
-	depends on ARCH_RANDOM
 	help
 	  Initialize the RNG using random numbers supplied by the CPU's
 	  RNG instructions (e.g. RDRAND), if supported and available. These
diff --git a/drivers/char/hw_random/s390-trng.c b/drivers/char/hw_random/s390-trng.c
index 2beaa35c0d74..488808dc17a2 100644
--- a/drivers/char/hw_random/s390-trng.c
+++ b/drivers/char/hw_random/s390-trng.c
@@ -108,7 +108,6 @@ static ssize_t trng_counter_show(struct device *dev,
 {
 	u64 dev_counter = atomic64_read(&trng_dev_counter);
 	u64 hwrng_counter = atomic64_read(&trng_hwrng_counter);
-#if IS_ENABLED(CONFIG_ARCH_RANDOM)
 	u64 arch_counter = atomic64_read(&s390_arch_random_counter);
 
 	return sysfs_emit(buf,
@@ -118,14 +117,6 @@ static ssize_t trng_counter_show(struct device *dev,
 			"total: %llu\n",
 			dev_counter, hwrng_counter, arch_counter,
 			dev_counter + hwrng_counter + arch_counter);
-#else
-	return sysfs_emit(buf,
-			"trng:  %llu\n"
-			"hwrng: %llu\n"
-			"total: %llu\n",
-			dev_counter, hwrng_counter,
-			dev_counter + hwrng_counter);
-#endif
 }
 static DEVICE_ATTR(byte_counter, 0444, trng_counter_show, NULL);
 
diff --git a/include/linux/random.h b/include/linux/random.h
index 20e389a14e5c..865770e29f3e 100644
--- a/include/linux/random.h
+++ b/include/linux/random.h
@@ -106,14 +106,7 @@ declare_get_random_var_wait(long, unsigned long)
  */
 #include <linux/prandom.h>
 
-#ifdef CONFIG_ARCH_RANDOM
-# include <asm/archrandom.h>
-#else
-static inline bool __must_check arch_get_random_long(unsigned long *v) { return false; }
-static inline bool __must_check arch_get_random_int(unsigned int *v) { return false; }
-static inline bool __must_check arch_get_random_seed_long(unsigned long *v) { return false; }
-static inline bool __must_check arch_get_random_seed_int(unsigned int *v) { return false; }
-#endif
+#include <asm/archrandom.h>
 
 /*
  * Called from the boot CPU during startup; not valid to call once
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index bad88f4b0a03..e1858ce7003f 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -58,7 +58,6 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_NO_HZ_FULL=n
 CONFIG_HZ_PERIODIC=n
 CONFIG_HIGH_RES_TIMERS=y
-CONFIG_ARCH_RANDOM=y
 CONFIG_FILE_LOCKING=y
 CONFIG_POSIX_TIMERS=y
 CONFIG_DEVTMPFS=y
-- 
2.35.1

