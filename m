Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 999266BB128
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 13:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pc8jX3pyMz30Lt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 23:25:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFoU/Bpi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=lkp@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BFoU/Bpi;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pc8hc0Fywz3bh3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 23:24:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678883056; x=1710419056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sqa5ETRPA8mWWtxvPChxrgVub4MEZRvt0xOoJBar2EI=;
  b=BFoU/BpiT6lXjvlehuW2yjHyA0tnE11JLRMB1b1GYVAqHBaRZKL8vDlx
   43RMRSOYhhKnk+pKtyxnTuHCtjYfytR2P0JtpncoZJnnWvn0di82HozNP
   62mfo4Wy+tjuuD/dZKewvfgtgbIw5/fImkFhHngZklJJ6cJma0N8mfSkQ
   DMn11FX742XzwKbbG9P4bhOePuw40mpKDYljZQ8w1zSmAELrvdNm1vDi/
   WqDKTleQcbwbL5f6bbvzbVPA6UJM27Af2MdagxAn7kCQdw7CjlYFXp/3U
   4+NV7c7/AolWkW1lz6o0txrbpjkEE3keQE5+5FG0cPi2PGG60dtYRFEHY
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335171857"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335171857"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="768464686"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="768464686"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Mar 2023 05:23:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcQAT-0007f8-0r;
	Wed, 15 Mar 2023 12:23:45 +0000
Date: Wed, 15 Mar 2023 20:23:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
Message-ID: <202303152008.kxRjSW73-lkp@intel.com>
References: <20230313161138.3598068-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, =?iso-8859-1?Q?Fern=E1ndez?= Rojas <noltari@gmail.com>, Jonas Gorski <jonas.gorski@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Linus Walleij <linus.walleij@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on brgl/gpio/for-next clk/clk-next linus/master v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313161138.3598068-4-sean.anderson%40seco.com
patch subject: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
reproduce:
        # https://github.com/intel-lab-lkp/linux/commit/2d1e86be168e32ea3d3f11325881f7cb1e5492f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/dt-bindings-phy-Add-2500BASE-X-and-10GBASE-R/20230314-001522
        git checkout 2d1e86be168e32ea3d3f11325881f7cb1e5492f8
        make menuconfig
        # enable CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS
        make htmldocs

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303152008.kxRjSW73-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
>> Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
