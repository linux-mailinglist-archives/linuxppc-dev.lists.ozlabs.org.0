Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA94F3D5224
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5tC571Cz3dsb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:05:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O6Rb7Rmt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O6Rb7Rmt; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5b60rkPz3bcW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:02 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so12489662pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YoEeMmSqnvFKWKfBwYyk8RCXQVi3ja3orrar8JiO4tk=;
 b=O6Rb7Rmt6QCh6w+Klwzr9LN7o5OZd3TtSkNXnW95T7qkdMdW6Ny2eOcF+g1iEWzILD
 EdorcqXgUXUTkU4Z2eeju2pE6H5dEIHosih3PpWVofy3X/vBcIiNnVHg3W7cqXOZHxEi
 XgWTlO+ChfhYwKT4M04Wjpt3xR3fxAZmaBqMyzTfp4KLJqv8lOGUCKAs67ngQptsl6QD
 TXpAdFUEQLbTgzALNLgeBjw9fXlzVES0bmM08X6h4kLclEucyivaH35zJwYKFVbMmbOR
 bZGHGDCzn5KDskbyM+qpMxBfIZOfTRzFGZ0poZdEIFulGY47CvLQZ44KogrspdfP2sZ9
 9bQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YoEeMmSqnvFKWKfBwYyk8RCXQVi3ja3orrar8JiO4tk=;
 b=q0c95mhMpItSwSTsh31p5XKyUqTPI59hfzqUclpL3S8eXUTf5LIK4SLzBOW/YQbhXQ
 lduEPg8uxJOJ1wBSxIb+Pp8PuYWo3uj3iJ8/yQghp+6KtzMWI8tjxwR0IE6mLQZu4g5k
 dNnFI8M3UH5jbdpuTD0QNn+UhzKCGE13bwdkXY4rmOpvALGfN7eigBVIx9X9iB6Ea83M
 XcvzgM+PQDGPETX1e5WjGfH+Z8BEOXQDuGkbVLl3LyxaJcRTFZUlpRTfTPJySI3JLIpY
 MkvxW2z26G0sKF4MQLMSbuaEz0NeqJmyI8QxWg/+fv2QnYQIE7PQi8MLQnh3u5uw1hEb
 5IAQ==
X-Gm-Message-State: AOAM532tGd0MluOW2zi/Zjp8DJcwjot/Dsh+Hg2pN2S9+xsNnJ+01lZd
 0q3lbPNfl346H4sDOPTipFA=
X-Google-Smtp-Source: ABdhPJzr0hLlHf/k25iTZeVNCkWOSf/iquwxNFX4+rD1Ug8qEvheoO7fpDgRunhFC/hjz4E6grSyqw==
X-Received: by 2002:a65:61ab:: with SMTP id i11mr16393083pgv.168.1627271519612; 
 Sun, 25 Jul 2021 20:51:59 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 32/55] KVM: PPC: Book3S HV P9: Move vcpu register
 save/restore into functions
Date: Mon, 26 Jul 2021 13:50:13 +1000
Message-Id: <20210726035036.739609-33-npiggin@gmail.com>
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

This should be no functional difference but makes the caller easier
to read.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 65 +++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c2c72875fca9..45211458ac05 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4062,6 +4062,44 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
 }
 
+/* Returns true if current MSR and/or guest MSR may have changed */
+static bool load_vcpu_state(struct kvm_vcpu *vcpu,
+			   struct p9_host_os_sprs *host_os_sprs)
+{
+	bool ret = false;
+
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+		ret = true;
+	}
+
+	load_spr_state(vcpu, host_os_sprs);
+
+	load_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	load_vr_state(&vcpu->arch.vr);
+#endif
+	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+
+	return ret;
+}
+
+static void store_vcpu_state(struct kvm_vcpu *vcpu)
+{
+	store_spr_state(vcpu);
+
+	store_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	store_vr_state(&vcpu->arch.vr);
+#endif
+	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
+
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+}
+
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
 	if (!cpu_has_feature(CPU_FTR_ARCH_31))
@@ -4169,19 +4207,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
-		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
-		msr = mfmsr(); /* TM restore can update msr */
-	}
-
-	load_spr_state(vcpu, &host_os_sprs);
-
-	load_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	load_vr_state(&vcpu->arch.vr);
-#endif
-	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
+		msr = mfmsr(); /* MSR may have been updated */
 
 	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
@@ -4285,17 +4312,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	switch_pmu_to_host(vcpu, &host_os_sprs);
 
-	store_spr_state(vcpu);
-
-	store_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	store_vr_state(&vcpu->arch.vr);
-#endif
-	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
-
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+	store_vcpu_state(vcpu);
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-- 
2.23.0

