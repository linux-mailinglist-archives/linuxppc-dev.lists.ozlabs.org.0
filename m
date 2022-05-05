Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D351B507
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 03:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtwVF3ZQLz3bqd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 11:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OcdiUsjO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OcdiUsjO; dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtwTb3M2Wz2ymf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 11:04:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651712691; x=1683248691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HOTvegPQV0wBWkw4gry8ln/1sFHr7kpC/Ihf5d3BMQE=;
 b=OcdiUsjOQZlDfB7XcrOCnq6q38VRyptnKJTSbaVrJMb4HWMCfpqTH1sn
 iGESjWZn+so3F/Jk/dY0TaD4jyxwkMDucm1J8V1ndNfra6e4MT0fcKRUt
 lr2vWsNF66qZnh6z9ha7l/BaVwrib4PjVJvA5G1Zlwtcm3VZ0Q13cxX/7
 Av17OL8iiKUcza1ofqPLiWyMiFNFyf7Y/xqIek69rBxw6LzVuWth3Ldd6
 xcjihrT807vXeF5x9QVS6NnNkeKnTkgoq9VYiSwAnRRsCgufNfkQ7WdwE
 297NGoJmsYlnOsKDWy9CTgi+snrc7pNDie89p1JV+vZ49xsDoXQddomsg A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266791339"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="266791339"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 18:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="621059599"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 04 May 2022 18:03:36 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nmPu4-000Bws-2c;
 Thu, 05 May 2022 01:03:36 +0000
Date: Thu, 5 May 2022 09:03:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Wolfram Sang <wsa-dev@sang-engineering.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v1 2/4] powerpc/mpc5xxx: Switch
 mpc5xxx_get_bus_frequency() to use fwnode
Message-ID: <202205050858.278Tyg5Q-lkp@intel.com>
References: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504134449.64473-2-andriy.shevchenko@linux.intel.com>
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
Cc: Paolo Abeni <pabeni@redhat.com>, kbuild-all@lists.01.org,
 netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Mark Brown <broonie@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Anatolij Gustschin <agust@denx.de>, Wolfgang Grandegger <wg@grandegger.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on powerpc/next]
[also build test ERROR on wsa/i2c/for-next mkl-can-next/testing broonie-spi/for-next tty/tty-testing linus/master v5.18-rc5 next-20220504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/powerpc-52xx-Remove-dead-code-i-e-mpc52xx_get_xtal_freq/20220504-215701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: powerpc-pcm030_defconfig (https://download.01.org/0day-ci/archive/20220505/202205050858.278Tyg5Q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7bff10cee4f441153a56de337715dd4f40c55521
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/powerpc-52xx-Remove-dead-code-i-e-mpc52xx_get_xtal_freq/20220504-215701
        git checkout 7bff10cee4f441153a56de337715dd4f40c55521
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-mpc.c: In function 'mpc_i2c_get_fdr_52xx':
>> drivers/i2c/busses/i2c-mpc.c:242:30: error: expected identifier or '(' before '=' token
     242 |         struct fwnode_handle = of_fwnode_handle(node);
         |                              ^
   In file included from include/linux/of_address.h:6,
                    from drivers/i2c/busses/i2c-mpc.c:14:
>> include/linux/of.h:176:10: error: expected statement before ')' token
     176 |         })
         |          ^
   drivers/i2c/busses/i2c-mpc.c:242:32: note: in expansion of macro 'of_fwnode_handle'
     242 |         struct fwnode_handle = of_fwnode_handle(node);
         |                                ^~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-mpc.c:243:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     243 |         const struct mpc_i2c_divider *div = NULL;
         |         ^~~~~
>> drivers/i2c/busses/i2c-mpc.c:250:62: error: 'fwnode' undeclared (first use in this function); did you mean 'node'?
     250 |                 *real_clk = mpc5xxx_fwnode_get_bus_frequency(fwnode) / 2048;
         |                                                              ^~~~~~
         |                                                              node
   drivers/i2c/busses/i2c-mpc.c:250:62: note: each undeclared identifier is reported only once for each function it appears in


vim +242 drivers/i2c/busses/i2c-mpc.c

   238	
   239	static int mpc_i2c_get_fdr_52xx(struct device_node *node, u32 clock,
   240						  u32 *real_clk)
   241	{
 > 242		struct fwnode_handle = of_fwnode_handle(node);
   243		const struct mpc_i2c_divider *div = NULL;
   244		unsigned int pvr = mfspr(SPRN_PVR);
   245		u32 divider;
   246		int i;
   247	
   248		if (clock == MPC_I2C_CLOCK_LEGACY) {
   249			/* see below - default fdr = 0x3f -> div = 2048 */
 > 250			*real_clk = mpc5xxx_fwnode_get_bus_frequency(fwnode) / 2048;
   251			return -EINVAL;
   252		}
   253	
   254		/* Determine divider value */
   255		divider = mpc5xxx_fwnode_get_bus_frequency(fwnode) / clock;
   256	
   257		/*
   258		 * We want to choose an FDR/DFSR that generates an I2C bus speed that
   259		 * is equal to or lower than the requested speed.
   260		 */
   261		for (i = 0; i < ARRAY_SIZE(mpc_i2c_dividers_52xx); i++) {
   262			div = &mpc_i2c_dividers_52xx[i];
   263			/* Old MPC5200 rev A CPUs do not support the high bits */
   264			if (div->fdr & 0xc0 && pvr == 0x80822011)
   265				continue;
   266			if (div->divider >= divider)
   267				break;
   268		}
   269	
   270		*real_clk = mpc5xxx_fwnode_get_bus_frequency(fwnode) / div->divider;
   271		return (int)div->fdr;
   272	}
   273	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
