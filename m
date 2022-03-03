Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F8E4CB677
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:35:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KTH2BX2z3bw6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:35:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A5yHyoVq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A5yHyoVq; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQj3htkz3bww
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:33 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so3740397pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDVlKy+2bfZ2b/c4L614cIXqwP1CPgF+KjlhnCPRY44=;
 b=A5yHyoVqeTRN5ZzKK4Rau5YEn65Fipti9u3dAovXMRviK+AAZZk/nDzslliPcFaTEm
 UZOn+MPuD+uy7Kb2u/Z5jf5nwu9UurV6tBHfNA1tFtBs9tnFx+SuS/zsC9e6RQKZSAq0
 t8tdqC74i1RgdNjtLJu8DQ+wmaJsadfZm66EUOOU7wnBPGuiRtKKy27nAqIGXCt0ImeI
 wiQQEQ6wewqjgXs7PrFb/e3t/zva/goy9U3ygBPezGVuAcLGMsNTClHSGCtAgG1oQUGK
 olgXIwFLeTv/EVfcInM1BqSIcn8j/f+NkdEcLVfKExhjk6aPvtH7wpvs1fsEZpjnm58X
 FkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HDVlKy+2bfZ2b/c4L614cIXqwP1CPgF+KjlhnCPRY44=;
 b=jTm3qat+HAMIfYrn/oC0tx52NCVj/wLagf/+mJeU+SNSkQQS2gl2ZH1BC6+pScwjVn
 HE69Q/9jGd0miHZZuBv/aosxso2VY5YoRqUmtr91zy4abntrWAAjDNb3HKop9P16iOff
 r1mpf5jFyTw1NhGCOQFbK8eRQedVBogUkhY7OFlgOGeCaFY6yKXLuMiym9zb1dJjxVAp
 3I0r9g2UHD3e/VfcNGOQyVrrqYfgMzthjJhprs/zPIRjn3kT2Frea4QGP47MiItTb+ym
 E8Pwb6r0raaIh7qNhncbSrpF4yHmNJsOX3vsBfKVi5iT4V7qTb1JFVGln9qq1XfjhfeA
 pPFA==
X-Gm-Message-State: AOAM5329XPmwCOPnZ/tLz2fY2pMOjnc4an3UM+89Zu21e4gPUPqfTOin
 t3GNvqfPloEAzT1oNlvAq8pZ+sdkKiP6/Q==
X-Google-Smtp-Source: ABdhPJyKDEwXMIFCASHDmnsOlvqU4kGJEalOUy/Ptpl6jJr7UEJUHTxO0nqECQapDJWIxBMgKYhtwQ==
X-Received: by 2002:a17:903:22d0:b0:151:97f5:db54 with SMTP id
 y16-20020a17090322d000b0015197f5db54mr6278495plg.58.1646285612638; 
 Wed, 02 Mar 2022 21:33:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] KVM: PPC: Book3S HV P9: Split !nested case out from guest
 entry
Date: Thu,  3 Mar 2022 15:33:13 +1000
Message-Id: <20220303053315.1056880-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220303053315.1056880-1-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The differences between nested and !nested will become larger in
later changes so split them out for readability.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index a0b674d3a2da..0289d076c0a8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4034,6 +4034,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			 unsigned long lpcr, u64 *tb)
 {
+	struct kvm *kvm = vcpu->kvm;
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	u64 next_timer;
 	int trap;
 
@@ -4053,23 +4055,30 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
 
 		/* H_CEDE has to be handled now, not later */
-		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
+		if (trap == BOOK3S_INTERRUPT_SYSCALL && !nested &&
 		    kvmppc_get_gpr(vcpu, 3) == H_CEDE) {
 			kvmppc_cede(vcpu);
 			kvmppc_set_gpr(vcpu, 3, 0);
 			trap = 0;
 		}
 
-	} else {
-		struct kvm *kvm = vcpu->kvm;
+	} else if (nested) {
+		kvmppc_xive_push_vcpu(vcpu);
 
+		__this_cpu_write(cpu_in_guest, kvm);
+		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
+		__this_cpu_write(cpu_in_guest, NULL);
+
+		kvmppc_xive_pull_vcpu(vcpu);
+
+	} else {
 		kvmppc_xive_push_vcpu(vcpu);
 
 		__this_cpu_write(cpu_in_guest, kvm);
 		trap = kvmhv_vcpu_entry_p9(vcpu, time_limit, lpcr, tb);
 		__this_cpu_write(cpu_in_guest, NULL);
 
-		if (trap == BOOK3S_INTERRUPT_SYSCALL && !vcpu->arch.nested &&
+		if (trap == BOOK3S_INTERRUPT_SYSCALL &&
 		    !(vcpu->arch.shregs.msr & MSR_PR)) {
 			unsigned long req = kvmppc_get_gpr(vcpu, 3);
 
-- 
2.23.0

