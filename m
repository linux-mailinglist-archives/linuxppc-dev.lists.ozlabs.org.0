Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F18696883E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 17:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P73lK5wxhz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 03:14:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DuKcge+z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DuKcge+z;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P73kN3DrQz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 03:13:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675354428; x=1706890428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FTCexVA2t25KT5Hlrfc45RvAf2A5/jsi+Jv8099TVU=;
  b=DuKcge+z11S9Yo4cOE1s55J5XAFmELop/09bdLOgJq5xp1bjSVXVRC7e
   IjFwxkWO1QI4rbuCw70oVdSkiS+Z5F6LVRsVFpvX4s6/xwm3IUzEUagbS
   Poie2gz1FGmlkEpuHTEgfhx5zMTxL6sNWHGD8nnoJllHyE6UmvSG6ojg8
   02IetUYjWf2/geHYNKCD8ng7dflO+iY+oM2z9iwVjIvYr00/gR9D3no4x
   0Kkqz+tK7mFBpX9ecG7Z6vi4RXztD0zx7bJ0Cr2y8anxhj+aKLbe988/E
   89BhJhGpyjQtmhLzj2JETQNJgr6NFRXr2Ic2eVCuAv/PRTz34qlamrgOZ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="328503610"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="328503610"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 08:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="994149559"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; 
   d="scan'208";a="994149559"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2023 08:13:38 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNcDR-0006em-2D;
	Thu, 02 Feb 2023 16:13:37 +0000
Date: Fri, 3 Feb 2023 00:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: [powerpc:next-test 14/40] arch/powerpc/kernel/pci_32.c:233:5: error:
 no previous prototype for 'pci_device_from_OF_node'
Message-ID: <202302030001.HQPCI490-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next-test
head:   9ffcf6a19dbb2a24de2c2d7b2af1e130986cd565
commit: 869363998da87c80c16ff1221e95b41b2d3cceb2 [14/40] powerpc/pci: Allow to disable filling deprecated pci-OF-bus-map
config: powerpc-buildonly-randconfig-r006-20230202 (https://download.01.org/0day-ci/archive/20230203/202302030001.HQPCI490-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=869363998da87c80c16ff1221e95b41b2d3cceb2
        git remote add powerpc https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
        git fetch --no-tags powerpc next-test
        git checkout 869363998da87c80c16ff1221e95b41b2d3cceb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/pci_32.c:233:5: error: no previous prototype for 'pci_device_from_OF_node' [-Werror=missing-prototypes]
     233 | int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/pci_device_from_OF_node +233 arch/powerpc/kernel/pci_32.c

   229	
   230	/*
   231	 * Returns the PCI device matching a given OF node without pci_to_OF_bus_map
   232	 */
 > 233	int pci_device_from_OF_node(struct device_node *node, u8 *bus, u8 *devfn)
   234	{
   235		const __be32 *reg;
   236		int size;
   237	
   238		/* Check if it might have a chance to be a PCI device */
   239		if (!pci_find_hose_for_OF_device(node))
   240			return -ENODEV;
   241	
   242		reg = of_get_property(node, "reg", &size);
   243		if (!reg || size < 5 * sizeof(u32))
   244			return -ENODEV;
   245	
   246		*bus = (be32_to_cpup(&reg[0]) >> 16) & 0xff;
   247		*devfn = (be32_to_cpup(&reg[0]) >> 8) & 0xff;
   248	
   249		return 0;
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
