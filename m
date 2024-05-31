Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9138D5AAA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:45:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8R3bb5n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrDBX4Pgyz30Vv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 16:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L8R3bb5n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.14; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrD9n1fZ6z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 16:44:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717137854; x=1748673854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UG2VPXJmnotgQCGbUJuzOG/RmR6KlipUd0UjDzTFmOc=;
  b=L8R3bb5nTmnReMOkHchi1TleoSJORpZ2mJtn6hsCFtLg0PjcDzyfcbUS
   UCzV2QdAX0/dGKWVLmGQEDAV3GBNBLb3f2GrsZEtGKs0+hUgwdzGNNtG3
   b5QbNEDhHPZzaLP4GclaOcGy1CiAzC5os+bAr/RjNfz9/I8RLP8UgYfw7
   SraQOSkXdwGxLu8leRfJFF0Kx6TXjt4Tul/QlrH8rBJplxl6ME1LFvWQe
   yjdQHeJG5AZIX5cUr1LLuUD1IRTn4cl0i+ON0sApY3nDyipHeMcpHTvlC
   0pTdDrDnpHFhPnsBpK10ngPpW8Z2nxAV7SEWEtpGvYq1DWuBI+/OHGwiC
   g==;
X-CSE-ConnectionGUID: QEchzdDhRo6B+RgvnhCpPw==
X-CSE-MsgGUID: AF1IXzVWSlymm3xYVpboYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17497246"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="17497246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 23:44:06 -0700
X-CSE-ConnectionGUID: 3FNSixCJRzeU6SpSydb64Q==
X-CSE-MsgGUID: MIPAgyHVT2ebsdue2tL+gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36689755"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 30 May 2024 23:43:58 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCvzO-000Gd3-2Y;
	Fri, 31 May 2024 06:43:49 +0000
Date: Fri, 31 May 2024 14:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <202405311428.tzsBMIPs-lkp@intel.com>
References: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, Baojun Xu <baojun.xu@ti.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, llvm@lists.linux.dev, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Kevin Lu <kevin-lu@ti.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, oe-kbuild-all@lists.linux.dev, Xiubo Li <Xiubo.Lee@gmail.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on shawnguo/for-next rockchip/for-next linus/master v6.10-rc1 next-20240529]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/ASoC-codecs-Remove-unused-of_gpio-h/20240531-070350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240530230037.1156253-2-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
config: i386-buildonly-randconfig-006-20240531 (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405311428.tzsBMIPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405311428.tzsBMIPs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2781-comlib.c:408:6: error: call to undeclared function 'gpio_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     408 |         if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
         |             ^
   sound/soc/codecs/tas2781-comlib.c:408:6: note: did you mean 'uuid_is_valid'?
   include/linux/uuid.h:102:19: note: 'uuid_is_valid' declared here
     102 | bool __must_check uuid_is_valid(const char *uuid);
         |                   ^
>> sound/soc/codecs/tas2781-comlib.c:409:3: error: call to undeclared function 'gpio_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     409 |                 gpio_free(tas_priv->irq_info.irq_gpio);
         |                 ^
   sound/soc/codecs/tas2781-comlib.c:409:3: note: did you mean 'pmd_free'?
   include/asm-generic/pgtable-nopmd.h:63:20: note: 'pmd_free' declared here
      63 | static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
         |                    ^
   2 errors generated.
--
>> sound/soc/codecs/tas2781-i2c.c:664:6: error: call to undeclared function 'gpio_is_valid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     664 |         if (gpio_is_valid(tas_priv->irq_info.irq_gpio)) {
         |             ^
   sound/soc/codecs/tas2781-i2c.c:664:6: note: did you mean 'uuid_is_valid'?
   include/linux/uuid.h:102:19: note: 'uuid_is_valid' declared here
     102 | bool __must_check uuid_is_valid(const char *uuid);
         |                   ^
>> sound/soc/codecs/tas2781-i2c.c:665:8: error: call to undeclared function 'gpio_request'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     665 |                 rc = gpio_request(tas_priv->irq_info.irq_gpio,
         |                      ^
>> sound/soc/codecs/tas2781-i2c.c:668:4: error: call to undeclared function 'gpio_direction_input'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     668 |                         gpio_direction_input(
         |                         ^
   sound/soc/codecs/tas2781-i2c.c:668:4: note: did you mean 'gpiod_direction_input'?
   include/linux/gpio/consumer.h:110:5: note: 'gpiod_direction_input' declared here
     110 | int gpiod_direction_input(struct gpio_desc *desc);
         |     ^
>> sound/soc/codecs/tas2781-i2c.c:672:5: error: call to undeclared function 'gpio_to_irq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     672 |                                 gpio_to_irq(tas_priv->irq_info.irq_gpio);
         |                                 ^
   sound/soc/codecs/tas2781-i2c.c:672:5: note: did you mean 'gpiod_to_irq'?
   include/linux/gpio/consumer.h:167:5: note: 'gpiod_to_irq' declared here
     167 | int gpiod_to_irq(const struct gpio_desc *desc);
         |     ^
   4 errors generated.


vim +/gpio_is_valid +408 sound/soc/codecs/tas2781-comlib.c

ef3bcde75d06d6 Shenghao Ding 2023-06-18  405  
ef3bcde75d06d6 Shenghao Ding 2023-06-18  406  void tasdevice_remove(struct tasdevice_priv *tas_priv)
ef3bcde75d06d6 Shenghao Ding 2023-06-18  407  {
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @408  	if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
ef3bcde75d06d6 Shenghao Ding 2023-06-18 @409  		gpio_free(tas_priv->irq_info.irq_gpio);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  410  	mutex_destroy(&tas_priv->codec_lock);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  411  }
ef3bcde75d06d6 Shenghao Ding 2023-06-18  412  EXPORT_SYMBOL_GPL(tasdevice_remove);
ef3bcde75d06d6 Shenghao Ding 2023-06-18  413  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
