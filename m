Return-Path: <linuxppc-dev+bounces-8651-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAEBABAEED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 11:21:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0b0k1drFz302b;
	Sun, 18 May 2025 19:21:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747560086;
	cv=none; b=VsfSSh01o3rQReQOrRHxzLWWS0ch/TeVi/RCFA82TUp79zNw3pFYp6cTKNfbAW9IUethe/UfdyXA7lCplRaC05JRJXoJ5AMtKbcGJWz4ppRB+Za/wO7hlobZxDFssvjfwHgZFGYfVU8u+uWCrTQgaHXZ34C3pn3R4ZtGvKwT9PVmyGWW3YhFHFohablBY2ykp5CbNgBA9APgrA+R5Z9Bn/fNySHkPuJ2lIZpar3yG3Zr23M2roRa5KPhxmY1HT1qpitiW5aZGSW5qLSWnRA3Yb1txnzUyyR3yIoNk98ErWZVJ6X69ELvu8VNH9IkOyfbYqNNiZdQ4rhFFYWzL/SBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747560086; c=relaxed/relaxed;
	bh=+cDoCrJ7FtfBploFj5JLg/rmRpgADIxpTRO9/k1tqOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULd8MHfYQjB/gfzhhwofC2yqV3tohtem96k5HyID2BIiNbdyvNezynAaAxaq3xjh8UgJCFJingiCDNOxv+IGohFk+/AL1gONDQMQZEvOdR2bdTJ3Sv4n4svjyLiB7uBalQlqG6IepGPINIELS1quVQywqZQ6dIuLXJ8hCGc+9mx3zpjoL0J+W6sR40LjlnTwOf2epIwR+Jv1qtAhEn5xSALpokOzdQ6nh+mE/n658WvanvUVk+LErO7tULFstMYJAtL1yhLTShpCCsS/nLiU/8hMRM/GjVg1Wy3ntXEIvF/RvhEIdptoAWiyL4ArcG5cK+Ac4m5FPo6A3w67p0wu0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=asaRhXIJ; dkim-atps=neutral; spf=pass (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=asaRhXIJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.10; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0b0g2Z57z2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 19:21:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747560084; x=1779096084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/rpF/UB703SBO2SiRhxkzVTwKc0l0m6a6Hll4eEK5MQ=;
  b=asaRhXIJ3qMFit7yrmNVlUMgGMvYubcPutRASdjqrra9eCF+n2FWnMtV
   SF2yHySDB/UkvgGID1d+hmiGmKBskQ4zUoiVARW7N8LZmuZ+yLteVhiUs
   8/EgiByh79XajvLFyFuuQY6PLBQgh4kTE2tb/P+T1G7F/cXdeQUl5bR96
   mRJXjiIzZIGjaCOZbj7bfclkWqEpZr94skZKom9X10JAvVGj1SNEh596F
   WZlwsCB6x2xFxPXrUKKTGEOb1kuVhu/CFHPw8c0T+7Dl7JhCQamgbZN8n
   eBzwUaqcT5wDO0iTc/SuM7OF4OtsD9pTznY+jnOQJZFkHbF+3nkevbwDg
   A==;
X-CSE-ConnectionGUID: 29EA/Mb6QbqT026jiyzwsA==
X-CSE-MsgGUID: 3fN67yKMR2SDqWv/nBQTeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="66886095"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="66886095"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 02:21:17 -0700
X-CSE-ConnectionGUID: ppNNtQEbTfaqIggFj6VFEw==
X-CSE-MsgGUID: I8cm8OJ2ThajRfZmbuixyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139594353"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 May 2025 02:21:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGaCm-000KiZ-0P;
	Sun, 18 May 2025 09:21:12 +0000
Date: Sun, 18 May 2025 17:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: oe-kbuild-all@lists.linux.dev, naveen@kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/perf: make isa207_pmu_format_group struct
 static
Message-ID: <202505181711.k5ONrdnI-lkp@intel.com>
References: <20250518044107.39928-2-maddy@linux.ibm.com>
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
In-Reply-To: <20250518044107.39928-2-maddy@linux.ibm.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Madhavan,

kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/next]
[also build test ERROR on powerpc/fixes linus/master powerpc/topic/ppc-kvm v6.15-rc6 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Madhavan-Srinivasan/powerpc-perf-make-isa207_pmu_format_group-struct-static/20250518-124244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20250518044107.39928-2-maddy%40linux.ibm.com
patch subject: [PATCH v2 2/4] powerpc/perf: make isa207_pmu_format_group struct static
config: powerpc64-randconfig-002-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181711.k5ONrdnI-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181711.k5ONrdnI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181711.k5ONrdnI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> powerpc64-linux-ld: arch/powerpc/perf/power8-pmu.o:arch/powerpc/perf/power8-pmu.c:199: undefined reference to `isa207_pmu_format_group'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

