Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB53B026F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NvK0Cwzz3g0t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GnDyThXY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GnDyThXY; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NgT6NR0z3c5G
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:01 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 c7-20020a17090ad907b029016faeeab0ccso1491741pjv.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QU6ypj1Mwyb/FvmgSGxGGx4Ba3UQZqEKmBPVAoHY3io=;
 b=GnDyThXYfXmPy8A6OdFo3Qnk+touG//Okg7Msj35+iDrMS9DmDwYCtvmwuRutwA5FQ
 7Yj1AP8netxD+vv2zCGKOBTGcZ6MzxnNh9lOuJP5EUd0Voa6Tqbhg587t1i5XwaBXGL7
 c2QtT+9Etzysud9jRm07MwJP0tcObJgeJRMNFrUuv5LPH+UP0BuOCP1h7CuujdEC4Kv9
 wfn65gjSHJfvZpgcOOq4k5m2p6X2JbeoKoNuhWBN1lYS3J7A7NtDXCK6Nuve0od1GhpW
 fnuyioXQD9bQLsxSYkklT4VvhCt5EGpUi5r9yJdsO79jNR3S5yqLtOWpAm1lOhQW8zi/
 tnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QU6ypj1Mwyb/FvmgSGxGGx4Ba3UQZqEKmBPVAoHY3io=;
 b=l3DQCxmck5dlLJwwdTDT2qmCmNMRNMODzY0UbH7R/D/VZClfeqcM72VeI+yIGI04H1
 z1SYIYyZY5VR/C/eEDew3sBuFQUSUFCHs8sOyqewKPNfQulrgyRw1WjJKQexGGx5YhHW
 OroOGucT3Hq+pny7QcAeTu0eQUthoUOn3FFkn1n5QKFkO2tZgck/H/+OGJl6f2PkKmrd
 LxmApdsKfiYAVxDyTrmvjEy2ndRetH5N+Cca8OUzDvMPyZZbS162eIxYZ5uXof9IQ/ln
 jQ87OKmKk53FlCkC07/iN4xv2ExRuSFI1BlSqHLywks/fuVWEwnZlGWCSk2+05bpjQy7
 JREw==
X-Gm-Message-State: AOAM531pjf457kuYS3Ejt6i9Fvgl+N14gKxQTTJseNU1ETDvYAk8QsoT
 RBsVQCRIaucAsWI1g0NOQTY=
X-Google-Smtp-Source: ABdhPJxqafyHR7gYgMcqnvyIUa1EktijMZaV/aJ3bQERi+ZZGcrqxHDqm2bvfnzyk7uWOKOaMftvag==
X-Received: by 2002:a17:90b:11ca:: with SMTP id
 gv10mr3411133pjb.94.1624359533190; 
 Tue, 22 Jun 2021 03:58:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 23/43] KVM: PPC: Book3S HV P9: Avoid SPR scoreboard stalls
Date: Tue, 22 Jun 2021 20:57:16 +1000
Message-Id: <20210622105736.633352-24-npiggin@gmail.com>
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

Avoid interleaving mfSPR and mtSPR.

-151 cycles (7427) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          |  8 ++++----
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 19 +++++++++++--------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 99b19f4e7ed7..8c6ba04e1fdf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4165,10 +4165,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	store_spr_state(vcpu);
 
-	timer_rearm_host_dec(*tb);
-
-	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-
 	store_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
 	store_vr_state(&vcpu->arch.vr);
@@ -4183,6 +4179,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
+	timer_rearm_host_dec(*tb);
+
+	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
+
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 237ea1ef1eab..afdd7dfa1c08 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -228,6 +228,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
+	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
+	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
+
 	if (vc->tb_offset) {
 		u64 new_tb = *tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -244,8 +247,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_DPDES, vc->dpdes);
 	mtspr(SPRN_VTB, vc->vtb);
 
-	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
-	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
 	mtspr(SPRN_PURR, vcpu->arch.purr);
 	mtspr(SPRN_SPURR, vcpu->arch.spurr);
 
@@ -433,10 +434,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
-	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr +
-	      purr - vcpu->arch.purr);
-	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr +
-	      spurr - vcpu->arch.spurr);
+	local_paca->kvm_hstate.host_purr += purr - vcpu->arch.purr;
+	local_paca->kvm_hstate.host_spurr += spurr - vcpu->arch.spurr;
 	vcpu->arch.purr = purr;
 	vcpu->arch.spurr = spurr;
 
@@ -449,6 +448,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.shregs.sprg2 = mfspr(SPRN_SPRG2);
 	vcpu->arch.shregs.sprg3 = mfspr(SPRN_SPRG3);
 
+	vc->dpdes = mfspr(SPRN_DPDES);
+	vc->vtb = mfspr(SPRN_VTB);
+
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
@@ -466,6 +468,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = 0;
 	}
 
+	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr);
+	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr);
+
 	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
 	mtspr(SPRN_PSSCR, host_psscr |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
@@ -494,8 +499,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		asm volatile(PPC_CP_ABORT);
 
-	vc->dpdes = mfspr(SPRN_DPDES);
-	vc->vtb = mfspr(SPRN_VTB);
 	mtspr(SPRN_DPDES, 0);
 	if (vc->pcr)
 		mtspr(SPRN_PCR, PCR_MASK);
-- 
2.23.0

