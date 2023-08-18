Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F8B7806CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 10:01:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YC1o0RkG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RRvTP6JHHz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 18:01:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YC1o0RkG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.65; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RRvSV2s1Zz2yVw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Aug 2023 18:00:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692345642; x=1723881642;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UrMwbZh7etk/SoX6ujozcIHwKlca0dDPqmB5AACzLVw=;
  b=YC1o0RkGZMVi/l448Bsw7ZXRjG5AB0e2AgBA1pGIXCJky3eihBo1mz1s
   9fpQbIloJOlkf1O3fKlpO0hU31HWyviAqniSuKtDqpFad1X3uxMwFuXfo
   v97qkoYqHkm1AWayo3Sl/BCh4JBcA60lVQJbAmBsSRbJLf4LSxuUjKL1+
   nASqflB8KsSbdRZhh+mW1D7RlFzTGnPyOVrhGLXOwNqR3tRVUG3iRhpuF
   YUZK/La/vDRYJcPn1H8OnqFIDKKp1jQuaf1FzwOb5SjvE8P1tPXyDk3KV
   qPbqT7WT3Akq5dRuAtQSw9FVQKUHTeWp5Yk6R1lPg4GoC19E8hSW9Kzfn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="376801920"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="376801920"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 01:00:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="849189503"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="849189503"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 18 Aug 2023 01:00:32 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWuPE-0002FW-2d;
	Fri, 18 Aug 2023 08:00:29 +0000
Date: Fri, 18 Aug 2023 15:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: [powerpc:next-test 21/79]
 arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function
 'simple_feature_tweak'
Message-ID: <202308181501.AR5HMDWC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   c56963d48343b50998bacc6df949217c950163e3
commit: 54f30b83fe627453082f15d83d7820b28b2d24bb [21/79] powerpc: address missing-prototypes warnings
config: powerpc-g5_defconfig (https://download.01.org/0day-ci/archive/20230818/202308181501.AR5HMDWC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181501.AR5HMDWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308181501.AR5HMDWC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/powermac/feature.c:137:19: error: unused function 'simple_feature_tweak' [-Werror,-Wunused-function]
   static inline int simple_feature_tweak(struct device_node *node, int type,
                     ^
   1 error generated.


vim +/simple_feature_tweak +137 arch/powerpc/platforms/powermac/feature.c

14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  132  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  133  /*
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  134   * Here are the chip specific feature functions
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  135   */
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  136  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26 @137  static inline int simple_feature_tweak(struct device_node *node, int type,
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  138  				       int reg, u32 mask, int value)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  139  {
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  140  	struct macio_chip*	macio;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  141  	unsigned long		flags;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  142  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  143  	macio = macio_find(node, type);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  144  	if (!macio)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  145  		return -ENODEV;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  146  	LOCK(flags);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  147  	if (value)
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  148  		MACIO_BIS(reg, mask);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  149  	else
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  150  		MACIO_BIC(reg, mask);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  151  	(void)MACIO_IN32(reg);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  152  	UNLOCK(flags);
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  153  
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  154  	return 0;
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  155  }
14cf11af6cf608 arch/powerpc/platforms/powermac/pmac_feature.c Paul Mackerras 2005-09-26  156  

:::::: The code at line 137 was first introduced by commit
:::::: 14cf11af6cf608eb8c23e989ddb17a715ddce109 powerpc: Merge enough to start building in arch/powerpc.

:::::: TO: Paul Mackerras <paulus@samba.org>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
