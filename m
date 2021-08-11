Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF813E9615
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFmF5g3pz3fcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:35:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oD0jskWx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oD0jskWx; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF4F0msCz3dHr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:56 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id e15so3275606plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ln6cdzeucykGbF0vTkTvQZAkd6bVcCqA4wzaEbEDif0=;
 b=oD0jskWxqr7aS/KUJbVu8G2XpHq5H/isMbATGUXHSULeArmjmPzb1JFu64rUrLP4t8
 MpxKHSQsLhCAgfQFPWZ9v1RJjw5u5cuRFYBX+tCk58d/ApJCgh4x747a+NPYeEFIi9QF
 EnYTp0504WSqmFDwomy+g94kBiTsVmFcZDKxWI5aKGdUYNuKOpyOsr5HH4PqO9oQWbmS
 INs5ellFjuo1T9cPWv5kSb7b1cxkGcNhFYwVXFyBkmI8EKFNcNn5bbyyC+u/POMtlHMy
 XZkWaGjRFoeoNuANV0BJDVLR8YqoH/3uEsWHVtQOLl3UDRqnp6HZmcVIEBQwqfFZz7A/
 KX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ln6cdzeucykGbF0vTkTvQZAkd6bVcCqA4wzaEbEDif0=;
 b=gAYW6Mz9LRB0rNLAWYL3oNi4D28esJ5S6ziAbh33ddMEP2UAXBOQBVvEKB2WykOBev
 FmYakLZJ5NSZi2Z3z4KRrNTaUTytSfkeiiHiNoUfZW4OZosmf3z4crNSNRcxDxqVb+BM
 Tjm1O+Jp+J5ytk8YV/ktrxEsejOKdbR2jfgz2vUxlfUxMG4sNY3JyNNX60drGjAX+dFx
 LxBjCKRSkEuLJsV0wpT6IyVAE2QADHCwkw37o71Ar8TyFDpML8TVgEi8A/yn8/jYU66c
 kfxGC/cyTqm7zaY/rE92dDiZ2YAB8Wj2UTOpCQ9Zxeen9vkMxgveJSlTrZ0L8LQEB39C
 oQUQ==
X-Gm-Message-State: AOAM533wCdoMdxwg9t3fCFa7rmvprBkIsDzAeL8s0hulBNPssKK85uKN
 sTvLIs6IQiRWvqRNLQi6DZUhK3mllyQ=
X-Google-Smtp-Source: ABdhPJwlcB+1WRxjCluA6sdnTpIqSepiajUMT2RVFM4FcH9PPRIkQXbUMBapQGtwW7FJc/YoF46OIw==
X-Received: by 2002:a17:90a:ba8e:: with SMTP id
 t14mr38079862pjr.176.1628697835026; 
 Wed, 11 Aug 2021 09:03:55 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 50/60] KVM: PPC: Book3S HV P9: Avoid tlbsync sequence on
 radix guest exit
Date: Thu, 12 Aug 2021 02:01:24 +1000
Message-Id: <20210811160134.904987-51-npiggin@gmail.com>
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

Use the existing TLB flushing logic to IPI the previous CPU and run the
necessary barriers before running a guest vCPU on a new physical CPU,
to do the necessary radix GTSE barriers for handling the case of an
interrupted guest tlbie sequence.

This results in more IPIs than the TLB flush logic requires, but it's
a significant win for common case scheduling when the vCPU remains on
the same physical CPU.

This saves about 520 cycles (nearly 10%) on a guest entry+exit micro
benchmark on a POWER9.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 31 +++++++++++++++++++++++----
 arch/powerpc/kvm/book3s_hv_p9_entry.c |  9 --------
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3983c5fa065a..7d08b826d355 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3028,6 +3028,25 @@ static void radix_flush_cpu(struct kvm *kvm, int cpu, struct kvm_vcpu *vcpu)
 			smp_call_function_single(i, do_nothing, NULL, 1);
 }
 
+static void do_migrate_away_vcpu(void *arg)
+{
+	struct kvm_vcpu *vcpu = arg;
+	struct kvm *kvm = vcpu->kvm;
+
+	/*
+	 * If the guest has GTSE, it may execute tlbie, so do a eieio; tlbsync;
+	 * ptesync sequence on the old CPU before migrating to a new one, in
+	 * case we interrupted the guest between a tlbie ; eieio ;
+	 * tlbsync; ptesync sequence.
+	 *
+	 * Otherwise, ptesync is sufficient.
+	 */
+	if (kvm->arch.lpcr & LPCR_GTSE)
+		asm volatile("eieio; tlbsync; ptesync");
+	else
+		asm volatile("ptesync");
+}
+
 static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
 {
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
@@ -3055,10 +3074,14 @@ static void kvmppc_prepare_radix_vcpu(struct kvm_vcpu *vcpu, int pcpu)
 	 * so we use a single bit in .need_tlb_flush for all 4 threads.
 	 */
 	if (prev_cpu != pcpu) {
-		if (prev_cpu >= 0 &&
-		    cpu_first_tlb_thread_sibling(prev_cpu) !=
-		    cpu_first_tlb_thread_sibling(pcpu))
-			radix_flush_cpu(kvm, prev_cpu, vcpu);
+		if (prev_cpu >= 0) {
+			if (cpu_first_tlb_thread_sibling(prev_cpu) !=
+			    cpu_first_tlb_thread_sibling(pcpu))
+				radix_flush_cpu(kvm, prev_cpu, vcpu);
+
+			smp_call_function_single(prev_cpu,
+					do_migrate_away_vcpu, vcpu, 1);
+		}
 		if (nested)
 			nested->prev_cpu[vcpu->arch.nested_vcpu_id] = pcpu;
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 183d5884e362..94b15294a388 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -1045,15 +1045,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
-	if (kvm_is_radix(kvm)) {
-		/*
-		 * Since this is radix, do a eieio; tlbsync; ptesync sequence
-		 * in case we interrupted the guest between a tlbie and a
-		 * ptesync.
-		 */
-		asm volatile("eieio; tlbsync; ptesync");
-	}
-
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
 	 * to clear the copy buffer that was under control of the guest.
-- 
2.23.0

