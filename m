Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7393515DE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB658470Gz3dw1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lb1CdsK4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lb1CdsK4; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB60C6jhHz3c1l
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:04:11 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id h3so1654292pfr.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTwV9xVlVat7TnR+O83IRQJ050ZVGX6uPq2CbLxvr5s=;
 b=Lb1CdsK4K7L+NG4t6H4dCnYoWNK9DTcjr5m6PiMNuuuqbj4G60ggiKUIjX6Shdwb5N
 J/3kTXgufsuimpOHE/vQGMsmXf4nugL7YKyf3qBuzSmkex4K5Aw+gD848QAd5lbUmewi
 fRKdnmE07x4QYEK/ia5+AF45EKerK/pQTZe2J8QzOTLygJOv/591trgaFHh+6KM8vrpq
 Kvfty50OZmzUYqlXEfyiaQtlEWZ1kuJgTCxkFDTvKw/ar7DQMuLLCEHv7KmkkWnrxbL5
 4mGgHniRZBn10RuM1MGeN/vDUAe47pWloo06oGFwEBOZYfrRYzmLqSSqe4uFHBcvXWZ5
 XHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTwV9xVlVat7TnR+O83IRQJ050ZVGX6uPq2CbLxvr5s=;
 b=OSZ7pHOmYGSkXwxtNkpyMqrRc8uqACY0Bf7SHbAA3cOoNx6jP+AMrRZxkrt32t+lmH
 4oGVemaUc/Q6tLX64z2f6TnZoy4BYXvhFLRvfazT6cC6yuUaPgB2mNKWxf+KwW24DkLF
 xJE5DAq+n8m1x1hxKr4iGw+TMFkQUk5fCOKKnQXWF1lCJz3hRAIk4okcaK2u1TfWtpQC
 SfZVSyi5FpcQ9lNY8qlrkwe2QY2d5jEBbeM3yw+YIbAmCunC6jKu3TxLKcT+cY453mwv
 juLDjgtRoUeuBaTLZkuBrMAvj+/QCMOsPcdxfh8nX987Sb+/n1kU7N6V5DKXhkYRiW2/
 pjOw==
X-Gm-Message-State: AOAM532jb6Mv+yXKz9VslzvUggggtw+cVlMxi4eVwk7dH5kLd9e/Zumg
 X92sfj/oywpLvE8SdVmkyoI=
X-Google-Smtp-Source: ABdhPJwjNIHlp0wQu+W5Vkhh7Mq9Nfx/IAjZZueBWbxX+Y7adiW+cj3XC+/5QsTNxx/UNyhUpssqDw==
X-Received: by 2002:a65:5688:: with SMTP id v8mr7910382pgs.78.1617289450250;
 Thu, 01 Apr 2021 08:04:10 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 10/48] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in
 guest MSR
Date: Fri,  2 Apr 2021 01:02:47 +1000
Message-Id: <20210401150325.442125-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than add the ME bit to the MSR at guest entry, make it clear
that the hypervisor does not allow the guest to clear the bit.

The ME set is kept in guest entry for now, but a future patch will
warn if it's not present.

Acked-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Daniel Axtens <dja@axtens.net>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c | 3 +++
 arch/powerpc/kvm/book3s_hv_nested.c  | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index 158d309b42a3..41cb03d0bde4 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -662,6 +662,9 @@ static void kvmppc_end_cede(struct kvm_vcpu *vcpu)
 
 void kvmppc_set_msr_hv(struct kvm_vcpu *vcpu, u64 msr)
 {
+	/* Guest must always run with ME enabled. */
+	msr = msr | MSR_ME;
+
 	/*
 	 * Check for illegal transactional state bit combination
 	 * and if we find it, force the TS field to a safe state.
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index d14fe32f167b..fb03085c902b 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -343,7 +343,9 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested = l2;
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
-	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
+
+	/* Guest must always run with ME enabled. */
+	vcpu->arch.shregs.msr = vcpu->arch.regs.msr | MSR_ME;
 
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

