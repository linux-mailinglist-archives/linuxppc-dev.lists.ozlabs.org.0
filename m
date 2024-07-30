Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEA09403F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 03:45:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHshaPTt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXyjH06wlz3cZn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 11:45:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NHshaPTt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXyhY0TX3z3cRK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 11:44:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722303885; x=1753839885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZJ4h99ImY+2oP4Sskf6keETl1QtUFHaS319Xw0QpYc=;
  b=NHshaPTtKtoq8wGnoaQfNf1aIlbCI0/0T/xfwIKFfm0n2OupvdwASCw3
   r572y0V60vX4utekOrpojwFOQ+x+OOkwfN/g9k3Vxe1uBnMmNdTKxyL3L
   S4YUjmU8gL1Hu04czJNqxhFLz6lU0jb39FEKTZzLzCArkv8MwTOBQZScI
   pochkOZKcT9Cx2k05OUTGXffLoW9WSI1r807/ARZ+Q6yVa+okHszDgtVl
   K6YC78lXN/V7Ap2lxft0/LNYW2sCPG6G1eHXxIzBPOGPwBcbAZWpQ3t8W
   saArTbncKrJCapoM1hZTwT31xlr9h+/yeS2zOnKhk5pkazXTKZnuZF8HW
   w==;
X-CSE-ConnectionGUID: Fv0rnx9jQqm92VQHMX7b4g==
X-CSE-MsgGUID: WFxsY7iTStq9gm0QWufq5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="30682539"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="30682539"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 18:44:17 -0700
X-CSE-ConnectionGUID: 9kb3DgLBSDSr5M0vXOVcVg==
X-CSE-MsgGUID: 98rbFDwDS/W3iX2y4S3AyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="54136544"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Jul 2024 18:44:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbuN-000sIi-0F;
	Tue, 30 Jul 2024 01:44:11 +0000
Date: Tue, 30 Jul 2024 09:43:42 +0800
From: kernel test robot <lkp@intel.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 14/36] soc: fsl: cpm1: tsa: Add support for QUICC
 Engine (QE) implementation
Message-ID: <202407300923.HVotne4K-lkp@intel.com>
References: <20240729142107.104574-15-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729142107.104574-15-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Herve,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc1 next-20240729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herve-Codina/soc-fsl-cpm1-qmc-Update-TRNSYNC-only-in-transparent-mode/20240730-001631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240729142107.104574-15-herve.codina%40bootlin.com
patch subject: [PATCH v1 14/36] soc: fsl: cpm1: tsa: Add support for QUICC Engine (QE) implementation
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240730/202407300923.HVotne4K-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407300923.HVotne4K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407300923.HVotne4K-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/fsl/qe/tsa.c:984:17: warning: cast to smaller integer type 'enum tsa_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     984 |         tsa->version = (enum tsa_version)of_device_get_match_data(&pdev->dev);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +984 drivers/soc/fsl/qe/tsa.c

7f6697511df485 Herve Codina 2024-07-29   970  
1d4ba0b81c1cf2 Herve Codina 2023-02-17   971  static int tsa_probe(struct platform_device *pdev)
1d4ba0b81c1cf2 Herve Codina 2023-02-17   972  {
1d4ba0b81c1cf2 Herve Codina 2023-02-17   973  	struct device_node *np = pdev->dev.of_node;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   974  	struct resource *res;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   975  	struct tsa *tsa;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   976  	unsigned int i;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   977  	int ret;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   978  
1d4ba0b81c1cf2 Herve Codina 2023-02-17   979  	tsa = devm_kzalloc(&pdev->dev, sizeof(*tsa), GFP_KERNEL);
1d4ba0b81c1cf2 Herve Codina 2023-02-17   980  	if (!tsa)
1d4ba0b81c1cf2 Herve Codina 2023-02-17   981  		return -ENOMEM;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   982  
1d4ba0b81c1cf2 Herve Codina 2023-02-17   983  	tsa->dev = &pdev->dev;
3d16c3ebcd1ae6 Herve Codina 2024-07-29  @984  	tsa->version = (enum tsa_version)of_device_get_match_data(&pdev->dev);
3d16c3ebcd1ae6 Herve Codina 2024-07-29   985  	switch (tsa->version) {
3d16c3ebcd1ae6 Herve Codina 2024-07-29   986  	case TSA_CPM1:
3d16c3ebcd1ae6 Herve Codina 2024-07-29   987  		dev_info(tsa->dev, "CPM1 version\n");
3d16c3ebcd1ae6 Herve Codina 2024-07-29   988  		break;
b76939bef42d1d Herve Codina 2024-07-29   989  	case TSA_QE:
b76939bef42d1d Herve Codina 2024-07-29   990  		dev_info(tsa->dev, "QE version\n");
b76939bef42d1d Herve Codina 2024-07-29   991  		break;
3d16c3ebcd1ae6 Herve Codina 2024-07-29   992  	default:
3d16c3ebcd1ae6 Herve Codina 2024-07-29   993  		dev_err(tsa->dev, "Unknown version (%d)\n", tsa->version);
3d16c3ebcd1ae6 Herve Codina 2024-07-29   994  		return -EINVAL;
3d16c3ebcd1ae6 Herve Codina 2024-07-29   995  	}
1d4ba0b81c1cf2 Herve Codina 2023-02-17   996  
1d4ba0b81c1cf2 Herve Codina 2023-02-17   997  	for (i = 0; i < ARRAY_SIZE(tsa->serials); i++)
1d4ba0b81c1cf2 Herve Codina 2023-02-17   998  		tsa->serials[i].id = i;
1d4ba0b81c1cf2 Herve Codina 2023-02-17   999  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1000  	spin_lock_init(&tsa->lock);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1001  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1002  	tsa->si_regs = devm_platform_ioremap_resource_byname(pdev, "si_regs");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1003  	if (IS_ERR(tsa->si_regs))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1004  		return PTR_ERR(tsa->si_regs);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1005  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1006  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "si_ram");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1007  	if (!res) {
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1008  		dev_err(tsa->dev, "si_ram resource missing\n");
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1009  		return -EINVAL;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1010  	}
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1011  	tsa->si_ram_sz = resource_size(res);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1012  	tsa->si_ram = devm_ioremap_resource(&pdev->dev, res);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1013  	if (IS_ERR(tsa->si_ram))
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1014  		return PTR_ERR(tsa->si_ram);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1015  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1016  	tsa_init_si_ram(tsa);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1017  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1018  	ret = tsa_of_parse_tdms(tsa, np);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1019  	if (ret)
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1020  		return ret;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1021  
7f6697511df485 Herve Codina 2024-07-29  1022  	ret = tsa_setup(tsa);
7f6697511df485 Herve Codina 2024-07-29  1023  	if (ret)
7f6697511df485 Herve Codina 2024-07-29  1024  		return ret;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1025  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1026  	platform_set_drvdata(pdev, tsa);
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1027  
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1028  	return 0;
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1029  }
1d4ba0b81c1cf2 Herve Codina 2023-02-17  1030  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
