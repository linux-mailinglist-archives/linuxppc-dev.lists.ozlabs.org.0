Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B8449715A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 12:48:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhWb44j9Tz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 22:48:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FRyQSAi8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FRyQSAi8; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JhWZR2k8Hz2xrr
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 22:47:41 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id l17so6712156plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtGo6vLd1NkF075KCw/rFbSCwwA+cZyR4oaXzBBT0fo=;
 b=FRyQSAi8bptoyWQP7RfVGuKM9WzW9ye+hqYkpjwO5DCVA0FqYvuYSWbNRUEDf5dYxX
 36E/TpWJ0ZC29lPuLyyVAF7cCo8UbZbpPxhyam+ubydCQwP91XsiwI0OVy+ApyajjzIp
 nhb0qMIpagKVwUAFa+jhzVj5OT4CxrxvHOdJHOWWTSe2gHLgBLPNZZjD52Q7hQ7swJku
 qJx0GRa0c3KppBrzDDEyEKvDKFmLfUZ1PYCMzxVmf3ZLdRzfGcVqujI6JTB7dpMhBkpX
 1ewHL7wfDfl0x4Hwq3RoJ3p903QolkIWy6QLJHm6N20CRsJgy4fvEGKlIKDFq3gAS/Ko
 iZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gtGo6vLd1NkF075KCw/rFbSCwwA+cZyR4oaXzBBT0fo=;
 b=Yk/5Z2OOcPeCLFSIrdeconRn4gDD4HmEZzCzp+XafI9fyZstdoHVEs5qMC6Mi8te8s
 kCjN8UtY7XSHjRiYMgIiR+nPT+9R/dvVpW+UHk4FUdXSbVaBlBgNeCHI8dbfbaWRVnB0
 wH/PmV7RV1beJ6bHd1yqfwYv7eZJoFcT0g9pFJsPpdGalwDT+t7pN7h53RG4aZ5uqczP
 q76iX8xWLeizEDE5rYVlfcVgrnpgl5UmXhOMeE4uT5j7ED/svBUlMlw5YnNLFVceJqba
 p0H5S88Rn8FZA3FElPgJlwliHEVDqnhnnMTscxNvBXouYbCpkRJt+9FkUjWKo5vr+34p
 r77A==
X-Gm-Message-State: AOAM5327aeZLUYHKstPy3k2Vf3gqpMQp91nLy/qMgLrecTg3xuANLgTQ
 9tpS5zvEgFm9mhkeX3cO46xN64YQAzU=
X-Google-Smtp-Source: ABdhPJwPUc0ni5MsKFPyT6vdrRQPOgvfDv6ZtBTSqV7oh4lcL3uupM1mrtegq1sxMXgfoSpjaiw8Bg==
X-Received: by 2002:a17:90a:5a0e:: with SMTP id
 b14mr8663667pjd.148.1642938458157; 
 Sun, 23 Jan 2022 03:47:38 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id 14sm16569909pjh.45.2022.01.23.03.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 03:47:37 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV P9: Optimise loads around context switch
Date: Sun, 23 Jan 2022 21:47:25 +1000
Message-Id: <20220123114725.3549202-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

It is better to get all loads for the register values in flight
before starting to switch LPID, PID, and LPCR because those
mtSPRs are expensive and serialising.

This also just tidies up the code for a potential future change
to the context switching sequence.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a28e5b3daabd..9dba3e3f65a0 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -539,8 +539,10 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 {
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	u32 lpid;
+	u32 pid;
 
 	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
+	pid = vcpu->arch.pid;
 
 	/*
 	 * Prior memory accesses to host PID Q3 must be completed before we
@@ -551,7 +553,7 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	isync();
 	mtspr(SPRN_LPID, lpid);
 	mtspr(SPRN_LPCR, lpcr);
-	mtspr(SPRN_PID, vcpu->arch.pid);
+	mtspr(SPRN_PID, pid);
 	/*
 	 * isync not required here because we are HRFID'ing to guest before
 	 * any guest context access, which is context synchronising.
@@ -561,9 +563,11 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
 {
 	u32 lpid;
+	u32 pid;
 	int i;
 
 	lpid = kvm->arch.lpid;
+	pid = vcpu->arch.pid;
 
 	/*
 	 * See switch_mmu_to_guest_radix. ptesync should not be required here
@@ -574,7 +578,7 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 	isync();
 	mtspr(SPRN_LPID, lpid);
 	mtspr(SPRN_LPCR, lpcr);
-	mtspr(SPRN_PID, vcpu->arch.pid);
+	mtspr(SPRN_PID, pid);
 
 	for (i = 0; i < vcpu->arch.slb_max; i++)
 		mtslb(vcpu->arch.slb[i].orige, vcpu->arch.slb[i].origv);
@@ -585,6 +589,9 @@ static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64
 
 static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 {
+	u32 lpid = kvm->arch.host_lpid;
+	u64 lpcr = kvm->arch.host_lpcr;
+
 	/*
 	 * The guest has exited, so guest MMU context is no longer being
 	 * non-speculatively accessed, but a hwsync is needed before the
@@ -594,8 +601,8 @@ static void switch_mmu_to_host(struct kvm *kvm, u32 pid)
 	asm volatile("hwsync" ::: "memory");
 	isync();
 	mtspr(SPRN_PID, pid);
-	mtspr(SPRN_LPID, kvm->arch.host_lpid);
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
+	mtspr(SPRN_LPID, lpid);
+	mtspr(SPRN_LPCR, lpcr);
 	/*
 	 * isync is not required after the switch, because mtmsrd with L=0
 	 * is performed after this switch, which is context synchronising.
-- 
2.23.0

