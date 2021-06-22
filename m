Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76073B0285
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P1P39Kxz3gmW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:14:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=s5dXxDXl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=s5dXxDXl; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nh02hmNz3cC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:28 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so1505641pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TUzaj3ou1GO2NNNnuj5/I2wDiFVQkUTWC6/PNkNyxk8=;
 b=s5dXxDXl9r4dJGMNKTA2/SVozQIrYdO2CQCqy7/1XUQX1I6OjD4hf1scTqvfPUNASg
 6KDFpLRjNHX1glPMzBMJzB0yGtLYmeEiRG3E0yyHMIrPsU2ScwfEf2eJWwXeH2bxkABJ
 VfR9mqDiQTRL9iofQslV02dJ3paE/F3eqGT6K0bIpxy+atjX6mvHynUolwzc4RZc6c3N
 9EXbKAdpH1alBLp7NzhU3Wlp4lV2HT2cI2PhBvmCc2u1LEKmtdbhRee1GmdC6HrpTQz3
 WcYB/jQAtO/GBqQcCxXamnBU+gBpxBBM6PzyzNa0hxVrlxaW29arh2X1bMzgsjH2/W6o
 /yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TUzaj3ou1GO2NNNnuj5/I2wDiFVQkUTWC6/PNkNyxk8=;
 b=WH7wmGwXJqmbnIrRCtk8DgKqwHmEh2nJcNf+8fTXcTJxAuYsL/AGeJDw3WuFG0XvW7
 mVpR+rfI7ufIiudKugqpjVgi6mVSRk05bicmi/wIzFLTbhKitxUQ04+KcSCOI8ZJLk8z
 LqUETogre9UxlB4z/lUjCEMZOG8/qr7qDDj9EO651rZh0JoQ1BbxHkSg2PbDHkAuWd/z
 j0SvCPN4Hm5V5u5IPkldDd41Z12Rsipa3Pwp+gEX8ZehrfOdkv/llUOoyC09lNpJMkVk
 Qnr2AWygV02i0K95+ZCyDJTM1ty+v1R2w3rtpbd5gjRyznIHjfnX4SfLr8BR2GfVtfgx
 x7hA==
X-Gm-Message-State: AOAM532EgJFL+LzDDdoYX75eUy6nqyEwC5c05vjlrJfYUGNkHE5lTs/3
 G93BRXuBJ6o9kAKa+D3vI9k=
X-Google-Smtp-Source: ABdhPJz/BlKlTe8dkJTTinukuFFoQXWOFhqJEg9MaiXsO/sN/is8rdosD4OxcFhmPOxt3jmY15ZZbg==
X-Received: by 2002:a17:902:d694:b029:103:ec01:12d5 with SMTP id
 v20-20020a170902d694b0290103ec0112d5mr22300383ply.19.1624359565584; 
 Tue, 22 Jun 2021 03:59:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 37/43] KVM: PPC: Book3S HV P9: Comment and fix MMU context
 switching code
Date: Tue, 22 Jun 2021 20:57:30 +1000
Message-Id: <20210622105736.633352-38-npiggin@gmail.com>
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

Tighten up partition switching code synchronisation and comments.

In particular, hwsync ; isync is required after the last access that is
performed in the context of a partition, before the partition is
switched away from.

-301 cycles (6319) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  4 +++
 arch/powerpc/kvm/book3s_hv_p9_entry.c  | 40 +++++++++++++++++++-------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index d909c069363e..5a6ab0a61b68 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -53,6 +53,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 
 	preempt_disable();
 
+	asm volatile("hwsync" ::: "memory");
+	isync();
 	/* switch the lpid first to avoid running host with unallocated pid */
 	old_lpid = mfspr(SPRN_LPID);
 	if (old_lpid != lpid)
@@ -69,6 +71,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	else
 		ret = copy_to_user_nofault((void __user *)to, from, n);
 
+	asm volatile("hwsync" ::: "memory");
+	isync();
 	/* switch the pid first to avoid running host with unallocated pid */
 	if (quadrant == 1 && pid != old_pid)
 		mtspr(SPRN_PID, old_pid);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 55286a8357f7..7aa72efcac6c 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -503,17 +503,19 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
 
 	/*
-	 * All the isync()s are overkill but trivially follow the ISA
-	 * requirements. Some can likely be replaced with justification
-	 * comment for why they are not needed.
+	 * Prior memory accesses to host PID Q3 must be completed before we
+	 * start switching, and stores must be drained to avoid not-my-LPAR
+	 * logic (see switch_mmu_to_host).
 	 */
+	asm volatile("hwsync" ::: "memory");
 	isync();
 	mtspr(SPRN_LPID, lpid);
-	isync();
 	mtspr(SPRN_LPCR, lpcr);
-	isync();
 	mtspr(SPRN_PID, vcpu->arch.pid);
-	isync();
+	/*
+	 * isync not required here because we are HRFID'ing to guest before
+	 * any guest context access, which is context synchronising.
+	 */
 }
 
 static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
@@ -523,25 +525,41 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 
 	lpid = kvm->arch.lpid;
 
+	/*
+	 * See switch_mmu_to_guest_radix. ptesync should not be required here
+	 * even if the host is in HPT mode because speculative accesses would
+	 * not cause RC updates (we are in real mode).
+	 */
+	asm volatile("hwsync" ::: "memory");
+	isync();
 	mtspr(SPRN_LPID, lpid);
 	mtspr(SPRN_LPCR, lpcr);
 	mtspr(SPRN_PID, vcpu->arch.pid);
 
 	for (i = 0; i < vcpu->arch.slb_max; i++)
 		mtslb(vcpu->arch.slb[i].orige, vcpu->arch.slb[i].origv);
-
-	isync();
+	/*
+	 * isync not required here, see switch_mmu_to_guest_radix.
+	 */
 }
 
 static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 {
+	/*
+	 * The guest has exited, so guest MMU context is no longer being
+	 * non-speculatively accessed, but a hwsync is needed before the
+	 * mtLPIDR / mtPIDR switch, in order to ensure all stores are drained,
+	 * so the not-my-LPAR tlbie logic does not overlook them.
+	 */
+	asm volatile("hwsync" ::: "memory");
 	isync();
 	mtspr(SPRN_PID, pid);
-	isync();
 	mtspr(SPRN_LPID, kvm->arch.host_lpid);
-	isync();
 	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-	isync();
+	/*
+	 * isync is not required after the switch, because mtmsrd with L=0
+	 * is performed after this switch, which is context synchronising.
+	 */
 
 	if (!radix_enabled())
 		slb_restore_bolted_realmode();
-- 
2.23.0

