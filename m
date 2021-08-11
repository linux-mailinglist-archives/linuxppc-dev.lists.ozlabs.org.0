Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ABF3E95E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFdK45Qhz3ghK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PSPAlFat;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PSPAlFat; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3n606lz3dFb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:33 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id b7so3285562plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=seBS1CKh1tdJivnx8ndo4Zu4wItjYVzMJJMUXfTGVvE=;
 b=PSPAlFatBQ+1B6aLgAp2LKgkYDsDtU4inSnxdbXA2HlkzIVoFdMX5D8W31vAUax/JF
 /Ug2/aKUrWfP73U3nHdIfG3gD0JmH/L3dumzXvTfmWBfEp9saVhls/jeTWpjsqLm957R
 Z2T+MF8CCzsmWlBltQZYZTPQ1W3QUuNSMEU1rPIBUohx2bWWzO1PPCmeODkH4VMMLu59
 f2FZ6T38BEcFSIgcWAS3vPQ/Qp6JugGi703Wb5sSGDArUZisE8ZRH/4nLwT3JATwWbv+
 I918hmOvE/IIEvoGSn2kCJLfqhPmtw+itIfAB9y8/J46CPudz2HcZht+ycAQlEm1NZ4m
 STuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seBS1CKh1tdJivnx8ndo4Zu4wItjYVzMJJMUXfTGVvE=;
 b=HyHpNQP9YfzkCKqxlrcQQWvAILwBy+K+F3jgG67tGlG4SP7D0BBvIS32O1M3UMCvn0
 4kEvJzZqaXswx0AOv8T1n8SjdbufAY4Q1u8++fzoIzNM6VCMqEDBO1qzoqKEvg/oJdDt
 GtNjvIG5VLFfV4LQHPfkwzTa8mcfBlGtv0a7E/CrA/5BS+WKeVvU01U/eQrelqxNOVVL
 b+fdo5v/iP9RYSThdrEFRfEkWw8baBdBb1PkDD2FQT5oHFusN78m+DnQ2eT4DvhSqAuJ
 OrZFn5a0GP6bPmF9MeY3b7Aqp9PxxfubHPP+2emd34WneMJLXsMtwMyAUOkJZndZd4ae
 eKpA==
X-Gm-Message-State: AOAM532oneIxw9wN6vuJgxtngGy57eFDv1940IrHyAr2+ExVMzLMCLS4
 Gtx8U+Q4q9fpRWrLuyf0Qws=
X-Google-Smtp-Source: ABdhPJzQiy935f6UIsCwZfdi6QtVSrEE6j6Mo3zLJYxYjBVNd49DHIHZaKJEgWaBGYnctR3+MEXiyg==
X-Received: by 2002:a17:90a:648b:: with SMTP id
 h11mr10767670pjj.141.1628697812062; 
 Wed, 11 Aug 2021 09:03:32 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:31 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 41/60] KVM: PPC: Book3S HV P9: Switch PMU to guest as late
 as possible
Date: Thu, 12 Aug 2021 02:01:15 +1000
Message-Id: <20210811160134.904987-42-npiggin@gmail.com>
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

This moves PMU switch to guest as late as possible in entry, and switch
back to host as early as possible at exit. This helps the host get the
most perf coverage of KVM entry/exit code as possible.

This is slightly suboptimal for SPR scheduling point of view when the
PMU is enabled, but when perf is disabled there is no real difference.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 6 ++----
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 26872a4993fd..c76deb3de3e9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3823,8 +3823,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	s64 dec;
 	int trap;
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
-
 	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
@@ -3887,9 +3885,11 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 	trap = plpar_hcall_norets(H_ENTER_NESTED, __pa(&hvregs),
 				  __pa(&vcpu->arch.regs));
 	kvmhv_restore_hv_return_state(vcpu, &hvregs);
+	switch_pmu_to_host(vcpu, &host_os_sprs);
 	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
 	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
 	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
@@ -3908,8 +3908,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	return trap;
 }
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index e52d8b040970..48cc94f3d642 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -597,8 +597,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
 	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
-
 	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
@@ -740,7 +738,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.guest_time);
 
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 	kvmppc_p9_enter_guest(vcpu);
+	switch_pmu_to_host(vcpu, &host_os_sprs);
 
 	accumulate_time(vcpu, &vcpu->arch.rm_intr);
 
@@ -951,8 +951,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		asm volatile(PPC_CP_ABORT);
 
 out:
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	end_timing(vcpu);
 
 	return trap;
-- 
2.23.0

