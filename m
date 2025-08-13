Return-Path: <linuxppc-dev+bounces-10926-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC552B2432D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 09:50:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c20t72LScz30Vq;
	Wed, 13 Aug 2025 17:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755071455;
	cv=none; b=Q/n7vh4rExb3jNoqlBg1b3VLKMGEMo/6pQjwSTboxaZEYoIk2p6fkvyGcrmvXQVunP2B4vUbMBO0vA8bAh9D5mzB86j0VKC88K1T7wCzjrXarWt+oRMECcoCr4nWBnZdPrrX4ADHPUPGU56cdSpaYZj6WsDL+fHxnu7ZV14zZXQN3ND1pEZjyoa/f7OYTASE+yNpyKEs1QSfCOGYwXOa8TPTusL4mvDskfZcHToPsiWGYTW8Zy4XTWBwT3gTguLz3jNeo4srdcusGrI5NlQpSEhfDf90MHbT08m/j0mxFOT2B55UqM7OcRqL6XKLD3F1G0R2NN1c/idktoFst5So7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755071455; c=relaxed/relaxed;
	bh=83V8Z646mVNzx9401MPoYro6TvTHAhL4EUo02/1Nq0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW6Lbja0WmDQtqFHbFoFvRsEdfylgLhpZKLy6HuQ9rjRcyXhf40UChGPF0DGNBIX+NwMtjGTJQ4mw2J1rG5hhURib0NEBhLl+yZBSWn90p4+EFq+BN14CA5CW/iSr/GlsINbnihuyFlt/5bFdv2VgKX6IX1/XLsfXFBWv/Ptdy8zftQW3vpNwYLfG14lI9KBK04VTn2LgZqD3rGkTzo87vVQRAL5TwdI+O/u02C8CuxeDlkNE5OD2mNIV4wlZLpDxyfzfoMb8m4iVTtnrD2ZqokuIDZ7gypfCEHAhOF3+4yYES1ED7dsFQUrTrJ43stmjdBhXuwm98lPrPFSFo5hng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDRMBArY; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDRMBArY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c20t50D0mz30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 17:50:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755071454; x=1786607454;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GCkcSwQXaPB+Reeu4y3cV78hJ9D/iB5yjlZx4Qatnh8=;
  b=KDRMBArYmaF+3t6P6tTejlORRNeIikawtlXH39E15EuCtx5ecgDc8Tao
   FJJoUk9iFFhfhZotJpsH4U7JwLZoYla/gYq6qSLF/Kx7zGtBj1MkJgtzK
   JFU72T4HQxwfUkzu1g6yIrxbWu8g3OIgmtKES1SZoeom2rp5U9G4beBzl
   I0+ctgmiqVmURh/pFuZayyk/2l6AfsL/A/lmScdx5MmdpLXjc5U1/Vz3h
   ePppiD5758fhMtEAGGM0Qvqiezd8N3qcD1tSSWE2qShPGj+wgjg+qMCUV
   oALAOdxEyI0VQBEAUx31kDQ/QO/zV8POl4YcioxGZkQTs9h0u7cl/5Sxc
   A==;
X-CSE-ConnectionGUID: vwoITsLzT86gleLQ6+E39w==
X-CSE-MsgGUID: WAp4qPbuSr+9B53ORqaB3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57260484"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57260484"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 00:50:48 -0700
X-CSE-ConnectionGUID: UFpW3ZHJRgG7Yrcfgk7aGw==
X-CSE-MsgGUID: hr6+tZAJTK62MvVvrPVRZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165625222"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Aug 2025 00:50:44 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um6Fc-0009gS-1J;
	Wed, 13 Aug 2025 07:50:29 +0000
Date: Wed, 13 Aug 2025 15:49:35 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC
 Engine Ports
Message-ID: <202508131517.P1Nfz0RF-lkp@intel.com>
References: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christophe,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.17-rc1 next-20250813]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/soc-fsl-qe-Add-an-interrupt-controller-for-QUICC-Engine-Ports/20250812-195423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/1dcc9528e97d228ea7889caa00cc254ef0375ed4.1754996033.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH 1/4] soc: fsl: qe: Add an interrupt controller for QUICC Engine Ports
config: powerpc64-randconfig-002-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131517.P1Nfz0RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131517.P1Nfz0RF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/fsl/qe/qe_ports_ic.c: In function 'qepic_probe':
>> drivers/soc/fsl/qe/qe_ports_ic.c:102:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     nb = (int)of_device_get_match_data(dev);
          ^


vim +102 drivers/soc/fsl/qe/qe_ports_ic.c

    94	
    95	static int qepic_probe(struct platform_device *pdev)
    96	{
    97		struct device *dev = &pdev->dev;
    98		struct qepic_data *data;
    99		int irq;
   100		int nb;
   101	
 > 102		nb = (int)of_device_get_match_data(dev);
   103		if (nb < 1 || nb > 32)
   104			return -EINVAL;
   105	
   106		data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
   107		if (!data)
   108			return -ENOMEM;
   109	
   110		data->reg = devm_platform_ioremap_resource(pdev, 0);
   111		if (IS_ERR(data->reg))
   112			return PTR_ERR(data->reg);
   113	
   114		irq = platform_get_irq(pdev, 0);
   115		if (irq < 0)
   116			return irq;
   117	
   118		data->host = irq_domain_add_linear(dev->of_node, nb, &qepic_host_ops, data);
   119		if (!data->host)
   120			return -ENODEV;
   121	
   122		irq_set_handler_data(irq, data);
   123		irq_set_chained_handler(irq, qepic_cascade);
   124	
   125		return 0;
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

