Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BB64213DF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:18:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQrK1mbNz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gFr9aUUe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gFr9aUUe; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQT97077z3c9T
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:05 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3077949pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8AxVO/grgzWXIBf5o+D+hI/Dho5dubgQSTSKv2Waw1o=;
 b=gFr9aUUeYrVK4tRDw1ipvrotNBm+76TE4YJj7slaVaSut8Rf6KuoLLzDBTP8BRAcwx
 N/w3WAXg/Q0fRwbrEvIENOX3uSxu2UNrANDfwdFS4PB/WDf+ZsjNIz3mCh/xmOWDZImk
 383Bhr4EHQ/v+nF0bt/A5NRoZwlk3fTOQjAun+/D2F01+2arwI4bp3TPaXgDAbKyL0uZ
 xgDXbXrM7WyLmIM+HF4VHPgcOxKE+0FyBC+smgpIHCfd8ocirVFNlylv3WvB/r2qWvRV
 2aOA06fRzczSAceNW7v9BQW5057FSoc49b6u1jk5px3UmCEgdhnI2CW/YSSavJvO8xfN
 6eJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8AxVO/grgzWXIBf5o+D+hI/Dho5dubgQSTSKv2Waw1o=;
 b=jdy9+fer6W1Gx9T8NDPszp12CaaOsnKF0JdFuoVxlppjvVRwEWMgddZmjUme1vXSm8
 AJYM7lsiuX1gcKRSumE4NPMCXBbc2Xr8qOwIWZ7oG9evnB5PkS+dajOfbfKiNTWusvhy
 BkDUcQ3l9ayS8DLFASvyz6niflpvQn4O37kEtlvE6CZ/eI4oAiF8TfXRvkWwp4UVRLuE
 R5yd3zP9ie6qelzn5lZG9cMysrzo/A1D/7tBZklTxIjOPx8zfzKhv1bRETgo0zVTsxv4
 pll/4wBuXVxLlKi9dHN9vCRSBK83THtykTxBBPlVESB37D5N+LR+waK5JV0qBKrHKrUU
 TYPA==
X-Gm-Message-State: AOAM533MSv7Md0V3stkoF5LwYYIZL7/0PBK/pKAE9Sdr9zFonqdB8OXM
 AiO5F7gvyROdaEkWhdhIeeB6UkGjJa4=
X-Google-Smtp-Source: ABdhPJyGBm0Nvq7K+JRWjMHxSMiuVauRE5/0AInNGV/sjMf31pMTCo1eNr3DbMUPq9wxiF6uNbjvOg==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr5377951pjb.76.1633363323713; 
 Mon, 04 Oct 2021 09:02:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 26/52] KVM: PPC: Book3S HV P9: Only execute mtSPR if the
 value changed
Date: Tue,  5 Oct 2021 02:00:23 +1000
Message-Id: <20211004160049.1338837-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
index 823d64047d01..460290cc79af 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4042,20 +4042,28 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
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
@@ -4070,20 +4078,21 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 
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
@@ -4094,6 +4103,7 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
 	host_os_sprs->fscr = mfspr(SPRN_FSCR);
+	host_os_sprs->dscr = mfspr(SPRN_DSCR);
 }
 
 /* vcpu guest regs must already be saved */
@@ -4102,19 +4112,20 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
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
@@ -4206,7 +4217,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
-- 
2.23.0

