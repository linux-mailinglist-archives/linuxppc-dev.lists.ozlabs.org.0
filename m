Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1783E95DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFWn1Gz0z3gGF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bNwhrFma;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bNwhrFma; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3S0wyxz3d8J
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:15 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id j1so4193838pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lgFzwfPPUELBCc+2phoJnC6npoZNQp0x3MsFLsf+uAE=;
 b=bNwhrFmakUBPDLkDNtpxinox1H38Xkd2WP8CUhuif7wxt6tgrasrSwSb9rdqVf05i9
 p78XevjWvfpKzhPrZ1DxDgO0VwVncAqFSIGCXsMBuYsbt9XHVOBuPZ4JBQwwg+Je3V4w
 bB6FMcaxFhegAW+VSgRtoj01huxnPAC4kwN5nfyvrJUorgiTSNgsIJKt2t6skwhGrNan
 BJNsDaGtj5HdIGiwd3AlI2CQtQzrzddPi1qweBJUxvuZr2jq3Pi7UJ8xrJu8v9YFcnWs
 xGc1lkwK9b9770SdjDDHAZvST+6JKLMAz5fliTm+FSU5IeEtckilY57O/9+4A2jstYkt
 n+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lgFzwfPPUELBCc+2phoJnC6npoZNQp0x3MsFLsf+uAE=;
 b=Xit3uokpR5dZ3aKqTQ8ND3ngPwHfQhnGDp5x4yin87lT9H2lowdJIkAetVx3ymu0sF
 mk9QFp9Ga6QN90wHzo1t9SdMQr/HzuzrO9EQiHEUP/z52I7hqr+h1DXQP8PcxKgSrgOA
 hs1B9pTmr8bgO+jvvCmGz7g0Q3mhnugVAG2iBi6jc9A58ITakeoI2kV9wcg2cjz1EppI
 Mj5dOjz6jWn+smuwJ6Myq7YRL7OsoXczVUyVSjtwiFXgRRed1gkND6dFcCT9DOy+Bp6w
 R7Fjlw5kZ5dn2GbMzf2A3WIMX32hYUfgtl/Np4PjUVPgCKWHv1BSaEyPEmK7TTYka8VA
 QBuQ==
X-Gm-Message-State: AOAM532GfzUkE0Tfu4k3EIZBOKt8OnaHc5YJyEyOxHSM9+85eaxEzrZ0
 zHO06l/jTeZtXxWlNV4uysk=
X-Google-Smtp-Source: ABdhPJx82QDgyDUc+fNWk0gzv6fLU3PtFqnsDlSQzERROUTDRVYYznRkp80XIBZyA7/DvhcQxHdwuw==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr4733685plr.7.1628697794080; 
 Wed, 11 Aug 2021 09:03:14 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 34/60] KVM: PPC: Book3S HV P9: Only execute mtSPR if the
 value changed
Date: Thu, 12 Aug 2021 02:01:08 +1000
Message-Id: <20210811160134.904987-35-npiggin@gmail.com>
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

Keep better track of the current SPR value in places where
they are to be loaded with a new context, to reduce expensive
mtSPR operations.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 64 ++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 823e501c5ebe..85f441d9ce63 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4045,19 +4045,28 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
 	}
 }
 
-static void load_spr_state(struct kvm_vcpu *vcpu)
+static void load_spr_state(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
 {
-	mtspr(SPRN_DSCR, vcpu->arch.dscr);
-	mtspr(SPRN_IAMR, vcpu->arch.iamr);
-	mtspr(SPRN_PSPB, vcpu->arch.pspb);
-	mtspr(SPRN_FSCR, vcpu->arch.fscr);
 	mtspr(SPRN_TAR, vcpu->arch.tar);
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_TIDR, vcpu->arch.tid);
-	mtspr(SPRN_AMR, vcpu->arch.amr);
-	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_TIDR, vcpu->arch.tid);
+	if (host_os_sprs->iamr != vcpu->arch.iamr)
+		mtspr(SPRN_IAMR, vcpu->arch.iamr);
+	if (host_os_sprs->amr != vcpu->arch.amr)
+		mtspr(SPRN_AMR, vcpu->arch.amr);
+	if (vcpu->arch.uamor != 0)
+		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
+	if (host_os_sprs->fscr != vcpu->arch.fscr)
+		mtspr(SPRN_FSCR, vcpu->arch.fscr);
+	if (host_os_sprs->dscr != vcpu->arch.dscr)
+		mtspr(SPRN_DSCR, vcpu->arch.dscr);
+	if (vcpu->arch.pspb != 0)
+		mtspr(SPRN_PSPB, vcpu->arch.pspb);
 
 	/*
 	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
@@ -4072,28 +4081,31 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 
 static void store_spr_state(struct kvm_vcpu *vcpu)
 {
-	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
-
-	vcpu->arch.iamr = mfspr(SPRN_IAMR);
-	vcpu->arch.pspb = mfspr(SPRN_PSPB);
-	vcpu->arch.fscr = mfspr(SPRN_FSCR);
 	vcpu->arch.tar = mfspr(SPRN_TAR);
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.tid = mfspr(SPRN_TIDR);
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		vcpu->arch.tid = mfspr(SPRN_TIDR);
+	vcpu->arch.iamr = mfspr(SPRN_IAMR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
+	vcpu->arch.fscr = mfspr(SPRN_FSCR);
 	vcpu->arch.dscr = mfspr(SPRN_DSCR);
+	vcpu->arch.pspb = mfspr(SPRN_PSPB);
+
+	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
 }
 
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
-	host_os_sprs->dscr = mfspr(SPRN_DSCR);
-	host_os_sprs->tidr = mfspr(SPRN_TIDR);
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		host_os_sprs->tidr = mfspr(SPRN_TIDR);
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
 	host_os_sprs->fscr = mfspr(SPRN_FSCR);
+	host_os_sprs->dscr = mfspr(SPRN_DSCR);
 }
 
 /* vcpu guest regs must already be saved */
@@ -4102,18 +4114,20 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 {
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	mtspr(SPRN_PSPB, 0);
-	mtspr(SPRN_UAMOR, 0);
-
-	mtspr(SPRN_DSCR, host_os_sprs->dscr);
-	mtspr(SPRN_TIDR, host_os_sprs->tidr);
-	mtspr(SPRN_IAMR, host_os_sprs->iamr);
-
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (host_os_sprs->iamr != vcpu->arch.iamr)
+		mtspr(SPRN_IAMR, host_os_sprs->iamr);
+	if (vcpu->arch.uamor != 0)
+		mtspr(SPRN_UAMOR, 0);
 	if (host_os_sprs->amr != vcpu->arch.amr)
 		mtspr(SPRN_AMR, host_os_sprs->amr);
-
 	if (host_os_sprs->fscr != vcpu->arch.fscr)
 		mtspr(SPRN_FSCR, host_os_sprs->fscr);
+	if (host_os_sprs->dscr != vcpu->arch.dscr)
+		mtspr(SPRN_DSCR, host_os_sprs->dscr);
+	if (vcpu->arch.pspb != 0)
+		mtspr(SPRN_PSPB, 0);
 
 	/* Save guest CTRL register, set runlatch to 1 */
 	if (!(vcpu->arch.ctrl & 1))
@@ -4205,7 +4219,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
-- 
2.23.0

