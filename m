Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5AF6C2A41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 07:14:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PghC41zMYz3cfS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 17:14:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fbe1AhW+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fbe1AhW+;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PghB61lbnz307T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 17:13:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679379214; x=1710915214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hnBlNT0JYpHA6OdQF99prdk7E/49EUK1i8+eAnrjHcQ=;
  b=fbe1AhW+E4lBAVW8+0OZJtvbgb2SZrJJYHhGfX2GccUqkEuFEfi4tj5v
   ZEXftvaU4S5bVCOZ0AJcqIbkwQkeNWvjB1d3cJswOig0jFHBvoxRFk3oC
   wrow2axXfCshf3BmwVfCTXcQ2ImgF1zQ80gCCQzH9TkkKPXAKrTuP5Ctd
   8xKQW5ZABKvTyjQP5DdLpRVHP1zDu1T251yM54XByO+vcB2FvO2dI+SKh
   x8ti7TAm+FR2hNN3ZGg85hHc3BdWhwQGO1Mz/py47qMfp0rRMW+3II80N
   Ad0EyXmNJCmgTTxrDr7CCXmqtVJClbvSAgVHJjnxYVOd21F0Mpz5IQPcl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="340401973"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="340401973"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 23:13:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="713858685"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="713858685"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Mar 2023 23:13:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peVFD-000BfE-38;
	Tue, 21 Mar 2023 06:13:15 +0000
Date: Tue, 21 Mar 2023 14:12:49 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Anatolij Gustschin <agust@denx.de>, Arnd Bergmann <arnd@arndb.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Use of_address_to_resource()
Message-ID: <202303211421.Vzx1L2QW-lkp@intel.com>
References: <20230319163154.225597-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319163154.225597-1-robh@kernel.org>
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

Hi Rob,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/powerpc-Use-of_address_to_resource/20230320-003601
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20230319163154.225597-1-robh%40kernel.org
patch subject: [PATCH] powerpc: Use of_address_to_resource()
config: powerpc-mpc7448_hpc2_defconfig (https://download.01.org/0day-ci/archive/20230321/202303211421.Vzx1L2QW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f382770f629740b86b433db077440e9b5059628a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/powerpc-Use-of_address_to_resource/20230320-003601
        git checkout f382770f629740b86b433db077440e9b5059628a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/sysdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211421.Vzx1L2QW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/powerpc/sysdev/tsi108_dev.c: In function 'get_csrbase':
>> arch/powerpc/sysdev/tsi108_dev.c:50:38: error: invalid type argument of '->' (have 'struct resource')
      50 |                 tsi108_csr_base = res->start;
         |                                      ^~


vim +50 arch/powerpc/sysdev/tsi108_dev.c

    38	
    39	phys_addr_t get_csrbase(void)
    40	{
    41		struct device_node *tsi;
    42	
    43		if (tsi108_csr_base != -1)
    44			return tsi108_csr_base;
    45	
    46		tsi = of_find_node_by_type(NULL, "tsi-bridge");
    47		if (tsi) {
    48			struct resource res;
    49			of_address_to_resource(tsi, 0, &res);
  > 50			tsi108_csr_base = res->start;
    51			of_node_put(tsi);
    52		}
    53		return tsi108_csr_base;
    54	}
    55	EXPORT_SYMBOL(get_csrbase);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
