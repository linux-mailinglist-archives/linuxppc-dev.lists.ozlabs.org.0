Return-Path: <linuxppc-dev+bounces-5971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A75A2D299
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 02:26:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqY8s4fRlz30Jc;
	Sat,  8 Feb 2025 12:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738978013;
	cv=none; b=odfvOU+9Kcu+e8+NaK+M6M4SJiRa6umvBd6k1hdGlhHmmnIKQYeB6YHq/+SEjMoYFlygPQEECoR1PG7ZpCO6xaQ6zbHFqKrdGxebIr0oNU1/Vnj9i2SDIdTVm1cg8bmhrZELuWlDaNIgDQcbe6gXdFv9sJEM+nilC9z3CyaEeZX47PTX4gXpgNtdIiOBijWhi6OY7Qz/h26CUOqXtomorwu67gtavav5vR6d0jzxcAKuR3Xwi+yodHsyX0mHlW7z9UytXVVC6SId1vr8Ykmk0/J386eBJ6vXC536ILpT9OTxZNrqq8qdYSiGQst6cXJkRdcpxE+4v0NDZwkwDiV4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738978013; c=relaxed/relaxed;
	bh=4ZCCS5i0uJ02mZmrJ0lmanmkHP8jTq4YYxKxZR5qDyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPI9vawm1yVCoMRahVlEU5UGrkJVs581KKcXITeqJhsjJ4orBNcXih/eF0UV3Ud0jICJ6LFuY7i7dATYMRcx2EsORN0r4bcKLYSzcTGI25mQLPd5J+gq3+MRMfovywYX6PJFjAoUzMWKIBZgH7Fxmo2jtlotvznDbnEg6LlNTf+wiOxI3EHGerFF9vR/e8KpxpdIrNkhNwgP0/wP/ZUgOGRI3JUewFTaoLLKawnxGlCnEIqi1z1uOI/NRoaLTkJ0yoejrk3aoKZf78wVeYVCv3uOKuTYju6N0dNZvSCi+/NMdHC+M61REJ+M3RL9DCzuJtJTLsHnLqTiC+1uHc2ujg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UbloR0TA; dkim-atps=neutral; spf=pass (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UbloR0TA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqY8q2dD6z2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 12:26:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738978012; x=1770514012;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Vf+orbI0MIxZ+NdnmW8ZrODzdSpawbZ5ZYwzT7WkFHs=;
  b=UbloR0TAxnhScRZRVENKU6HWMn+TE9nq+uwNClL7d/g2ggQUTqTUpI0P
   v6lMQQJtZ4sqnx2pzEvAi5zI0+mgFq72XzExOi7+qCZQfq7bg2KgynLOo
   dDqgIUT6mF/rwI0ZSBOrDrp61CAfzk8OkmkpVMP4hZSTcNTn+4xH2Cxrg
   P9RWWojs2jUKHQWyRSUYYLpHLHuAQpICGFuIFe8/P0yuOEvwbwys2s8bz
   l/27E3lHAqSyrLZJY5Ox1veTdOO/xWgSKFfxo7XZe1s9OmmXtoWboA2AY
   7Aml44fv2tbaP7phGRRgpBOgFwrA0VzcM0r4SkSkGbzAO10jQlxQgzW7r
   w==;
X-CSE-ConnectionGUID: eRSIP0ryQ7St5BJLfkoxww==
X-CSE-MsgGUID: ni39wSYuSPG5KUSeSPEPbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50613561"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="50613561"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 17:26:47 -0800
X-CSE-ConnectionGUID: 3S9sGSljQLuj0EiY8i0xug==
X-CSE-MsgGUID: NQdROjzMTsa5FP6NHBmBrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="116720032"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2025 17:26:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgZcD-000zM7-1v;
	Sat, 08 Feb 2025 01:26:37 +0000
Date: Sat, 8 Feb 2025 09:26:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= via B4 Relay <devnull+j.ne.posteo.net@kernel.org>,
	devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, imx@lists.linux.dev,
	Scott Wood <oss@buserror.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-ide@vger.kernel.org
Subject: Re: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to
 YAML
Message-ID: <202502080922.nK85none-lkp@intel.com>
References: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ppcyaml-v2-6-8137b0c42526@posteo.net>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-powerpc-Add-Freescale-NXP-MPC83xx-SoCs/20250208-053519
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250207-ppcyaml-v2-6-8137b0c42526%40posteo.net
patch subject: [PATCH v2 06/12] dt-bindings: pci: Convert fsl,mpc83xx-pcie to YAML
reproduce: (https://download.01.org/0day-ci/archive/20250208/202502080922.nK85none-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502080922.nK85none-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arch/powerpc/cxl.rst references a file that doesn't exist: Documentation/ABI/testing/sysfs-class-cxl
>> Warning: Documentation/devicetree/bindings/pci/fsl,mpc8xxx-pci.yaml references a file that doesn't exist: Documentation/devicetree/bindings/pci/fsl,pci.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
   Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
   Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

