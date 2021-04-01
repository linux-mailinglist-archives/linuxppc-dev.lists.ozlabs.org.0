Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99D3515CF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB60X1fbyz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:04:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EB5Xdagd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EB5Xdagd; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB5zf0PGBz309X
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:03:41 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id f29so160110pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Lonny+8YXdFwRIoOFSgIHHCV4tfZl5PHVskAqriodI=;
 b=EB5XdagdnHKZEFml3Dn+U/CaFOZK+fYjCXM5zF06Gt3F4Rd/frq64n2gwSamblUE1q
 A6U5QUdaDVuDssB29OGKTMNGaCv5uok0xeY91qsl2mm9Jh7GtJzmZvF98ba0rjDYvlCz
 c7TINB6AA+OjVUPLmAXLBndgyYk1YbUgRd78M6i8TYQyR86AKHK8SLas/P/cRDKHHJpE
 fD3p2xA5vstdVWCsHZgCSqPpcI5ubBxSox/qcJbYz3SfjVOUrP9irkdenoW6lU8dRegg
 JZJ0/tHJ0XaSjTlebIv9KqRKKf0GgxnztWm3ki6yFGjmJ8SCy8GJ4hK+mnrdR0jaop1z
 lTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Lonny+8YXdFwRIoOFSgIHHCV4tfZl5PHVskAqriodI=;
 b=e4xusN68YbMvLqDlJrANUCHUjg0PdzjmGyTI2H8vYEJ84onXB0kxzwc/vF/EdhlLWg
 MuL0RCmWUcFHnybASsunjx5IkxAbNYXLmJXYejtvstSZMJwFysF/kkrJ7taddGhHIdRP
 b1T/8CDiGCGcWbsaQb/Otn646InMWi/mZIxRk+8FdABqOJtXg2fGtzogi9VpDGsy6Ntz
 bcEPYT5C4Sc9fHbDf7TkYnu1NPEGFY/8HLUnBLCQ2sbP6Q3VXoTplPj9f8/0fDHd26F3
 LppBUa8vyxEhTdFScqxvFJpSggb4hbRod6zpVJgoCAUT5HZ9f6ii3apAC2KZ8FjSsO+S
 ydtg==
X-Gm-Message-State: AOAM530ypvhfkHSsLeZNY/aZDBMPeTELOsJhdNqozZMt9Nt6LobKxjix
 QEfk71FWAkea3BngCI+yFKE=
X-Google-Smtp-Source: ABdhPJx8m1h0BooMt+CnVS6OeabR7Up19Bge48DS3WHrToR37uKEL7NBIu7AaqOCINAfSleVTlt7eA==
X-Received: by 2002:a05:6a00:706:b029:217:9e8d:f9cc with SMTP id
 6-20020a056a000706b02902179e8df9ccmr8025886pfl.1.1617289419122; 
 Thu, 01 Apr 2021 08:03:39 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:03:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 01/48] KVM: PPC: Book3S HV: Nested move LPCR sanitising to
 sanitise_hv_regs
Date: Fri,  2 Apr 2021 01:02:38 +1000
Message-Id: <20210401150325.442125-2-npiggin@gmail.com>
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

