Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8434001F6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 17:22:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H1M3K4vpGz2ygC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Sep 2021 01:22:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H1M2v71ftz2xZ3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Sep 2021 01:21:38 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="217587984"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="217587984"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 08:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="467979065"
Received: from lkp-server01.sh.intel.com (HELO 2115029a3e5c) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 03 Sep 2021 08:20:31 -0700
Received: from kbuild by 2115029a3e5c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mMAzW-0000Zv-HR; Fri, 03 Sep 2021 15:20:30 +0000
Date: Fri, 3 Sep 2021 23:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev,
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [RFC PATCH] drivers/nvdimm: nvdimm_pmu_free_hotplug_memory() can be
 static
Message-ID: <20210903151941.GA23182@a0af9ae1a611>
References: <20210903050914.273525-3-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903050914.273525-3-kjain@linux.ibm.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, kbuild-all@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

drivers/nvdimm/nd_perf.c:159:6: warning: symbol 'nvdimm_pmu_free_hotplug_memory' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 nd_perf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvdimm/nd_perf.c b/drivers/nvdimm/nd_perf.c
index 4c49d1bc2a3c6..b129e5e702d59 100644
--- a/drivers/nvdimm/nd_perf.c
+++ b/drivers/nvdimm/nd_perf.c
@@ -156,7 +156,7 @@ static int nvdimm_pmu_cpu_hotplug_init(struct nvdimm_pmu *nd_pmu)
 	return 0;
 }
 
-void nvdimm_pmu_free_hotplug_memory(struct nvdimm_pmu *nd_pmu)
+static void nvdimm_pmu_free_hotplug_memory(struct nvdimm_pmu *nd_pmu)
 {
 	cpuhp_state_remove_instance_nocalls(nd_pmu->cpuhp_state, &nd_pmu->node);
 	cpuhp_remove_multi_state(nd_pmu->cpuhp_state);
