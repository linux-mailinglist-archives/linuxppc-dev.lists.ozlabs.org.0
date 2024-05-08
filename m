Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37F8BF363
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 02:14:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QEqihIfT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYwd20r11z3cFN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 10:14:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QEqihIfT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYwcF6Kxhz30TN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 10:14:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715127246; x=1746663246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KlZGcKHOCwyvQnVPkYIgOSg/daK0tJkCNOhIwL1thy8=;
  b=QEqihIfTN6+OkKA8YoGgMHFrEFCyUj3aHF85uJOTi0uuAxoo1Uky4XqJ
   CQG6a5yxNKj0g0gGEw08i6vCeKLusMbvR+wMCIzGHqTr1nAko3XEyvPS4
   m54k4nJDQ3xWtD38bGupo9ysn9vJAX26JBmLmSgmIXmnBcJz1tVmk1laj
   6JGiGpmw0PjACcv99hboI0YW7BAecFHaA5+FGbEmBmWx66QDjxJ4PN2He
   94L5EGRhlMSn/BRjTzhyYFLEUXnZ3JSoYmLJoA/7cbjuXkwo3dg7Lr8uN
   6uyFMbeuSEnJK1SqWe82eyc/OrhdQkqnq03QpGj4z0UmM0TFoSegwKrPt
   g==;
X-CSE-ConnectionGUID: 2ZPlA2uYQV+8vj3Pma8o2w==
X-CSE-MsgGUID: 2aMNnievReyuFhF+tee0qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10899175"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="10899175"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 17:14:01 -0700
X-CSE-ConnectionGUID: ozBPJ5lsRMK0owkEt7/w6Q==
X-CSE-MsgGUID: LSXQiHGFTA6Byr7pN/S39w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33392994"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2024 17:13:57 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4UwT-0002lw-30;
	Wed, 08 May 2024 00:13:53 +0000
Date: Wed, 8 May 2024 08:13:18 +0800
From: kernel test robot <lkp@intel.com>
To: Vignesh Balasubramanian <vigbalas@amd.com>,
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Message-ID: <202405080809.LGYhRYu3-lkp@intel.com>
References: <20240507095330.2674-2-vigbalas@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507095330.2674-2-vigbalas@amd.com>
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
Cc: felix.willgerodt@intel.com, x86@kernel.org, keescook@chromium.org, jhb@freebsd.org, bpetkov@amd.com, binutils@sourceware.org, llvm@lists.linux.dev, aneesh.kumar@kernel.org, linux-mm@kvack.org, Vignesh Balasubramanian <vigbalas@amd.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, jinisusan.george@amd.com, matz@suse.de, ebiederm@xmission.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vignesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on tip/x86/core kees/for-next/pstore kees/for-next/kspp linus/master v6.9-rc7 next-20240507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vignesh-Balasubramanian/x86-elf-Add-a-new-note-section-containing-Xfeatures-information-to-x86-core-files/20240507-175615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/20240507095330.2674-2-vigbalas%40amd.com
patch subject: [PATCH v2 1/1] x86/elf: Add a new .note section containing Xfeatures information to x86 core files
config: i386-randconfig-013-20240508 (https://download.01.org/0day-ci/archive/20240508/202405080809.LGYhRYu3-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080809.LGYhRYu3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080809.LGYhRYu3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/fpu/xstate.c:91:19: warning: unused variable 'owner_name' [-Wunused-const-variable]
      91 | static const char owner_name[] = "LINUX";
         |                   ^~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]


vim +/owner_name +91 arch/x86/kernel/fpu/xstate.c

    90	
  > 91	static const char owner_name[] = "LINUX";
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
