Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4545F527
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 20:24:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J14Sb3XCmz3cXp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 06:24:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.151; helo=mga17.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J14S84SL9z2xsT
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 06:24:18 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="216415581"
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="216415581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2021 11:23:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,266,1631602800"; d="scan'208";a="539323646"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 26 Nov 2021 11:23:13 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqgoS-0008Tn-Gd; Fri, 26 Nov 2021 19:23:12 +0000
Date: Sat, 27 Nov 2021 03:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: Re: [PATCH v2 9/9] powerpc: Simplify and move arch_randomize_brk()
Message-ID: <202111270342.b1Y85fuz-lkp@intel.com>
References: <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c5a2b18774552c2226573f7069ffeee71ad77cb.1637828367.git.christophe.leroy@csgroup.eu>
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
Cc: linux-mm@kvack.org, kbuild-all@lists.01.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

I love your patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on hnaz-mm/master linus/master v5.16-rc2 next-20211126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211125-162916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc64-buildonly-randconfig-r006-20211125 (https://download.01.org/0day-ci/archive/20211127/202111270342.b1Y85fuz-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/554c475dfb73dc352708dff3589b55845b3dd751
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211125-162916
        git checkout 554c475dfb73dc352708dff3589b55845b3dd751
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/mm/book3s64/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/mm/book3s64/hash_utils.c:2077:15: warning: no previous prototype for 'arch_randomize_brk' [-Wmissing-prototypes]
    2077 | unsigned long arch_randomize_brk(struct mm_struct *mm)
         |               ^~~~~~~~~~~~~~~~~~


vim +/arch_randomize_brk +2077 arch/powerpc/mm/book3s64/hash_utils.c

  2076	
> 2077	unsigned long arch_randomize_brk(struct mm_struct *mm)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
