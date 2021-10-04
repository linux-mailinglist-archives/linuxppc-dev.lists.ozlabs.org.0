Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6C421427
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR7y3LKZz3gsZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:32:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cpBuA2+p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cpBuA2+p; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQV54rMBz3cTV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:53 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id m5so2168293pfk.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vCwWZGrYE8T5YkED8uLzl3raa2ughTUaoc+B3T67xTw=;
 b=cpBuA2+p/mQO3rKiuksM1s0lHQmv86BzOqNOKncg79TDpe6EJeli+QnzXdKgMzlRLs
 99BA0E+OWvTqJPh8gRe32pLGGuokKo0TGClU6753EomRo4z7JEF7FV4vSmknBKqUMXPm
 hwoEVffSfEDOxDcBbMbIZooGE0vkzOpzzLqiAW0OAy178zu6LQoXnSm1rontg7QtjKIJ
 CrUEV//hc/HaWMowRnpjee2Fsi55Qgic1DEH8r3BCTypshYWzeUX1SDhonu7acepCcs1
 RPaazrn1u8lpULKgEUnh/hkl5Bra5Xk7o0vru3LHwsknbiDMaph25u/VVcX1n8wwYSB5
 cneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vCwWZGrYE8T5YkED8uLzl3raa2ughTUaoc+B3T67xTw=;
 b=tZn/01HshpPVOYTLQlhvAkfUBHCvBAQbj8MeulQwEPjeKbYNbUYkpI/rA82kwWTdo7
 z78BP1VkuarAJHW7/Aet/0T2MX2EeOqG1xubXhxunpvWxfSyDTNHnyf5EZYVBk2yyJ4J
 0shoupP0b3a1ioVlGF5i1RjNEspbLVK1gB5CoonjH4dZAdV/fMCYnlHv4wbgT0hEEpCY
 4E6bnWb2FJeZ+OfjEfNtYS7iz6n95zlWmBkeGW0tW7qTrKIkQg+4JbFsV3v978LWupPp
 zJ/cy7i+0lbuPPOP8tMm4zN8lji2XYvbUn0/tVnZzLeMZUDIB4wAw7xXDTvNm2boG4IQ
 qJMw==
X-Gm-Message-State: AOAM533m0tdRvLPQkcFvqOfp+XfIZx1Y4KFCWcB9qEB5YpiR0NACoCZO
 1X3g8yAeflLLriYPqcOV9+k=
X-Google-Smtp-Source: ABdhPJwsgIX03roCMtb6NAeSHPwc6TBmSZsvJ+1epu+plLdCue3rqiWj47CVjfAgsnqf0VTXdwC5GQ==
X-Received: by 2002:a05:6a00:c81:b029:30e:21bf:4c15 with SMTP id
 a1-20020a056a000c81b029030e21bf4c15mr25167641pfv.70.1633363371378; 
 Mon, 04 Oct 2021 09:02:51 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 46/52] KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in
 entry and exit
Date: Tue,  5 Oct 2021 02:00:43 +1000
Message-Id: <20211004160049.1338837-47-npiggin@gmail.com>
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

kvm_hstate.in_guest provides the equivalent of MSR[RI]=0 protection,
and it covers the existing MSR[RI]=0 section in late entry and early
exit, so clearing and setting MSR[RI] in those cases does not
actually do anything useful.

Remove the RI manipulation and replace it with comments. Make the
in_guest memory accesses a bit closer to a proper critical section
pattern. This speeds up guest entry/exit performance.

This also removes the MSR[RI] warnings which aren't very interesting
and would cause crashes if they hit due to causing an interrupt in
non-recoverable code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 50 ++++++++++++---------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 99ce5805ea28..5a71532a3adf 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -829,7 +829,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * But TM could be split out if this would be a significant benefit.
 	 */
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_P9;
+	/*
+	 * MSR[RI] does not need to be cleared (and is not, for radix guests
+	 * with no prefetch bug), because in_guest is set. If we take a SRESET
+	 * or MCE with in_guest set but still in HV mode, then
+	 * kvmppc_p9_bad_interrupt handles the interrupt, which effectively
+	 * clears MSR[RI] and doesn't return.
+	 */
+	WRITE_ONCE(local_paca->kvm_hstate.in_guest, KVM_GUEST_MODE_HV_P9);
+	barrier(); /* Open in_guest critical section */
 
 	/*
 	 * Hash host, hash guest, or radix guest with prefetch bug, all have
@@ -841,14 +849,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	save_clear_host_mmu(kvm);
 
-	if (kvm_is_radix(kvm)) {
+	if (kvm_is_radix(kvm))
 		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
-		if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-			__mtmsrd(0, 1); /* clear RI */
-
-	} else {
+	else
 		switch_mmu_to_guest_hpt(kvm, vcpu, lpcr);
-	}
 
 	/* TLBIEL uses LPID=LPIDR, so run this after setting guest LPID */
 	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
@@ -903,19 +907,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
 
 	/*
-	 * Only set RI after reading machine check regs (DAR, DSISR, SRR0/1)
-	 * and hstate scratch (which we need to move into exsave to make
-	 * re-entrant vs SRESET/MCE)
+	 * After reading machine check regs (DAR, DSISR, SRR0/1) and hstate
+	 * scratch (which we need to move into exsave to make re-entrant vs
+	 * SRESET/MCE), register state is protected from reentrancy. However
+	 * timebase, MMU, among other state is still set to guest, so don't
+	 * enable MSR[RI] here. It gets enabled at the end, after in_guest
+	 * is cleared.
+	 *
+	 * It is possible an NMI could come in here, which is why it is
+	 * important to save the above state early so it can be debugged.
 	 */
-	if (ri_set) {
-		if (unlikely(!(mfmsr() & MSR_RI))) {
-			__mtmsrd(MSR_RI, 1);
-			WARN_ON_ONCE(1);
-		}
-	} else {
-		WARN_ON_ONCE(mfmsr() & MSR_RI);
-		__mtmsrd(MSR_RI, 1);
-	}
 
 	vcpu->arch.regs.gpr[9] = exsave[EX_R9/sizeof(u64)];
 	vcpu->arch.regs.gpr[10] = exsave[EX_R10/sizeof(u64)];
@@ -973,13 +974,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 				 */
 				mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
 				mtspr(SPRN_HSRR1, vcpu->arch.shregs.msr);
-
-				/*
-				 * tm_return_to_guest re-loads SRR0/1, DAR,
-				 * DSISR after RI is cleared, in case they had
-				 * been clobbered by a MCE.
-				 */
-				__mtmsrd(0, 1); /* clear RI */
 				goto tm_return_to_guest;
 			}
 		}
@@ -1079,7 +1073,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+	barrier(); /* Close in_guest critical section */
+	WRITE_ONCE(local_paca->kvm_hstate.in_guest, KVM_GUEST_MODE_NONE);
+	/* Interrupts are recoverable at this point */
 
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
-- 
2.23.0

