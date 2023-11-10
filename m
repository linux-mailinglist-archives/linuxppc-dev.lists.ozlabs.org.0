Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6477E865B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 00:16:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fe3JK7im;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRvpt3Kzhz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Nov 2023 10:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fe3JK7im;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRvp143Sdz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Nov 2023 10:16:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699658169; x=1731194169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dPcMFlaiWQAP/PNdkSWmTyVFd2Uq4xlZs9J5OOdZWs=;
  b=Fe3JK7imfRJmm/oPLQKjwLQcJjLSrExAXpQI3IcVXj8Mk9kAs96Iw73m
   rlrXRgKrvRETcmS4GVtyVVbbmUF5vckytDKBRkRumT4zi0Go2uUw97GcN
   MCyhHccGCo963ZOkpmUxv4NQQNKwYRAGYyJEZpSmxBDhM0g3bV6ew0bNw
   mdOlcFTEOBidB6WrOnrAZ+0dvbpAzC1TOh+4OGxFDJwhFaVb1M7niTSLD
   uHtw1JzYHehi8cyrpRBchfdGBn4kfOOPKrzJ502xeRvpblNtwFStta6ca
   PPRR3HVpFp0RaDjgJtiuSFyOctUN4vhMQqjcL93tiU7CyHa1huolQXWiQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="454543729"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="454543729"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 15:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="1011052062"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="1011052062"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Nov 2023 15:15:56 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ajC-000A0S-1g;
	Fri, 10 Nov 2023 23:15:54 +0000
Date: Sat, 11 Nov 2023 07:14:54 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 12/15] media: uapi: Declare interface types for Audio
Message-ID: <202311110751.SQ7aHnyx-lkp@intel.com>
References: <1699595289-25773-13-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1699595289-25773-13-git-send-email-shengjiu.wang@nxp.com>
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
Cc: oe-kbuild-all@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.6 next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/ASoC-fsl_asrc-define-functions-for-memory-to-memory-usage/20231110-143635
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1699595289-25773-13-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH v9 12/15] media: uapi: Declare interface types for Audio
reproduce: (https://download.01.org/0day-ci/archive/20231111/202311110751.SQ7aHnyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110751.SQ7aHnyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/output/media.h.rst:6: WARNING: undefined label: media-intf-t-v4l-audio (if the link has no caption the label must precede a section header)

vim +6 Documentation/output/media.h.rst

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
