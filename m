Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE53B0280
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:13:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nzr6RwFz3gZD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=i+VoZyWX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i+VoZyWX; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Ngs2SxFz3c9V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:21 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id g24so11849344pji.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sjJ6gtRdyxRcyqiP66xfDplG8GxPfdcasnzetK08EXA=;
 b=i+VoZyWXU37kNu3GFi7TezY37eiOclg9NimufDnms2SeS/CYASp0HvwPVTXbPCuw/1
 TlJ72ElMPZLAbUbir/nMDMrLT8FmljjtqbgAz+wtEZEfCeLYadDkuPY5acerdIF4O3zc
 m0hcaLGFqnvTEGQOYdqRagGLcdqXIiARE0LTg6IpRf++fHPu4JKjjZNiUdq7cK60CDZ0
 KIIPCJvKjqsjYc+hf5Y4Fup7R7Q1pmoTpk0l6CnU9Qk4CTdoZobIbT9Fqip/AIQegc+V
 xFpVRLvVdN3zeNZn7yP0geAakkDNyyyEPk3s+PCHkRoK45/3Wdv/bE7yXTYFKlM3J/1Z
 4bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sjJ6gtRdyxRcyqiP66xfDplG8GxPfdcasnzetK08EXA=;
 b=cfxTFQR5jH0q5Duj7HJFoR2QrZCpTdXLNN3QObssPDhZwmZoC0/TI2RjarskfTqGoE
 A1MalU7DmTmg1hQLO3CNNxG9dvnhRmUMZww+vLAt9szBlj4h44Ts4JCmUZDiiNHX0r7p
 4O8Da/wJzVktLeF8dFsa8uL6bIKkFr7o8243Ew28qfsrQULGge6hkOCiIZ2GUmN+Aao/
 g22c78KHY2Fl+f8b7CIvYvzJFM/r/hftEGZ47axmKjuNxthB/zURfPkraA/pnBkVGO9O
 sC0IURztcOObzAYhrTrz9VvnTKiDWQ4/BWRxWF4pA0YNCYiJ5nWDta3a29Jl4sJycwxv
 ay9A==
X-Gm-Message-State: AOAM533zuZODChBbnQW2QPtvJgyWZBl6BoeDBxcDcLsNmQdkGhQC5lAM
 id3I55vMc4ycz3EnWrdS/Hxr+hvVRZI=
X-Google-Smtp-Source: ABdhPJxxP13F9ohQsbaJoDUX5Hy/e2xbMO9+ITeaskHh68iR1aZdZXU6Ru5UJPDFOtUMSXDOrYHpvg==
X-Received: by 2002:a17:90a:901:: with SMTP id n1mr3407544pjn.44.1624359558575; 
 Tue, 22 Jun 2021 03:59:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 34/43] KVM: PPC: Book3S HV P9: Demand fault EBB facility
 registers
Date: Tue, 22 Jun 2021 20:57:27 +1000
Message-Id: <20210622105736.633352-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use HFSCR facility disabling to implement demand faulting for EBB, with
a hysteresis counter similar to the load_fp etc counters in context
switching that implement the equivalent demand faulting for userspace
facilities.

This speeds up guest entry/exit by avoiding the register save/restore
when a guest is not frequently using them. When a guest does use them
often, there will be some additional demand fault overhead, but these
are not commonly used facilities.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 11 +++++++++++
 arch/powerpc/kvm/book3s_hv_nested.c   |  3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 26 ++++++++++++++++++++------
 4 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 118b388ea887..bee95106c1f2 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -585,6 +585,7 @@ struct kvm_vcpu_arch {
 	ulong cfar;
 	ulong ppr;
 	u32 pspb;
+	u8 load_ebb;
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index ae528eb37792..99e9da078e7d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1366,6 +1366,13 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.hfscr |= HFSCR_EBB;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1645,6 +1652,8 @@ XXX benchmark guest exits
 				r = kvmppc_emulate_doorbell_instr(vcpu);
 			if (cause == FSCR_PM_LG)
 				r = kvmppc_pmu_unavailable(vcpu);
+			if (cause == FSCR_EBB_LG)
+				r = kvmppc_ebb_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -1764,6 +1773,8 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		r = EMULATE_FAIL;
 		if (cause == FSCR_PM_LG && (vcpu->arch.nested_hfscr & HFSCR_PM))
 			r = kvmppc_pmu_unavailable(vcpu);
+		if (cause == FSCR_EBB_LG && (vcpu->arch.nested_hfscr & HFSCR_EBB))
+			r = kvmppc_ebb_unavailable(vcpu);
 
 		if (r == EMULATE_FAIL)
 			r = RESUME_HOST;
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 024b0ce5b702..ee8668f056f9 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -168,7 +168,8 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 	 * but preserve the interrupt cause field and facilities that might
 	 * be disabled for demand faulting in the L1.
 	 */
-	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | vcpu->arch.hfscr);
+	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | HFSCR_EBB |
+			vcpu->arch.hfscr);
 
 	/* Don't let data address watchpoint match in hypervisor state */
 	hr->dawrx0 &= ~DAWRX_HYP;
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 4d1a2d1ff4c1..cf41261daa97 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -218,9 +218,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	}
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
@@ -251,9 +254,20 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 static void store_spr_state(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+		vcpu->arch.bescr = mfspr(SPRN_BESCR);
+		/*
+		 * This is like load_fp in context switching, turn off the
+		 * facility after it wraps the u8 to try avoiding saving
+		 * and restoring the registers each partition switch.
+		 */
+		vcpu->arch.load_ebb++;
+		if (!vcpu->arch.load_ebb)
+			vcpu->arch.hfscr &= ~HFSCR_EBB;
+	}
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		vcpu->arch.tid = mfspr(SPRN_TIDR);
-- 
2.23.0

