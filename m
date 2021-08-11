Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE253E95E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFXf3cCtz3gKq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dJC/kinx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dJC/kinx; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF3V41qVz3dCw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:03:18 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id q2so3258661plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XEm+DUqj4PUtiyOis8qtw0OTEw1uAY3Zp3uaXAMjEQ4=;
 b=dJC/kinxyhAdc5J8a4tDG79b2oCr39+gJuy90PWsrsw9a0ps6Mca8mQcPrqYaOV6U5
 fF1PAfH9PVxfLfLX1aIbZrZqilYHQtksGV/c7MathOCCZSA3kpCo11yJ6zS0uKFSeGjK
 zk6gQJn/RW7fZUO6cbGOvoqOS/EksCwdpezAp5UjSLmQX/u5dAhyzqp2exkbU+X0T5qv
 w1IDeiyumd5IwBauDOGe9E0SvOFkIyaSxfUXNV4L1MRGhoEQq7g5t/lBcbMIwMHTYr0N
 MdOLrqjuKUguerPpxnVUKy6Io/eKxH0QkGIlKwOHF1gi89j8kA2JordYjPw6dJCIwpuG
 yPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XEm+DUqj4PUtiyOis8qtw0OTEw1uAY3Zp3uaXAMjEQ4=;
 b=O/we9SsRqtMPtCwaE1ujRdGff+Ir46RsiBOmbjsiLzYjN9mT0nSLt7dT+Tb0vAkCVl
 zuc6lS3UGvGIxtgHI1sw3Qt8X/qJvGPwun0u+4h5oQYYjIieykg7c5p0hq/nF72Afwus
 K0oSff1Aq1xpeXPX0LNvRY81as4o3PKmpED6uWc5VDVaRZuyu9Q1O6635iihptQ6lJJL
 5e6M7fEpRyxRkOI4KMwNwFKiUggZlC14wDuKXiiRWcQxeMcJY0KZ29bbIoKgAXR1MwOE
 usqkkeqBhWND3CWR3cWr1Tttoa5XxsLM9rGFh5/A2kIyVj8Au1xwK2zKsqRmFQ4QNEEk
 VV3w==
X-Gm-Message-State: AOAM5319ptRyr7SNBp2Lm1+p+eNzVpe4G8fMsuc2n/1iWrXI1btDLH1R
 SHlidyoxTroEpTaOBq8fSof2pUrnzNw=
X-Google-Smtp-Source: ABdhPJwbukVAGKjLO2gZJLa3Iwc+KZUCF6MrCW4j/yqRZ8x8u2AzScv9ZLLuH3hXgM/MnFAfSTZUnQ==
X-Received: by 2002:a17:90a:c006:: with SMTP id
 p6mr6424106pjt.144.1628697796538; 
 Wed, 11 Aug 2021 09:03:16 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:03:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 35/60] KVM: PPC: Book3S HV P9: Juggle SPR switching around
Date: Thu, 12 Aug 2021 02:01:09 +1000
Message-Id: <20210811160134.904987-36-npiggin@gmail.com>
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

This juggles SPR switching on the entry and exit sides to be more
symmetric, which makes the next refactoring patch possible with no
functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 85f441d9ce63..7867d6793b3e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4211,7 +4211,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		msr = mfmsr(); /* TM restore can update msr */
 	}
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	load_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
@@ -4219,7 +4219,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu, &host_os_sprs);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4319,6 +4319,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
+	switch_pmu_to_host(vcpu, &host_os_sprs);
+
 	store_spr_state(vcpu);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4333,8 +4335,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	timer_rearm_host_dec(*tb);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-- 
2.23.0

