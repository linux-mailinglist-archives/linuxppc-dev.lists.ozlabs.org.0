Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32E459FA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:58:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz02l620Mz3bjR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:58:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cYOcZZic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cYOcZZic; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzwH4xbsz307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:03 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 p18-20020a17090ad31200b001a78bb52876so1658847pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uf3XV0QIdJuQD2epISHhO43Swfv6/zXMqj1smyZzBA4=;
 b=cYOcZZicItEdCLIMtPOc6NXTb0ztwHvKbhAyFk1D56P+5GP7sOblNrRCFsrTPNewHT
 rLK++P1a3Hj8uHSVChxkleQdmkJ5gyTBJU/tMdcb20M9vtPF4jP//csZyqO+I/fp9Ga5
 psR2BgXo8F++CzFr8EColq7+fxMr0tNpZLFI41PH2K0LkurXkJkSSr+Ectk9hZzYf9oe
 skORaLYjSLiUuaMGo+npPaQhLyNszNC6Z9dNdXSbMYhbMeBAcMobjCFPIZZy9G4wf6hm
 plRiQ3mNnrp6eqOJioRgFCjqBKbEdy2qM5TFxNMjHVqaARXG4d1UFMSrM6UKLOeu9cnF
 URvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uf3XV0QIdJuQD2epISHhO43Swfv6/zXMqj1smyZzBA4=;
 b=BgZDEGJk99k31GBqKHgmoT9nQd14csX5gbip99LglQ0HUEEgRgaiYY5ZXSLLARmbb3
 xYJLM+xWxXcCHLyvIi70KCNKrWzL7d3Tt9N96GdqQql2CR3N/qSy2Y/tmXY6lKT3TJv2
 jcTVoBtYv3/aatnXJYIcB83eZc2/t6eAVdlcsD/lt6W5H0w2FlTH7a2ATRgmBq/hzVpX
 JOwsvLYQKo9u2wQ18220PZ8HoUAMazYzPW8Ks0pLFy0GOjRVwwoavSHlqgk/FLivzJ3z
 XCdzzaZ+FG3e65qqBlYOO0CLzsjO3rQwVYcUUeY3WfjjW0eC4GTsND+ElL6+6q5/3bo3
 c8wA==
X-Gm-Message-State: AOAM530WUTqqv72Bf1lYpTIFW0NvKvrDkgLECdSM9AZtUlAY1kXjeipP
 6ftyxTcv1Qj8c0qad9w3MjSitxW830lR9g==
X-Google-Smtp-Source: ABdhPJwDHK5F5XCw7kS5ZyxE/MskCvlNF/Jx89jRzYx6IkY+k2jVFb70O7VQAzgm04bObNHt+IAS/Q==
X-Received: by 2002:a17:90b:4c89:: with SMTP id
 my9mr1221628pjb.229.1637661181379; 
 Tue, 23 Nov 2021 01:53:01 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/53] powerpc/64s: Keep AMOR SPR a constant ~0 at runtime
Date: Tue, 23 Nov 2021 19:51:47 +1000
Message-Id: <20211123095231.1036501-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This register controls supervisor SPR modifications, and as such is only
relevant for KVM. KVM always sets AMOR to ~0 on guest entry, and never
restores it coming back out to the host, so it can be kept constant and
avoid the mtSPR in KVM guest entry.

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
index ba527fb52993..de59971319ab 100644
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
index 32a4b4d412b9..c45ec4cd9d52 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -778,10 +778,8 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
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
index 3a600bd7fbc6..77820036c722 100644
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
index 86e787502e42..3bc84e2fe064 100644
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
@@ -686,7 +685,6 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 
 	sprs.amr	= mfspr(SPRN_AMR);
 	sprs.iamr	= mfspr(SPRN_IAMR);
-	sprs.amor	= mfspr(SPRN_AMOR);
 	sprs.uamor	= mfspr(SPRN_UAMOR);
 
 	srr1 = isa300_idle_stop_mayloss(psscr);		/* go idle */
@@ -707,7 +705,7 @@ static unsigned long power9_idle_stop(unsigned long psscr)
 		 */
 		mtspr(SPRN_AMR,		sprs.amr);
 		mtspr(SPRN_IAMR,	sprs.iamr);
-		mtspr(SPRN_AMOR,	sprs.amor);
+		mtspr(SPRN_AMOR,	~0);
 		mtspr(SPRN_UAMOR,	sprs.uamor);
 
 		/*
-- 
2.23.0

