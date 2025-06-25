Return-Path: <linuxppc-dev+bounces-9794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8905AE92EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 01:46:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSJNg5Ts4z2xWc;
	Thu, 26 Jun 2025 09:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750895155;
	cv=none; b=NYgY441i0a5y2Q3KQn64UZmuPaDMeOcVvfVTG1i2wTRObbPforRLsm6bo483b69AGrQg4aBpsb/ByPVapLfHe20DszOGg+uzElGmif18yaoQLK561PACV5xnKV21OChe5D2cK3BihJnqIOvYagG6lfgDtmvSOgFFToyZjqgtw0uyYVR7C/9qUnKEvBvhYtvm18+GmO0w96N/B+HQClCvdGk3Ky/U1JYYaM1VvVrJviY7dFmvhp5c5MfZj6aDGKLUnADpyz+/igeSrRvjt6czwk5YDwKWZwx3caEolexNTqPGJA2udeZOLplmgmFbovKHWSFRBFLEC3qPlImcKGTc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750895155; c=relaxed/relaxed;
	bh=+dq8TuDak+P1LRar6OT0gjNUQ3Kr1rxvSB4H4VcGFrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFFONf8tATWiXmyFvZq68RHgglvSl5jTzLq+eBWN7KUaKVVtxEUVoMxHkg12N+55AUJH749WnziSdpyOpVh433S9845U64Pvqqz5JrTs/FyRDKY4pkqX/vKiNDnlw+MZHtleytFOaJkg1oI1g5xGuF0ccTrdtLm6A1UG18d/Mr7KPMcjLeYrhEOjNfBUbQ/An51yLr6hSZnPaqI8H6mhwrXzbfC9qpmkGB20SLWbduXTmY/iPPF8lRroqLTKgPDjN4j8+BHXwyR8gVE+f8C6aR1d2Hvucxb2sDdHvwY3VL87BA2qpNsJTzPbnjkAKYeW5xPrg6LNlSRh3MzRQQ2aXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsHAeW1M; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nsHAeW1M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSJNc3jVWz2xRt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 09:45:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750895152; x=1782431152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J0SwHZlrdzrvFq0FNPdyG6iwaLv8uWkmdSTYCBDuozg=;
  b=nsHAeW1MFWOJ93ZxgmqXkMGHU4+iMc+7SH5dKkqqmETqibCDMLhA137y
   jAe4zK3rq0LlS4JGHIMTBNlytb91ZGeKDOLONqLmUjvrBAW16OFvwkcTf
   wHXQtIZA8lBBA0mSVs+rR1H5J+P1RGAV3N/DS3Aw1dZLdf8toE8FppwfK
   7sHZatGzrK7HeAH+uRmgqcB1Nys9DkQnfQvakRx4DbT+nuAZAZTC3/I/A
   mIbiSlom7h8KOfPfMJeJ9IVJ8UqQ61HHnrm1Jc+JssFWfZHBhgqoReuXR
   iwqooXkBPd41YqLGkzQM+nkSnhjLeNtSKAzcWhZy1VVcSDXGkvzC3yKmn
   w==;
X-CSE-ConnectionGUID: yi8RpYaHTuq/0Y63N6BRlQ==
X-CSE-MsgGUID: L+fQifyyTZKFzEwlUTLQ2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53324987"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="53324987"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:45:47 -0700
X-CSE-ConnectionGUID: fxOEiMDpSraFpXm48RthWg==
X-CSE-MsgGUID: SNN5RbQPQJmxl0RxQFTI1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="152121244"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jun 2025 16:45:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUZoD-000TXm-2R;
	Wed, 25 Jun 2025 23:45:41 +0000
Date: Thu, 26 Jun 2025 07:45:39 +0800
From: kernel test robot <lkp@intel.com>
To: Arun Raghavan <arun@arunraghavan.net>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Pieterjan Camerlynck <p.camerlynck@televic.com>,
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Arun Raghavan <arun@asymptotic.io>
Subject: Re: [PATCH] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
Message-ID: <202506260745.Z7PLEr3i-lkp@intel.com>
References: <20250625130648.201331-1-arun@arunraghavan.net>
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
In-Reply-To: <20250625130648.201331-1-arun@arunraghavan.net>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-Raghavan/ASoC-fsl_sai-Force-a-software-reset-when-starting-in-consumer-mode/20250625-210824
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250625130648.201331-1-arun%40arunraghavan.net
patch subject: [PATCH] ASoC: fsl_sai: Force a software reset when starting in consumer mode
config: arc-randconfig-002-20250626 (https://download.01.org/0day-ci/archive/20250626/202506260745.Z7PLEr3i-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260745.Z7PLEr3i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260745.Z7PLEr3i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   sound/soc/fsl/fsl_sai.c: In function 'fsl_sai_trigger':
>> sound/soc/fsl/fsl_sai.c:848:21: warning: the comparison will always evaluate as 'true' for the address of 'is_consumer_mode' will never be NULL [-Waddress]
     848 |                 if (sai->is_consumer_mode) {
         |                     ^~~
   In file included from sound/soc/fsl/fsl_sai.c:24:
   sound/soc/fsl/fsl_sai.h:287:14: note: 'is_consumer_mode' declared here
     287 |         bool is_consumer_mode[2];
         |              ^~~~~~~~~~~~~~~~


vim +848 sound/soc/fsl/fsl_sai.c

   814	
   815	static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
   816			struct snd_soc_dai *cpu_dai)
   817	{
   818		struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
   819		unsigned int ofs = sai->soc_data->reg_offset;
   820	
   821		bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
   822		int adir = tx ? RX : TX;
   823		int dir = tx ? TX : RX;
   824		u32 xcsr;
   825	
   826		/*
   827		 * Asynchronous mode: Clear SYNC for both Tx and Rx.
   828		 * Rx sync with Tx clocks: Clear SYNC for Tx, set it for Rx.
   829		 * Tx sync with Rx clocks: Clear SYNC for Rx, set it for Tx.
   830		 */
   831		regmap_update_bits(sai->regmap, FSL_SAI_TCR2(ofs), FSL_SAI_CR2_SYNC,
   832				   sai->synchronous[TX] ? FSL_SAI_CR2_SYNC : 0);
   833		regmap_update_bits(sai->regmap, FSL_SAI_RCR2(ofs), FSL_SAI_CR2_SYNC,
   834				   sai->synchronous[RX] ? FSL_SAI_CR2_SYNC : 0);
   835	
   836		/*
   837		 * It is recommended that the transmitter is the last enabled
   838		 * and the first disabled.
   839		 */
   840		switch (cmd) {
   841		case SNDRV_PCM_TRIGGER_START:
   842		case SNDRV_PCM_TRIGGER_RESUME:
   843		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
   844			/*
   845			 * Force a software reset if we are not the clock provider, as we
   846			 * might have lost frame sync during xrun recovery.
   847			 */
 > 848			if (sai->is_consumer_mode) {
   849				regmap_update_bits(sai->regmap,
   850						FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR,
   851						FSL_SAI_CSR_SR);
   852				regmap_update_bits(sai->regmap,
   853						FSL_SAI_xCSR(tx, ofs), FSL_SAI_CSR_SR,
   854						0);
   855			}
   856			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
   857					   FSL_SAI_CSR_FRDE, FSL_SAI_CSR_FRDE);
   858	
   859			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
   860					   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
   861			/*
   862			 * Enable the opposite direction for synchronous mode
   863			 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
   864			 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
   865			 *
   866			 * RM recommends to enable RE after TE for case 1 and to enable
   867			 * TE after RE for case 2, but we here may not always guarantee
   868			 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
   869			 * TE after RE, which is against what RM recommends but should
   870			 * be safe to do, judging by years of testing results.
   871			 */
   872			if (fsl_sai_dir_is_synced(sai, adir))
   873				regmap_update_bits(sai->regmap, FSL_SAI_xCSR((!tx), ofs),
   874						   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
   875	
   876			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
   877					   FSL_SAI_CSR_xIE_MASK, FSL_SAI_FLAGS);
   878			break;
   879		case SNDRV_PCM_TRIGGER_STOP:
   880		case SNDRV_PCM_TRIGGER_SUSPEND:
   881		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
   882			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
   883					   FSL_SAI_CSR_FRDE, 0);
   884			regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
   885					   FSL_SAI_CSR_xIE_MASK, 0);
   886	
   887			/* Check if the opposite FRDE is also disabled */
   888			regmap_read(sai->regmap, FSL_SAI_xCSR(!tx, ofs), &xcsr);
   889	
   890			/*
   891			 * If opposite stream provides clocks for synchronous mode and
   892			 * it is inactive, disable it before disabling the current one
   893			 */
   894			if (fsl_sai_dir_is_synced(sai, adir) && !(xcsr & FSL_SAI_CSR_FRDE))
   895				fsl_sai_config_disable(sai, adir);
   896	
   897			/*
   898			 * Disable current stream if either of:
   899			 * 1. current stream doesn't provide clocks for synchronous mode
   900			 * 2. current stream provides clocks for synchronous mode but no
   901			 *    more stream is active.
   902			 */
   903			if (!fsl_sai_dir_is_synced(sai, dir) || !(xcsr & FSL_SAI_CSR_FRDE))
   904				fsl_sai_config_disable(sai, dir);
   905	
   906			break;
   907		default:
   908			return -EINVAL;
   909		}
   910	
   911		return 0;
   912	}
   913	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

