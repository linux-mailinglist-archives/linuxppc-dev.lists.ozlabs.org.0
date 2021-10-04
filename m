Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDEC4213ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQvL0qPzz3f3S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:21:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MTD1iv4a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MTD1iv4a; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTP34Kcz3cGd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:17 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 qe4-20020a17090b4f8400b0019f663cfcd1so413690pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FkWMuHfPOxxrU47+vjgWI+l5GmxefJupZqH5KrybsgE=;
 b=MTD1iv4alXD6Gy8oE6uF5PjwPsDfr22C3DVhNrnbtt7Wt2wrv6zhcuHozDRV8id3Ry
 cE12gZpnxiLFer5SMxBhYTrnNuiuCqu3g+6XGBklgtZtMjmp05Ot4j940G/x59dHJ/P2
 SjKA/+H9WPgmyh2lB7IHlgYGaLGg9sPdA9Y4n6YEJ3PDitF+Hyjxf37MsH0Qg4PeZ24W
 aYIRieoHc86KxyjhPN3Sa2cKOGL9qexQg8CqyVgCv7uqAEM/GpClZVHF8YZygr/qSU1y
 NJwsCvdw8tF3ityQnAboSLty0VZkbmp/3O5EVBFnE8DwNbBGB9+MGWzS9S5H6Te8/Rk4
 HA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FkWMuHfPOxxrU47+vjgWI+l5GmxefJupZqH5KrybsgE=;
 b=SfsCh7BY2EOBMZ4HcsNIoWfYrlIlK+CRKikojYQxXbGKtkkRs1gL+K+BEWo0MqSZUz
 UVJxWjGgXXIAaxw5mAUySWBoE2t9YEnMPgtDPlj8dydFnFTQH5uQIJi+uw61wPiEuc93
 CBg+wcFVG5fO+kSlP8At+CKRHMwQn1nrI+Alp60l+3sFgquurq3Jz68UswMylqETT641
 lPU5NDgK0map7WPlfLdwoPFwlGNIhe64kSoMhjMibGqhnuLoAH5wo67eOBXx/Mj2yG1F
 lHrRydEF+B+jyQm06yHoNZ/qcbHJqoM2NzE0xWEUkexwROwJeD5PB6l6jWX9O+xTUqxI
 f+MQ==
X-Gm-Message-State: AOAM530oinrbV0Y97PuihNt3wTuEW75vUb46z7nokeuLuZDO3nSmUEW2
 bJG9jmcKuCKWp2ifnDsX6IgKTAK4HB4=
X-Google-Smtp-Source: ABdhPJwcKy7fbp9xvWCGnLZvfxut9nPBACN51oBqrzFVv3fqeNPJF4xKGk5f49QKX4MEqgPkoiUs3A==
X-Received: by 2002:a17:902:ba8e:b0:13e:c690:5acb with SMTP id
 k14-20020a170902ba8e00b0013ec6905acbmr408788pls.63.1633363334967; 
 Mon, 04 Oct 2021 09:02:14 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 30/52] KVM: PPC: Book3S HV P9: Move nested guest entry into
 its own function
Date: Tue,  5 Oct 2021 02:00:27 +1000
Message-Id: <20211004160049.1338837-31-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the part of the guest entry which is specific to nested HV into its
own function. This is just refactoring.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 125 +++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 580bac4753f6..a57727463980 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3809,6 +3809,72 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 	}
 }
 
+/* call our hypervisor to load up HV regs and go */
+static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	unsigned long host_psscr;
+	struct hv_guest_state hvregs;
+	int trap;
+	s64 dec;
+
+	/*
+	 * We need to save and restore the guest visible part of the
+	 * psscr (i.e. using SPRN_PSSCR_PR) since the hypervisor
+	 * doesn't do this for us. Note only required if pseries since
+	 * this is done in kvmhv_vcpu_entry_p9() below otherwise.
+	 */
+	host_psscr = mfspr(SPRN_PSSCR_PR);
+	mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+	kvmhv_save_hv_regs(vcpu, &hvregs);
+	hvregs.lpcr = lpcr;
+	vcpu->arch.regs.msr = vcpu->arch.shregs.msr;
+	hvregs.version = HV_GUEST_STATE_VERSION;
+	if (vcpu->arch.nested) {
+		hvregs.lpid = vcpu->arch.nested->shadow_lpid;
+		hvregs.vcpu_token = vcpu->arch.nested_vcpu_id;
+	} else {
+		hvregs.lpid = vcpu->kvm->arch.lpid;
+		hvregs.vcpu_token = vcpu->vcpu_id;
+	}
+	hvregs.hdec_expiry = time_limit;
+
+	/*
+	 * When setting DEC, we must always deal with irq_work_raise
+	 * via NMI vs setting DEC. The problem occurs right as we
+	 * switch into guest mode if a NMI hits and sets pending work
+	 * and sets DEC, then that will apply to the guest and not
+	 * bring us back to the host.
+	 *
+	 * irq_work_raise could check a flag (or possibly LPCR[HDICE]
+	 * for example) and set HDEC to 1? That wouldn't solve the
+	 * nested hv case which needs to abort the hcall or zero the
+	 * time limit.
+	 *
+	 * XXX: Another day's problem.
+	 */
+	mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - *tb);
+
+	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
+	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
+	trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
+				  __pa(&vcpu->arch.regs));
+	kvmhv_restore_hv_return_state(vcpu, &hvregs);
+	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
+	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
+	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
+	vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
+	mtspr(SPRN_PSSCR_PR, host_psscr);
+
+	dec = mfspr(SPRN_DEC);
+	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
+		dec = (s32) dec;
+	*tb = mftb();
+	vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
+
+	return trap;
+}
+
 /*
  * Guest entry for POWER9 and later CPUs.
  */
@@ -3817,7 +3883,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct p9_host_os_sprs host_os_sprs;
-	s64 dec;
 	u64 next_timer;
 	unsigned long msr;
 	int trap;
@@ -3870,63 +3935,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
-		/*
-		 * We need to save and restore the guest visible part of the
-		 * psscr (i.e. using SPRN_PSSCR_PR) since the hypervisor
-		 * doesn't do this for us. Note only required if pseries since
-		 * this is done in kvmhv_vcpu_entry_p9() below otherwise.
-		 */
-		unsigned long host_psscr;
-		/* call our hypervisor to load up HV regs and go */
-		struct hv_guest_state hvregs;
-
-		host_psscr = mfspr(SPRN_PSSCR_PR);
-		mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
-		kvmhv_save_hv_regs(vcpu, &hvregs);
-		hvregs.lpcr = lpcr;
-		vcpu->arch.regs.msr = vcpu->arch.shregs.msr;
-		hvregs.version = HV_GUEST_STATE_VERSION;
-		if (vcpu->arch.nested) {
-			hvregs.lpid = vcpu->arch.nested->shadow_lpid;
-			hvregs.vcpu_token = vcpu->arch.nested_vcpu_id;
-		} else {
-			hvregs.lpid = vcpu->kvm->arch.lpid;
-			hvregs.vcpu_token = vcpu->vcpu_id;
-		}
-		hvregs.hdec_expiry = time_limit;
-
-		/*
-		 * When setting DEC, we must always deal with irq_work_raise
-		 * via NMI vs setting DEC. The problem occurs right as we
-		 * switch into guest mode if a NMI hits and sets pending work
-		 * and sets DEC, then that will apply to the guest and not
-		 * bring us back to the host.
-		 *
-		 * irq_work_raise could check a flag (or possibly LPCR[HDICE]
-		 * for example) and set HDEC to 1? That wouldn't solve the
-		 * nested hv case which needs to abort the hcall or zero the
-		 * time limit.
-		 *
-		 * XXX: Another day's problem.
-		 */
-		mtspr(SPRN_DEC, kvmppc_dec_expires_host_tb(vcpu) - *tb);
-
-		mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
-		mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
-		trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
-					  __pa(&vcpu->arch.regs));
-		kvmhv_restore_hv_return_state(vcpu, &hvregs);
-		vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
-		vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
-		vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
-		vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
-		mtspr(SPRN_PSSCR_PR, host_psscr);
-
-		dec = mfspr(SPRN_DEC);
-		if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
-			dec = (s32) dec;
-		*tb = mftb();
-		vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
+		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
 
 		/* H_CEDE has to be handled now, not later */
 		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
-- 
2.23.0

