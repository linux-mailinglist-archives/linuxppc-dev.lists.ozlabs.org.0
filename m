Return-Path: <linuxppc-dev+bounces-16688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBxFH8cUhmk1JgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:20:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C217D1002EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 17:20:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6zp942gyz309y;
	Sat, 07 Feb 2026 03:20:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770394817;
	cv=none; b=ezifaapTj9dOb407fhapztNlScdOZpOmghO9MC3jNllj5uFxh7qkl9X03j9/4OjG6vjI7jxI+YoW/imLcwX7zL0pzh9M1WtWVXphkIDu5CzqxgzBrDi8dWioSlr/KMBxyVpcvKcAYdlSf7HJVJByYddaboXlbbe+sNvhQtpiRHDpsYl2SD0KTazuG/i/DvL4NTKcFD/lz8YSlNsOHpYF52LDv4BNOFs960B500Plttwdf5QyEiE8dq3AP33dxL/xEK7ppwl2jvGWgaqCyNeeid9oxkvf9ggC9CYuMKFnCtgG3zIrPV7U2LmoV8FPWSB1B8Kww1WTq/qB26BY0PIFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770394817; c=relaxed/relaxed;
	bh=3cJheVdiiM1f/+x4d6u6CwpMEom3AZDSKJn0Rcsw/ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLu1RXqBR/CMoT0bVMvsNpD1ByK3Y0xHDAZYJtSzC0+uNYVfNI2iM0CEsSjx/hzb3st20tIGmnrnYRm/Jtkrf9I7cVwKM76vkJB6WUpYqU9gFks0eR2DW++tkmLb7m24ExtU4aRCCaO1cltZF+lecrUkwBCBuOAu8hqSHF+tmTCwDRL07yZjKOeZnM2SOjcZ/cEteEKH7w+xUnHEgrFL9muJK1oFZDNwj613bblH93ANPio2bV30c2mgPBvyPQmETx01qAyzEj/yWz71s7a1qz4781hYIfrwswAes2JsFqJpSWBhXO7B6OacghdMap76jCCiAHKJU6egY8KRzLw2WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBfSHASP; dkim-atps=neutral; spf=pass (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PBfSHASP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6zp65DMhz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 03:20:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770394815; x=1801930815;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0XDwV9tjto381cHBE9tb6ddkN7CanMXtXtA+02cOqU=;
  b=PBfSHASPi0uAHbz7h4bpmmvJeJ7je7LVH5C+rLHK32jIadPFIoMyk2S2
   Z14kIpY1vtHuP5h6jbV0ftYtI7hCzZaQk4mGJ3L/mbCmA7i7AQKPZ+b9y
   RoWWln4en8voHou1t3nCY69IvX4wgKX6U3y0Wi2JQYWN/j8JgEeLFL22f
   gL0GzBuaJiiMUBGgjpu3y7s7jqKYM60jhqFLIHJgGnUdmcvuDS9jruyeQ
   jMq+NkBBD0KdOEV6O/611LjMUdNYXBiA9dOMhuhUc/EztZX/7L389Snqg
   O4SztDy5G0LZPwKHFXwzDJCjOoop2XyGSYphA2QVFx4IZyfHRcOZLKfwn
   A==;
X-CSE-ConnectionGUID: 1uO6QmkfQMKy+JiMctEa2g==
X-CSE-MsgGUID: HjJMHt6gQD+eETQVvO1vuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="75224967"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="75224967"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 08:20:08 -0800
X-CSE-ConnectionGUID: eEkGmmJjQXC8p+o7zp96Fw==
X-CSE-MsgGUID: 8nvw3XAgQKK8jD09amGXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="215085419"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Feb 2026 08:20:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voOYs-00000000ktM-1Zd1;
	Fri, 06 Feb 2026 16:20:02 +0000
Date: Sat, 7 Feb 2026 00:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
Message-ID: <202602070032.CtJMTCOn-lkp@intel.com>
References: <20260206084334.483404-3-shengjiu.wang@nxp.com>
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
In-Reply-To: <20260206084334.483404-3-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16688-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_SENDER(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:shengjiu.wang@nxp.com,m:shengjiu.wang@gmail.com,m:Xiubo.Lee@gmail.com,m:festevam@gmail.com,m:nicoleotsuka@gmail.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:shengjiuwang@gmail.com,m:XiuboLee@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.850];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url]
X-Rspamd-Queue-Id: C217D1002EA
X-Rspamd-Action: no action

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.19-rc8 next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_sai-add-bitcount-and-timestamp-controls/20260206-164423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260206084334.483404-3-shengjiu.wang%40nxp.com
patch subject: [PATCH 2/2] ASoC: fsl_xcvr: add bitcount and timestamp controls
config: hexagon-randconfig-002-20260206 (https://download.01.org/0day-ci/archive/20260207/202602070032.CtJMTCOn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070032.CtJMTCOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070032.CtJMTCOn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/fsl/fsl_xcvr.c:70:46: error: call to undeclared function '__bf_shf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
         |                                                     ^
>> sound/soc/fsl/fsl_xcvr.c:70:46: error: initializer element is not a compile-time constant
      70 |         SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      71 |                         ARRAY_SIZE(inc_mode), inc_mode),
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:215:24: note: expanded from macro 'SOC_ENUM_SINGLE'
     215 |         SOC_ENUM_DOUBLE(xreg, xshift, xshift, xitems, xtexts)
         |         ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/sound/soc.h:211:27: note: expanded from macro 'SOC_ENUM_DOUBLE'
     211 | {       .reg = xreg, .shift_l = xshift_l, .shift_r = xshift_r, \
         |                                 ^~~~~~~~
   sound/soc/fsl/fsl_xcvr.c:78:6: error: initializer element is not a compile-time constant
      78 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSEN), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:81:6: error: initializer element is not a compile-time constant
      81 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RTSC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:83:6: error: initializer element is not a compile-time constant
      83 |                    __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_RBC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:93:6: error: initializer element is not a compile-time constant
      93 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSEN), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:96:6: error: initializer element is not a compile-time constant
      96 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RTSC), 1, 0),
         |                    ^
   sound/soc/fsl/fsl_xcvr.c:98:6: error: initializer element is not a compile-time constant
      98 |                    __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_RBC), 1, 0),
         |                    ^
>> sound/soc/fsl/fsl_xcvr.c:1133:19: error: invalid application of 'sizeof' to an incomplete type 'const struct snd_kcontrol_new[]'
    1133 |         .num_controls           = ARRAY_SIZE(fsl_xcvr_timestamp_ctrls),
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   9 errors generated.


vim +/__bf_shf +70 sound/soc/fsl/fsl_xcvr.c

    68	
    69	static const struct soc_enum tstmp_enum[] = {
  > 70		SOC_ENUM_SINGLE(FSL_XCVR_TX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_TX_DPTH_CNTR_CTRL_TSINC),
    71				ARRAY_SIZE(inc_mode), inc_mode),
    72		SOC_ENUM_SINGLE(FSL_XCVR_RX_DPTH_CNTR_CTRL, __bf_shf(FSL_XCVR_RX_DPTH_CNTR_CTRL_TSINC),
    73				ARRAY_SIZE(inc_mode), inc_mode),
    74	};
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

