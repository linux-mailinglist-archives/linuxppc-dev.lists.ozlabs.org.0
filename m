Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5945A010
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0by6lDkz3h24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IDk6eAYW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IDk6eAYW; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxr2Thwz3cZd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:24 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id r5so17827708pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1gZf1alDneaohPPsv2AXcv+pjMMAQ/w3gd8XN4Oflvk=;
 b=IDk6eAYW82hDahbR+jGjB18WLGw7UOkmEH58EaZGOKwByEp4zh+6MXRZ7fMixbTWxx
 aM8YSo46C5Nf6NiXjlgu/Mih7lNzWBDwFHJQ3ok5q/z3/xJ068RBqrTe05yhFwjH8s2Q
 N2QpDQVb6m2VEwcw7S3shneE5jKjGuf8tINcRrWBrdtCS40agk0pfmVuTsenVZw1PU/U
 Lz80teDNWB1OwdOK2uLtA+euwB1etD2cNbX8oO/SYtOc8hMXjyEsJBmVK00Vk5g3O9uM
 SdSqrcN0NTXMTAFle6rjqOfrvkbohq48nZXOCRzOm7EgWEINfiRP030Bl5b03hA0mutf
 gD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1gZf1alDneaohPPsv2AXcv+pjMMAQ/w3gd8XN4Oflvk=;
 b=K3ydTdtYGqUef5Peso9AcrntkwWCdX3uSsEBQ4X9gURAsZQQIQ8G0XzVJT2kOyu1TU
 q1HVJEoUuMDaiY62P1bk409GbKIRhtYQU9FQPMGTTCM7JZmZvtsMzOWuCR75vnhozD+E
 F8YP8ozs8YaDy7zOQA6ufBBUlX3WIaUGb6pA6kbunvtQNNnH+04ErEM/TsHTk6VHAMgT
 RYsqGDvGM9/LNCideqEJO4ppS5phvixJAbODCaC2jYR635jQvN8Xa2dzMkZPfVSvY8ox
 csvp7K+yZBpHj4gflYUVzwbwVkRI0n7PNnfNiXeIYVrbH0biiXKH/4Brcjm0CqB+gjNv
 +qeQ==
X-Gm-Message-State: AOAM531vPNzyT0jvC5gedqZIxZ9qwChZNArItdwmWW8WNSB50B/iKXPc
 GcVn6yzGYoHQ4vyMa6/FyqDv1BUvCJKh4A==
X-Google-Smtp-Source: ABdhPJxgqChQFPT8fnTKX4cMXf4CX54nC9MbJK2jpnxalJAZT7rUSRgxF1GxKlvJdC8HfiUt9LQBOw==
X-Received: by 2002:a63:5c0a:: with SMTP id q10mr2772040pgb.213.1637661262047; 
 Tue, 23 Nov 2021 01:54:22 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 47/53] KVM: PPC: Book3S HV P9: Avoid changing MSR[RI] in
 entry and exit
Date: Tue, 23 Nov 2021 19:52:25 +1000
Message-Id: <20211123095231.1036501-48-npiggin@gmail.com>
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
index 8fa48ba01f79..6120cdf281b9 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -904,7 +904,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -916,14 +924,10 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
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
 	check_need_tlb_flush(kvm, vc->pcpu, nested);
@@ -978,19 +982,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -1048,13 +1049,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -1154,7 +1148,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+	barrier(); /* Close in_guest critical section */
+	WRITE_ONCE(local_paca->kvm_hstate.in_guest, KVM_GUEST_MODE_NONE);
+	/* Interrupts are recoverable at this point */
 
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
-- 
2.23.0

