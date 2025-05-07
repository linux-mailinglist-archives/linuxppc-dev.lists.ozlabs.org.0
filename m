Return-Path: <linuxppc-dev+bounces-8377-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5A8AADD06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 13:11:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zssyw1Phgz2yGf;
	Wed,  7 May 2025 21:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746616296;
	cv=none; b=Ceu8CVvSKwHYAqc6ctG3cZ0ks+Yptg+vfBdUfjZ+KPb0y47OSPeuocC7sH2tv1pcqgTCW/+NGIdpX46FOnWsbOGkaCpz8js7OgChmm+d+pgVqdvPproOd7IojpEdBkj0ineEa5z6N27pMMKBzUN9OqzWAz6DVEhwDQ0AT1Q1wDd/ny2b0VbH9Ef6KvTIzF/qONpHW8dG9fLV1Q8/9+xYkEVIBl/Mw9bJ6nOcLFFp4iF+5E+AKvVwakty0l2dOk3NqPv86ZpxQua1R1n3qh5E3fECDyVhG3BK1PMYTD+samY7DQLAy3NmmbRS3q2xQnFa6Q4ixrifZwfWGpBN/c5Dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746616296; c=relaxed/relaxed;
	bh=QmwL6NmPGBUEhyAmherAQzMmFPMdXU7VMkqUvXogUN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfiOlFspPbhFEqJwiV2X1ZCndhfgAdrAsyhD5EUngDD4cmej1K/oh7XiZWUCdWkgciL6xtno5moKyq1ZZ8UGKz+3jzd74rVWzCfZi+kqEbMqAjMPqXfrY2uE7Flob0ZSlPRT12+eO0fa+b6wkCcp8yzIfNyQIXfS8hM/LBThbCxBJFnsHyL4O248bU4xzDc4FPIo1iqtWqw97f0RHuGt7APOoTxYw/2yMY4F2Dx23d5Zx0SkvjMe1WXGOVh5/zt88IFlAoGhkRjx9xRS2DeSpUyyNvfddkbAFg/zE3Rbk6u9FbWavlhxPVJpfhvNDqlXzVZk3Dy4+7RvPDoSODhI7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JV+Ib/wr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JV+Ib/wr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zssys3vHDz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 21:11:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746616294; x=1778152294;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3GgqcjxuKlszhp/cv+H/LtI3cyOYeCFw3Y5GhFeAWTY=;
  b=JV+Ib/wrpQqUstuvpU1/zpcPEd90Mj63KyjzicI5rzpQ87PT38iaUf86
   aoJt878newbEXqvUlAb1I3K+FaMOIzW+BDRggbt4kaPMknrSUD2zw4hjr
   hpm0InTWpn+bub7VhTAeiy6Ck2ecsOzoRauwe9BlQZhgG7Ll3XRPw2ga1
   8nZ25gKCB+FhJUUmgmx3U0RpuIj5BCcFEkls8ltDEW7+GCCHz05acN2Fs
   e4keVsh7ciNyS+2FCEOX4e2jtJ2f3rJ4GhZa4zdiOIqdtlJQrT5+dmHo1
   yQ2xtkBGNhtg4SZp9VymHChot2j929ytYK8L35a0Q6++Y6/sEzLI9SkaX
   A==;
X-CSE-ConnectionGUID: TR75RgZnQXSAqTm5PHHxbA==
X-CSE-MsgGUID: 4rZ9UilVTLWjG520fpTfbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48475448"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48475448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 04:11:28 -0700
X-CSE-ConnectionGUID: 0q+jlvqwS/6/pjAXeMK9OQ==
X-CSE-MsgGUID: q5SVS9pcT+uWyWADKEfMxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140671940"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 May 2025 04:11:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCcgN-0007er-2i;
	Wed, 07 May 2025 11:11:23 +0000
Date: Wed, 7 May 2025 19:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, npiggin@gmail.com, naveen@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: Re: [PATCH 4/6] powerpc: fix sparse warnings
Message-ID: <202505071806.OPozZjqi-lkp@intel.com>
References: <20250422131040.374427-5-maddy@linux.ibm.com>
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
In-Reply-To: <20250422131040.374427-5-maddy@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes powerpc/topic/ppc-kvm linus/master v6.15-rc5 next-20250507]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-kvm-Fix-sparse-warning/20250422-211309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250422131040.374427-5-maddy%40linux.ibm.com
patch subject: [PATCH 4/6] powerpc: fix sparse warnings
config: powerpc64-randconfig-r053-20250424 (https://download.01.org/0day-ci/archive/20250507/202505071806.OPozZjqi-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071806.OPozZjqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071806.OPozZjqi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/btext.c:43:22: warning: unused variable 'disp_BAT' [-Wunused-variable]
      43 | static unsigned long disp_BAT[2] __initdata = {0, 0};
         |                      ^~~~~~~~
   1 warning generated.


vim +/disp_BAT +43 arch/powerpc/kernel/btext.c

    42	
  > 43	static unsigned long disp_BAT[2] __initdata = {0, 0};
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

