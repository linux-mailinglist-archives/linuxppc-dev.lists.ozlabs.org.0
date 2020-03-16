Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B33B186430
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 05:23:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gjqD2MRpzDqNd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 15:23:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=qfowclRC; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gjnm2nlKzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 15:22:35 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id h8so8973399pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Mar 2020 21:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6423KMlPM39Q7LcfJ5u6/RST7HGYGoSe2XoRIGox5OY=;
 b=qfowclRCRbXGe77coJqMdbaEl0lXQsAuM1rfTlBWEfHVc4Up1Wesx1phmbWnQ5Wva3
 gxA8gaFngHtFheR4oSsKtP/t1Lrg7oEOG38Rqf5r755RWSUrLTHge6GNCbX4a4AmgwKp
 ZKIj9ItZ0C1D5MjjDx3425BKZXHvIxkEMUeyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6423KMlPM39Q7LcfJ5u6/RST7HGYGoSe2XoRIGox5OY=;
 b=raAcZnP2mCIN8cLWnlzFLxOZb4Oe2A9y7Im8aL28nOnwiGiYrlZGqd3HYh6jTUcxfO
 J7EU2qcCm4JHT3DaVlXXMgNwDmPoRh5NkXQbnxxSGHqq9FHBDx63MilA6KEAZrLUbw6l
 HRoiBSpA6q11uhShneYf8Ru3BTlaFbqdoeuy5RSJeQAZlXjDJ/Ga3sz5hBp1TC5j8a7q
 DTLxUjajlN/bzYihBlbzj+2ABaDQjfIRn3cZjYheLPw5hKLDGWkc6XLMab31GixuCnq0
 xdmTvDKp7O8JxZmC36SBUaVVzyXFoQwmNAr7sx2+rpW4EFJ9T2MmmlNvg7HzHoSZ7w51
 q+Mw==
X-Gm-Message-State: ANhLgQ3ng+K6Q76CDTJYUoOBPEXEqwYtr01E2hB/V9Vg0EQqZXsmZkDp
 5hBU8SjmuGxyaJ5V3OKvYtRCC+Z4nQY=
X-Google-Smtp-Source: ADFU+vvXkeg/m4E/bYfyrHxV/FsGZdqJi9RiCL7nX+ylJvH+ejxXUUCMqztW84vbIANLl12RJZc0EQ==
X-Received: by 2002:a65:5905:: with SMTP id f5mr23702046pgu.87.1584332552097; 
 Sun, 15 Mar 2020 21:22:32 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-d4cc-399e-d2d9-128b.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:d4cc:399e:d2d9:128b])
 by smtp.gmail.com with ESMTPSA id i2sm18094467pjs.21.2020.03.15.21.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2020 21:22:31 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com
Subject: [PATCH v4] powerpc: setup_64: set up PACA before parsing device tree
Date: Mon, 16 Mar 2020 15:22:27 +1100
Message-Id: <20200316042227.12445-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: ajd@linux.ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, we set up the PACA after parsing the device tree for CPU
features. Before that, r13 contains random data, which means there is
random data in r13 while we're running the generic dt parsing code.

This random data varies depending on whether we boot through a vmlinux or a
zImage: for the vmlinux case it's usually around zero, but for zImages we
see random values like 912a72603d420015.

This is poor practice, and can also lead to difficult-to-debug crashes. For
example, when kcov is enabled, the kcov instrumentation attempts to read
preempt_count out of the current task, which goes via the PACA. This then
crashes in the zImage case.

To resolve this:

 - move the PACA setup to before the cpu feature parsing.

 - because we no longer have access to cpu feature flags in PACA setup,
   change the HV feature test in the PACA setup path to consider the actual
   value of the MSR rather than the CPU feature.

Translations get switched on once we leave early_setup, so I think we'd
already catch any other cases where the PACA or task aren't set up.

Boot tested on a P9 guest and host.

Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: stable@vger.kernel.org
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

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
---
 arch/powerpc/kernel/dt_cpu_ftrs.c |  1 -
 arch/powerpc/kernel/paca.c        | 10 +++++++---
 arch/powerpc/kernel/setup_64.c    | 20 +++++++++++++++-----
 3 files changed, 22 insertions(+), 9 deletions(-)

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
index e05e6dd67ae6..2259da8e8685 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -285,18 +285,28 @@ void __init early_setup(unsigned long dt_ptr)
 
 	/* -------- printk is _NOT_ safe to use here ! ------- */
 
-	/* Try new device tree based feature discovery ... */
-	if (!dt_cpu_ftrs_init(__va(dt_ptr)))
-		/* Otherwise use the old style CPU table */
-		identify_cpu(0, mfspr(SPRN_PVR));
+	/*
+	 * Assume we're on cpu 0 for now.
+	 *
+	 * We need to load a PACA very early if we are using kcov. kcov will
+	 * call in_task() in its instrumentation, which relies on the current
+	 * task from the PACA. dt_cpu_ftrs_init is coveraged-enabled and also
+	 * calls into the coverage-enabled generic dt library.
+	 *
+	 * Set up a temporary paca. It is going to be replaced below.
+	 */
 
-	/* Assume we're on cpu 0 for now. Don't write to the paca yet! */
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
2.20.1

