Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C65E6AAE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 20:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYNsv4sSjz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 04:22:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qip61DlN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=isaku.yamahata@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qip61DlN;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYNsJ07Mgz3bk0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 04:21:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663870900; x=1695406900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W2Kk+Oh554M6hYppcd4bamgUFE8iODrNht1zMrNWv44=;
  b=Qip61DlNOAbIYYUf5Nl/thC2x98ijyBwSo0wTvhGBW9vy8A5hLFfev7X
   ZiNsI3O76yEEly2ppN3WfxjLLQeELk9OytuwZAUcK5BcnERpbCnNvMhtS
   NBobtYeKdCWfGV6J7UmtgUXPE85FJSrOHSN9SSTcfyRq6c00l6tAPruU6
   50p67XUrmr8vlQJg7dfqUGRJ+G0zPhPAMse1a4gUHhy39RQ9RtPPYFOn5
   tM0T3oAX3tZEFpsC7ljFebWfrlPIXhEENrlIScHLYwv2zvYwTMbiMT/+I
   EK+3mYQC9r6fvhAyoZ7pwV5kO0ItnovKZhfh5tb+iUgfYqLIxybZSSgaw
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386676073"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="386676073"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 11:21:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="653086909"
Received: from ls.sc.intel.com (HELO localhost) ([143.183.96.54])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 11:21:28 -0700
From: isaku.yamahata@intel.com
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v5 27/30] RFC: KVM: powerpc: Move processor compatibility check to hardware setup
Date: Thu, 22 Sep 2022 11:20:56 -0700
Message-Id: <574ca90fdaec0f37c197d9600d47d48a74f324bd.1663869838.git.isaku.yamahata@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663869838.git.isaku.yamahata@intel.com>
References: <cover.1663869838.git.isaku.yamahata@intel.com>
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
Cc: isaku.yamahata@intel.com, Huang Ying <ying.huang@intel.com>, Huacai Chen <chenhuacai@kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Shaokun Zhang <zhangshaokun@hisilicon.com>, Kai Huang <kai.huang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, Atish Patra <atishp@atishpatra.org>, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, isaku.yamahata@gmail.com, Chao Gao <chao.gao@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Isaku Yamahata <isaku.yamahata@intel.com>

Move processor compatibility check from kvm_arch_processor_compat() into
kvm_arch_hardware_setup().  The check does model name comparison with a
global variable, cur_cpu_spec.  There is no point to check it at run time
on all processors.

kvmppc_core_check_processor_compat() checks the global variable.  There are
five implementation for it as follows.

  arch/powerpc/include/asm/cputable.h: extern struct cpu_spec *cur_cpu_spec;
  arch/powerpc/kvm/book3s.c: return 0
  arch/powerpc/kvm/e500.c: strcmp(cur_cpu_spec->cpu_name, "e500v2")
  arch/powerpc/kvm/e500mc.c: strcmp(cur_cpu_spec->cpu_name, "e500mc")
                             strcmp(cur_cpu_spec->cpu_name, "e5500")
                             strcmp(cur_cpu_spec->cpu_name, "e6500")

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Fabiano Rosas <farosas@linux.ibm.com>
---
 arch/powerpc/kvm/powerpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 7b56d6ccfdfb..31dc4f231e9d 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -444,12 +444,12 @@ int kvm_arch_hardware_enable(void)
 
 int kvm_arch_hardware_setup(void *opaque)
 {
-	return 0;
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

