Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35671866E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 17:33:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWYFR04j8z3fJv
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 01:33:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g2Ftknds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g2Ftknds;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWYDX3fdkz3f4B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 01:32:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685547164; x=1717083164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ToAgdbmYyBTVciOEZca9OHnOGaVAyu/4tvM8ja+xqKI=;
  b=g2FtkndsoeO263+ZZ1NCyOo8FDRqvJfoQM5lxxVNJBWwE2/FLsIncePI
   DqCJYp/o0BZen6BQ8QbHJ8Uq9nlfOyM39mAautd8CWZi9cVyov9UMRN+7
   8GzLOvnpWxBZAYV/o7yiZadc+4A1iBwPOHVRKV4IbZ01TmMRVO1A6zIs/
   BWbne+zRl0Lc0oai3v1Q8eYmqkEa15/zrXkOmL002r7tbPO2PIrYOvepH
   o2ayUP8vbxmVYSXq48r4vkRt/+DiXfHZkif+OiLtekzRTshGNIhK8yoFE
   6C7CHg8e2gqEFxYzCI0l9nX+nRkaRmVAyXYcfh/rUOoAnuj5+V5pX+eGd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="354116852"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="354116852"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 08:32:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="701140918"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="701140918"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 31 May 2023 08:32:29 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4NoL-0001Qj-0K;
	Wed, 31 May 2023 15:32:29 +0000
Date: Wed, 31 May 2023 23:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [powerpc:topic/cpu-smt 6/9] kernel/cpu.c:2583:36: error:
 'cpu_smt_max_threads' undeclared; did you mean 'cpu_smt_num_threads'?
Message-ID: <202305312356.SfvJ8Iwh-lkp@intel.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/cpu-smt
head:   7bb712baeffc4640f5511feec68add6f1767413f
commit: 570b70824d468facd197e44b6d40c9e79886b81c [6/9] cpu/SMT: Allow enabling partial SMT states via sysfs
config: parisc-defconfig (https://download.01.org/0day-ci/archive/20230531/202305312356.SfvJ8Iwh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=570b70824d468facd197e44b6d40c9e79886b81c
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc topic/cpu-smt
        git checkout 570b70824d468facd197e44b6d40c9e79886b81c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=parisc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305312356.SfvJ8Iwh-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cpu.c: In function 'control_show':
>> kernel/cpu.c:2583:36: error: 'cpu_smt_max_threads' undeclared (first use in this function); did you mean 'cpu_smt_num_threads'?
    2583 |             cpu_smt_num_threads != cpu_smt_max_threads)
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    cpu_smt_num_threads
   kernel/cpu.c:2583:36: note: each undeclared identifier is reported only once for each function it appears in


vim +2583 kernel/cpu.c

  2571	
  2572	static ssize_t control_show(struct device *dev,
  2573				    struct device_attribute *attr, char *buf)
  2574	{
  2575		const char *state = smt_states[cpu_smt_control];
  2576	
  2577		/*
  2578		 * If SMT is enabled but not all threads are enabled then show the
  2579		 * number of threads. If all threads are enabled show "on". Otherwise
  2580		 * show the state name.
  2581		 */
  2582		if (cpu_smt_control == CPU_SMT_ENABLED &&
> 2583		    cpu_smt_num_threads != cpu_smt_max_threads)
  2584			return sysfs_emit(buf, "%d\n", cpu_smt_num_threads);
  2585	
  2586		return snprintf(buf, PAGE_SIZE - 2, "%s\n", state);
  2587	}
  2588	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
