Return-Path: <linuxppc-dev+bounces-9572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBEAE0EC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 22:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNXrz42zVz2xjN;
	Fri, 20 Jun 2025 06:53:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750366435;
	cv=none; b=NxD/GIFZrRkDy7T4CoZkt2Fx6Lh6qK3A2IsUHBpBP72aACxncP2Z/rJ+rfw9N2KBQ9iwq/be9jiakriI422ridH6a1OPNIN+BU1CiH32L6agZi5L7LtR2Xyk0I/w9AetlcO4Id1CIcvgO2BwdIWBUQ7Fyw7WA4vf/WHH/RRwBGT7Q+uN/ywP4c0toYRw1z8XMw9a6SrCQ7lYb9jFFFEhTQ21e2sB9cz8sQUvtit61VWVOpKStuIQ/lpXjkNXqo+UjTH1/qToWWyhWjN1FwfjR7zTrua/CGyK6fZr8GbYMwrLo4Blpoak12ySbLE4loDhCkByiIDLjrWWI4Tsm9CwsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750366435; c=relaxed/relaxed;
	bh=wuCrdIij0A9CgLqBWjLaxmZ2jWiXUF6Ua+DPiQVVfDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IECEC4RaA9yd0C+E/P1nXRvjwiNoeJO71PB8T4B2a1lo3qouSxwun+geQ9omaYWOl0mYGSZaoM6ERkYNUyFG2k0/FqxRYphUD9Sdt3Vnh2jzp1jItPepkPe39vSmMry6uX/FfnEniVJMscmvmQncaFuE8qWUT6ampSI/OVGfprv5F7u7dm+MX8te9f/ifvdRLxJkXScTNycX30wzbUoX6H/hVP2/p1G6p+0qrsMBBZcUIEz68sqZadO40py/55crljOfy+VbSuG74xMS840pijsNzvx9SXhtJ6F2r9D/Wy8B2WFWz0B6LdLZSbweDMQsEXpKVfcvGnIxf3gzyp+LwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lhmrXYXz; dkim-atps=neutral; spf=pass (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lhmrXYXz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNXrw6Lc4z2xck
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 06:53:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750366433; x=1781902433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ybKBBbrvjmL01p8FtzTcnNdCgyhQhALzZsU71BczNpk=;
  b=lhmrXYXz1NLfCjwrBd3GM5GU5XykjQtkthL6jQx6ATPqxM2HvCcunsN5
   XwrFgXiLVtCwbzY/BaL3ITIMYWigMC/RlR9TdXbNp+7eQXrrGQOjMuvUZ
   tltmDIjQr6aPRZNF0C1jE0gITwreehz12oiQazDU5pbN8KMYOgOjXsZp9
   1VR2/M5zLb8AVWKka02cc7aepbL6gAJEW3RGbm+6GJvEIxiw2pMmX6htL
   FAuFcSVX1jq47++In2HfqFTc7VsxD8CZ0p8BD0u8PXPhmxqJgvdZngwhe
   4xcRFxAsFDHH+qOrm1q5BmF3ClvlMpKTDjJtQB3o2fZYbmt4CwIY/eTaz
   w==;
X-CSE-ConnectionGUID: OD0GPVeKSFyksmynbZyYXg==
X-CSE-MsgGUID: Z3jRkuhtSOKkv8WtQH//Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52550790"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="52550790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 13:53:47 -0700
X-CSE-ConnectionGUID: CsHVsW6uQrOgHPs7GKcYtA==
X-CSE-MsgGUID: /5cZjRSSROeMCHWjvlDFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150871999"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jun 2025 13:53:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSMGT-000L6c-27;
	Thu, 19 Jun 2025 20:53:41 +0000
Date: Fri, 20 Jun 2025 04:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chancel Liu <chancel.liu@nxp.com>, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, shawnguo@kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: imx-card: Add WM8524 support
Message-ID: <202506200415.ATjQ5KCu-lkp@intel.com>
References: <20250619062413.3946142-1-chancel.liu@nxp.com>
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
In-Reply-To: <20250619062413.3946142-1-chancel.liu@nxp.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Chancel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250619]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chancel-Liu/ASoC-imx-card-Add-WM8524-support/20250619-142646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250619062413.3946142-1-chancel.liu%40nxp.com
patch subject: [PATCH] ASoC: imx-card: Add WM8524 support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250620/202506200415.ATjQ5KCu-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200415.ATjQ5KCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200415.ATjQ5KCu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/fsl/imx-card.c:884:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     884 |                 default:
         |                 ^
   sound/soc/fsl/imx-card.c:884:3: note: insert 'break;' to avoid fall-through
     884 |                 default:
         |                 ^
         |                 break; 
   1 warning generated.


vim +884 sound/soc/fsl/imx-card.c

aa736700f42fa0 Shengjiu Wang     2021-05-17  747  
aa736700f42fa0 Shengjiu Wang     2021-05-17  748  static int imx_card_probe(struct platform_device *pdev)
aa736700f42fa0 Shengjiu Wang     2021-05-17  749  {
aa736700f42fa0 Shengjiu Wang     2021-05-17  750  	struct snd_soc_dai_link *link_be = NULL, *link;
aa736700f42fa0 Shengjiu Wang     2021-05-17  751  	struct imx_card_plat_data *plat_data;
aa736700f42fa0 Shengjiu Wang     2021-05-17  752  	struct imx_card_data *data;
aa736700f42fa0 Shengjiu Wang     2021-05-17  753  	int ret, i;
aa736700f42fa0 Shengjiu Wang     2021-05-17  754  
aa736700f42fa0 Shengjiu Wang     2021-05-17  755  	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
aa736700f42fa0 Shengjiu Wang     2021-05-17  756  	if (!data)
aa736700f42fa0 Shengjiu Wang     2021-05-17  757  		return -ENOMEM;
aa736700f42fa0 Shengjiu Wang     2021-05-17  758  
aa736700f42fa0 Shengjiu Wang     2021-05-17  759  	plat_data = devm_kzalloc(&pdev->dev, sizeof(*plat_data), GFP_KERNEL);
aa736700f42fa0 Shengjiu Wang     2021-05-17  760  	if (!plat_data)
aa736700f42fa0 Shengjiu Wang     2021-05-17  761  		return -ENOMEM;
aa736700f42fa0 Shengjiu Wang     2021-05-17  762  
aa736700f42fa0 Shengjiu Wang     2021-05-17  763  	data->plat_data = plat_data;
aa736700f42fa0 Shengjiu Wang     2021-05-17  764  	data->card.dev = &pdev->dev;
47d7d3fd72afc7 Hui Wang          2024-10-02  765  	data->card.owner = THIS_MODULE;
aa736700f42fa0 Shengjiu Wang     2021-05-17  766  
aa736700f42fa0 Shengjiu Wang     2021-05-17  767  	dev_set_drvdata(&pdev->dev, &data->card);
aa736700f42fa0 Shengjiu Wang     2021-05-17  768  	snd_soc_card_set_drvdata(&data->card, data);
aa736700f42fa0 Shengjiu Wang     2021-05-17  769  	ret = imx_card_parse_of(data);
aa736700f42fa0 Shengjiu Wang     2021-05-17  770  	if (ret)
aa736700f42fa0 Shengjiu Wang     2021-05-17  771  		return ret;
aa736700f42fa0 Shengjiu Wang     2021-05-17  772  
aa736700f42fa0 Shengjiu Wang     2021-05-17  773  	data->num_dapm_routes = plat_data->num_codecs + 1;
aa736700f42fa0 Shengjiu Wang     2021-05-17  774  	data->dapm_routes = devm_kcalloc(&pdev->dev, data->num_dapm_routes,
aa736700f42fa0 Shengjiu Wang     2021-05-17  775  					 sizeof(struct snd_soc_dapm_route),
aa736700f42fa0 Shengjiu Wang     2021-05-17  776  					 GFP_KERNEL);
aa736700f42fa0 Shengjiu Wang     2021-05-17  777  	if (!data->dapm_routes)
aa736700f42fa0 Shengjiu Wang     2021-05-17  778  		return -ENOMEM;
aa736700f42fa0 Shengjiu Wang     2021-05-17  779  
aa736700f42fa0 Shengjiu Wang     2021-05-17  780  	/* configure the dapm routes */
aa736700f42fa0 Shengjiu Wang     2021-05-17  781  	switch (plat_data->type) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  782  	case CODEC_AK4458:
aa736700f42fa0 Shengjiu Wang     2021-05-17  783  	case CODEC_AK4497:
aa736700f42fa0 Shengjiu Wang     2021-05-17  784  		if (plat_data->num_codecs == 1) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  785  			data->dapm_routes[0].sink = "Playback";
aa736700f42fa0 Shengjiu Wang     2021-05-17  786  			data->dapm_routes[0].source = "CPU-Playback";
aa736700f42fa0 Shengjiu Wang     2021-05-17  787  			i = 1;
aa736700f42fa0 Shengjiu Wang     2021-05-17  788  		} else {
aa736700f42fa0 Shengjiu Wang     2021-05-17  789  			for (i = 0; i < plat_data->num_codecs; i++) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  790  				data->dapm_routes[i].sink =
aa736700f42fa0 Shengjiu Wang     2021-05-17  791  					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
aa736700f42fa0 Shengjiu Wang     2021-05-17  792  						       i + 1, "Playback");
93d34608fd162f Henry Martin      2025-04-01  793  				if (!data->dapm_routes[i].sink)
93d34608fd162f Henry Martin      2025-04-01  794  					return -ENOMEM;
aa736700f42fa0 Shengjiu Wang     2021-05-17  795  				data->dapm_routes[i].source = "CPU-Playback";
aa736700f42fa0 Shengjiu Wang     2021-05-17  796  			}
aa736700f42fa0 Shengjiu Wang     2021-05-17  797  		}
aa736700f42fa0 Shengjiu Wang     2021-05-17  798  		data->dapm_routes[i].sink = "CPU-Playback";
aa736700f42fa0 Shengjiu Wang     2021-05-17  799  		data->dapm_routes[i].source = "ASRC-Playback";
aa736700f42fa0 Shengjiu Wang     2021-05-17  800  		break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  801  	case CODEC_AK5558:
aa736700f42fa0 Shengjiu Wang     2021-05-17  802  	case CODEC_AK5552:
aa736700f42fa0 Shengjiu Wang     2021-05-17  803  		if (plat_data->num_codecs == 1) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  804  			data->dapm_routes[0].sink = "CPU-Capture";
aa736700f42fa0 Shengjiu Wang     2021-05-17  805  			data->dapm_routes[0].source = "Capture";
aa736700f42fa0 Shengjiu Wang     2021-05-17  806  			i = 1;
aa736700f42fa0 Shengjiu Wang     2021-05-17  807  		} else {
aa736700f42fa0 Shengjiu Wang     2021-05-17  808  			for (i = 0; i < plat_data->num_codecs; i++) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  809  				data->dapm_routes[i].source =
aa736700f42fa0 Shengjiu Wang     2021-05-17  810  					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
aa736700f42fa0 Shengjiu Wang     2021-05-17  811  						       i + 1, "Capture");
93d34608fd162f Henry Martin      2025-04-01  812  				if (!data->dapm_routes[i].source)
93d34608fd162f Henry Martin      2025-04-01  813  					return -ENOMEM;
aa736700f42fa0 Shengjiu Wang     2021-05-17  814  				data->dapm_routes[i].sink = "CPU-Capture";
aa736700f42fa0 Shengjiu Wang     2021-05-17  815  			}
aa736700f42fa0 Shengjiu Wang     2021-05-17  816  		}
aa736700f42fa0 Shengjiu Wang     2021-05-17  817  		data->dapm_routes[i].sink = "ASRC-Capture";
aa736700f42fa0 Shengjiu Wang     2021-05-17  818  		data->dapm_routes[i].source = "CPU-Capture";
aa736700f42fa0 Shengjiu Wang     2021-05-17  819  		break;
b39eec95b84d5d Chancel Liu       2024-10-09  820  	case CODEC_CS42888:
b39eec95b84d5d Chancel Liu       2024-10-09  821  		data->dapm_routes[0].sink = "Playback";
b39eec95b84d5d Chancel Liu       2024-10-09  822  		data->dapm_routes[0].source = "CPU-Playback";
b39eec95b84d5d Chancel Liu       2024-10-09  823  		data->dapm_routes[1].sink = "CPU-Capture";
b39eec95b84d5d Chancel Liu       2024-10-09  824  		data->dapm_routes[1].source = "Capture";
b39eec95b84d5d Chancel Liu       2024-10-09  825  		break;
52377234f3ed64 Chancel Liu       2025-06-19  826  	case CODEC_WM8524:
52377234f3ed64 Chancel Liu       2025-06-19  827  		data->dapm_routes[0].sink = "Playback";
52377234f3ed64 Chancel Liu       2025-06-19  828  		data->dapm_routes[0].source = "CPU-Playback";
52377234f3ed64 Chancel Liu       2025-06-19  829  		break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  830  	default:
aa736700f42fa0 Shengjiu Wang     2021-05-17  831  		break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  832  	}
aa736700f42fa0 Shengjiu Wang     2021-05-17  833  
aa736700f42fa0 Shengjiu Wang     2021-05-17  834  	/* default platform data for akcodecs */
aa736700f42fa0 Shengjiu Wang     2021-05-17  835  	if (codec_is_akcodec(plat_data->type)) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  836  		plat_data->support_rates = akcodec_rates;
aa736700f42fa0 Shengjiu Wang     2021-05-17  837  		plat_data->num_rates = ARRAY_SIZE(akcodec_rates);
aa736700f42fa0 Shengjiu Wang     2021-05-17  838  		plat_data->support_tdm_rates = akcodec_tdm_rates;
aa736700f42fa0 Shengjiu Wang     2021-05-17  839  		plat_data->num_tdm_rates = ARRAY_SIZE(akcodec_tdm_rates);
aa736700f42fa0 Shengjiu Wang     2021-05-17  840  
aa736700f42fa0 Shengjiu Wang     2021-05-17  841  		switch (plat_data->type) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  842  		case CODEC_AK4458:
aa736700f42fa0 Shengjiu Wang     2021-05-17  843  			plat_data->fs_mul = ak4458_fs_mul;
aa736700f42fa0 Shengjiu Wang     2021-05-17  844  			plat_data->num_fs_mul = ARRAY_SIZE(ak4458_fs_mul);
aa736700f42fa0 Shengjiu Wang     2021-05-17  845  			plat_data->tdm_fs_mul = ak4458_tdm_fs_mul;
aa736700f42fa0 Shengjiu Wang     2021-05-17  846  			plat_data->num_tdm_fs_mul = ARRAY_SIZE(ak4458_tdm_fs_mul);
aa736700f42fa0 Shengjiu Wang     2021-05-17  847  			plat_data->support_channels = ak4458_channels;
aa736700f42fa0 Shengjiu Wang     2021-05-17  848  			plat_data->num_channels = ARRAY_SIZE(ak4458_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17  849  			plat_data->support_tdm_channels = ak4458_tdm_channels;
aa736700f42fa0 Shengjiu Wang     2021-05-17  850  			plat_data->num_tdm_channels = ARRAY_SIZE(ak4458_tdm_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17  851  			break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  852  		case CODEC_AK4497:
aa736700f42fa0 Shengjiu Wang     2021-05-17  853  			plat_data->fs_mul = ak4497_fs_mul;
aa736700f42fa0 Shengjiu Wang     2021-05-17  854  			plat_data->num_fs_mul = ARRAY_SIZE(ak4497_fs_mul);
aa736700f42fa0 Shengjiu Wang     2021-05-17  855  			plat_data->support_channels = ak4458_channels;
aa736700f42fa0 Shengjiu Wang     2021-05-17  856  			plat_data->num_channels = ARRAY_SIZE(ak4458_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17  857  			break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  858  		case CODEC_AK5558:
aa736700f42fa0 Shengjiu Wang     2021-05-17  859  		case CODEC_AK5552:
aa736700f42fa0 Shengjiu Wang     2021-05-17  860  			plat_data->fs_mul = ak5558_fs_mul;
aa736700f42fa0 Shengjiu Wang     2021-05-17  861  			plat_data->num_fs_mul = ARRAY_SIZE(ak5558_fs_mul);
aa736700f42fa0 Shengjiu Wang     2021-05-17  862  			plat_data->tdm_fs_mul = ak5558_tdm_fs_mul;
aa736700f42fa0 Shengjiu Wang     2021-05-17  863  			plat_data->num_tdm_fs_mul = ARRAY_SIZE(ak5558_tdm_fs_mul);
aa736700f42fa0 Shengjiu Wang     2021-05-17  864  			plat_data->support_channels = ak5558_channels;
aa736700f42fa0 Shengjiu Wang     2021-05-17  865  			plat_data->num_channels = ARRAY_SIZE(ak5558_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17  866  			plat_data->support_tdm_channels = ak5558_tdm_channels;
aa736700f42fa0 Shengjiu Wang     2021-05-17  867  			plat_data->num_tdm_channels = ARRAY_SIZE(ak5558_tdm_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17  868  			break;
b39eec95b84d5d Chancel Liu       2024-10-09  869  		case CODEC_CS42888:
b39eec95b84d5d Chancel Liu       2024-10-09  870  			plat_data->fs_mul = cs42888_fs_mul;
b39eec95b84d5d Chancel Liu       2024-10-09  871  			plat_data->num_fs_mul = ARRAY_SIZE(cs42888_fs_mul);
b39eec95b84d5d Chancel Liu       2024-10-09  872  			plat_data->tdm_fs_mul = cs42888_tdm_fs_mul;
b39eec95b84d5d Chancel Liu       2024-10-09  873  			plat_data->num_tdm_fs_mul = ARRAY_SIZE(cs42888_tdm_fs_mul);
b39eec95b84d5d Chancel Liu       2024-10-09  874  			plat_data->support_channels = cs42888_channels;
b39eec95b84d5d Chancel Liu       2024-10-09  875  			plat_data->num_channels = ARRAY_SIZE(cs42888_channels);
b39eec95b84d5d Chancel Liu       2024-10-09  876  			plat_data->support_tdm_channels = cs42888_tdm_channels;
b39eec95b84d5d Chancel Liu       2024-10-09  877  			plat_data->num_tdm_channels = ARRAY_SIZE(cs42888_tdm_channels);
b39eec95b84d5d Chancel Liu       2024-10-09  878  			break;
52377234f3ed64 Chancel Liu       2025-06-19  879  		case CODEC_WM8524:
52377234f3ed64 Chancel Liu       2025-06-19  880  			plat_data->fs_mul = wm8524_fs_mul;
52377234f3ed64 Chancel Liu       2025-06-19  881  			plat_data->num_fs_mul = ARRAY_SIZE(wm8524_fs_mul);
52377234f3ed64 Chancel Liu       2025-06-19  882  			plat_data->support_channels = wm8524_channels;
52377234f3ed64 Chancel Liu       2025-06-19  883  			plat_data->num_channels = ARRAY_SIZE(wm8524_channels);
aa736700f42fa0 Shengjiu Wang     2021-05-17 @884  		default:
aa736700f42fa0 Shengjiu Wang     2021-05-17  885  			break;
aa736700f42fa0 Shengjiu Wang     2021-05-17  886  		}
aa736700f42fa0 Shengjiu Wang     2021-05-17  887  	}
aa736700f42fa0 Shengjiu Wang     2021-05-17  888  
aa736700f42fa0 Shengjiu Wang     2021-05-17  889  	/* with asrc as front end */
aa736700f42fa0 Shengjiu Wang     2021-05-17  890  	if (data->card.num_links == 3) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  891  		data->card.dapm_routes = data->dapm_routes;
aa736700f42fa0 Shengjiu Wang     2021-05-17  892  		data->card.num_dapm_routes = data->num_dapm_routes;
aa736700f42fa0 Shengjiu Wang     2021-05-17  893  		for_each_card_prelinks(&data->card, i, link) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  894  			if (link->no_pcm == 1)
aa736700f42fa0 Shengjiu Wang     2021-05-17  895  				link_be = link;
aa736700f42fa0 Shengjiu Wang     2021-05-17  896  		}
aa736700f42fa0 Shengjiu Wang     2021-05-17  897  		for_each_card_prelinks(&data->card, i, link) {
aa736700f42fa0 Shengjiu Wang     2021-05-17  898  			if (link->dynamic == 1 && link_be) {
efa527f984a110 Kuninori Morimoto 2024-10-20  899  				link->playback_only = link_be->playback_only;
efa527f984a110 Kuninori Morimoto 2024-10-20  900  				link->capture_only  = link_be->capture_only;
aa736700f42fa0 Shengjiu Wang     2021-05-17  901  			}
aa736700f42fa0 Shengjiu Wang     2021-05-17  902  		}
aa736700f42fa0 Shengjiu Wang     2021-05-17  903  	}
aa736700f42fa0 Shengjiu Wang     2021-05-17  904  
aa736700f42fa0 Shengjiu Wang     2021-05-17  905  	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
2e6f557ca35aa3 Kuninori Morimoto 2021-12-14  906  	if (ret)
2e6f557ca35aa3 Kuninori Morimoto 2021-12-14  907  		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
aa736700f42fa0 Shengjiu Wang     2021-05-17  908  
aa736700f42fa0 Shengjiu Wang     2021-05-17  909  	return 0;
aa736700f42fa0 Shengjiu Wang     2021-05-17  910  }
aa736700f42fa0 Shengjiu Wang     2021-05-17  911  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

