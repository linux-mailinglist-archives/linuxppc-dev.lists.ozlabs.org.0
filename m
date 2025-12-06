Return-Path: <linuxppc-dev+bounces-14670-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 327D1CAA175
	for <lists+linuxppc-dev@lfdr.de>; Sat, 06 Dec 2025 06:31:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNcKS0RMtz2xPL;
	Sat, 06 Dec 2025 16:30:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764999051;
	cv=none; b=FNK5G+x7zT8xYm0fVGOD3oEHfRaq4NjLS1nNJgY0OOsgqDM8kPVzC0bfUoRaMB16JtKVNGzAeb0fx3jM+7/nCyn3mS3jqCXb/eCjER/RPENZvaZH4Ot6C84zpZYXuNC2Z8MPcr4G6ZV0My6ak3TxUQ+CLG7IcL/UglaKDxQtwX3a2ZqmyNzwU10u9REhgaoU4k7Yg6Yx3xYBtf1MqiwvgQqvW+KiP/w8+F0qaq+ezo872ZX+G0IENXL0bg/8yt+E8y93KcE5QS8pCZUZlsOHozzSNO1EOMkm3gH8SLxb0N+2V64jq+EKUe1ql6okWsIqm0OvwqAszmorCCB2Ekratw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764999051; c=relaxed/relaxed;
	bh=m3tK0GPx6twV5ndXXBLl1Kw5rYyx+AVJ8C23noj8Yak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alLXMh2NVgxgfr3KCbZphFKiJJX8leA5FU4CsWGVH133jXGCpKT0FgCYimfMA5HYGYCHBTBNZpAQwSqQ42IoR7EzAX2xl5C0RMq6JU4rFyGKVgofJdmrssFHRu0To5DP2S2GuNDQgXOFh1vpdrmve8H8uxtknlLUsq5e5NJ+6f+TqYPhVNK7riDjjFT/k52GUZsiR11oI4WlAoX5aN5Ax60crFtWf1lkBr9cg6eqfCdot+iBsdQMNLrS9lEcAcjdZDwaBeub0s2vHogxbmls4FxSspaqZFRY4uw3NvKnzZKcCv3xo3PNjZy4/U9if7vA0L25rSSIsoc5pZHztn7Piw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQjtH5md; dkim-atps=neutral; spf=pass (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nQjtH5md;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.21; helo=mgamail.intel.com; envelope-from=lkp@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNcKP0nGMz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 16:30:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764999050; x=1796535050;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lRJ2bi0OZ3a1NFRQAl+mYzWHwAYaRizFgFjHvS49zp0=;
  b=nQjtH5mdekaZd2/2t+KZ69kBNCbgCPKaaUxu4AXSChJAGN7IVJCJYfs0
   Hx7V1zVU4Sve4gt9+43yTfbYHSL5RFJW23T6SmB46N1J6PdUJyQJcC0lY
   jiluJV0BkhSIrJFCunwrcHTIxdBxFlgB8XZRn5t4XPRaJ6S9yt5MwGGq5
   jH7yd+fAXGL9wWHVk8+zyHJ+hKJdHoCXuucbVXrcnczrMnXfCI5o9CbhA
   mgPIQwsFKjnVEevlpsAGk7UjRsyHTwSrm33DzyWVieWNI0m+q12+ZzPc3
   NDNUibISkk8P88E/mH6qmUUPz0btdtz0Mt5NZiRygre6lgC3ucqbyONuj
   A==;
X-CSE-ConnectionGUID: OMoTtbwpQPG9ZahVQqCpIg==
X-CSE-MsgGUID: EBGNzSniTVW7Cq8MGzZ2EQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66965234"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66965234"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:30:45 -0800
X-CSE-ConnectionGUID: +l0rSMMFQK+CUtj89KtVRg==
X-CSE-MsgGUID: wR4GIIU8Ru+EH0RUhMj+EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195538003"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Dec 2025 21:30:40 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRksP-00000000FtJ-3bbE;
	Sat, 06 Dec 2025 05:30:37 +0000
Date: Sat, 6 Dec 2025 13:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Narayana Murty N <nnmlinux@linux.ibm.com>, mahesh@linux.ibm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au,
	christophe.leroy@csgroup.eu, gregkh@linuxfoundation.org,
	oohall@gmail.com, npiggin@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, tyreld@linux.ibm.com,
	vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com,
	sourabhjain@linux.ibm.com
Subject: Re: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation
 helpers
Message-ID: <202512061324.kG0T41Tg-lkp@intel.com>
References: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
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
In-Reply-To: <20251205094510.4671-4-nnmlinux@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Narayana,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes linus/master v6.18 next-20251205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Narayana-Murty-N/powerpc-rtas-Handle-special-return-format-for-RTAS_FN_IBM_OPEN_ERRINJCT/20251205-214855
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20251205094510.4671-4-nnmlinux%40linux.ibm.com
patch subject: [PATCH 3/4] powerpc/pseries: Add RTAS error injection validation helpers
config: powerpc64-randconfig-001-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061324.kG0T41Tg-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061324.kG0T41Tg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061324.kG0T41Tg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/powerpc/platforms/pseries/eeh_pseries.c:906 function parameter '__maybe_unused' not described in 'validate_corrupted_page'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

