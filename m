Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BE6211894
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 03:30:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y0rq67sLzDqrT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 11:30:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=umyc41Lh; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y0jK25dVzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 11:23:33 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AB5E22082F;
 Thu,  2 Jul 2020 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593653011;
 bh=Vo3x2TRiXq5ViMr6k5CcJOTSHhyC2Yca1owqTu51t0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=umyc41LhZIIa0ZUERPq850jeBO7C9lVSvomXEWcmiSsjrnPbrXXe3Bdtr9Mzfik7o
 1UTVy/xQf+5lP6Nj6a3f3+UXT17KvH1W+Fnz2o2VEgcJIRVLLGfH4/Dd8VaxFF5ZEl
 mt9p3ji1+e5BK3DSlYc7UeV4QSW7L0qCCEEwzmMw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 29/53] powerpc/kvm/book3s64: Fix kernel crash with
 nested kvm & DEBUG_VIRTUAL
Date: Wed,  1 Jul 2020 21:21:38 -0400
Message-Id: <20200702012202.2700645-29-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012202.2700645-1-sashal@kernel.org>
References: <20200702012202.2700645-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>

[ Upstream commit c1ed1754f271f6b7acb1bfdc8cfb62220fbed423 ]

With CONFIG_DEBUG_VIRTUAL=y, __pa() checks for addr value and if it's
less than PAGE_OFFSET it leads to a BUG().

  #define __pa(x)
  ({
  	VIRTUAL_BUG_ON((unsigned long)(x) < PAGE_OFFSET);
  	(unsigned long)(x) & 0x0fffffffffffffffUL;
  })

  kernel BUG at arch/powerpc/kvm/book3s_64_mmu_radix.c:43!
  cpu 0x70: Vector: 700 (Program Check) at [c0000018a2187360]
      pc: c000000000161b30: __kvmhv_copy_tofrom_guest_radix+0x130/0x1f0
      lr: c000000000161d5c: kvmhv_copy_from_guest_radix+0x3c/0x80
  ...
  kvmhv_copy_from_guest_radix+0x3c/0x80
  kvmhv_load_from_eaddr+0x48/0xc0
  kvmppc_ld+0x98/0x1e0
  kvmppc_load_last_inst+0x50/0x90
  kvmppc_hv_emulate_mmio+0x288/0x2b0
  kvmppc_book3s_radix_page_fault+0xd8/0x2b0
  kvmppc_book3s_hv_page_fault+0x37c/0x1050
  kvmppc_vcpu_run_hv+0xbb8/0x1080
  kvmppc_vcpu_run+0x34/0x50
  kvm_arch_vcpu_ioctl_run+0x2fc/0x410
  kvm_vcpu_ioctl+0x2b4/0x8f0
  ksys_ioctl+0xf4/0x150
  sys_ioctl+0x28/0x80
  system_call_exception+0x104/0x1d0
  system_call_common+0xe8/0x214

kvmhv_copy_tofrom_guest_radix() uses a NULL value for to/from to
indicate direction of copy.

Avoid calling __pa() if the value is NULL to avoid the BUG().

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
[mpe: Massage change log a bit to mention CONFIG_DEBUG_VIRTUAL]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200611120159.680284-1-aneesh.kumar@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index bc6c1aa3d0e92..ef40addd52c65 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -40,7 +40,8 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpid, int pid,
 	/* Can't access quadrants 1 or 2 in non-HV mode, call the HV to do it */
 	if (kvmhv_on_pseries())
 		return plpar_hcall_norets(H_COPY_TOFROM_GUEST, lpid, pid, eaddr,
-					  __pa(to), __pa(from), n);
+					  (to != NULL) ? __pa(to): 0,
+					  (from != NULL) ? __pa(from): 0, n);
 
 	quadrant = 1;
 	if (!pid)
-- 
2.25.1

