Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C160186ECB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:41:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h0sG55grzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwwr0p7yzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:44:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nqJA4fXz; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48gwwl3tHYz9sTH; Mon, 16 Mar 2020 23:44:23 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48gwwl1jW8z9sTK; Mon, 16 Mar 2020 23:44:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584362663;
 bh=WURGrAisM54R5VNtLBayABQ0DvB/jrohHJx7Mlzfjlc=;
 h=From:To:Cc:Subject:Date:From;
 b=nqJA4fXzECAg/LZd9OJJSo1PtKmJ/cROfcleGl+whrkuohtUyLw1jFUyTGDx//dVD
 v9yhy/4yB1t3bOmClyASotMZuWcOTNvgL/i59GiGyjMZ9KZBPDvrFM0bkYt6jqq1JN
 E4UjOa2COLrToPMNgHoq2CIGZZW4G1WOozWijIHD626lnO3aiLe1O7Bb5EdUE/E2oz
 IAX9m20j090yv4uuzwuPLQ3Jp0OMT96nI8BU9kKe0fVS8SNAvTqL1MUajMKAm95RJV
 tC4x7MCVWLmhMr6H9EfV5YhR/iEnb1lYZ3UApPxeVoHbpH0b9RoZ9yVH/bU3QUd9tZ
 0b06p95xa27JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v5 1/2] powerpc/64: Setup a paca before parsing device tree
 etc.
Date: Mon, 16 Mar 2020 23:44:20 +1100
Message-Id: <20200316124421.99211-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.24.1
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
Cc: npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Currently we set up the paca after parsing the device tree for CPU
features. Prior to that, r13 contains random data, which means there
is random data in r13 while we're running the generic dt parsing code.

This random data varies depending on whether we boot through a vmlinux
or a zImage: for the vmlinux case it's usually around zero, but for
zImages we see random values like 912a72603d420015.

This is poor practice, and can also lead to difficult-to-debug
crashes. For example, when kcov is enabled, the kcov instrumentation
attempts to read preempt_count out of the current task, which goes via
the paca. This then crashes in the zImage case.

Similarly stack protector can cause crashes if r13 is bogus, by
reading from the stack canary in the paca.

To resolve this:

 - move the paca setup to before the CPU feature parsing.

 - because we no longer have access to CPU feature flags in paca
 setup, change the HV feature test in the paca setup path to consider
 the actual value of the MSR rather than the CPU feature.

Translations get switched on once we leave early_setup, so I think
we'd already catch any other cases where the paca or task aren't set
up.

Boot tested on a P9 guest and host.

Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
Fixes: 06ec27aea9fc ("powerpc/64: add stack protector support")
Cc: stable@vger.kernel.org # v4.20+
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Daniel Axtens <dja@axtens.net>
[mpe: Reword comments & change log a bit to mention stack protector]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/dt_cpu_ftrs.c |  1 -
 arch/powerpc/kernel/paca.c        | 10 +++++++---
 arch/powerpc/kernel/setup_64.c    | 30 ++++++++++++++++++++++++------
 3 files changed, 31 insertions(+), 10 deletions(-)

v5: mpe: Reword comments & change log a bit to mention stack protector]

dja:
Regarding moving the comment about printk()-safety:
I am about 75% sure that the thing that makes printk() safe is the PACA,
not the CPU features. That's what commit 24d9649574fb ("[POWERPC] Document
when printk is useable") seems to indicate, but as someone wise recently
told me, "bootstrapping is hard", so I may be totally wrong.

v4: Update commit message and clarify that the mfmsr() approach is not
     for general use. Thanks Nick Piggin.

v3: Update comment, thanks Christophe Leroy.
    Remove a comment in dt_cpu_ftrs.c that is no longer accurate - thanks
      Andrew. I think we want to retain all the code still, but I'm open to
      being told otherwise.


diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 182b4047c1ef..36bc0d5c4f3a 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -139,7 +139,6 @@ static void __init cpufeatures_setup_cpu(void)
 	/* Initialize the base environment -- clear FSCR/HFSCR.  */
 	hv_mode = !!(mfmsr() & MSR_HV);
 	if (hv_mode) {
-		/* CPU_FTR_HVMODE is used early in PACA setup */
 		cur_cpu_spec->cpu_features |= CPU_FTR_HVMODE;
 		mtspr(SPRN_HFSCR, 0);
 	}
diff --git a/arch/powerpc/kernel/paca.c b/arch/powerpc/kernel/paca.c
index 949eceb254d8..0ee6308541b1 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -214,11 +214,15 @@ void setup_paca(struct paca_struct *new_paca)
 	/* On Book3E, initialize the TLB miss exception frames */
 	mtspr(SPRN_SPRG_TLB_EXFRAME, local_paca->extlb);
 #else
-	/* In HV mode, we setup both HPACA and PACA to avoid problems
+	/*
+	 * In HV mode, we setup both HPACA and PACA to avoid problems
 	 * if we do a GET_PACA() before the feature fixups have been
-	 * applied
+	 * applied.
+	 *
+	 * Normally you should test against CPU_FTR_HVMODE, but CPU features
+	 * are not yet set up when we first reach here.
 	 */
-	if (early_cpu_has_feature(CPU_FTR_HVMODE))
+	if (mfmsr() & MSR_HV)
 		mtspr(SPRN_SPRG_HPACA, local_paca);
 #endif
 	mtspr(SPRN_SPRG_PACA, local_paca);
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index e05e6dd67ae6..17886d147dd0 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -285,18 +285,36 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* -------- printk is _NOT_ safe to use here ! ------- */
 
-	/* Try new device tree based feature discovery ... */
-	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
-		/* Otherwise use the old style CPU table */
-		identify_cpu(0, mfspr(SPRN_PVR));
-
-	/* Assume we're on cpu 0 for now. Don't write to the paca yet! */
+	/*
+	 * Assume we're on cpu 0 for now.
+	 *
+	 * We need to load a PACA very early for a few reasons.
+	 *
+	 * The stack protector canary is stored in the paca, so as soon as we
+	 * call any stack protected code we need r13 pointing somewhere valid.
+	 *
+	 * If we are using kcov it will call in_task() in its instrumentation,
+	 * which relies on the current task from the PACA.
+	 *
+	 * dt_cpu_ftrs_init() calls into generic OF/fdt code, as well as
+	 * printk(), which can trigger both stack protector and kcov.
+	 *
+	 * percpu variables and spin locks also use the paca.
+	 *
+	 * So set up a temporary paca. It will be replaced below once we know
+	 * what CPU we are on.
+	 */
 	initialise_paca(&boot_paca, 0);
 	setup_paca(&boot_paca);
 	fixup_boot_paca();
 
 	/* -------- printk is now safe to use ------- */
 
+	/* Try new device tree based feature discovery ... */
+	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
+		/* Otherwise use the old style CPU table */
+		identify_cpu(0, mfspr(SPRN_PVR));
+
 	/* Enable early debugging if any specified (see udbg.h) */
 	udbg_early_init();
 
-- 
2.24.1

