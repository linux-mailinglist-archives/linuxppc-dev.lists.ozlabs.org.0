Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1560F353AC0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:24:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCcv0FvSz3dmL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:24:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=qTRhikcr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=qTRhikcr; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCX91FBSz30Qb
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:41 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso5057809pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XTwV9xVlVat7TnR+O83IRQJ050ZVGX6uPq2CbLxvr5s=;
 b=qTRhikcrH3/Zr5oPLdE032U6xMCvjUoB2lQbn3pBzdNA8pUickLMGYU+EAnbuWNfzp
 d2iHtGkbT17COc9zuTF8Pa8ZjtQmqjlnYOv82MZeiMdZUAa0cxSYZjbANgpuJIn+JAfT
 T6PqvzrwNVOc4Dof4q3M6q7132zigQ6FZS3FkSjpXZoLXVXUMqkVuaaDNO8IjS/MfpKO
 pRQ+bWDhgF9BEy5sejWNIomclwZSvXZwhf6aFhN38W4+pPkQD7OSnX6aJu59SNMQBdOr
 WBmgQht11OQ39pMwN/sJnL+Zyn9OnsO+bleVjpr3xBdpPClru15mepLsv2bSPTZ6IC1l
 ExzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XTwV9xVlVat7TnR+O83IRQJ050ZVGX6uPq2CbLxvr5s=;
 b=oSO4xGtZ0luVImc9QQukYO47VpKNyhKY3zQ2PfAjGRQlFYVX49ZViZEdvO77D9UqIY
 aD1Qn2qUqE4J2WZZIXnnjP7B/DXhcf9icOf0xHW40a9rvoTKFkUG7sAy/3THhb5yugKp
 s8kshtgoXg4iwxETznGWVAct9z2fIGLNTHZgJOFuinCMz4txVcaUnMGlMt/HyYM/3LzP
 /oslfb6rGdn99EuB9208GlIhlEpiZ06edI9QGQhDp2zJYfJIAzqN0Zr1cYCzrT3DjQSz
 dbhH5uoa/YP/13SzdaLLYjRbv9ekjaklW4MbKsjzIClquC/broVDmfyHJ94cuYGTt7h1
 1drA==
X-Gm-Message-State: AOAM532wzc+RkyKsmL7SgPfAwuyKzznFqY0ZuoxTxqvRlAsBEngrZ4fx
 6KG/NbEJGDnZgxjwSZBimfY=
X-Google-Smtp-Source: ABdhPJy8auehRG8QDvzXYfOdTM5XuOLcXu7jGgckCm/ditqcjEDm6KvS5q1GHun2vfRijGIqczyzqw==
X-Received: by 2002:a17:902:263:b029:e7:35d8:4554 with SMTP id
 90-20020a1709020263b02900e735d84554mr21591735plc.83.1617585638854; 
 Sun, 04 Apr 2021 18:20:38 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 10/48] KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in
 guest MSR
Date: Mon,  5 Apr 2021 11:19:10 +1000
Message-Id: <20210405011948.675354-11-npiggin@gmail.com>
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

