Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 102723E9582
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:06:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlF6v6fvNz3dg4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:06:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=U9nD7EKj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=U9nD7EKj; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF236QHHz3bYj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:03 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso5712019pjy.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=STNMxjwluTp9JCjXfe5D1Foa+DbrQm4yTFYqQb0u6iw=;
 b=U9nD7EKjgZigih/6AsSLpz0XDgyYMH4IlfEfteUP5xafhmgzlhBqrwJiuj/wsKiR49
 feyoFauiS5xDdsOnrIks4DWXzYqb8uo7iKChsk/6XkNTy3GouoK1+7jZ4k/sL2kXbcN8
 bkflCMbG89qNaEVTzTPSyn16HAGZ1lDmmRA7aywbZBzKlzqqZ27g/ZuTkz4+eqtRG/ZS
 +E9ttM8XltubyOZZSbFnmFkE4CCp3o90h3DErv8B9xVIarVednpVBBh9Jcl/EFU7himx
 lmeQimEm+X0zwY+Dp4AJqgXme4jvYyNFw3Z1t5EhW696D4vnezQjFQTvaKqCzAnDnFEC
 DYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=STNMxjwluTp9JCjXfe5D1Foa+DbrQm4yTFYqQb0u6iw=;
 b=H8pUoXK1ah80J72TullytsBxw1biYCwCfzanAGkvgviIVFmJkwCru7ezkH7aJO1nfA
 tfEOn1S1p3DzjvlDfuhYJw6XgEY6CW9fIwDhQlY5j0yovDqX1GI17uXmGLyXNHkeOAsY
 TglHG5AgzwRSnCZF+H74uOG52l6jEPSrwJj3ptzrgG82mQye172I3FKJgY2pkGClST++
 d7/JkAy41JOA0cseBsWoKYD8kosFAUQSucYXMnb2bBX85/ENyTfTIZMHboibpg2gmU0t
 Mys83ONEUwB3jYF8dtgCZg9862kKFWurqnmAcuC8pC7LX0kCK0njDV1lbjzN8iFzyjID
 OP+A==
X-Gm-Message-State: AOAM531ogzcY+tqa5WbpmDPpDetQu0lGYMlj+lFvcgCWgi99CKQ9PP6A
 a++p0T6jCA02jO0qXSOq4UM=
X-Google-Smtp-Source: ABdhPJxUngZExe9nTPF1RaK2X4z2XGC4lH8WAX8beuILcEuopbMdfmlOnh9YyeCt7nWalfEL7syZWw==
X-Received: by 2002:a65:6248:: with SMTP id q8mr618569pgv.279.1628697721998;
 Wed, 11 Aug 2021 09:02:01 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 07/60] KVM: PPC: Book3S HV Nested: Stop forwarding all HFUs
 to L1
Date: Thu, 12 Aug 2021 02:00:41 +1000
Message-Id: <20210811160134.904987-8-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

If the nested hypervisor has no access to a facility because it has
been disabled by the host, it should also not be able to see the
Hypervisor Facility Unavailable that arises from one of its guests
trying to access the facility.

This patch turns a HFU that happened in L2 into a Hypervisor Emulation
Assistance interrupt and forwards it to L1 for handling. The ones that
happened because L1 explicitly disabled the facility for L2 are still
let through, along with the corresponding Cause bits in the HFSCR.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
[np: move handling into kvmppc_handle_nested_exit]
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c65bd8fa4368..7bc9d487bc1a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1733,6 +1733,7 @@ XXX benchmark guest exits
 
 static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 {
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	int r;
 	int srcu_idx;
 
@@ -1822,9 +1823,35 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		fallthrough; /* go to facility unavailable handler */
 #endif
 
-	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
-		r = RESUME_HOST;
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
+		u64 cause = vcpu->arch.hfscr >> 56;
+
+		/*
+		 * Only pass HFU interrupts to the L1 if the facility is
+		 * permitted but disabled by the L1's HFSCR, otherwise
+		 * the interrupt does not make sense to the L1 so turn
+		 * it into a HEAI.
+		 */
+		if (!(vcpu->arch.hfscr_permitted & (1UL << cause)) ||
+					(nested->hfscr & (1UL << cause))) {
+			vcpu->arch.trap = BOOK3S_INTERRUPT_H_EMUL_ASSIST;
+
+			/*
+			 * If the fetch failed, return to guest and
+			 * try executing it again.
+			 */
+			r = kvmppc_get_last_inst(vcpu, INST_GENERIC,
+						 &vcpu->arch.emul_inst);
+			if (r != EMULATE_DONE)
+				r = RESUME_GUEST;
+			else
+				r = RESUME_HOST;
+		} else {
+			r = RESUME_HOST;
+		}
+
 		break;
+	}
 
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		vcpu->arch.trap = 0;
-- 
2.23.0

