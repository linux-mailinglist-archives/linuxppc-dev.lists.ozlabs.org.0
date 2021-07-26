Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A1C3D5233
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:08:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5yB20ZTz3dFk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:08:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hHFz8NRy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hHFz8NRy; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5bR694tz3d9W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:19 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 p5-20020a17090a8685b029015d1a9a6f1aso11973235pjn.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1/EeEmpkENbYKzjTPkVIqeul9e2Dav0nMW6DA1lL2A8=;
 b=hHFz8NRyDXUDvGn4D0+zMSOjsQnKYUxL7wMs8t5FwC24qWwgMoJjDbNqjOWSMAyobH
 dfQgLAxBPWqLtTOciszdMRBzjDndhoNZP4DUxriVnPVLMdCle0VesG8VhHQ9aRFqhq+M
 4ovAJm8VM90NigxCwN+ggFUnkW5mdNkSGtDd+n9OBZ+W1KH1p5m8q1K6w9lUWcBagaPD
 3KC5+XvlmBmTXlsV4EFeuzvC6nS4j7Yp/bPaWcj5frLvFhki5r95RNV3NxlOBxkyQcPe
 RUI+zPlMUAYYjjD82UM9zN9nxzEIFQaOpASZprpWBHfv3fnXpKc7rxwP60Kb2cY6o3OX
 448A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1/EeEmpkENbYKzjTPkVIqeul9e2Dav0nMW6DA1lL2A8=;
 b=dhG+NfPrbh5NG1Nkf7SXP/YD95PNaAToEh7s8CH4mQKAuWn6dszhPtNzpqR6iLOMzv
 Bp/CpI6LLjBHMxz9oNt7dC/vcrqyZuopAyiYPCjKvWrOZRdh7rVzg2Fj0PYWO2IVwldp
 VoIlTfcCmWMaCnW65SraXRBTnCzWiBebAjM/ZiOSrUg1Vyj/WAt8wCCE0zBy4lXiGpMc
 5wCb8cZ9zYgifJezb8U1/rFj2HHcbvInCbcil3t/Rd3Aht9YKOb7qHhQRnvPfl5nzHkh
 M+Oo6qSb4ARXqcoSBce9Y5ghtxvNmHaCfP04EQVo2NhvLBF3CTuSmK49isGpDiWtYVC5
 CjcA==
X-Gm-Message-State: AOAM533V4PQxZVdI7Cnz24M/PD9jsH7kz4T1+ZLEMGNA6ioJ2u4SGx6e
 DJ+9f2NhvraOi78Kb4h3QQ4=
X-Google-Smtp-Source: ABdhPJzPAa3Mr9lYPTKBxMrg3VVIeodf6rRE6BYENfYH0dIjf8/Zl93BHlns1HIHPh/+48B+tXCK6w==
X-Received: by 2002:a17:902:ed95:b029:ee:aa46:547a with SMTP id
 e21-20020a170902ed95b02900eeaa46547amr12818233plj.27.1627271537659; 
 Sun, 25 Jul 2021 20:52:17 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 40/55] KVM: PPC: Book3S HV P9: Demand fault EBB facility
 registers
Date: Mon, 26 Jul 2021 13:50:21 +1000
Message-Id: <20210726035036.739609-41-npiggin@gmail.com>
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
index f105eaeb4521..1c00c4a565f5 100644
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
index 47ccea5ffba2..dd8199a423cf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1441,6 +1441,16 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
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
@@ -1735,6 +1745,8 @@ XXX benchmark guest exits
 				r = kvmppc_emulate_doorbell_instr(vcpu);
 			if (cause == FSCR_PM_LG)
 				r = kvmppc_pmu_unavailable(vcpu);
+			if (cause == FSCR_EBB_LG)
+				r = kvmppc_ebb_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -2751,9 +2763,9 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
 	/*
-	 * PM is demand-faulted so start with it clear.
+	 * PM, EBB is demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~HFSCR_PM;
+	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB);
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index c4e93167d120..f68a3d107d04 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -224,9 +224,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
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
@@ -257,9 +260,22 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
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

