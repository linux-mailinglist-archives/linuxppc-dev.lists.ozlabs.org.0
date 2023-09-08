Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A87A0798A33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 17:49:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NN8Z7r6K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rj0sL46xjz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Sep 2023 01:49:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NN8Z7r6K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rj0rR0c7Kz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Sep 2023 01:48:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694188103; x=1725724103;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7lZwzD4Jl1j1hHG9SxEpqmUzote7v9725kYKuPdquWo=;
  b=NN8Z7r6KDHsUQqeDfLmspeBkomDR2CDGr4lD4Bjx5qU3qO/0gGXdFvDQ
   R13ILWsZavL8jd0kSfL5ifNo+XKxeTnW+5iMowivmbdry+0nISCsnB/CD
   pZrIpCQ3JIiZwMKv51ZEqc68GsUTLNffJRZ+SJXbtMxpi2PGK3qWWY35d
   CsBy9gjAQjJxjONr97W/kdvB2nNnrh4Zw/TTX+qqJCkfFXPCQ9TACJ1iJ
   ZR289Hbtrwdgudak4W8nG7j3ieagD+Q69K2S9DA/1F5IIQlZzJ0zjb0sH
   UIzSo8dvblMgfAZKI54qXRqYU/U1m8JIUVesmfd24gJp+1PfPe7znuX+W
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="444113426"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="444113426"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 08:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719194428"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; 
   d="scan'208";a="719194428"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Sep 2023 08:48:12 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qediM-0002PR-2W;
	Fri, 08 Sep 2023 15:48:10 +0000
Date: Fri, 8 Sep 2023 23:47:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv5 1/3] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Message-ID: <202309082357.FUmBMhC4-lkp@intel.com>
References: <20230908141941.13660-2-piliu@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908141941.13660-2-piliu@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, Pingfan Liu <piliu@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Ming Lei <ming.lei@redhat.com>, Wen Xiong <wenxiong@linux.ibm.com>, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pingfan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[also build test ERROR on linus/master v6.5 next-20230908]
[cannot apply to powerpc/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pingfan-Liu/powerpc-setup-Loosen-the-mapping-between-cpu-logical-id-and-its-seq-in-dt/20230908-222430
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/20230908141941.13660-2-piliu%40redhat.com
patch subject: [PATCHv5 1/3] powerpc/setup: Loosen the mapping between cpu logical id and its seq in dt
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230908/202309082357.FUmBMhC4-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309082357.FUmBMhC4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309082357.FUmBMhC4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/kernel/prom.c: In function 'early_init_dt_scan_cpus':
   arch/powerpc/kernel/prom.c:365:44: error: lvalue required as left operand of assignment
     365 |                                 nr_cpu_ids = nthreads;
         |                                            ^
   arch/powerpc/kernel/prom.c: At top level:
>> arch/powerpc/kernel/prom.c:79:23: error: 'boot_cpu_count' defined but not used [-Werror=unused-variable]
      79 | static int __initdata boot_cpu_count;
         |                       ^~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/boot_cpu_count +79 arch/powerpc/kernel/prom.c

c1e53367dab15e Srikar Dronamraju      2021-04-15  70  
9b6b563c0d2d25 Paul Mackerras         2005-10-06  71  #ifdef CONFIG_PPC64
28897731318dc8 Olof Johansson         2006-04-12  72  int __initdata iommu_is_off;
9b6b563c0d2d25 Paul Mackerras         2005-10-06  73  int __initdata iommu_force_on;
cf00a8d18b9a1c Paul Mackerras         2005-10-31  74  unsigned long tce_alloc_start, tce_alloc_end;
cd3db0c4ca3d23 Benjamin Herrenschmidt 2010-07-06  75  u64 ppc64_rma_size;
e13d23a404f2e6 Laurent Dufour         2022-11-10  76  unsigned int boot_cpu_node_count __ro_after_init;
9b6b563c0d2d25 Paul Mackerras         2005-10-06  77  #endif
03bf469add176a Benjamin Herrenschmidt 2011-05-11  78  static phys_addr_t first_memblock_size;
7ac87abb8166b9 Matt Evans             2011-05-25 @79  static int __initdata boot_cpu_count;
9b6b563c0d2d25 Paul Mackerras         2005-10-06  80  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
