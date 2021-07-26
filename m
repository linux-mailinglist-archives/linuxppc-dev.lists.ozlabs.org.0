Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2742C3D5231
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:07:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5xH0m1Zz3hNV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:07:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iII4mvQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iII4mvQZ; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5bM2dRkz3d8t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:52:15 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so17813559pjm.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSmVzL4c1YQEwgpeygYKTRCpdKgworBmM1lrd2e93zY=;
 b=iII4mvQZd7A61sKYSg5blG9nCxBOJkE7sLfMABwTu+6BvfEiPRQODXjf/zRpZZUqBy
 xJEwiYBOK6WeH4DEmYUuc95c0LnX3lvLzuy/7aXLaG1xWcZ2VCZxIgikJbjK8IvCQFos
 p2QdHepyt+z9gIkROglukNYu7WB5zmckhYpaB1Zc3p5+f1YdpFYzDG9Ykis1pc1H+2EK
 IVHqcGdgwMR7Hlqdre0sov8ELYbcpStB/PEvYzlSa8ym0+cslmpFkNWKmZpck686B0ia
 upCOoaAZEBD00wC2/r5hIYldjrJRFh9u3/mFpERSI1QqJvA8lcDVuquCEb5WML3S0fbP
 VEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSmVzL4c1YQEwgpeygYKTRCpdKgworBmM1lrd2e93zY=;
 b=Fc+9u6QKtq6tgPXGSDfZW4IL1PTcHkjCOCey+jtZpcqY9dHZAH3xdn8EV3NM1R4hqK
 GfxfpZyVae1bhHdHHEX9PeCt5rChkZ8VfHfxsh4/W4MkD3XEDV8iJ7V/xTPJRSqVngEd
 8lLWTh3Hpq88lCFTe8gv2VnXzz3VF0DebUfAt3mZiyPp//gKIRBPgCq0t5l8+pGbrrBH
 VEV+sRYVsWSIhrldtRHutHkJeL7SIVpF7V7XN1Aj1cfWlQrwqnaU+1O9mG5gBvx3KYNZ
 zT+Nftjo0+gjjTcPH8jbjW7lxyNlr9I2OcwNm3/ojxVPUICYCvJQtPu1PMxGcfqjaPNY
 ulqQ==
X-Gm-Message-State: AOAM531wVMfTPhmAu0/ymq/EfL6CRYZGFi8x4w72x2q483hm7/jGFigf
 Vbq0dV0c6a5q/RPgT/tlWxE=
X-Google-Smtp-Source: ABdhPJwqbi7Bm1VNXw0rR05N1QF7VUxQw7HRIu5SUrB3z0DuugVhc7yinaOnxi7co67WY/jHhzsJiw==
X-Received: by 2002:aa7:978c:0:b029:32a:403e:88cc with SMTP id
 o12-20020aa7978c0000b029032a403e88ccmr16006240pfp.7.1627271532915; 
 Sun, 25 Jul 2021 20:52:12 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:52:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 38/55] KVM: PPC: Book3S HV P9: Restrict DSISR canary
 workaround to processors that require it
Date: Mon, 26 Jul 2021 13:50:19 +1000
Message-Id: <20210726035036.739609-39-npiggin@gmail.com>
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

Use CPU_FTR_P9_RADIX_PREFETCH_BUG for this, to test for DD2.1 and below
processors.

-43 cycles (7178) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 3 ++-
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 6 ++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index e7dfc33e2b38..47ccea5ffba2 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1598,7 +1598,8 @@ XXX benchmark guest exits
 		unsigned long vsid;
 		long err;
 
-		if (vcpu->arch.fault_dsisr == HDSISR_CANARY) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG) &&
+		    unlikely(vcpu->arch.fault_dsisr == HDSISR_CANARY)) {
 			r = RESUME_GUEST; /* Just retry if it's the canary */
 			break;
 		}
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 737d4eaf74bc..d83b5d4d02c1 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -671,9 +671,11 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 * HDSI which should correctly update the HDSISR the second time HDSI
 	 * entry.
 	 *
-	 * Just do this on all p9 processors for now.
+	 * The "radix prefetch bug" test can be used to test for this bug, as
+	 * it also exists fo DD2.1 and below.
 	 */
-	mtspr(SPRN_HDSISR, HDSISR_CANARY);
+	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+		mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
 	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
 	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-- 
2.23.0

