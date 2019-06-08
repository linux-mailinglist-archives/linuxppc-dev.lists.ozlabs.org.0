Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4F539EC9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 13:52:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ld6d4j5RzDqxD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 21:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="vtjNu9RU"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LctH00KqzDqXq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 21:41:26 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D27B1214D8;
 Sat,  8 Jun 2019 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559994083;
 bh=lAKfE8nLhpz2DXzAudynrNUtfh9uXCTBu1CWgk2rz3A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vtjNu9RUtkYsoGy5Ll2K5CSwmNo/Fdks9XA+FHldmq+/tNtqU22MwG8s6fw3nhM1u
 I9UJUVT0C+NZPs3uk2rc4zl6p+J+fwHqCLV0S5QOH+DwZPmTy4WKpVvHPT4IYW9cyB
 f1jgdu6x/wm+GJeoiHy6HuMVpt0TumTZg8x/Ev7c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 54/70] KVM: PPC: Book3S HV: Don't take kvm->lock
 around kvm_for_each_vcpu
Date: Sat,  8 Jun 2019 07:39:33 -0400
Message-Id: <20190608113950.8033-54-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190608113950.8033-1-sashal@kernel.org>
References: <20190608113950.8033-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Paul Mackerras <paulus@ozlabs.org>

[ Upstream commit 5a3f49364c3ffa1107bd88f8292406e98c5d206c ]

Currently the HV KVM code takes the kvm->lock around calls to
kvm_for_each_vcpu() and kvm_get_vcpu_by_id() (which can call
kvm_for_each_vcpu() internally).  However, that leads to a lock
order inversion problem, because these are called in contexts where
the vcpu mutex is held, but the vcpu mutexes nest within kvm->lock
according to Documentation/virtual/kvm/locking.txt.  Hence there
is a possibility of deadlock.

To fix this, we simply don't take the kvm->lock mutex around these
calls.  This is safe because the implementations of kvm_for_each_vcpu()
and kvm_get_vcpu_by_id() have been designed to be able to be called
locklessly.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_hv.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 4519c55ba19d..bea595c94cfc 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -445,12 +445,7 @@ static void kvmppc_dump_regs(struct kvm_vcpu *vcpu)
 
 static struct kvm_vcpu *kvmppc_find_vcpu(struct kvm *kvm, int id)
 {
-	struct kvm_vcpu *ret;
-
-	mutex_lock(&kvm->lock);
-	ret = kvm_get_vcpu_by_id(kvm, id);
-	mutex_unlock(&kvm->lock);
-	return ret;
+	return kvm_get_vcpu_by_id(kvm, id);
 }
 
 static void init_vpa(struct kvm_vcpu *vcpu, struct lppaca *vpa)
@@ -1502,7 +1497,6 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	u64 mask;
 
-	mutex_lock(&kvm->lock);
 	spin_lock(&vc->lock);
 	/*
 	 * If ILE (interrupt little-endian) has changed, update the
@@ -1542,7 +1536,6 @@ static void kvmppc_set_lpcr(struct kvm_vcpu *vcpu, u64 new_lpcr,
 		mask &= 0xFFFFFFFF;
 	vc->lpcr = (vc->lpcr & ~mask) | (new_lpcr & mask);
 	spin_unlock(&vc->lock);
-	mutex_unlock(&kvm->lock);
 }
 
 static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
-- 
2.20.1

