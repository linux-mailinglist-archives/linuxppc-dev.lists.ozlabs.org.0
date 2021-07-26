Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B2F3D51ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:56:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5h63tCnz3f1Z
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:56:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XJpB6Q5O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XJpB6Q5O; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5ZD3cGwz3bT0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:16 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id c16so4438936plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nHXorjUusC91+jyzJOv3GiElWAcAvxrDfngAVt6HQtc=;
 b=XJpB6Q5OVySTQUMREJ36E7xsrRDoAhmruwwzWwAmOkgS62otiHnGIeNEqF5jvtcteA
 lkMqHfOflQoYtWHUxMcxEH1ehmbiqfDJrpZbkqo34eFlre+hi3qHGZya1riGmLphf3zW
 Wl1/CKIFX9rUj+rhQJC4eTaLnuI66TPWTgXr1J/HIJHZFbAPZrmrDbdpP3P1TVqGxJ04
 CezxFJSNq/SdHEI0owOXHJHbfnrzEurtDXN+mLfEViAFNa5cDvvPemf4tL9gHvoOhhOJ
 FMWhbkFtbOkbEqckP4nUnarVJQpErOeKDPPISkrPVhNbQc6Ub/ezfBIaQbezJvXlPvBG
 2y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nHXorjUusC91+jyzJOv3GiElWAcAvxrDfngAVt6HQtc=;
 b=tgjSaCCdceR5WAD3ncsXT9r7e6atjKYA7KGEWuzdmQyLlEz94hh/PAmd6srqUR3tX1
 4J3d6gx8EeA6/HBYfTX1T7G33mhHlwpAePKa1It9oDeDYwNuptm+ddCgnsqX2/SlEE44
 bXQ+UWTNFylKyYhQ0l5ZABrCfuEZdSxsHjz+QtF0OQY6xnBeU6VHmit7Qohlbo396fug
 efSlPqOoBuV3RDkoQYTKcoQijIF5nzf2LZYNedEgTogJA5U1uR9lljJATrS6b+2z0XQX
 DCqtSf79olzNrq0flwKcBT8DtcY3wpNqP5TvF42gcNIPbX4J+mhAzipuhf9DWkAVELtC
 hadA==
X-Gm-Message-State: AOAM532Rl/Gt7w3lHvl70sDomBxXXgoSa9XeLaPEVKxwLqipvG80i3aS
 soqFNOexVcjzGfkjyO0L+AqTvQm7caA=
X-Google-Smtp-Source: ABdhPJwGI8F7bs93/D8S+wnBK4/3Kk44t+pq4eUUgGYplkQR8R/Ji5RnzvPuewdwOYF/YWdvm83CNw==
X-Received: by 2002:a17:90a:3048:: with SMTP id
 q8mr3507857pjl.120.1627271473907; 
 Sun, 25 Jul 2021 20:51:13 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 12/55] KVM: PPC: Book3S HV: POWER10 enable HAIL when
 running radix guests
Date: Mon, 26 Jul 2021 13:49:53 +1000
Message-Id: <20210726035036.739609-13-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

HV interrupts may be taken with the MMU enabled when radix guests are
running. Enable LPCR[HAIL] on ISA v3.1 processors for radix guests.
Make this depend on the host LPCR[HAIL] being enabled. Currently that is
always enabled, but having this test means any issue that might require
LPCR[HAIL] to be disabled in the host will not have to be duplicated in
KVM.

-1380 cycles on P10 NULL hcall entry+exit

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0cef578930f9..e7f8cc04944b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5004,6 +5004,8 @@ static int kvmppc_hv_setup_htab_rma(struct kvm_vcpu *vcpu)
  */
 int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
+
 	if (nesting_enabled(kvm))
 		kvmhv_release_all_nested(kvm);
 	kvmppc_rmap_reset(kvm);
@@ -5013,8 +5015,13 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
 	kvm->arch.radix = 0;
 	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_radix(kvm);
-	kvmppc_update_lpcr(kvm, LPCR_VPM1,
-			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
+
+	lpcr = LPCR_VPM1;
+	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		lpcr_mask |= LPCR_HAIL;
+	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
+
 	return 0;
 }
 
@@ -5024,6 +5031,7 @@ int kvmppc_switch_mmu_to_hpt(struct kvm *kvm)
  */
 int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 {
+	unsigned long lpcr, lpcr_mask;
 	int err;
 
 	err = kvmppc_init_vm_radix(kvm);
@@ -5035,8 +5043,17 @@ int kvmppc_switch_mmu_to_radix(struct kvm *kvm)
 	kvm->arch.radix = 1;
 	spin_unlock(&kvm->mmu_lock);
 	kvmppc_free_hpt(&kvm->arch.hpt);
-	kvmppc_update_lpcr(kvm, LPCR_UPRT | LPCR_GTSE | LPCR_HR,
-			   LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR);
+
+	lpcr = LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	lpcr_mask = LPCR_VPM1 | LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		lpcr_mask |= LPCR_HAIL;
+		if (cpu_has_feature(CPU_FTR_HVMODE) &&
+				(kvm->arch.host_lpcr & LPCR_HAIL))
+			lpcr |= LPCR_HAIL;
+	}
+	kvmppc_update_lpcr(kvm, lpcr, lpcr_mask);
+
 	return 0;
 }
 
@@ -5200,6 +5217,10 @@ static int kvmppc_core_init_vm_hv(struct kvm *kvm)
 		kvm->arch.mmu_ready = 1;
 		lpcr &= ~LPCR_VPM1;
 		lpcr |= LPCR_UPRT | LPCR_GTSE | LPCR_HR;
+		if (cpu_has_feature(CPU_FTR_HVMODE) &&
+		    cpu_has_feature(CPU_FTR_ARCH_31) &&
+		    (kvm->arch.host_lpcr & LPCR_HAIL))
+			lpcr |= LPCR_HAIL;
 		ret = kvmppc_init_vm_radix(kvm);
 		if (ret) {
 			kvmppc_free_lpid(kvm->arch.lpid);
-- 
2.23.0

