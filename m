Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 876CE353A9E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCY246cgz3cBw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Pld5uuyV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Pld5uuyV; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCWc4NtMz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:20:11 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id v10so7196679pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Lonny+8YXdFwRIoOFSgIHHCV4tfZl5PHVskAqriodI=;
 b=Pld5uuyVNma4IP095QZiWqo8UqV8PkMaHdh9HQO5vviVQUc1Zrr6CStAUlatD1Cpt9
 Cf3dMiWSOxsJ2EbSqU2uxTTqqes5OQr/SCUIirAF+2fRdy4bQ0leINn/otKxy+2pVQ2x
 yPoDB25kpfCKupwHS1cs4k+qKMbci+yX/P0gfuucazdvzqgx2T+7bEMrJnw3YW7ApH4M
 3IMouOXeU47OArfcU3rw96Sqpnlvn8pJSFpKH5sNkzsMQWv/AN/8cFbCSHbXd0AhgU6N
 gOqa2serK4u9NF3MOw9UU/3QAoWpe9bDq4cG0vDqKT2yJWmRTynMI1AiRRSkCxFy/Cr0
 7TMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Lonny+8YXdFwRIoOFSgIHHCV4tfZl5PHVskAqriodI=;
 b=YKa8VzmYU8lcEYh62tXBluKj2Mz6UU1Ewo+3GRxfwZw0vA78cfC8DUtxn4t4nHYebU
 kilRBJrRgsS1L94th5C9khfpWlNAz7wmTvQVGvea4U6BM14zJ4CIUkLwc2MoOKXjRF/+
 wtG3uwVVgxvMIihvIHb1I5B5ugxTBI+4syaQb6TKd6weMrHLFuT3Xusdy/uWKMcLUao5
 VngLaWJMLU4bNdTMdqlTZfOjw67Lp+PjhS40rOfveeN5CZRPwwyYoYlrI2GWAOb+SSWj
 O8oZDLAom35osPwbDx/Y5gORULnzcbreWpjOA/9G280e3ewH+74Eq7kJLNDyFZuwSRjl
 aMmQ==
X-Gm-Message-State: AOAM532uy1N8o9pOmsu9N750hoa121jfSC+De5tXF7/03E4seN3yIqHk
 Nln1ucHxBEJk8VMdnzgwLEo=
X-Google-Smtp-Source: ABdhPJxtDv4We3Qhgcb0JgXD1Oj5UVWVjspAVC4M8tPa2to/IEuHoNAXkvDJvNbQpvRLhOubCb6Vug==
X-Received: by 2002:aa7:969d:0:b029:1f5:b02c:eed3 with SMTP id
 f29-20020aa7969d0000b02901f5b02ceed3mr21046840pfk.75.1617585603465; 
 Sun, 04 Apr 2021 18:20:03 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:20:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 01/48] KVM: PPC: Book3S HV: Nested move LPCR sanitising to
 sanitise_hv_regs
Date: Mon,  5 Apr 2021 11:19:01 +1000
Message-Id: <20210405011948.675354-2-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This will get a bit more complicated in future patches. Move it
into the helper function.

This change allows the L1 hypervisor to determine some of the LPCR
bits that the L0 is using to run it, which could be a privilege
violation (LPCR is HV-privileged), although the same problem exists
now for HFSCR for example. Discussion of the HV privilege issue is
ongoing and can be resolved with a later change.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_nested.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 0cd0e7aad588..3060e5deffc8 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -132,8 +132,27 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	}
 }
 
+/*
+ * This can result in some L0 HV register state being leaked to an L1
+ * hypervisor when the hv_guest_state is copied back to the guest after
+ * being modified here.
+ *
+ * There is no known problem with such a leak, and in many cases these
+ * register settings could be derived by the guest by observing behaviour
+ * and timing, interrupts, etc., but it is an issue to consider.
+ */
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
@@ -271,8 +290,6 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	u64 hv_ptr, regs_ptr;
 	u64 hdec_exp;
 	s64 delta_purr, delta_spurr, delta_ic, delta_vtb;
-	u64 mask;
-	unsigned long lpcr;
 
 	if (vcpu->kvm->arch.l1_ptcr == 0)
 		return H_NOT_AVAILABLE;
@@ -321,9 +338,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
 	vcpu->arch.regs = l2_regs;
 	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
-	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
-		LPCR_LPES | LPCR_MER;
-	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
+
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
 
@@ -335,7 +350,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 			r = RESUME_HOST;
 			break;
 		}
-		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, lpcr);
+		r = kvmhv_run_single_vcpu(vcpu, hdec_exp, l2_hv.lpcr);
 	} while (is_kvmppc_resume_guest(r));
 
 	/* save L2 state for return */
-- 
2.23.0

