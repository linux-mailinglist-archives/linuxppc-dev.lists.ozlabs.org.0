Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C845E3C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 01:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0bVR72ftz3c4b
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:39:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0bV11yV3z2xtC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 11:39:15 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="235407339"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="235407339"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 16:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="457515106"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 25 Nov 2021 16:36:57 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mqPEW-000794-NR; Fri, 26 Nov 2021 00:36:56 +0000
Date: Fri, 26 Nov 2021 08:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, alex@ghiti.fr
Subject: Re: [PATCH v2 9/9] powerpc: Simplify and move arch_randomize_brk()
Message-ID: <202111260844.kcgKX5Uk-lkp@intel.com>
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
[also build test WARNING on hnaz-mm/master linus/master v5.16-rc2 next-20211125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211125-162916
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20211126/202111260844.kcgKX5Uk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/554c475dfb73dc352708dff3589b55845b3dd751
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Christophe-Leroy/Convert-powerpc-to-default-topdown-mmap-layout/20211125-162916
        git checkout 554c475dfb73dc352708dff3589b55845b3dd751
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=riscv SHELL=/bin/bash drivers/net/wireless/mediatek/mt76/mt7915/ drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pci-xgene.c:52: warning: "SZ_1T" redefined
      52 | #define SZ_1T                           (SZ_1G*1024ULL)
         | 
   In file included from arch/riscv/include/asm/pgtable.h:10,
                    from include/linux/pgtable.h:6,
                    from arch/riscv/include/asm/io.h:15,
                    from include/linux/io.h:13,
                    from drivers/pci/controller/pci-xgene.c:11:
   include/linux/sizes.h:51: note: this is the location of the previous definition
      51 | #define SZ_1T                           _AC(0x10000000000, ULL)
         | 


vim +/SZ_1T +52 drivers/pci/controller/pci-xgene.c

5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  45  
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  46  #define LINK_UP_MASK			0x00000100
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  47  #define AXI_EP_CFG_ACCESS		0x10000
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  48  #define EN_COHERENCY			0xF0000000
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  49  #define EN_REG				0x00000001
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  50  #define OB_LO_IO			0x00000002
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  51  #define XGENE_PCIE_DEVICEID		0xE004
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01 @52  #define SZ_1T				(SZ_1G*1024ULL)
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  53  #define PIPE_PHY_RATE_RD(src)		((0xc000 & (u32)(src)) >> 0xe)
5f6b6ccdbe1cdfa drivers/pci/host/pci-xgene.c Tanmay Inamdar 2014-10-01  54  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
