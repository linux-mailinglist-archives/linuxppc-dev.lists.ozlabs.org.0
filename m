Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0577917B770
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 08:31:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YfSh3qDxzDr1F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 18:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=J2mA6nWS; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YfQr0W2DzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 18:30:10 +1100 (AEDT)
Received: by mail-pj1-x1044.google.com with SMTP id nm6so702571pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 23:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPIsdBNMDTmM5LisDJPsWi6uKxD6/S17e5eRPSOHUdY=;
 b=J2mA6nWSD5m1GboKsmCHNjuURdoyUfflGSc09A3cTUXOP2u71HMKatqwj+nrLT5ScP
 gCs4XmMmN+VoSh2Zube7QIjEP0QyfriKGjgSdvlnNn84Xu4W8gH3HLQhdMMKxwAsRiKc
 1RhpsCxJOqVim3oAukgi81HqvLz97ZzQ5pGZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPIsdBNMDTmM5LisDJPsWi6uKxD6/S17e5eRPSOHUdY=;
 b=GllXzDIb6a50bONHsMrclEjbNEQZCXgCYKz8lCX/rY7WYe3O2EZDvmooUDhlT/Hkf7
 TKGjVEnFYoOzrSwfPgB7rUa/065cScTfcB+lvIsNfEKTkE+Yynp+Tdo5PiA2B9CzrUEl
 3swyFc5PsFdAgNTyWMOy8bH/D/MB4VLaof8wMg2IkWh9QDiczitnXwp3hTItPSF9xrlZ
 icyrpYh7oOSO/Kt0SFQAB6oSQsxgZH9CrerGvTA0f/S0uandVXjSCfX+duBvgD69J39j
 3OVwxUPn//e80AgD9w++F52x8Y7YIPSN+hAN9S0yuzO8GMPvo/P5yTcXn4zkkq23wo4p
 X78Q==
X-Gm-Message-State: ANhLgQ06OCoSFn2qJM9mh8l40+drwURHZgND+PkhNW8kiFW3PbnHLRAE
 LAN99nYmyF+ttoZ7y6CFvTCtuZDgdS8=
X-Google-Smtp-Source: ADFU+vt00YsWIs7Ek0f31W8FBexErtP3O+GABsUDrdAeGYCLmqOcIHuud5EiHsBesJOh5vhlTL74Uw==
X-Received: by 2002:a17:902:6809:: with SMTP id
 h9mr1756173plk.32.1583479807186; 
 Thu, 05 Mar 2020 23:30:07 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-69b9-4410-8fa1-baff.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:69b9:4410:8fa1:baff])
 by smtp.gmail.com with ESMTPSA id f124sm19519697pfg.9.2020.03.05.23.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 23:30:06 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
Date: Fri,  6 Mar 2020 18:30:00 +1100
Message-Id: <20200306073000.9491-1-dja@axtens.net>
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

kcov instrumentation is collected the __sanitizer_cov_trace_pc hook in
kernel/kcov.c. The compiler inserts these hooks into every basic block
unless kcov is disabled for that file.

We then have a deep call-chain:
 - __sanitizer_cov_trace_pc calls to check_kcov_mode()
 - check_kcov_mode() (kernel/kcov.c) calls in_task()
 - in_task() (include/linux/preempt.h) calls preempt_count().
 - preempt_count() (include/asm-generic/preempt.h) calls
     current_thread_info()
 - because powerpc has THREAD_INFO_IN_TASK, current_thread_info()
     (include/linux/thread_info.h) is defined to 'current'
 - current (arch/powerpc/include/asm/current.h) is defined to
     get_current().
 - get_current (same file) loads an offset of r13.
 - arch/powerpc/include/asm/paca.h makes r13 a register variable
     called local_paca - it is the PACA for the current CPU, so
     this has the effect of loading the current task from PACA.
 - get_current returns the current task from PACA,
 - current_thread_info returns the task cast to a thread_info
 - preempt_count dereferences the thread_info to load preempt_count
 - that value is used by in_task and so on up the chain

The problem is:

 - kcov instrumentation is enabled for arch/powerpc/kernel/dt_cpu_ftrs.c

 - even if it were not, dt_cpu_ftrs_init calls generic dt parsing code
   which should definitely have instrumentation enabled.

 - setup_64.c calls dt_cpu_ftrs_init before it sets up a PACA.

 - If we don't set up a paca, r13 will contain unpredictable data.

 - In a zImage compiled with kcov and KASAN, we see r13 containing a value
   that leads to dereferencing invalid memory (something like
   912a72603d420015).

 - Weirdly, the same kernel as a vmlinux loaded directly by qemu does not
   crash. Investigating with gdb, it seems that in the vmlinux boot case,
   r13 is near enough to zero that we just happen to be able to read that
   part of memory (we're operating with translation off at this point) and
   the current pointer also happens to land in readable memory and
   everything just works.

 - PACA setup refers to CPU features - setup_paca() looks at
   early_cpu_has_feature(CPU_FTR_HVMODE)

There's no generic kill switch for kcov (as far as I can tell), and we
don't want to have to turn off instrumentation in the generic dt parsing
code (which lives outside arch/powerpc/) just because we don't have a real
paca or task yet.

So:
 - change the test when setting up a PACA to consider the actual value of
   the MSR rather than the CPU feature.

 - move the PACA setup to before the cpu feature parsing.

Translations get switched on once we leave early_setup, so I think we'd
already catch any other cases where the PACA or task aren't set up.

Boot tested on a P9 guest and host.

Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

Regarding moving the comment about printk()-safety:
I am about 75% sure that the thing that makes printk() safe is the PACA,
not the CPU features. That's what commit 24d9649574fb ("[POWERPC] Document
when printk is useable") seems to indicate, but as someone wise recently
told me, "bootstrapping is hard", so I may be totally wrong.

v3: Update comment, thanks Christophe Leroy.
    Remove a comment in dt_cpu_ftrs.c that is no longer accurate - thanks
      Andrew. I think we want to retain all the code still, but I'm open to
      being told otherwise.
---
 arch/powerpc/kernel/dt_cpu_ftrs.c |  1 -
 arch/powerpc/kernel/paca.c        |  2 +-
 arch/powerpc/kernel/setup_64.c    | 20 +++++++++++++++-----
 3 files changed, 16 insertions(+), 7 deletions(-)

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
index 949eceb254d8..347e947b9d4b 100644
--- a/arch/powerpc/kernel/paca.c
+++ b/arch/powerpc/kernel/paca.c
@@ -218,7 +218,7 @@ void setup_paca(struct paca_struct *new_paca)
 	 * if we do a GET_PACA() before the feature fixups have been
 	 * applied
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

