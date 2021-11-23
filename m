Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF02459FF0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:18:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Tl50Kjz3gXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:18:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CChLuTWm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CChLuTWm; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxX3cZzz3cQx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:08 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id h63so17792836pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3rikcBBW6faBn9HW3G/ktrFps4HGeSwQYtxL/+Kwgo=;
 b=CChLuTWmytyh6w3sIiXXJVeeIztaXJMuVBI8iVGns2u2WHO7GGdvzcVtZqFanRTB2T
 9jz0tq721aM8Pefa11idxPYebfa77i1e2lw6fJAH4eGSMLuuvETVJ1C8uHuMEwjP2g6g
 27uk1da45uyx3tepYBCN5X9/gOSqYNpNadBWymG67UM4jJhtaOkI4WXjFLdHB6Nixtsg
 fiEQzaPx60hrnc9T3y1OsoHlIG9o7cUbHhxICBWQR2X/VRIQZju50iz1TWtQoLEKm6Rz
 EHFpSqMBaeu1m83D16YLzdhS2QrxEaFRwtT9s6aL9kbAZ1MFQnZWJLZxqe8aknxGGxkL
 rbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3rikcBBW6faBn9HW3G/ktrFps4HGeSwQYtxL/+Kwgo=;
 b=DxBGx5b55pu5Jpv3U6M0n2OsyF5IFFbE6XH5NFDH22mrVWr0TIp99Lj9PtxxfcwR74
 ob7nYnRM4+p13s/51eFbWl3Lza75F6sahg3fTe97eJ3SyYiEHTxmZLKB9LJb3uVIm46x
 DmpfOukYu/zxr6FJvKI5kB3YS1SQx2z5YQRSwo66LF2R6pqjdogKRLWyJOLQMK2IXb7A
 EEAy2lsLo3QWP+7rDMNNQ2kCZd54ETkTown+1E7qX7nBI7ektxs4xdZW62wxciAZEmcp
 veViYZI0D5vovFoULtHGfnP2MI6YBvUS/cJ4fIuj86iOyb3tFpJVmhydFh+SvDogecNO
 dBsA==
X-Gm-Message-State: AOAM532JlC3eWYs5S1jIu8DJMbqY63mkDsFnVEDCLla03s/ZmiJr+sG+
 6BnLWTLGbiAesIpeq4E4abdRXxUT3t4WFQ==
X-Google-Smtp-Source: ABdhPJyEvQ6tFB8ljm5Hu8yTqMv8jpVZ/DrZYvjcHMzNs3ZJT5K5qVS4mTMVDarvdr+cdvii93i1rQ==
X-Received: by 2002:a05:6a00:1946:b0:492:64f1:61b5 with SMTP id
 s6-20020a056a00194600b0049264f161b5mr3947291pfk.52.1637661246094; 
 Tue, 23 Nov 2021 01:54:06 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 39/53] KVM: PPC: Book3S HV P9: Comment and fix MMU context
 switching code
Date: Tue, 23 Nov 2021 19:52:17 +1000
Message-Id: <20211123095231.1036501-40-npiggin@gmail.com>
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

Tighten up partition switching code synchronisation and comments.

In particular, hwsync ; isync is required after the last access that is
performed in the context of a partition, before the partition is
switched away from.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_64_entry.S     | 11 +++++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c |  4 +++
 arch/powerpc/kvm/book3s_hv_p9_entry.c  | 40 +++++++++++++++++++-------
 3 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index 983b8c18bc31..05e003eb5d90 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -374,11 +374,16 @@ END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 BEGIN_FTR_SECTION
 	mtspr	SPRN_DAWRX1,r10
 END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
-	mtspr	SPRN_PID,r10
 
 	/*
-	 * Switch to host MMU mode
+	 * Switch to host MMU mode (don't have the real host PID but we aren't
+	 * going back to userspace).
 	 */
+	hwsync
+	isync
+
+	mtspr	SPRN_PID,r10
+
 	ld	r10, HSTATE_KVM_VCPU(r13)
 	ld	r10, VCPU_KVM(r10)
 	lwz	r10, KVM_HOST_LPID(r10)
@@ -389,6 +394,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 	ld	r10, KVM_HOST_LPCR(r10)
 	mtspr	SPRN_LPCR,r10
 
+	isync
+
 	/*
 	 * Set GUEST_MODE_NONE so the handler won't branch to KVM, and clear
 	 * MSR_RI in r12 ([H]SRR1) so the handler won't try to return.
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 16359525a40f..8cebe5542256 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -57,6 +57,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 
 	preempt_disable();
 
+	asm volatile("hwsync" ::: "memory");
+	isync();
 	/* switch the lpid first to avoid running host with unallocated pid */
 	old_lpid = mfspr(SPRN_LPID);
 	if (old_lpid != lpid)
@@ -75,6 +77,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 		ret = __copy_to_user_inatomic((void __user *)to, from, n);
 	pagefault_enable();
 
+	asm volatile("hwsync" ::: "memory");
+	isync();
 	/* switch the pid first to avoid running host with unallocated pid */
 	if (quadrant == 1 && pid != old_pid)
 		mtspr(SPRN_PID, old_pid);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 093ac0453d91..323b692bbfe2 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -531,17 +531,19 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
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
@@ -551,25 +553,41 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 
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

