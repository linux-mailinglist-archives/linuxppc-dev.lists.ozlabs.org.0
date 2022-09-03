Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249E5ABF85
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 17:25:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKdrq1nM6z3bpn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 01:25:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjibKFNr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Two or more type TXT spf records found.) smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjibKFNr;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKdr85Hp2z2y84
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 01:24:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662218697; x=1693754697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OUU011FZbdLoXmMTaSzRBkmckoLbRAk09nLoSqxKOnY=;
  b=TjibKFNr8ANViIvNvPZ4iXE8/f+D8GmC38RXJIqdiUP3NeiDrEgxKrrw
   GIUFknIFigdBUmqGPan2yDUlSK7bQKTqg625zRyx0PgkA+WhBftxZuX/p
   tjaF7zVvHThpeXASsK06c5AoYqV2pInYkjwTjrNOLFnGD5lNTW8l8PkZo
   X7i/NomfiO2KHj/IgGjwLFJcGAiutAuzJyKzWyc+aI7twmN9yoshRrLmY
   fyPFqHxy0plOJLGgDPX+7cwVCzOMZielHGsZMuwElhs3Ex6+OghVC5XqC
   LJcYKe5e5j/d5cOnbZO8c/uaC7cU6yfl/4SMOoVhGSp5MHZiyGwX3S+X5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10459"; a="283155757"
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="283155757"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2022 08:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,287,1654585200"; 
   d="scan'208";a="609267503"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 03 Sep 2022 08:24:43 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUV0l-0001p9-0u;
	Sat, 03 Sep 2022 15:24:43 +0000
Date: Sat, 3 Sep 2022 23:23:44 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 4/8] phy: fsl: Add Lynx 10G SerDes driver
Message-ID: <202209032301.fWPibuKq-lkp@intel.com>
References: <20220902213721.946138-5-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-5-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

I love your patch! Yet something to improve:

[auto build test ERROR on shawnguo/for-next]
[also build test ERROR on robh/for-next clk/clk-next arm/for-next arm64/for-next/core rockchip/for-next soc/for-next linus/master v6.0-rc3]
[cannot apply to xilinx-xlnx/master next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220903/202209032301.fWPibuKq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/phy-Add-support-for-Lynx-10G-SerDes/20220903-053840
        git checkout cbfe9294ef583cc8dffd9cebf9ff325bbcdb4cef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_recalc_rate':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:255:25: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     255 |         u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
         |                         ^~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_pll_set_rate':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:340:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     340 |         cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
         |                ^~~~~~~~~~
   drivers/phy/freescale/phy-fsl-lynx-10g-clk.c: In function 'lynx_clk_init':
>> drivers/phy/freescale/phy-fsl-lynx-10g-clk.c:466:9: error: implicit declaration of function 'kfree'; did you mean 'vfree'? [-Werror=implicit-function-declaration]
     466 |         kfree(ref_name);
         |         ^~~~~
         |         vfree
   cc1: some warnings being treated as errors


vim +/FIELD_GET +255 drivers/phy/freescale/phy-fsl-lynx-10g-clk.c

   249	
   250	static unsigned long lynx_pll_recalc_rate(struct clk_hw *hw,
   251						  unsigned long parent_rate)
   252	{
   253		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   254		u32 cr0 = lynx_read(clk, PLLaCR0(clk->idx));
 > 255		u32 frate_sel = FIELD_GET(PLLaCR0_FRATE_SEL, cr0);
   256		u32 rfclk_sel = FIELD_GET(PLLaCR0_RFCLK_SEL, cr0);
   257		u32 ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   258		unsigned long ret;
   259	
   260		/* Ensure that the parent matches our rfclk selector */
   261		if (rfclk_sel == lynx_rfclk_to_sel(parent_rate))
   262			ret = mult_frac(parent_rate, ratio, HZ_PER_KHZ);
   263		else
   264			ret = 0;
   265	
   266		dev_dbg(clk->dev, "recalc pll%d new=%llu parent=%lu\n", clk->idx,
   267			(u64)ret * HZ_PER_KHZ, parent_rate);
   268		return ret;
   269	}
   270	
   271	static long lynx_pll_round_rate(struct clk_hw *hw, unsigned long rate_khz,
   272					unsigned long *parent_rate)
   273	{
   274		int frate_sel, rfclk_sel;
   275		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   276		u32 ratio;
   277	
   278		dev_dbg(clk->dev, "round pll%d new=%llu parent=%lu\n", clk->idx,
   279			(u64)rate_khz * HZ_PER_KHZ, *parent_rate);
   280	
   281		frate_sel = lynx_frate_to_sel(rate_khz);
   282		if (frate_sel < 0)
   283			return frate_sel;
   284	
   285		/* Try the current parent rate */
   286		rfclk_sel = lynx_rfclk_to_sel(*parent_rate);
   287		if (rfclk_sel >= 0) {
   288			ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   289			if (ratio)
   290				return mult_frac(*parent_rate, ratio, HZ_PER_KHZ);
   291		}
   292	
   293		/* Try all possible parent rates */
   294		for (rfclk_sel = 0;
   295		     rfclk_sel < ARRAY_SIZE(rfclk_sel_map);
   296		     rfclk_sel++) {
   297			unsigned long new_parent_rate;
   298	
   299			ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   300			if (!ratio)
   301				continue;
   302	
   303			/* Ensure the reference clock can produce this rate */
   304			new_parent_rate = rfclk_sel_map[rfclk_sel];
   305			new_parent_rate = clk_hw_round_rate(clk->ref, new_parent_rate);
   306			if (rfclk_sel != lynx_rfclk_to_sel(new_parent_rate))
   307				continue;
   308	
   309			*parent_rate = new_parent_rate;
   310			return mult_frac(new_parent_rate, ratio, HZ_PER_KHZ);
   311		}
   312	
   313		return -EINVAL;
   314	}
   315	
   316	static int lynx_pll_set_rate(struct clk_hw *hw, unsigned long rate_khz,
   317				   unsigned long parent_rate)
   318	{
   319		int frate_sel, rfclk_sel;
   320		struct lynx_clk *clk = lynx_pll_to_clk(hw);
   321		u32 ratio, cr0 = lynx_read(clk, PLLaCR0(clk->idx));
   322	
   323		dev_dbg(clk->dev, "set rate pll%d new=%llu parent=%lu\n", clk->idx,
   324			(u64)rate_khz * HZ_PER_KHZ, parent_rate);
   325	
   326		frate_sel = lynx_frate_to_sel(rate_khz);
   327		if (frate_sel < 0)
   328			return frate_sel;
   329	
   330		rfclk_sel = lynx_rfclk_to_sel(parent_rate);
   331		if (rfclk_sel < 0)
   332			return rfclk_sel;
   333	
   334		ratio = lynx_pll_ratio(frate_sel, rfclk_sel);
   335		if (!ratio)
   336			return -EINVAL;
   337	
   338		lynx_pll_stop(clk);
   339		cr0 &= ~(PLLaCR0_RFCLK_SEL | PLLaCR0_FRATE_SEL);
 > 340		cr0 |= FIELD_PREP(PLLaCR0_RFCLK_SEL, rfclk_sel);
   341		cr0 |= FIELD_PREP(PLLaCR0_FRATE_SEL, frate_sel);
   342		lynx_write(clk, cr0, PLLaCR0(clk->idx));
   343		/* Don't bother resetting if it's off */
   344		if (cr0 & PLLaCR0_POFF)
   345			return 0;
   346		return lynx_pll_reset(clk);
   347	}
   348	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
