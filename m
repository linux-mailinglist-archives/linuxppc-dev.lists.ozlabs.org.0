Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE55E3E9621
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFqN3w3Bz3hPP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UKOkMobR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UKOkMobR; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4Q5qJkz3dLS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:04:06 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id a20so3350000plm.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lGFwm9eLMc818K8Y7HbXY46Jvms/PHQTfB9Xnbg0In4=;
 b=UKOkMobR524dzmwACOuDHce1apQN8B3xOUPuWeZ+dEAbTPZ7xWGBwUrDeOFqQwhIKf
 vu90SPr2ao5wIranB8XSk/XoEbm9hR7SXqSZtmKj3m/W/w/kdrvnnvGY8/5YtC8mz1sN
 LHWh0E7qj9ZGIoCEYJlg3UHkPpblLCp9wPtW/nygqC5qqdxVWOoP1q0ty94crB2uVxwk
 qZPVCbo7M3ZWNftVYOMOTIzOXZ2KXsIUPtbk3C5AWDwCRVIuBCBkq1rZKVqz+6aH6VMr
 6P8lde9ikwC3rG6R5vECx2XzO3oAAZS9ytowh3BfTBDik3PixzZPIhO14DtYMY0P1tDY
 M8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lGFwm9eLMc818K8Y7HbXY46Jvms/PHQTfB9Xnbg0In4=;
 b=Y4u2b6QUHRMEP1pIrDRr7RDgRCPQwMOn5ucciJOjGk3MPMP8DkR2iNBsW1jGOPyxGG
 4/cjedDsTwEmzbcngsFpHG6bC51X95K4NW//AJHQSOvJ58b0SBHB7AmWchxdbrxANtjw
 xWNDH+nF6uwk5AASFb1NJ3r1xn6GU3fmP+p42BYorvbgidLGSM7b9MniaYNmck4NChGm
 nq8uNTbR98rFba3AJdaBYSksj80er1K4/Zbhn6irvATrzlQqavqYBcNNS30oXp+KloX9
 mZF/tTOERtkYlMYhav0neE9Utd0nJgWYT62aA3mr/1WhwAY1YGQrBltpzJEh3lY5iBTN
 OOjg==
X-Gm-Message-State: AOAM530UrW21JfF+XNBcFBcl1xYcs2xC5GNB+z/o9Lz1NwaiXx1dV+Js
 KrZAefQnW1x8wvnpC5EsDv4=
X-Google-Smtp-Source: ABdhPJz0cgfxKnR+wqNYHrawFiUMpNNJFs8wHnfFYJOWIj1C27SkzJRTWtm2J0AqLhTROVRE3ixSKw==
X-Received: by 2002:a17:90a:1d44:: with SMTP id
 u4mr11329555pju.119.1628697844869; 
 Wed, 11 Aug 2021 09:04:04 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:04:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 54/60] KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in
 entry and exit
Date: Thu, 12 Aug 2021 02:01:28 +1000
Message-Id: <20210811160134.904987-55-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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

From: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 50 ++++++++++++---------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index cb865fe2580d..5745a49021c3 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -825,7 +825,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -837,14 +845,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
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
@@ -899,19 +903,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -969,13 +970,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -1075,7 +1069,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+	barrier(); /* Close in_guest critical section */
+	WRITE_ONCE(local_paca->kvm_hstate.in_guest, KVM_GUEST_MODE_NONE);
+	/* Interrupts are recoverable at this point */
 
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
-- 
2.23.0

