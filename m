Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8D3353AC1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:25:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCdP3QWxz3dqv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:25:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fkn24Rh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fkn24Rh2; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCXD3zH3z3bs5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:44 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id m11so4565342pfc.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SrGG57sCJsQ8pkpP+3mT7sg63D+3Ca06l9D6kjJ6tqw=;
 b=fkn24Rh2tyMJgoiBgroeRaOOeOSmiyQVTA0fzz3q95rUSWykaTwmGQminD86aIMeDU
 BSnh5WFaTpl24rJpdr4rtRad3UlGzeJCTotJXnsR7N5/PJgHa5xZTX1hMxOnwFHnLRdQ
 9If6gh8tfJFomgZ9eSyTk74iuCxqhxrQLxmGO9pw+8qazYi74R+O+qlBaGRh3avm/Fw7
 yJ7JGRS1+E7AAs7evVIuqfbWe4wRMVib31VrZqvEzlq34HoXGOKMK4euguZQj8CPsfk9
 RwQE6Ht4KHgZjnEMtWQytvVs4oJCIq+oiZTzD9AzMQP2hL+ewe5nJ49MpOB5ePse6t2P
 9a1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SrGG57sCJsQ8pkpP+3mT7sg63D+3Ca06l9D6kjJ6tqw=;
 b=nN+o72FdlbqJow5WGCdixwHxD7d/6SPgU+o2Xip+UVApT+pGz8CPJguZ9AMY9pKNjw
 EEi3ue0U9bs3XSbLXVxAF7I8sUBYaHpVTyIP8N5yNCvt1keY2C6IG2ugU53Wrp3NRSKD
 drMsFJCF0EepM0rvFYhwgnFBuNht+YTAfNp5XRK/4FbD8+Bd/SSWgAAWcjmEGo2152NR
 DNW+hvtcvbNmBzDvmrdi4j7y8dVTvgvqtV8IL6y8+dIE/z2fBSS1oBMK+yoBcxaNPE45
 Ssbtzrrqw4SZXJVeFNd4FAWJuetVKFJzTGKlNqh7Cn5eFeEEH3KMeaTDKj1Fv3oT7MsT
 LM6Q==
X-Gm-Message-State: AOAM5327C4p17OQ+MjO96C668DYug110G/64K6mTBM/LJVpHkjz6uJtS
 0yjXanV5Lx8zFy1De2s+M/0=
X-Google-Smtp-Source: ABdhPJxUmMVnw9SMhnzSH8lJv1BCZinDTTVcYhWlb0rPal1HJ/KI5N2aqfXMKeJdqDoqhtDwgPbkxg==
X-Received: by 2002:a62:8811:0:b029:1ef:2105:3594 with SMTP id
 l17-20020a6288110000b02901ef21053594mr21701500pfd.70.1617585642156; 
 Sun, 04 Apr 2021 18:20:42 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 11/48] KVM: PPC: Book3S HV: Ensure MSR[HV] is always clear
 in guest MSR
Date: Mon,  5 Apr 2021 11:19:11 +1000
Message-Id: <20210405011948.675354-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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

Rather than clear the HV bit from the MSR at guest entry, make it clear
that the hypervisor does not allow the guest to set the bit.

The HV clear is kept in guest entry for now, but a future patch will
warn if it is set.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 4 ++--
 arch/powerpc/kvm/book3s_hv_nested.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 41cb03d0bde4..7a0e33a9c980 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,8 +662,8 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
-	/* Guest must always run with ME enabled. */
-	msr = msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	msr = (msr | MSR_ME) & ~MSR_HV;
 
 	/*
 	 * Check for illegal transactional state bit combination
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index fb03085c902b..60724f674421 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -344,8 +344,8 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
 
-	/* Guest must always run with ME enabled. */
-	vcpu->arch.shregs.msr = vcpu->arch.regs.msr | MSR_ME;
+	/* Guest must always run with ME enabled, HV disabled. */
+	vcpu->arch.shregs.msr = (vcpu->arch.regs.msr | MSR_ME) & ~MSR_HV;
 
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

