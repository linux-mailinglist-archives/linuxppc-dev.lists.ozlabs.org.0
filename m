Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4BD6BD88D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 20:04:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcxXG1nmwz3f5L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 06:04:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFtJU3VG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QFtJU3VG;
	dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcxWJ3F1Xz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 06:03:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678993436; x=1710529436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUzkGxrqKDPR6SroJseKwSx7MVAGnpL/Grdhlw6b7UE=;
  b=QFtJU3VGP4l9HK2s7GvDUm+lpnHl/WDpL1FUrwtq3aBVK8HRS5j7uRFF
   poeVtavTCwM2nni+I9KWlELpe3Zy8YWw0venxLV5Gmc9zjH7GrYZA20eL
   +1eO3o3shrHuC1lnwECakb3ITE3tJDJjIjAfVtoV2c1k6Z0e7CuXbQfiz
   MJpY3E4bYucKQDm8fj5rK/fNFUhmU4afDMiHgJsXkWabdpwucFFygzpRt
   IPR6Pyb4L5+FoGGFAFlMpubYP/WCMAiN2jBKlldi9myt5A82WXDNZeJIX
   bLu7g7GHtpsj818SsveIcJSE1jBzidLZqLmXIhtJfrBorl+2WoLrZ+xdY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="321944559"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321944559"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:03:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="925864625"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="925864625"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Mar 2023 12:03:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcst1-0008hW-1B;
	Thu, 16 Mar 2023 19:03:39 +0000
Date: Fri, 17 Mar 2023 03:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v5 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <202303170223.V0xQhs1V-lkp@intel.com>
References: <20230314192634.63531-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314192634.63531-2-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, llvm@lists.linux.dev, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, oe-kbuild-all@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus powerpc/next powerpc/fixes linus/master v6.3-rc2 next-20230316]
[cannot apply to soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230315-032821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230314192634.63531-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v5 1/4] PCI: Introduce pci_dev_for_each_resource()
config: powerpc-randconfig-r032-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170223.V0xQhs1V-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/85cdf4746b716f7b6c14d7dc5cd907c3c2a1fb0c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/PCI-Introduce-pci_dev_for_each_resource/20230315-032821
        git checkout 85cdf4746b716f7b6c14d7dc5cd907c3c2a1fb0c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170223.V0xQhs1V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/platforms/52xx/mpc52xx_pci.c:331:6: error: unused variable 'i' [-Werror,-Wunused-variable]
           int i;
               ^
   1 error generated.


vim +/i +331 arch/powerpc/platforms/52xx/mpc52xx_pci.c

f42963f8646540 Grant Likely    2006-12-12  326  
f42963f8646540 Grant Likely    2006-12-12  327  static void
f42963f8646540 Grant Likely    2006-12-12  328  mpc52xx_pci_fixup_resources(struct pci_dev *dev)
f42963f8646540 Grant Likely    2006-12-12  329  {
85cdf4746b716f Mika Westerberg 2023-03-14  330  	struct resource *res;
f42963f8646540 Grant Likely    2006-12-12 @331  	int i;
f42963f8646540 Grant Likely    2006-12-12  332  
59510820fff76f Randy Dunlap    2021-04-28  333  	pr_debug("%s() %.4x:%.4x\n", __func__, dev->vendor, dev->device);
f42963f8646540 Grant Likely    2006-12-12  334  
f42963f8646540 Grant Likely    2006-12-12  335  	/* We don't rely on boot loader for PCI and resets all
f42963f8646540 Grant Likely    2006-12-12  336  	   devices */
85cdf4746b716f Mika Westerberg 2023-03-14  337  	pci_dev_for_each_resource_p(dev, res) {
f42963f8646540 Grant Likely    2006-12-12  338  		if (res->end > res->start) {	/* Only valid resources */
f42963f8646540 Grant Likely    2006-12-12  339  			res->end -= res->start;
f42963f8646540 Grant Likely    2006-12-12  340  			res->start = 0;
f42963f8646540 Grant Likely    2006-12-12  341  			res->flags |= IORESOURCE_UNSET;
f42963f8646540 Grant Likely    2006-12-12  342  		}
f42963f8646540 Grant Likely    2006-12-12  343  	}
f42963f8646540 Grant Likely    2006-12-12  344  
f42963f8646540 Grant Likely    2006-12-12  345  	/* The PCI Host bridge of MPC52xx has a prefetch memory resource
f42963f8646540 Grant Likely    2006-12-12  346  	   fixed to 1Gb. Doesn't fit in the resource system so we remove it */
f42963f8646540 Grant Likely    2006-12-12  347  	if ( (dev->vendor == PCI_VENDOR_ID_MOTOROLA) &&
f42963f8646540 Grant Likely    2006-12-12  348  	     (   dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200
f42963f8646540 Grant Likely    2006-12-12  349  	      || dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200B) ) {
f42963f8646540 Grant Likely    2006-12-12  350  		struct resource *res = &dev->resource[1];
f42963f8646540 Grant Likely    2006-12-12  351  		res->start = res->end = res->flags = 0;
f42963f8646540 Grant Likely    2006-12-12  352  	}
f42963f8646540 Grant Likely    2006-12-12  353  }
f42963f8646540 Grant Likely    2006-12-12  354  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
