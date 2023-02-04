Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B12A68A9BA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 13:12:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P8BHR1kt3z3f95
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Feb 2023 23:12:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bkmb2g92;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bkmb2g92;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P8BGS2TKZz3c8T
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Feb 2023 23:11:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675512720; x=1707048720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dhY5A5FxGH/GwLW2q0J1Qv7/pM2fgJjCM0gUqcmlB0I=;
  b=bkmb2g924v482LG1aSjoT5iRnKvI+CVI6tMV0dQMlY9g7WltbkN50QVk
   /bHc4hcohvSZZa99aP7qcSNt5EfHbRHfqhJNkcmBlIFslPK7xim57JhFg
   P9ZaLdrtb0/etJ+8Sgpepff2i5onhkTEbrFTP0S6TEONuku/sg7pu4aoB
   M7O/9o1pZbt0lskZx2m07kqk1XebapMeOGMaXJ7/b7Fu7uOL6Q3U25/ec
   fJL4gDDCSwb6YwPtBIa1ST8tPHine0RpRbbQvZOkxD9R0Aw78xVrSipxS
   +5WjVpY/NukBD20R9w8kWaztGOmZXBkmSVnalI+HWCNWk4RmuJxIJ1y43
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356285710"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="356285710"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 04:11:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734643410"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="734643410"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2023 04:11:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOHOR-0001IC-0M;
	Sat, 04 Feb 2023 12:11:43 +0000
Date: Sat, 4 Feb 2023 20:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 5/5] powerpc: kcsan: Add KCSAN Support
Message-ID: <202302042021.oZyM71gG-lkp@intel.com>
References: <20230201043438.1301212-6-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201043438.1301212-6-rmclure@linux.ibm.com>
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
Cc: Rohan McLure <rmclure@linux.ibm.com>, npiggin@gmail.com, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rohan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-McLure/powerpc-kcsan-Add-exclusions-from-instrumentation/20230201-124058
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230201043438.1301212-6-rmclure%40linux.ibm.com
patch subject: [PATCH v2 5/5] powerpc: kcsan: Add KCSAN Support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230204/202302042021.oZyM71gG-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c8579715105b6133b440d383ce4ab7844c12ab94
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rohan-McLure/powerpc-kcsan-Add-exclusions-from-instrumentation/20230201-124058
        git checkout c8579715105b6133b440d383ce4ab7844c12ab94
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_load':
>> core.c:(.text.__tsan_atomic64_load+0x258): undefined reference to `__atomic_load_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_store':
>> core.c:(.text.__tsan_atomic64_store+0x278): undefined reference to `__atomic_store_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_exchange':
>> core.c:(.text.__tsan_atomic64_exchange+0x278): undefined reference to `__atomic_exchange_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_add':
>> core.c:(.text.__tsan_atomic64_fetch_add+0x278): undefined reference to `__atomic_fetch_add_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_sub':
>> core.c:(.text.__tsan_atomic64_fetch_sub+0x278): undefined reference to `__atomic_fetch_sub_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_and':
>> core.c:(.text.__tsan_atomic64_fetch_and+0x278): undefined reference to `__atomic_fetch_and_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_or':
>> core.c:(.text.__tsan_atomic64_fetch_or+0x278): undefined reference to `__atomic_fetch_or_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_xor':
>> core.c:(.text.__tsan_atomic64_fetch_xor+0x278): undefined reference to `__atomic_fetch_xor_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_fetch_nand':
>> core.c:(.text.__tsan_atomic64_fetch_nand+0x278): undefined reference to `__atomic_fetch_nand_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_strong':
>> core.c:(.text.__tsan_atomic64_compare_exchange_strong+0x26c): undefined reference to `__atomic_compare_exchange_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_weak':
>> core.c:(.text.__tsan_atomic64_compare_exchange_weak+0x26c): undefined reference to `__atomic_compare_exchange_8'
   powerpc-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic64_compare_exchange_val':
>> core.c:(.text.__tsan_atomic64_compare_exchange_val+0x26c): undefined reference to `__atomic_compare_exchange_8'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
