Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E59204DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 13:41:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454TzL3v1VzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 21:41:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="zySpQXc7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Tx251P5zDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 21:39:50 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3FC192168B;
 Thu, 16 May 2019 11:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558006789;
 bh=usTzdBEGevdojQvxpyvI9EUSyB4z1uIxU5u4YtGaaLU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zySpQXc7WAMPyrjfDF/Zysa8iTPrpp7+iNjRvdq2PLrVwpueOKrbEmoc8TL3zINqI
 w4Nh6EAtD4gkLiDLKHlHTGK20NWr+fY/tbo/yU6Hr/D2Lr5HESzwmhsKFvr6tW8sz/
 hz/sDX88NMPNi1dkX4ah3UNVJv8Uitr1ZckMNDIw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 12/34] KVM: PPC: Book3S: Protect memslots while
 validating user address
Date: Thu, 16 May 2019 07:39:09 -0400
Message-Id: <20190516113932.8348-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516113932.8348-1-sashal@kernel.org>
References: <20190516113932.8348-1-sashal@kernel.org>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

[ Upstream commit 345077c8e172c255ea0707214303ccd099e5656b ]

Guest physical to user address translation uses KVM memslots and reading
these requires holding the kvm->srcu lock. However recently introduced
kvmppc_tce_validate() broke the rule (see the lockdep warning below).

This moves srcu_read_lock(&vcpu->kvm->srcu) earlier to protect
kvmppc_tce_validate() as well.

=============================
WARNING: suspicious RCU usage
5.1.0-rc2-le_nv2_aikATfstn1-p1 #380 Not tainted
-----------------------------
include/linux/kvm_host.h:605 suspicious rcu_dereference_check() usage!

other info that might help us debug this:

rcu_scheduler_active = 2, debug_locks = 1
1 lock held by qemu-system-ppc/8020:
 #0: 0000000094972fe9 (&vcpu->mutex){+.+.}, at: kvm_vcpu_ioctl+0xdc/0x850 [kvm]

stack backtrace:
CPU: 44 PID: 8020 Comm: qemu-system-ppc Not tainted 5.1.0-rc2-le_nv2_aikATfstn1-p1 #380
Call Trace:
[c000003fece8f740] [c000000000bcc134] dump_stack+0xe8/0x164 (unreliable)
[c000003fece8f790] [c000000000181be0] lockdep_rcu_suspicious+0x130/0x170
[c000003fece8f810] [c0000000000d5f50] kvmppc_tce_to_ua+0x280/0x290
[c000003fece8f870] [c00800001a7e2c78] kvmppc_tce_validate+0x80/0x1b0 [kvm]
[c000003fece8f8e0] [c00800001a7e3fac] kvmppc_h_put_tce+0x94/0x3e4 [kvm]
[c000003fece8f9a0] [c00800001a8baac4] kvmppc_pseries_do_hcall+0x30c/0xce0 [kvm_hv]
[c000003fece8fa10] [c00800001a8bd89c] kvmppc_vcpu_run_hv+0x694/0xec0 [kvm_hv]
[c000003fece8fae0] [c00800001a7d95dc] kvmppc_vcpu_run+0x34/0x48 [kvm]
[c000003fece8fb00] [c00800001a7d56bc] kvm_arch_vcpu_ioctl_run+0x2f4/0x400 [kvm]
[c000003fece8fb90] [c00800001a7c3618] kvm_vcpu_ioctl+0x460/0x850 [kvm]
[c000003fece8fd00] [c00000000041c4f4] do_vfs_ioctl+0xe4/0x930
[c000003fece8fdb0] [c00000000041ce04] ksys_ioctl+0xc4/0x110
[c000003fece8fe00] [c00000000041ce78] sys_ioctl+0x28/0x80
[c000003fece8fe20] [c00000000000b5a4] system_call+0x5c/0x70

Fixes: 42de7b9e2167 ("KVM: PPC: Validate TCEs against preregistered memory page sizes", 2018-09-10)
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_64_vio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
index 532ab79734c7a..d43e8fe6d4241 100644
--- a/arch/powerpc/kvm/book3s_64_vio.c
+++ b/arch/powerpc/kvm/book3s_64_vio.c
@@ -543,14 +543,14 @@ long kvmppc_h_put_tce(struct kvm_vcpu *vcpu, unsigned long liobn,
 	if (ret != H_SUCCESS)
 		return ret;
 
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
 	ret = kvmppc_tce_validate(stt, tce);
 	if (ret != H_SUCCESS)
-		return ret;
+		goto unlock_exit;
 
 	dir = iommu_tce_direction(tce);
 
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
-
 	if ((dir != DMA_NONE) && kvmppc_tce_to_ua(vcpu->kvm, tce, &ua, NULL)) {
 		ret = H_PARAMETER;
 		goto unlock_exit;
-- 
2.20.1

