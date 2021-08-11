Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA743E95F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:31:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFgg4yjHz3clP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:31:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=k9M8CEXV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=k9M8CEXV; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3x6n3kz3cPs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:41 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id k2so3254269plk.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4peZ7/9NqhdhDvJa88d1a0X0g8yLvSMD33i1O4uYlI=;
 b=k9M8CEXVjvWHu0DE/E0QB0u4h01DgQxCKpV1p2YRCjnqeag49iTE7+FgDMqZsRkd6z
 jWXvPFYUZ8GXlbs0T89Uo0078PQ2g/Oc2OBCJgdoft0G3Zw8Yk8J3PGx/jzyNAZSl2VB
 zdjFTG/S4wKKrt3Ri087WWIVYvwH0tEgcg6G/xZTUuxU97M1hTRuc3oeWji7k+DMIBOZ
 e7qsFVIswnxg49CT4SQMRtQGllSQf7Z1Y6nKSZXL0zzA87sWO9oOmOeNbV3wJIVy8Mmm
 cdpLNId9D1DETNVQMLHEYmJdEDmAtsrjtoLSkLMWypGC1qTxywLQojxjEEpIuHVboRk1
 gepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4peZ7/9NqhdhDvJa88d1a0X0g8yLvSMD33i1O4uYlI=;
 b=rQyI5McClSLxJvntSySE3/Hft5yR1kdPfKyLbvViM8yjx8sW67mOyrUysNm6cRRx/m
 QGrpg8FGcdl+bIZcDm+QoIFe055hHTFbgYmQOAmlab3KQEu7Cui9mMiMhVWAWyPEY/aT
 IagouTIrmyNN8oqNAoQMn3itYp1UmU9ywBHrQwi1TnhJbq1TOsGajWS7vp9n6+Baoub+
 p3cF6eXMSqMFEe6nqnxPKDWjp3VnqhDmZh66r01jXwjTGfvPlOosGsEubTpxx3ZcbgSn
 e6ubSYBhzRjQfUNuNSY5Ooe8Iq+2QUOuRSzfWJlxxvKv6rLf9LuglNc83o8QzXs4c2jV
 fDGQ==
X-Gm-Message-State: AOAM532STfmJMmyMIMhI4hHsuqBheFqLiyTAayp/dS6jm5i8Z/e0a4vM
 Ga6SafaAdZlIFjSNbgmpklw=
X-Google-Smtp-Source: ABdhPJwGd7DcT7bLEm9+SW01iU1xMncA5hk/K88E2VOjYZTCn6xdb84NBH6xauXm6iTegM0sIpBUFA==
X-Received: by 2002:a17:90a:8b07:: with SMTP id
 y7mr11429568pjn.30.1628697820126; 
 Wed, 11 Aug 2021 09:03:40 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 44/60] KVM: PPC: Book3S HV P9: Demand fault EBB facility
 registers
Date: Thu, 12 Aug 2021 02:01:18 +1000
Message-Id: <20210811160134.904987-45-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use HFSCR facility disabling to implement demand faulting for EBB, with
a hysteresis counter similar to the load_fp etc counters in context
switching that implement the equivalent demand faulting for userspace
facilities.

This speeds up guest entry/exit by avoiding the register save/restore
when a guest is not frequently using them. When a guest does use them
often, there will be some additional demand fault overhead, but these
are not commonly used facilities.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 16 +++++++++++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 28 +++++++++++++++++++++------
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 89216e247e8b..c8d8bd90bf14 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -580,6 +580,7 @@ struct kvm_vcpu_arch {
 	ulong cfar;
 	ulong ppr;
 	u32 pspb;
+	u8 load_ebb;
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8ca081a32d91..99d4fd84f0b2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1436,6 +1436,16 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
+{
+	if (!(vcpu->arch.hfscr_permitted & HFSCR_EBB))
+		return EMULATE_FAIL;
+
+	vcpu->arch.hfscr |= HFSCR_EBB;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1730,6 +1740,8 @@ XXX benchmark guest exits
 				r = kvmppc_emulate_doorbell_instr(vcpu);
 			if (cause == FSCR_PM_LG)
 				r = kvmppc_pmu_unavailable(vcpu);
+			if (cause == FSCR_EBB_LG)
+				r = kvmppc_ebb_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -2774,9 +2786,9 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
 	/*
-	 * PM is demand-faulted so start with it clear.
+	 * PM, EBB is demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~HFSCR_PM;
+	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB);
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 3a7e242887aa..d196642061aa 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -232,9 +232,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	}
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
@@ -265,9 +268,22 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 static void store_spr_state(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+		vcpu->arch.bescr = mfspr(SPRN_BESCR);
+		/*
+		 * This is like load_fp in context switching, turn off the
+		 * facility after it wraps the u8 to try avoiding saving
+		 * and restoring the registers each partition switch.
+		 */
+		if (!vcpu->arch.nested) {
+			vcpu->arch.load_ebb++;
+			if (!vcpu->arch.load_ebb)
+				vcpu->arch.hfscr &= ~HFSCR_EBB;
+		}
+	}
 
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
 		vcpu->arch.tid = mfspr(SPRN_TIDR);
-- 
2.23.0

