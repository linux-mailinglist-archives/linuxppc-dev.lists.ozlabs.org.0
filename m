Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60C5B2A7D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 01:39:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNwZD6PJPz3c4W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 09:39:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iRYSYfVr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=isaku.yamahata@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iRYSYfVr;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Fri, 09 Sep 2022 09:27:28 AEST
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNwJc5QRdz2xfS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 09:27:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662679649; x=1694215649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jWuQBoK0q0gfpKRVUiGWH6TTCqtzESEI7BQKtOCQK/A=;
  b=iRYSYfVr0xvy/5APSuAHio1NVxasmGbtcvhQjVRl2/adhTXpPNApNcS9
   1OLXbmyMGneNtG6tUbo/1TrQnk/A74S52B3SyVoMW+Ox4FFlZpLCuGhVm
   WJpY+kcvLgajpVhzSbl7inAvOogFVrMhq8xc1A//7xVLD8ckK9HDHjnJj
   /k+ZKV8ZxHNNEuNI4QBrl7NMkpqoixaaXHWhwWWByLwdDDcfX6V99PZEy
   hasfDepTpCN2zJQmE6/X7He2HZPtLEZ6qZLqw+Qm/YYUQAvpRyToBj17P
   7u6a4wLcbl/YcI/qpVsI8BPHxalO/ugPdu/JL9NWAX7ngO9FjAuqK9z1W
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298687047"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="298687047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 16:26:16 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="610863281"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 16:26:15 -0700
From: isaku.yamahata@intel.com
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Yuan Yao <yuan.yao@linux.intel.com>
Subject: [PATCH v4 23/26] RFC: KVM: powerpc: Move processor compatibility check to hardware setup
Date: Thu,  8 Sep 2022 16:25:39 -0700
Message-Id: <b348201517333f52c570f359e0d94bc9d5afc4f2.1662679124.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662679124.git.isaku.yamahata@intel.com>
References: <cover.1662679124.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 09 Sep 2022 09:38:46 +1000
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
Cc: isaku.yamahata@intel.com, Huang Ying <ying.huang@intel.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, John Garry <john.garry@huawei.com>, Shaokun Zhang <zhangshaokun@hisilicon.com>, Kai Huang <kai.huang@intel.com>, Atish Patra <atishp@atishpatra.org>, Huacai Chen <chenhuacai@kernel.org>, Qi Liu <liuqi115@huawei.com>, isaku.yamahata@gmail.com, Chao Gao <chao.gao@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Move processor compatibility check from kvm_arch_processor_compat() into
kvm_arch_hardware_setup().  The check does model name comparison with a
global variable, cur_cpu_spec.  There is no point to check it at run time
on all processors.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7b56d6ccfdfb..7e3a6659f107 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -444,12 +444,21 @@ int kvm_arch_hardware_enable(void)
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	return 0;
+	/*
+	 * kvmppc_core_check_processor_compat() checks the global variable.
+	 * No point to check on all processors or at runtime.
+	 * arch/powerpc/kvm/book3s.c: return 0
+	 * arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
+	 * arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
+	 *                            strcmp(cur_cpu_spec->cpu_name, "e5500")
+	 *                            strcmp(cur_cpu_spec->cpu_name, "e6500")
+	 */
+	return kvmppc_core_check_processor_compat();
 }
 
 int kvm_arch_check_processor_compat(void)
 {
-	return kvmppc_core_check_processor_compat();
+	return 0;
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
-- 
2.25.1

