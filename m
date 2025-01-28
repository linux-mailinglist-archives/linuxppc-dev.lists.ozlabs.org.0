Return-Path: <linuxppc-dev+bounces-5658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02620A214A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKg51Qnz30T9;
	Wed, 29 Jan 2025 09:57:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105079;
	cv=none; b=glyiQ6YhkYyioYn9iPED675bGeTNqvELqe8qRjnGGzIpOnGF/C8Kres45Cu+QqhRCwCEZWOomLLAcAACD7pz42yu0H9l0png1ZZQdL+GC+XNsNOj8ERCHTiTHtgOgpvKvk6NP8HjH1fZlpdeAkKQSp9ta2Bw2jFjlIi1NJqsYV0yJEA/zDwXnS5ZhuXuDRPW5nvvscHcWoC/lMs+Fmo0ftszcWNJBMPmAulEEnvyzNPyJU3/tGzdaVcE0xpX8iltWxVFHrhE2fXFuckkC3sV3RcWppRTj9pKpV00hR+QlnfXuOs126rsY+7uDuURVg9eZWYUfTb5krVBpLhbLydjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105079; c=relaxed/relaxed;
	bh=xKRcyxJa0R1eZ8ZrNWuPSJ3mIR7N2UE25Sn7RjgVEcg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n04VsqHzDTzWw0Qsp3E9YwShZhWBURCMdAXjPsp9gkq4I4eGMK0nF0fDe56Q1ZEw+cRHr0ZplxKzu9JbKrPQGm0i26B1x8Cyh78InhSPXwgklyu408PFJoJxgXfWxqfi/IX2vQjQu0CwmKUeLBlcX33s7Its1UednYjo2NeSKXsgSFJYmUJpF+5LoGYTUjJT3o1krXZtB57Z1sBtMxspGXZMymjvlGiB0MWro1nUkgFtF5K8DJarLAFKbMOm9Ws/J7R+D7w8UiBFuvdLXADLcizW+UAmOTK25zUarh2G9srUFd3nvQdQ4ClJPaKSx3g6zyqwL4QdXqi0vFdH6GUPZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=OiW9Xdly; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=OiW9Xdly;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKc1Mbmz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=xKRcyxJa0R1eZ8ZrNWuPSJ3mIR7N2UE25Sn7RjgVEcg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=OiW9Xdly1gT4Jute56SlBLYvi0UHYArHBQiGhJJTm7hnPxM4Q+rXzhR9/9BCwXPX5
	 AUgTAsHhGDQyoIMNTqq6NiPhp3nf6EIRM5Ou1szUfnyMxCKKecXw0zMjHwcWV8Z6V0
	 ClS0bITMcTHnT7osJEApg5gFTynCIkXARHs3VCQa/IzovqBafiJW/liNU6RGTtTUbn
	 LR7MembupjJoQBbNngMys2P9ovAIB8JakcplNGWKzZoOsPYAyewPee0wmHDKkZfpLv
	 AMF6TQ49ZHvqsFQ/KH2lYJU9uy5fEV+Oaq29MT/PKHg2kWDWNjg33+6+bPe4P/5/od
	 ZObgJyWa4CQSQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR314Tz4x3J; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:55:08 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/microwatt: Add SMP support
Message-ID: <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
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

This adds support for Microwatt systems with more than one core, and
updates the device tree for a 2-core version.  (This does not prevent
the kernel from running on a single-core system.)

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/boot/dts/microwatt.dts          | 34 ++++++++++++++++++--
 arch/powerpc/platforms/microwatt/Kconfig     |  2 +-
 arch/powerpc/platforms/microwatt/Makefile    |  1 +
 arch/powerpc/platforms/microwatt/microwatt.h |  1 +
 arch/powerpc/platforms/microwatt/setup.c     | 10 ++++++
 5 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/microwatt.dts
index 6e575e841a7b..89281dc975b3 100644
--- a/arch/powerpc/boot/dts/microwatt.dts
+++ b/arch/powerpc/boot/dts/microwatt.dts
@@ -142,6 +142,36 @@ PowerPC,Microwatt@0 {
 			ibm,mmu-lpid-bits = <12>;
 			ibm,mmu-pid-bits = <20>;
 		};
+
+		PowerPC,Microwatt@1 {
+			i-cache-sets = <2>;
+			ibm,dec-bits = <64>;
+			reservation-granule-size = <64>;
+			clock-frequency = <100000000>;
+			timebase-frequency = <100000000>;
+			i-tlb-sets = <1>;
+			ibm,ppc-interrupt-server#s = <1>;
+			i-cache-block-size = <64>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <2>;
+			i-tlb-size = <64>;
+			cpu-version = <0x990000>;
+			status = "okay";
+			i-cache-size = <0x1000>;
+			ibm,processor-radix-AP-encodings = <0x0c 0xa0000010 0x20000015 0x4000001e>;
+			tlb-size = <0>;
+			tlb-sets = <0>;
+			device_type = "cpu";
+			d-tlb-size = <128>;
+			d-tlb-sets = <2>;
+			reg = <1>;
+			general-purpose;
+			64-bit;
+			d-cache-size = <0x1000>;
+			ibm,chip-id = <0>;
+			ibm,mmu-lpid-bits = <12>;
+			ibm,mmu-pid-bits = <20>;
+		};
 	};
 
 	soc@c0000000 {
@@ -154,8 +184,8 @@ soc@c0000000 {
 
 		interrupt-controller@4000 {
 			compatible = "openpower,xics-presentation", "ibm,ppc-xicp";
-			ibm,interrupt-server-ranges = <0x0 0x1>;
-			reg = <0x4000 0x100>;
+			ibm,interrupt-server-ranges = <0x0 0x2>;
+			reg = <0x4000 0x10 0x4010 0x10>;
 		};
 
 		ICS: interrupt-controller@5000 {
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 1d5cc1ae3636..8911ea7cf12e 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config PPC_MICROWATT
-	depends on PPC_BOOK3S_64 && !SMP
+	depends on PPC_BOOK3S_64
 	bool "Microwatt SoC platform"
 	select PPC_XICS
 	select PPC_ICS_NATIVE
diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/platforms/microwatt/Makefile
index 116d6d3ad3f0..d973b2ab4042 100644
--- a/arch/powerpc/platforms/microwatt/Makefile
+++ b/arch/powerpc/platforms/microwatt/Makefile
@@ -1 +1,2 @@
 obj-y	+= setup.o rng.o
+obj-$(CONFIG_SMP) += smp.o
diff --git a/arch/powerpc/platforms/microwatt/microwatt.h b/arch/powerpc/platforms/microwatt/microwatt.h
index 335417e95e66..891aa2800768 100644
--- a/arch/powerpc/platforms/microwatt/microwatt.h
+++ b/arch/powerpc/platforms/microwatt/microwatt.h
@@ -3,5 +3,6 @@
 #define _MICROWATT_H
 
 void microwatt_rng_init(void);
+void microwatt_init_smp(void);
 
 #endif /* _MICROWATT_H */
diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
index 97828a99780d..d966bf1f57f7 100644
--- a/arch/powerpc/platforms/microwatt/setup.c
+++ b/arch/powerpc/platforms/microwatt/setup.c
@@ -29,6 +29,15 @@ static int __init microwatt_populate(void)
 }
 machine_arch_initcall(microwatt, microwatt_populate);
 
+static int __init microwatt_probe(void)
+{
+	/* Main reason for having this is to start the other CPU(s) */
+#ifdef CONFIG_SMP
+	microwatt_init_smp();
+#endif
+	return 1;
+}
+
 static void __init microwatt_setup_arch(void)
 {
 	microwatt_rng_init();
@@ -45,6 +54,7 @@ static void microwatt_idle(void)
 define_machine(microwatt) {
 	.name			= "microwatt",
 	.compatible		= "microwatt-soc",
+	.probe			= microwatt_probe,
 	.init_IRQ		= microwatt_init_IRQ,
 	.setup_arch		= microwatt_setup_arch,
 	.progress		= udbg_progress,
-- 
2.47.1


