Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B08459FCA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:09:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Hk0bXqz3f3y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EjqS1xK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EjqS1xK/; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzx24Rx5z3cJm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:42 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso1707347pji.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VgmqdPGVcxwDSCZd/nV6S8pjxuyGC4mv4VWZJ4VWdPY=;
 b=EjqS1xK/6nT3oAMWl6Yju40CwtlhrWpauL7k8VolM42rnjSFJ/WDuLUCqGhXNqs4ut
 qGHtqZMpTTkt4TImkIFU7AvhIW3dSLIeXGyRF9h/J/B5MJ27CAMw1dtJeSWi8wu5hNFB
 H+6rneMRBYeZPG7C3iG03aTu5Q9ttMql9EGOePrWTOgMmxSg2dSrrLUL9TzekdNbTNUv
 AOp8vUlsBF1tKnV0ySYKXDmoE4xMbnNssbpVZk8EHmz2nNJFmyWT0Aj13ln20lPRT7v4
 9o3uuF41iVmC5kqqC8Lf3TitRdG6F0WNs9REBLkSwxss3x9IHjgS0tWAJ2n5HQ7Q9ebh
 +VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VgmqdPGVcxwDSCZd/nV6S8pjxuyGC4mv4VWZJ4VWdPY=;
 b=woQah18/pd9foUXJGXxYwh4ZmxUlEHNC+f+Jb+ZgcYagMmzmPothx/gAjcJ5rmoGPE
 j6UM9XrGRdI73ljB5cW1CDEKsHDBkPim2k91gLphNz9T+dg4VYeDOvk6AEo0Nn6jvk7j
 UQN6yq0VvDMKmCVC+3Z+IhpkoaOtCV+CLdSYxjb4t4d8bSpafBzE836Ep1XJ10FoZ2uz
 b849xaFLHBxVwohQBAsbB0wfw1P2+sbvD6LhPmuF8gJuD+5S6/uyYd3xQvBVEaz3I60i
 eRmgTLJDE/1VIt1cZ+f6OKk2HSbdDmCXZh5k3M0a6u783/u8XYl+nkdualFAtO0r6lTb
 UIQA==
X-Gm-Message-State: AOAM533gVC+1Tb8vMUNO882YTnqz0BVAl2g1b6NC7bK+lUttfPw/yhUk
 NW9HzcGAqimUqcUEiQDWvVoprOpdz2i7lA==
X-Google-Smtp-Source: ABdhPJyXglcvbUSMiaWJ61PpBLdKmblLF2rurTJ/c0k4p18Zv99M7cRTXVdvUtBls4g7nlTz6tZRSA==
X-Received: by 2002:a17:902:bc8b:b0:143:caf5:4a0e with SMTP id
 bb11-20020a170902bc8b00b00143caf54a0emr5293590plb.38.1637661220428; 
 Tue, 23 Nov 2021 01:53:40 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 26/53] KVM: PPC: Book3S HV P9: Only execute mtSPR if the
 value changed
Date: Tue, 23 Nov 2021 19:52:04 +1000
Message-Id: <20211123095231.1036501-27-npiggin@gmail.com>
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

Keep better track of the current SPR value in places where
they are to be loaded with a new context, to reduce expensive
mtSPR operations.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 51 ++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 75a674b5cd84..5c44c4ff5d46 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4055,20 +4055,28 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
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
+
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
-	mtspr(SPRN_AMR, vcpu->arch.amr);
-	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
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
@@ -4083,20 +4091,21 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 
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
+
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		vcpu->arch.tid = mfspr(SPRN_TIDR);
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
@@ -4107,6 +4116,7 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
 	host_os_sprs->fscr = mfspr(SPRN_FSCR);
+	host_os_sprs->dscr = mfspr(SPRN_DSCR);
 }
 
 /* vcpu guest regs must already be saved */
@@ -4115,19 +4125,20 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 {
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	mtspr(SPRN_PSPB, 0);
-	mtspr(SPRN_UAMOR, 0);
-
-	mtspr(SPRN_DSCR, host_os_sprs->dscr);
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		mtspr(SPRN_TIDR, host_os_sprs->tidr);
-	mtspr(SPRN_IAMR, host_os_sprs->iamr);
-
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
@@ -4219,7 +4230,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
-- 
2.23.0

