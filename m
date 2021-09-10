Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CBD406193
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 02:42:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H5HBl657Nz3f5g
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Sep 2021 10:42:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jKRl8DKE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jKRl8DKE; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H5Gmf3H60z3cCg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Sep 2021 10:22:58 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24181610A3;
 Fri, 10 Sep 2021 00:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233376;
 bh=UIvOK2NcnJWWnceXNa/vNehe+Q+DxTsWpDDw7Nll06k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jKRl8DKEnczi1+HNMxd4pRlFPflovAlxBI1HaXrrGRh3biu52FQ36lDr0rbgTG3eK
 10x0dLdwaTra4N3b2SkCJg9KplnVc9roue9ALbUB214dKDgxsi+yb6Pt89hfcJ/RKM
 W+vifr+nssVOKpLLRIdMV6mie4Is6X+ZMKvy6JCAUW/RFrct8N93brN19+GFsk3PmC
 l+AoiiW2bpEuurOmdy+TGn8AjVPSJwry6vCJIRZeb9Wod+v+StHieqs9DsNBx22Grt
 fzSwv5gHMAzezUv1Hk11GvKxrd6B37oUvixuBIGwbFE6rLzqGTj3SdT/iQoKg41JSS
 wqZ4yyMW83ekA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 17/25] KVM: PPC: Book3S HV P9: Fixes for TM
 softpatch interrupt NIP
Date: Thu,  9 Sep 2021 20:22:25 -0400
Message-Id: <20210910002234.176125-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002234.176125-1-sashal@kernel.org>
References: <20210910002234.176125-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 4782e0cd0d184d727ad3b0cfe20d1d44d9f98239 ]

The softpatch interrupt sets HSRR0 to the faulting instruction +4, so
it should subtract 4 for the faulting instruction address in the case
it is a TM softpatch interrupt (the instruction was not executed) and
it was not emulated.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210811160134.904987-4-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv_tm.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_tm.c b/arch/powerpc/kvm/book3s_hv_tm.c
index e7fd60cf9780..327abfbe13c3 100644
--- a/arch/powerpc/kvm/book3s_hv_tm.c
+++ b/arch/powerpc/kvm/book3s_hv_tm.c
@@ -49,6 +49,15 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 	u64 newmsr, bescr;
 	int ra, rs;
 
+	/*
+	 * The TM softpatch interrupt sets NIP to the instruction following
+	 * the faulting instruction, which is not executed. Rewind nip to the
+	 * faulting instruction so it looks like a normal synchronous
+	 * interrupt, then update nip in the places where the instruction is
+	 * emulated.
+	 */
+	vcpu->arch.regs.nip -= 4;
+
 	/*
 	 * rfid, rfebb, and mtmsrd encode bit 31 = 0 since it's a reserved bit
 	 * in these instructions, so masking bit 31 out doesn't change these
@@ -70,7 +79,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 			       (newmsr & MSR_TM)));
 		newmsr = sanitize_msr(newmsr);
 		vcpu->arch.shregs.msr = newmsr;
-		vcpu->arch.cfar = vcpu->arch.regs.nip - 4;
+		vcpu->arch.cfar = vcpu->arch.regs.nip;
 		vcpu->arch.regs.nip = vcpu->arch.shregs.srr0;
 		return RESUME_GUEST;
 
@@ -103,7 +112,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		vcpu->arch.bescr = bescr;
 		msr = (msr & ~MSR_TS_MASK) | MSR_TS_T;
 		vcpu->arch.shregs.msr = msr;
-		vcpu->arch.cfar = vcpu->arch.regs.nip - 4;
+		vcpu->arch.cfar = vcpu->arch.regs.nip;
 		vcpu->arch.regs.nip = vcpu->arch.ebbrr;
 		return RESUME_GUEST;
 
@@ -119,6 +128,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		newmsr = (newmsr & ~MSR_LE) | (msr & MSR_LE);
 		newmsr = sanitize_msr(newmsr);
 		vcpu->arch.shregs.msr = newmsr;
+		vcpu->arch.regs.nip += 4;
 		return RESUME_GUEST;
 
 	/* ignore bit 31, see comment above */
@@ -155,6 +165,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 				msr = (msr & ~MSR_TS_MASK) | MSR_TS_S;
 		}
 		vcpu->arch.shregs.msr = msr;
+		vcpu->arch.regs.nip += 4;
 		return RESUME_GUEST;
 
 	/* ignore bit 31, see comment above */
@@ -192,6 +203,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
 			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		vcpu->arch.shregs.msr &= ~MSR_TS_MASK;
+		vcpu->arch.regs.nip += 4;
 		return RESUME_GUEST;
 
 	/* ignore bit 31, see comment above */
@@ -223,6 +235,7 @@ int kvmhv_p9_tm_emulation(struct kvm_vcpu *vcpu)
 		vcpu->arch.regs.ccr = (vcpu->arch.regs.ccr & 0x0fffffff) |
 			(((msr & MSR_TS_MASK) >> MSR_TS_S_LG) << 29);
 		vcpu->arch.shregs.msr = msr | MSR_TS_S;
+		vcpu->arch.regs.nip += 4;
 		return RESUME_GUEST;
 	}
 
-- 
2.30.2

