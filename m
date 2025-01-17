Return-Path: <linuxppc-dev+bounces-5352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFEBA1484D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 03:34:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZ3jD1kYzz30VP;
	Fri, 17 Jan 2025 13:34:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737081280;
	cv=none; b=IUkXzTI228RoIttwxdi0Z7OjXcwhu5ZY3kyra6a1ECNmk4o1m9LKTzKn0eN/4Z9nHQUHEIN+NcSDdCKsC3QWMElnBbCoocFVKidkCq4zq+3gKT6amTolY6aaDdO/7R23hYaD4cl1Qmn/dNm5Nn/Kk5EdyHDLIw4iY97pAiXezJ8o6b4QI/7vhwJplxn3sJrKaJjpKiwQDMefUd3PQDqPgF0IKxzLNCXpNudbvur6nSNLkj+dzFC7cFNBDCxnaOYYAy6iYLUWPg6Umeq0q8YscQC7TIA4Hkb5G422gdls3lXtR6tN8Ugh8R4TCALDJKSM5+LeD8u/WSFDP812N1D14w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737081280; c=relaxed/relaxed;
	bh=u2lKbXZHyMt4RAtOLSwxcYqnvlCA+WUH2hQXc3LzmDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HK9DYSp7KX36GAubSFhi6E550h+oJ+fM3SQDSjflsIsdagMl0Jyz+t4kM7MglRtbPYAzticiKHY2CkX/qIRhHjKAG/ZnZCDIGCkJV+HAYHslL1MnN16CQLHyiVxPNaj9Hci5knPTe+86Zv5K8Redtj9mj+rVCDSxYf3kBsyzhE3Qyxgdr+NB3LmMP5ZKjMrbRFnoVVZXVseXVDcBau93ksZV/RQSZLXAdYBiy0l9JicJ7S01pWhq7/o11wrDjun8d9xjFMtc0GLFYJbto7RMKt5IBoCtuFsFHrjovN7FkyUvRviLztsyj8ZMv0VVrY4yaBhyhpU/cJEWeWrRHcCc8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWGEzJWm; dkim-atps=neutral; spf=pass (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SWGEzJWm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZ3j94mc6z2ysg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 13:34:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737081278; x=1768617278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IbpOuCB0PVCg0GMj7JYqLyLPivC2fAXTi2lfyteKyjw=;
  b=SWGEzJWmIz7aOMPkN24rzgzeSiAvghI+cqfKMFY1RJErTzXTtNb69Wpk
   AxejKHEx4T8GHUPbhv+jsTVa8Z+zRHnKBXwP6ofMEYufEz9Xx0iLotmLI
   HWIT2MLidg0O7pMCWJtPylptImfjM08qRkJan1Zsc0aYbxC6++L0SRqMC
   n1GhQ9tG7tLYokZTSM1C5WRjvWJxTbMiS5M7B5CB8T8aerUIlvjKi4tSE
   DGPdUZ1wyq+iAtX3tXXd6LlExkLOcpRocyG96m/c79eayhZyaJjkVbKZp
   HJIZXp5kvlYakmdutNqGFatTBBFnCamiM5Gu6mpWSFGPyMNZPfHnxj6A7
   A==;
X-CSE-ConnectionGUID: cMVplBnMTdCjrHKrB+Mxnw==
X-CSE-MsgGUID: PNmcsdN2RsiKD6ZOWC5IIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37735286"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37735286"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 18:34:32 -0800
X-CSE-ConnectionGUID: pLWp/igBRTWuqm7bF9lITA==
X-CSE-MsgGUID: TrgTChtERluJ67P28x4/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128928043"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Jan 2025 18:34:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYcBn-000SdL-09;
	Fri, 17 Jan 2025 02:34:27 +0000
Date: Fri, 17 Jan 2025 10:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Vaibhav Jain <vaibhav@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
	sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
	amachhiw@linux.ibm.com
Subject: Re: [PATCH v2 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
Message-ID: <202501171030.3x0gqW8G-lkp@intel.com>
References: <20250115143948.369379-5-vaibhav@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115143948.369379-5-vaibhav@linux.ibm.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Vaibhav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/topic/ppc-kvm]
[also build test WARNING on powerpc/next powerpc/fixes kvm/queue kvm/next mst-vhost/linux-next linus/master v6.13-rc7 next-20250116]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vaibhav-Jain/powerpc-Document-APIv2-KVM-hcall-spec-for-Hostwide-counters/20250116-024240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
patch link:    https://lore.kernel.org/r/20250115143948.369379-5-vaibhav%40linux.ibm.com
patch subject: [PATCH v2 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific PMU
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20250117/202501171030.3x0gqW8G-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171030.3x0gqW8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171030.3x0gqW8G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kvm_ppc.h:22,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/kvm_book3s.h:357:13: warning: 'kvmppc_unregister_pmu' defined but not used [-Wunused-function]
     357 | static void kvmppc_unregister_pmu(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/kvm_book3s.h:352:12: warning: 'kvmppc_register_pmu' defined but not used [-Wunused-function]
     352 | static int kvmppc_register_pmu(void)
         |            ^~~~~~~~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/kvm_ppc.h:22,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> arch/powerpc/include/asm/kvm_book3s.h:357:13: warning: 'kvmppc_unregister_pmu' defined but not used [-Wunused-function]
     357 | static void kvmppc_unregister_pmu(void)
         |             ^~~~~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/kvm_book3s.h:352:12: warning: 'kvmppc_register_pmu' defined but not used [-Wunused-function]
     352 | static int kvmppc_register_pmu(void)
         |            ^~~~~~~~~~~~~~~~~~~


vim +/kvmppc_unregister_pmu +357 arch/powerpc/include/asm/kvm_book3s.h

   351	
 > 352	static int kvmppc_register_pmu(void)
   353	{
   354		return 0;
   355	}
   356	
 > 357	static void kvmppc_unregister_pmu(void)
   358	{
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

