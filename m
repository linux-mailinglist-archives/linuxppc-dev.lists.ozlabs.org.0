Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B0C3D5221
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:04:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5sF38pZz3gVQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:04:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pckFsxcy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pckFsxcy; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5b157prz3cnM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:57 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso17853724pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7tAT3HvikoAXKDhRxpUtJx0vEQZUJEB9w4l+mRfsano=;
 b=pckFsxcyvVWskwDhpjF09B6N0xznPbT+bhpxLFexQIFt/JPw0PlfD2Ztiggi7DdIPz
 a8ca7OKQuAyP0S/QjHHdcwv5+O7Pgphz2GiIwZ31+vxa3FwLPTG3mq6e7nrOvYqUPAyB
 IU+VX3dDNwM0bZ6SkJmAypOS1HvrIalSpn0m3/7r3mPoEo3K1Ru2fy8MfSv8y8OvP1B8
 S55Z5SEerfEFDhN7Hs3Xu+l5g2J0FX6r4oKWo8YUYr5m2QSDg4tNcw7H/9xnABrbsL/k
 Z5x7PCHgU/0mmXg2SfD4RmNsFeQXRTHsvo4fg1xYwAUn/y8D/sVQhFVYuzDuPSDunOdk
 NvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7tAT3HvikoAXKDhRxpUtJx0vEQZUJEB9w4l+mRfsano=;
 b=uc2amc+ZxJf51Brgtz5HH2DeKuMeKaTWLh1e6arqjWj7B2g3OKgnIPQ74YCqDVvap/
 FBNvQAjzaEB6/dpFRciO26IjWR52T7O0RqvOt4Vj9Ccr9JjOPqTdTTc/zL+n70VyGsnD
 rvAloFfohdytYnuw/vUZnMnuAB10Ya197wek0Qp0zEAvQm119OjWhB3M4ysH3NUHjWXH
 jSLsP9wg2pRbjbhYGPbOIjLdJ+2fhxOBxecIHL2m57mUVfrwDWbFvGoVZW60ByPKWBbv
 i54TZdj55JcVNjkTjmh42qad1MaTRGc+ldggze+AmdffZ5aYgUuwGAlp9HmLFm4Wni4P
 n6Gw==
X-Gm-Message-State: AOAM533poD5IxC0JzsUfe6LZKVd25Wp9L1VLCaUiPQjB0RBbfuuU48Ze
 KclVfNbuPAH+dmM15c2Teew=
X-Google-Smtp-Source: ABdhPJy/lqE+wtpGnXPzD4SZ39YUCx/UMRezY6naKzzpLBBBh9dr1yv2Xn6pcPDAns81LmS8IxIkNw==
X-Received: by 2002:a63:ed47:: with SMTP id m7mr16430085pgk.194.1627271515220; 
 Sun, 25 Jul 2021 20:51:55 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 30/55] KVM: PPC: Book3S HV P9: Only execute mtSPR if the
 value changed
Date: Mon, 26 Jul 2021 13:50:11 +1000
Message-Id: <20210726035036.739609-31-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Keep better track of the current SPR value in places where
they are to be loaded with a new context, to reduce expensive
mtSPR operations.

-73 cycles (7354) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 64 ++++++++++++++++++++++--------------
 1 file changed, 39 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0d97138e6fa4..56429b53f4dc 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4009,19 +4009,28 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
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
@@ -4036,28 +4045,31 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 
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
@@ -4066,18 +4078,20 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
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
@@ -4169,7 +4183,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
-- 
2.23.0

