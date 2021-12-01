Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B514B464676
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 06:22:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3nWp34K9z3cDY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 16:21:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jrO5r5PP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jrO5r5PP; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3nW84JXNz2yg4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 16:21:22 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id s37so12682885pga.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 21:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wZTag35Tahvq2Vi5v+jAD38uLJ/IZZzlBXgZDpWi9SA=;
 b=jrO5r5PPq+rwDsEQ3LBbLZsxuHFhZX2zRJDKrHiSwVoRMOV9jqUxdEjdW9ZWWXl+IN
 GEYYf3QySgkDLFfTCwm+/vzLySC8xBj1ywhhw5Esc5BLA8GwRitmg6DA+buF4Wg2qdN/
 61IQD1JKLViJaV00oycZFbPINS/BDkaU0DdXxcRCInSaVZUxXM7gVsXGgLoNrDV55EIb
 cQpxUDwBDev5uTi9d6QsC07hOCLLk/qQ5Np/db5cHoMJCoLzKU1YaN2Ty/KPEgub/Sia
 AvZLErCCUcuLOILF2XzwB6vdkRWb+NUFl91vtodhRjPU1gKIYrFcYCOy2S0jlhoAazRD
 OSPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wZTag35Tahvq2Vi5v+jAD38uLJ/IZZzlBXgZDpWi9SA=;
 b=Bpyg9nZ0eMrYqv9m1KlC/X8vUJFrU37aFISAN9rN1FqJaqT8b4bOqIbCkk1fn61Y8r
 bgeiXp8h8E9i0VixM3BaObEnQVDhzfFQc3oMNuG4BVRNSL/Mc+reL/zo/gv1vRDL5IO9
 6AgjftGfRYxo02D5tXRwXA9UozRGjsOlEQeFq5//bfEqgNvEDPjYhYbXmTNKbxtUNzcj
 J3i0pGYsaRc8XuxIy3Y+NqqO8hYUMmKLJOwb74YoXcXmD/grpc632acYYt0sionq8/Bq
 SFqHod8p/gf0bymgtr/4tVNOJtrRrDrDjBg6+3RVVnCThXGFWjE+AamJOgQ/OxRYYuMO
 LbPA==
X-Gm-Message-State: AOAM531Zv7CJCJ862rcb2SuQO+gNU7M/q1GQ8jlYWsz/MuF2nSdpSRhr
 mjEnS17hKorKsPodKSpttRcwlKEu2Q4=
X-Google-Smtp-Source: ABdhPJxZWazmUhrXM+qe4x3x+7SsGZnyxlTKLTvHLbeGX/zjR5mJLQoZSCJKvnLCUwuOAzsC4SsvtA==
X-Received: by 2002:a63:d354:: with SMTP id u20mr3062372pgi.366.1638336079474; 
 Tue, 30 Nov 2021 21:21:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id i193sm22412953pfe.87.2021.11.30.21.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 21:21:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Book3S HV P9: Remove unused ri_set local variable
Date: Wed,  1 Dec 2021 15:21:12 +1000
Message-Id: <20211201052112.2137167-1-npiggin@gmail.com>
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

ri_set is set and never used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This patch is against powerpc next. It's causing warnings with new
gcc now.

Thanks,
Nick

 arch/powerpc/kvm/book3s_hv_p9_entry.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index ebb4781859e2..a28e5b3daabd 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -768,7 +768,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	s64 hdec, dec;
 	u64 purr, spurr;
 	u64 *exsave;
-	bool ri_set;
 	int trap;
 	unsigned long msr;
 	unsigned long host_hfscr;
@@ -968,18 +967,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	/* 0x2 bit for HSRR is only used by PR and P7/8 HV paths, clear it */
 	trap = local_paca->kvm_hstate.scratch0 & ~0x2;
 
-	/* HSRR interrupts leave MSR[RI] unchanged, SRR interrupts clear it. */
-	ri_set = false;
-	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK)) {
-		if (trap != BOOK3S_INTERRUPT_SYSCALL &&
-				(vcpu->arch.shregs.msr & MSR_RI))
-			ri_set = true;
+	if (likely(trap > BOOK3S_INTERRUPT_MACHINE_CHECK))
 		exsave = local_paca->exgen;
-	} else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET) {
+	else if (trap == BOOK3S_INTERRUPT_SYSTEM_RESET)
 		exsave = local_paca->exnmi;
-	} else { /* trap == 0x200 */
+	else /* trap == 0x200 */
 		exsave = local_paca->exmc;
-	}
 
 	vcpu->arch.regs.gpr[1] = local_paca->kvm_hstate.scratch1;
 	vcpu->arch.regs.gpr[3] = local_paca->kvm_hstate.scratch2;
-- 
2.23.0

