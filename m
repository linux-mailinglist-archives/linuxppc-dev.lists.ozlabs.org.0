Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5273D522A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5vB4lngz3dvY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:05:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YBpupHco;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YBpupHco; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5bB179Zz30KD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:06 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so1975189pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7lSZKkeRBx/lmK1ZoScnTXTHEokSNfF7n9IIZhjKQo=;
 b=YBpupHcoosdsjx1bOr/CykY+lat2mvzOYg7BAfxFWPCzAl7yFICO2Qjm3SikCcM1hi
 +vRUxqF0omZ3T88ih3A0goPjvKwCXHf4XFE2QCXHqhg5uhmUSFEC8x95IuXtkUJEdi3u
 Y3KlazkdDRyx/wmtpPflD0SWPvecuA/H+mfWFqfElGRuNY5/o5w5lIonsyKK9RxKmPTh
 LZjR3F7QhPTZlbT1ne4Iyl4en8zK4gW5Wo8xJbLK4dNePxjf82lFphw0TRMChl/8YT/u
 fHQnE8LFavjroy4SEV8gjFH+9embDMCjHegJ9uIl/IPmDG1/7kYyZ+VsvXSd72z2yMlr
 BeaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7lSZKkeRBx/lmK1ZoScnTXTHEokSNfF7n9IIZhjKQo=;
 b=ZWla1w6Uj00gQ40YJ8L4d4TPkAeVlu7E5AgVUXE5+UzPRdMFHaLHh5hXGRhlSEN5LM
 dxnRXoWm1AgTsm/G6iMRZbQIa/Py00RiHLIqz+0aY77DTWT+gDvYoYjDPsSygxq/H9nb
 iaQzw4lJ6GX8G9XWxsvZnen0X8mCkj/9kNnFte6+twHouRYsJMyJ/76OFbvsrn5xZ214
 y9Wt3N6nORE11beDZ9D9DLUzQk17pmepBXcLn11mv0GipH7cNbeBN7/QOHZ/S13++M25
 rbClQa0IqiYUuSkd2NAcQB8aI64yw2lKTPaShtrpSg+rsBG+TnMzxQNvndNvcqr4TT2r
 9lNg==
X-Gm-Message-State: AOAM530+hdst4mE8urqDs6VVL/r8kRTgAVP3W9Em5z4TXIKC8xlJWyzG
 EtivrkeCJkRBjg9u4vbhiOc=
X-Google-Smtp-Source: ABdhPJxXIfnXaG+zeKXPwYRcltDiIUqW6u3IvV15bXucFIUJFYdE8KTH07jRzewjdwaIFknPG2FQhA==
X-Received: by 2002:a17:90b:4b08:: with SMTP id
 lx8mr15407571pjb.66.1627271524129; 
 Sun, 25 Jul 2021 20:52:04 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 34/55] KVM: PPC: Book3S HV P9: Move nested guest entry into
 its own function
Date: Mon, 26 Jul 2021 13:50:15 +1000
Message-Id: <20210726035036.739609-35-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is just refactoring.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 125 +++++++++++++++++++----------------
 1 file changed, 67 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 977712eb74e0..cb66c9534dbf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3789,6 +3789,72 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
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
@@ -3797,7 +3863,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct p9_host_os_sprs host_os_sprs;
-	s64 dec;
 	u64 next_timer;
 	unsigned long msr;
 	int trap;
@@ -3850,63 +3915,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

