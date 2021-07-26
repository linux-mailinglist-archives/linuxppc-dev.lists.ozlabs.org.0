Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A167B3D51EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:56:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5hZ4Hvcz3f5R
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:56:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g3EmeckY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g3EmeckY; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5ZG71KVz30Lb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:18 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id a20so10253403plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iWjyTSlQNF6ZmccM9wHFHsF0l3hw0FGKI/julB9LAE4=;
 b=g3EmeckYA66BwYW2N63mT4UBIVOqDLpmhSZhTFX6wSVr9wOiHD1zSJE4q40h6XhsN2
 k95y680XeNZJo5oz06xNwpEPJ2TWPENhfC7u+lEYZ1frn6XabWS3X6TDtTgRPIwmo2xQ
 fOvVV6iuPVRsOpb1hnto6yDyIeYqkWZ9oKr+WkKfzxOOUvPQ50tnQ833IemjphtCSln4
 h2qu+o2vXdQndMh4yBiEQJClCYPaQI0XUs4KA4ct77epqYQrO+qNqC+q24SRlsfu9UYx
 SjSlmKnz6QyFNvmbO7r8OhVocWmPsNvgKoQQfGZoOWqD3CE/kj+hCWH4SMP9CBwYDVK3
 /+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iWjyTSlQNF6ZmccM9wHFHsF0l3hw0FGKI/julB9LAE4=;
 b=c+kcaARYCH10lPr82BLkhslyrVcT63bmqCJd3oi/HqDOUhD2CNggIWpp1FgQhzNX7x
 9gECJ6EgEQCYowJvCGQeJl5/oUeLmVXaTZRyH+7FISTNZEkx36vYn6E+3WDDDAYk71Gu
 KW5KEeegdisaSQ8771hYWlHvUFPE5W4Ap+JEUyx6XL9NQZ/SewQYjwwUn/o26mDW59qz
 CCTVmI8dVNvpplCtu2MqGEKie88w5rm+PM5tFtDhE3Z5COQrfCcZPOCOPcOg1XV+S3gL
 DjkBcAokXpLYFiBliHRAc0I7S6U5L9LAnYUB+85WF+m5tcglVpSB6WLX9qdoEWbkafRI
 Iyow==
X-Gm-Message-State: AOAM530dJHyKfgNT6F0XehfBqI+76Iti6BT49CNobKb5BJdBhKw9K/Xw
 Qjjrs1X0BuEaA4qW47SNd1s=
X-Google-Smtp-Source: ABdhPJyEEuAV7WyIqY8/vzugZp5TK9pjx2056cC9UIzBR3iATW4hubwtOpb35rytXBA5yFxRZvp0YQ==
X-Received: by 2002:a05:6a00:158e:b029:32b:9de5:a199 with SMTP id
 u14-20020a056a00158eb029032b9de5a199mr15566647pfk.76.1627271476466; 
 Sun, 25 Jul 2021 20:51:16 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 13/55] powerpc/64s: Keep AMOR SPR a constant ~0 at runtime
Date: Mon, 26 Jul 2021 13:49:54 +1000
Message-Id: <20210726035036.739609-14-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This register controls supervisor SPR modifications, and as such is only
relevant for KVM. KVM always sets AMOR to ~0 on guest entry, and never
restores it coming back out to the host, so it can be kept constant and
avoid the mtSPR in KVM guest entry.

-21 cycles (9116) cycles POWER9 virt-mode NULL hcall

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/cpu_setup_power.c    |  8 ++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c        |  2 ++
 arch/powerpc/kvm/book3s_hv_p9_entry.c    |  2 --
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |  2 --
 arch/powerpc/mm/book3s64/radix_pgtable.c | 15 ---------------
 arch/powerpc/platforms/powernv/idle.c    |  8 +++-----
 6 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kernel/cpu_setup_power.c b/arch/powerpc/kernel/cpu_setup_power.c
index 3cca88ee96d7..a29dc8326622 100644
--- a/arch/powerpc/kernel/cpu_setup_power.c
+++ b/arch/powerpc/kernel/cpu_setup_power.c
@@ -137,6 +137,7 @@ void __setup_cpu_power7(unsigned long offset, struct cpu_spec *t)
 		return;
 
 	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
 }
@@ -150,6 +151,7 @@ void __restore_cpu_power7(void)
 		return;
 
 	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA206(mfspr(SPRN_LPCR), LPCR_LPES1 >> LPCR_LPES_SH);
 }
@@ -164,6 +166,7 @@ void __setup_cpu_power8(unsigned long offset, struct cpu_spec *t)
 		return;
 
 	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
 	init_HFSCR();
@@ -184,6 +187,7 @@ void __restore_cpu_power8(void)
 		return;
 
 	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA206(mfspr(SPRN_LPCR) | LPCR_PECEDH, 0); /* LPES = 0 */
 	init_HFSCR();
@@ -202,6 +206,7 @@ void __setup_cpu_power9(unsigned long offset, struct cpu_spec *t)
 	mtspr(SPRN_PSSCR, 0);
 	mtspr(SPRN_LPID, 0);
 	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
 			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
@@ -223,6 +228,7 @@ void __restore_cpu_power9(void)
 	mtspr(SPRN_PSSCR, 0);
 	mtspr(SPRN_LPID, 0);
 	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
 			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
@@ -242,6 +248,7 @@ void __setup_cpu_power10(unsigned long offset, struct cpu_spec *t)
 	mtspr(SPRN_PSSCR, 0);
 	mtspr(SPRN_LPID, 0);
 	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
 			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
@@ -264,6 +271,7 @@ void __restore_cpu_power10(void)
 	mtspr(SPRN_PSSCR, 0);
 	mtspr(SPRN_LPID, 0);
 	mtspr(SPRN_PID, 0);
+	mtspr(SPRN_AMOR, ~0);
 	mtspr(SPRN_PCR, PCR_MASK);
 	init_LPCR_ISA300((mfspr(SPRN_LPCR) | LPCR_PECEDH | LPCR_PECE_HVEE |\
 			 LPCR_HVICE | LPCR_HEIC) & ~(LPCR_UPRT | LPCR_HR), 0);
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index af95f337e54b..38ea20fadc4a 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -80,6 +80,7 @@ static void __restore_cpu_cpufeatures(void)
 	mtspr(SPRN_LPCR, system_registers.lpcr);
 	if (hv_mode) {
 		mtspr(SPRN_LPID, 0);
+		mtspr(SPRN_AMOR, ~0);
 		mtspr(SPRN_HFSCR, system_registers.hfscr);
 		mtspr(SPRN_PCR, system_registers.pcr);
 	}
@@ -216,6 +217,7 @@ static int __init feat_enable_hv(struct dt_cpu_feature *f)
 	}
 
 	mtspr(SPRN_LPID, 0);
+	mtspr(SPRN_AMOR, ~0);
 
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &=  ~LPCR_LPES0; /* HV external interrupts */
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index bd8cf0a65ce8..a7f63082b4e3 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -286,8 +286,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
 	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
 
-	mtspr(SPRN_AMOR, ~0UL);
-
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_P9;
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 75079397c2a5..9021052f1579 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -772,10 +772,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	/* Restore AMR and UAMOR, set AMOR to all 1s */
 	ld	r5,VCPU_AMR(r4)
 	ld	r6,VCPU_UAMOR(r4)
-	li	r7,-1
 	mtspr	SPRN_AMR,r5
 	mtspr	SPRN_UAMOR,r6
-	mtspr	SPRN_AMOR,r7
 
 	/* Restore state of CTRL run bit; assume 1 on entry */
 	lwz	r5,VCPU_CTRL(r4)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e50ddf129c15..5aebd70ef66a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -572,18 +572,6 @@ void __init radix__early_init_devtree(void)
 	return;
 }
 
-static void radix_init_amor(void)
-{
-	/*
-	* In HV mode, we init AMOR (Authority Mask Override Register) so that
-	* the hypervisor and guest can setup IAMR (Instruction Authority Mask
-	* Register), enable key 0 and set it to 1.
-	*
-	* AMOR = 0b1100 .... 0000 (Mask for key 0 is 11)
-	*/
-	mtspr(SPRN_AMOR, (3ul << 62));
-}
-
 void __init radix__early_init_mmu(void)
 {
 	unsigned long lpcr;
@@ -644,7 +632,6 @@ void __init radix__early_init_mmu(void)
 		lpcr = mfspr(SPRN_LPCR);
 		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
 		radix_init_partition_table();
-		radix_init_amor();
 	} else {
 		radix_init_pseries();
 	}
@@ -668,8 +655,6 @@ void radix__early_init_mmu_secondary(void)
 
 		set_ptcr_when_no_uv(__pa(partition_tb) |
 				    (PATB_SIZE_SHIFT - 12));
-
-		radix_init_amor();
 	}
 
 	radix__switch_mmu_context(NULL, &init_mm);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index df19e2ff9d3c..721ac4f7e2d1 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -306,8 +306,8 @@ struct p7_sprs {
 	/* per thread SPRs that get lost in shallow states */
 	u64 amr;
 	u64 iamr;
-	u64 amor;
 	u64 uamor;
+	/* amor is restored to constant ~0 */
 };
 
 static unsigned long power7_idle_insn(unsigned long type)
@@ -378,7 +378,6 @@ static unsigned long power7_idle_insn(unsigned long type)
 	if (cpu_has_feature(CPU_FTR_ARCH_207S)) {
 		sprs.amr	= mfspr(SPRN_AMR);
 		sprs.iamr	= mfspr(SPRN_IAMR);
-		sprs.amor	= mfspr(SPRN_AMOR);
 		sprs.uamor	= mfspr(SPRN_UAMOR);
 	}
 
@@ -397,7 +396,7 @@ static unsigned long power7_idle_insn(unsigned long type)
 			 */
 			mtspr(SPRN_AMR,		sprs.amr);
 			mtspr(SPRN_IAMR,	sprs.iamr);
-			mtspr(SPRN_AMOR,	sprs.amor);
+			mtspr(SPRN_AMOR,	~0);
 			mtspr(SPRN_UAMOR,	sprs.uamor);
 		}
 	}
@@ -687,7 +686,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 
 	sprs.amr	= mfspr(SPRN_AMR);
 	sprs.iamr	= mfspr(SPRN_IAMR);
-	sprs.amor	= mfspr(SPRN_AMOR);
 	sprs.uamor	= mfspr(SPRN_UAMOR);
 
 	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
@@ -708,7 +706,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		 */
 		mtspr(SPRN_AMR,		sprs.amr);
 		mtspr(SPRN_IAMR,	sprs.iamr);
-		mtspr(SPRN_AMOR,	sprs.amor);
+		mtspr(SPRN_AMOR,	~0);
 		mtspr(SPRN_UAMOR,	sprs.uamor);
 
 		/*
-- 
2.23.0

