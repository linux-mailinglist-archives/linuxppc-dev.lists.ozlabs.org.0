Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19514345466
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:04:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Cn70jTSz3bny
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:04:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Izxu2cY+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Izxu2cY+; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4CmC4LjGz300J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:03:23 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id ha17so9348708pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBaKXTT6tqcmaGc11EoTMESopxHECp8yTZkMjkgVdLc=;
 b=Izxu2cY+h1HMwlVPhSf7n1rDjX3J7yv3/47wGc/tPq02fFj3fMf6i7k88nzt2PBf8z
 UfcYoP4Eb1/xo9e8kix2dNRJ2dAw0V04HgKEyYhSE1wRXAF2f8dnBnHXANIkKl2Y6vVZ
 F4Vp6MjoUUbUgGWO0bemSdNTjJLid3eOmF3kY59ZRD/PpvB9bp1iZhqq1qUVz+inPMx1
 q988gLOjSHZhzu2GCQANkUb8yN2+QlwZVFafjUxXrvIg8m0qZWWvQ3laiBA34ZmbcWPQ
 0n1VxX90OKOKW78cgI7Ahjoq9bYRQsnMXQKjXogfQi5DmjEyv+S7cBXPBY25SCXRvAmD
 V+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBaKXTT6tqcmaGc11EoTMESopxHECp8yTZkMjkgVdLc=;
 b=IInlkW3OFNK8soc+/Kn2L5QDcISzkoxZeQ/oleVolBsN49ums/JDrfUr6EKXjWQIA1
 hYzRSOtvfDGZE15xDD2g1uLFK+xTCM3XQmzfmPlsK/Pn3qnT0MMKkcpxeKuAeu/BvzLK
 8dYO/39K9Jkc0picSG/5edOGp14faV6/L2hYIB8yFW3YIVaGhLrBj4QIqIbWPRoYiVA5
 6Oz7nQocO3/v0axSsPSyqv8sDG6lvWXO9xbdOBNBB8y7HusKoNG+VzpBU8JzJ7Cv/9UL
 gdmy8RELEIhmmNOQD1HoRZApv9E9BwiRBNj6BRxun2GHz+rjlTHZAx8Pa/TXbvppOGNW
 vRiA==
X-Gm-Message-State: AOAM531tUGpbjpwT7kzfVM9vApxF3B4Rp7y89UxOLZXFvij0OOsxZ4k2
 PCHWN/4BzkC3ONNkDdjPUpE=
X-Google-Smtp-Source: ABdhPJxPrJAxqYsh/kdROFwhwjRfieZjHzAssNiKzOsvkTUuAlj+IB/4tEwgnNKY418GpysusHsshg==
X-Received: by 2002:a17:90a:ba05:: with SMTP id
 s5mr1806215pjr.194.1616461401004; 
 Mon, 22 Mar 2021 18:03:21 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:03:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 01/46] KVM: PPC: Book3S HV: Nested move LPCR sanitising to
 sanitise_hv_regs
Date: Tue, 23 Mar 2021 11:02:20 +1000
Message-Id: <20210323010305.1045293-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

This will get a bit more complicated in future patches. Move it
into the helper function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 0cd0e7aad588..2fe1fea4c934 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -134,6 +134,16 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 
 static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 {
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	u64 mask;
+
+	/*
+	 * Don't let L1 change LPCR bits for the L2 except these:
+	 */
+	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
+		LPCR_LPES | LPCR_MER;
+	hr->lpcr = (vc->lpcr & ~mask) | (hr->lpcr & mask);
+
 	/*
 	 * Don't let L1 enable features for L2 which we've disabled for L1,
 	 * but preserve the interrupt cause field.
@@ -271,8 +281,6 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	u64 hv_ptr, regs_ptr;
 	u64 hdec_exp;
 	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
-	u64 mask;
-	unsigned long lpcr;
 
 	if (vcpu->kvm->arch.l1_ptcr == 0)
 		return H_NOT_AVAILABLE;
@@ -321,9 +329,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
 	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
-	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
+
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
 
@@ -335,7 +341,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 			r = RESUME_HOST;
 			break;
 		}
-		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
+		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, l2_hv.lpcr);
 	} while (is_kvmppc_resume_guest(r));
 
 	/* save L2 state for return */
-- 
2.23.0

