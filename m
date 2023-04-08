Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B34916DBDF7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 01:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PvBFN4Vrkz3fZ9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Apr 2023 09:26:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fq2XhpLb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fq2XhpLb;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PvBDV49Sqz3cNJ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Apr 2023 09:25:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680996330; x=1712532330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=24m5rVm+qs7G49gPwB0KlhA4Br9qDAP8yJ7H8Jh0RCE=;
  b=fq2XhpLb+7Jh2ZC96DBPCJB6fR0zpf+ECvnl6NwoNG82NHPJPUwrda+j
   uCCWnMdAXY1mTYxzToJpyiT51VO0sdcEvZMfdUpYdoavAhIX1qqq3XLIp
   V1/7/e23WuXWi4qz18p0EtJ4s5nS4Heykj0MuPKYNzHfeKGrgY6SFa47G
   Ry3NjuL1y28lHUSoPrHZ4xHl+u3bN82tR94FD6IsP6ZEpTJR0FJHJrwZa
   U4hX6Fv5hMlgGx0p7PGiiBMeGXfI5WMP7cKoiqkkLP21YrRTEl4O+nURq
   7N+00vCQRGXdl4yPKkWgmwiX6i8er8HSRCos/k9PHeesyWgT62wXozhJM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="331836876"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="331836876"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 16:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="687858471"
X-IronPort-AV: E=Sophos;i="5.98,330,1673942400"; 
   d="scan'208";a="687858471"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 08 Apr 2023 16:25:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plHvo-000UCT-1q;
	Sat, 08 Apr 2023 23:25:16 +0000
Date: Sun, 9 Apr 2023 07:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 6/8] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575
 support
Message-ID: <202304090737.4gZF6L8c-lkp@intel.com>
References: <20230408154814.10400-7-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230408154814.10400-7-pali@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Pali,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pali-Roh-r/powerpc-fsl_uli1575-Misc-cleanup/20230408-235055
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230408154814.10400-7-pali%40kernel.org
patch subject: [PATCH v2 6/8] powerpc/fsl_uli1575: Allow to disable FSL_ULI1575 support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230409/202304090737.4gZF6L8c-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c6f089a50f49ce965f0f8ee3a2ab0126cb519366
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pali-Roh-r/powerpc-fsl_uli1575-Misc-cleanup/20230408-235055
        git checkout c6f089a50f49ce965f0f8ee3a2ab0126cb519366
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304090737.4gZF6L8c-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: arch/powerpc/platforms/fsl_uli1575.o: in function `uli_exclude_device':
>> fsl_uli1575.c:(.text+0x36): undefined reference to `fsl_pci_primary'
>> powerpc-linux-ld: fsl_uli1575.c:(.text+0x3e): undefined reference to `fsl_pci_primary'
   powerpc-linux-ld: arch/powerpc/platforms/fsl_uli1575.o: in function `uli_init':
>> fsl_uli1575.c:(.init.text+0x1e): undefined reference to `fsl_pci_primary'
>> powerpc-linux-ld: fsl_uli1575.c:(.init.text+0x7e): undefined reference to `fsl_pci_primary'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
