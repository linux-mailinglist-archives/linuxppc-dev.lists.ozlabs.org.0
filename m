Return-Path: <linuxppc-dev+bounces-13356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CC8C12299
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 01:28:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwWSh5Jscz3bjb;
	Tue, 28 Oct 2025 11:28:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761611316;
	cv=none; b=L8I9sLhc3aqQb/AoS+5Bby0Ki8D2pLK3etUVPgl5kRA5ZfLs9LcxwUSF2j2b/4IXPQGzbqjqNtSezEAJAyL0hpyubCV6Fs6iI4AZXrM2DtwRIzCbjvs1w725U7/HHb27yzo4r4790QVnbSyvaNRP6oypvCVwq1b/fuGRKqhKm2+YXkZk1nraQweduZ/TjyTS8MmiJ+zrSeL59mWo+6483Biuj40C0p4jokgia5oCSpYW3zdHGKEgrEaINlE9JhRChCyKFNGdsQYh2N9zlZUxhpKXlPhR4io5lzWJKCrfPqqMGz9Zp6ZM7Ec195GNajHTZ4b1dMoJXkpZp5OZ2uXTCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761611316; c=relaxed/relaxed;
	bh=jpCJYgRp82lQv0i8mBtIwWCb3ISLbvZkCqkJQSt4yh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gppdYp5usou8X73rSmjJpcPvDvJn5mY24k/SeKl88HMEk5aRPq72VlANAFDu9hLZFFx2pLYHGMpZ7ZbFVXrsZ7sgaw3bTGdNjUD8lfHzjJbYb/9GH9p1XrLpEVMQTTpHA8aal3Cv+ATAGE1GcZl4HV3RU/zzt2/SMcLg30DaXD5O+n9IJsVH3whstgCl7xNPE1VqWjbDjef/l6lJbFHkcq2IuW5Wkz0aB6lFhsk72nHtkYWeRrlOIRwO7wnl+TkEsxnsZHOkdUwo/FcJEJrX/vFLBNVaEHBrcR1+Gq8T8XLbv/tj+gERZXBD5wUmQdLwn+xQmDgLYLp2GfRXQIP3/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncQ+gxZ2; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ncQ+gxZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=rick.p.edgecombe@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwWSg5xB2z2yFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 11:28:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761611316; x=1793147316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O9r9SqoXgXXFWNnj6936GGaEnFwZ1KbD5C04lY3OlKM=;
  b=ncQ+gxZ2XN1oM58dC8TMkyi6Rp09Z8Fag/CtSpP52Ai3SpdDRspL+/nH
   NlyZY1Ji02HLusHvlKAxUtapGRxFEiH5aUrWNYfETNV+6tjqjtEmnaTsB
   m+EZ0dZvwDbgYohf0CHGQaOBnT7+VWBtn73StcKi/UqypwaKSzIXJqLi7
   IxXW5pdWmSK73u56vOUSeV09talGSmz1k1Z/YtxZ3mU3dcOfafMlti6JW
   jJ9yuxdR8bXu2FRmFiF17VgV1PvGwk4AtaPgaomf7Z+mtu2w99OquWdke
   1Kh0tXmqH1fGH8hzWKAhN4UFLdvVhuFED+2C1UCPdt4uarsGv/sFkoFub
   A==;
X-CSE-ConnectionGUID: ly4tUq3CR8CVkeMsx+3rYQ==
X-CSE-MsgGUID: mmvPv9adQSyX3LkbdBTsTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63610178"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="63610178"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:28:34 -0700
X-CSE-ConnectionGUID: MtsX8J75QwO7JVf7pLQ1Rw==
X-CSE-MsgGUID: sxeH5MnIQqC0pE4YKx+1fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="222400872"
Received: from rpedgeco-desk.jf.intel.com ([10.88.27.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:28:32 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: seanjc@google.com
Cc: ackerleytng@google.com,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	binbin.wu@linux.intel.com,
	borntraeger@linux.ibm.com,
	chenhuacai@kernel.org,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	ira.weiny@intel.com,
	kai.huang@intel.com,
	kas@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	maddy@linux.ibm.com,
	maobibo@loongson.cn,
	maz@kernel.org,
	michael.roth@amd.com,
	oliver.upton@linux.dev,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	rick.p.edgecombe@intel.com,
	vannapurve@google.com,
	x86@kernel.org,
	yan.y.zhao@intel.com,
	zhaotianrui@loongson.cn
Subject: [PATCH] KVM: TDX: Take MMU lock around tdh_vp_init()
Date: Mon, 27 Oct 2025 17:28:24 -0700
Message-ID: <20251028002824.1470939-1-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <aP-1qlTkmFUgTld-@google.com>
References: <aP-1qlTkmFUgTld-@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Take MMU lock around tdh_vp_init() in KVM_TDX_INIT_VCPU to prevent
meeting contention during retries in some no-fail MMU paths.

The TDX module takes various try-locks internally, which can cause
SEAMCALLs to return an error code when contention is met. Dealing with
an error in some of the MMU paths that make SEAMCALLs is not straight
forward, so KVM takes steps to ensure that these will meet no contention
during a single BUSY error retry. The whole scheme relies on KVM to take
appropriate steps to avoid making any SEAMCALLs that could contend while
the retry is happening.

Unfortunately, there is a case where contention could be met if userspace
does something unusual. Specifically, hole punching a gmem fd while
initializing the TD vCPU. The impact would be triggering a KVM_BUG_ON().

The resource being contended is called the "TDR resource" in TDX docs 
parlance. The tdh_vp_init() can take this resource as exclusive if the 
'version' passed is 1, which happens to be version the kernel passes. The 
various MMU operations (tdh_mem_range_block(), tdh_mem_track() and 
tdh_mem_page_remove()) take it as shared.

There isn't a KVM lock that maps conceptually and in a lock order friendly 
way to the TDR lock. So to minimize infrastructure, just take MMU lock 
around tdh_vp_init(). This makes the operations we care about mutually 
exclusive. Since the other operations are under a write mmu_lock, the code 
could just take the lock for read, however this is weirdly inverted from 
the actual underlying resource being contended. Since this is covering an 
edge case that shouldn't be hit in normal usage, be a little less weird 
and take the mmu_lock for write around the call.

Fixes: 02ab57707bdb ("KVM: TDX: Implement hooks to propagate changes of TDP MMU mirror page table")
Reported-by: Yan Zhao <yan.y.zhao@intel.com>
Suggested-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
---
Hi,

It was indeed awkward, as Sean must have sniffed. But seems ok enough to
close the issue.

Yan, can you give it a look?

Posted here, but applies on top of this series.

Thanks,

Rick
---
 arch/x86/kvm/vmx/tdx.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index daec88d4b88d..8bf5d2624152 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2938,9 +2938,18 @@ static int tdx_td_vcpu_init(struct kvm_vcpu *vcpu, u64 vcpu_rcx)
 		}
 	}
 
-	err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
-	if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
-		return -EIO;
+	/*
+	 * tdh_vp_init() can take a exclusive lock of the TDR resource inside
+	 * the TDX module. This resource is also taken as shared in several
+	 * no-fail MMU paths, which could return TDX_OPERAND_BUSY on contention.
+	 * A read lock here would be enough to exclude the contention, but take
+	 * a write lock to avoid the weird inversion.
+	 */
+	scoped_guard(write_lock, &vcpu->kvm->mmu_lock) {
+		err = tdh_vp_init(&tdx->vp, vcpu_rcx, vcpu->vcpu_id);
+		if (TDX_BUG_ON(err, TDH_VP_INIT, vcpu->kvm))
+			return -EIO;
+	}
 
 	vcpu->arch.mp_state = KVM_MP_STATE_RUNNABLE;
 
-- 
2.51.1


